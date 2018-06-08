Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp748612wrq;
        Fri, 8 Jun 2018 04:20:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIX09UOPHnSUVgKrXAs7zXe2cl3X/Ro+cEplAeFfJrFrfaSkvkNtKz/YZkZw9QA7/qVIf9C
X-Received: by 2002:a0c:aa4d:: with SMTP id e13-v6mr5115850qvb.26.1528456835711;
        Fri, 08 Jun 2018 04:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528456835; cv=none;
        d=google.com; s=arc-20160816;
        b=FY75pIPr6msK7KEvhbefYbZgxlGLSYHAhXhQ7kiHX2Q1OjQshz10g7ot5GcSjikKU6
         QqkKt6jG9EpOpr2DMQ6xb0Vc5i8cyBCqGlGC6JRAgxRJDjoWojOYJVhjk75NUg3Gx/1K
         faqGQqfjSbSAN4twxLuaxuNJYmEGKJh58Jk19zgHCvq4KR3yhPs+MLHNmsDMg9NfcEEK
         bIyVVKjfqCYM4cIAwYVIFJmOpMeCqCm6I+s4qdo6ZnfUkdtuIz7XJB2HcJ7DyCWfYtPy
         0QuEXLrvB9md6+xpbl4weDCPPyleO0NVxXIYticrGGO7Y5pGTgTePOFgZ2coyhTZFliW
         ijVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=uOE2wSgXs6GPpcRdMwmLt8df6UW/oh0CsoZIjVvfasw=;
        b=YwoKKunGteuGhqLwKqLJsZpuJtvTkXGL2bKQAGj8L/u0nY+1XOHkzX6xd1aMSFRfLL
         kYQiv68ERqd+nPUUM84ZZb2nKGclN+XcX8vq2TsKxPEuhXgm93+mO8qxg0Lvu91vxdbM
         58zlPxPcmCabquH/cVivl9bcijojmKpz+moY1Lq7+MZb7fBEAKfMNWBQ6dtmRIZnffTW
         yetNoU/4yZKG5m80RyYZIf2dTbXis1bVF8gbgzUtLI1W1yE/OjsX3ugl9hIdNQkhhaho
         XSPPaPk5JV8HZwItzJjofc2II9dCujJrSsbv9XVm9rDh1X02tcziXo5YphE3d3t8PdYR
         Gqvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k31-v6si1067042qvf.138.2018.06.08.04.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFRb-00085u-3y
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRH-000830-1z
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRF-0001mM-Pg
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45702 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fRFRF-0001mD-K5; Fri, 08 Jun 2018 07:20:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E03B81B0325;
	Fri,  8 Jun 2018 11:20:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F10A510EE6CE;
	Fri,  8 Jun 2018 11:20:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D2076423E6; Fri,  8 Jun 2018 13:20:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2018 13:19:58 +0200
Message-Id: <20180608112001.14729-4-kraxel@redhat.com>
In-Reply-To: <20180608112001.14729-1-kraxel@redhat.com>
References: <20180608112001.14729-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 08 Jun 2018 11:20:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 08 Jun 2018 11:20:13 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 3/6] hw/display: add virtio-ramfb device
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
X-TUID: 8IK+9vBp6n41

Like virtio-vga, but using ramfb instead of legacy vga.

Note: Not clear yet whenever this will be ever merged upstream.
      No clear benefit, given that edk2 has a virtio-gpu driver
      which doesn't depend on the vga compatibility mode.

      Will keeping it in the devel branch for now, for testing
      purposes and as playground.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-ramfb.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/display/Makefile.objs  |   2 +-
 2 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 hw/display/virtio-ramfb.c

