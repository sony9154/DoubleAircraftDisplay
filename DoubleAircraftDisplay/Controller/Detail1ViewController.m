//
//  Detail1ViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/21/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "Detail1ViewController.h"

@interface Detail1ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fighterTextField;

@end

@implementation Detail1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fighterTextField.text = [self.fighter tellMeCodename];
    
    self.fighterTextField.delegate = self; //delegate放在viewDidload{}的意義是？為什麼不是放在textFieldShouldReturn這段？
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.fighter setCodename:self.fighterTextField.text];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"updateTableView" object:nil];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.fighterTextField resignFirstResponder];
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
