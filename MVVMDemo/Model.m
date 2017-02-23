//
//  Model.m
//  MVVMDemo
//
//  Created by 薛飞龙 on 2017/2/23.
//  Copyright © 2017年 薛飞龙. All rights reserved.
//

#import "Model.h"
#import <AFNetworking.h>


@implementation Model

+ (void)postQuestion:(NSString *)question SuccessBlock:(SuccessBlock)success FailBlock:(FailBlock)failure
{
    
    NSDictionary * dict = @{@"data":@{@"questiondesc":question},
                            @"devtype":@"2",
                            @"memberid":@"",
                            @"sig":@"65aaeeb4ecf6d08516de2c9a068cc5fa",
                            @"timestamp":@"1487869000821",
                            @"versionno":@"3.0"};
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://wx.yundongbao.net/toubao/http/member/feedback.json?"
       parameters:dict
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              success(responseObject,nil);
              NSLog(@"success");
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failure(nil,error);
              NSLog(@"failure");
          }];

}

@end

@implementation data

@end
