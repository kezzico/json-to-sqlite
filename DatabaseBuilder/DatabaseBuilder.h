//
//  DatabaseBuilder.h
//  DatabaseBuilder
//
//  Created by Lee Irvine on 8/7/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersistentStoreManager;
@interface DatabaseBuilder : NSObject
@property (nonatomic, retain) NSString *tableFolder;
@property (nonatomic, retain) NSString *modelFile;
@property (nonatomic, retain) NSString *outputFile;
@property (nonatomic, retain) NSManagedObjectContext *context;
- (void) buildDatabase;
@end
