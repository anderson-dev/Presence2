//
//  PersonListViewController.m
//  Presence1
//
//  Created by Anderson R. Florence on 5/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonListViewController.h"


@implementation PersonListViewController

- (void) viewDidLoad
{
	[super viewDidLoad] ;
	self.title = @"People" ;
	
	// TODO: Testing dynamic people creation
	[self importPeople] ;
	
	// update view with resulting model
	[self updateView] ;
}

- (void) importPeople
{
	people = [[NSMutableArray alloc] initWithCapacity: 3] ;
	//NSMutableArray * localPeople = [[NSMutableArray arrayWithCapacity: 3] retain] ;
	
	NSString * plistPath = [[NSBundle mainBundle] pathForResource: @"TwitterUsers" ofType: @"plist"] ;
	NSLog( @"Path of 'TwitterUsers.plist' = %@", plistPath ) ;
	NSArray * usernames = [[NSArray alloc] initWithContentsOfFile: plistPath] ;
	
	if ( !usernames )
	{
		NSLog( @"No usernames or 'TwitterUsers.plist' was not found!" ) ;
		return ;
	}
	
	// create people based on usernames and store in 'localPeople' array
	NSLog( @"Contents of 'usernames' array:" ) ;
	for ( NSString * eachString in usernames )
	{
		NSLog( @"%@", eachString ) ;
		Person * newPerson = [[Person alloc] initWithUsername: eachString] ;
		//[localPeople addObject: newPerson] ;
		[people addObject: newPerson] ;
		[newPerson release] ;
	}
	
	[usernames release] ;
	
	// iterate over the array and verify that it contains all the people from 'TwitterUsers.plist'
	//NSLog( @"Contents of 'localPeople' array:" ) ;
//	for (NSString * eachString in localPeople )
//	{
//		NSLog( @"%@", eachString ) ;
//	}
	
	NSLog( @"Contents of 'people' array:" ) ;
	for (Person * eachPerson in people )
	{
		NSLog( @"%@", eachPerson ) ;
	}
	
	
	//[localPeople release] ;
}

- (void) updateView
{
	nameLabelForSteveJobs.text = [[people objectAtIndex: 0] fullName] ;
	nameLabelForSteveWozniak.text = [[people objectAtIndex: 1] fullName] ;
	nameLabelForBillGates.text = [[people objectAtIndex: 2] fullName] ;
	//nameLabelForSteveBallmer.text = [[people objectAtIndex: 3] fullName] ;
	
	imageOfSteveJobs.image = [[people objectAtIndex: 0] image] ;
	imageOfSteveWozniak.image = [[people objectAtIndex: 1] image] ;
	imageOfBillGates.image = [[people objectAtIndex: 2] image] ;
	//imageOfSteveBallmer.image = [[people objectAtIndex: 3] image] ;
}

- (IBAction) viewDetails: (id) sender
{
	// get the person based on the sender's tag
	Person * thePersonClicked = [people objectAtIndex: [sender tag]] ;
	// load the detail view
	UIViewController * detailViewController = [PersonDetailViewController viewControllerWithPerson: thePersonClicked] ;
	[self.navigationController pushViewController: detailViewController animated: YES] ;
}

- (void)dealloc
{
	[people release] ;
    [super dealloc];
}


@end
