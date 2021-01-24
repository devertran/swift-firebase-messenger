<img src="https://imgur.com/BsGWh9S.png" align="center">

### General
**```mChat```** is a real-time messaging app written in Swift for iOS devices. Since mChat uses a fast and reliable [Firebase Database](https://firebase.google.com/docs/database), it receives data instantly, which makes a messaging process better among its users. Moreover, it uses a [Mapbox API](https://www.mapbox.com/) that provides different styles of the map, making it an unforgettable experience for users. The app design is inspired by Telegram Messenger.


<img src="art/welcomeView.gif" height="600" align="left"> <img src="art/contactsAnim.gif" height="600" align="right">
<img src="art/tabBarAnim.gif" height="600" align="center">

<img src="art/chats.png" height="600" align="left"> <img src="art/chat1.png" height="600" align="right"> <img src="art/map.png" height="600" align="center">

### Requirements
- Xcode version 11.2.1+
- Swift 5
- iPhone 8 or higher
- iOS 13.0+

### Functionality
- Real-time chat
- User online indicator
- Sending text messages
- Unlimited length of text messages
- Sending image messages
- Sending video messages
- Sending audio messages
- Typing indicator
- Messages status indicator
- Delete messages
- Reply to / Forward messages
- Custom chat design
- Chat pagination
- Friend network
- Locate friends on a map (if they have disabled an anonymous mode)
- Custom map design
- Change email / password
- Change profile image

### How to install?
1. Install [CocoaPods](https://guides.cocoapods.org/using/getting-started.html)
2. Open Terminal and run ```pod install``` directly in ```mChat/Messenger``` folder.
3. In order for Firebase to work, create a [new project](https://console.firebase.google.com/u/0/) for your application.
4. Download ```GoogleService-Info.plist``` from your newly created Firebase project and replace it with the old one. [screenshot](https://imgur.com/D4aBcEx)
5. Enable [Email/Password authentication method](https://firebase.google.com/docs/auth/web/password-auth)
6. Create [Realtime Database](https://firebase.google.com/docs/database/ios/start)
7. Set Realtime Database rules to:
```
{
  "rules": {
     ".read": true,
     ".write": true     
  }
}
```
8. Enable your Firebase [Storage](https://firebase.google.com/docs/storage)
9. For using Mapbox, create a [new token](https://account.mapbox.com/)
10. Create a new key named ```MGLMapboxAccessToken``` in your ```Info.plist``` and insert access token as a value. [More Info](https://docs.mapbox.com/help/how-mapbox-works/access-tokens/#how-access-tokens-work)

<img src="art/add_friend.png" height = "600" align="right"> <img src="art/contacts.png" height = "600" align="center"> <img src="art/friend_requests.png" height = "600" align="left">

### New Updates:
Update 1.4:
- Bug fixes

### Credits
- [Firebase](https://firebase.google.com/)
- [Mapbox](https://www.mapbox.com/)
- [Lottie](https://github.com/airbnb/lottie-ios)
- [SkyFloatingLabelTextField](https://github.com/Skyscanner/SkyFloatingLabelTextField)
- [IGColorPicker](https://github.com/iGenius-Srl/IGColorPicker)

<img src="https://imgur.com/4ucO5bq.png" height = "600" align="right"> <img src="https://imgur.com/oy8oL76.png" height = "600" align="center"> <img src="https://imgur.com/e9vEqFv.png" height = "600" align="left">