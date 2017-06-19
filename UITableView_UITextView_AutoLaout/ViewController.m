//
//  ViewController.m
//  UITableView_UITextView_AutoLaout
//
//  Created by User01 on 2017/6/19.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import "ViewController.h"
#import "TextViewCell.h"
@interface ViewController ()<TextViewCellDelegate>{
    NSMutableArray * dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自动行高
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //row数据
    dataArray = [NSMutableArray array];
    for (int i = 0 ; i<100 ; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"TextView%d",i]];
    }
    
}

#pragma mark tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextViewCell" forIndexPath:indexPath];
    [cell.textView setText:[dataArray objectAtIndex:indexPath.row]];
    [cell setDelegate:self];
    return cell;
}
#pragma mark update dataArray
- (void)textViewCell:(TextViewCell *)cell didChangeText:(NSString *)text
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableArray *data = [dataArray mutableCopy];
    data[indexPath.row] = text;
    dataArray = [data copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
