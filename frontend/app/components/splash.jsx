import React, { useCallback, useState } from "react";
import { View, StyleSheet, TouchableHighlight, Text } from "react-native";
import { useFonts } from "expo-font";

const Splash = () => {
    const [state, setState] = useState({
        user: ""
    });

    const [fontsLoaded] = useFonts({
        "IM Fell Double Pica SC": require("../../assets/fonts/IMFellDoublePicaSC-Regular.ttf"),
        "Hurricane": require("../../assets/fonts/Hurricane-Regular.ttf")
    });

    if (!fontsLoaded){
        return null;
    };

    const changeUser = (user) => {
        setState({
            ...state,
            user
        });
    };

    return(
        <View>
            <TouchableHighlight onPress={() => changeUser("player")}>
                <View style={styles.player}>
                    <Text style={styles.playerText}>
                        Players
                    </Text> 
                </View>
            </TouchableHighlight>

            <TouchableHighlight onPress={() => changeUser("team")}>
                <View style={styles.team}>
                    <Text style={styles.teamText}>
                        Teams
                    </Text>
                </View>
            </TouchableHighlight>
        </View>
    );
};

const styles = StyleSheet.create({
    touchables:{
        height: "50vh"
    },
    player: {
        height: "50vh",
        backgroundColor: "white",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
    },
    playerText: {
        fontFamily: "IM Fell Double Pica SC",
        fontSize: "5vh"
    },
    team: {
        height: "50vh",
        backgroundColor: "navy",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
    },
    teamText: {
        fontFamily: "Hurricane",
        fontSize: "7vh",
        color: "white",
    }
});

export default Splash;