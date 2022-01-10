# [ios-professional-course-by-jrasmusson](https://www.udemy.com/course/the-swift-arcade-professional-ios-development-course-uikit/)

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
