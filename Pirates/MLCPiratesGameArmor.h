//
//  MLCPiratesGameArmor.h
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLCPiratesGameArmor : NSObject

@property (strong,nonatomic) NSString *name;
@property (nonatomic) int bonus;

-(void) newArmorNamed:(NSString*)name hasBonus:(int)bonus;

@end
