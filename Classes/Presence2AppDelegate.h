//
//  Presence1AppDelegate.h
//  Presence1
//
//  Created by Anderson R. Florence on 5/7/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonListTableViewController.h"

@interface Presence2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController * navController ;
	
	UIViewController * rootViewController ;
	
	NSMutableArray * people ;
	
}

@property (nonatomic, retain) IBOutlet UIWindow * window;
@property (nonatomic, retain) NSMutableArray * people ;
@end

