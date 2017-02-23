//
//  ViewModel.m
//  MVVMDemo
//
//  Created by 薛飞龙 on 2017/2/23.
//  Copyright © 2017年 薛飞龙. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

#define Weak(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface ViewModel ()

@end

@implementation ViewModel

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)postQuestionWithString:(NSString *)question
{
    Weak(sf);
    
    [Model postQuestion:question
           SuccessBlock:^(NSDictionary *responseObjectDict, NSError *error) {
               sf.data = responseObjectDict;
               sf.recMsg = @"success";
           }
              FailBlock:^(NSDictionary *responseObjectDict, NSError *error) {
                  sf.data = nil;
                  sf.recMsg = @"failure";
              }];

}




@end
