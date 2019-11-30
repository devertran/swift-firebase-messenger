//
//  ChatTabBar.swift
//  mChat
//
//  Created by Vitaliy Paliy on 11/17/19.
//  Copyright © 2019 PALIY. All rights reserved.
//

import UIKit
import Firebase

class ChatTabBar: UITabBarController{
    
    var itemBackgroundView = UIView()
    var contactsImage = UIImage(systemName: "person.fill")
    var chatsImage = UIImage(systemName: "message.fill")
    var settingsImage = UIImage(systemName: "gear")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupVC()
    }
    
    func setupTabBar(){
        tabBar.layer.cornerRadius = 12
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems - 20, height: tabBar.frame.height)
        var yValue: CGFloat = 44
        if tabBarItemSize.height < 50 {
            yValue = 40
        }
        itemBackgroundView = UIView(frame: CGRect(x: tabBarItemSize.width / 2, y: yValue, width: 6, height: 6))
        itemBackgroundView.backgroundColor = .white
        itemBackgroundView.layer.cornerRadius = 3
        itemBackgroundView.alpha = 0
        tabBar.addSubview(itemBackgroundView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let index = -(tabBar.items?.firstIndex(of: tabBar.selectedItem!)?.distance(to: 0))!
        let frame = frameForTabAtIndex(index: index)
        itemBackgroundView.center.x = frame.origin.x + frame.width/2
        itemBackgroundView.alpha = 1
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = -(tabBar.items?.firstIndex(of: item)?.distance(to: 0))!
        let frame = frameForTabAtIndex(index: index)
        let completedFrame = frame.origin.x + frame.width/2
        let icon = tabBar.subviews[index+1].subviews.first as! UIImageView
        itemBackgroundView.transform = CGAffineTransform(scaleX: 0.3, y: 2)
        if icon.image == settingsImage {
            icon.transform = CGAffineTransform(rotationAngle: 2)
        }else if icon.image == contactsImage{
            icon.transform = CGAffineTransform(scaleX: 0.5, y: 1)
        }else{
            icon.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.itemBackgroundView.center.x = completedFrame
            self.itemBackgroundView.alpha = 0.5
            self.itemBackgroundView.transform = .identity
            icon.transform = .identity
        }) { (true) in
            self.itemBackgroundView.alpha = 1
        }
    }
    
    func frameForTabAtIndex(index: Int) -> CGRect {
        var frames = tabBar.subviews.compactMap { (view:UIView) -> CGRect? in
            if let view = view as? UIControl {
                for item in view.subviews {
                    if let image = item as? UIImageView {
                        return image.superview!.convert(image.frame, to: tabBar)
                    }
                }
                return view.frame
            }
            return nil
        }
        frames.sort { $0.origin.x < $1.origin.x }
        if frames.count > index {
            return frames[index]
        }
        return frames.last ?? CGRect.zero
    }
    
    func setupVC(){
        let chats = UINavigationController(rootViewController: ConversationsVC())
        let contacts = UINavigationController(rootViewController: ContactsVC())
        let settings = UINavigationController(rootViewController: SettingsVC())
        let images = [contactsImage, chatsImage, settingsImage]
        let controllers = [contacts, chats, settings]
        
        for c in 0..<controllers.count{
            controllers[c].navigationBar.barTintColor = .white
            controllers[c].tabBarItem.image = images[c]
        }
        viewControllers = controllers
    }
    
}
