Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379265ejx;
        Mon, 5 Dec 2022 01:56:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf72nn/tTdFPpVrfuRu+6aF3CDsOH32kLGbRUJ1Riuz3DJ760FFKsX3wOEITw2L1ANRI6VLL
X-Received: by 2002:a0c:fa09:0:b0:4c6:fec3:b463 with SMTP id q9-20020a0cfa09000000b004c6fec3b463mr32343676qvn.1.1670234184986;
        Mon, 05 Dec 2022 01:56:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234184; cv=none;
        d=google.com; s=arc-20160816;
        b=vXpA658BcqLruZqnigMRiV4JqpVTSdjqr328BquPz/PnexT5T5NXFGwHopcWmKzDYg
         XAY0RyrvRtmqBfmFTLyRkaK7ZzEYG7qgUfosav0F2GVwFignSR3Xkt3vX3xTahT8MDsk
         qjSWgTw5N2bagkC/Fm9JKtZJ/idN5iu9aKr4ria8yF9wOmYKAh9Hnm3m2xqUTriUf3gz
         O9wmmKRGw7CM+0sYXYVOJZXmgF08r21sX58duGPGyKybPqkCoaMCI91DW2f5peKpPXkX
         +CdvVYi/RmyjJZCkTw5vM9/+85kjpHRt24jozNuoAe3+DaF+0oT6LKaHrc0c0YlAko9t
         pwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UZm70PSygUPn7UXNAT5LnhWWt6V/uNbWzHaNnNPhKro=;
        b=lKnybMfYaWNQeC4qbWz4ZgdnVlsXZkxGSkP4SKq1I6HMzi7UVtukDhXyIOY4IacCbl
         N7sW8c38cy90mMeVCHh9hHRTA/BgA+LRl44TB/OCyJ3BXayc3HZ2QpTpa4lA7D0LJ+nF
         5sh62g92XfxOjAVuxwggmrANHbGZHT8qzM8iF2Gvn74C+3kTRSMkqBBZCAL7k7SEAahs
         VJcV8D21UVcZlGwzD1T3k/DsS9dUsxMI2Wn2dH2k5/6BGupTUbzqcupXRjnuCpxqWu4G
         ANyFr6pfWAetlSYKtTy8Cl/Qn2nTzqAvtfnc9FBoRSWP0YIhEgsizM1MSg0nYytRN1XX
         f/3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OTEqMIqf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id de31-20020a05620a371f00b006ce8a7187d1si8022785qkb.36.2022.12.05.01.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:24 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OTEqMIqf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZm70PSygUPn7UXNAT5LnhWWt6V/uNbWzHaNnNPhKro=;
	b=OTEqMIqfFHsBgJW5GTJul2GHuPfsABy4kvD8se/XMS5zXWcny45nbcnfZO0zUfKsOUi5r8
	+uTFSYQ4JZPOrvzYZozKPWcHomjQhpGbnnzD8ZMNRnYY24FjuEBj6qGmgFkD3CQe1eM4Yi
	DdbF814uqiJ2ajRmfyvd4XjwOW2E73E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-MA_bZf-JMraWsKJtq-b-Pg-1; Mon, 05 Dec 2022 04:56:20 -0500
X-MC-Unique: MA_bZf-JMraWsKJtq-b-Pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27CCD3814583;
	Mon,  5 Dec 2022 09:56:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DE932166B29;
	Mon,  5 Dec 2022 09:56:11 +0000 (UTC)
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
	Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 28/51] multifd: Create page_size fields into both MultiFD{Recv,Send}Params
Date: Mon,  5 Dec 2022 10:52:05 +0100
Message-Id: <20221205095228.1314-29-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: YoGkzGBPi6JZ

