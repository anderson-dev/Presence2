//
//  Presence2AppDelegate.m
//  Presence2
//
//  Created by Anderson R. Florence on 5/7/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Presence2AppDelegate.h"

@implementation Presence2AppDelegate

@synthesize window ;
@synthesize people ;

- (id) init
{
	if ( self = [super init] )
	{
		navController = [[UINavigationController alloc] init] ;
		rootViewController = [[PersonListTableViewController alloc] init] ;
	}
	
	return self ;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	// Override point for customization after application launch
	[window makeKeyAndVisible];
	[window addSubview: navController.view] ;
	
	// push first view controller
	[navController pushViewController: rootViewController animated: NO] ;
	[rootViewController release] ;
}

- (NSMutableArray *) people
{
	if ( people != nil )
	{
		return people ;
	}
	else {
		people = [[NSMutableArray alloc] initWithCapacity: 3] ;
		return people ;
	}

}

- (void)dealloc
{
	[navController release] ;
    [window release];
    [super dealloc];
}


@end
