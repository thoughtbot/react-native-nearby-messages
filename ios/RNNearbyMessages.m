
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

@end
  
