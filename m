Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2130112wrd;
        Sun, 2 Sep 2018 23:58:26 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY0jkAMr4Pv/xKK+KWo3BCCZgzEJp3r5pdi/xwGS66WA1EM1qdVtqoQLYwKFWvi4VXEETv8
X-Received: by 2002:ad4:40cf:: with SMTP id x15-v6mr24405955qvp.213.1535957906081;
        Sun, 02 Sep 2018 23:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535957906; cv=none;
        d=google.com; s=arc-20160816;
        b=0WqXlT3HUgmmBU/EYPYkcOk3fL0QQbFQDl4ONsUSaNbbx4Ya4EOY+ruV4mZFUbgVMd
         j4drQqJj0zc1vXS/S+bvJ+VeIqAswtIkt2rta31JDbEatURq4BfKf1gIeGxgWf7r+AkG
         Qa9gfQXkQ0xrL0FfUGXqaRAddRGGHWhZyL27cJvimhjGgVrizCynoRN9wokonlwb9jnK
         t/05O/8YuLwjFQkvivShUvy6d4sAVvcPmNVCYB45KttFzJ/sR3DH3yW6RgxVP0SRbE1s
         4Sml4iaWk1W1jHDNGp5B+D4vgY5YaMd8RBIvUHxyXZ9D7R86wlaL5s4XiTYaByBQEREj
         X/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ENAUH/3r9hf2lqaOB3qxmJ3bGAwTIfOBpoH698/3NfY=;
        b=VgE2fEF3/38wVeDbpCtLH9050OzIKHlzAJ5PahsArYLR77vESNZgsvsXrtksIAEOQR
         RxsSwWGnk8iPYCqRKV6XVxTaaQn95r4QIMYnhaE54WgDD6ITDQ//D3JcGlAiqWXd9K7z
         sRp4EBatwlsXD/4Itt/qxqeoSg9T+93uOMQo/BsVQrULnI0MqHgSIiDhr/AV2w2+wvYp
         ZJ6z0eyBxpmMHyt7jqcasgS2OZ9hELtfhEum8VJil1wisBEvef1cNMdoZaFSRoSoHZWx
         jTvst+if/XWmCj+PMrDK08rtLkiZNLr/vfjlWwDKN3qGikT0GuHI8mjalPQUrNrI56dx
         fzqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z190-v6si14123397qkb.177.2018.09.02.23.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Sep 2018 23:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fwiob-0002qx-I7
	for alex.bennee@linaro.org; Mon, 03 Sep 2018 02:58:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio7-0001lQ-Hx
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio4-0008D9-V8
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49296 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fwio4-0008Cr-P7; Mon, 03 Sep 2018 02:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AA5A40241C4;
	Mon,  3 Sep 2018 06:57:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 029B82166BA1;
	Mon,  3 Sep 2018 06:57:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 29D579B2E; Mon,  3 Sep 2018 08:57:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Sep 2018 08:57:45 +0200
Message-Id: <20180903065745.23055-6-kraxel@redhat.com>
In-Reply-To: <20180903065745.23055-1-kraxel@redhat.com>
References: <20180903065745.23055-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 03 Sep 2018 06:57:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 03 Sep 2018 06:57:52 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 5/5] virtio-gpu: add iommu support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rydjxNwg5HM2

Switch from cpu_physical_memory_map to dma_memory_map,
so iommu mappings for virtio-gpu objects work properly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20180829122101.29852-3-kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index cf31b5f710..7be3a9d404 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -17,6 +17,7 @@
 #include "qemu/iov.h"
 #include "ui/console.h"
 #include "trace.h"
+#include "sysemu/dma.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-bus.h"
@@ -726,7 +727,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
         uint32_t l = le32_to_cpu(ents[i].length);
         hwaddr len = l;
         (*iov)[i].iov_len = l;
-        (*iov)[i].iov_base = cpu_physical_memory_map(a, &len, 1);
+        (*iov)[i].iov_base = dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
+                                            a, &len, DMA_DIRECTION_TO_DEVICE);
         if (addr) {
             (*addr)[i] = a;
         }
@@ -754,8 +756,10 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
     int i;
 
     for (i = 0; i < count; i++) {
-        cpu_physical_memory_unmap(iov[i].iov_base, iov[i].iov_len, 1,
-                                  iov[i].iov_len);
+        dma_memory_unmap(VIRTIO_DEVICE(g)->dma_as,
+                         iov[i].iov_base, iov[i].iov_len,
+                         DMA_DIRECTION_TO_DEVICE,
+                         iov[i].iov_len);
     }
     g_free(iov);
 }
@@ -1147,13 +1151,17 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
         for (i = 0; i < res->iov_cnt; i++) {
             hwaddr len = res->iov[i].iov_len;
             res->iov[i].iov_base =
-                cpu_physical_memory_map(res->addrs[i], &len, 1);
+                dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
+                               res->addrs[i], &len, DMA_DIRECTION_TO_DEVICE);
 
             if (!res->iov[i].iov_base || len != res->iov[i].iov_len) {
                 /* Clean up the half-a-mapping we just created... */
                 if (res->iov[i].iov_base) {
-                    cpu_physical_memory_unmap(res->iov[i].iov_base,
-                                              len, 0, 0);
+                    dma_memory_unmap(VIRTIO_DEVICE(g)->dma_as,
+                                     res->iov[i].iov_base,
+                                     res->iov[i].iov_len,
+                                     DMA_DIRECTION_TO_DEVICE,
+                                     res->iov[i].iov_len);
                 }
                 /* ...and the mappings for previous loop iterations */
                 res->iov_cnt = i;
@@ -1205,11 +1213,6 @@ static void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     Error *local_err = NULL;
     int i;
 
-    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
-        error_setg(errp, "virtio-gpu does not support vIOMMU yet");
-        return;
-    }
-
     if (g->conf.max_outputs > VIRTIO_GPU_MAX_SCANOUTS) {
         error_setg(errp, "invalid max_outputs > %d", VIRTIO_GPU_MAX_SCANOUTS);
         return;
-- 
2.9.3

