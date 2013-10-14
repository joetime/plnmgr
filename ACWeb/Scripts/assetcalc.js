/*!
 * AssetCALC JavaScript Library v1.0
 * http://assetcalc.com/
 *
 * Date: 2013-07-10
 */

function scrollToElement(selector, time, verticalOffset) {
    time = typeof (time) != 'undefined' ? time : 1000;
    verticalOffset = typeof (verticalOffset) != 'undefined' ? verticalOffset : -10;
    element = $(selector);
    offset = element.offset();
    offsetTop = offset.top + verticalOffset;
    $('html, body').animate({
        scrollTop: offsetTop
    }, time);
}


/* my toggle definition
            $("[data-toggle=toggle]").click(function () {
                console.log('gotcha');
                var targetId = $(this).attr("data-target");
                console.log(targetId);
                $(targetId).fadeToggle();
                if ($(this).attr("data-jump"))
                    location.href = $(this).attr("data-jump");
            });
            */