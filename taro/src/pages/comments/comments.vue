<template>
    <view class="comments">
        <view>
            发表你的评论:
            <nut-textarea
                v-if="isLogin"
                rows="2"
                limit-show
                max-length="200"
                v-model="content"
            />
            <nut-button v-else type="info">请先登录</nut-button>
        </view>
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";

export default {
    name: "Comments",
    setup() {
        const state = reactive({
            content: "",
            isLogin: false,
            comments: [
                {
                    nickName: "kori",
                    avatarUrl: "https://korilin.com/korilin.png",
                    content: "你好呀",
                    timestamp: 1633788029,
                },
            ],
        });

        return {
            ...toRefs(state),
        };
    },
};
</script>

<style lang="scss">
.comments {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    padding: 5vh 5vh;
}
</style>
