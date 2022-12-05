Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378699ejx;
        Mon, 5 Dec 2022 01:55:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ZCb8NGniulHcp7eZDE8zg4PXH1UG74P1bNoHsBodhyLX7pnrElC1IH06bE3zEKqj9h200
X-Received: by 2002:ad4:500e:0:b0:4c7:2784:61a3 with SMTP id s14-20020ad4500e000000b004c7278461a3mr18728538qvo.125.1670234110678;
        Mon, 05 Dec 2022 01:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234110; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9KnN9t1cDt7lQEiuCN7A+0pynlrg1HGM/uoWOwM5my7I570/E+JsVipQ7MjDefFpk
         j7Y9GNdK5Nic9E5QwTDBa/XiU8RME2+vrHavIfAeLMsL76iMrdfM2AVlKktDIvz8YvaG
         zpdlZoXWIFGc+4kNMuGg8lrhKFHV71TT0dBuJkruYVONnrkgthVFtkHNNHZw5Vi3zVZK
         P5JB604bo7RtKB6EZ5/gqO2yTkKhPZ99CS0W3VkexiYEecrakcux6Pg7jvD9PA2VErM4
         P299at2TLDrto69JtVLh1W3p9GYuQHuprSgAJ3wWg6r54ae1GPUQEwAjBnJLP3schVoD
         1Mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JPkwFkSSfq3t5RKWyqYzwK48WCnzhdeFXKl8nUjSzoI=;
        b=UvyID2KO8T1nE3YbZXLnu8wWq/939AqzPHgwTMHeUKGLOBOHRLqzCRLsDQiBM7iQ8L
         JHxVLES73fJZDxrrG8lCjHQ9GbuiaBozDo8eTEte8QJTQHATMQOVetQk1fd6NNyxKdMU
         2O+2bPTRlx3DctFZIA4rVo2odaWnN+wcDKXqBbzmujcGBb7qMLpikBIcMY4W9w1+ARVl
         HQK3x96bXc5NUcK0/dqIfMDdVrMfKcy4sMGxORRs44coqZvKcYBRM/zPuSzYF+Ey0T8/
         /8vK66ul3tY3OZQcwWHm8QT70GSGbLdT4ETKKagzUZJnx8WsaQ6QZ0S+tFrND4Whr/MM
         jBRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=djB03ouO;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v23-20020a05622a189700b0039cdbd7feedsi5313328qtc.541.2022.12.05.01.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:10 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=djB03ouO;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPkwFkSSfq3t5RKWyqYzwK48WCnzhdeFXKl8nUjSzoI=;
	b=djB03ouOgsiecUTL5eDu9zdAfWf6u66UgFD60rvbneQ15DonVCw5fzJAHUokfoyhxe8Agh
	Zwh5FOtBcCmljH40JTB5dak0vaxsb7eYWxrwwVPG+cO7e+vm/jkWe3htcqfKPX80pvflPF
	Dsy3tXCBBEHngHW6OnEAFkXS6NZHOmk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-E6DdkZKJPsuP8izcGK-kCA-1; Mon, 05 Dec 2022 04:55:02 -0500
X-MC-Unique: E6DdkZKJPsuP8izcGK-kCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E02493C0F663;
	Mon,  5 Dec 2022 09:55:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 820FC2166B29;
	Mon,  5 Dec 2022 09:54:53 +0000 (UTC)
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
Subject: [PATCH v2 18/51] hw/nvme: fix aio cancel in flush
Date: Mon,  5 Dec 2022 10:51:55 +0100
Message-Id: <20221205095228.1314-19-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 4QxqiB0sYh2Y

From: Klaus Jensen <k.jensen@samsung.com>

Make sure that iocb->aiocb is NULL'ed when cancelling.

Fix a potential use-after-free by removing the bottom half and enqueuing
the completion directly.

Fixes: 38f4ac65ac88 ("hw/nvme: reimplement flush to allow cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9bc56075f6..fede5af6af 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3160,7 +3160,6 @@ typedef struct NvmeFlushAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     NvmeNamespace *ns;
@@ -3176,6 +3175,7 @@ static void nvme_flush_cancel(BlockAIOCB *acb)
 
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
@@ -3185,6 +3185,8 @@ static const AIOCBInfo nvme_flush_aiocb_info = {
     .get_aio_context = nvme_get_aio_context,
 };
 
+static void nvme_do_flush(NvmeFlushAIOCB *iocb);
+
 static void nvme_flush_ns_cb(void *opaque, int ret)
 {
     NvmeFlushAIOCB *iocb = opaque;
@@ -3206,13 +3208,11 @@ static void nvme_flush_ns_cb(void *opaque, int ret)
     }
 
 out:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_flush(iocb);
 }
 
-static void nvme_flush_bh(void *opaque)
+static void nvme_do_flush(NvmeFlushAIOCB *iocb)
 {
-    NvmeFlushAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     int i;
@@ -3239,14 +3239,8 @@ static void nvme_flush_bh(void *opaque)
     return;
 
 done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     iocb->common.cb(iocb->common.opaque, iocb->ret);
-
     qemu_aio_unref(iocb);
-
-    return;
 }
 
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
@@ -3258,7 +3252,6 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     iocb = qemu_aio_get(&nvme_flush_aiocb_info, NULL, nvme_misc_cb, req);
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_flush_bh, iocb);
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
@@ -3280,13 +3273,11 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     }
 
     req->aiocb = &iocb->common;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_flush(iocb);
 
     return NVME_NO_COMPLETE;
 
 out:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
     qemu_aio_unref(iocb);
 
     return status;
-- 
2.38.1
