//
//  ViewController.m
//  ModalPresentAnimation
//
//  Created by 韩李涛 on 2020/11/27.
//

#import "ViewController.h"
#import "SecViewController.h"
#import "ModalPresentAnimation.h"
@interface ViewController ()
@property(nonatomic,strong)ModalPresentAnimation *animation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    _animation = [[ModalPresentAnimation alloc]init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecViewController *sec = [[SecViewController alloc]init];
    sec.transitioningDelegate = _animation;
    
    sec.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:sec animated:YES completion:nil];
}


@end
