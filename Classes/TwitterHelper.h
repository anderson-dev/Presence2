//
//  TwitterHelper.h
//  Presence
//

#import <Foundation/Foundation.h>

// More methods will be added to this file as the Presence assignments progress.
// We've left it up to you to figure out how to use the return values.
// Try inspecting the dictionary and array contents using NSLog or the debugger.
// Read about Twitter's API at http://apiwiki.twitter.com/
// Read about json-framework at http://code.google.com/p/json-framework

// Define USE_TEST_SERVER as 1 to avoid rate-limiting while developing.
// Define it as 0 (or comment it out) to use real live data from Twitter.
// Read more at http://apiwiki.twitter.com/Rate-limiting
#define USE_TEST_SERVER 0

@interface TwitterHelper : NSObject {

}

// Returns a dictionary with info about the given username.
// This method is synchronous (it will block the calling thread).
+ (NSDictionary *)fetchInfoForUsername:(NSString *)username;

// Returns an array of status updates for the given username.
// This method is synchronous (it will block the calling thread).
+ (NSArray *)fetchTimelineForUsername:(NSString *)username;

@end
