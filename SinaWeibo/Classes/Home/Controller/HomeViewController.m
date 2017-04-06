//
//  HomeViewController.m
//  SinaWeibo
//
//  Created by user on 15/10/13.
//  Copyright © 2015年 ZT. All rights reserved.
//

#import "HomeViewController.h"
#import "HWTest1ViewController.h"
#import "ZTDropdownMenu.h"
#import "HWTitleMenuViewController.h"
#import "ZTTitleButton.h"

@interface HomeViewController () <ZTDropdownMenuDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingNavigationItem];
    [self settingTitleButton];
}

- (void)settingNavigationItem
{
    // 设置barButtonItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTargat:self action:@selector(friendsearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTargat:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
}

/**
 *  设置标题按钮
 */
- (void)settingTitleButton
{
//    // 中间的标题按钮
//    UIButton *titleButton = [[UIButton alloc] init];
//    titleButton.size = CGSizeMake(150, 30);
//    
//    // 设置图片和文字
//    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
//    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    titleButton.titleLabel.font = [UIFont systemFontOfSize:17];
//    
//    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
//    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
//    
//    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.titleView = titleButton;
    ZTTitleButton *titleButton = [[ZTTitleButton alloc] init];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
}

/**
 *  标题点击
 */
- (void)titleClick:(UIButton *)titleButton
{
    // 1.创建下拉菜单
    ZTDropdownMenu *menu = [ZTDropdownMenu menu];
    menu.delegate = self;
    
    // 2.设置内容
    HWTitleMenuViewController *menuVc = [[HWTitleMenuViewController alloc] init];
    menuVc.view.width = 200;
    menuVc.view.height = 200;
    menu.contentController = menuVc;
    
    // 3.显示
    [menu showFrom:titleButton];
}

- (void)friendsearch
{
    NSLog(@"friendsearch");
}

- (void)pop
{
    NSLog(@"pop");
}

#pragma mark - ZTDropdownMenuDelegate
- (void)dropdownMenuDidShow:(ZTDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = YES;
}

- (void)dropdownMenuDidDismiss:(ZTDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"homeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row:%ld", (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWTest1ViewController *test1 = [[HWTest1ViewController alloc] init];
    test1.title = @"test1";
    test1.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:test1 animated:YES];
}


@end
