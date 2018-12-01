//
//  historyModel.h
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "product.h"

NS_ASSUME_NONNULL_BEGIN
//history class inherits from product class
@interface historyModel : product
@property (nonatomic) NSDate* dateOfPurchase;
@property (nonatomic) double totalAmount;
-(instancetype) initWithName:(NSString*)nameOfProduct andQuantity:(int) quantity andDate:(NSDate*) dateOfPurchase andTotalAmount:(double) totalAmount;
@end

NS_ASSUME_NONNULL_END
