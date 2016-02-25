//
//  CheckAirplaneViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/25/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "CheckAirplaneViewController.h"
#import "AirplaneTableViewController.h"

@interface CheckAirplaneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalAirplaneLabel;

@end

@implementation CheckAirplaneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    self.totalAirplaneLabel.text = [NSString stringWithFormat:@"目前有%li架客機",self.airplanesArray.count];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToAirplaneTable"]) {
        AirplaneTableViewController * airplaneTVC = segue.destinationViewController;
        airplaneTVC.airplanesArray = self.airplanesArray;
    }
}

- (IBAction)goBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
