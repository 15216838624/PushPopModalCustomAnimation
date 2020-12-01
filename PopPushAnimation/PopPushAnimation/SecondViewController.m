//
//  SecondViewController.m
//  PopPushAnimation
//
//  Created by 韩李涛 on 2020/11/27.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "POPAnmation.h"
@interface SecondViewController (){
    POPAnmation *popanimation;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
   //
    
    popanimation =[[POPAnmation alloc]init];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = popanimation;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ThreeViewController *threeVc =[[ThreeViewController alloc]init];
     self.navigationController.delegate = nil;
    [self.navigationController pushViewController:threeVc animated:YES];
}

- (void)dealloc{
    NSLog(@"销毁");
}
@end
