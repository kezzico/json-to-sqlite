//
//  ManagedContextFactory.m
//  DatabaseBuilder
//
//  Created by Lee Irvine on 2/17/12.
//  Copyright (c) 2012 leescode.com. All rights reserved.
//

#import "PersistentStoreManager.h"

@implementation PersistentStoreManager

- (void) savePersistentStoreTo:(NSString *) storePath forModel: (NSString *) momd {
  NSURL *storeUrl = [NSURL fileURLWithPath: storePath];
  NSURL *modelUrl = [NSURL fileURLWithPath: momd];
  NSError *error=nil;

  [[NSFileManager defaultManager] removeItemAtURL: storeUrl error: nil];
  self.managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl] autorelease];
  self.storeCoordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.managedObjectModel] autorelease];
  [self.storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL: storeUrl options:nil error:&error];
  NSAssert(error == nil, @"store error: %ld", error.code);
}

- (NSManagedObjectContext *) buildContext {
  NSManagedObjectContext *output = [[[NSManagedObjectContext alloc] init] autorelease];
  [output setPersistentStoreCoordinator:self.storeCoordinator];
  return output;
}

@end

