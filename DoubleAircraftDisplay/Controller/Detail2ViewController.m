//
//  Detail2ViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/25/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "Detail2ViewController.h"

@interface Detail2ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *airlineTextField;

@end

@implementation Detail2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.airlineTextField.text = [self.airline tellMeCodename];
    
    self.airlineTextField.delegate = self;

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.airline setCodename:self.airlineTextField.text];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"updateTableView" object:nil];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.airlineTextField resignFirstResponder];
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
