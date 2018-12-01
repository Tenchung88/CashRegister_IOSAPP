//
//  ManagerViewController.m
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "ManagerViewController.h"
#import "HistoryTableViewController.h"
#import "RestockViewController.h"
@interface ManagerViewController ()
@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

}


#pragma mark - Navigation


//prepare for seque method to set the identification of seque to transition into restock view or history view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"historysegue"])
    {
    HistoryTableViewController* historyVC = segue.destinationViewController;
    historyVC.historyArrayFromManagerVC = self.historyArrayFromVC;
    }
    else if([segue.identifier isEqualToString:@"restocksegue"])
    {
        RestockViewController *RVC = segue.destinationViewController;
        RVC.productArrayfromManagerVC = self.productArrayFromVC;
    }
}

@end
