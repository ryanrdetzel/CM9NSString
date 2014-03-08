//
//  NSString+CM9NSStringTests.m
//
//  Created by Ryan Detzel on 3/8/14.
//  Copyright (c) 2014 Ryan Detzel. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "NSString+CM9NSString.h"

@interface NSString_CM9NSString : XCTestCase
@property (nonatomic) NSString *string1;
@property (nonatomic) NSString *string2;
@property (nonatomic) NSString *string3;
@end

@implementation NSString_CM9NSString

- (void)setUp{
    [super setUp];
    self.string1 = @"This Is A String";
    self.string2 = @"The String's Strings are pretty-cool!";
    self.string3 = @"What is I already have dash-es-, Numbers: 123123 and other odd characters? !@#$%^&*()";
}

- (void)tearDown{
    [super tearDown];
}

-(void)testCamelCase{
    XCTAssertTrue([@"ThisIsAString" isEqualToString:[self.string1 camelCase]]);
    XCTAssertTrue([@"TheString'sStringsArePretty-Cool!" isEqualToString:[self.string2 camelCase]]);
    XCTAssertTrue([@"WhatIsIAlreadyHaveDash-Es-,Numbers:123123AndOtherOddCharacters?!@#$%^&*()" isEqualToString:[self.string3 camelCase]]);
}

-(void)testReverse{
    XCTAssertTrue([@"gnirtS A sI sihT" isEqualToString:[self.string1 reverse]]);
    XCTAssertTrue([@"!looc-ytterp era sgnirtS s'gnirtS ehT" isEqualToString:[self.string2 reverse]]);
    XCTAssertTrue([@")(*&^%$#@! ?sretcarahc ddo rehto dna 321321 :srebmuN ,-se-hsad evah ydaerla I si tahW" isEqualToString:[self.string3 reverse]]);
}

- (void)testSlugify{
    XCTAssertTrue([@"this-is-a-string" isEqualToString:[self.string1 slugalize]]);
    XCTAssertTrue([@"what-is-i-already-have-dash-es-numbers-123123-and-other-odd-characters" isEqualToString:[self.string3 slugalize]]);
    XCTAssertTrue([@"the-strings-strings-are-pretty-cool" isEqualToString:[self.string2 slugalize]]);
}

@end
