//
//  PushAnimation.m
//  PopPushAnimation
//
//  Created by 韩李涛 on 2020/12/1.
//

#import "PushAnimation.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
@interface PushAnimation()
@end
@implementation PushAnimation

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
         UIView *containerView = transitionContext.containerView;//

        UIView *anitionView = [transitionContext viewForKey:UITransitionContextToViewKey];
        [containerView addSubview:anitionView];
        //2.2.2、实现动画的细节
        anitionView.frame = CGRectMake(0,KScreenHeight, KScreenWidth, KScreenHeight);//确定动画视图的起始位置
        
        [UIView animateWithDuration:0.5  animations:^{
         anitionView.frame = CGRectMake(0,0, KScreenWidth, KScreenHeight);////确定动画视图的结束位置位置
        } completion:^(BOOL finished) {
            
            
            [transitionContext completeTransition:YES];//必须告诉系统过渡动画完成了，才可以继续交互。
            
            
            [anitionView removeFromSuperview];//将anitionView从容器View上移除
            
            //2.2.3、添加目标View到容器View上。默认情况下目标View不会被添加到containerView上，需要我们手动添加才可以。
            UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
         
            [containerView addSubview:toView];
        }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5 ;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  API_AVAILABLE(ios(7.0)){

    return self;
}

@end
