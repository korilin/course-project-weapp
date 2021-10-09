<template>
    <view class="comments">
        <view style="width: 100%; text-align: center">
            <view v-if="userInfo != null">
                <view class="user-wrap">
                    <nut-avatar
                        style="margin-right: 10px"
                        size="40"
                        :icon="userInfo.avatarUrl"
                    />
                    <view class="nick-name">{{ userInfo.nickName }}</view>
                </view>
                <nut-textarea
                    rows="1"
                    style="margin-bottom: 20px"
                    limit-show
                    max-length="200"
                    v-model="content"
                />
                <nut-button type="success" style="z-index" @click="sendComment">
                    发表评论
                </nut-button>
            </view>
            <nut-button v-else type="info" @click="getUserInfo">
                发表评论请先授权
            </nut-button>
            <nut-toast
                :msg="toast.msg"
                v-model:visible="toast.show"
                :type="toast.type"
            />
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
                            moment(comment.timestamp * 1000).format(
                                "YYYY/MM/DD HH:mm:ss"
                            )
                        }}</view>
                        <nut-cell> {{ comment.content }} </nut-cell>
                    </view>
                </view>
                <nut-divider dashed>
                    {{ i == comments.length - 1 ? "到底了" : randomEmoji() }}
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

    created() {
        this.getComments();
    },

    setup() {
        const emojis = [
            "ヾ(≧▽≦*)o",
            "φ(*￣0￣)",
            "q(≧▽≦q)",
            "ψ(｀∇´)ψ",
            "(～￣▽￣)～",
            "( •̀ ω •́ )✧",
            "φ(゜▽゜*)♪",
            "o(*^＠^*)o",
            "(✿◡‿◡)",
            "(*^▽^*)",
            "(❁´◡`❁)",
            "(≧∇≦)ﾉ",
            "(●ˇ∀ˇ●)",
            "╰(*°▽°*)╯",
            "(●'◡'●)",
            "(o゜▽゜)o☆",
            "(oﾟvﾟ)ノ",
            "(≧∀≦)ゞ",
            "o(*^▽^*)┛",
            "( •̀ ω •́ )y",
        ];
        const state = reactive({
            content: "",
            userInfo: null,
            comments: [],
            toast: {
                show: false,
                type: "text",
                msg: "(❁´◡`❁)",
            },
        });

        const randomEmoji = () => {
            return emojis[Math.round(Math.random() * (emojis.length - 1))];
        };

        const getUserInfo = () => {
            Taro.getUserProfile({
                desc: "用于发表评论",
                success: (res) => {
                    state.userInfo = res.userInfo;
                },
            });
        };

        const getComments = () => {
            Taro.request({
                url: "http://localhost:8080/comment/all",
                success: function (res) {
                    state.comments = res.data;
                },
            });
        };

        const sendComment = () => {
            const data = {
                nickName: state.userInfo.nickName,
                avatarUrl: state.userInfo.avatarUrl,
                content: state.content,
            };
            Taro.request({
                url: "http://localhost:8080/comment/new",
                method: "POST",
                data: data,
                success: function (res) {
                    if (res.data) {
                        state.content = "";
                        state.toast.msg = "评论发表成功 (≧∇≦)ﾉ";
                        state.toast.type = "success";
                        state.toast.show = true;
                        getComments();
                    } else {
                        state.toast.msg = "评论失败？原因我也不知道为什么~";
                        state.toast.type = "fail";
                        state.toast.show = true;
                    }
                },
            });
        };

        return {
            ...toRefs(state),
            moment,
            randomEmoji,
            getUserInfo,
            getComments,
            sendComment,
        };
    },
};
</script>

<style lang="scss">
.comments {
    padding: 5vh 5vh;
}

.user-wrap {
    display: flex;
    align-items: flex-end;
    margin-bottom: 12px;
    text-align: left;

    .nick-name {
        font-size: 16px;
    }
}

.comment-wrap {
    display: flex;
    width: 100%;
    margin: 15px 0;

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
