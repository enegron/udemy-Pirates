//
//  MLCPiratesGameViewController.m
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import "MLCPiratesGameViewController.h"
#import "MLCPiratesGameTile.h"
#import "MLCPiratesGamePlayer.h"
#import "MLCPiratesGameBoardFactory.h"

@interface MLCPiratesGameViewController ()

@end

@implementation MLCPiratesGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* [tile, armor, weapon]
     0,0[1,n,n]         0,1[2,n,n]         0,2[3,n,n]         0,3[4,n,n]
     1,0[5,n,n]         1,1[6,1,n]         1,2[7,n,n]         1,3[8,n,n]
     2,0[9,n,n]         2,1[10,n,n]         2,2[11,n,1]       2,3[12,-1,-1]
     */

    [self initializeGame];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)upButton:(UIButton *)sender {

    // make sure move can be made, if so update current position and log it
    
    // if the current position is NOT already row 0, can move up
    if (self.currentRow != 0 ) {
        self.currentRow = self.currentRow-1;
    }
    
    else {
        NSLog(@"can't go there");
    }
    
    [self updateCurrentPositionLabel];
    
}

- (IBAction)downButton:(UIButton *)sender {
    // make sure move can be made, if so update current position and log it
    
    // if the current position is NOT the last row (rows - 1 since position is 0 index)
    if (self.currentRow != self.gameBoardRows - 1 ) {
        self.currentRow = self.currentRow+1;
    }
    
    else {
        NSLog(@"can't go there");
    }

    [self updateCurrentPositionLabel];

}

- (IBAction)leftButton:(UIButton *)sender {
    // make sure move can be made, if so update current position and log it
    
    // if the current position is NOT already column 0, can move left
    if (self.currentColumn != 0 ) {
        self.currentColumn = self.currentColumn-1;
    }
    
    else {
        NSLog(@"can't go there");
    }
    
    [self updateCurrentPositionLabel];
    
}

- (IBAction)rightButton:(UIButton *)sender {
    // make sure move can be made, if so update current position and log it
    
    // if the current position is NOT the last column (column - 1 since position is 0 index)
    if (self.currentColumn != self.gameBoardColumns - 1 ) {
        self.currentColumn = self.currentColumn+1;
    }
    
    else {
        NSLog(@"can't go there");
    }
    
    [self updateCurrentPositionLabel];
    

}


-(void) updateCurrentPositionLabel {
    
    self.currentRowLabel.text = [NSString stringWithFormat:@"%i",self.currentRow];
    self.currentColumnLabel.text = [NSString stringWithFormat:@"%i",self.currentColumn];
    
    // get the current Tile and show its story
    
    NSArray* currentRowTiles = [self.gameBoard objectAtIndex:self.currentRow];
    self.currentTile = [currentRowTiles objectAtIndex:self.currentColumn];
    
    self.currentTilesStoryLabel.text = self.currentTile.story;


    // update the controls for to disable direction you can't move

    // if in top row make up button disabled, otherwise, keep it enabled
    if (self.currentRow == 0) {
        self.upButton.hidden = true;
    }
    else  {
        self.upButton.hidden = false;
    }

    // if in bottom row make up button disabled, otherwise, keep it enabled

    if (self.currentRow == 2) {
        self.downButton.hidden = true;
    }
    else  {
        self.downButton.hidden = false;
    }
    
    // if in left column, disable left button, else keep it enabled
    if (self.currentColumn == 0) {
        self.leftButton.hidden = true;
    }
    else {
        self.leftButton.hidden = false;
    }
    
    // if in right column disable right button else keep it enabled
    if (self.currentColumn == 3) {
        self.rightButton.hidden = true;
    }

    else {
        self.rightButton.hidden = false;
    }
    
    // if the current tile has armor, weapon or plant, make the action button available with a label, else hide it

    if (self.currentTile.armor != nil) {
        self.tileAction.enabled = true;
        [self.tileAction setTitle:@"Pick it up." forState:UIControlStateNormal];
    }
    else if (self.currentTile.weapon != nil) {
        self.tileAction.enabled = true;
        [self.tileAction setTitle:@"Take it." forState:UIControlStateNormal];
    }
    else if (self.currentTile.plant != nil) {
        self.tileAction.enabled = true;
        [self.tileAction setTitle:@"Eat it." forState:UIControlStateNormal];
    }
    else if (self.currentTile.bossPresent == true) {
        self.tileAction.enabled = true;
        [self.tileAction setTitle:@"Fight!" forState:UIControlStateNormal];
    }

    
    // there is nothing to act on in this tile so don't enabled action button
    else {
        self.tileAction.enabled = false;
        
    }
}

// BIG todo - right now the logic assumes each tile has only one of armor, weapon or plant
// need to refactor to properly allow more than one things, tile story is especially weak on this point

