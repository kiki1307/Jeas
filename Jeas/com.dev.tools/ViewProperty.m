//
//  ViewProperty.m
//  Jeas
//
//  Created by 邸超 on 2017/3/21.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "ViewProperty.h"
@interface ViewProperty()

@end

@implementation ViewProperty



/**
 第一种:
 - (void)drawRect{} 方法 :
 - 触发条件: 一.view第一次添加到屏幕上
        二.当前调用 setNeedsDisplay 或者 setNeedsDisplayInRect
 
 
 drawRect调用是在Controller->loadView,，Controller->viewDidLoad 两方法之后调用的。所以不用担心在控制器中，这些View的drawRect就开始画了。这样可以在控制器中设置一些值给View(如果这些View draw的时候需要用到某些变量值).
 
 该方法在调用sizeThatFits后被调用，所以可以先调用sizeToFit计算出size。然后系统自动调用drawRect:方法
 
 
 
 第二种:
 layoutSubviews是UIView中的属性方法，即只要继承于UIView
 触发时机：
 1、init初始化不会触发layoutSubviews
 2、addSubview会触发layoutSubviews
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 4、滚动一个UIScrollView会触发layoutSubviews
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 7.[self setNeedsLayout];
 
 注意：调用layoutSubviews，也需要调用它的父类方法，即        
 [super layoutSubviews]
 
 
 总结:
 sizeToFit会自动调用sizeThatFits方法；
 
 sizeToFit不应该在子类中被重写，应该重写sizeThatFits
 
 sizeThatFits传入的参数是receiver当前的size，返回一个适合的size
 
 sizeToFit可以被手动直接调用
 
 sizeToFit和sizeThatFits方法都没有递归，对subviews也不负责，只负责自己
 
 ———————————-
 
 layoutSubviews对subviews重新布局
 
 layoutSubviews方法调用先于drawRect
 
 setNeedsLayout在receiver标上一个需要被重新布局的标记，在系统runloop的下一个周期自动调用layoutSubviews
 
 layoutIfNeeded方法如其名，UIKit会判断该receiver是否需要layout.根据Apple官方文档,layoutIfNeeded方法应该是这样的
 
 layoutIfNeeded遍历的不是superview链，应该是subviews链
 
 drawRect是对receiver的重绘，能获得context
 
 setNeedDisplay在receiver标上一个需要被重新绘图的标记，在下一个draw周期自动重绘，iphone device的刷新频率是60hz，也就是1/60秒后重绘
 
 */
@end
