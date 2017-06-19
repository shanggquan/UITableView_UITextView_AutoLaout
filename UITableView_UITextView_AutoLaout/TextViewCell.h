//
//  TextViewCell.h
//  UITableView_UITextView_AutoLaout
//
//  Created by User01 on 2017/6/19.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TextViewCellDelegate;

@interface TextViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) id<TextViewCellDelegate> delegate;

@end

@protocol TextViewCellDelegate <NSObject>

- (void)textViewCell:(TextViewCell *)cell didChangeText:(NSString *)text;

@end

