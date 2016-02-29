#import "AirplainManager.h"

@implementation AirplainManager
- (instancetype)init {
    if (self = [super init]) {
        _airlines = [NSMutableArray array];
        _fighters = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static id shareInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[AirplainManager alloc] init];
    });
    return shareInstance;
}

@end
