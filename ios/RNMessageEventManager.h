#ifndef RNMessageEventManager_h
#define RNMessageEventManager_h

#if __has_include("RCTEventEmitter.h")
#import "RCTEventEmitter.h"
#else
#import <React/RCTEventEmitter.h>
#endif

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#endif /* RNMessageEventManager_h */

@interface RNMessageEventManager : RCTEventEmitter <RCTBridgeMethod>
+(id)shared;
-(void)sendFoundEventWithMessage:(NSString*) message;
-(void)sendLostEventWithMessage:(NSString*) message;
@end
