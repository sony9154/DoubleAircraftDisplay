#import <Foundation/Foundation.h>
#import "Airline.h"
#import "Fighter.h"

@interface AirplainManager : NSObject
@property (nonatomic) NSMutableArray<Airline *> *airlines;
@property (nonatomic) NSMutableArray<Fighter *> *fighters;
+ (instancetype)sharedInstance;
@end
