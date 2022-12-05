Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378627ejx;
        Mon, 5 Dec 2022 01:55:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7shnwUdW77/EfGPq3jS88rbmh0JzX9u7o8T8i4KjEzJyGNzWIm304g+36MHp9aXRVIQFfM
X-Received: by 2002:a37:9683:0:b0:6ba:e9c7:a54f with SMTP id y125-20020a379683000000b006bae9c7a54fmr56054508qkd.218.1670234100074;
        Mon, 05 Dec 2022 01:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234100; cv=none;
        d=google.com; s=arc-20160816;
        b=u5nvrNrldCDUbJh8vhRgyq4at1LxXEfz9MQHamYHPvRQxPj5PSxaw8oy86fA1ht2cH
         YJ47ZpDP57DDY3dL/AEK+hT4GOX70fWJ4mS36o+uE8nyJ62RnwJNzWdH0CrFiSf3bmV5
         JpxEjTSTsBaU9wpEqPkVvNoJdZ3U+R+w47iS5aHbfgN47bliWY9TAqrgIzVGkQcEYFyH
         qkEQ0Oo2qqPZc43vbeVG2ZS0fsIbyPdEd87rEw2CsR4MDyr+l9F3vyZys8a4YJ0SEqk2
         8zMhLYNrWA3Fh1PGIJGAOQRXe0SrWC2ywgLruhbN53z/LtYIZ/shfQmLFxoPt5WIKb/I
         +cTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YV1dL1MmO+zuZsRAQOi5egpSmb0nyqOB4Pp4gBeiMus=;
        b=Y6YZ7nWkf1/itbORiEfHjiOTYAhXynHPRFlkhmLEP1QT7reiG05FyLxt5Lt47TY3BM
         LyFTZRfIP6bmEWsGykZ20de1ik80Acx2vCvqFYk30kawG2HT1yAcg0JwRH5rT5HzoQV6
         vRDBE/SQ/W2R55P6gVWnNXQf706t6VX+TF1d3MCSsc/kuTr6vKAK9pvT8VjGRI/eZIWe
         A+6gYPxQvhVQwczfo7y3MkSOWrJOZmso32Gblz1XD6yJkJ7uV/eaPK3JQQeZOBZCbHpy
         teqHe+bxqY9pJ4//0GJ3m9Q3NTQspNKfBVpTbDRu7NSlg7/ixXTPgaLSHGdfqvxthA9A
         pGkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZgDI7vm3;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ey2-20020a0562140b6200b004b18caf88bbsi8019160qvb.360.2022.12.05.01.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZgDI7vm3;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YV1dL1MmO+zuZsRAQOi5egpSmb0nyqOB4Pp4gBeiMus=;
	b=ZgDI7vm3ugnGVhvWEcNWOqEdyZ0OXbmsyhvS533UF/FtpTRDbO/vUzmcJEvNZxiRsRakG7
	9mgpyTnt7w9IPTEj1WM2FadMQkuSYyUZljzJ+fJF+QK+jX9S1qbDPthlr7MdKQUFV5nV6k
	4tslbLBApOADqNftjdYo0irIokYcdgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-6zXA80sVOp2p6re-Bfm4uA-1; Mon, 05 Dec 2022 04:54:54 -0500
X-MC-Unique: 6zXA80sVOp2p6re-Bfm4uA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 343A986EB61;
	Mon,  5 Dec 2022 09:54:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1C4E2166B29;
	Mon,  5 Dec 2022 09:54:45 +0000 (UTC)
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
	Klaus Jensen <k.jensen@samsung.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: [PATCH v2 17/51] hw/nvme: fix aio cancel in format
Date: Mon,  5 Dec 2022 10:51:54 +0100
Message-Id: <20221205095228.1314-18-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: H04J0AVH4EDx

From: Klaus Jensen <k.jensen@samsung.com>

There are several bugs in the async cancel code for the Format command.

Firstly, cancelling a format operation neglects to set iocb->ret as well
as clearing the iocb->aiocb after cancelling the underlying aiocb which
causes the aio callback to ignore the cancellation. Trivial fix.

Secondly, and worse, because the request is queued up for posting to the
CQ in a bottom half, if the cancellation is due to the submission queue
being deleted (which calls blk_aio_cancel), the req structure is
deallocated in nvme_del_sq prior to the bottom half being schedulued.

Fix this by simply removing the bottom half, there is no reason to defer
it anyway.

Fixes: 3bcf26d3d619 ("hw/nvme: reimplement format nvm to allow cancellation")
Reported-by: Jonathan Derrick <jonathan.derrick@linux.dev>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce50..9bc56075f6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5741,7 +5741,6 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 typedef struct NvmeFormatAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
-    QEMUBH *bh;
     NvmeRequest *req;
     int ret;
 
@@ -5756,14 +5755,15 @@ typedef struct NvmeFormatAIOCB {
     uint8_t pil;
 } NvmeFormatAIOCB;
 
-static void nvme_format_bh(void *opaque);
-
 static void nvme_format_cancel(BlockAIOCB *aiocb)
 {
     NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, common);
 
+    iocb->ret = -ECANCELED;
+
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
@@ -5787,13 +5787,17 @@ static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
     nvme_ns_init_format(ns);
 }
 
+static void nvme_do_format(NvmeFormatAIOCB *iocb);
+
 static void nvme_format_ns_cb(void *opaque, int ret)
 {
     NvmeFormatAIOCB *iocb = opaque;
     NvmeNamespace *ns = iocb->ns;
     int bytes;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -5817,8 +5821,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     iocb->offset = 0;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 }
 
 static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
@@ -5842,9 +5845,8 @@ static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
     return NVME_SUCCESS;
 }
 
-static void nvme_format_bh(void *opaque)
+static void nvme_do_format(NvmeFormatAIOCB *iocb)
 {
-    NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
@@ -5882,11 +5884,7 @@ static void nvme_format_bh(void *opaque)
     return;
 
 done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     iocb->common.cb(iocb->common.opaque, iocb->ret);
-
     qemu_aio_unref(iocb);
 }
 
@@ -5905,7 +5903,6 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_format_bh, iocb);
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
@@ -5934,14 +5931,13 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     }
 
     req->aiocb = &iocb->common;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 
     return NVME_NO_COMPLETE;
 
 out:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
     qemu_aio_unref(iocb);
+
     return status;
 }
 
-- 
2.38.1
