// @flow
import type { ViewProps } from "react-native/Libraries/Components/View/ViewPropTypes";
import type { HostComponent } from "react-native";
import { ViewStyle } from "react-native";
import codegenNativeComponent from "react-native/Libraries/Utilities/codegenNativeComponent";

type NativeProps = $ReadOnly<{|
  ...ViewProps,
  start?: Point,
  end?: Point,
  colors: $ReadOnlyArray<string>,
  locations?: $ReadOnlyArray<number>,
  useAngle?: boolean,
  angleCenter?: Point,
  angle?: number,
|}>;

export default (codegenNativeComponent<NativeProps>(
  "LinearGradientView"
): HostComponent<NativeProps>);
