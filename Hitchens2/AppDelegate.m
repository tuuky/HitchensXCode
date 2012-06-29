//
//  AppDelegate.m
//  Hitchens2
//
//  Created by Rodrigo Liberal on 6/20/12.
//  Copyright (c) 2012 Kabrea. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@implementation AppDelegate

@synthesize window = _window;
@synthesize locationManager = _locationManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
	self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    NSLog(@"Location Services initialized");
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
		// Stop normal location updates and start significant location change updates for battery efficiency.
		[self.locationManager stopUpdatingLocation];
		[self.locationManager startMonitoringSignificantLocationChanges];
        NSLog(@"SLCM started");
	}
	else {
		NSLog(@"Significant location change monitoring is not available.");
	}
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if ([CLLocationManager locationServicesEnabled]) {
		// Stop significant location updates and start normal location updates again since the app is in the forefront.
		[self.locationManager stopMonitoringSignificantLocationChanges];
		[self.locationManager startUpdatingLocation];
        NSLog(@"Location Services started");
	}
	else {
		NSLog(@"Location Services is not available.");
	}

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Location Manager
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    NSLog(@"Lat:%.4f Long:%.4f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
}

@end
