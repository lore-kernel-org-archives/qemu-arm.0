Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3380036ejx;
        Mon, 5 Dec 2022 01:58:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/JV4Lg1wjCuE5drzL08Ry9NTf23ar/bO4S2AXGwvaaZ48LBoMHsfWBG72uF4L071+ZUfI
X-Received: by 2002:a05:622a:1dca:b0:3a6:979a:71c1 with SMTP id bn10-20020a05622a1dca00b003a6979a71c1mr13452426qtb.659.1670234293819;
        Mon, 05 Dec 2022 01:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234293; cv=none;
        d=google.com; s=arc-20160816;
        b=fmH6OjNlnW0INQgjCuGHZ2HLhA16l4G9bTPk1UmNEW8j3M+/KzGJHXYzFF51lhnuA6
         F86DJFrckM9/ApUHVRuwYgdE5zLaTqff76zyo2HAsvuC5BWAbXSFEzBaBK5J5ruEITLL
         H5G80cljZrNL0+4d5cj7EtsutGlfFMltbrBlU+deGrqL3mfOcQn/ZRx+VekuiRC8h7zS
         X/xqAqgwYhAej1Y1KxiTIA5q3GCZe71o2s/2JR47XBIFxmU0k5o03qNWAFzdIyHhJb0p
         cg4ORVU6CnQG4Q6H7Tzi1MeQYb6OOF9d0+OxN0//qWvhS51/GmwwNukKsNMzyGxVRbxH
         KaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qYA73M7Ng+wC6nj7QttuHiv7/6zn1BOBSnRJfyDjZvE=;
        b=Vt3rC4HudImgNyhtbtpqm2rSr38S8QGoWgZ5bAVJgNm1F1Ou7l1l+0ESE11AL/7kUP
         LItoccMrsQguBIsh+xw3NsTjuXGhAH4I2PfeuI1B6/aplwLiuU3rYz9rVJ84gZ6Wk8ot
         JY7AtLg7s+qaefBLPPDUZD8cBvFY97vkzSvqbfYMVJuAGGXYEusM+vTywOmAA5uNjZM7
         0VgfffCEj/i+R6ghs1hUGcP7ImAQW7gsv7mnK0n31FxrCqHeGP68he00UZlYFd3NyB0x
         ml89gJViWTkVg0KYB1kUpTBlSgcYI2nThRqLG3hzRcYkrslqBuwJIBH7DiGizriKJE6O
         iDNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EXeHxi1h;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u25-20020a37ab19000000b006fc95c6e116si7051306qke.563.2022.12.05.01.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EXeHxi1h;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYA73M7Ng+wC6nj7QttuHiv7/6zn1BOBSnRJfyDjZvE=;
	b=EXeHxi1heIPEsWXyhvjQyEouQt4jI7Csy58ZfvmhOtHgA1M3/9lITODkphYSe26TFKiy0I
	pZjF3nu+RjKg+6I99DBoo+1FmhZSVDAINN6IgikgwxIFF6SWuzxfEqoMZkylUd9pkBhtQm
	Ije1OAMTUIEBSgXdT9l/Z+PtyecxDwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-UIwTvrR0MmKZoY5UX9HDwA-1; Mon, 05 Dec 2022 04:58:10 -0500
X-MC-Unique: UIwTvrR0MmKZoY5UX9HDwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8C4F811E7A;
	Mon,  5 Dec 2022 09:58:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78A952166B29;
	Mon,  5 Dec 2022 09:58:01 +0000 (UTC)
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
Subject: [PATCH v2 42/51] migration: Make PageSearchStatus part of RAMState
Date: Mon,  5 Dec 2022 10:52:19 +0100
Message-Id: <20221205095228.1314-43-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: RBWkNPw2muFH

From: Peter Xu <peterx@redhat.com>

We used to allocate PSS structure on the stack for precopy when sending
pages.  Make it static, so as to describe per-channel ram migration status.

Here we declared RAM_CHANNEL_MAX instances, preparing for postcopy to use
it, even though this patch has not yet to start using the 2nd instance.

This should not have any functional change per se, but it already starts to
export PSS information via the RAMState, so that e.g. one PSS channel can
start to reference the other PSS channel.

Always protect PSS access using the same RAMState.bitmap_mutex.  We already
do so, so no code change needed, just some comment update.  Maybe we should
consider renaming bitmap_mutex some day as it's going to be a more commonly
and big mutex we use for ram states, but just leave it for later.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 112 ++++++++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 51 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d81bf7b183..3194997738 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -85,6 +85,46 @@
 
 XBZRLECacheStats xbzrle_counters;
 
