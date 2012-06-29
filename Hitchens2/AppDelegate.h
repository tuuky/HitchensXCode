//
//  AppDelegate.h
//  Hitchens2
//
//  Created by Rodrigo Liberal on 6/20/12.
//  Copyright (c) 2012 Kabrea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end
