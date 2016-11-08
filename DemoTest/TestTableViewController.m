//
//  TestTableViewController.m
//  DemoTest
//
//  Created by 雷建民 on 16/11/3.
//  Copyright © 2016年 leijianmin. All rights reserved.
//

#import "TestTableViewController.h"

@interface TestTableViewController ()
{
    NSInteger _section;
}
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _section = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  -------------华丽的分割线---------------------------  UITableViewDataSource 数据源代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    _section++;
      NSLog(@"%s------------------->第%ld轮",__func__,_section);
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s",__func__);
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行测试数据",indexPath.row];
    NSLog(@"%s",__func__);
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
       NSLog(@"%s",__func__);
    return @"页眉";
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSLog(@"%s",__func__);
    return @"页脚";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSLog(@"%s",__func__);
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    return YES;
}

#pragma mark  -------------华丽的分割线-------------------所有代理方法都是可选实现的--------  UITableViewDelegate 代理方法

// cell ，页眉，页脚的重用--->显示和消失时机
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);

}
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);
}

// Variable height support  --> 设置高度代理方法


// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.

//这三个方法 为优化tableview而诞生的方法。设置  预估高度 三个方法！

// 返回 cell ，页眉，页脚真实高度 方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSLog(@"%s",__func__);
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        NSLog(@"%s",__func__);
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
        NSLog(@"%s",__func__);
    return 30;
}
// Section header & footer information. Views are preferred over title should you decide to provide both

// custom view for header. will be adjusted to default or specified header height
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSLog(@"%s",__func__);
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 30)];
    return lable;
}
// custom view for footer. will be adjusted to default or specified footer height
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSLog(@"%s",__func__);
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 30)];
    return lable;
}


// Accessories (disclosures).

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED
{
    NSLog(@"%s",__func__);
    return UITableViewCellAccessoryNone;
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);
    return NO;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"%s",__func__);

}

//   选中 时机的一些方法
// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    return nil;
}
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0)
{
    NSLog(@"%s",__func__);
    return nil;
}
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0)
{
    NSLog(@"%s",__func__);
}

// Editing
// 编辑tableviewcell 时候的 一些方法
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    return UITableViewCellEditingStyleNone;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED
{
    NSLog(@"%s",__func__);
    return @"编辑cell";
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED
{
      NSLog(@"%s",__func__);
   
    return  nil;
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSLog(@"%s",__func__);
    return YES;
}

//编辑 每行cell的 编辑 时机的一些方法
// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED
{
      NSLog(@"%s",__func__);
}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath __TVOS_PROHIBITED
{    NSLog(@"%s",__func__);
}



- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    NSLog(@"%s",__func__);
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    return 1;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"%s",__func__);
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"%s",__func__);
    return YES;
}
- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"%s",__func__);
}


- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0)
{
         NSLog(@"%s",__func__);
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0)
{
    NSLog(@"%s",__func__);
    return YES;
}
- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0)
{
    NSLog(@"%s",__func__);
}
- (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0)
{
    NSLog(@"%s",__func__);
    return nil;
}




#pragma mark  -------------华丽的分割线---------------------------  UITableViewDataSourcePrefetching 预加载数据源代理方法
/*
 这个协议里面只有一个必须要实现的方法——Tableview prefetchItemsAt indexPaths。这个方法会在prefetchDataSource里面被调用，用来给你异步的预加载数据的。indexPaths数组是有序的，就是接下来row接收数据的顺序，让我们model异步处理数据更加方便。
 
 在这个协议里面还有第二个方法Tableview cancelPrefetcingForItemsAt indexPaths，不过这个方法是optional的。我们可以利用这个方法来处理在滑动中取消或者降低提前加载数据的优先级。
 
 值得说明的是，新增加的这个“小伙伴”prefetchDataSource并不能代替原来的读取数据的方法，这个预加载仅仅只是辅助加载数据，并不能
 
 删除原来我们读取数据的方法。

 */
- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    NSLog(@"%s",__func__);
  
}
- (void)tableView:(UITableView *)tableView cancelPrefetchingForRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    NSLog(@"%s",__func__);
}


@end
