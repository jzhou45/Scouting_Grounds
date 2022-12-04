import { StatusBar } from 'expo-status-bar';
import { SafeAreaView, StyleSheet, Text, View } from 'react-native';
import { Provider } from 'react-native-paper';
import FrontendScreen from './app/screens/FrontendScreens';

export default function App() {
  return (
    <Provider>
      <SafeAreaView>
        <FrontendScreen/>
      </SafeAreaView>
    </Provider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
