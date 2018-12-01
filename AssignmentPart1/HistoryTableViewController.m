//
//  HistoryTableViewController.m
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "Model/product.h"
#import "Model/historyModel.h"


@interface HistoryTableViewController ()
@property (nonatomic) historyModel* hismodel1;

@end

@implementation HistoryTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   //self.tableView= self.historyArrayFromManagerVC;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source
//no. of section in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
//no. of rows in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.historyArrayFromManagerVC.count;
}

//display the cell for row in table view controller
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell with identifier for reusuability
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //checking at history array which passed from manager view with at indexpath.row
    historyModel* historyObj = [self.historyArrayFromManagerVC objectAtIndex:indexPath.row];
    
    cell.textLabel.text = historyObj.nameOfProduct;//set the cell.textlabel to selected index of historyarray of its name of product
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",historyObj.quantity];//set the quantity which is int so convert to string
    return cell;
}
//when select the cell from table view controller then pop up the UIview
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailView.hidden = NO;
    historyModel *mymodel = [self.historyArrayFromManagerVC objectAtIndex:indexPath.row];
  self.itemlabel.text= mymodel.nameOfProduct;
    self.quantitylabel.text= [NSString stringWithFormat:@"%d",mymodel.quantity];
    self.totallabel.text =[NSString stringWithFormat: @"%0.2f",mymodel.totalAmount];
    self.datelabel.text = [NSString stringWithFormat: @"%@",mymodel.dateOfPurchase];
    [self animatedetailView];
   // UIAlertController *message = [UIAlertController alloc]nitWithItem: historyModel. message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
   
   
}
//set the UIview(which shows the detail info. of selected cell of table view controller) of its frame and duration
-(void)animatedetailView
{
    [UIView animateWithDuration:0.5 animations:^{
        _detailView.frame= CGRectMake(0, 0, 320, 518);}];
}
//action for back button to return back to the table view 
-(IBAction)backbutton:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        _detailView.frame= CGRectMake(320, 0, 320, 518);}];
    
}/*
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
}=
*/


/*#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString* datatodisplay= self.
}*/


@end
