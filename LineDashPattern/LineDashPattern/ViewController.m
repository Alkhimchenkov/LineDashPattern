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

- (void)viewDidLayoutSubviews
{
    NSLog(@"VIEW bounds: %@", NSStringFromCGRect(self.view.bounds));
 //   [self.tableView setFrame:self.view.bounds];
    [self.tableView layoutSubviews];
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
 
    
 //   cell.imageCell.layer.cornerRadius = 5.0f;
 //   cell.imageCell.clipsToBounds = YES;
    
    
    cell.contentView.backgroundColor = UIColorFromHEX(COLOR_MAIN);
    cell.backgroundColor = UIColorFromHEX(COLOR_MAIN);
    
    NSLog(@"CELL %d bounds: %@", indexPath.row, NSStringFromCGRect(cell.bounds));

    
 //   [self removeLayerByName:@"ArroundLayer" view:cell.viewComponent];
 //   [cell.viewComponent.layer addSublayer:[self lineDashPattern:cell.viewComponent]];
    

//    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 5.0, cell.contentView.frame.size.width, 5)];
//    separator.backgroundColor = [UIColor redColor];
//    [cell addSubview:separator];
    
    
    [cell.txtHeader setText:[self.tableArray objectAtIndex:indexPath.row]];
    [cell.imageCell setImage:[UIImage imageNamed:[self randomNameImage]]];
    [cell.txtDetail setText:[self.tableArray objectAtIndex:indexPath.row]];
//
//    [cell setNeedsLayout];
    
    return cell;
}


#pragma mark - custom method
-(NSString*)randomNameImage{

    NSArray *nameImage = @[@"urbo_center",@"urbo_mall",@"user_profile",@"search-3"];
    NSUInteger randNum = arc4random() % [nameImage count];
    return [nameImage objectAtIndex:randNum];

}

-(CAShapeLayer*)lineDashPattern:(UIView*)cellView{
    
    
//    CAShapeLayer *shapelayer = [CAShapeLayer layer];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    //draw a line
//    [path moveToPoint:CGPointMake(0.0, cell.frame.size.height)]; //add yourStartPoint here
//    [path addLineToPoint:CGPointMake(cell.frame.size.width, cell.frame.size.height)];// add yourEndPoint here
//    UIColor *fill = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f];
//    shapelayer.strokeStart = 0.0;
//    shapelayer.strokeColor = fill.CGColor;
//    shapelayer.lineWidth = 1.0;
//    shapelayer.lineJoin = kCALineJoinRound;
//    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3 ], nil];
//    //    shapelayer.lineDashPhase = 3.0f;
//    shapelayer.path = path.CGPath;
    
    
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.name = @"ArroundLayer";
    border.fillColor = [UIColor clearColor].CGColor;
    
    border.strokeColor = UIColorFromHEX(COLOR_MAIN).CGColor;
//    border.strokeStart = 0.0;
    border.lineWidth = 4;
    border.lineJoin=kCALineJoinRound;
    border.frame = cellView.bounds;
    border.lineDashPattern = @[@8];
    
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointMake(0.0, 0.0)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(cellView.frame.size.width, 0.0)];// add yourEndPoint here

    [path moveToPoint:CGPointMake(0.0, cellView.frame.size.height)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(cellView.frame.size.width, cellView.frame.size.height)];// add yourEndPoint here

    [path moveToPoint:CGPointMake(0.0, 0.0)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(0.0, cellView.frame.size.height)];// add yourEndPoint here

    [path moveToPoint:CGPointMake(cellView.frame.size.width, 0.0)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(cellView.frame.size.width, cellView.frame.size.height)];// add yourEndPoint here
    

 //   path = [UIBezierPath bezierPathWithRoundedRect:cellView.bounds cornerRadius:5.0];
    
    border.path = path.CGPath;
    
  //  border.path = [UIBezierPath bezierPathWithRoundedRect:cellView.bounds cornerRadius:10.0].CGPath;
    
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
