/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useState} from 'react';
import {
  Button,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  useColorScheme,
  View,
} from 'react-native';

import LinearGradient from 'react-native-fabric-linear-gradient';

import {Colors, Header} from 'react-native/Libraries/NewAppScreen';

function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

// TODO: improve example with options to set props
const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const [colors, setColors] = useState(['#A770EF', '#CF8BF3', '#FDB99B']);

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  const handlePress = () => {
    setColors([getRandomColor(), getRandomColor(), getRandomColor()]);
  };

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <ScrollView
        contentInsetAdjustmentBehavior="automatic"
        style={backgroundStyle}>
        <Header />
        <View
          style={{
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
          }}>
          <LinearGradient
            colors={colors}
            start={{x: 0.0, y: 0.25}}
            end={{x: 0.5, y: 1.0}}
            locations={[0, 0.5, 0.6]}
            style={styles.gradient}
            angle={45}
            angleCenter={{x: 0.5, y: 0.5}}
            useAngle
          />
        </View>
        <Button title={'Generate Random Color'} onPress={handlePress} />
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  gradient: {
    width: 200,
    height: 200,
  },
});

export default App;
