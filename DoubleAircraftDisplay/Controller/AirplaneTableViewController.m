//
//  AirplaneTableViewController.m
//  DoubleAircraftDisplay
//
//  Created by Peter Yo on 2月/25/16.
//  Copyright © 2016年 Song-Yo Hsu. All rights reserved.
//

#import "AirplaneTableViewController.h"
#import "Airline.h"
#import "Detail2ViewController.h"
#import "CheckAirplaneViewController.h"
#import "AirplainManager.h"

@interface AirplaneTableViewController ()
@property (nonatomic) NSMutableArray<Airline *> *airlines;
@end

@implementation AirplaneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTableView) name:@"updateTableView" object:nil];

    self.tableView.delegate = self;
    AirplainManager *airplainManager = [AirplainManager sharedInstance];
    self.airlines = airplainManager.airlines;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
     
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
    return self.airlines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Airline * airline = [self.airlines objectAtIndex:indexPath.row];
    cell.textLabel.text = [airline tellMeCodename];
    cell.detailTextLabel.text = [airline pilotName];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Airline * airline = [self.airlines objectAtIndex:indexPath.row];
    Detail2ViewController * detail2VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail2ViewController"];
    detail2VC.airline = airline;
    [self.navigationController pushViewController:detail2VC animated:YES];
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
        
        Airline * airplane = [[Airline alloc]init];
        [airplane setCodename:codeName];
        [airplane setPilotName:pilotName];
        [self.airlines addObject:airplane];
        [self.tableView reloadData];
        NSLog(@"目前有%li架客機",self.airlines.count);
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
