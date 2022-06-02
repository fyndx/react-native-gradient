package com.fyndx.LinearGradient;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;

import androidx.annotation.Nullable;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

public class LinearGradientView extends View {

  public LinearGradientView(Context context) {
    super(context);
  }

  public LinearGradientView(Context context, @Nullable AttributeSet attrs) {
    super(context, attrs);
  }

  public LinearGradientView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
    super(context, attrs, defStyleAttr);
  }

  public void setColors(ReadableArray colors) {
    // TODO: Implement
  }

  public void setLocations(ReadableArray locations) {
    // TODO: Implement
  }
  
  public void setStartPosition(ReadableMap startPos) {
    // TODO: Implement
  }

  public void setEndPosition(ReadableMap endPos) {
    // TODO: Implement
  }

  public void setUseAngle(boolean useAngle) {
    // TODO: Implement
  }

  public void setAngleCenter(ReadableMap angleCenter) {
    // TODO: Implement
  }

  public void setAngle(float angle) {
    // TODO: Implement
  }

  public void setBorderRadii(ReadableArray borderRadii) {
    // TODO: Implement
  }

}