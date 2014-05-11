//
//  MLCPiratesGameBoardFactory.m
//  Pirates
//
//  Created by Eric Negron on 4/29/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import "MLCPiratesGameBoardFactory.h"

@implementation MLCPiratesGameBoardFactory

-(NSArray*) createGameBoard{

    // story, weapon, armor, bossPresent

    MLCPiratesGameTile* firstTile = [[MLCPiratesGameTile alloc] init];
    firstTile.story = @"nothing here...";

    // todo - while developing game I had crash if I alloc-init tile but didn't set any properties while trying to migrate to new creatGameBoard method.
    NSLog(@"todo here");
    
    MLCPiratesGameTile* secondTile = [[MLCPiratesGameTile alloc] init];
    secondTile.story = @"nothing here...";
    
    MLCPiratesGameTile* thirdTile = [[MLCPiratesGameTile alloc] init];
    thirdTile.story = @"nothing here...";

    /* fourthtile has weapon */
    MLCPiratesGameTile* fourthTile = [[MLCPiratesGameTile alloc] init];
    fourthTile.story = @"There's something on the ground....";
    fourthTile.weapon = [[MLCPiratesGameWeapon alloc ] init];
    [fourthTile.weapon newWeaponNamed:@"Baseball Bat" hasBonus:1];

    MLCPiratesGameTile* fifthTile = [[MLCPiratesGameTile alloc] init];
    fifthTile.story = @"nothing here...";

    /* sixthtile has armor */
    MLCPiratesGameTile* sixthTile = [[MLCPiratesGameTile alloc] init];
    sixthTile.story = @"There's something in the tree....";
    sixthTile.armor = [[MLCPiratesGameArmor alloc ] init];
    [sixthTile.armor newArmorNamed:@"Uniqlo mail" hasBonus:1];

    /* seventhtile has healthy plant */
    MLCPiratesGameTile* seventhTile = [[MLCPiratesGameTile alloc] init];
    seventhTile.story = @"There's a purple berry plant here";
    seventhTile.plant = [[MLCPiratesGamePlant alloc]init];
    seventhTile.plant.name = @"Blackberry";
    seventhTile.plant.healthEffect = 1;
    

    MLCPiratesGameTile* eighthTile = [[MLCPiratesGameTile alloc] init];
    eighthTile.story = @"nothing here...";

    /* ninth tile has bad plant */
    MLCPiratesGameTile* ninthTile = [[MLCPiratesGameTile alloc] init];
    ninthTile.story = @"There's a red berry plant here...";
    ninthTile.plant = [[MLCPiratesGamePlant alloc]init];
    ninthTile.plant.name = @"Killer Berry";
    ninthTile.plant.healthEffect = -2;
    

    MLCPiratesGameTile* tenthTile = [[MLCPiratesGameTile alloc] init];
    tenthTile.story = @"nothing here...";

    MLCPiratesGameTile* eleventhTile = [[MLCPiratesGameTile alloc] init];
    eleventhTile.story = @"nothing here...";
  
    /* twelfth tile has boss*/
    MLCPiratesGameTile* twelfthTile = [[MLCPiratesGameTile alloc] init];
    twelfthTile.story = @"A shadowy figure lurks";
    twelfthTile.bossPresent = true;
    

    
    NSArray* firstRow = [NSArray arrayWithObjects:firstTile, secondTile, thirdTile, fourthTile, nil];
    NSArray* secondRow = [NSArray arrayWithObjects:fifthTile, sixthTile, seventhTile, eighthTile,nil];
    NSArray* thirdRow = [NSArray arrayWithObjects:ninthTile, tenthTile, eleventhTile, twelfthTile, nil];

//    NSLog(@"%@,%@,%@",firstRow,secondRow,thirdRow);
        
    NSArray* gameboardArray = [[NSArray alloc] initWithObjects:firstRow, secondRow, thirdRow, nil];

    return gameboardArray;
    
}

@end
