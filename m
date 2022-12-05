Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379712ejx;
        Mon, 5 Dec 2022 01:57:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HaFbDn+MFSd2Rwo8rtNB0UVb3eXeBEAtBX5I78BEc8xp+x8uK6QG/qtPCax1XNvrA48ME
X-Received: by 2002:a05:620a:4712:b0:6fa:faac:9272 with SMTP id bs18-20020a05620a471200b006fafaac9272mr58702870qkb.15.1670234249042;
        Mon, 05 Dec 2022 01:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234249; cv=none;
        d=google.com; s=arc-20160816;
        b=IgrLz+NGWQZ+osWqOhQyPSiy6GCGS95gUHfw8xWg2vTP0XtKz5Jg3EPvjqm6tCQaVw
         ENPd4d9cvZ3QKrzGVCUAOEOMiD6L38TCshGn/gy7/Mh5HgSul7wg5MKu+JuI97aVqNn/
         eRwEbJTkAC3B1h4mdkvnAI1Z4m19O46OuvCKSUs1vdCxDZ7V4uvAQvRcNAZMmTMLFeJ8
         9BEn4N7xa1CUNBBYIYt6JNemvscloYmj28bF6zZxo91NvwvTsKVP0jXJJ1YWDv+IIY0i
         phllcwXYl4/BqNcJHurdfTD6iqPFT2MX4/TnJa+fj3ZBYD8+luUYY4nFa9Jkjof4Ui5l
         e4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MyOOzG/IByBPCSi/RuF6EO6mdBGoKRDsMNpVGRjYHyo=;
        b=VYNmi4M2NC5p/srbkGWY+vqB2LtZef/4DOpAhtyvdnlOT3LriOCDqs6xN2jJ4iOZFc
         5l+71RaImax3JbtoZUpARkpL2Pc94tga3JWjGiMsOv7GY4ihKzWcSfsxHXs3xj1Cc4NN
         oaK+fS2DSwgl/2tBdYUTcUBmR7DmpGWXdbhXLjT81ID75hvWZB+1vsmQ98lSJt4ujc0X
         OoF/pCA12zpoCBkNt1O/nk83m6LU3QY/wqXpZfHPjpH98X9SXD3D9lcMH6fDxou7NvrQ
         Kd6AchRqYF/3K6mOd+J6m1ypuJ2nIMTFii2U7JTdytSJIHiExGVAO46yr9binQ/Qn6lJ
         QB7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YA82wt88;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bc13-20020a05622a1ccd00b00397b3280a32si7870718qtb.140.2022.12.05.01.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YA82wt88;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyOOzG/IByBPCSi/RuF6EO6mdBGoKRDsMNpVGRjYHyo=;
	b=YA82wt88OEfM8Rce18vmfAXgOeisCA4Q4K6bGcgI3mxvNEL1IcdEGBClBzUOz2hHQRMYCF
	uzY7yrVpJgNTzh79wNeAwhWKjqN/Vws62CJaW7UIAOkIdmKbCaBCkb3yuACyr259Wej1ll
	HffIJHRkpgHU8j4jhbdTFDhXg2n00WA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-mDjzPx4ePvSGdoy5QNK39A-1; Mon, 05 Dec 2022 04:57:23 -0500
X-MC-Unique: mDjzPx4ePvSGdoy5QNK39A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11A17299E755;
	Mon,  5 Dec 2022 09:57:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E45D2166B29;
	Mon,  5 Dec 2022 09:57:14 +0000 (UTC)
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
Subject: [PATCH v2 36/51] migration: Remove RAMState.f references in compression code
Date: Mon,  5 Dec 2022 10:52:13 +0100
Message-Id: <20221205095228.1314-37-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 4lyGcf1gs+Ot

From: Peter Xu <peterx@redhat.com>

Removing referencing to RAMState.f in compress_page_with_multi_thread() and
flush_compressed_data().

Compression code by default isn't compatible with having >1 channels (or it
won't currently know which channel to flush the compressed data), so to
make it simple we always flush on the default to_dst_file port until
someone wants to add >1 ports support, as rs->f right now can really
change (after postcopy preempt is introduced).

There should be no functional change at all after patch applied, since as
long as rs->f referenced in compression code, it must be to_dst_file.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 41475431fc..6e3dc845c5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1461,6 +1461,7 @@ static bool save_page_use_compression(RAMState *rs);
 
 static void flush_compressed_data(RAMState *rs)
 {
+    MigrationState *ms = migrate_get_current();
     int idx, len, thread_count;
 
     if (!save_page_use_compression(rs)) {
@@ -1479,7 +1480,7 @@ static void flush_compressed_data(RAMState *rs)
     for (idx = 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
@@ -1498,11 +1499,11 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
     param->offset = offset;
 }
 
-static int compress_page_with_multi_thread(RAMState *rs, RAMBlock *block,
-                                           ram_addr_t offset)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
+    MigrationState *ms = migrate_get_current();
 
     thread_count = migrate_compress_threads();
     qemu_mutex_lock(&comp_done_lock);
@@ -1510,7 +1511,8 @@ retry:
     for (idx = 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
             comp_param[idx].done = false;
-            bytes_xmit = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
+                                            comp_param[idx].file);
             qemu_mutex_lock(&comp_param[idx].mutex);
             set_compress_params(&comp_param[idx], block, offset);
             qemu_cond_signal(&comp_param[idx].cond);
@@ -2263,7 +2265,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
         return false;
     }
 
-    if (compress_page_with_multi_thread(rs, block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset) > 0) {
         return true;
     }
 
-- 
2.38.1
