//
//  ManagerViewController.h
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ManagerViewController : UIViewController
//to store the history array and product array passed from VIew controller through segue
@property (nonatomic,strong)NSMutableArray *historyArrayFromVC;
@property (nonatomic) NSMutableArray *productArrayFromVC;
@end

NS_ASSUME_NONNULL_END
