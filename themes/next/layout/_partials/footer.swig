<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} &mdash; {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.authoricon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>

  {% if theme.post_wordcount.totalcount %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.post_wordcount.item_text %}
      <span class="post-meta-item-text">{{ __('post.totalcount') }}&#58;</span>
    {% endif %}
    <span title="{{ __('post.totalcount') }}">
      {{ totalcount(site, '0,0.0a') }}
    </span>
  {% endif %}
</div>

{% if theme.copyright %}
 <!-- <div class="powered-by">
    {{ __('footer.powered', '<a class="theme-link" href="https://hexo.io">Hexo</a>') }}
  </div>

  <span class="post-meta-divider">|</span>

  <div class="theme-info">
    {{ __('footer.theme') }} &mdash;
    <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
      NexT.{{ theme.scheme }}
    </a>
  </div>
-->
{% endif %}
<p>Hosted by <a href="https://pages.coding.me" style="font-weight: bold">Coding Pages</a></p>
<div>
    <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    本站总访问量 <span id="busuanzi_value_site_pv"></span> 次&nbsp&nbsp&nbsp 本站访客数
    <span id="busuanzi_value_site_uv"></span>人次&nbsp&nbsp&nbsp 本页阅读量<span id="busuanzi_value_page_pv"></span>次
    </div>
	
<div class="theme-info">
  <div class="powered-by"></div>
  <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
</div>