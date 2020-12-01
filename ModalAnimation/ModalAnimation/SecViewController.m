//
//  SecViewController.m
//  ModalPresentAnimation
//
//  Created by 韩李涛 on 2020/11/27.
//

#import "SecViewController.h"
#import "ModalDismissAnimation.h"
@interface SecViewController ()
@property(nonatomic,strong)ModalDismissAnimation *animation;
@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    _animation =[[ModalDismissAnimation alloc]init];
    self.transitioningDelegate = _animation;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
