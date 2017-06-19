//
//  TextViewCell.m
//  UITableView_UITextView_AutoLaout
//
//  Created by User01 on 2017/6/19.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import "TextViewCell.h"

@implementation TextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)textViewDidChange:(UITextView *)textView
{
    
    //如果用户一直在输入内容的状态的时候，不改变内容textView的大小 如果有高亮选择的字，就不进行判断。
    UITextRange *selectedRange = [textView  markedTextRange];
    UITextPosition *position =  [textView  positionFromPosition:selectedRange.start offset:0];
    if (position) {
        return;
    }
    //改变UITableView ListArray 的数据
    if ([self.delegate respondsToSelector:@selector(textViewCell:didChangeText:)]) {
        [self.delegate textViewCell:self didChangeText:textView.text];
    }
    
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    textView.bounds = bounds;
    // 让 table view 重新计算高度 如果我们用reloadData方法，键盘会落下
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
