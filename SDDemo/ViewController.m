//
//  ViewController.m
//  SDDemo
//
//  Created by ChenPan on 2019/4/11.
//  Copyright © 2019 ChenPan. All rights reserved.
//


#import "ViewController.h"
#import "SDAutoLayout/SDAutoLayout.h"
#import "MyTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.myString = self.array[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     /**一行代码（一步设置）搞定tableview的cell高度自适应  配合cell里的setupAutoHeightWithBottomView */
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:tableView.width_sd tableView:tableView];
}

- (NSArray *)array {
    if (!_array) {
        _array = @[
                       @"自你离开以后, 从此就丢了温柔.等待在这雪山路漫长, 听寒风呼啸依旧.一眼望不到边, 风似刀割我的脸.等不到西海天际蔚蓝, 无言着苍茫的高原.还记得你答应过我不会让我把你找不见,可你跟随那南归的候鸟飞得那么远.爱象风筝断了线,等待高原冰雪融化之后归来的孤雁.爱再难以续情缘, 回不到我们的从前",
                       @"从此也不用分开相爱的天和地还能在冬雨天空月亮太阳再想你生命中只要有你，什么都变得可以让所有流星随时都相遇从此在人世上也没有无奈的分离我不用睁着眼睛看你远走的背影没有变幻的清纯，没有失落的爱情所有承诺永恒得像星星……",
                       @"爱是一生一世一次一次的轮回不管在东南和西北爱是一段一段一丝一丝的是非教有情人再不能够说再会爱是一朵六月天飘下来的雪花还没结果已经枯萎爱是一滴擦不干烧不完的眼泪还没凝固已经成灰等到情丝吐尽它才出现那一回等到红尘残碎它才让人双宿双飞",
                       @"斑驳的夜色在说什么谁能告诉我如何选择每当我想起分离时刻悲伤就逆流成河你给的温暖属于谁呢谁又会在乎我是谁呢每当我想起你的选择悲伤就逆流成河"
                       ];
        
    }
    return _array;
}
@end
