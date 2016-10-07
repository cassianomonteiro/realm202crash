//
//  AppDelegate.h
//  Realm202Crash
//
//  Created by Cassiano Monteiro on 07/10/16.
//  Copyright © 2016 Cassiano. All rights reserved.
//

#import <UIKit/UIKit.h>

// This is a sample of crash with Realm 2.0.2 as reported on
// @link https://github.com/realm/realm-cocoa/issues/4190

// To recriate the crash:
// 1. Run unit tests
// 2. Run the app on Simulator (this issue was run on iPhone 4S with iOS 9.3 Simulator)

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

