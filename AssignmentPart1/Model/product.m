//
//  product.m
//  AssignmentPart1
//
//  Created by user144335 on 9/25/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "product.h"

@implementation product
//product class constructor with its properties
-(instancetype) initWithname:(NSString*) nameOfProduct andQuantity:(int) quantity andPrice:(double) price{
    if(self)
    {
        self.nameOfProduct= nameOfProduct;
        self.quantity=quantity;
        self.price=price;
        
    }
    return self;
}

@end
