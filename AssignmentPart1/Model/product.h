//
//  product.h
//  AssignmentPart1
//
//  Created by user144335 on 9/25/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface product : NSObject

@property NSString *nameOfProduct;
@property int quantity;
@property double price;

-(instancetype) initWithname:(NSString*) nameOfProduct andQuantity:(int) quantity andPrice:(double) price;

@end

NS_ASSUME_NONNULL_END
