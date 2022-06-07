import React, { FC } from "react";
import { processColor } from "react-native";
import type { Props } from "./LinearGradientViewNativeComponent";

const RNLinearGradientView =
  require("./LinearGradientViewNativeComponent").default;

const LinearGradientView: FC<Props> = ({ colors, ...rest }) => {
  return <RNLinearGradientView {...rest} colors={colors.map(processColor)} />;
};
export default LinearGradientView;
