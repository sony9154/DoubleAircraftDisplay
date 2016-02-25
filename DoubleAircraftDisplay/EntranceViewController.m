//
//  BothAircraftViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/22/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "EntranceViewController.h"
#import "CheckFighterViewController.h"
#import "CheckAirplaneViewController.h"
#import "MyNavigationController-1.h"
#import "MyNavigationController-2.h"
#import "Fighter.h"
#import "Airline.h"

@interface BothAircraftViewController ()
@property (nonatomic,strong) NSMutableArray * fightersArray;
@property (nonatomic,strong) NSMutableArray * airplanesArray;
@property (weak, nonatomic) IBOutlet UILabel *bothAircraftLabel;

@end

@implementation BothAircraftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fightersArray = [NSMutableArray new];
    self.airplanesArray = [NSMutableArray new];
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.bothAircraftLabel.text = [NSString stringWithFormat:@"總共有%li架飛機", (self.fightersArray.count + self.airplanesArray.count)];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToNavigationController1"]) {
        
        MyNavigationController * myNavigationController1 = segue.destinationViewController;
        ((ViewController *)myNavigationController1.viewControllers[0]).fightersArray = self.fightersArray;//viewControllers的類型是UIViewController,因為fightersArray是寫在ViewController下,所以要轉型成ViewController.
    }else if([segue.identifier isEqualToString:@"segueToNavigationController2"]){
        
        MyNavigationController_2 * myNavigationController2 = segue.destinationViewController;
        ((CheckAirplaneViewController *)myNavigationController2.viewControllers[0]).airplanesArray = self.airplanesArray;
    }
}


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
