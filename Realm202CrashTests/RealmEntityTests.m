//
//  Realm202CrashTests.m
//  Realm202CrashTests
//
//  Created by Cassiano Monteiro on 07/10/16.
//  Copyright © 2016 Cassiano. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>

@interface TestRealmObject : RLMObject
@property (nonatomic, strong) NSNumber<RLMInt> *numberProperty;
@property (nonatomic, strong) NSString *stringProperty;
@end
@implementation TestRealmObject
@end

@interface Realm202CrashTests : XCTestCase
@end

@implementation Realm202CrashTests

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
    TestRealmObject *myObject = [[TestRealmObject alloc] init];
    myObject.numberProperty = @1;
    myObject.stringProperty = @"aString";
    XCTAssertEqual([TestRealmObject allObjects].count, 0);
    
    // When
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:myObject];
    }];
    
    // Then
    XCTAssertEqual([TestRealmObject allObjects].count, 1);
    TestRealmObject *theObject = [TestRealmObject objectsWhere:@"numberProperty == 1"].firstObject;
    XCTAssertEqualObjects(theObject.numberProperty, @1);
}

@end
