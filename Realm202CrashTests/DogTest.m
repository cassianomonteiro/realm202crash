//
//  DogTest.m
//  Realm202Crash
//
//  Created by Cassiano Monteiro on 07/10/16.
//  Copyright © 2016 Cassiano. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dog.h"

@interface DogTest : XCTestCase

@end

@implementation DogTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Use an in-memory Realm identified by the name of the current test.
    // This ensures that each test can't accidentally access or modify the data
    // from other tests or the application itself, and because they're in-memory,
    // there's nothing that needs to be cleaned up.
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.inMemoryIdentifier = self.name;
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSave {
    
    // Given
    Dog *myDog = [[Dog alloc] init];
    myDog.name = @"Rex";
    XCTAssertEqual([Dog allObjects].count, 0);
    
    // When
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:myDog];
    }];
    
    // Then
    XCTAssertEqual([Dog allObjects].count, 1);
    Dog *theDog = [Dog objectsWhere:@"name == 'Rex'"].firstObject;
    XCTAssertEqualObjects(theDog.name, @"Rex");
}

@end
