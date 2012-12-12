//
//  ManagedContextFactory.h
//  DatabaseBuilder
//
//  Created by Lee Irvine on 8/7/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistentStoreManager : NSObject
@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) NSPersistentStoreCoordinator *storeCoordinator;
- (void) savePersistentStoreTo:(NSString *) storePath forModel: (NSString *) momd;
- (NSManagedObjectContext *) buildContext;
@end
