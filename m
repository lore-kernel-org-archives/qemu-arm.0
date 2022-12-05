Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3380087ejx;
        Mon, 5 Dec 2022 01:58:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4I0rOYaTraTvYjGiL9C8xQ6YWcJyV/4BWb3I4r03RgaphiKWnKQDyOzRm43os87MxRRL5l
X-Received: by 2002:ac8:1104:0:b0:3a6:a4cc:8f4 with SMTP id c4-20020ac81104000000b003a6a4cc08f4mr8015268qtj.122.1670234301889;
        Mon, 05 Dec 2022 01:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234301; cv=none;
        d=google.com; s=arc-20160816;
        b=NChdJBrsXdrdiPuf0JZVNl9Y6S9sut/7PyhYcaaqpMk2T2ZzmDBSDQp+AOZbxWhKGy
         yicQ2fODFGUxWuSmf4cM3Fn87zwepRlCha7DqO/5D1zyiMOCVJc5tpcDsVrYlsEdEcEC
         ALl1+2VN0MRrXp+ghT8QQrjMUvKc5uEQ5NA2SoNZ21IVBAl7JXIMxPNIpZ4hjXdWUQsk
         6NVqbaMqrFHcuhhyyah7p8rrozuVGSDXzqc3RVfCiOpzWxsj6xaeha7mBXgU35OKYiAV
         7t5iq+EXotOUbeWNKYsLplZV6vgNs8w3ajXo9NGAYpasKtCCqae+eiX0HqVsFLNvzSGo
         hiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7icidAgMmKsBG3F4fcNXQX7B0Cy+7eWT7Gq+EOY+DcU=;
        b=sNza5B0ZrgrIDdWN4wYPi0jMePubAwz1291TJAwl31RSy2fvNaRHAvXqDF1W47mTkc
         U6dSwhgm4f2hnpl0bN7cFd7nTcuq+POH94tTARiIbrJS3lW5poLsXaA/vFcmnW95tOZ0
         VtAvWV5iWVBePY6cZwgtKPDbbg9Z6DWahUDJZ2CR/Y8Z/4oN4Ldwq2jBE611r0nB9P9e
         1ADNYRcLBD3AWbl9urZKF+/7r00fMhfp8ZZhc+7QpwQvtwB9H06qfzKMTJorpF003Njv
         fDX9RqTlSImnoovUXCSFLRV9vbgSo5nYCHJCHf/4DXXi1ImtemX+4m7ZD8+IfoZKbmV3
         M8JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bez6M00s;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id eo8-20020ad45948000000b004acbe62d31fsi7537182qvb.183.2022.12.05.01.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bez6M00s;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7icidAgMmKsBG3F4fcNXQX7B0Cy+7eWT7Gq+EOY+DcU=;
	b=Bez6M00sQeepmq6pp7yK0ILRYcViRfKIwsX7iBzyRy9K8RCj/YOiNNsu7F0mDqXCn4003j
	33lZZIZXWRu0Bs0v5R6EwQmc7juhG0+4/G2FVsuWcFwFnPbgfnKthXD0MBzTfyAVAi9laK
	TBI0M3WITfGH+JSx2rkrUE9kO+wYWQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-eahB3lwOMwOYmO_vPt4zMg-1; Mon, 05 Dec 2022 04:58:18 -0500
X-MC-Unique: eahB3lwOMwOYmO_vPt4zMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7B8A101A5AD;
	Mon,  5 Dec 2022 09:58:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A7A12166B29;
	Mon,  5 Dec 2022 09:58:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 43/51] migration: Move last_sent_block into PageSearchStatus
Date: Mon,  5 Dec 2022 10:52:20 +0100
Message-Id: <20221205095228.1314-44-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: BVTxfQ2DZ6u2

From: Peter Xu <peterx@redhat.com>

Since we use PageSearchStatus to represent a channel, it makes perfect
sense to keep last_sent_block (aka, leverage RAM_SAVE_FLAG_CONTINUE) to be
per-channel rather than global because each channel can be sending
different pages on ramblocks.

Hence move it from RAMState into PageSearchStatus.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 71 ++++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3194997738..1233ff53ac 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -89,6 +89,8 @@ XBZRLECacheStats xbzrle_counters;
 struct PageSearchStatus {
     /* The migration channel used for a specific host page */
     QEMUFile    *pss_channel;
+    /* Last block from where we have sent data */
+    RAMBlock *last_sent_block;
     /* Current block being searched */
     RAMBlock    *block;
     /* Current page to search from */
@@ -368,8 +370,6 @@ struct RAMState {
     int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
-    /* Last block from where we have sent data */
-    RAMBlock *last_sent_block;
     /* Last dirty target page we have sent */
     ram_addr_t last_page;
     /* last ram version we have seen */
@@ -684,16 +684,17 @@ exit:
  *
  * Returns the number of bytes written
  *
- * @f: QEMUFile where to send the data
+ * @pss: current PSS channel status
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  *          in the lower bits, it contains flags
  */
-static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
+static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
-    bool same_block = (block == rs->last_sent_block);
+    bool same_block = (block == pss->last_sent_block);
+    QEMUFile *f = pss->pss_channel;
 
     if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
@@ -706,7 +707,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
         size += 1 + len;
-        rs->last_sent_block = block;
+        pss->last_sent_block = block;
     }
     return size;
 }
