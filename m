Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp397718wrq;
        Wed, 13 Jun 2018 01:42:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI3eZpG3tvYpgWg1Xsvl0xnE7MTaWCsTqSAkVZq+ezn1Xze+Me4LMH6vQ8kwOyYTdiwKF+z
X-Received: by 2002:a37:7b02:: with SMTP id w2-v6mr3411621qkc.247.1528879339970;
        Wed, 13 Jun 2018 01:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879339; cv=none;
        d=google.com; s=arc-20160816;
        b=HqoTiqTDIT422h/y+KikqDr9Av6c3PLNvINHbCqiGJqLAdDG7RQXrV7TISZhSIab5e
         +IQq+aZQOvBRY5SejVV9bwwxTWBByurDYE6HYkI+t5l0fq19wSt6k9l3Hg7zroy4g5ZI
         eG6IA896h689l1JZcfxqT+DFxJE2LOUAbUagmLMlEhV49WxJi9D+MOy0aOlYctUJNuSW
         Nt9WJfbwo6E9+GsmvmgTFHMsBYagFX1c2NMIqI8Xp1bOh50SMSrQIrpilx2Bol67HyBq
         C8Jcx/5jdVCmGrCjSPhi+gRR4zY5H8X6BRuS14eTFXXjqpYPeO+p6U4ayMozLyZNRxJ/
         00UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=d8LTerYFUbu3tAuGJkhu5PV3U/AK2MBLRnqFnJiq7kM=;
        b=LR19vq99SLf8JVv/PUQWkObsQnWb8RRsumqhQrgeWWCHGjZexgEGoK1htdST1z5F/V
         4isHz7CZm2zsiMiVvSoNbQIFND4smtKOzMH1C4FAR5+mRoudoYZ2JsAQxnGs4+MuYpmW
         7xctC3j4DBSa6XUYSQ416SP+2brT0bQmDyMf6a6NZ/QCTafq+yDVP6Yot+/BjcJw9oMR
         HzfHpTB6AtFZZAnmS/33jCNPHMv6VQgX+29DmbcxfMyl6g/XSaaffFFQ5vYJcLpoltsA
         nEpl+K+VtYq1Z4zCjPjkzQ0Irc05rGHdy4AuJgf5NnTmiU0BlOnsFHddJonaZ+bWTmLL
         qgTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b12-v6si1972908qtq.229.2018.06.13.01.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1MB-0005q2-F5
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT1Lm-0005gY-IA
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT1Lj-00016A-GH
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:41:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38758 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fT1Lj-00015v-BJ; Wed, 13 Jun 2018 04:41:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA21A4000D0B;
	Wed, 13 Jun 2018 08:41:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC2CF20244E1;
	Wed, 13 Jun 2018 08:41:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3CD5424EF16; Wed, 13 Jun 2018 10:41:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 10:41:49 +0200
Message-Id: <20180613084149.14523-4-kraxel@redhat.com>
In-Reply-To: <20180613084149.14523-1-kraxel@redhat.com>
References: <20180613084149.14523-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 08:41:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 08:41:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 3/3] hw/vfio/display: add ramfb support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: prrmmjB+4ud3

So we have a boot display when using a vgpu as primary display.

Use vfio-pci-ramfb instead of vfio-pci to enable it.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/display.c             | 10 ++++++++++
 hw/vfio/pci.c                 | 15 +++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index a9036929b2..a58d7e7e77 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -26,6 +26,7 @@
 #include "qemu/queue.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
+#include "hw/display/ramfb.h"
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
@@ -143,6 +144,7 @@ typedef struct VFIODMABuf {
 
 typedef struct VFIODisplay {
     QemuConsole *con;
+    RAMFBState *ramfb;
     struct {
         VFIORegion buffer;
         DisplaySurface *surface;
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index 59c0e5d1d7..409d5a2e3a 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -124,6 +124,9 @@ static void vfio_display_dmabuf_update(void *opaque)
 
     primary = vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
     if (primary == NULL) {
+        if (dpy->ramfb) {
+            ramfb_display_update(dpy->con, dpy->ramfb);
+        }
         return;
     }
 
@@ -181,6 +184,8 @@ static int vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
     vdev->dpy->con = graphic_console_init(DEVICE(vdev), 0,
                                           &vfio_display_dmabuf_ops,
                                           vdev);
+    if (strcmp(object_get_typename(OBJECT(vdev)), "vfio-pci-ramfb") == 0)
+        vdev->dpy->ramfb = ramfb_setup(errp);
     return 0;
 }
 
@@ -228,6 +233,9 @@ static void vfio_display_region_update(void *opaque)
         return;
     }
     if (!plane.drm_format || !plane.size) {
+        if (dpy->ramfb) {
+            ramfb_display_update(dpy->con, dpy->ramfb);
+        }
         return;
     }
     format = qemu_drm_format_to_pixman(plane.drm_format);
@@ -300,6 +308,8 @@ static int vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
     vdev->dpy->con = graphic_console_init(DEVICE(vdev), 0,
                                           &vfio_display_region_ops,
                                           vdev);
+    if (strcmp(object_get_typename(OBJECT(vdev)), "vfio-pci-ramfb") == 0)
+        vdev->dpy->ramfb = ramfb_setup(errp);
     return 0;
 }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 18c493b49e..6a2b42a595 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3234,9 +3234,24 @@ static const TypeInfo vfio_pci_dev_info = {
     },
 };
 
+static void vfio_pci_ramfb_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->hotpluggable = false;
+}
+
+static const TypeInfo vfio_pci_ramfb_dev_info = {
+    .name = "vfio-pci-ramfb",
+    .parent = "vfio-pci",
+    .instance_size = sizeof(VFIOPCIDevice),
+    .class_init = vfio_pci_ramfb_dev_class_init,
+};
+
 static void register_vfio_pci_dev_type(void)
 {
     type_register_static(&vfio_pci_dev_info);
+    type_register_static(&vfio_pci_ramfb_dev_info);
 }
 
 type_init(register_vfio_pci_dev_type)
-- 
2.9.3

