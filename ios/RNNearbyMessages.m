
#import "RNNearbyMessages.h"
#import "RNNearbyMessageManager.h"

@implementation RNNearbyMessages

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(printMessage:(NSString*)message)
{
    NSLog(@"%@", message);
}

RCT_EXPORT_METHOD(setApiKey:(NSString*)apiKey) {
    [[RNNearbyMessageManager shared] setApiKey:apiKey];
}

RCT_EXPORT_METHOD(createPublication:(NSString*)name message:(NSString*)message) {
    [[RNNearbyMessageManager shared] createPublication:name message:message];
}

RCT_EXPORT_METHOD(stopPublication:(NSString*)name) {
    [[RNNearbyMessageManager shared] stopPublicationWithName:name];
}

@end
  
