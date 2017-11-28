//
//  DownCell.m
//  Jeas
//
//  Created by 邸超 on 2017/11/24.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "DownCell.h"


@interface DownCell()
{
    
}
@end

@implementation DownCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMpModel:(DownModel *)mpModel {
    _mpModel = mpModel;
    
    self.textLabel.text = _mpModel.msTitle;
    self.detailTextLabel.text = _mpModel.msDate;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self == [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


@end
