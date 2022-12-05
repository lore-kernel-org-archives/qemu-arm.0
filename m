Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379774ejx;
        Mon, 5 Dec 2022 01:57:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf438C+gJB2zJFHekE8CJT8RGVFCfm+K1XdMjYH+NdfuSxH1bkHYXS+27g3qSjj6UdlaD5xF
X-Received: by 2002:a05:622a:174b:b0:3a5:8668:988b with SMTP id l11-20020a05622a174b00b003a58668988bmr61293309qtk.184.1670234256344;
        Mon, 05 Dec 2022 01:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234256; cv=none;
        d=google.com; s=arc-20160816;
        b=AQpFop85XhnTD50oYhCChEPEBgzXxEUDi7F+GiUT6cjElgS7w+/9kBImN5ac5xSXlJ
         pw4xQAl2FAqR5Flx3GP7ja3VKK1D3hRYV9sJyQJTVAvkpSVWF8OwdyUUkX+EcoZ0fcam
         ATXkm5RCCWkRuXZsKuXLrj4ev3yxjY1qFlRr5O+Fl3yTjN+AdRST462zDKjt7Ft+0QxD
         vurXvUt+EjYOxSv25LjL0A+JkpkjSjOCsY/DLVYJ88lp3XUDWDenC/kAVQwYAwtmRObf
         Rp9ZqvscAHzXmBIBCqVzPJ1s4ZwJMPRD48sMdNSq4ABNYnpoBXjsLBazz3LQxttR8AYl
         qlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=30+Kq9dPR7peGz5envehc+sa5UbYD15LI+w9Psis5To=;
        b=G8kwafGxUsFyL2JIzBFGcua3N7kgkYeYyJClBw9Sc7uLzgoKRFimwYieWAWA7yMVLM
         2UfB/CEQqAsPwC3zcb/IR0wDD7Nek0BM5LykbGRXLDGA8YYpr0eEZlyvxqxx1q5HYoPL
         pQgMCQth+ApioOgRkCoDJB/FcXsf3gk88SJgpTK0kJa2E/j5trCqQIGw9Vdhuc9K19mO
         0wNj3NkhzoznC3UZV+R3FfwGkMC5AxaMNPDZ8PjoCo0am27TCw2sdHJjR/TmvljORnkL
         /p2UEXrgKAoxGQ8/El+P0qkaccyiGO6bhr+YOQYBL8NRIYJLKrrku1kbbDI0bJbX3vuV
         8kOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BAgyb1mZ;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id jk8-20020ad45d48000000b004bb984ae488si8268062qvb.537.2022.12.05.01.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:57:36 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BAgyb1mZ;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30+Kq9dPR7peGz5envehc+sa5UbYD15LI+w9Psis5To=;
	b=BAgyb1mZidBFwijV+/pLNl/7Z7MfsrMi4D89gYNIiS9Yzjs66+fCuwZbB98fx31qYg7Vwr
	41/03VokQPTvNwwUGiYxqFfOmllDVIw9KkbVxkNoiUdHCTNhungjsErM9xrPoMYPMQtO8L
	6DjklIsi9VHxKmuvNfANBSzvggf6Hq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-31Nfrau3OC2NYJZxgScheA-1; Mon, 05 Dec 2022 04:57:31 -0500
X-MC-Unique: 31Nfrau3OC2NYJZxgScheA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBF4A87B2A1;
	Mon,  5 Dec 2022 09:57:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6700A2166B29;
	Mon,  5 Dec 2022 09:57:22 +0000 (UTC)
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
Subject: [PATCH v2 37/51] migration: Yield bitmap_mutex properly when sending/sleeping
Date: Mon,  5 Dec 2022 10:52:14 +0100
Message-Id: <20221205095228.1314-38-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: ouXfKxoadlKm

From: Peter Xu <peterx@redhat.com>

Don't take the bitmap mutex when sending pages, or when being throttled by
migration_rate_limit() (which is a bit tricky to call it here in ram code,
but seems still helpful).

It prepares for the possibility of concurrently sending pages in >1 threads
using the function ram_save_host_page() because all threads may need the
bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
qemu_sem_wait() blocking for one thread will not block the other from
progressing.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6e3dc845c5..5379164749 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2452,9 +2452,14 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  * a host page in which case the remainder of the hostpage is sent.
  * Only dirty target pages are sent. Note that the host page size may
  * be a huge page for this block.
+ *
  * The saving stops at the boundary of the used_length of the block
  * if the RAMBlock isn't a multiple of the host page size.
  *
+ * The caller must be with ram_state.bitmap_mutex held to call this
+ * function.  Note that this function can temporarily release the lock, but
+ * when the function is returned it'll make sure the lock is still held.
+ *
  * Returns the number of pages written or negative on error
  *
  * @rs: current RAM state
@@ -2462,6 +2467,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  */
 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
+    bool page_dirty, preempt_active = postcopy_preempt_active();
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
@@ -2485,22 +2491,40 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
             break;
         }
 
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
+
         /* Check the pages is dirty and if it is send it */
-        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
+        if (page_dirty) {
+            /*
+             * Properly yield the lock only in postcopy preempt mode
+             * because both migration thread and rp-return thread can
+             * operate on the bitmaps.
+             */
+            if (preempt_active) {
+                qemu_mutex_unlock(&rs->bitmap_mutex);
+            }
             tmppages = ram_save_target_page(rs, pss);
-            if (tmppages < 0) {
-                return tmppages;
+            if (tmppages >= 0) {
+                pages += tmppages;
+                /*
+                 * Allow rate limiting to happen in the middle of huge pages if
+                 * something is sent in the current iteration.
+                 */
+                if (pagesize_bits > 1 && tmppages > 0) {
+                    migration_rate_limit();
+                }
             }
-
-            pages += tmppages;
-            /*
-             * Allow rate limiting to happen in the middle of huge pages if
-             * something is sent in the current iteration.
-             */
-            if (pagesize_bits > 1 && tmppages > 0) {
-                migration_rate_limit();
+            if (preempt_active) {
+                qemu_mutex_lock(&rs->bitmap_mutex);
             }
+        } else {
+            tmppages = 0;
+        }
+
+        if (tmppages < 0) {
+            return tmppages;
         }
+
         pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     } while ((pss->page < hostpage_boundary) &&
              offset_in_ramblock(pss->block,
-- 
2.38.1
