//
//  ViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/17/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "CheckFighterViewController.h"
#import "FighterTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalFighterTextLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    self.totalFighterTextLabel.text = [NSString stringWithFormat:@"目前有%li架戰機", self.fightersArray.count];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToFighterTable"]) {
        FighterTableViewController * fighterTVC = segue.destinationViewController;
        fighterTVC.fightersArray = self.fightersArray;

    }
}

- (IBAction)goBackButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
