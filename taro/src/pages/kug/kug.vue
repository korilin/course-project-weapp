<template>
    <web-view v-if="isShowWebView" :src="webViewSrc" />
    <view v-else class="kug">
        <nut-cell-group :title="groupTitle">
            <nut-cell
                title="访问深圳 Kotlin User Group 主页"
                @click="showShenzhenKUGPage"
                is-link
            />
            <nut-cell
                title="Visit Kotlin User Group List"
                @click="showKUGListPage"
                is-link
            />
        </nut-cell-group>

        <nut-divider style="margin: 6vh auto">往期网络研讨会</nut-divider>

        <nut-cell
            v-for="seminar in seminars"
            :key="seminar.url"
            is-link
            @click="showWebView(seminar.pageUrl)"
        >
            <view class="video">
                <img class="preview" mode="widthFix" :src="seminar.imgUrl" />
                <view class="title">{{ seminar.title }}</view>
                <view class="desc"> {{ seminar.description }} </view>
                <view class="source"> {{ seminar.source }} </view>
            </view>
        </nut-cell>
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";
import Taro from "@tarojs/taro";

export default {
    name: "KUG",

    created() {
        var that = this;
        Taro.request({
            url: "https://korilin.com/api/20211001/kori/seminars",
            success: function (res) {
                that.seminars = res.data;
            },
        });
    },

    onHide() {
        this.isShowWebView = false;
        this.webViewSrc = "";
    },

    setup() {
        const state = reactive({
            isShowWebView: false,
            webViewSrc: "",
            groupTitle:
                "Hi，我是 Shenzhen Kotlin User Group 的组织者 Kori，如果你对 Kotlin 有兴趣可以通过以下页面来了解我们",

            seminars: [],
        });

        const showWebView = (url) => {
            state.webViewSrc = url;
            state.isShowWebView = true;
        };

        const showShenzhenKUGPage = () => {
            showWebView("https://korilin.com/KUGshenzhen/");
        };

        const showKUGListPage = () => {
            showWebView(
                "https://kotlinlang.org/user-groups/user-group-list.html"
            );
        };

        return {
            ...toRefs(state),
            showWebView,
            showShenzhenKUGPage,
            showKUGListPage,
        };
    },
};
</script>

<style lang="scss">
.kug {
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    padding: 2vh 10vw;
}

.video {
    margin: auto;

    .preview {
        width: 100%;
        display: inline-block;
    }

    .title {
        color: black;
        font-size: 18px;
        font-weight: bold;
        margin: 15px auto;
    }

    .desc {
        margin: auto;
    }

    .source {
        margin-top: 15px;
        color: #ccc;
    }
}
</style>
