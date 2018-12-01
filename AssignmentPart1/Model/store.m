//
//  store.m
//  AssignmentPart1
//
//  Created by Tenzin Chozom on 27/09/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "store.h"
#import "product.h"
#import "historyModel.h"
@interface store()
@property (nonatomic) historyModel* hisModel;//creating the object of history class
@end
@implementation store
//lazy loading of product array to instantiate the array
-(NSMutableArray*)productArray
{
    if(_productArray== nil)
    {
        //initializing the product class
        product* p1 = [[product alloc]initWithname:@"shirts" andQuantity:10 andPrice:300.99];
        
        product* p2 = [[product alloc]initWithname:@"pants" andQuantity:15 andPrice:109.99];
        product* p3 = [[product alloc]initWithname:@"shoes" andQuantity:18 andPrice:99.99];
        product* p4 = [[product alloc]initWithname:@"dress" andQuantity:20 andPrice:499.99];
        _productArray = [[NSMutableArray alloc]initWithObjects:p1,p2,p3,p4, nil];
    }
    return _productArray;
}
//lazy loading of history array to instantiate the history array
-(NSMutableArray*)historyArray
{
    if(_historyArray== nil)
    {
        _historyArray=[[NSMutableArray alloc]init];
    }
    return _historyArray;
}
//buy method to calculate the total amount to owe by user
-(double)buywithquanity:(int)quantity atIndex:(int)index
{
    //select the item from product array with parameter "index"
    product * thisItem = [self.productArray objectAtIndex:index];
    double totalPrice=thisItem.price * quantity;
    thisItem.quantity=thisItem.quantity-quantity;
    //intializing the history class' properties
    historyModel *mymodel = [[historyModel alloc]initWithName:thisItem.nameOfProduct andQuantity:(int)quantity andDate:[NSDate date] andTotalAmount:totalPrice];
    //and add the updated history class'properties into historyarray.
    [self.historyArray addObject:mymodel];
    return totalPrice;
    
}

@end
