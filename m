Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378721ejx;
        Mon, 5 Dec 2022 01:55:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4w9Sudo/uxDNsAjVWd30va/O3ShAhnUnlseIjQZ6e+ypqP+Z1HvIVHgx64DcmSU5OQxr1D
X-Received: by 2002:a05:6214:3482:b0:4c6:8cba:470b with SMTP id mr2-20020a056214348200b004c68cba470bmr22201292qvb.26.1670234113550;
        Mon, 05 Dec 2022 01:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234113; cv=none;
        d=google.com; s=arc-20160816;
        b=gorZNzxtEx+OrejBI3pvxhQ4ff9DiiqFZ85xGnQcDK+Wn73wVr6bIomHZkkjz31GIK
         SkWqxltHyZrfo+wxfSox3zmux1voYfLIXSkiypKL/A+yWtamVENy5OYsM1aLC/GdXYZ9
         KQplbAkorq+dszn556KtSSLu5LmL5QndsOfwfKAS//Solq6tdAwbJh/4XuDqWnMSB6Yi
         rDvPsF5IkUtfuaLe/SBikW4CnkfFZ94ASSQU3vX2CvYEvXwWBuC+jJNLnWVxYoDrnDrq
         JyJzR0WzGL0o+sh6qEwAyCv+abBW0iDVzmEqr3HzGrVyTvcmGAL9GXnLUhpK/ufha5So
         xZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NlagijAifTdV86tivIA25I3dGfVhQXxNyB5r7aWw5KE=;
        b=Gb4CbtlsO5V4ZPeehNxJoTadypHuE+hzCpVpl35wB05EXX3E80I3jJiCJTHcTIhAox
         WVMIImUpldL8dY7Tgki0bnbS6kuFCpz1b15nU5WfTPTvN5hcenyd8YvD5dhbpyMkccdd
         cN0wVDcEUBfKz43G8aUTYBAfuNiP4B4+UPN68kc5u0H3qVy/NR8iiiBOw0z8GaCRqjU9
         rSnWWI64zWG+ypI19bVy4WIZLeDrgbWkcJzW3ICR1ismhtIyXLNlrXYZrSqIJHRHGQK9
         bu3Gt0xqhxoFHjeyJlO1+581TVE4WBbe+310YGXhLUhwLvwpEcVQW/8b/w82pEv2ugFG
         INXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BImkW57N;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fw12-20020a05622a4a8c00b003a5270cfbfdsi947526qtb.195.2022.12.05.01.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:13 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BImkW57N;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NlagijAifTdV86tivIA25I3dGfVhQXxNyB5r7aWw5KE=;
	b=BImkW57NS51c2jOa1RiCYw3NF6XfRHxjJrZSucUGk5DQ4h5r9/7FNzdGdnaYcDRmBEZGa1
	5svGXm4ubdpH6WKc1T7ByG1up832F246LTRQ3wb7AY1gq2ToZSjtRnnoQRsAKaAyXj4DcG
	bRwGe+UdEaA2YhZ2wwwlMG1jOwi0Sk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-3HH99AajNVmMvwQ0_5_3JA-1; Mon, 05 Dec 2022 04:55:10 -0500
X-MC-Unique: 3HH99AajNVmMvwQ0_5_3JA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CA10101A52A;
	Mon,  5 Dec 2022 09:55:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 388902166B29;
	Mon,  5 Dec 2022 09:55:01 +0000 (UTC)
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
Subject: [PATCH v2 19/51] hw/nvme: fix aio cancel in zone reset
Date: Mon,  5 Dec 2022 10:51:56 +0100
Message-Id: <20221205095228.1314-20-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: CoXxNPX0j8Ud

From: Klaus Jensen <k.jensen@samsung.com>

If the zone reset operation is cancelled but the block unmap operation
completes normally, the callback will continue resetting the next zone
since it neglects to check iocb->ret which will have been set to
-ECANCELED. Make sure that this is checked and bail out if an error is
present.

Secondly, fix a potential use-after-free by removing the bottom half and
enqueuing the completion directly.

Fixes: 63d96e4ffd71 ("hw/nvme: reimplement zone reset to allow cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fede5af6af..bf4abf73f7 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3712,7 +3712,6 @@ typedef struct NvmeZoneResetAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     bool all;
@@ -3741,17 +3740,6 @@ static const AIOCBInfo nvme_zone_reset_aiocb_info = {
     .cancel_async = nvme_zone_reset_cancel,
 };
 
-static void nvme_zone_reset_bh(void *opaque)
-{
-    NvmeZoneResetAIOCB *iocb = opaque;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-    qemu_aio_unref(iocb);
-}
-
 static void nvme_zone_reset_cb(void *opaque, int ret);
 
 static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
@@ -3762,14 +3750,8 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     int64_t moff;
     int count;
 
-    if (ret < 0) {
-        nvme_zone_reset_cb(iocb, ret);
-        return;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_zone_reset_cb(iocb, 0);
-        return;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
+        goto out;
     }
 
     moff = nvme_moff(ns, iocb->zone->d.zslba);
@@ -3779,6 +3761,9 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
                                         BDRV_REQ_MAY_UNMAP,
                                         nvme_zone_reset_cb, iocb);
     return;
+
+out:
+    nvme_zone_reset_cb(iocb, ret);
 }
 
 static void nvme_zone_reset_cb(void *opaque, int ret)
@@ -3787,7 +3772,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -3835,9 +3822,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
 
 done:
     iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_aio_unref(iocb);
 }
 
 static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeCtrl *n, NvmeZone *zone,
@@ -3942,7 +3929,6 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
                            nvme_misc_cb, req);
 
         iocb->req = req;
-        iocb->bh = qemu_bh_new(nvme_zone_reset_bh, iocb);
         iocb->ret = 0;
         iocb->all = all;
         iocb->idx = zone_idx;
-- 
2.38.1
