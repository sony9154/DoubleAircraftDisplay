//
//  Detail1ViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/21/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "Detail1ViewController.h"

@interface Detail1ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fighterTextField;

@end

@implementation Detail1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fighterTextField.text = [self.fighter tellMeCodename];
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