diff --git a/hw/display/virtio-ramfb.c b/hw/display/virtio-ramfb.c
new file mode 100644
index 0000000000..e8ffe66047
--- /dev/null
+++ b/hw/display/virtio-ramfb.c
@@ -0,0 +1,149 @@
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "hw/pci/pci.h"
+#include "ui/console.h"
+#include "hw/virtio/virtio-pci.h"
+#include "hw/display/ramfb.h"
+#include "qapi/error.h"
+
+/*
+ * virtio-ramfb: This extends VirtioPCIProxy.
+ */
+#define TYPE_VIRTIO_RAMFB "virtio-ramfb"
+#define VIRTIO_RAMFB(obj) \
+        OBJECT_CHECK(VirtIORAMFB, (obj), TYPE_VIRTIO_RAMFB)
+
+typedef struct VirtIORAMFB {
+    VirtIOPCIProxy parent_obj;
+    VirtIOGPU      vdev;
+    RAMFBState     *ramfb;
+} VirtIORAMFB;
+
+static void virtio_ramfb_invalidate_display(void *opaque)
+{
+    VirtIORAMFB *vramfb = opaque;
+
+    if (vramfb->vdev.enable) {
+        virtio_gpu_ops.invalidate(&vramfb->vdev);
+    }
+}
+
+static void virtio_ramfb_update_display(void *opaque)
+{
+    VirtIORAMFB *vramfb = opaque;
+    VirtIOGPU *g = &vramfb->vdev;
+
+    if (vramfb->vdev.enable) {
+        virtio_gpu_ops.gfx_update(&vramfb->vdev);
+    } else {
+        ramfb_display_update(g->scanout[0].con, vramfb->ramfb);
+    }
+}
+
+static int virtio_ramfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+{
+    VirtIORAMFB *vramfb = opaque;
+
+    if (virtio_gpu_ops.ui_info) {
+        return virtio_gpu_ops.ui_info(&vramfb->vdev, idx, info);
+    }
+    return -1;
+}
+
+static void virtio_ramfb_gl_block(void *opaque, bool block)
+{
+    VirtIORAMFB *vramfb = opaque;
+
+    if (virtio_gpu_ops.gl_block) {
+        virtio_gpu_ops.gl_block(&vramfb->vdev, block);
+    }
+}
+
+static const GraphicHwOps virtio_ramfb_ops = {
+    .invalidate = virtio_ramfb_invalidate_display,
+    .gfx_update = virtio_ramfb_update_display,
+    .ui_info = virtio_ramfb_ui_info,
+    .gl_block = virtio_ramfb_gl_block,
+};
+
+static const VMStateDescription vmstate_virtio_ramfb = {
+    .name = "virtio-ramfb",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        /* no pci stuff here, saving the virtio device will handle that */
+        /* FIXME */
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+/* RAMFB device wrapper around PCI device around virtio GPU */
+static void virtio_ramfb_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VirtIORAMFB *vramfb = VIRTIO_RAMFB(vpci_dev);
+    VirtIOGPU *g = &vramfb->vdev;
+    Error *err = NULL;
+    int i;
+
+    /* init virtio bits */
+    qdev_set_parent_bus(DEVICE(g), BUS(&vpci_dev->bus));
+    virtio_pci_force_virtio_1(vpci_dev);
+    object_property_set_bool(OBJECT(g), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    /* init ramfb */
+    vramfb->ramfb = ramfb_setup(errp);
+    graphic_console_set_hwops(g->scanout[0].con, &virtio_ramfb_ops, vramfb);
+
+    for (i = 0; i < g->conf.max_outputs; i++) {
+        object_property_set_link(OBJECT(g->scanout[i].con),
+                                 OBJECT(vpci_dev),
+                                 "device", errp);
+    }
+}
+
+static Property virtio_ramfb_properties[] = {
+    DEFINE_VIRTIO_GPU_PCI_PROPERTIES(VirtIOPCIProxy),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_ramfb_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->props = virtio_ramfb_properties;
+    dc->vmsd = &vmstate_virtio_ramfb;
+    dc->hotpluggable = false;
+
+    k->realize = virtio_ramfb_realize;
+    pcidev_k->class_id = PCI_CLASS_DISPLAY_OTHER;
+}
+
+static void virtio_ramfb_inst_initfn(Object *obj)
+{
+    VirtIORAMFB *dev = VIRTIO_RAMFB(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_GPU);
+}
+
+static TypeInfo virtio_ramfb_info = {
+    .name          = TYPE_VIRTIO_RAMFB,
+    .parent        = TYPE_VIRTIO_PCI,
+    .instance_size = sizeof(struct VirtIORAMFB),
+    .instance_init = virtio_ramfb_inst_initfn,
+    .class_init    = virtio_ramfb_class_init,
+};
+
+static void virtio_ramfb_register_types(void)
+{
+    type_register_static(&virtio_ramfb_info);
+}
+
+type_init(virtio_ramfb_register_types)
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index fb8408c6d0..e70e71ac5c 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -40,7 +40,7 @@ obj-$(CONFIG_VGA) += vga.o
 common-obj-$(CONFIG_QXL) += qxl.o qxl-logger.o qxl-render.o
 
 obj-$(CONFIG_VIRTIO_GPU) += virtio-gpu.o virtio-gpu-3d.o
-obj-$(call land,$(CONFIG_VIRTIO_GPU),$(CONFIG_VIRTIO_PCI)) += virtio-gpu-pci.o
+obj-$(call land,$(CONFIG_VIRTIO_GPU),$(CONFIG_VIRTIO_PCI)) += virtio-gpu-pci.o virtio-ramfb.o
 obj-$(CONFIG_VIRTIO_VGA) += virtio-vga.o
 virtio-gpu.o-cflags := $(VIRGL_CFLAGS)
 virtio-gpu.o-libs += $(VIRGL_LIBS)
-- 
2.9.3

