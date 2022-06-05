//
//  RNLinearGradientView.m
//  RNLinearGradientView
//

// This guard prevent the code from being compiled in the old architecture
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNLinearGradientView.h"
#import "LinearGradientLayer.h"

#import <react/renderer/components/RNLinearGradientViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNLinearGradientViewSpec/EventEmitters.h>
#import <react/renderer/components/RNLinearGradientViewSpec/Props.h>
#import <react/renderer/components/RNLinearGradientViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RNLinearGradientView () <RCTLinearGradientViewViewProtocol>

@end

@implementation RNLinearGradientView {
  UIView * _view;
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
    
    _view = [[UIView alloc] init];
    
    self.contentView = _view;
  }
  
  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<LinearGradientViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<LinearGradientViewProps const>(props);
  
  if(oldViewProps.colors == newViewProps.colors) {
    // update gradient
  }
  
  //    if (oldViewProps.color != newViewProps.color) {
  //        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
  //        [_view setBackgroundColor:[self hexStringToColor:colorToConvert]];
  //    }
  
  [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> LinearGradientViewCls(void)
{
  return RNLinearGradientView.class;
}

@end
#endif