+/* used by the search for pages to send */
+struct PageSearchStatus {
+    /* The migration channel used for a specific host page */
+    QEMUFile    *pss_channel;
+    /* Current block being searched */
+    RAMBlock    *block;
+    /* Current page to search from */
+    unsigned long page;
+    /* Set once we wrap around */
+    bool         complete_round;
+    /*
+     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
+     * postcopy.  When set, the request is "urgent" because the dest QEMU
+     * threads are waiting for us.
+     */
+    bool         postcopy_requested;
+    /*
+     * [POSTCOPY-ONLY] The target channel to use to send current page.
+     *
+     * Note: This may _not_ match with the value in postcopy_requested
+     * above. Let's imagine the case where the postcopy request is exactly
+     * the page that we're sending in progress during precopy. In this case
+     * we'll have postcopy_requested set to true but the target channel
+     * will be the precopy channel (so that we don't split brain on that
+     * specific page since the precopy channel already contains partial of
+     * that page data).
+     *
+     * Besides that specific use case, postcopy_target_channel should
+     * always be equal to postcopy_requested, because by default we send
+     * postcopy pages via postcopy preempt channel.
+     */
+    bool         postcopy_target_channel;
+    /* Whether we're sending a host page */
+    bool          host_page_sending;
+    /* The start/end of current host page.  Invalid if host_page_sending==false */
+    unsigned long host_page_start;
+    unsigned long host_page_end;
+};
+typedef struct PageSearchStatus PageSearchStatus;
+
 /* struct contains XBZRLE cache and a static page
    used by the compression */
 static struct {
@@ -319,6 +359,11 @@ typedef struct {
 struct RAMState {
     /* QEMUFile used for this migration */
     QEMUFile *f;
+    /*
+     * PageSearchStatus structures for the channels when send pages.
+     * Protected by the bitmap_mutex.
+     */
+    PageSearchStatus pss[RAM_CHANNEL_MAX];
     /* UFFD file descriptor, used in 'write-tracking' migration */
     int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
@@ -362,7 +407,12 @@ struct RAMState {
     uint64_t target_page_count;
     /* number of dirty bits in the bitmap */
     uint64_t migration_dirty_pages;
-    /* Protects modification of the bitmap and migration dirty pages */
+    /*
+     * Protects:
+     * - dirty/clear bitmap
+     * - migration_dirty_pages
+     * - pss structures
+     */
     QemuMutex bitmap_mutex;
     /* The RAMBlock used in the last src_page_requests */
     RAMBlock *last_req_rb;
@@ -451,46 +501,6 @@ void dirty_sync_missed_zero_copy(void)
     ram_counters.dirty_sync_missed_zero_copy++;
 }
 
-/* used by the search for pages to send */
-struct PageSearchStatus {
-    /* The migration channel used for a specific host page */
-    QEMUFile    *pss_channel;
-    /* Current block being searched */
-    RAMBlock    *block;
-    /* Current page to search from */
-    unsigned long page;
-    /* Set once we wrap around */
-    bool         complete_round;
-    /*
-     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
-     * postcopy.  When set, the request is "urgent" because the dest QEMU
-     * threads are waiting for us.
-     */
-    bool         postcopy_requested;
-    /*
-     * [POSTCOPY-ONLY] The target channel to use to send current page.
-     *
-     * Note: This may _not_ match with the value in postcopy_requested
-     * above. Let's imagine the case where the postcopy request is exactly
-     * the page that we're sending in progress during precopy. In this case
-     * we'll have postcopy_requested set to true but the target channel
-     * will be the precopy channel (so that we don't split brain on that
-     * specific page since the precopy channel already contains partial of
-     * that page data).
-     *
-     * Besides that specific use case, postcopy_target_channel should
-     * always be equal to postcopy_requested, because by default we send
-     * postcopy pages via postcopy preempt channel.
-     */
-    bool         postcopy_target_channel;
-    /* Whether we're sending a host page */
-    bool          host_page_sending;
-    /* The start/end of current host page.  Only valid if host_page_sending==true */
-    unsigned long host_page_start;
-    unsigned long host_page_end;
-};
-typedef struct PageSearchStatus PageSearchStatus;
-
 CompressionStats compression_counters;
 
 struct CompressParam {
@@ -2637,7 +2647,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
  */
 static int ram_find_and_save_block(RAMState *rs)
 {
-    PageSearchStatus pss;
+    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     int pages = 0;
     bool again, found;
 
@@ -2658,11 +2668,11 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss_init(&pss, rs->last_seen_block, rs->last_page);
+    pss_init(pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-        found = get_queued_page(rs, &pss);
+        found = get_queued_page(rs, pss);
 
         if (!found) {
             /*
@@ -2670,27 +2680,27 @@ static int ram_find_and_save_block(RAMState *rs)
              * preempted precopy.  Otherwise find the next dirty bit.
              */
             if (postcopy_preempt_triggered(rs)) {
-                postcopy_preempt_restore(rs, &pss, false);
+                postcopy_preempt_restore(rs, pss, false);
                 found = true;
             } else {
                 /* priority queue empty, so just search for something dirty */
-                found = find_dirty_block(rs, &pss, &again);
+                found = find_dirty_block(rs, pss, &again);
             }
         }
 
         if (found) {
             /* Update rs->f with correct channel */
             if (postcopy_preempt_active()) {
-                postcopy_preempt_choose_channel(rs, &pss);
+                postcopy_preempt_choose_channel(rs, pss);
             }
             /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss.pss_channel = rs->f;
-            pages = ram_save_host_page(rs, &pss);
+            pss->pss_channel = rs->f;
+            pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
 
-    rs->last_seen_block = pss.block;
-    rs->last_page = pss.page;
+    rs->last_seen_block = pss->block;
+    rs->last_page = pss->page;
 
     return pages;
 }
-- 
2.38.1
