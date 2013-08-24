//
//  JhiCollViewController.m
//  IISI_HW2
//
//  Created by jhihguan on 13/8/24.
//  Copyright (c) 2013年 jhihguan. All rights reserved.
//

#import "JhiCollViewController.h"
#import "JhiCollWebPickViewController.h"
#import "JhiCollHistorySync.h"

@interface JhiCollViewController ()<JhiCollWebPickDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) JhiCollHistorySync *histSync;
@property (weak, nonatomic) IBOutlet UITableView *histTableView;

@end

@implementation JhiCollViewController

#define HIST_LINK_ID @"LinkCell"

- (IBAction)goURL:(id)sender {
    [self performSegueWithIdentifier:@"goURL" sender:sender];
    
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     if ([segue.identifier isEqualToString:@"goURL"]) {
         JhiCollWebPickViewController *webpick = [segue destinationViewController];
         
         NSString *link = self.urlTextField.text;
         if ([link rangeOfString:@"http://"].location == NSNotFound) {
             link = [@"http://" stringByAppendingString:link];
         }
         [webpick setLink:link];
         [webpick setDelegate:self];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.histSync historys] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:HIST_LINK_ID];
    
    NSDictionary *data = self.histSync.historys[self.histSync.historys.count - indexPath.row - 1];
    cell.textLabel.text = data[@"link"];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateStyle:NSDateFormatterMediumStyle];
    [dateformat setTimeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateformat stringFromDate:data[@"time"]];
//    NSLog(@"%@",data[@"title"]);
    return cell;
}

- (void)passWebSiteLink:(NSString *)link withTitle:(NSString *)title{
    self.urlTitleLabel.text = link;
    [self.histSync updateHistoryData:self.urlTitleLabel.text withTitle:title];
}

- (void)viewWillAppear:(BOOL)animated{
//    NSArray * data = [self.histSync historys];
//    NSLog(@"%d",data.count);
    [self.histTableView reloadData];
}

- (JhiCollHistorySync *)histSync{
    if (!_histSync) {
        _histSync = [[JhiCollHistorySync alloc] init];
    }
    return _histSync;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
