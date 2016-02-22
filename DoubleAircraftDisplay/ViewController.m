//
//  ViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/17/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "ViewController.h"
#import "FighterTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalFighterTextLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.fighterAmount intValue];
    //NSLog(@"%li",self.fightersArray.count);
    self.totalFighterTextLabel.text = [NSString stringWithFormat:@"目前有%li架戰機", self.vcFightersArray.count]; //為什麼這裡收不到值???
}//已找到解答,是我vcFightersArray沒初始化

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToFighterTable"]) {
        FighterTableViewController * fighterTVC = segue.destinationViewController;
        //fighterTVC.fightersArray = self.vcFightersArray;
        self.vcFightersArray = fighterTVC.fightersArray;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
