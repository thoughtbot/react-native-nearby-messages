#import <Foundation/Foundation.h>
#import <GNSMessages.h>
#import "RNNearbyMessageManager.h"

@implementation RNNearbyMessageManager
GNSMessageManager *messageManager = nil;
NSMutableDictionary *publications = nil;

+(id)shared {
    static RNNearbyMessageManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        publications = [[NSMutableDictionary alloc] init];
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

-(id)createPublicationWithName:(NSString *)name message:(NSString *)message {
    [self checkMessageManger];
    id<GNSPublication> publication = [messageManager publicationWithMessage:[GNSMessage messageWithContent:[message dataUsingEncoding:NSUTF8StringEncoding]]];
    publications[name] = publication;
    return publication;
}

-(void)stopPublicationWithName:(NSString *)name {
    if(publications.allKeys)
    [publications removeObjectForKey:name];
}

-(void)checkMessageManger {
    if(messageManager == nil) {
        @throw [NSException
                exceptionWithName:@"MessageManagerNil"
                reason:@"Message manager was not found"
                userInfo:nil];
    }
}
@end
