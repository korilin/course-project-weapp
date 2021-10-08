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
            <nut-divider class="divider" content-position="left"
                >个人信息</nut-divider
            >
            <template v-for="(v, k, i) in info" :key="i">
                <nut-cell :title="k" :desc="v"></nut-cell>
            </template>
        </view>

        <view class="tags">
            <nut-divider class="divider" content-position="left"
                >技术标签</nut-divider
            >
            <template v-for="(v, i) in tags" :key="i">
                <nut-tag round class="item" :color="randomTagColor()">
                    {{ v }}
                </nut-tag>
            </template>
        </view>

        <Tabbar/>
    </view>
</template>

<script>
import { reactive, toRefs } from "vue";
import Tabbar from "../../components/Tabbar.vue";

export default {
    name: "Info",
    components: { Tabbar },
    setup() {
        const data = reactive({
            info: {
                姓名: "林洁彬 / Kori Lin",
                学号: "201835020822_18级软工8班",
                在校部门: "校易班学生工作站技术部部长",
                "Personal Blog": "https://korilin.com",
                "GitHub Link": "https://github.com/korilin",
                Email: "korilin.dev@gmail.com",
                微信公众号: "Tech Kori",
                社区建设: "深圳 Kotlin User Group 组织者",
            },
            tags: [
                "Java",
                "Python",
                "Kotlin",
                "Android",
                "Jetpack",
                "Spring Boot",
                "Ktor",
                "MySQL",
                "Vue 2.0",
                "Vue 3.0",
                "Vue CLI",
                "Taro",
                "Flask",
                "Nginx",
            ],
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
