<template>
    <view class="info">
        <view>
            <img
                width="24vw"
                height="24vw"
                src="https://korilin.com/korilin.png"
                alt="korilin"
            />
        </view>

        <view class="desc">
            <nut-cell-group title="个人信息">
                <template v-for="item in info" :key="item.sort">
                    <nut-cell :title="item.key" :desc="item.value"></nut-cell>
                </template>
            </nut-cell-group>
        </view>

        <view class="tags">
            <nut-divider class="divider" content-position="left"
                >技术标签</nut-divider
            >
            <template v-for="item in tags" :key="item.sort">
                <nut-tag round class="item" :color="randomTagColor()">
                    {{ item.tag }}
                </nut-tag>
            </template>
        </view>
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";
import Taro from "@tarojs/taro";

export default {
    name: "Info",

    created() {
        var that = this;
        Taro.request({
            url: "http://localhost:8080/kori/info",
            success: function (res) {
                that.info = res.data;
            },
        });
        Taro.request({
            url: "http://localhost:8080/kori/tags",
            success: function (res) {
                that.tags = res.data;
            },
        });
    },

    setup() {
        const data = reactive({
            info: [],
            tags: [],
        });

        const tagColor = [
            "#f44336",
            "#e91e63",
            "#3f51b5",
            "#2196f3",
            "#03a9f4",
            "#00bcd4",
            "#009688",
            "#4caf50",
            "#ffc107",
            "#ff9800",
            "#607d8b",
        ];

        const randomTagColor = () => {
            return tagColor[Math.round(Math.random() * (tagColor.length - 1))];
        };

        return {
            ...toRefs(data),
            randomTagColor,
        };
    },
};
</script>

<style lang="scss">
.info {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    padding: 5vh 0;

    .divider {
        margin: 4vh 0 3vh;
    }

    .desc,
    .tags {
        width: 75%;
        font-size: 17px;
        margin: 5vh auto;
        text-align: left;
    }

    .tags {
        font-size: 18px;
    }

    .item {
        margin: 0 8px;
    }
}
</style>
