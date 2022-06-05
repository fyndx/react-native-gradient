//
//  LinearGradientLayer.h
//  RNLinearGradientView
//

#ifndef LinearGradientLayer_h
#define LinearGradientLayer_h

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@class UIColor;

@interface LinearGradientLayer : CALayer

@property(nullable, nonatomic, copy) NSArray<UIColor *> *colors;
@property(nullable, nonatomic, copy) NSArray<NSNumber *> *locations;
@property(nonatomic) CGPoint startPoint;
@property(nonatomic) CGPoint endPoint;
@property(nonatomic) BOOL useAngle;
@property(nonatomic) CGPoint angleCenter;
@property(nonatomic) CGFloat angle;

@end

#endif /* LinearGradientLayer_h */
