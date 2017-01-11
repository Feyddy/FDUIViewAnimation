//
//  ViewController.m
//  FDUIViewAnimation
//
//  Created by 徐忠林 on 11/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

/*
 UIView动画实质上是对CoreAnimation的封装，提供简洁的动画接口。
 */



/*
 1）动画的开始和结束方法
 
 1.1 动画开始标记
 
 [UIView beginAnimations:(nullable NSString *) context:(nullable void *)];
 第一个参数：动画标识
 第二个参数：附加参数，在设置了代理的情况下，此参数将发送到setAnimationWillStartSelector和setAnimationDidStopSelector所指定的方法。大部分情况下，我们设置为nil即可。
 
 1.2 结束动画标记
 
 [UIView commitAnimations];
 2）动画参数的设置方法
 
 //动画持续时间
 [UIView setAnimationDuration:(NSTimeInterval)];
 //动画的代理对象
 [UIView setAnimationDelegate:(nullable id)];
 //设置动画将开始时代理对象执行的SEL
 [UIView setAnimationWillStartSelector:(nullable SEL)];
 //设置动画结束时代理对象执行的SEL
 [UIView setAnimationDidStopSelector:(nullable SEL)];
 //设置动画延迟执行的时间
 [UIView setAnimationDelay:(NSTimeInterval)];
 //设置动画的重复次数
 [UIView setAnimationRepeatCount:(float)];
 //设置动画的曲线
 [UIView setAnimationCurve:(UIViewAnimationCurve)];
 UIViewAnimationCurve的枚举值如下：
 UIViewAnimationCurveEaseInOut,         // 慢进慢出（默认值）
 UIViewAnimationCurveEaseIn,            // 慢进
 UIViewAnimationCurveEaseOut,           // 慢出
 UIViewAnimationCurveLinear             // 匀速
 //设置是否从当前状态开始播放动画
 [UIView setAnimationBeginsFromCurrentState:YES];
 假设上一个动画正在播放，且尚未播放完毕，我们将要进行一个新的动画：
 当为YES时：动画将从上一个动画所在的状态开始播放
 当为NO时：动画将从上一个动画所指定的最终状态开始播放（此时上一个动画马上结束）
 //设置动画是否继续执行相反的动画
 [UIView setAnimationRepeatAutoreverses:(BOOL)];
 //是否禁用动画效果（对象属性依然会被改变，只是没有动画效果）
 [UIView setAnimationsEnabled:(BOOL)];
 //设置视图的过渡效果
 [UIView setAnimationTransition:(UIViewAnimationTransition) forView:(nonnull UIView *) cache:(BOOL)];
 第一个参数：UIViewAnimationTransition的枚举值如下
 UIViewAnimationTransitionNone,              //不使用动画
 UIViewAnimationTransitionFlipFromLeft,      //从左向右旋转翻页
 UIViewAnimationTransitionFlipFromRight,     //从右向左旋转翻页
 UIViewAnimationTransitionCurlUp,            //从下往上卷曲翻页
 UIViewAnimationTransitionCurlDown,          //从上往下卷曲翻页
 第二个参数：需要过渡效果的View
 第三个参数：是否使用视图缓存，YES：视图在开始和结束时渲染一次；NO：视图在每一帧都渲染

 */


