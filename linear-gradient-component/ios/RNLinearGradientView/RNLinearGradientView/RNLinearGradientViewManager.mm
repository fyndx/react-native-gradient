//
//  RNLinearGradientView.m
//  RNLinearGradientView
//

#import <React/RCTViewManager.h>
#import "RNLinearGradientView.h"


@interface RNLinearGradientViewManager : RCTViewManager
@end

@implementation RNLinearGradientViewManager

RCT_EXPORT_MODULE(LinearGradientView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(colors, NSArray);
RCT_EXPORT_VIEW_PROPERTY(startPoint, CGPoint);
RCT_EXPORT_VIEW_PROPERTY(endPoint, CGPoint);
RCT_EXPORT_VIEW_PROPERTY(locations, NSArray);
RCT_EXPORT_VIEW_PROPERTY(useAngle, BOOL);
RCT_EXPORT_VIEW_PROPERTY(angleCenter, CGPoint);
RCT_EXPORT_VIEW_PROPERTY(angle, CGFloat);

@end
