//
//  MainViewController.m
//  test
//
//  Created by kyle on 11/3/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

UIView *currentView;
UITableView *viewMe;
UITableView *viewComments;
UITableView *viewMails;

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
    
    NSArray *strs = [[NSArray alloc] initWithObjects:@"AA", @"BB", @"CC", nil];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:strs];
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.frame = CGRectMake(0,0, 160, 30);
    [segmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentControl;
    
    //init table views
    viewMe = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 456)];
    viewMe.backgroundColor = [UIColor blackColor];
    viewComments = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 456)];
    viewComments.backgroundColor = [UIColor redColor];
    viewMails = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 456)];
    viewMails.backgroundColor = [UIColor grayColor];
    
    currentView = viewMe;
    
    //方法1
    [self.view addSubview:currentView];
    
    //方法2
    //[self performSelector:@selector(delayAddSubView:) withObject:currentView afterDelay:0];
}

- (void)delayAddSubView:(UIView*)view {
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)segmentAction:(UISegmentedControl *)seg
{
    [currentView removeFromSuperview];
    switch (seg.selectedSegmentIndex) {
        case 0:
            currentView = viewMe;
            break;
        case 1:
            currentView = viewComments;
            break;
        case 2:
            currentView = viewMails;
            break;
        default:
            break;
    }
    //方法1
    [self.view addSubview:currentView];
    
    //方法2
    //[self performSelector:@selector(delayAddSubView:) withObject:currentView afterDelay:0];
}

@end
