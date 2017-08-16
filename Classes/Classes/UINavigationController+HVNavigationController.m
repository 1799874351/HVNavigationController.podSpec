//
//  UINavigationController+HVNavigationController.m
//  HVNavigationController
//
//  Created by Hevim on 2017/8/16.
//  Copyright © 2017年 Luo,Hefei. All rights reserved.
//

#import "UINavigationController+HVNavigationController.h"

@implementation UINavigationController (HVNavigationController)

- (UIViewController *)getViewControllerWithControllerClassName:(Class)class fromControllers:(NSArray <UIViewController *> *) viewControllers{
    if (!class) {
        return nil;
    }
    for (UIViewController *item in viewControllers) {
        if ([item isMemberOfClass:class]) {
            return item;
        }
    }
    return nil;
}

- (void)pushNavigationStackViewController:(UIViewController *)viewController{
    if (!viewController) {
        return;
    }
    NSArray <UIViewController *> *navigationChildViewControllers = self.childViewControllers;
    if ([navigationChildViewControllers containsObject:viewController]) {
        NSMutableArray *tmpChildViewControllers = [navigationChildViewControllers mutableCopy];
        if (tmpChildViewControllers) {
            [tmpChildViewControllers removeObject:viewController];
            [self setViewControllers:tmpChildViewControllers animated:NO];
        }
        [self pushViewController:viewController animated:YES];
    }
}

- (void)pushNavigationStackViewControllerWithControllerClass:(Class)viewControllerClass{
    UIViewController *viewcontroller = [self getViewControllerWithControllerClassName:viewControllerClass fromControllers:self.childViewControllers];
    viewcontroller = viewcontroller? viewcontroller:[viewControllerClass new];
    [self pushNavigationStackViewController:viewcontroller];
}

- (void)pushViewController:(UIViewController *)viewController andPopViewControllersWithFromController:(UIViewController *)fromController endController:(UIViewController *)endController{
    
    NSArray <UIViewController *> *navigationChildViewControllers = self.childViewControllers;
    [self pushViewController:viewController animated:YES];
    
    if (!fromController || ![navigationChildViewControllers containsObject:fromController] || (endController && ![navigationChildViewControllers containsObject:endController])) {    //  如果没有起始viewController或则endcontroller不为空，但是不在当前栈中，直接push
        return;
    }
    
    NSInteger fromIndex = [navigationChildViewControllers indexOfObject:fromController];
    NSInteger endIndex = endController ?  [navigationChildViewControllers indexOfObject:endController]:navigationChildViewControllers.count-1;
    
    NSMutableArray<UIViewController *> *tmpChildNavigationViewControllers = [NSMutableArray new];
    NSArray <UIViewController *> *preViewController = [navigationChildViewControllers subarrayWithRange:NSMakeRange(0, fromIndex+1)];
    
    NSArray <UIViewController *> *sufViewController = [navigationChildViewControllers subarrayWithRange:NSMakeRange(endIndex, navigationChildViewControllers.count- (endIndex + 1))];
    
    [tmpChildNavigationViewControllers addObjectsFromArray:preViewController];
    [tmpChildNavigationViewControllers addObjectsFromArray:sufViewController];
    [tmpChildNavigationViewControllers addObject:viewController];
    
    //    [dispathcer.navigationController setViewControllers:tmpChildNavigationViewControllers animated:YES];      //目前这种注释掉的方法顶部navigation Bar 有点小问题
    [self  setViewControllers:tmpChildNavigationViewControllers animated:NO];
}


- (void)pushViewController:(UIViewController *)viewController andPopViewControllersWithFromClass:(Class)fromClass endClass:(Class)endClass{
    NSArray <UIViewController *> *navigationChildViewControllers = self.childViewControllers;
    UIViewController *startController = [self getViewControllerWithControllerClassName:fromClass fromControllers:navigationChildViewControllers];
    UIViewController *endController = [self getViewControllerWithControllerClassName:endClass fromControllers:navigationChildViewControllers];
    [self pushViewController:viewController andPopViewControllersWithFromController:startController endController:endController];
}

@end

