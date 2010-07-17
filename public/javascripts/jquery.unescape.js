/**
 * @name jquery.unescape.js
 * @description A simple function which unescapes the HTML.
 * @author Artur Barseghyan
 * @version 1.0 alpha
 * @example
 *          $('textarea').unescape();
 *          $.unescape('&lt;a href=&quot;http://delusionalinsanity.com&quot;&gt;Delusional Insanity&lt;/a&gt;');
 */
(function($) {
    $.fn.unescape = function() {
       return $(this).html($.unescape($(this).html()));
    }

    /**
     * @param string html - HTML string to unescape.
     * @return string - unescaped HTML string.
     */
    $.unescape = function(html) {
        var htmlNode = document.createElement('div');
        htmlNode.innerHTML = html;
        if (htmlNode.innerText) {
            return htmlNode.innerText; // IE
        }
        return htmlNode.textContent; // FF
    }
})(jQuery);