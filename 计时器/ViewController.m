//
//  ViewController.m
//  计时器
//
//  Created by apple on 2018/5/29.
//  Copyright © 2018年 范文哲. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer * timerRepeat;
    int secCount;
}
@property (strong, nonatomic) IBOutlet UIButton *codeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)button:(id)sender {
    if (timerRepeat == nil) {
        
        timerRepeat = [NSTimer scheduledTimerWithTimeInterval: 1.0f
                                                       target: self
                                                     selector: @selector(repeatRefresh:)
                                                     userInfo: nil
                                                      repeats: YES];
        
        secCount = 59;
    }
    [_codeBtn setTitle:@"(60)秒后重发" forState:UIControlStateNormal];
    [_codeBtn setEnabled:NO];
}
- (void) repeatRefresh:(NSTimer *)timer{
    if(secCount==1){
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_codeBtn setEnabled:YES];
        [timerRepeat invalidate];
        timerRepeat = nil;
        return;
    }
    NSString *curstr = [NSString stringWithFormat:@"(%ld)秒后重发", (long)secCount];
    
    [_codeBtn setTitle:curstr forState:UIControlStateNormal];
    secCount--;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
