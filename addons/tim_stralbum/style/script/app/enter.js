define("script/app/index/enter", ["script/tools/tools.js", "script/app/index/main"],
function(a, b, c) {
    function d() {
        var a = ["page_index", "page_list", "page_zk_list", "page_recommend", "page_detail", "page_yy_detail", "page_player"],
        b = "";
        for (var c in a) ! f("#" + a[c]).length > 0 && (b += "<div id='" + a[c] + "' class='pagemode' style=' z-index: 2; display: none;'></div>");
        f("#page")[0].innerHTML += b
    }
    function e() {
        for (var a = "",
        b = "",
        c = window.location.search.split("&"), e = 0; e < c.length; e++) c[e].indexOf("id=") > -1 && localStorage.setItem("openid", c[e].split("=")[1]),
        c[e].indexOf("contenturl=") > -1 && (a = c[e].substr(12, c[e].length)),
        c[e].indexOf("listurl=") > -1 && (b = decodeURIComponent(c[e].split("=")[1])),
        c[e].indexOf("devicetoken=") > -1 && localStorage.setItem("devicetoken", c[e].split("=")[1]);
        if (d(), "" != window.location.hash && -1 == window.location.hash.indexOf("#page_index") && -1 == window.location.hash.indexOf("#weichat_redirect") || window.location.search.indexOf("contenturl=") > -1) {
            try {
                g.requestData(server_path + index_url,
                function(b) {
                    for (var c = decodeURIComponent(window.location.hash), d = c.substring(c.indexOf("{"), c.lastIndexOf("}") + 1), e = JSON.parse(decodeURIComponent(d)), f = 0; f < b.channels.length; f++) {
                        if ("enterprise" == b.channels[f].channelPath) {
                            myApp.appName = b.channels[f].name,
                            myApp.titleName = b.channels[f].extendedAttr.title,
                            myApp.downloadurl = b.channels[f].extendedAttr.download;
                            var g = document.getElementById("myaudio");
                            g.src = image_path + b.channels[f].extendedAttr.attachments.split(";;")[1]
                        }
                        2 == b.channels[f].extendedAttr.tplChannel && i.initLoopData(b.channels[f])
                    }
                    a.length > 0 ? (e = {
                        title: "详情",
                        name: "#page_detail",
                        url: server_path + a
                    },
                    h.pageSwitch(e), h.saveState(e.title, e.name, e.url, 1), h.hideAddressBar()) : (h.pageSwitch(e), h.initMoreMenu(b.channels))
                },
                function() {
                    h.showDialogTips("信息请求失败")
                })
            } catch(f) {
                window.location.href = "index.html"
            }
        } else i.init(0)
    }
    var f = a("script/tools/sizzle.js"),
    g = a("script/tools/ajax.js"),
    h = a("script/app/common/common.js"),
    i = a("script/app/index/main");
    c.exports = {
        init: function() {
            e()
        }
    }
});