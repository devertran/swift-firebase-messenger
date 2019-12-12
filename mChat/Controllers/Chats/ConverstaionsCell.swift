//
//  ConversationsVC.swift
//  mChat
//
//  Created by Vitaliy Paliy on 11/21/19.
//  Copyright © 2019 PALIY. All rights reserved.
//

import UIKit

class ConversationsCell: UITableViewCell {
    
    var profileImage = UIImageView()
    var friendName = UILabel()
    var recentMessage = UILabel()
    var timeLabel = UILabel()
    var isOnlineView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(profileImage)
        addSubview(friendName)
        addSubview(recentMessage)
        addSubview(timeLabel)
        addSubview(isOnlineView)
        setupImage()
        setupNameLabel()
        setupEmailLabel()
        setupTimeLabel()
        setupIsOnlineImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIsOnlineImage(){
        isOnlineView.isHidden = true
        isOnlineView.layer.cornerRadius = 8
        isOnlineView.layer.borderColor = UIColor.white.cgColor
        isOnlineView.layer.borderWidth = 2.5
        isOnlineView.layer.masksToBounds = true
        isOnlineView.backgroundColor = UIColor(displayP3Red: 116/255, green: 195/255, blue: 168/255, alpha: 1)
        isOnlineView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            isOnlineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            isOnlineView.widthAnchor.constraint(equalToConstant: 16),
            isOnlineView.heightAnchor.constraint(equalToConstant: 16),
            isOnlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupImage(){
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupEmailLabel(){
        recentMessage.textColor = .lightGray
        recentMessage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            recentMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor, constant: 0),
            recentMessage.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            recentMessage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupTimeLabel(){
        timeLabel.textAlignment = .left
        timeLabel.numberOfLines = 0
        timeLabel.textColor = .lightGray
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupNameLabel(){
        friendName.textColor = .black
        friendName.numberOfLines = 0
        friendName.adjustsFontSizeToFitWidth = true
        friendName.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            friendName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            friendName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
