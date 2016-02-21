//
//  Fighter.m
//  HelloAircraft
//
//  Created by XueXin Tsai on 2016/1/29.
//  Copyright © 2016年 XueXin Tsai. All rights reserved.
//

#import "Fighter.h"

@implementation Fighter

-(void)takeoff
{
    [super takeoff];
    NSLog(@"%@開著%@戰鬥機已經起飛",self.pilotName,codename);
}

-(void)fight
{
    NSLog(@"發射了飛彈");
}
@end
