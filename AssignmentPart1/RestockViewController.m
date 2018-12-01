//
//  RestockViewController.m
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "RestockViewController.h"
#import "ManagerViewController.h"
#import "Model/store.h"
#import "Model/product.h"
//delegate and data source of table view controller
@interface RestockViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) store* myStore;
@property (weak, nonatomic) IBOutlet UITableView *restockTableView;
@property (weak, nonatomic) IBOutlet UITextField *restockQuantityTextField;

@end

@implementation RestockViewController
//cancel button to dismiss the keyboard
- (IBAction)cancelPressed
{
    [self.view endEditing:YES];
}
//ok button to update the quantity u selected for product array
- (IBAction)okPressed
{
    int rowNumber = (int)self.restockTableView.indexPathForSelectedRow.row;
    int quantityToUpdate = [self.restockQuantityTextField.text intValue];
    product *p = [self.productArrayfromManagerVC objectAtIndex:rowNumber];
    p.quantity = p.quantity + quantityToUpdate;
    [self.restockTableView reloadData];
    self.restockQuantityTextField.text= @"";
    
}

//no. of section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//no. row in section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return  self.productArrayfromManagerVC.count;
}
// set the cell for row 
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    product *temp = [self.productArrayfromManagerVC objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %d price : %0.2f",temp.nameOfProduct,temp.quantity,temp.price ];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //SET THE NAVIGATION TITLE WHEN SELECTED THE ROW /ITEM AND ITEM SELCTED NAME WILL DISPLAY
    product *p = [self.productArrayfromManagerVC objectAtIndex:indexPath.row];
    [self.navigationItem setTitle:[p.nameOfProduct uppercaseString]];
    
}
- (void)viewDidLoad {
        
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
