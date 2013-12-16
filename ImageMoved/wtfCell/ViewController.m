//
//  ViewController.m
//  wtfCell
//
//  Created by kyle on 11/28/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "ViewController.h"
#import "FriendDetailHeadCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tbView.backgroundColor = [[UIColor alloc] initWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---------------UITableViewDataSource-------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1){
        return 12;
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //头部
    if (indexPath.section == 0) {
        static NSString *headerCellIdentifier = @"FriendDetailHeadCellIdentifier";
        FriendDetailHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:headerCellIdentifier];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FriendDetailHeadCell" bundle:nil] forCellReuseIdentifier:headerCellIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:headerCellIdentifier];
        }
        
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:@"talk"];
        if (image) {
            cell.imageView.image = image;
        }
        
        cell.nickNameLabel.text = @"喵喵喵～";
        cell.userIdLabel.text = @"喵了个大咪～～～";
        
        return cell;
    }
    
    //资料
    else if(indexPath.section == 1){
        static NSString *DetailCellIdentifier = @"DetailCellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:DetailCellIdentifier];
        }
        
        cell.textLabel.text = @"test";
        cell.detailTextLabel.text = @"";
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"1.";
            cell.detailTextLabel.text = @"滑动table到底部，";
        } else if(indexPath.row == 1) {
            cell.textLabel.text = @"2.";
            cell.detailTextLabel.text = @"再滑上来发现头像的位置变了！";
        } else if(indexPath.row == 2) {
            cell.textLabel.text = @"3.";
            cell.detailTextLabel.text = @"大小也变了！坑爹啊。。～～";
        } else {
            //
        }
        return cell;
    }
    
    return nil;
}

#pragma mark - ---------------UITableViewDelegate-------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 72.0;
    } else if(indexPath.section == 1) {
        return 60.0;
    } else {
        //
    }
    return 0.0;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


@end
