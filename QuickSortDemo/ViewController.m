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
    
}
- (BOOL)binary_search:(NSMutableArray *)array target:(NSInteger)item
{
    long n = array.count;
    if(n > 0){
        long mid = n/2;
        if([array[mid] integerValue] == item){
            return YES;
        }else if(item < [array[mid] integerValue]){
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
    if(i >= j){
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
    if (array == nil || array.count == 0){
        return;
    }
    
    for (int i = 0; i < array.count; i ++) {
//        NSLog(@"i==%d", i);
        for (int j = 0; j < array.count-1 -i; j ++) {
//            NSLog(@"j=%d", j);
            if (array[j] > array[j+1]){
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
