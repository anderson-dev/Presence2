//
//  Person.m
//  Presence1
//
//  Created by Anderson R. Florence on 5/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize username ;
@synthesize fullName ;
@synthesize statusMessages ;
@synthesize image ;

+ (id) personWithName: (NSString *)aFullName status: (NSArray *)arrayOfStatuses image: (UIImage *)anImage
{
	Person * aPerson = [[[Person alloc] initWithPersonName: aFullName status: arrayOfStatuses image: anImage] autorelease] ;
	
	return aPerson ;
	
}

+ (id) personWithUsername: (NSString *)aUsername
{
	Person * aPerson = [[[Person alloc] initWithUsername: aUsername] autorelease] ;
	
	return aPerson ;
}

+ (NSArray *) personsWithUsernamesInPlist: (NSString *)plistPath
{
	NSMutableArray * people = [NSMutableArray arrayWithCapacity: 3] ;	
	NSArray * usernames = [[[NSArray alloc] initWithContentsOfFile: plistPath] autorelease] ;
	
	if ( !usernames )
	{
		NSLog( @"No usernames or 'TwitterUsers.plist' was not found!" ) ;
		return nil ;
	}
	
	// create people based on usernames and store in 'localPeople' array
	NSLog( @"Contents of 'usernames' array:" ) ;
	for ( NSString * eachString in usernames )
	{
		NSLog( @"%@", eachString ) ;
	}
	
	for ( NSString * eachString in usernames )
	{
		Person * newPerson = [[Person alloc] initWithUsername: eachString] ;
		[people addObject: newPerson] ;
		[newPerson release] ;
	}
	
	// show the contents of the array
	NSLog( @"Contents of 'people' array:" ) ;
	for (Person * eachPerson in people )
	{
		NSLog( @"%@", eachPerson ) ;
	}
	
	return people ;
}

- (id) init
{
	return [self initWithPersonName: @"No Name" status: [NSArray arrayWithObject: @"No Status Available"] image: nil] ;
}

- (id) initWithPersonName: (NSString *)aFullName status: (NSArray *)arrayOfStatuses image: (UIImage *)anImage
{
	if ( self = [super init] )
	{
		self.fullName = aFullName ;
		self.statusMessages = [arrayOfStatuses retain] ;
		self.image = anImage ;
	}
	
	return self ;
}

- (id) initWithUsername: (NSString *)aUsername
{
	// Use Twitter to fetch data
	NSDictionary * retrievedUserInfo = [TwitterHelper fetchInfoForUsername: aUsername] ;
	NSArray * retrievedStatuses = [TwitterHelper fetchTimelineForUsername: aUsername] ;
	NSMutableArray * tempArray = [NSMutableArray arrayWithCapacity: 3] ;
		
	NSString * aFullName = [retrievedUserInfo objectForKey: @"name"] ;
	NSString * anImageURL = [retrievedUserInfo objectForKey: @"profile_image_url"] ;
	imageURL = [NSURL URLWithString: anImageURL] ;
	UIImage * anImage = [UIImage imageWithData: [[NSData alloc] initWithContentsOfURL: imageURL]] ;
	
	int i = 0;
	for ( i; i < [retrievedStatuses count]; i++ )
	{
		//NSLog( @"Status: %@", [[retrievedStatuses objectAtIndex: i] objectForKey: @"text"] ) ;
		[tempArray addObject: [[retrievedStatuses objectAtIndex: i] objectForKey: @"text"]] ;
	}
	
	
	// use designated initializer to return the Person object
	return [self initWithPersonName: aFullName status: tempArray image: anImage] ;
}

- (NSString *) description
{
	return [NSString stringWithFormat: @"\nName = %@\nImageURL = %@\nStatusString = %@", self.fullName, imageURL, [statusMessages objectAtIndex: 0]] ;
}

- (void) dealloc
{
	[statusMessages release] ;
	[fullName release] ;
	[image release] ;
	[super dealloc] ;
}

@end
