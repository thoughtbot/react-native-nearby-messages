#import <Foundation/Foundation.h>
#import "RNMessageEventManager.h"

@implementation RNMessageEventManager

+(id)shared {
    static RNMessageEventManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

-(void)sendFoundEventWithMessage:(NSString*) message {
    [self sendEventWithName:@"MessageFound" body:@{@"message": message}];
}

-(void)sendLostEventWithMessage:(NSString*) message {
    [self sendEventWithName:@"MessageLost" body:@{@"message": message}];
}

@end
