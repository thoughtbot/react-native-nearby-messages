#ifndef RNNearbyMessageManager_h
#define RNNearbyMessageManager_h
#import <GNSMessages.h>


#endif /* RNNearbyMessageManager_h */

@interface RNNearbyMessageManager : NSObject
+(id)shared;
-(void)setApiKey:(NSString *)apiKey;
-(id)createPublicationWithName:(NSString*)name message:(NSString *)message;
-(void)stopPublicationWithName:(NSString*)name;
@end

