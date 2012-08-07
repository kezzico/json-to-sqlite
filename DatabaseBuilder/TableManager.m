//
//  TableManager.m
//  DatabaseBuilder
//
//  Created by Lee Irvine on 8/7/12.
//  Copyright (c) 2012 fareportal. All rights reserved.
//

#import "TableManager.h"

@implementation TableManager
- (id) initWithTableFolder:(NSString *) path {
  if(self = [super init]) {
    self.tableFolder = path;
  }  
  return self;
}

- (NSArray *) tables {
  NSString *path = [NSString stringWithFormat:@"%@/dbconfig.plist", self.tableFolder];
  NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile: path];
  return [config valueForKey:@"Tables"];
}

- (NSArray *) dataForTable:(NSString *) table {
  NSString *path = [NSString stringWithFormat:@"%@/%@.json", self.tableFolder, table];
  NSArray *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile: path] options:0 error:nil];
  return data;
}

@end
