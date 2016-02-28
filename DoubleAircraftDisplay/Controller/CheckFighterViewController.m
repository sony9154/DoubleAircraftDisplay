//
//  ViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/17/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "CheckFighterViewController.h"
#import "AirplainManager.h"

@interface CheckFighterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalFighterTextLabel;
@end

@implementation CheckFighterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    AirplainManager *airplainManager = [AirplainManager sharedInstance];
    self.totalFighterTextLabel.text = [NSString stringWithFormat:@"目前有%li架戰機", airplainManager.fighters.count];
}

- (IBAction)goBackButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