@@ -790,17 +791,19 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  *          -1 means that xbzrle would be longer than normal
  *
  * @rs: current RAM state
+ * @pss: current PSS channel
  * @current_data: pointer to the address of the page contents
  * @current_addr: addr of the page
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
+static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
                             uint8_t **current_data, ram_addr_t current_addr,
                             RAMBlock *block, ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
+    QEMUFile *file = pss->pss_channel;
 
     if (!cache_is_cached(XBZRLE.cache, current_addr,
                          ram_counters.dirty_sync_count)) {
@@ -865,7 +868,7 @@ static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
     }
 
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle = save_page_header(rs, file, block,
+    bytes_xbzrle = save_page_header(pss, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
     qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
     qemu_put_be16(file, encoded_len);
@@ -1296,19 +1299,19 @@ void ram_release_page(const char *rbname, uint64_t offset)
  * Returns the size of data written to the file, 0 means the page is not
  * a zero page
  *
- * @rs: current RAM state
- * @file: the file where the data is saved
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
+static int save_zero_page_to_file(PageSearchStatus *pss,
                                   RAMBlock *block, ram_addr_t offset)
 {
     uint8_t *p = block->host + offset;
+    QEMUFile *file = pss->pss_channel;
     int len = 0;
 
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
+        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
         ram_release_page(block->idstr, offset);
@@ -1321,14 +1324,14 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
  *
  * Returns the number of pages written.
  *
- * @rs: current RAM state
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
                           ram_addr_t offset)
 {
-    int len = save_zero_page_to_file(rs, file, block, offset);
+    int len = save_zero_page_to_file(pss, block, offset);
 
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1381,16 +1384,18 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
  *
  * Returns the number of pages written.
  *
- * @rs: current RAM state
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  * @buf: the page to be sent
  * @async: send to page asyncly
  */
-static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
                             ram_addr_t offset, uint8_t *buf, bool async)
 {
-    ram_transferred_add(save_page_header(rs, file, block,
+    QEMUFile *file = pss->pss_channel;
+
+    ram_transferred_add(save_page_header(pss, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
@@ -1430,7 +1435,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
-        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
+        pages = save_xbzrle_page(rs, pss, &p, current_addr,
                                  block, offset);
         if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
@@ -1442,8 +1447,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     /* XBZRLE overflow or normal page */
     if (pages == -1) {
-        pages = save_normal_page(rs, pss->pss_channel, block, offset,
-                                 p, send_async);
+        pages = save_normal_page(pss, block, offset, p, send_async);
     }
 
     XBZRLE_cache_unlock();
@@ -1466,14 +1470,15 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf)
 {
     RAMState *rs = ram_state;
+    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     uint8_t *p = block->host + offset;
     int ret;
 
-    if (save_zero_page_to_file(rs, f, block, offset)) {
+    if (save_zero_page_to_file(pss, block, offset)) {
         return true;
     }
 
-    save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
 
     /*
      * copy it to a internal buffer to avoid it being modified by VM
@@ -2293,7 +2298,8 @@ static bool save_page_use_compression(RAMState *rs)
  * has been properly handled by compression, otherwise needs other
  * paths to handle it
  */
-static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
+static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
+                               RAMBlock *block, ram_addr_t offset)
 {
     if (!save_page_use_compression(rs)) {
         return false;
@@ -2309,7 +2315,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
      * We post the fist page as normal page as compression will take
      * much CPU resource.
      */
-    if (block != rs->last_sent_block) {
+    if (block != pss->last_sent_block) {
         flush_compressed_data(rs);
         return false;
     }
@@ -2340,11 +2346,11 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         return res;
     }
 
-    if (save_compress_page(rs, block, offset)) {
+    if (save_compress_page(rs, pss, block, offset)) {
         return 1;
     }
 
-    res = save_zero_page(rs, pss->pss_channel, block, offset);
+    res = save_zero_page(pss, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
@@ -2475,7 +2481,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
          * If channel switched, reset last_sent_block since the old sent block
          * may not be on the same channel.
          */
-        rs->last_sent_block = NULL;
+        pss->last_sent_block = NULL;
 
         trace_postcopy_preempt_switch_channel(channel);
     }
@@ -2814,8 +2820,13 @@ static void ram_save_cleanup(void *opaque)
 
 static void ram_state_reset(RAMState *rs)
 {
+    int i;
+
+    for (i = 0; i < RAM_CHANNEL_MAX; i++) {
+        rs->pss[i].last_sent_block = NULL;
+    }
+
     rs->last_seen_block = NULL;
-    rs->last_sent_block = NULL;
     rs->last_page = 0;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
@@ -3009,8 +3020,8 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
     migration_bitmap_sync(rs);
 
     /* Easiest way to make sure we don't resume in the middle of a host-page */
+    rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
     rs->last_seen_block = NULL;
-    rs->last_sent_block = NULL;
     rs->last_page = 0;
 
     postcopy_each_ram_send_discard(ms);
-- 
2.38.1
