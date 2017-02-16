//
//  HUserStatusCell.m
//  最简单的动态行高
//
//  Created by 9188 on 16/7/22.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "HUserStatusCell.h"
#import "NSString+StringSize.h"

@interface HUserStatusCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *statusLabel;


@end

@implementation HUserStatusCell
#pragma mark - init
+ (instancetype)userStatusCellWithTableView:(UITableView *)tableView{
    static NSString *cellidentifier = @"SCYImageViewCell";
    HUserStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell) {
        cell = [[HUserStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nickNameLabel];
        [self.contentView addSubview:self.statusLabel];
    }
    return self;
}
#pragma mark - public
- (void)setCellDataWithStatusName:(NSString *)status{
    self.statusLabel.text = status;
    self.nickNameLabel.text = @"小海原创";
    self.iconImageView.image = [UIImage imageNamed:@"zth"];
}
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    CGFloat statusLabelWidth = [UIScreen mainScreen].bounds.size.width - 60;
    // 字符串分类提供方法，计算字符串的高度
    CGSize statusLabelSize =[object sizeWithLabelWidth:statusLabelWidth font:[UIFont systemFontOfSize:17]];
    return statusLabelSize.height;
}

#pragma mark - private
- (void)layoutSubviews{
    [super layoutSubviews];
    self.iconImageView.frame = CGRectMake(10, 10, 40, 40);
    self.nickNameLabel.frame = CGRectMake(60, 20, 100, 20);
    CGFloat statusLabelWidth = self.frame.size.width - 60; // 限制宽度
    // 根据实际内容，返回高度，
    CGSize statusLabelSize = [self.statusLabel.text sizeWithLabelWidth:statusLabelWidth font:[UIFont systemFontOfSize:15]];
    self.statusLabel.frame = CGRectMake(60, 60, self.frame.size.width - 60, statusLabelSize.height);
}

#pragma mark - lazy

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.layer.masksToBounds = YES;
//        _iconImageView.layer.borderWidth = 0.5;
//        _iconImageView.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _iconImageView;
}

- (UILabel *)nickNameLabel{
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.textColor = [UIColor cyanColor];
//        _nickNameLabel.layer.borderWidth = 0.5;
//        _nickNameLabel.layer.borderColor = [UIColor redColor].CGColor;

    }
    return _nickNameLabel;
}
- (UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.font = [UIFont systemFontOfSize:15];
        _statusLabel.textAlignment = NSTextAlignmentLeft;
        _statusLabel.numberOfLines = 0;
//        _statusLabel.textColor = [UIColor cyanColor];
//        _statusLabel.layer.borderWidth = 0.5;
//        _statusLabel.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _statusLabel;
}

@end
