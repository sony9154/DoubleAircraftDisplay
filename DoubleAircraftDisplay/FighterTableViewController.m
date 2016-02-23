//
//  FighterTableViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/21/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "FighterTableViewController.h"
#import "Detail1ViewController.h"
#import "Fighter.h"
#import "ViewController.h"

@interface FighterTableViewController ()


@end

@implementation FighterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.fightersArray = [[NSMutableArray alloc] init];
    
//    for (int i=0; i<5; i++) {
//        NSString * planeName = [NSString stringWithFormat: @"海燕%i號" , i];
//        Fighter * fighter = [[Fighter alloc]init];
//        [fighter setCodename:planeName];
//        [self.fightersArray addObject:fighter];
//    }
    //NSLog(@"目前有%li架戰機",self.fightersArray.count);

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTableView) name:@"updateTableView" object:nil];
    
    
    self.tableView.delegate = self;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void)updateTableView {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fightersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Fighter * fighter = [self.fightersArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [fighter tellMeCodename];
    cell.detailTextLabel.text = [fighter pilotName];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Fighter * fighter = [self.fightersArray objectAtIndex:indexPath.row];
    Detail1ViewController * detail1VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail1ViewController"];
    detail1VC.fighter = fighter; //這裡的 detail1VC.fighter是跑到Detail1ViewController.h的第15行的*fighter去了嗎？
    [self.navigationController pushViewController:detail1VC animated:YES];
}

- (IBAction)insertPlane:(id)sender {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"飛機資訊" message:@"請填入飛機代碼" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"請在此填入代號"];
    }];
    [alertController addTextFieldWithConfigurationHandler: ^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"請填入飛行員名稱"];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSString * codeName = [[alertController textFields] firstObject].text;
        NSString * pilotName = [[alertController textFields] lastObject].text;
        
        Fighter * fighter = [[Fighter alloc]init];
        [fighter setCodename:codeName];
        [fighter setPilotName:pilotName];
        [self.fightersArray addObject:fighter];
        [self.tableView reloadData];
        //NSLog(@"目前有%li架戰機",self.fightersArray.count);
    }];
    
    
    [alertController addAction:cancel];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"updateTableView" object:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