#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *centerShow;
@property (nonatomic,strong) UIView *cartCenter;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    
//    //大小变化（frame）
//    [self frameAnimation];
//    
//    //拉伸变化（bounds）
//    [self boundsAnimation];
//    
//    //中心位置(center)
//    [self centerAnimation];
//    
//    //旋转(transform)
//    [self transformAnimation];
//    
//    //透明度(alpha)
//    [self alphaAnimation];
//    
//    //背景颜色(backgroundColor)
//    [self backgroundColorAnimation];
//    
//    //拉伸内容(contentStretch)
//    [self contentStretchAnimation];
//
//    //转场动画
//    [self Transition];
    
    
//    UIView Block动画
    //1、
    [UIView animateWithDuration:.5 animations:^{
        
    }];
    
    //2、
    [UIView animateWithDuration:.5 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    //3、
    [UIView animateWithDuration:.5 delay:.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    /*
     UIViewAnimationOptions的枚举值如下，可组合使用：
     
     UIViewAnimationOptionLayoutSubviews            //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction      //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState     //从当前状态开始动画
     UIViewAnimationOptionRepeat                    //无限重复执行动画
     UIViewAnimationOptionAutoreverse               //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedCurve    //忽略嵌套动画的曲线设置
     UIViewAnimationOptionAllowAnimatedContent      //转场：进行动画时重绘视图
     UIViewAnimationOptionShowHideTransitionViews   //转场：移除（添加和移除图层的）动画效果
     UIViewAnimationOptionOverrideInheritedOptions  //不继承父动画设置
     
     UIViewAnimationOptionCurveEaseInOut            //时间曲线，慢进慢出（默认值）
     UIViewAnimationOptionCurveEaseIn               //时间曲线，慢进
     UIViewAnimationOptionCurveEaseOut              //时间曲线，慢出
     UIViewAnimationOptionCurveLinear               //时间曲线，匀速
     
     UIViewAnimationOptionTransitionNone            //转场，不使用动画
     UIViewAnimationOptionTransitionFlipFromLeft    //转场，从左向右旋转翻页
     UIViewAnimationOptionTransitionFlipFromRight   //转场，从右向左旋转翻页
     UIViewAnimationOptionTransitionCurlUp          //转场，下往上卷曲翻页
     UIViewAnimationOptionTransitionCurlDown        //转场，从上往下卷曲翻页
     UIViewAnimationOptionTransitionCrossDissolve   //转场，交叉消失和出现
     UIViewAnimationOptionTransitionFlipFromTop     //转场，从上向下旋转翻页
     UIViewAnimationOptionTransitionFlipFromBottom  //转场，从下向上旋转翻页
     */

//   Spring动画,弹簧效果
    
//    [UIView animateWithDuration:(NSTimeInterval)//动画持续时间
//                          delay:(NSTimeInterval)//动画延迟执行的时间
//         usingSpringWithDamping:(CGFloat)//震动效果，范围0~1，数值越小震动效果越明显
//          initialSpringVelocity:(CGFloat)//初始速度，数值越大初始速度越快
//                        options:(UIViewAnimationOptions)//动画的过渡效果
//                     animations:^{
//                         //执行的动画
//                     }
//                     completion:^(BOOL finished) {
//                         //动画执行完毕后的操作
//                     }];
    
    
    
//    Keyframes动画
    
//    [UIView animateKeyframesWithDuration:(NSTimeInterval)//动画持续时间
//                                   delay:(NSTimeInterval)//动画延迟执行的时间
//                                 options:(UIViewKeyframeAnimationOptions)//动画的过渡效果
//                              animations:^{
//                                  //执行的关键帧动画
//                              }
//                              completion:^(BOOL finished) {
//                                  //动画执行完毕后的操作
//                              }];
    
    /*
     UIViewAnimationOptionLayoutSubviews           //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction     //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState    //从当前状态开始动画
     UIViewAnimationOptionRepeat                   //无限重复执行动画
     UIViewAnimationOptionAutoreverse              //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedOptions //不继承父动画设置
     
     UIViewKeyframeAnimationOptionCalculationModeLinear     //运算模式 :连续
     UIViewKeyframeAnimationOptionCalculationModeDiscrete   //运算模式 :离散
     UIViewKeyframeAnimationOptionCalculationModePaced      //运算模式 :均匀执行
     UIViewKeyframeAnimationOptionCalculationModeCubic      //运算模式 :平滑
     UIViewKeyframeAnimationOptionCalculationModeCubicPaced //运算模式 :平滑均匀
     */
    
    
    //demo
    [UIView animateKeyframesWithDuration:9.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.9475 green:0.1921 blue:0.1746 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.1064 green:0.6052 blue:0.0334 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:2.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.1366 green:0.3017 blue:0.8411 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.centerShow.backgroundColor = [UIColor colorWithRed:0.619 green:0.037 blue:0.6719 alpha:1.0];
        }];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
    
    
//    增加关键帧的方法：
//    
//    [UIView addKeyframeWithRelativeStartTime:(double)//动画开始的时间（占总时间的比例）
//                            relativeDuration:(double) //动画持续时间（占总时间的比例）
//                                  animations:^{
//                                      //执行的动画
//                                  }];
    
    
    
    
//    6、转场动画

/*    从旧视图转到新视图的动画效果:在该动画过程中，fromView 会从父视图中移除，并讲 toView 添加到父视图中，注意转场动画的作用对象是父视图（过渡效果体现在父视图上）。
    调用该方法相当于执行下面两句代码：
    
    [fromView.superview addSubview:toView];
    [fromView removeFromSuperview];
*/
//    [UIView transitionFromView:(nonnull UIView *)
//                        toView:(nonnull UIView *)
//                      duration:(NSTimeInterval)
//                       options:(UIViewAnimationOptions)
//                    completion:^(BOOL finished) {
//                        //动画执行完毕后的操作
//                    }];
    
    
    
//    6.2 单个视图的过渡效果
//    [UIView transitionWithView:(nonnull UIView *)
//                      duration:(NSTimeInterval)
//                       options:(UIViewAnimationOptions)
//                    animations:^{
//                        //执行的动画
//                    }
//                    completion:^(BOOL finished) {
//                        //动画执行完毕后的操作
//                    }];
    

}

