//
//  ViewController.m
//  MVVMDemo
//
//  Created by 薛飞龙 on 2017/2/23.
//  Copyright © 2017年 薛飞龙. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
@interface ViewController ()
@property (strong,nonatomic) ViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupKVO];
}

- (IBAction)postClick:(id)sender {
    
    [self.viewModel postQuestionWithString:_tf.text];
    
    
    
}

#pragma mark - KVO
- (void)setupKVO {
    [self.viewModel addObserver:self forKeyPath:@"recMsg" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
}

- (void)removeKVO {
    [self.viewModel removeObserver:self forKeyPath:@"recMsg"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"recMsg"]) {
        if ([_viewModel.recMsg isEqualToString:@"success"]) {
            _detailLabel.text = [NSString stringWithFormat:@"%@",_viewModel.data];
        }
        else {
            _detailLabel.text = @"error";
        }
    }
}



- (ViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ViewModel alloc]init];
    }
    return _viewModel;
}

- (void)dealloc {
    [self removeKVO];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tf resignFirstResponder];
}

@end
