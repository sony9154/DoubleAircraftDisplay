//
//  MyNavigationController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/23/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "MyNavigationController.h"
#import "ViewController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"目前MyNavigationController.m有%li架戰機", self.vcFightersArray.count);
    // Do any additional setup after loading the view.
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"????"]) {
//        ViewController * viewController = segue.destinationViewController;
//        viewController.vcFightersArray = self.vcFightersArray;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