- (void)setupUI {
    self.centerShow = [[UIView alloc] initWithFrame:CGRectMake(50, 80, 200, 70)];
    self.centerShow.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.centerShow];
    
    
    
    self.cartCenter = [[UIView alloc] initWithFrame:CGRectMake(20, 150, 200, 70)];
    self.cartCenter.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.cartCenter];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 250, 200, 70)];
    self.imageView.image=[UIImage imageNamed:@"0.JPG"];
    [self.view addSubview:self.imageView];
}

#pragma mark - 大小变化frame
- (void)frameAnimation {
    
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.cartCenter.frame = self.centerShow.frame;
    [UIView commitAnimations];
    
    
}

- (void)startAni:(NSString *)aniID {
    NSLog(@"%@ start",aniID);
}

- (void)stopAni:(NSString *)aniID {
    NSLog(@"%@ stop",aniID);
}

#pragma mark - 拉伸变化bounds
- (void)boundsAnimation {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.cartCenter.bounds = self.centerShow.bounds;
    [UIView commitAnimations];
}

#pragma mark - 中心位置center
- (void)centerAnimation {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.cartCenter.center = self.view.center;
    [UIView commitAnimations];
}

#pragma mark - 旋转transform
- (void)transformAnimation {
    //旋转(顺时针)
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    
//    BOOL isSingle = seg.selectedSegmentIndex;
    //如果单次 直接翻转到原始状态 如果连续 在以前基础上再次进行反转
//    CGAffineTransform transform = isSingle?CGAffineTransformInvert(bigImage.transform):CGAffineTransformIdentity;
    
    //反转（逆时针）
    CGAffineTransform transforms = CGAffineTransformInvert(transform);
    
    
    //位移
    CGAffineTransform transformss = CGAffineTransformMakeTranslation(100, 10);
    
    
    //缩放
    CGAffineTransform transformsss = CGAffineTransformMakeScale(1.0, 2.1);
    
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.centerShow.transform = transformsss;
    [UIView commitAnimations];
    
}

#pragma mark - 透明度alpha
- (void)alphaAnimation {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.cartCenter.alpha = .5;
    [UIView commitAnimations];
}

#pragma mark - 背景颜色backgroundColor
- (void)backgroundColorAnimation {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.centerShow.backgroundColor = [UIColor redColor];
    [UIView commitAnimations];
}

#pragma mark - 拉伸内容contentStretch
/*
 新建一个 UIImageView:
 
 UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grid.png"]];
 保存它的一些属性值备用
 
 CGSize imageSize;
 imageSize.width = imageView.frame.size.width;
 imageSize.height = imageView.frame.size.height;
 
 CGSize stretchSize;
 stretchSize.width = 50.0;
 stretchSize.height = 100.0;
 水平拉伸
 
 设置 contentStretch 属性(一般为 0.0 到 1.0之间):
 
 imageView.contentStretch = CGRectMake(0.0, 0.0, stretchSize.width/imageSize.width, stretchSize.height/imageSize.height);
 
 
 水平拉伸:
 
 imageView.frame = CGRectMake(10.0, 10.0, imageSize.width*1.2, imageSize.height);
 
 
 这时拉伸的区域如下：
 
 
 
 垂直拉伸
 
 使用同样的 contentStretch, 图片被垂直拉伸:
 
 imageView.frame = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height*1.2);
 
 
 这时拉伸的区域如下：
 
 
 
 两个方向同时拉伸：
 
 使用下面的 contentStretch值:
 
 imageView.contentStretch = CGRectMake(100.0/imageSize.width, 100.0/imageSize.height, stretchSize.width/imageSize.width, stretchSize.height/imageSize.height);
 
 
 水平和垂直同时拉伸:
 
 imageView.frame = CGRectMake(0.0, 0.0, 450.0, 450.0);
 */
- (void)contentStretchAnimation {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGSize imageSize;
    imageSize.width = self.imageView.frame.size.width;
    imageSize.height = self.imageView.frame.size.height;
    
    CGSize stretchSize;
    stretchSize.width = 50.0;
    stretchSize.height = 100.0;
    self.imageView.contentStretch = CGRectMake(0.0, 0.0, stretchSize.width/imageSize.width, stretchSize.height/imageSize.height);
    [UIView commitAnimations];
}

#pragma mark - 转场动画
- (void)Transition {
    [UIView beginAnimations:@"FlipAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.imageView cache:YES];
    self.imageView.image = [UIImage imageNamed:@"0.JPG"];
    [UIView commitAnimations];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
