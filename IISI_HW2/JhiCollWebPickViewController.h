//
//  JhiCollWebPickViewController.h
//  IISI_HW2
//
//  Created by jhihguan on 13/8/24.
//  Copyright (c) 2013年 jhihguan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JhiCollWebPickViewController;
@protocol JhiCollWebPickDelegate <NSObject>

@optional
- (void)passWebSiteLink:(NSString *)link withTitle:(NSString *)title;

@end

@interface JhiCollWebPickViewController : UIViewController
@property (strong, nonatomic) NSString *link;
@property (weak, nonatomic) id <JhiCollWebPickDelegate> delegate;

@end
