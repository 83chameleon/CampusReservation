/**
 * Created by giligiliai on 2017/11/20.
 */

//modal plugin
(function(window){function classReg(className){return new RegExp("(^|\\s+)"+className+"(\\s+|$)")}var hasClass,addClass,removeClass;if("classList" in document.documentElement){hasClass=function(elem,c){return elem.classList.contains(c)};addClass=function(elem,c){elem.classList.add(c)};removeClass=function(elem,c){elem.classList.remove(c)}}else{hasClass=function(elem,c){return classReg(c).test(elem.className)};addClass=function(elem,c){if(!hasClass(elem,c)){elem.className=elem.className+" "+c}};removeClass=function(elem,c){elem.className=elem.className.replace(classReg(c)," ")}}function toggleClass(elem,c){var fn=hasClass(elem,c)?removeClass:addClass;fn(elem,c)}var classie={hasClass:hasClass,addClass:addClass,removeClass:removeClass,toggleClass:toggleClass,has:hasClass,add:addClass,remove:removeClass,toggle:toggleClass};if(typeof define==="function"&&define.amd){define(classie)}else{window.classie=classie}})(window);var ModalEffects=(function(){function init(){var overlay=document.querySelector(".md-overlay");[].slice.call(document.querySelectorAll(".md-trigger")).forEach(function(el,i){var modal=document.querySelector("#"+el.getAttribute("data-modal")),close=modal.querySelector(".md-close");function removeModal(hasPerspective){classie.remove(modal,"md-show");if(hasPerspective){classie.remove(document.documentElement,"md-perspective")}}function removeModalHandler(){removeModal(classie.has(el,"md-setperspective"))}el.addEventListener("click",function(ev){classie.add(modal,"md-show");overlay.removeEventListener("click",removeModalHandler);overlay.addEventListener("click",removeModalHandler);if(classie.has(el,"md-setperspective")){setTimeout(function(){classie.add(document.documentElement,"md-perspective")},25)}});close.addEventListener("click",function(ev){ev.stopPropagation();removeModalHandler()})})}init()})();

