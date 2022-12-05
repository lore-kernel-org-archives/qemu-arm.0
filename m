Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378859ejx;
        Mon, 5 Dec 2022 01:55:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5OgIlNQR//Welvcuq8xX9COU78eQGciLSQAKZJoJn+Dg25EHsQdizzBhKfOLZ8E4TwLCn+
X-Received: by 2002:ae9:ee02:0:b0:6fa:3043:8898 with SMTP id i2-20020ae9ee02000000b006fa30438898mr57521947qkg.190.1670234129367;
        Mon, 05 Dec 2022 01:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234129; cv=none;
        d=google.com; s=arc-20160816;
        b=nX/BYa9AtYczZ1Sls9lwrT6JHFUGT9fkUXkeYh03Qd/biz0Mj/+GsUelDxfXAZMGrm
         Vea6cEoskSotXgbD9haSxi1ckLQyVEf4KWx6NgczzXXpuYlr1u0KpttYS21WUR55TI5t
         8lhYHEpZHxCc4uyXR0eVd2Yma+kfNZh/5ivR4P/DvhcMpBx4Oa+tgxf6GqL7a3gyLUyF
         glx+MNvUMXCwkEegLHT/ki3zya/38QF3vHCGxkiXfTKMn8I0xzgm6H3jHHORwyexFoFP
         WSi1y3Oy9oi1mGS1h7VSO3hYsTd4T6qr3oiqgytAGPQsETzEexdfyoWNX7PhQlPb+FYi
         UgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EFic7YT524egGmw/B509nqdEJnuGBPLVOsqSxAeUT6k=;
        b=Ev0FRvd4elBuG7VZejR84C1ukHvYcCVoyqf+/TjipHLJsZPkShoqZTrDQy9kVJsPy5
         YP8uJhFjx26G1jZJ0APBNMlHuNS5Z8Lb51ndgyRo4tTwsshOLUN8DR15OqpiRhKLKB+D
         bvWfrtQetFs6VSegwiBVpfllPEHu3QvFDHZmHt0ZcSGJ4hIgVOvljCScSQcXL7rlrlyn
         9PgxMDBPcLS8MLH2aheUqeb2NdWOhlKmNp5zJ7Pt7ITRY4jDqdn34CoHDI/Vwxcab3Wi
         Ls/lCcU2yL5A7rYdQWIhZwSeVK5jeFcvPmfafcbNcTrzV2lyT9wfIZ5HVbHG6O+sZN0Z
         /H3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jRIxuHC1;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bw27-20020a05622a099b00b003a4f3f7927bsi8010056qtb.335.2022.12.05.01.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jRIxuHC1;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFic7YT524egGmw/B509nqdEJnuGBPLVOsqSxAeUT6k=;
	b=jRIxuHC1KZ1l1GPR6jKrb+Z4uOyIa07SO+7QFF9L7FIE60afWAdzknYv3kW4l3HtFTW1fo
	pmvmsFPluuJXKflreUZXqfXOdStkcFO20q6Ow7VlHM76iVeaNZozSS9LmxyH+8+UuJ8sty
	Xk+HQ3SHLDnYH9YiAS+6G9oBTXKlmck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-WfdBrC-2PRCRTxiVkN3Gxg-1; Mon, 05 Dec 2022 04:55:25 -0500
X-MC-Unique: WfdBrC-2PRCRTxiVkN3Gxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1731E86F12A;
	Mon,  5 Dec 2022 09:55:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB3D32166B29;
	Mon,  5 Dec 2022 09:55:16 +0000 (UTC)
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
	Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 21/51] hw/nvme: remove copy bh scheduling
Date: Mon,  5 Dec 2022 10:51:58 +0100
Message-Id: <20221205095228.1314-22-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 0W9oA5P5Z3Oy

From: Klaus Jensen <k.jensen@samsung.com>

Fix a potential use-after-free by removing the bottom half and enqueuing
the completion directly.

