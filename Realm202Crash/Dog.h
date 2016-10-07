//
//  Dog.h
//  Realm202Crash
//
//  Created by Cassiano Monteiro on 07/10/16.
//  Copyright © 2016 Cassiano. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject
@property (nonatomic, strong) NSString *name;
@end
