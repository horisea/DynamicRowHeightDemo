//
//  ViewController.m
//  最简单的动态行高
//
//  Created by 9188 on 16/7/22.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "ViewController.h"
#import "HUserStatusCell.h"
#import "NSArray+Safe.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy  ) NSArray *arrDataSource;
@property (nonatomic, strong) NSMutableArray *heightArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HUserStatusCell *cell = [HUserStatusCell userStatusCellWithTableView:tableView];
    [cell setCellDataWithStatusName:self.arrDataSource[indexPath.row]];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *cellHeight = [self.heightArray h_safeObjectAtIndex:indexPath.row];
    if (cellHeight) {
        NSLog(@"不用计算，直接返回行高了");
        return [cellHeight floatValue];
    }else{
    NSString *status = self.arrDataSource[indexPath.row];
    CGFloat statusHeight = [HUserStatusCell tableView:tableView rowHeightForObject:status];
    CGFloat iconHeight = 70;
    [self.heightArray addObject:@(statusHeight + iconHeight)];
    NSLog(@"第一次加载计算一次，每次展示都计算一次");
    return statusHeight + iconHeight;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - lazy
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSArray *)arrDataSource{
    if (!_arrDataSource) {
        NSString *string1 = @"这是只是一个菜鸟没事写的小程序，希望能够帮助到您";
        NSString *string2 = @"如很多APP一样，这里的自定义的cell需要5花八门，比如头像昵称是不变的";
        NSString *string3 = @"但是总有变的，比如涉及到社区时，用户的状态，签名等";
        NSString *string4 = @"舅舅来我家，给我们几个小孩发红包，叫我们打开微信，他发红包，他们手机都戳破了最高也就十元。我说我没微信，他在父母的注视下给了我一百，呵呵";
        NSString *string5 = @"图书馆发生的真实一幕：一男一女，应该是情侣，在图书馆开门时往里冲的过程中女生不幸摔倒，男生刚要回去扶起她来，只听女生大喊：“不要管我，去占座！";
        NSString *string6 = @"一个意大利帅比接受采访，说道：“东方女孩子化妆太厉害了！卸完妆完全是另一个人！本以为他要开始吐槽，结果帅比继续兴奋的说：“有一种一次交往两个人的感觉！真的很赚";
        NSString *string7 = @"小明因为自己是个快枪手十分苦恼，在网上看别人说快要射的时候换个姿势就可以延长时间，于是决定约个妹子试试看。当天晚上，“啪”的一声之后，妹子怒道：“你TM的练武术呢？一分钟换二十多个姿势！";
        NSString *string8 = @"小明因为自己是个快枪手十分苦恼，在网上看别人说快要射的时候换个姿势就可以延长时间，于是决定约个妹子试试看。当天晚上，“啪”的一声之后，妹子怒道：“你TM的练武术呢？一分钟换二十多个姿势！";
        NSString *string9 = @"小明因为自己是个快枪手十分苦恼，在网上看别人说快要射的时候换个姿势就可以延长时间，于是决定约个妹子试试看。当天晚上，“啪”的一声之后，妹子怒道：“你TM的练武术呢？一分钟换二十多个姿势！";
        NSString *string10 = @"小明因为自己是个快枪手十分苦恼，在网上看别人说快要射的时候换个姿势就可以延长时间，于是决定约个妹子试试看。当天晚上，“啪”的一声之后，妹子怒道：“你TM的练武术呢？一分钟换二十多个姿势！";
        _arrDataSource = @[string1, string2, string3, string4, string5, string6, string7, string8, string9, string10];
    }
    return _arrDataSource;
}
- (NSMutableArray *)heightArray{
    if (!_heightArray) {
        _heightArray = @[].mutableCopy;
    }
    return _heightArray;
}
@end
