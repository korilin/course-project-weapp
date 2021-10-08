<template>
    <view class="index">
        <view>
            <img
                width="50vw"
                height="50vw"
                src="https://korilin.com/korilin.png"
                alt="korilin"
            />
        </view>
        <view class="msg1">{{ msg1 }}</view>
        <view class="msg2">{{ msg2 }}</view>
        <view class="btn">
            <nut-button type="info" @click="handleClick()">
                点击进入主页
            </nut-button>
        </view>
        <Tabbar :visible="0" />
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";
import Taro from "@tarojs/taro";

export default {
    name: "Index",
    setup() {
        const state = reactive({
            msg1: "Welcome! I'm Kori Lin.",
            msg2: "林洁彬的城院生活",
        });

        const handleClick = () => {
            Taro.switchTab({
                url: "/pages/info/info",
            });
        };

        return {
            ...toRefs(state),
            handleClick,
        };
    },
};
</script>

<style lang="scss">
.index {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    padding: 5vh 0;

    .msg1 {
        margin-top: 5vh;
        font-size: 20px;
        font-weight: bold;
    }

    .msg2 {
        font-size: 18px;
        margin-top: 3vh;
    }

    .btn {
        margin-top: 5vh;
    }
}
</style>
