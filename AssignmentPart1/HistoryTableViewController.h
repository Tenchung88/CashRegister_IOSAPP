//
//  HistoryTableViewController.h
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HistoryTableViewController : UITableViewController
@property (nonatomic,strong)NSMutableArray* historyArrayFromManagerVC;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UILabel *infodetaillabel;
@property (weak, nonatomic) IBOutlet UILabel *itemlabel;
@property (weak, nonatomic) IBOutlet UILabel *quantitylabel;
@property (weak, nonatomic) IBOutlet UILabel *totallabel;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;

@end

NS_ASSUME_NONNULL_END
