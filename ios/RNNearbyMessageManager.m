#import <Foundation/Foundation.h>
#import <GNSMessages.h>
#import "RNNearbyMessageManager.h"
#import "RNMessageEventManager.h"

@implementation RNNearbyMessageManager
GNSMessageManager *messageManager = nil;
NSMutableDictionary *publications = nil;
id<GNSSubscription> subscription = nil;

+(id)shared {
    static RNNearbyMessageManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        publications = [[NSMutableDictionary alloc] init];
    });
    return sharedManager;
}

-(void)setApiKey:(NSString *)apiKey {
    if(apiKey == nil) {
        @throw [NSException
                exceptionWithName:@"ApiKeyNil"
                reason:@"No API key was found"
                userInfo:nil];
    }
    messageManager = [[GNSMessageManager alloc] initWithAPIKey:apiKey];
    subscription = [self createSubscription];
}

-(id)createPublicationWithName:(NSString *)name message:(NSString *)message {
    [self checkMessageManger];
    id<GNSPublication> publication = [messageManager publicationWithMessage:
                                      [GNSMessage messageWithContent:
                                       [message dataUsingEncoding:NSUTF8StringEncoding]]];
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

- (id)createSubscription {
    [self checkMessageManger];
    id<GNSSubscription> subscription = [messageManager
                                        subscriptionWithMessageFoundHandler:^(GNSMessage *message) {
        NSString *messageContent = [[NSString alloc]
                                    initWithData:message.content
                                    encoding:NSUTF8StringEncoding];
        [[RNMessageEventManager shared] sendFoundEventWithMessage:messageContent];
        
    } messageLostHandler:^(GNSMessage *message) {
        NSString *messageContent = [[NSString alloc]
                                    initWithData:message.content
                                    encoding:NSUTF8StringEncoding];
        [[RNMessageEventManager shared] sendLostEventWithMessage:messageContent];
    }];
    return subscription;
}
@end
