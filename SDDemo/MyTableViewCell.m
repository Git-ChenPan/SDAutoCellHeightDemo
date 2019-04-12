

//
//  MyTableViewCell.m
//  SDDemo
//
//  Created by ChenPan on 2019/4/11.
//  Copyright © 2019 ChenPan. All rights reserved.
//

#import "MyTableViewCell.h"
#import "SDAutoLayout/SDAutoLayout.h"
@interface MyTableViewCell()

@property (nonatomic , strong) UIView *v1;

@property (nonatomic , strong) UILabel *l2;

@property (nonatomic , strong) UIView *b3;

@end
@implementation MyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.v1 = [[UIView alloc]init];
        self.v1.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.v1];
        
        self.l2 = [[UILabel alloc]init];
        self.l2.numberOfLines = 0;
        self.l2.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.l2];
        
        self.b3 = [[UIView alloc]init];
        self.b3.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.b3];
        
    self.v1.sd_layout.topEqualToView(self.contentView).leftEqualToView(self.contentView).rightEqualToView(self.contentView).heightIs(10);
        
        self.l2.sd_layout.topSpaceToView(self.v1, 10).leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).autoHeightRatio(0);
        
        self.b3.sd_layout.topSpaceToView(self.l2, 10).leftEqualToView(self.contentView).rightEqualToView(self.contentView).heightIs(10);
        
        /**一行代码搞定tableview的cell高度自适应，配合tableView里的cellHeightForIndexPath */
        [self setupAutoHeightWithBottomView:self.b3 bottomMargin:0];
        
    }
    return self;
}
- (void)setMyString:(NSString *)myString {
    _myString = myString;
    self.l2.text = myString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
