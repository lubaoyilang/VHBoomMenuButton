//
//  TextOutsideCircleButtonVC.m
//  VHBoomMenuButton
//
//  Created by Nightonke on 2017/4/13.
//  Copyright © 2017 Nightonke. All rights reserved.
//

#import "TextOutsideCircleButtonVC.h"
#import "BuilderManager.h"
#import <BoomMenuButton/BoomMenuButton.h>

@interface TextOutsideCircleButtonVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<NSString *> *datas;
@property (nonatomic, strong) NSMutableArray<NSValue *> *piecesAndButtons;
@property (weak, nonatomic) IBOutlet VHBoomMenuButton *bmb;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TextOutsideCircleButtonVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bmb.buttonEnum = VHButtonTextOutsideCircle;
    
    [self initializeDatas];
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)initializeDatas
{
    self.datas = [NSMutableArray array];
    self.piecesAndButtons = [NSMutableArray array];
    [BuilderManager initializeDatasForTextOutsideCircleButton:self.datas piecesAndButtons:self.piecesAndButtons];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.bmb.piecePlaceEnum = [[self.piecesAndButtons objectAtIndex:indexPath.row] CGPointValue].x;
    self.bmb.buttonPlaceEnum = [[self.piecesAndButtons objectAtIndex:indexPath.row] CGPointValue].y;
    [self.bmb clearBuilders];
    for (int i = 0; i < self.bmb.pieceNumber; i++)
    {
        [self.bmb addBuilder:[BuilderManager textOutsideCircleButtonBuilder]];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TextOutsideCircleButtonVCIdentifier = @"TextOutsideCircleButtonVCIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TextOutsideCircleButtonVCIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TextOutsideCircleButtonVCIdentifier];
    }
    
    cell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    return cell;
}

@end
