export default {
    pages: [
        "pages/index/index",
        "pages/info/info",
        "pages/kug/kug",
        "pages/photo/photo",
        "pages/comments/comments",
    ],
    tabBar: {
        color: "#7d7e80",
        selectedColor: "#1989fa",
        borderStyle: "white",
        list: [
            {
                text: "关于",
                pagePath: "pages/info/info",
                iconPath: "images/about.png",
                selectedIconPath: "images/about-y.png",
            },
            {
                text: "KUG",
                pagePath: "pages/kug/kug",
                iconPath: "images/kotlin.png",
                selectedIconPath: "images/kotlin-y.png",
            },
            {
                text: "相册",
                pagePath: "pages/photo/photo",
                iconPath: "images/photo.png",
                selectedIconPath: "images/photo-y.png",
            },
            {
                text: "评论区",
                pagePath: "pages/comments/comments",
                iconPath: "images/comments.png",
                selectedIconPath: "images/comments-y.png",
            },
        ],
    },
    window: {
        backgroundTextStyle: "light",
        navigationBarBackgroundColor: "#f7f8fa",
        navigationBarTitleText: "WeChat",
        navigationBarTextStyle: "black",
    },
};
