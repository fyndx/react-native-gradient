//
//  RNLinearGradientView.m
//  RNLinearGradientView
//

// This guard prevent the code from being compiled in the old architecture
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNLinearGradientView.h"
#import "LinearGradientLayer.h"

#import <React/RCTConversions.h>
#import <React/RCTConvert.h>
#import <react/renderer/components/rnx-gradient/ComponentDescriptors.h>
#import <react/renderer/components/rnx-gradient/EventEmitters.h>
#import <react/renderer/components/rnx-gradient/Props.h>
#import <react/renderer/components/rnx-gradient/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RNLinearGradientView () <RCTLinearGradientViewViewProtocol>

@end

@implementation RNLinearGradientView {
  UIView * _view;
  LinearGradientLayer * layer;
}

+ (Class)layerClass {
  return [LinearGradientLayer class];
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<LinearGradientViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const LinearGradientViewProps>();
    _props = defaultProps;
    
    layer = (LinearGradientLayer *)self.layer;
    _view = [[UIView alloc] init];
    
    self.contentView = _view;
  }
  
  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<LinearGradientViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<LinearGradientViewProps const>(props);
  
  if(oldViewProps.start.x != newViewProps.start.x || oldViewProps.start.y != newViewProps.start.y) {
    layer.startPoint = CGPointMake(newViewProps.start.x, newViewProps.start.y);
  }
  
  if(oldViewProps.end.x != newViewProps.end.x || oldViewProps.end.y != newViewProps.end.y) {
    layer.endPoint = CGPointMake(newViewProps.end.x, newViewProps.end.y);
  }
  
  
  if(oldViewProps.useAngle != newViewProps.useAngle) {
    layer.useAngle = newViewProps.useAngle;
  }
  
  if(oldViewProps.angle != newViewProps.angle) {
    layer.angle = CGFloat(newViewProps.angle);
  }
  
  if(oldViewProps.angleCenter.x != newViewProps.angleCenter.x || oldViewProps.angleCenter.y != newViewProps.angleCenter.y) {
    layer.angleCenter = CGPointMake(newViewProps.angleCenter.x, newViewProps.angleCenter.y);
  }
  
  NSArray<NSNumber *> *locations = convertCxxVectorNumberToNsArrayNumber(newViewProps.locations);
  layer.locations = locations;
  
  // We cannot compare SharedColor because it is shared value.
  // We could compare color value, but it is more performant to just assign new value
  NSArray<UIColor *> *colors = convertCxxVectorColorsToNSArrayColors(newViewProps.colors);
  [self setColors:colors];
  
  [super updateProps:props oldProps:oldProps];
}

- (void)setColors:(NSArray<UIColor *>*)colorStrings
{
  NSMutableArray *colors = [NSMutableArray arrayWithCapacity:colorStrings.count];
  for (NSString *colorString in colorStrings)
  {
    if ([colorString isKindOfClass:UIColor.class])
    {
      [colors addObject:(UIColor *)colorString];
    }
    else
    {
      [colors addObject:[RCTConvert UIColor:colorString]];
    }
  }
  layer.colors = colors;
}

static NSArray<UIColor *> *convertCxxVectorColorsToNSArrayColors(const std::vector<facebook::react::SharedColor> &colors)
{
  size_t size = colors.size();
  NSLog(@"%zu", size);
  NSMutableArray *result = [NSMutableArray new];
  for(size_t i = 0; i < size; i++) {
    UIColor *color = RCTUIColorFromSharedColor(colors[i]);
    [result addObject:color];
  }
  return [result copy];
}


static NSArray<NSNumber *> *convertCxxVectorNumberToNsArrayNumber(const std::vector<Float> &value)
{
  size_t size = value.size();
  NSMutableArray *result = [NSMutableArray new];
  for(size_t i = 0; i < size; i++) {
    NSNumber *number = @(value[i]);
    [result addObject:number];
  }
  return [result copy];
}

Class<RCTComponentViewProtocol> LinearGradientViewCls(void)
{
  return RNLinearGradientView.class;
}

@end
#endif
