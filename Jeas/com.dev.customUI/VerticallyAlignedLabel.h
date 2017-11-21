//
//  VerticallyAlignedLabel.h
//  Jeas
//
//  Created by 邸超 on 2017/3/29.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface VerticallyAlignedLabel : UILabel
{
    @private
    VerticalAlignment verticalAlignment_;
}

@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
