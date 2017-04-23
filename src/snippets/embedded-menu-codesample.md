## Installation

The following is a snippet you can paste into an HTML page, in two parts, pre-customized with this location's menu details. Our embed code is highly optimized
so as not to slow down your website for your visitors.

### Menu element

Place a selectable element wherever on the page you would like to embed your menu:

```html
<div id="menu"></div>
```

### Script tag

Then, place the script tag right before the &lt;/body&gt;:
<pre><code>
&lt;script
  id=&quot;bbembed&quot; type=&quot;text/javascript&quot;
  defer async
  src=&quot;https://app.bloomware.media/embed/__EMBED_API_VERSION__/ui.js&quot;
  data-bloombox-title=&quot;Bloom Menu&quot;
  data-bloombox-sort-mode=&quot;PRICE&quot;
  data-bloombox-apikey=&quot;__EMBED_API_KEY__&quot;
  data-bloombox-partner=&quot;__PARTNER__&quot;
  data-bloombox-selector=&quot;#menu&quot;
  data-bloombox-location=&quot;__LOCATION__&quot;&gt;&lt;/script&gt;
</code></pre>

### Customization

The menu is customizable with additional attributes on the &lt;script&gt; tag. For that and advanced embed options, take a look at the <a href="https://github.com/bloombox/bloombox-embedded-menu" target="_blank">source</a>.