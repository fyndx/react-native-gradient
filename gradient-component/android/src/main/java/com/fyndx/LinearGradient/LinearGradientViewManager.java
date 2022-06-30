package com.fyndx.LinearGradient;

import android.graphics.Color;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;
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
  @ReactProp(name = "start")
  public void setStart(LinearGradientView view, @Nullable ReadableMap startPos) {
    view.setStartPosition(startPos);
  }

  @Override
  @ReactProp(name = "end")
  public void setEnd(LinearGradientView view, @Nullable ReadableMap endPos) {
    view.setEndPosition(endPos);
  }

  @Override
  @ReactProp(name = "colors")
  public void setColors(LinearGradientView view, @Nullable ReadableArray colors) {
    view.setColors(colors);
  }

  @Override
  @ReactProp(name = "locations")
  public void setLocations(LinearGradientView view, @Nullable ReadableArray locations) {
    view.setLocations(locations);
  }

  @Override
  @ReactProp(name = "useAngle")
  public void setUseAngle(LinearGradientView view, boolean useAngle) {
    view.setUseAngle(useAngle);
  }

  @Override
  @ReactProp(name = "angleCenter")
  public void setAngleCenter(LinearGradientView view, @Nullable ReadableMap angleCenter) {
    view.setAngleCenter(angleCenter);
  }

  @Override
  @ReactProp(name = "angle")
  public void setAngle(LinearGradientView view, float angle) {
    view.setAngle(angle);
  }
}