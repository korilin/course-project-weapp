<template>
    <view class="comments">
        <view>
            <view style="font-size: 14px; margin-bottom: 10px">
                发表你的评论：
            </view>
            <view style="text-align: center; width: 100%">
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
        <nut-divider style="margin: 15px 0">大家的留言</nut-divider>
        <view>
            <view v-for="(comment, i) in comments" :key="comment.commentId">
                <view class="comment-wrap">
                    <view class="info">
                        <nut-avatar size="40" :icon="comment.avatarUrl" />
                    </view>
                    <view class="content">
                        <view class="nick-name">{{ comment.nickName }}</view>
                        <view class="time">{{
                            moment(comment.timestamp).format(
                                "YYYY/MM/DD HH:mm:ss"
                            )
                        }}</view>
                        <nut-cell> {{ comment.content }} </nut-cell>
                    </view>
                </view>
                <nut-divider dashed>
                    {{ i == comments.length - 1 ? "到底了" : "⚪" }}
                </nut-divider>
            </view>
        </view>
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";
import Taro from "@tarojs/taro";
import moment from "moment";

export default {
    name: "Comments",
    setup() {
        const state = reactive({
            content: "",
            isLogin: false,
            comments: [
                {
                    commentId: 0,
                    nickName: "kori",
                    avatarUrl: "https://korilin.com/korilin.png",
                    content: "你好呀",
                    timestamp: 1633788029,
                },
                {
                    commentId: 1,
                    nickName: "kori",
                    avatarUrl: "https://korilin.com/korilin.png",
                    content: "你好呀",
                    timestamp: 1633788029,
                },
            ],
        });

        return {
            ...toRefs(state),
            moment,
        };
    },
};
</script>

<style lang="scss">
.comments {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    padding: 5vh 5vh;
}

.comment-wrap {
    display: flex;
    width: 100%;
    margin: 18px 0;

    .info {
        width: 40px;
    }

    .content {
        width: 100%;
        padding-left: 20px;

        .nick-name {
            color: black;
            font-size: 16px;
            margin-top: 5px;
        }

        .time {
            color: #ccc;
            font-size: 12px;
            margin-top: 3px;
        }
    }
}
</style>
