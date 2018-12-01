//
//  ViewController.m
//  AssignmentPart1
//
//  Created by user144335 on 9/25/18.
//  Copyright © 2018 user144335. All rights reserved.
//
//import all required class
#import "ViewController.h"
#import "Model/product.h"
#import "Model/historyModel.h"
#import "ManagerViewController.h"
#import "Model/store.h"
//delegate and datasource of pickerview
@interface ViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic) product* temp;
@property (nonatomic) historyModel* hisModel;
@property (nonatomic) store* myStore;

@end

@implementation ViewController
//set the flag=yes
bool flag= YES;
int rowNumber;
//lazy loading of store
-(store*) myStore{
    if(_myStore == nil)
    {
        _myStore = [[store alloc]init];
    }
    return _myStore;
    
}
//method for pop up message window to display the message(Alert view method)
- (void)showStatus:(NSString *)message timeout:(double)timeout {
    self.alertView = [[UIAlertView alloc] initWithTitle:nil
                                             message:message
                                            delegate:nil
                                   cancelButtonTitle:nil
                                   otherButtonTitles:nil];
    [self.alertView show];
    [NSTimer scheduledTimerWithTimeInterval:timeout
                                     target:self
                                   selector:@selector(timerExpired:)
                                   userInfo:nil
                                    repeats:NO];
}
//timer set
- (void)timerExpired:(NSTimer *)timer {
    [self.alertView dismissWithClickedButtonIndex:0 animated:YES];
}
//Action for buy button ,when pressed call the buy method from model and calculate the totalprice
- (IBAction)buyPressed {
   int quantity =  self.quantityLabel.text.intValue;
    if(quantity<=self.temp.quantity)//check if the user selected quantity is less than quantity we have it in our stock
    {
        double totalBill = [self.myStore buywithquanity:quantity atIndex:rowNumber];
    self.totalLabel.text = [NSString stringWithFormat:@"%0.2f",totalBill];
    self.quantityLabel.text = @"";// clear the quantity label
    [self.picker reloadAllComponents];// to update the quantity in pickerview
    } else {
        //invoking the Alert view method
        [self showStatus:@"Oops..Out Of Stock!!" timeout:01];
        self.quantityLabel.text = @"";
        
    }
    
}

//button for nos. if two digit then concatenate otherwise display as it is on  quantity label
- (IBAction)buttonPress:(UIButton*)sender {
    //self.quantityLabel.text = sender.currentTitle;
    if(flag){
        self.quantityLabel.text =sender.currentTitle;
        flag = NO;
    }else{
        self.quantityLabel.text = [NSString stringWithFormat:@"%@%@",self.quantityLabel.text, sender.currentTitle];
    }
    
}


//no. of components in picker view
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.myStore.productArray.count;// same as length of product array
}
//set the title for row in pickerview from product array
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    product* P1 = [self.myStore.productArray objectAtIndex:row];
    return [NSString stringWithFormat: @"%@ %d price: %0.2f",P1.nameOfProduct,P1.quantity,P1.price];
}
//to select the row in pickerview with passing parameter "row" and access it from product array and pass the item name to the label
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    rowNumber = (int)row;
    self.temp = [self.myStore.productArray objectAtIndex:row];  self.Label.text=[self.temp.nameOfProduct uppercaseString];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//prepare for seque method to pass the history array and product array from cash register view to manager view
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ManagerViewController* managerVC = segue.destinationViewController;
    managerVC.historyArrayFromVC = self.myStore.historyArray;
    managerVC.productArrayFromVC= self.myStore.productArray;
}
//CASH REGISTER view will appear with reload the components in pickerview when u view back after restock view.
-(void)viewWillAppear:(BOOL)animated
{
    [self.picker reloadAllComponents];
}
@end
