//
//  JhiCollViewController.m
//  IISI_HW2
//
//  Created by jhihguan on 13/8/24.
//  Copyright (c) 2013年 jhihguan. All rights reserved.
//

#import "JhiCollViewController.h"
#import "JhiCollWebPickViewController.h"

@interface JhiCollViewController ()<JhiCollWebPickDelegate>


@end

@implementation JhiCollViewController
- (IBAction)goURL:(id)sender {
    [self performSegueWithIdentifier:@"goURL" sender:sender];
    
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     if ([segue.identifier isEqualToString:@"goURL"]) {
         JhiCollWebPickViewController *webpick = [segue destinationViewController];
        
         [webpick setLink:self.urlTextField.text];
         [webpick setDelegate:self];
    }
    
}

- (void)passWebSiteLink:(NSString *)link{
    NSLog(@"Get a link %@",link);
    self.urlTitleLabel.text = link;
}

- (void)viewDidAppear:(BOOL)animated{
    [self synchronize];
}

- (void)synchronize{
    
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
