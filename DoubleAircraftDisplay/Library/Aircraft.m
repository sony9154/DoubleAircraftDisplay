//
//  Aircraft.m
//  HelloAircraft
//
//  Created by XueXin Tsai on 2016/1/29.
//  Copyright © 2016年 XueXin Tsai. All rights reserved.
//

#import "Aircraft.h"

@implementation Aircraft

+(instancetype)airplane
{
    Aircraft * aircraft = [[Aircraft alloc] init];
    return aircraft;
}

-(void)setCodename:(NSString*)aName
{
    //main.m 會把各個飛機的航班代號傳進來，存到 aName 的區域變數裡
    //此時，請把 aName 保存到 codename 這個全域變數，設定各個飛機的codename
    codename = aName;
}

-(NSString*)tellMeCodename
{
    //將自身的 codename 全域變數吐回去
    return codename;
}

-(void)setManufacturer:(NSString*)name
{
    manufacturer = name;
}

-(NSString*)getManufacturer
{
    return manufacturer;
}

-(void)takeoff
{
//    NSLog(@"%@飛機已經起飛",codename);
    NSLog(@"%@開著%@飛機已經起飛",self.pilotName,codename);
}

-(void)landing
{
    NSLog(@"%@飛機已經降落",codename);
}

@end
