Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378754ejx;
        Mon, 5 Dec 2022 01:55:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4llyhjyS833sw3ar4bWjjZRLrjh2SB/1TMHY+dpR/UGlbUPLnq9SY/mBA09yKmOfu3HYDe
X-Received: by 2002:a0c:efc8:0:b0:4c7:7a9f:5653 with SMTP id a8-20020a0cefc8000000b004c77a9f5653mr408371qvt.72.1670234119140;
        Mon, 05 Dec 2022 01:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234119; cv=none;
        d=google.com; s=arc-20160816;
        b=Vory9i5n7V9M4Tn4Zi/TEzbDfO6r41MtfXMlFNvHd7X9tXZ6Hw9AGMwyx65ehQL+vg
         m6/ilgu7fdHD8RWRIZtMmpXAVp/mG0zOBQrxYeoXQpoh07X0WMyuipVfWOwgDzv4ojru
         tMSQWeWg3cnwMWeDHESLW1myU7Bbzrhl9vyvON5DN6zqcVzMqPMedKF8P2Xa+PMj0w2E
         A81BFIHxIaB7is+KTlawTZlymwx0kehBtsFIA8Ll8OXYDe3Net75QnFVP+nI9dAY5v5C
         Plh/tIe379IbCgFzAZ5eNs/3gdLNvc1krNJQC/mBTPnFyhjWMXgHTHLqf01hUOeXaMpo
         cq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e3XgTZKxlY8kzFFBQsUmpC/wSN3ufoA5pXR8Z5sxu4s=;
        b=yJG+7j841/sFSt1EeroCnAaFeFBakHrLIehjWqEzSx/v6fvrsnJ7yIvxOfo7YbGQaB
         zkzOlFqRlK0IaIgqxSwkpF1slmauliXWC9wC+go+6LSRnXbBgU145rNBBqwO2I1jU+WE
         g612DviYMnZe6FHmogOKls74jKr0jCXHP9RQ7+mOgl+koft6g899n20UwHD5WKU3D3bT
         TkSZAqBjr97Wyd0WG4/c66asANf5OtBV/JI0LangBEfykX5NJ29JvXVXoFCVbef0Phfj
         dMxHApYjF7wFFR50enlKb3HCupL++Y2u5RcljJRXJ+lE0K8978a50CTDxgloZxYsF7FZ
         ht9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AQpBSVMP;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cc9-20020a05622a410900b00397ab5a9b1csi7523218qtb.220.2022.12.05.01.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:19 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AQpBSVMP;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3XgTZKxlY8kzFFBQsUmpC/wSN3ufoA5pXR8Z5sxu4s=;
	b=AQpBSVMPcOBmAfQMz13c+/I3n8bKi1ANNLCKrOiRbJBqNrOBHWEcBGiBZxXu5/KySLI8kb
	lAxF96dr15z9jjfVeBz3YHQTNmBTtK1TEyWHwXX2fzq9ReByeUbOj2u9QJ2GG1DL/nkCqz
	7zYZ/Fls0CZ1aS9dkjFHH7uxWuOy//k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-EvfnM0ieOlWUXJVVxy2KuA-1; Mon, 05 Dec 2022 04:55:17 -0500
X-MC-Unique: EvfnM0ieOlWUXJVVxy2KuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56D7E1C0014B;
	Mon,  5 Dec 2022 09:55:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D99072166B29;
	Mon,  5 Dec 2022 09:55:08 +0000 (UTC)
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
Subject: [PATCH v2 20/51] hw/nvme: fix aio cancel in dsm
Date: Mon,  5 Dec 2022 10:51:57 +0100
Message-Id: <20221205095228.1314-21-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 70zrNWGexPcB

From: Klaus Jensen <k.jensen@samsung.com>

When the DSM operation is cancelled asynchronously, we set iocb->ret to
-ECANCELED. However, the callback function only checks the return value
of the completed aio, which may have completed succesfully prior to the
cancellation and thus the callback ends up continuing the dsm operation
instead of bailing out. Fix this.

Secondly, fix a potential use-after-free by removing the bottom half and
enqueuing the completion directly.

Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index bf4abf73f7..e847b89461 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2329,7 +2329,6 @@ typedef struct NvmeDSMAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     NvmeDsmRange *range;
@@ -2351,7 +2350,7 @@ static void nvme_dsm_cancel(BlockAIOCB *aiocb)
     } else {
         /*
          * We only reach this if nvme_dsm_cancel() has already been called or
-         * the command ran to completion and nvme_dsm_bh is scheduled to run.
+         * the command ran to completion.
          */
         assert(iocb->idx == iocb->nr);
     }
@@ -2362,17 +2361,6 @@ static const AIOCBInfo nvme_dsm_aiocb_info = {
     .cancel_async = nvme_dsm_cancel,
 };
 
-static void nvme_dsm_bh(void *opaque)
-{
-    NvmeDSMAIOCB *iocb = opaque;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-    qemu_aio_unref(iocb);
-}
-
 static void nvme_dsm_cb(void *opaque, int ret);
 
 static void nvme_dsm_md_cb(void *opaque, int ret)
@@ -2384,16 +2372,10 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto done;
     }
 
-    if (!ns->lbaf.ms) {
-        nvme_dsm_cb(iocb, 0);
-        return;
-    }
-
     range = &iocb->range[iocb->idx - 1];
     slba = le64_to_cpu(range->slba);
     nlb = le32_to_cpu(range->nlb);
@@ -2406,7 +2388,6 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_ZERO);
     if (ret) {
         if (ret < 0) {
-            iocb->ret = ret;
             goto done;
         }
 
@@ -2420,8 +2401,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     return;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_dsm_cb(iocb, ret);
 }
 
 static void nvme_dsm_cb(void *opaque, int ret)
@@ -2434,7 +2414,9 @@ static void nvme_dsm_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -2468,7 +2450,8 @@ next:
 
 done:
     iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_aio_unref(iocb);
 }
 
 static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
@@ -2486,7 +2469,6 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
                                          nvme_misc_cb, req);
 
         iocb->req = req;
-        iocb->bh = qemu_bh_new(nvme_dsm_bh, iocb);
         iocb->ret = 0;
         iocb->range = g_new(NvmeDsmRange, nr);
         iocb->nr = nr;
-- 
2.38.1
