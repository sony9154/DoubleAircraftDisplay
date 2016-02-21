//
//  Aircraft.h
//  HelloAircraft
//
//  Created by XueXin Tsai on 2016/1/29.
//  Copyright © 2016年 XueXin Tsai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Aircraft : NSObject
{
    NSString * codename; //全域航班代號
    NSString * manufacturer; //製造商
    // NSString * _pilotName;  //使用 @property 免費得到的隱藏成員變數
}

@property NSString * pilotName;


+(instancetype)airplane;
//使用@property 免費得到的 setter
//-(void)setPilotName:(NSString*)pilotName;

//使用@property 免費得到的 getter
//-(NSString*)pilotName;


//這個方法是讓所有的飛機物件，可以設定自己的航班代號
//setCodename 這個方法是我們自己寫的名稱，你也可以取別的名字
//這個方法代入一個參數，叫做 aName。
-(void)setCodename:(NSString*)aName; //setter
-(NSString*)tellMeCodename; //getter

-(void)setManufacturer:(NSString*)name;
-(NSString*)getManufacturer;


-(void)takeoff; //起飛
-(void)landing; //降落

@end
