//
//  UINavigationController+HVNavigationController.h
//  HVNavigationController
//
//  Created by Hevim on 2017/8/16.
//  Copyright © 2017年 Luo,Hefei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HVNavigationController)


/**
 在viewcontroller 数组中找到第一个属于该类的controller实例，如果没有，则返回nil

 @param class 类名
 @param viewControllers controllers
 @return viewcontroller 找到的实例
 */
- (UIViewController *)getViewControllerWithControllerClassName:(Class)class fromControllers:(NSArray <UIViewController *> *) viewControllers;

/**
 push 导航栈中的viewcontroller 如果栈中没有，就直接push 新的viewcontroller
 
 @param viewController 需要push的viewcontroller
 */
- (void)pushNavigationStackViewController:(UIViewController *)viewController;

/**
 push 导航栈中的viewcontroller 如果栈中没有，就直接push 新的viewcontroller
 
 @param viewControllerClass viewcontroller 的class  会从栈中找到第一个当前类的controller
 */
- (void)pushNavigationStackViewControllerWithControllerClass:(Class)viewControllerClass;

/**
 push viewcontroller  并把navigation viewcontroller栈中的视图控制器 移除掉
 
 @param viewController 需要push 的viewcontroller
 @param fromController 从当前viewconroller 移除栈中的视图控制器  （不包括在内）
 @param endController 移除到当前的viewcontroller结束 （不包含在内）    如果为nil 则移除后面所有的viewcontroller
 */
- (void)pushViewController:(UIViewController *)viewController andPopViewControllersWithFromController:(UIViewController *)fromController endController:(UIViewController *)endController;

/**
 push viewcontroller  并把navigation viewcontroller栈中的视图控制器 移除掉
 
 @param viewController 需要push 的viewcontroller
 @param fromClass 从所属Class的第一个Controller 开始移除栈中的视图控制器  （不包括在内）
 @param endClass 到所属Class的第一个Controllerr 结束 （不包含在内）    如果为nil 则移除后面所有的viewcontroller
 */
- (void)pushViewController:(UIViewController *)viewController andPopViewControllersWithFromClass:(Class)fromClass endClass:(Class)endClass;

@end