//评分插件
!function(t){var e,a;return a="undefined"!=typeof window&&null!==window?window:global,a.BarRating=e=function(){function e(){var e=this,a=function(){var a=[e.options.wrapperClass];""!==e.options.theme&&a.push("br-theme-"+e.options.theme),e.$elem.wrap(t("<div />",{"class":a.join(" ")}))},n=function(){e.$elem.unwrap()},r=function(){var a;return a=e.options.initialRating?t('option[value="'+e.options.initialRating+'"]',e.$elem):t("option:selected",e.$elem)},i=function(){var t=r();e.$elem.data("barrating",{userOptions:e.options,currentRatingValue:t.val(),currentRatingText:t.data("html")?t.data("html"):t.text(),originalRatingValue:t.val(),originalRatingText:t.data("html")?t.data("html"):t.text()}),e.$elem.data("barrating").deselectable=e.$elem.find("option:first").val()?!1:!0},s=function(){e.$elem.removeData("barrating")},l=function(){var a=t("<div />",{"class":"br-widget"});return e.$elem.find("option").each(function(){var n,r,i,s,l;n=t(this).val(),n&&(r=t(this).text(),i=t(this).data("html"),i&&(r=i),s=t("<a />",{href:"#","data-rating-value":n,"data-rating-text":r}),l=t("<span />",{html:e.options.showValues?r:""}),a.append(s.append(l)))}),e.options.showSelectedRating&&a.append(t("<div />",{text:"","class":"br-current-rating"})),e.options.reverse&&a.addClass("br-reverse"),e.options.readonly&&a.addClass("br-readonly"),a},o=function(){return e.options.reverse?"nextAll":"prevAll"},u=function(t){e.$elem.find('option[value="'+t+'"]').prop("selected",!0),e.$elem.change()},d=function(t){t=t?t:e.$elem.data("barrating").currentRatingText,e.options.showSelectedRating&&e.$elem.parent().find(".br-current-rating").text(t)},c=function(t){t.find("a").removeClass("br-selected br-current"),t.find('a[data-rating-value="'+e.$elem.data("barrating").currentRatingValue+'"]').addClass("br-selected br-current")[o()]().addClass("br-selected")},g=function(a){a.on("click",function(n){var r,i,s=t(this);return n.preventDefault(),a.removeClass("br-active br-selected"),s.addClass("br-selected")[o()]().addClass("br-selected"),r=s.attr("data-rating-value"),i=s.attr("data-rating-text"),s.hasClass("br-current")&&e.$elem.data("barrating").deselectable?(s.removeClass("br-selected br-current")[o()]().removeClass("br-selected br-current"),r="",i=""):(a.removeClass("br-current"),s.addClass("br-current")),e.$elem.data("barrating").currentRatingValue=r,e.$elem.data("barrating").currentRatingText=i,u(r),d(i),e.options.onSelect.call(this,e.$elem.data("barrating").currentRatingValue,e.$elem.data("barrating").currentRatingText),!1})},h=function(e){e.on({mouseenter:function(){var a=t(this);e.removeClass("br-active br-selected"),a.addClass("br-active")[o()]().addClass("br-active"),d(a.attr("data-rating-text"))}})},b=function(t,e){e.on({mouseleave:function(){t.removeClass("br-active"),d(),c(e)}})},f=function(e){e.on("touchstart",function(e){e.preventDefault(),e.stopPropagation(),t(this).click()})},m=function(t){t.on("click",function(t){t.preventDefault()})};this.show=function(){var t,n;e.$elem.data("barrating")||(a(),i(),t=l(),t.insertAfter(e.$elem),c(t),d(),n=t.find("a"),e.options.fastClicks&&f(n),e.options.readonly?m(n):(g(n),h(n),b(n,t)),e.$elem.hide())},this.set=function(t){this.$elem.find('option[value="'+t+'"]').val()&&(this.$elem.data("barrating").currentRatingValue=t,this.$elem.data("barrating").currentRatingText=this.$elem.find('option[value="'+t+'"]').text(),u(this.$elem.data("barrating").currentRatingValue),d(this.$elem.data("barrating").currentRatingText),c(this.$widget),this.$elem.data("barrating").userOptions.onSelect.call(this,this.$elem.data("barrating").currentRatingValue,this.$elem.data("barrating").currentRatingText))},this.clear=function(){this.$elem.data("barrating").currentRatingValue=this.$elem.data("barrating").originalRatingValue,this.$elem.data("barrating").currentRatingText=this.$elem.data("barrating").originalRatingText,u(this.$elem.data("barrating").currentRatingValue),d(this.$elem.data("barrating").currentRatingText),c(this.$widget),this.$elem.data("barrating").userOptions.onClear.call(this,this.$elem.data("barrating").currentRatingValue,this.$elem.data("barrating").currentRatingText)},this.destroy=function(){var t=this.$elem.data("barrating").currentRatingValue,e=this.$elem.data("barrating").currentRatingText,a=this.$elem.data("barrating").userOptions;this.$widget.off().remove(),s(),n(),this.$elem.show(),a.onDestroy.call(this,t,e)}}return e.prototype.init=function(e,a){return this.$elem=t(a),this.options=t.extend({},t.fn.barrating.defaults,e),this.options},e}(),t.fn.barrating=function(a,n){return this.each(function(){var r=new e;if(t(this).is("select")||t.error("Sorry, this plugin only works with select fields."),r.hasOwnProperty(a)){if(r.init(n,this),"show"===a)return r.show(n);if(r.$elem.data("barrating"))return r.$widget=t(this).next(".br-widget"),r[a](n)}else{if("object"==typeof a||!a)return n=a,r.init(n,this),r.show();t.error("Method "+a+" does not exist on jQuery.barrating")}})},t.fn.barrating.defaults={theme:"",initialRating:null,showValues:!1,showSelectedRating:!0,reverse:!1,readonly:!1,fastClicks:!0,wrapperClass:"br-wrapper",onSelect:function(t,e){},onClear:function(t,e){},onDestroy:function(t,e){}},t.fn.barrating.defaults}(jQuery);