- (IBAction)tileActionPress:(UIButton *)sender {
    
    // when the player takes action from stuff in the tiles, make it affect them, and remove that from the tile so it's not available if they go to it again
    
    if (self.currentTile.armor != nil) {
        self.player.armor = self.currentTile.armor;
        self.currentTile.armor = nil;
        
        [self updatePlayerStats];
        self.currentTile.story = @"nothing here...";
    }

    else if (self.currentTile.weapon != nil) {
        self.player.weapon = self.currentTile.weapon;
        self.currentTile.weapon = nil;
        
        [self updatePlayerStats];
        self.currentTile.story = @"nothing here...";
    }

    else if (self.currentTile.plant != nil) {
        // eat the plan and get it's health effect (positive or negative!!)
        self.player.health = self.player.health+self.currentTile.plant.healthEffect;
        self.currentTile.plant = nil;
        
        [self updatePlayerStats];
        self.currentTile.story = @"nothing here...";
    }

    
    else if (self.currentTile.bossPresent == true) {
        
        //This is where the fighting takes place
        // todo only show reset button if win or lost the game...
    

        // randomly decide if the boss takes a hit or if the player takes a hit
        int randomNumber = arc4random() % 2;

        //testing - player always is hit
        //randomNumber = 0;
        
        NSLog(@"%i", randomNumber);
        if (randomNumber == 0) {
            NSLog(@"player is attacked!  player health: %i, boss damage: %i",self.player.health, self.boss.damage);

            // factor in armor bonus basically it helps the player avoid getting damage even when they are hit by decreasing the odds of hit inflicting damge. more armor bonus, more odds in their favor

            int armorProtection = arc4random() % (1+self.player.armor.bonus);
            NSLog(@"armor protection random: %i", armorProtection);
            
            if (armorProtection == 0) {
                self.player.health = self.player.health - self.boss.damage;
                self.currentTilesStoryLabel.text = @"You got hit!!";
            }
            else {
                self.currentTilesStoryLabel.text = @"Boss swung, but armor protected you!!!";
            }
            //update info
            [self updatePlayerStats];

        }
        
        // The player strikes the boss
        // if they have a weapon bonus - it is added to the damage all the time.
        
        else if (randomNumber == 1) {
            NSLog(@"boss gets attacked! boss health: %i, player damage: %i, player's weapon bonus: %i",self.boss.health, self.player.damage, self.player.weapon.bonus);
            self.boss.health = self.boss.health - (self.player.damage + self.player.weapon.bonus);
            self.currentTilesStoryLabel.text = @"You hit the boss!";

        }

        NSLog(@"Boss health remaining: %i",self.boss.health);
        
    }

    
    // after action need to check to see if user has been killed and disable all actions if so
    if (self.player.health <= 0) {
            UIAlertView* lost = [[UIAlertView alloc] initWithTitle:@"You lost!" message:@"You lost all your health." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [lost show];
        
        self.upButton.hidden = true;
        self.downButton.hidden = true;
        self.leftButton.hidden = true;
        self.rightButton.hidden = true;
        
    }
    
    else if (self.boss.health <= 0) {
        UIAlertView* won = [[UIAlertView alloc] initWithTitle:@"You won!" message:@"You defeated the boss." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [won show];

        self.upButton.hidden = true;
        self.downButton.hidden = true;
        self.leftButton.hidden = true;
        self.rightButton.hidden = true;
        
    }
    
    
    // disable the action for this turn.
    self.tileAction.enabled = false;
    
}


-(void) updatePlayerStats {
    self.playerHealthLabel.text = [NSString stringWithFormat:@"%i",self.player.health];
    self.playerDamageLabel.text = [NSString stringWithFormat:@"%i",self.player.damage];
    self.playerArmorLabel.text = [NSString stringWithFormat:@"%@",self.player.armor.name];
    self.armorBonusLabel.text = [NSString stringWithFormat:@"%i",self.player.armor.bonus];
    self.playerWeaponLabel.text = [NSString stringWithFormat:@"%@",self.player.weapon.name];
    self.weaponBonusLabel.text = [NSString stringWithFormat:@"%i",self.player.weapon.bonus];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    [self initializeGame];
    
}


-(void) initializeGame {

    self.player = [[MLCPiratesGamePlayer alloc]init];
    self.player.health = 5;
    self.player.damage = 1;
    self.player.armor = [[MLCPiratesGameArmor alloc] init];
    self.player.armor.name = @"Leather Jacket";
    self.player.armor.bonus = 0;
    self.player.weapon = [[MLCPiratesGameWeapon alloc] init];
    self.player.weapon.name = @"Steak Knife";
    self.player.weapon.bonus = 0;
    
    [self updatePlayerStats];
    
    self.boss = [[MLCPiratesGamePlayer alloc]init];
    self.boss.health = 5;
    self.boss.damage = 1;
    
    
    // configure board for 12 tiles
    self.gameBoardRows = 3;
    self.gameBoardColumns = 4;
    
    
    MLCPiratesGameBoardFactory *gameBoardMaker = [[MLCPiratesGameBoardFactory alloc]init];
    
    self.gameBoard = [gameBoardMaker createGameBoard];
    
    
    // when there is no action available don't show a label
    [self.tileAction setTitle:@"" forState:UIControlStateDisabled];
    
    // initialize position in game and update the UI to show it.
    self.currentRow=0;
    self.currentColumn=0;
    
    [self updateCurrentPositionLabel];
    
}
@end
