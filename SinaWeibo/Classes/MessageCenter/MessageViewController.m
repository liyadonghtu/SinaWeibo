//
//  MessageViewController.m
//  SinaWeibo
//
//  Created by user on 15/10/13.
//  Copyright © 2015年 ZT. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // style参数用来设置item北京的，在iOS7之前效果比较明显，iOS7之后没有任何效果
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(composeMsg)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /*
    // item的disable效果要在控件完全渲染完成后才能有效（即主题必须加载完成才有效），所以我们要先提前设置navigationBar在view加载前设置好主题
    self.navigationItem.rightBarButtonItem.enabled = NO;
     */
}

- (void)composeMsg
{
    NSLog(@"composeMsg");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