We were calling qemu_target_page_size() left and right.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h      |  4 ++++
 migration/multifd-zlib.c | 14 ++++++--------
 migration/multifd-zstd.c | 12 +++++-------
 migration/multifd.c      | 18 ++++++++----------
 4 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..86fb9982b3 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -80,6 +80,8 @@ typedef struct {
     bool registered_yank;
     /* packet allocated len */
     uint32_t packet_len;
+    /* guest page size */
+    uint32_t page_size;
     /* multifd flags for sending ram */
     int write_flags;
 
@@ -143,6 +145,8 @@ typedef struct {
     QIOChannel *c;
     /* packet allocated len */
     uint32_t packet_len;
+    /* guest page size */
+    uint32_t page_size;
 
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 18213a9513..37770248e1 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -116,7 +116,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
-    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t out_size = 0;
     int ret;
@@ -135,8 +134,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
          * with compression. zlib does not guarantee that this is safe,
          * therefore copy the page before calling deflate().
          */
-        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
-        zs->avail_in = page_size;
+        memcpy(z->buf, p->pages->block->host + p->normal[i], p->page_size);
+        zs->avail_in = p->page_size;
         zs->next_in = z->buf;
 
         zs->avail_out = available;
@@ -242,12 +241,11 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
 static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
-    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
     uint32_t out_size = zs->total_out;
-    uint32_t expected_size = p->normal_num * page_size;
+    uint32_t expected_size = p->normal_num * p->page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     int ret;
     int i;
@@ -274,7 +272,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_out = page_size;
+        zs->avail_out = p->page_size;
         zs->next_out = p->host + p->normal[i];
 
         /*
@@ -288,8 +286,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = inflate(zs, flush);
         } while (ret == Z_OK && zs->avail_in
-                             && (zs->total_out - start) < page_size);
-        if (ret == Z_OK && (zs->total_out - start) < page_size) {
+                             && (zs->total_out - start) < p->page_size);
+        if (ret == Z_OK && (zs->total_out - start) < p->page_size) {
             error_setg(errp, "multifd %u: inflate generated too few output",
                        p->id);
             return -1;
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index d788d309f2..f4a8e1ed1f 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -113,7 +113,6 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct zstd_data *z = p->data;
-    size_t page_size = qemu_target_page_size();
     int ret;
     uint32_t i;
 
@@ -128,7 +127,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
             flush = ZSTD_e_flush;
         }
         z->in.src = p->pages->block->host + p->normal[i];
-        z->in.size = page_size;
+        z->in.size = p->page_size;
         z->in.pos = 0;
 
         /*
@@ -241,8 +240,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t in_size = p->next_packet_size;
     uint32_t out_size = 0;
-    size_t page_size = qemu_target_page_size();
-    uint32_t expected_size = p->normal_num * page_size;
+    uint32_t expected_size = p->normal_num * p->page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
     int ret;
@@ -265,7 +263,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 
     for (i = 0; i < p->normal_num; i++) {
         z->out.dst = p->host + p->normal[i];
-        z->out.size = page_size;
+        z->out.size = p->page_size;
         z->out.pos = 0;
 
         /*
@@ -279,8 +277,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
-                         && (z->out.pos < page_size));
-        if (ret > 0 && (z->out.pos < page_size)) {
+                         && (z->out.pos < p->page_size));
+        if (ret > 0 && (z->out.pos < p->page_size)) {
             error_setg(errp, "multifd %u: decompressStream buffer too small",
                        p->id);
             return -1;
diff --git a/migration/multifd.c b/migration/multifd.c
index 509bbbe3bf..efffa77a76 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -87,15 +87,14 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     MultiFDPages_t *pages = p->pages;
-    size_t page_size = qemu_target_page_size();
 
     for (int i = 0; i < p->normal_num; i++) {
         p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
-        p->iov[p->iovs_num].iov_len = page_size;
+        p->iov[p->iovs_num].iov_len = p->page_size;
         p->iovs_num++;
     }
 
-    p->next_packet_size = p->normal_num * page_size;
+    p->next_packet_size = p->normal_num * p->page_size;
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -139,7 +138,6 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
 static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
-    size_t page_size = qemu_target_page_size();
 
     if (flags != MULTIFD_FLAG_NOCOMP) {
         error_setg(errp, "multifd %u: flags received %x flags expected %x",
@@ -148,7 +146,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
     }
     for (int i = 0; i < p->normal_num; i++) {
         p->iov[i].iov_base = p->host + p->normal[i];
-        p->iov[i].iov_len = page_size;
+        p->iov[i].iov_len = p->page_size;
     }
     return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
 }
@@ -281,8 +279,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
-    size_t page_size = qemu_target_page_size();
-    uint32_t page_count = MULTIFD_PACKET_SIZE / page_size;
+    uint32_t page_count = MULTIFD_PACKET_SIZE / p->page_size;
     RAMBlock *block;
     int i;
 
@@ -344,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
-        if (offset > (block->used_length - page_size)) {
+        if (offset > (block->used_length - p->page_size)) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
                        offset, block->used_length);
@@ -433,8 +430,7 @@ static int multifd_send_pages(QEMUFile *f)
     p->packet_num = multifd_send_state->packet_num++;
     multifd_send_state->pages = p->pages;
     p->pages = pages;
-    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
-                + p->packet_len;
+    transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
     ram_counters.transferred += transferred;
@@ -947,6 +943,7 @@ int multifd_save_setup(Error **errp)
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->page_size = qemu_target_page_size();
 
         if (migrate_use_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
@@ -1194,6 +1191,7 @@ int multifd_load_setup(Error **errp)
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->page_size = qemu_target_page_size();
     }
 
     for (i = 0; i < thread_count; i++) {
-- 
2.38.1
