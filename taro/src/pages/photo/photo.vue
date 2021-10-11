<template>
    <view class="photo">
        <template v-for="photo in photos" :key="photo.url">
            <view class="title"> {{ photo.title }} </view>
            <nut-cell round-radius="15" @click="showPreview(photo.url)">
                <img class="mini-img" mode="widthFix" :src="photo.url" />
                <view class="desc">
                    {{ photo.description }}
                </view>
            </nut-cell>
        </template>
        <nut-overlay v-model:visible="isShowPreview" :z-index="2000">
            <view class="wrapper">
                <img width="100vw" mode="widthFix" :src="previewImg" />
            </view>
        </nut-overlay>
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";
import Taro from "@tarojs/taro";

export default {
    name: "Photo",
    created() {
        var that = this;
        Taro.request({
            url: "https://korilin.com/api/20211001/kori/photos",
            success: function (res) {
                that.photos = res.data;
            },
        });
    },
    setup() {
        const state = reactive({
            isShowPreview: false,
            previewImg: "",
            photos: [],
        });

        const showPreview = (url) => {
            state.previewImg = url;
            state.isShowPreview = true;
        };

        return {
            ...toRefs(state),
            showPreview,
        };
    },
};
</script>

<style lang="scss">
.photo {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: left;
    padding: 2vh 8vw;

    .mini-img {
        width: 40vw;
        border-radius: 15px;
    }

    .desc {
        margin-left: 5vw;
        width: 40vw;
        font-size: 15px;
        color: #808080;
    }

    .title {
        font-size: 18px;
        margin-top: 5vh;
        padding-left: 15px;
    }

    .wrapper {
        height: 100vh;
        display: flex;
        align-items: center;
    }
}
</style>
