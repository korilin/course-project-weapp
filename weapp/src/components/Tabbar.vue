<template>
    <view style="height: 50px"></view>
    <nut-tabbar
        class="tabbar"
        @tab-switch="switchTab"
        :unactive-color="unselectColor"
        :active-color="selectedColor"
        :visible="visible"
    >
        <template v-for="tab in list" :key="tab.pagaePath">
            <nut-tabbar-item
                :tab-title="tab.text"
                :img="tab.img"
                :activeImg="tab.activeImg"
            ></nut-tabbar-item>
        </template>
    </nut-tabbar>
</template>

<script>
import { reactive, toRefs } from "vue";
import Taro from "@tarojs/taro";
import aboutImg from "../images/about.png";
import aboutImgY from "../images/about-y.png";
import kugImg from "../images/kotlin.png";
import kugImgY from "../images/kotlin-y.png";
import photoImg from "../images/photo.png";
import photoImgY from "../images/photo-y.png";
import commentsImg from "../images/comments.png";
import commentsImgY from "../images/comments-y.png";

export default {
    created() {
        const instance = Taro.getCurrentInstance();
        for (let index = 0; index < this.list.length; index++) {
            const element = this.list[index];
            if (element.pagePath == instance.router.path) {
                this.visible = index;
            }
        }
    },
    setup() {
        const tabs = reactive({
            visible: 0,
            unselectColor: "#7d7e80",
            selectedColor: "#1989fa",
            list: [
                {
                    text: "关于",
                    pagePath: "/pages/info/info",
                    img: aboutImg,
                    activeImg: aboutImgY,
                },
                {
                    text: "KUG",
                    pagePath: "/pages/kug/kug",
                    img: kugImg,
                    activeImg: kugImgY,
                },
                {
                    text: "相册",
                    pagePath: "/pages/photo/photo",
                    img: photoImg,
                    activeImg: photoImgY,
                },
                {
                    text: "评论区",
                    pagePath: "/pages/comments/comments",
                    img: commentsImg,
                    activeImg: commentsImgY,
                },
            ],
        });

        const switchTab = (item, index) => {
            if (tabs.visible != index) {
                Taro.redirectTo({
                    url: tabs.list[index].pagePath,
                });
            }
        };

        return {
            ...toRefs(tabs),
            switchTab,
        };
    },
};
</script>

<style>
.tabbar {
    position: fixed;
    bottom: 0;
}
</style>