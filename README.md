{\rtf1\ansi\ansicpg1252\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
# Custom Tab Bar\
\
\
The implementation of custom TabBarController. Moving between tabs is fully animated, and items are easy to configure or add a new one.\
<br><p align="center">\
  <img src="CustomTabBar.gif" alt="animated" />\
</p><br>\
Custom Tab Bar's items changes are handled using RxSwift. For faster implementation purposes SnapKit has been used for the autolayout part, and RxGesture for handling touch gestures on Tab Bar's items.\
<br><br>\
The implementation has been described in the Medium's article:<br>\
https://medium.com/@jdrzejchouj/how-to-build-an-animated-custom-tab-bar-for-ios-application-5eb3a72e07a8\
\
## Libraries\
\
- RxSwift\
- RxGesture\
- SnapKit\
\
All libraries are installed using Swift Package Manager.\
\
## License\
\
MIT}