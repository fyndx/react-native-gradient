package com.fyndx.LinearGradient;

import android.graphics.Color;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.module.annotations.ReactModule;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewManagerDelegate;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.viewmanagers.LinearGradientViewManagerDelegate;
import com.facebook.react.viewmanagers.LinearGradientViewManagerInterface;

@ReactModule(name = LinearGradientViewManager.NAME)
public class LinearGradientViewManager extends SimpleViewManager<LinearGradientView>
    implements LinearGradientViewManagerInterface<LinearGradientView> {

  public static final String NAME = "LinearGradientView";

  private final ViewManagerDelegate<LinearGradientView> mDelegate;

  public LinearGradientViewManager(ReactApplicationContext reactContext) {
    mDelegate = new LinearGradientViewManagerDelegate<>(this);
  }

  @Nullable
  @Override
  protected ViewManagerDelegate<LinearGradientView> getDelegate() {
    return mDelegate;
  }

  @NonNull
  @Override
  public String getName() {
    return NAME;
  }

  @Override
  public LinearGradientView createViewInstance(@NonNull ThemedReactContext context) {
    return new LinearGradientView(context);
  }

  @Override
  @ReactProp(name = PROP_COLORS)
  public void setColors(LinearGradientView gradientView, ReadableArray colors) {
    gradientView.setColors(colors);
  }

  @Override
  @ReactProp(name = PROP_LOCATIONS)
  public void setLocations(LinearGradientView gradientView, ReadableArray locations) {
    if (locations != null) {
      gradientView.setLocations(locations);
    }
  }

  @Override
  @ReactProp(name = PROP_START_POS)
  public void setStartPosition(LinearGradientView gradientView, ReadableArray startPos) {
    gradientView.setStartPosition(startPos);
  }

  @Override
  @ReactProp(name = PROP_END_POS)
  public void setEndPosition(LinearGradientView gradientView, ReadableArray endPos) {
    gradientView.setEndPosition(endPos);
  }

  @Override
  @ReactProp(name = PROP_USE_ANGLE, defaultBoolean = false)
  public void setUseAngle(LinearGradientView gradientView, boolean useAngle) {
    gradientView.setUseAngle(useAngle);
  }

  @Override
  @ReactProp(name = PROP_ANGLE_CENTER)
  public void setAngleCenter(LinearGradientView gradientView, ReadableArray in) {
    gradientView.setAngleCenter(in);
  }

  @Override
  @ReactProp(name = PROP_ANGLE, defaultFloat = 45.0f)
  public void setAngle(LinearGradientView gradientView, float angle) {
    gradientView.setAngle(angle);
  }

  // TODO: verify if this is still necessary
  // temporary solution until following issue is resolved:
  // https://github.com/facebook/react-native/issues/3198
  @Override
  @ReactProp(name = PROP_BORDER_RADII)
  public void setBorderRadii(LinearGradientView gradientView, ReadableArray borderRadii) {
    gradientView.setBorderRadii(borderRadii);
  }

}