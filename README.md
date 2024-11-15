# Custom Tab Bar


The implementation of custom TabBarController based on the implementation of [[jcholuj](https://github.com/jcholuj)](https://github.com/jcholuj/CustomTabBarExample) . Moving between tabs is fully animated, and items are easy to configure or add a new one.
<br><p align="center">
  <img src="CustomTabBar.gif" alt="animated" />
</p><br>

## How to Use

 1. Create your UIViewControllers for each Tab Item.
 2. Use the swift files on the path ***Presentation/ViewController/TabBar***.
 3. Create **CustomTabBarItem** instances on the **CustomTabBarVC** for each Tab Item using its initializer.
 4. Add your created **CustomTabBarItem** objects to the **tabBarTabs** array

> After the above steps you are good to go

### Example Code

```swift
    class CustomTabBarVC: UITabBarController {
	    private let  firstTab = CustomTabBarItem(index: 0,title: "First",
	    icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),
	    selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
	    viewController: FirstVC())
	    
	    private let  secondTab = CustomTabBarItem(index: 0,title: "Second",
	    icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),
	    selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
	    viewController: SecondVC())
	    
	    private let  thirdTab = CustomTabBarItem(index: 0,title: "Third",
	    icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),
	    selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
	    viewController: ThirdVC())
	    
	    private lazy var  tabBarTabs: [CustomTabBarItem] = [firstTab, secondTab, thirdTab]
    }
```
