//
//  ModalDismissAnimation.m
//  ModalAnimation
//
//  Created by 韩李涛 on 2020/11/27.
//

#import "ModalDismissAnimation.h"
@interface ModalDismissAnimation()<UIViewControllerAnimatedTransitioning>
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
@end
@implementation ModalDismissAnimation
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = transitionContext.containerView;//
    
    //2.2.1、将即将做动画的视图添加到容器view上
    UIView *anitionView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [containerView addSubview:anitionView];
    
    
    //2.2.2、实现动画的细节
  //  anitionView.frame = CGRectMake(KScreenWidth, 0, KScreenWidth, KScreenHeight);//确定动画视图的起始位置
    
    [UIView animateWithDuration:0.5 animations:^{
     anitionView.frame = CGRectMake(KScreenWidth,0, KScreenWidth, KScreenHeight);////确定动画视图的结束位置位置
    } completion:^(BOOL finished) {
        
        
        [transitionContext completeTransition:YES];//必须告诉系统过渡动画完成了，才可以继续交互。
        
        
        [anitionView removeFromSuperview];//将anitionView从容器View上移除
        
        //2.2.3、添加目标View到容器View上。默认情况下目标View不会被添加到containerView上，需要我们手动添加才可以。
        UIView *toView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
        //UIViewController *vc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        //UIView *toView = vc.view;
     
        [containerView addSubview:toView];
    }];
    
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
@end
