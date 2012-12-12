//
//  main.m
//  DatabaseBuilder
//
//  Created by Lee Irvine on 8/7/12.
//  Copyright (c) 2012 kezzi.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseBuilder.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    DatabaseBuilder *builder = [[[DatabaseBuilder alloc] init] autorelease];
    builder.tableFolder = [NSString stringWithUTF8String: argv[1]];
    builder.modelFile = [NSString stringWithUTF8String: argv[2]];
    builder.outputFile = [NSString stringWithUTF8String: argv[3]];
    [builder buildDatabase];
  }
  return 0;
}