Fixes: 796d20681d9b ("hw/nvme: reimplement the copy command to allow aio cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 63 +++++++++++---------------------------------------
 1 file changed, 14 insertions(+), 49 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e847b89461..e54276dc1d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2552,7 +2552,6 @@ typedef struct NvmeCopyAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     void *ranges;
@@ -2590,9 +2589,8 @@ static const AIOCBInfo nvme_copy_aiocb_info = {
     .cancel_async = nvme_copy_cancel,
 };
 
-static void nvme_copy_bh(void *opaque)
+static void nvme_copy_done(NvmeCopyAIOCB *iocb)
 {
-    NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
     BlockAcctStats *stats = blk_get_stats(ns->blkconf.blk);
@@ -2604,9 +2602,6 @@ static void nvme_copy_bh(void *opaque)
     qemu_iovec_destroy(&iocb->iov);
     g_free(iocb->bounce);
 
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     if (iocb->ret < 0) {
         block_acct_failed(stats, &iocb->acct.read);
         block_acct_failed(stats, &iocb->acct.write);
@@ -2619,7 +2614,7 @@ static void nvme_copy_bh(void *opaque)
     qemu_aio_unref(iocb);
 }
 
-static void nvme_copy_cb(void *opaque, int ret);
+static void nvme_do_copy(NvmeCopyAIOCB *iocb);
 
 static void nvme_copy_source_range_parse_format0(void *ranges, int idx,
                                                  uint64_t *slba, uint32_t *nlb,
@@ -2731,7 +2726,7 @@ static void nvme_copy_out_completed_cb(void *opaque, int ret)
     iocb->idx++;
     iocb->slba += nlb;
 out:
-    nvme_copy_cb(iocb, iocb->ret);
+    nvme_do_copy(iocb);
 }
 
 static void nvme_copy_out_cb(void *opaque, int ret)
@@ -2743,16 +2738,8 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     size_t mlen;
     uint8_t *mbounce;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto out;
-    } else if (iocb->ret < 0) {
-        goto out;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_copy_out_completed_cb(iocb, 0);
-        return;
     }
 
     nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, NULL,
@@ -2771,7 +2758,7 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     return;
 
 out:
-    nvme_copy_cb(iocb, ret);
+    nvme_copy_out_completed_cb(iocb, ret);
 }
 
 static void nvme_copy_in_completed_cb(void *opaque, int ret)
@@ -2865,15 +2852,9 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
 
 invalid:
     req->status = status;
-    iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
-
-    return;
-
+    iocb->ret = -1;
 out:
-    nvme_copy_cb(iocb, ret);
+    nvme_do_copy(iocb);
 }
 
 static void nvme_copy_in_cb(void *opaque, int ret)
@@ -2884,16 +2865,8 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto out;
-    } else if (iocb->ret < 0) {
-        goto out;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_copy_in_completed_cb(iocb, 0);
-        return;
     }
 
     nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
@@ -2909,12 +2882,11 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     return;
 
 out:
-    nvme_copy_cb(iocb, iocb->ret);
+    nvme_copy_in_completed_cb(iocb, ret);
 }
 
-static void nvme_copy_cb(void *opaque, int ret)
+static void nvme_do_copy(NvmeCopyAIOCB *iocb)
 {
-    NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
     uint64_t slba;
@@ -2922,10 +2894,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     size_t len;
     uint16_t status;
 
-    if (ret < 0) {
-        iocb->ret = ret;
-        goto done;
-    } else if (iocb->ret < 0) {
+    if (iocb->ret < 0) {
         goto done;
     }
 
@@ -2972,14 +2941,11 @@ static void nvme_copy_cb(void *opaque, int ret)
 
 invalid:
     req->status = status;
+    iocb->ret = -1;
 done:
-    iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
+    nvme_copy_done(iocb);
 }
 
-
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -3049,7 +3015,6 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_copy_bh, iocb);
     iocb->ret = 0;
     iocb->nr = nr;
     iocb->idx = 0;
@@ -3066,7 +3031,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
                      BLOCK_ACCT_WRITE);
 
     req->aiocb = &iocb->common;
-    nvme_copy_cb(iocb, 0);
+    nvme_do_copy(iocb);
 
     return NVME_NO_COMPLETE;
 
-- 
2.38.1
