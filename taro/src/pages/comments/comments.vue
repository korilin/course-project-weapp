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
                    <view :class="likes.includes(comment.commentId) ? 'like is-like' : 'like'" @click="changeLike(i, !likes.includes(comment.commentId))">
                        <nut-icon name="fabulous" />
                        <text class="text"> {{ comment.like }}</text>
                    </view>
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
import { baseUrl } from "../../utils";

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
            likes: [],
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
                desc: "用于发表评论&点赞",
                success: (res) => {
                    state.userInfo = res.userInfo;
                    Taro.request({
                        url: baseUrl + "/api/20211001/comment/myLikes?nickName=" + state.userInfo.nickName,
                        success: function (res) {
                            state.likes = res.data;
                        },
                    });
                },
            });
        };

        const getComments = () => {
            Taro.request({
                url: baseUrl + "/api/20211001/comment/all",
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
                url: baseUrl + "/api/20211001/comment/new",
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

        const changeLike = (index, newStatus) => {
            if (state.userInfo == null) {
                getUserInfo();
            } else {
                const commentId = state.comments[index].commentId;
                Taro.request({
                    url: baseUrl + "/api/20211001/comment/changeLike",
                    method: "POST",
                    data: {
                        commentId: commentId,
                        nickName: state.userInfo.nickName,
                        newStatus: newStatus,
                    },
                    success: function (res) {
                        if (newStatus) {
                            state.toast.msg = "点赞成功";
                            state.toast.type = "success";
                            state.toast.show = true;
                            state.comments[index].like += 1;
                            state.likes.push(commentId);
                        } else {
                            state.comments[index].like -= 1;
                            state.likes.splice(index, 1);
                        }
                    },
                });
            }
        };

        return {
            ...toRefs(state),
            moment,
            randomEmoji,
            getUserInfo,
            getComments,
            sendComment,
            changeLike,
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
    position: relative;

    .like {
        position: absolute;
        top: 10px;
        right: 10px;
        color: #ccc;
        font-size: 16px;
        line-height: 40rpx;

        .text {
            position: relative;
            margin-left: 5px;
            top: -4px;
        }
    }

    .is-like {
        color: #fa2c19 !important;
    }

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
