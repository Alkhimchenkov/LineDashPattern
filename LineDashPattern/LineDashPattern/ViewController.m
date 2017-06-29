//
//  ViewController.m
//  LineDashPattern
//
//  Created by Андрей on 29.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Constatns.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tableArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = UIColorFromHEX(COLOR_MAIN);
    self.tableArray = [NSArray arrayWithObjects:@"12345",@"54321",@"12345",@"54321",@"12345",@"54321", @"12345",@"54321",@"12345",@"54321",@"12345",@"54321", nil];
}


#pragma mark - Delegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


#pragma mark - Delegate UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.viewComponent.layer.cornerRadius = 10.0f;
    cell.viewComponent.clipsToBounds = YES;
    
    cell.imageCell.layer.cornerRadius = 5.0f;
    cell.imageCell.clipsToBounds = YES;
    
    cell.contentView.backgroundColor = UIColorFromHEX(COLOR_MAIN);
    
    [self removeLayerByName:@"ArroundLayer" view:cell.viewComponent];
    [cell.viewComponent.layer addSublayer:[self lineDashPattern:cell.viewComponent]];

    [cell.txtHeader setText:[self.tableArray objectAtIndex:indexPath.row]];
    [cell.imageCell setImage:[UIImage imageNamed:[self randomNameImage]]];
    [cell.txtDetail setText:[self.tableArray objectAtIndex:indexPath.row]];
    
    
    [cell setNeedsLayout];
    
    return cell;
}


#pragma mark - custom method
-(NSString*)randomNameImage{

    NSArray *nameImage = @[@"urbo_center",@"urbo_mall",@"user_profile",@"search-3"];
    NSUInteger randNum = arc4random() % [nameImage count];
    return [nameImage objectAtIndex:randNum];

}


-(CAShapeLayer*)lineDashPattern:(UIView*)cellView{
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.name = @"ArroundLayer";
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRoundedRect:cellView.bounds cornerRadius:10.0].CGPath;
    border.frame = cellView.bounds;
    
    border.strokeColor = UIColorFromHEX(COLOR_MAIN).CGColor;
    border.lineWidth = 4;
    border.lineDashPattern = @[@15];
    
    return border;
}


- (void)removeLayerByName:(NSString *)layerNameToRemove view:(UIView*)myView
{
    for (CAShapeLayer *childLayer in [myView.layer sublayers]) {
        if ([childLayer.name isEqualToString:layerNameToRemove]) {
            [childLayer removeFromSuperlayer];
            break;
        }
    }
}



@end
