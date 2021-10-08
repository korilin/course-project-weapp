<template>
    <view class="index"> photo </view>
    <Tabbar />
</template>

<script>
import { reactive, toRefs } from "vue";
import Tabbar from "../../components/Tabbar.vue";

export default {
    name: "Photo",
    components: { Tabbar },
    setup() {
        const state = reactive({
            msg: "欢迎来到 korilin 的小程序",
        });

        const handleClick = (type, msg, cover = false) => {
            state.show = true;
            state.msg2 = msg;
            state.type = type;
            state.cover = cover;
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
