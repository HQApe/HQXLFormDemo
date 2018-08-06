//
//  TFormTextFeildCell.h
//  HQXLFormDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormBasicCell.h"

@interface TFormTextFeildCell : TFormBasicCell<XLFormReturnKeyProtocol>

@property (nonatomic) NSNumber *textFieldLengthPercentage;
@property (nonatomic) NSNumber *textFieldMaxNumberOfCharacters;

@end
