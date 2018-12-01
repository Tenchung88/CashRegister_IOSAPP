//
//  store.h
//  AssignmentPart1
//
//  Created by Tenzin Chozom on 27/09/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// store class with product array and history array
@interface store : NSObject
@property (nonatomic) NSMutableArray* productArray;
@property(nonatomic) NSMutableArray* historyArray;
-(double)buywithquanity:(int)quantity atIndex:(int)index;//buy method
@end

NS_ASSUME_NONNULL_END
