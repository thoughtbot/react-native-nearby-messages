#import <Foundation/Foundation.h>
#import <GNSMessages.h>
#import "RNNearbyMessageManager.h"

@implementation RNNearbyMessageManager
GNSMessageManager *messageManager = nil;

+(id)shared {
    static RNNearbyMessageManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
//
-(void)setApiKey:(NSString *)apiKey {
    if(apiKey == nil) {
        @throw [NSException
                exceptionWithName:@"ApiKeyNil"
                reason:@"No API key was found"
                userInfo:nil];
    }
    messageManager = [[GNSMessageManager alloc] initWithAPIKey:apiKey];
}

@end
