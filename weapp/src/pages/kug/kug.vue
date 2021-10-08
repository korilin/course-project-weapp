<template>
    <view class="index"> KUG </view>
    <Tabbar />
</template>

<script>
import { reactive, toRefs } from "vue";
import Tabbar from "../../components/Tabbar.vue";

export default {
    name: "KUG",
    components: { Tabbar },
    setup() {
        const state = reactive({});

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
