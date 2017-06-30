//
//  LoginViewController.m
//  LineDashPattern
//
//  Created by Андрей on 29.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "LoginViewController.h"
#import "Constatns.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UIView *login;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHEX(COLOR_MAIN);
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    self.login.layer.cornerRadius = 10.0f;
    [self removeLayerByName:@"ArroundLayer" view:self.login];
    [self.login.layer addSublayer:[self lineDashPattern:self.login]];

}

-(CAShapeLayer*)lineDashPattern:(UIView*)cellView{
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.name = @"ArroundLayer";
    border.fillColor = [UIColor clearColor].CGColor;
    border.strokeColor = UIColorFromHEX(COLOR_MAIN).CGColor;
    border.strokeStart = 0.0;
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
