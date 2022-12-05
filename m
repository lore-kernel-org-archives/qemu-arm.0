Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379324ejx;
        Mon, 5 Dec 2022 01:56:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6D755EMWUIk9YUlHV3bhSMraZMf8SkvaCAU8mgmVRC/SvolEvvTFy+acRBrmA+l0NhazyD
X-Received: by 2002:ad4:420f:0:b0:4c7:1c2e:3584 with SMTP id k15-20020ad4420f000000b004c71c2e3584mr21856546qvp.32.1670234192954;
        Mon, 05 Dec 2022 01:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234192; cv=none;
        d=google.com; s=arc-20160816;
        b=euq/FxsWM2gatj8WY9ayFPunvWmyrcGgJIOHQd2Rgz4y1iqL4jP4803Ms7Fd0zLqAU
         fIwSl5lxU5Qbj023TtWeFfVeZiQH6gEsNAn0jFhbA3axZ5/lvwSYaCCQdc/Z/LnLu/6i
         8rtA3HnzjFtPmvnw1+E9ZlsVbsdDiIegb/wkhZ+Q85KAdLqvzZtt+KsQoTPFnSDz+gKX
         ZmruUxpsbbXpiqiEBKEI7fJcaLbQYO/Y6PXZ3bETu7kpV7OrhnUxtPzyjZHj+uroHA/w
         ScLkj3IlVHTc5ix+9rRS9VyRmumjWQsu+ml+E8YCdfF7tebRUgVaPgbkWlI60TXss2GJ
         ZDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9tm0aYZytXya9yAOHxEbm0Rd0xivxdFo7KkNO5L47xU=;
        b=eKiYgGVkILGHBTSQ0rMQdXmLjHmRyC8uTXLVVJ44RPHWqXQF29xyv3cQ8amrpaJjQQ
         Ve40QySm7coWnIexo3oMuok6oz2HtrnRfbSk2LqvXvW+0XW0/+iYZ7BcSa6kpb13O9g5
         RhF8CULNqmvThPuit5qa9hy4fMg0BQSGEOh0+QVJRWLe5e8ztJHgk1A6cLmnd+7n0R5w
         3/jJ+1pdUAZAd+eEfs6O6LPsoyGjvWao9L1QwYPw/dwz1yfIOC1yPQ1qCH1Z8Qonq2a5
         pF46Ysq1WwSzUcn+Nfd1OoQmC1iqMF5hF61cztNHx9XP0fYWss+GhtjTcyI4hcCiUDec
         N9wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0wUH1LH;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gb11-20020a05622a598b00b003a68e6de1a1si7810306qtb.444.2022.12.05.01.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0wUH1LH;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9tm0aYZytXya9yAOHxEbm0Rd0xivxdFo7KkNO5L47xU=;
	b=a0wUH1LHSAxMfpnsFGe/RHa+XzfgMzwMUFAlHBruoGIjezcD4cstWUrn+busUs7uWTvb+p
	OWO6QDcqp7n/fBAqHRS2RQMi7ZEmwfauPXl6eWmDDeWjg+m/Z1QsTpP5BnUTZKLtjSzCnW
	AI5ZlAXRbee606mUjHuJnJUDzZt/GUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-QPlaoyc6PiKol5iUMkrnGg-1; Mon, 05 Dec 2022 04:56:28 -0500
X-MC-Unique: QPlaoyc6PiKol5iUMkrnGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD08858282;
	Mon,  5 Dec 2022 09:56:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7637C2166B29;
	Mon,  5 Dec 2022 09:56:19 +0000 (UTC)
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
Subject: [PATCH v2 29/51] multifd: Create page_count fields into both MultiFD{Recv,Send}Params
Date: Mon,  5 Dec 2022 10:52:06 +0100
Message-Id: <20221205095228.1314-30-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: PGhY9bI57+XI

We were recalculating it left and right.  We plan to change that
values on next patches.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h | 4 ++++
 migration/multifd.c | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 86fb9982b3..e2802a9ce2 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -82,6 +82,8 @@ typedef struct {
     uint32_t packet_len;
     /* guest page size */
     uint32_t page_size;
+    /* number of pages in a full packet */
+    uint32_t page_count;
     /* multifd flags for sending ram */
     int write_flags;
 
@@ -147,6 +149,8 @@ typedef struct {
     uint32_t packet_len;
     /* guest page size */
     uint32_t page_size;
+    /* number of pages in a full packet */
+    uint32_t page_count;
 
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
diff --git a/migration/multifd.c b/migration/multifd.c
index efffa77a76..b8dc559d24 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -279,7 +279,6 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
-    uint32_t page_count = MULTIFD_PACKET_SIZE / p->page_size;
     RAMBlock *block;
     int i;
 
@@ -306,10 +305,10 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
      * If we received a packet that is 100 times bigger than expected
      * just stop migration.  It is a magic number.
      */
-    if (packet->pages_alloc > page_count) {
+    if (packet->pages_alloc > p->page_count) {
         error_setg(errp, "multifd: received packet "
                    "with size %u and expected a size of %u",
-                   packet->pages_alloc, page_count) ;
+                   packet->pages_alloc, p->page_count) ;
         return -1;
     }
 
@@ -944,6 +943,7 @@ int multifd_save_setup(Error **errp)
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
         p->page_size = qemu_target_page_size();
+        p->page_count = page_count;
 
         if (migrate_use_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
@@ -1191,6 +1191,7 @@ int multifd_load_setup(Error **errp)
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->page_count = page_count;
         p->page_size = qemu_target_page_size();
     }
 
-- 
2.38.1
