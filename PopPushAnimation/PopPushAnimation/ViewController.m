//
//  ViewController.m
//  PopPushAnimation
//
//  Created by 韩李涛 on 2020/11/27.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "PushAnimation.h"
@interface ViewController (){
    PushAnimation *pushAnimation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    pushAnimation= [[PushAnimation alloc]init];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.delegate = pushAnimation;
   // self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
  
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",self.navigationController.delegate);
    SecondViewController *sec = [[SecondViewController alloc]init];
//sec.navigationController.delegate = popAnimation;
    [self.navigationController pushViewController:sec animated:YES];
}

@end
