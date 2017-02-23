//
//  ViewModel.h
//  MVVMDemo
//
//  Created by 薛飞龙 on 2017/2/23.
//  Copyright © 2017年 薛飞龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject


@property (nonatomic, strong) NSDictionary * data;
@property (nonatomic, strong) NSString * recMsg;

- (void)postQuestionWithString:(NSString *)question;



@end
