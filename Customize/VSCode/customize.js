window.resizeTo(800, 600);

// コンテキストメニューにCSSを適用
var observer = new MutationObserver(records => {
	records.forEach(record => {
		Array.from(record.addedNodes)
			.filter(node => node instanceof Element)
			.forEach(node => {
				var arr;
				if (node.classList.contains("shadow-root-host")) {
					shadowRoot = node.shadowRoot;
					var style = document.createElement("style");
					style.textContent = ".monaco-scrollable-element{border-radius:0px !important}.monaco-scrollable-element .monaco-action-bar.vertical .action-menu-item{border-radius:0px !important;margin:0px !important}.menubar-menu-title{border-radius:0px !important;padding:0px 7px !important}";
					shadowRoot.append(style);
				}
				Array.from(node.querySelectorAll("span[class^='ced-1-TextEditorDecorationType'],span[class*=' ced-1-TextEditorDecorationType']")).forEach(elem => {
					if (Array.from(elem.classList).some(className => /^ced-1-TextEditorDecorationType\d*-3$/.test(className))) {
						elem.classList.add("liveShareCursor");
					} else {
						Array.from(elem.classList).forEach(className => {
							if (/^ced-1-TextEditorDecorationType\d*-4$/.test(className)) {
								elem.classList.add("liveShareLabel");
								// Read-write を RW と略す
								var sheets = document.styleSheets,
									sheet = sheets[sheets.length - 1],
									con = window.getComputedStyle(elem, '::after').getPropertyValue('content');
									sheet.insertRule('.' + className + '::after{content:' + con.replace(/Read-write/g,"RW").replace(/Read-only/g,"RO") + ' !important;}', sheet.cssRules.length);
							}
						});
					}
				})
			});
	});
});

function resizeWindow(){
	// 小数ピクセルを打ち消す方向にmarginを指定してぼやけを解消
	var e = document.getElementsByClassName("action-toolbar-container")[0];
	if (e != undefined) {
		e.style.marginRight = "0px";
		setTimeout(() => {
			e.style.marginRight = (e.getClientRects()[0].x % 1) + "px";
		}, 1);
	}
}
window.onresize = resizeWindow;
setTimeout(() => {
	resizeWindow();
	observer.observe(document.body, {
		childList: true,
		subtree: true
	});
}, 1000);