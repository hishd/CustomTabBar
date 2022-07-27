{\rtf1\ansi\ansicpg1252\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
# Custom Tab Bar\
\
\
The implementation of custom TabBarController based on the implementation of [[jcholuj](https://github.com/jcholuj)](https://github.com/jcholuj/CustomTabBarExample) . Moving between tabs is fully animated, and items are easy to configure or add a new one.\
<br><p align="center">\
  <img src="CustomTabBar.gif" alt="animated" />\
</p><br>\
Custom Tab Bar's items changes are handled using RxSwift. For faster implementation purposes SnapKit has been used for the autolayout part, and RxGesture for handling touch gestures on Tab Bar's items.\
<br><br>\
The implementation has been described in the Medium's article:<br>\
https://medium.com/@jdrzejchouj/how-to-build-an-animated-custom-tab-bar-for-ios-application-5eb3a72e07a8\
\
All libraries are installed using Swift Package Manager.\
\
## How to Use\
\
 1. Create your UIViewControllers for each Tab Item.\
 2. Use the swift files on the path ***Presentation/ViewController/TabBar***.\
 3. Create **CustomTabBarItem** instances on the **CustomTabBarVC** for each Tab Item using its initializer.\
 4. Add your created **CustomTabBarItem** objects to the **tabBarTabs** array\
\
> After the above steps you are good to go\
\
### Example Code\
\
    class CustomTabBarVC: UITabBarController \{\
	    private let  firstTab = CustomTabBarItem(index: 0,title: "First",\
	    icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),\
	    selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),\
	    viewController: FirstVC())\
	    \
	    private let  secondTab = CustomTabBarItem(index: 0,title: "Second",\
	    icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),\
	    selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),\
	    viewController: SecondVC())\
	    \
	    private let  thirdTab = CustomTabBarItem(index: 0,title: "Third",\
	    icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),\
	    selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),\
	    viewController: ThirdVC())\
	    \
	    private lazy var  tabBarTabs: [CustomTabBarItem] = [firstTab, secondTab, thirdTab]\
    \}\
}