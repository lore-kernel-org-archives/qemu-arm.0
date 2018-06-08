Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp748974wrq;
        Fri, 8 Jun 2018 04:20:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJuwNN4RjHHzaanwQdVbV6kUa44Gmvozrzjtt2cOerW8kUClAShV4cNqEawDIyIkFP5nwby
X-Received: by 2002:a37:8547:: with SMTP id h68-v6mr4890168qkd.340.1528456857317;
        Fri, 08 Jun 2018 04:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528456857; cv=none;
        d=google.com; s=arc-20160816;
        b=yjMkOtEqQqPOEkEU/G7l0Bty/kmeUhZSRFnYijYaD0LZiV8g1R7R07ffO7xZc473C2
         v4xPsxNzfhA/PWC32Hi28fKZRMX67z/fezlFZniP474xeptYMgJDoHsDuk4fAht9Sn6K
         oqas2RLsl0YewNGs93RTgpml/uiKjk5FNakUAI7Iz8uFg0JQMgYxq74E++kBRcLaKqqq
         lh/lsj9ElVtRQzCNvhpgWD+/IVcBg9ItDen+7NpQFw1kAaH1RSkoJO48LqEuXxtCNAHq
         6b14N3nJG6tl1PthBEB/RIw4L9M/nAghplasfNv8LuGWNa11/8WVsDtTQXJvRxxK3ewy
         tNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=d8LTerYFUbu3tAuGJkhu5PV3U/AK2MBLRnqFnJiq7kM=;
        b=BySpBrmH25h9lNyL0Ex6ivATr+2FdUeFkD30veLOnwddqi/VSXTd7oQG//7VdBK/sf
         gSToXSrSGUeUaBKFD6BIBP8YuB5vsC0yuy4mxG3e07SMa6NUmAuV4vkTwvzVwEx4eTWs
         6zdPz37oFNdmI5dVWcR4fIOqWqeoAIZOoSgXUVGj/iI23x4eVBqytrBZ1tKy16v1HpCB
         iZWjBzFALVSD3tlrWLBWTtJ6/c6BdrkeFtfoJ3RtdHix+C6U3zqiORZ4peSqzngfGrAh
         Ai/MenooFUXGYDI+m35zuZeSDUwvyQQ4ypKIGJkN8VX0kBk/zjt/IkluHNxXlBg12J0s
         a54Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s203-v6si3754813qke.188.2018.06.08.04.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFRw-0008Ag-Qe
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRJ-00085F-U2
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 07:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRG-0001me-2t
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 07:20:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38436 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fRFR7-0001ej-E2; Fri, 08 Jun 2018 07:20:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAD61406E974;
	Fri,  8 Jun 2018 11:20:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E49E1217B40A;
	Fri,  8 Jun 2018 11:20:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DBE6493CFF; Fri,  8 Jun 2018 13:20:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2018 13:19:59 +0200
Message-Id: <20180608112001.14729-5-kraxel@redhat.com>
In-Reply-To: <20180608112001.14729-1-kraxel@redhat.com>
References: <20180608112001.14729-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 08 Jun 2018 11:20:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 08 Jun 2018 11:20:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v3 4/6] hw/vfio/display: add ramfb support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9dj3Xsof71+

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

