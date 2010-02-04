//
//  Person.h
//  Presence1
//
//  Created by Anderson R. Florence on 5/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterHelper.h"


@interface Person : NSObject {

	NSString * username, * fullName ;
	NSArray * statusMessages ;
	UIImage * image ;
	
	NSURL * imageURL ;
}

@property (copy) NSString * username ;
@property (copy) NSString * fullName ;
@property (retain) NSArray * statusMessages ;
@property (retain) UIImage * image ;

+ (id) personWithName: (NSString *)aFullName status: (NSArray *)arrayOfStatuses image: (UIImage *)anImage ;

+ (id) personWithUsername: (NSString *)aUsername ;

+ (NSArray *) personsWithUsernamesInPlist: (NSString *)plistPath ;

- (id) initWithPersonName: (NSString *)aFullName status: (NSArray *)arrayOfStatuses image: (UIImage *)anImage ;

- (id) initWithUsername: (NSString *)aUsername ;

@end
