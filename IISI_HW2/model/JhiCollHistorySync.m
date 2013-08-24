//
//  JhiCollHistorySync.m
//  IISI_HW2
//
//  Created by jhihguan on 13/8/24.
//  Copyright (c) 2013年 jhihguan. All rights reserved.
//

#import "JhiCollHistorySync.h"

@interface JhiCollHistorySync ()

@property (readwrite, nonatomic) NSMutableArray *historys;

@end

@implementation JhiCollHistorySync

@synthesize historys = _historys;

#define HIST_KEY @"hist"

-(void)updateHistoryData:(NSString *)link withTitle:(NSString *)title{
    if (![link length] == 0) {
        NSMutableArray *mutableHistoryLinks = [[[NSUserDefaults standardUserDefaults] arrayForKey:HIST_KEY] mutableCopy];
        if (!mutableHistoryLinks) {
            mutableHistoryLinks = [[NSMutableArray alloc] init];
        }
        [mutableHistoryLinks addObject:@{@"link":link,@"time":[NSDate date],@"title":title}];
        [[NSUserDefaults standardUserDefaults] setObject:mutableHistoryLinks forKey:HIST_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.historys = mutableHistoryLinks;
    }
}

- (void)setHistorys:(NSMutableArray *)historys{
    _historys = historys;
}

- (NSMutableArray *)historys{
    if (!_historys) {
        _historys = [[[NSUserDefaults standardUserDefaults] arrayForKey:HIST_KEY] mutableCopy];
    }
    return _historys;
}

@end
