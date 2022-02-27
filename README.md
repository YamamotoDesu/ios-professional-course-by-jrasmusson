# [ios-professional-course-by-jrasmusson(WIP)](https://www.udemy.com/course/the-swift-arcade-professional-ios-development-course-uikit/)
<table>
  <tr>
    <td valign="top"><img width="300" src="https://github.com/YamamotoDesu/ios-professional-course-by-jrasmusson/blob/main/Bankey/Gif/loginImage.gif"/></td>
    <td valign="top"><img width="300"  src="https://github.com/YamamotoDesu/ios-professional-course-by-jrasmusson/blob/main/Bankey/Gif/shakey-button.gif"/></td>
  </tr>
</table>
<table border="0">
    <tr>
        <tr>
            <th>Onboarding View</th>
        </tr>
        <td>
<img width="446" src="https://user-images.githubusercontent.com/47273077/153743335-f69bcf6a-ef28-4871-aa0a-028fb08570db.png"></td>
    </tr>
   <tr>
        <tr>
            <th>Table View</th>
        </tr>
        <td><img width="490" src="https://user-images.githubusercontent.com/47273077/155867782-6181c2a6-bf9d-4071-9892-6bb61c577f27.png">
</td>
    </tr>
</table>

## Create a new project without storyboards 
1. Delete SceneDelegate and delete Main.storyboard 

2. Remove a reference to storyboards 
<img width="1144" src="https://user-images.githubusercontent.com/47273077/148708101-0edf1491-fbf7-4b15-bdd0-30589298f6d0.png">

<img width="1149" src="https://user-images.githubusercontent.com/47273077/148708171-669fec4a-1ea2-40ee-a965-9955e18741ac.png">

3. Update AppDelegate 
<img width="856" alt="Bankey_—_AppDelegate_swift_—_Edited" src="https://user-images.githubusercontent.com/47273077/148708324-f7558748-14f6-4386-a67c-b7cc37e50c89.png">

Update by... 
```swift 
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = ViewController()
        
        return true
    }

}
```


## Set Vector img
### Check perserve vector data
<img width="830" alt="preserve-vector" src="https://user-images.githubusercontent.com/47273077/149035681-e6a7fbe8-2d73-4663-9e3e-0a0e61b7fab3.png">

### Set scales as Single Scale
<img width="886" alt="set-scales" src="https://user-images.githubusercontent.com/47273077/149035763-d2ef632c-8d2b-4b1f-9d3a-26a881491f76.png">

## Other
### Set a dividerView 
<img width="1133" src="https://user-images.githubusercontent.com/47273077/148717660-fec83219-0ab0-4074-af74-d4255f0dd2c8.png">

### Set an indicator in UIButton
<img width="1042" src="https://user-images.githubusercontent.com/47273077/148739221-4e965441-6baa-4d87-a822-800110cd17d1.png">

### Set a nib file
1. Create UIView file
2. Create View with the same name
3. Set a size as Freeform
<img width="913" src="https://user-images.githubusercontent.com/47273077/149650606-bd8c6ae1-7ef3-4276-a00c-53f94dda4ad2.png">
4. Set a height
<img width="1019" src="https://user-images.githubusercontent.com/47273077/149650623-163792c0-19ed-4ce0-a733-f8160867c414.png">
5. Associate a cutom class with the created one
<img width="995" src="https://user-images.githubusercontent.com/47273077/149650650-190ef473-44d5-4679-969c-b8c99289f1ff.png">
6. Outlet the view
<img width="1085" src="https://user-images.githubusercontent.com/47273077/149650695-9f38915c-a2fc-485f-9490-66118f185105.png">
 

