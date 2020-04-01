//
//  UILabel+ELKAddDeleteLine.m
//  ELKNTBaseConfig
//
//  Created by wx on 2019/5/5.
//  Copyright © 2019 elk. All rights reserved.
//

#import "UILabel+ELKAddDeleteLine.h"

@implementation UILabel (ELKAddDeleteLine)


/**
 ** 为label添加删除线
 */
+ (UILabel*)deleteLineLabel:(UILabel*)label
{
    if (label.text.length==0||label.text==NULL||label.text==nil||[label.text isEqualToString:@""]) return label;
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:label.text
                                                                                  attributes:attribtDic];
    // 赋值
    label.attributedText = attribtStr;
    return label;
}





@end
