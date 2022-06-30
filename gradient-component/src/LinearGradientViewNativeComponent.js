// @flow
import type { ViewProps } from "react-native/Libraries/Components/View/ViewPropTypes";
import type { HostComponent } from "react-native";
import type { Float } from "react-native/Libraries/Types/CodegenTypes";
import type { ColorValue } from "react-native/Libraries/StyleSheet/StyleSheet";
import { ViewStyle } from "react-native";
import codegenNativeComponent from "react-native/Libraries/Utilities/codegenNativeComponent";

export type Point = $ReadOnly<{| x: Float, y: Float |}>;

type NativeProps = $ReadOnly<{|
  ...ViewProps,
  start?: Point,
  end?: Point,
  colors: $ReadOnlyArray<ColorValue>,
  locations?: $ReadOnlyArray<Float>,
  useAngle?: boolean,
  angleCenter?: Point,
  angle?: Float,
|}>;

export default (codegenNativeComponent<NativeProps>(
  "LinearGradientView"
): HostComponent<NativeProps>);
