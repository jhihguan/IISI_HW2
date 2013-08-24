//
//  JhiCollHistorySync.h
//  IISI_HW2
//
//  Created by jhihguan on 13/8/24.
//  Copyright (c) 2013年 jhihguan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JhiCollHistorySync : NSObject

@property (readonly, nonatomic) NSMutableArray *historys;

- (void)updateHistoryData:(NSString *)link withTitle:(NSString *)title;

@end
