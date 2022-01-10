# [ios-professional-course-by-jrasmusson(WIP)](https://www.udemy.com/course/the-swift-arcade-professional-ios-development-course-uikit/)
<table border="0">
    <tr>
        <tr>
            <th>Login Loading Image</th>
        </tr>
        <td><img src="https://github.com/YamamotoDesu/ios-professional-course-by-jrasmusson/blob/main/Bankey/Gif/loginImage.gif" width="300"></td>
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

## Other
### Set a dividerView 
<img width="1133" src="https://user-images.githubusercontent.com/47273077/148717660-fec83219-0ab0-4074-af74-d4255f0dd2c8.png">

### Set an indicator in UIButton
<img width="1042" src="https://user-images.githubusercontent.com/47273077/148739221-4e965441-6baa-4d87-a822-800110cd17d1.png">




