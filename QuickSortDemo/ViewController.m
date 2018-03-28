//
//  ViewController.m
//  QuickSortDemo
//
//  Created by apple  on 2018/3/15.
//  Copyright © 2018年 apple . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"QuickSort";
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
    
    [self quickSortArray:arr lowIndex:0 highIndex:arr.count - 1];
//    [self bubbleSort:arr];
//    [self selectSort:arr];
    NSLog(@"%@",arr);
    NSLog(@"%@",[self binary_search:arr target:6]?@"YES":@"NO");
    
    //测试在view中查找button
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIView *tView_1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [testView addSubview:tView_1];
    UIView *tView_2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [testView addSubview:tView_2];
    UIView *tView_3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [tView_2 addSubview:tView_3];
    UIView *tView_4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [tView_3 addSubview:tView_4];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [tView_3 addSubview:btn];
    [self.view addSubview:testView];
//    [self searchButtonInView:testView];
    [self searchButtonInViewScope:testView];
}
//查找一个view中的button（深度查找与广度查找）
- (void)searchButtonInView:(UIView *)view
{
    NSArray *childViews = [view subviews];
    for (UIView *child in childViews) {
        if ([child isKindOfClass:[UIButton class]]) {
            NSLog(@"%@",child);
        }
        if (child.subviews.count) {
            [self searchButtonInView:child];
        }
    }
}

- (void)searchButtonInViewScope:(UIView *)view
{
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:view];
    while (tempArray.count) {
        UIView *firstObject = tempArray[0];
        [tempArray removeObjectAtIndex:0];
        
        for (UIView * child in [firstObject subviews]) {
            if ([child isKindOfClass:[UIButton class]]) {
                NSLog(@"%@",child);
            }
            if (child.subviews.count) {
                [tempArray addObject:child];
            }
        }
        
    }
}

- (BOOL)binary_search:(NSMutableArray *)array target:(NSInteger)item
{
    long n = array.count;
    if(n > 0){
        long mid = n/2;
        if ([array[mid] integerValue] == item) {
            return YES;
        }else if (item < [array[mid] integerValue]) {
            NSMutableArray *temparray = [NSMutableArray array];
            for(int i =0; i < mid; i ++){
                [temparray addObject: array[i]];
            }
            NSLog(@"%@",temparray);
            return [self binary_search:temparray target:item];
        }else{
            NSMutableArray *temparray = [NSMutableArray array];
            for(long i =mid; i < n; i ++){
                [temparray addObject: array[i]];
            }
            NSLog(@"%@",temparray);
            return [self binary_search:temparray target:item];
        }
    }
    return NO;
}

- (void)quickSortArray:(NSMutableArray *)array lowIndex:(NSInteger)low highIndex:(NSInteger)high{
    
    NSInteger i = low;
    NSInteger j = high;
    if (i >= j) {
        return;
    }
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        while (i < j && [array[j] integerValue] >= key) {
            j --;
        }
        array[i] = array[j];
        while (i < j && [array[i] integerValue] <= key) {
            i ++;
        }
        array[j] = array[i];
    }
    array[i] = @(key);
    [self quickSortArray:array lowIndex:low highIndex:i-1];
    [self quickSortArray:array lowIndex:i+1 highIndex:high];
    
}

- (void)bubbleSort:(NSMutableArray *)array{
    if (array == nil || array.count == 0) {
        return;
    }
    
    for (int i = 0; i < array.count; i ++) {
//        NSLog(@"i==%d", i);
        for (int j = 0; j < array.count-1 -i; j ++) {
//            NSLog(@"j=%d", j);
            if (array[j] > array[j+1]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
}

- (void)selectSort:(NSMutableArray *)arr_M{
    for (int i=0; i<arr_M.count; i++) {
        for (int j=i+1; j<arr_M.count; j++) {
            if (arr_M[i]<arr_M[j]) {
                [arr_M exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
