<template>
    <view class="index"> comment </view>
</template>

<script>
import { reactive, toRefs } from "vue";

export default {
    name: "Comments",
    setup() {
        const state = reactive({
            msg: "欢迎来到 korilin 的小程序",
        });

        return {
            ...toRefs(state),
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

    .msg {
        margin-top: 5vh;
        font-size: 20px;
        font-weight: bold;
    }

    .btn {
        margin-top: 5vh;
    }
}
</style>
