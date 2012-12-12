//
//  TableManager.h
//  DatabaseBuilder
//
//  Created by Lee Irvine on 8/7/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableManager : NSObject
@property (nonatomic, retain) NSString *tableFolder;
- (id) initWithTableFolder:(NSString *) path;
- (NSArray *) dataForTable:(NSString *) table;
- (NSArray *) tables;
@end
