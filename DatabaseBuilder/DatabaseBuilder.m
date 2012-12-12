//
//  DatabaseBuilder.m
//  DatabaseBuilder
//
//  Created by Lee Irvine on 8/7/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import "DatabaseBuilder.h"
#import "TableManager.h"
#import "PersistentStoreManager.h"

@implementation DatabaseBuilder
@synthesize tableFolder=_tableFolder;
@synthesize modelFile=_modelFile;
@synthesize outputFile=_outputFile;
@synthesize context=_context;

- (void) dealloc {
  [_tableFolder release];
  [_modelFile release];
  [_outputFile release];
  [_context release];
  [super dealloc];
}

- (void) buildDatabase {
  NSLog(@"Building database...");

  TableManager *tableManager = [[[TableManager alloc] initWithTableFolder: self.tableFolder] autorelease];
  PersistentStoreManager *storeManager = [[[PersistentStoreManager alloc] init] autorelease];
  [storeManager savePersistentStoreTo:self.outputFile forModel: self.modelFile];
  self.context = [storeManager buildContext];
  
  NSLog(@"Reading model from: %@", self.modelFile);
  NSLog(@"Saving store to: %@", self.outputFile);
  
  for(NSString *table in tableManager.tables) {
    NSArray *data = [tableManager dataForTable:table];
    NSLog(@"Populating %@", table);
    [self fillTable:table withData:data];
  }
  
  NSError *error = nil;
  [self.context save: &error];
  NSAssert(error == nil, @"%@", error);
}

- (void) fillTable:(NSString *) table withData: (NSArray *) rows {
  for(NSDictionary *row in rows) {
    NSManagedObject *entity = [NSEntityDescription insertNewObjectForEntityForName: table inManagedObjectContext: self.context];
    [self mapRow:row toEntity: entity];
  }
}

- (void) mapRow:(NSDictionary *) row toEntity: (NSManagedObject *) entity {
  for(NSString *key in row) {
    NSObject *value = [row valueForKey:key];
    [entity setValue:value forKey:key];
  }
}
@end
