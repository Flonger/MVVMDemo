//
//  Model.h
//  MVVMDemo
//
//  Created by 薛飞龙 on 2017/2/23.
//  Copyright © 2017年 薛飞龙. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSDictionary *responseObjectDict,NSError *error);
typedef void (^FailBlock)(NSDictionary *responseObjectDict,NSError *error);

@class data;
@interface Model : NSObject

@property (nonatomic, strong) data * data;
@property (nonatomic, copy) NSString * resDesc;
@property (nonatomic, assign) NSInteger resCode;

+ (void)postQuestion:(NSString *)question SuccessBlock :(SuccessBlock)success FailBlock :(FailBlock)failure;


@end


@interface data : NSObject
@property (nonatomic, copy) NSString * createDate;
@property (nonatomic, copy) NSString * fbtime;
@property (nonatomic, copy) NSString * idd;
@property (nonatomic, copy) NSString * memberid;
@property (nonatomic, copy) NSString * questiondesc;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString * updateDate;



@end
