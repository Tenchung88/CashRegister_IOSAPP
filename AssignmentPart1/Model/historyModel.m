//
//  historyModel.m
//  AssignmentPart1
//
//  Created by user144335 on 9/26/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "historyModel.h"
#import "product.h"

@interface historyModel()

@property (nonatomic) product* productObj;
@end

@implementation historyModel
//history class constructor with its super(Product class)properties and its additional properties i.e. date of purchase and total amount
-(instancetype) initWithName:(NSString*)nameOfProduct andQuantity:(int) quantity andDate:(NSDate*) dateOfPurchase andTotalAmount:(double) totalAmount{
    if(self)
    {
        self = [self initWithname:nameOfProduct andQuantity:(quantity) andPrice:0.0];
        self.dateOfPurchase = dateOfPurchase;
        self.totalAmount = totalAmount;
    }
    return self;
}
@end
