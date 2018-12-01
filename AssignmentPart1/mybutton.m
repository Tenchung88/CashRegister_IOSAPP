//
//  mybutton.m
//  AssignmentPart1
//
//  Created by Tenzin Chozom on 27/09/18.
//  Copyright © 2018 user144335. All rights reserved.
//

#import "mybutton.h"

@implementation mybutton
//to create the circle for button
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.clipsToBounds = YES;
}/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
