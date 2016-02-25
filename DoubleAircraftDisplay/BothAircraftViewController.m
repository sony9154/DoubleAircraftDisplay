//
//  BothAircraftViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/22/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "BothAircraftViewController.h"
#import "ViewController.h"
#import "MyNavigationController.h"

@interface BothAircraftViewController ()
@property (nonatomic,strong) NSMutableArray * totalAircraftArray;
@property (weak, nonatomic) IBOutlet UILabel *bothAircraftLabel;

@end

@implementation BothAircraftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.totalAircraftArray = [[NSMutableArray alloc]init];
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.bothAircraftLabel.text = [NSString stringWithFormat:@"總共有%li架飛機", self.totalAircraftArray.count];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToViewController"]) {
        
        MyNavigationController * myNavigationController = segue.destinationViewController;
        ((ViewController *)myNavigationController.viewControllers[0]).vcFightersArray = self.totalAircraftArray;//viewControllers的類型是UIViewController,因為vcFightersArray是寫在ViewController下,所以要轉型成ViewController.
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
