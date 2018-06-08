Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp748955wrq;
        Fri, 8 Jun 2018 04:20:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ5ZkaASy71WH8iWii4G3B25Z650vbpLFuDAxGDd46zEajDo/sRd38mH5Uy3q4pDrYLK16z
X-Received: by 2002:a0c:b753:: with SMTP id q19-v6mr5202760qve.82.1528456856608;
        Fri, 08 Jun 2018 04:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528456856; cv=none;
        d=google.com; s=arc-20160816;
        b=VxAeFK2uBvNsldyL+zzCyCpZWlGkktRZTEFOKfFL+xRM9L1/cE7WuNVH2FBE2/ellg
         CI41WKXMjez3PU8PYsl7MsAaoV7eEIo08C2cf+WokqDZcBz2mrJiTKqr8HR/VgGAHZFF
         1HqU+sIij573sT7nC+O80F0t9w/d60eoEeEJWKXDVgkjZu/RpG5KRH/PAxK+YztimzKl
         pkWy7W1rH7TfTTFVRD7rsm9u3Gv2KNblqd8eUxu6Zv/fdUrhtDwUaTipoiQxtxdHOCx8
         qRxneAS73ZjB2ISRYrUN1/rUzJVc6m+hVmEm8/Ev59PKh0HdYwQUVXq8kUMFs6BendFF
         p70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Uvm0GSCfLbEfVpzYhgiOxZCDjLWAFPRq8hmLp0m9XJA=;
        b=DFtdxCEMQuFfyPkvWK9N9apkP0K/E5b+sgMRyNOsNWs37zCBE32lmYAFWlNIFsjMWm
         W6Hq6pKKg0WknnLdKHPBM5UJInp4QftURQq4AUKhsSS3CideFFsiGxjVj/+qIT7U84ZT
         3U9ga7jqBNcBej+Bx0XoUs1FUFPHHvp2kbj5p82zjw71uxlVlIMVBCvNGIMcR/Tt6f9T
         Y1GYAn1YT+bfeyJPbdI5IeOxg7V0k9CEwzYmR0rRIQk2C14QMHLxVu+ODvQb0DFC7Tj/
         wS49OwrKM0YKwgCEijiPA0l34ARfFPnlR518Zwh6ZyB3XxLu4aBWWNuoB3HDChfdf+YH
         KIqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l63-v6si7393141qkd.301.2018.06.08.04.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFRw-000870-1r
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRI-00084I-BV
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 07:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRE-0001li-5E
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 07:20:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fRFR6-0001eN-G7; Fri, 08 Jun 2018 07:20:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D96378884C;
	Fri,  8 Jun 2018 11:20:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D874202699C;
	Fri,  8 Jun 2018 11:20:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C788A422B8; Fri,  8 Jun 2018 13:20:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2018 13:19:57 +0200
Message-Id: <20180608112001.14729-3-kraxel@redhat.com>
In-Reply-To: <20180608112001.14729-1-kraxel@redhat.com>
References: <20180608112001.14729-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 11:20:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 11:20:03 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v3 2/6] hw/display: add standalone ramfb device
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
X-TUID: mwQepIVd/AW4

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/ramfb.h    |  3 +++
 hw/arm/sysbus-fdt.c           |  7 +++++
 hw/arm/virt.c                 |  2 ++
 hw/display/ramfb-standalone.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c             |  2 ++
 hw/i386/pc_q35.c              |  2 ++
 hw/display/Makefile.objs      |  1 +
 7 files changed, 79 insertions(+)
 create mode 100644 hw/display/ramfb-standalone.c

diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
index a3d4c79942..b33a2c467b 100644
--- a/include/hw/display/ramfb.h
+++ b/include/hw/display/ramfb.h
@@ -6,4 +6,7 @@ typedef struct RAMFBState RAMFBState;
 void ramfb_display_update(QemuConsole *con, RAMFBState *s);
 RAMFBState *ramfb_setup(Error **errp);
 
+/* ramfb-standalone.c */
+#define TYPE_RAMFB_DEVICE "ramfb"
+
 #endif /* RAMFB_H */
diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index e4c492ea44..277ed872e7 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -36,6 +36,7 @@
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
+#include "hw/display/ramfb.h"
 #include "hw/arm/fdt.h"
 
 /*
@@ -406,12 +407,18 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
 
 #endif /* CONFIG_LINUX */
 
+static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    return 0;
+}
+
 /* list of supported dynamic sysbus devices */
 static const NodeCreationPair add_fdt_node_functions[] = {
 #ifdef CONFIG_LINUX
     {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
     {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
 #endif
+    {TYPE_RAMFB_DEVICE, no_fdt_node},
     {"", NULL}, /* last element */
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f0a4fa004c..98b99cf236 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -36,6 +36,7 @@
 #include "hw/arm/virt.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
+#include "hw/display/ramfb.h"
 #include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/device_tree.h"
@@ -1659,6 +1660,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 255;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
new file mode 100644
index 0000000000..05d2b9839e
--- /dev/null
+++ b/hw/display/ramfb-standalone.c
@@ -0,0 +1,62 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/loader.h"
+#include "hw/isa/isa.h"
+#include "hw/display/ramfb.h"
+#include "ui/console.h"
+#include "sysemu/sysemu.h"
+
+#define RAMFB(obj) OBJECT_CHECK(RAMFBState, (obj), TYPE_RAMFB_DEVICE)
+
+typedef struct RAMFBState {
+    SysBusDevice parent_obj;
+    QemuConsole *con;
+    RAMFBState *state;
+} RAMFBState;
+
+static void display_update_wrapper(void *dev)
+{
+    RAMFBState *ramfb = RAMFB(dev);
+
+    if (0 /* native driver active */) {
+        /* non-standalone device would run native display update here */;
+    } else {
+        ramfb_display_update(ramfb->con, ramfb->state);
+    }
+}
+
+static const GraphicHwOps wrapper_ops = {
+    .gfx_update = display_update_wrapper,
+};
+
+static void ramfb_realizefn(DeviceState *dev, Error **errp)
+{
+    RAMFBState *ramfb = RAMFB(dev);
+
+    ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
+    ramfb->state = ramfb_setup(errp);
+}
+
+static void ramfb_class_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->realize = ramfb_realizefn;
+    dc->desc = "ram framebuffer standalone device";
+    dc->user_creatable = true;
+}
+
+static const TypeInfo ramfb_info = {
+    .name          = TYPE_RAMFB_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RAMFBState),
+    .class_init    = ramfb_class_initfn,
+};
+
+static void ramfb_register_types(void)
+{
+    type_register_static(&ramfb_info);
+}
+
+type_init(ramfb_register_types)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3d81136065..5dc4220d02 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -28,6 +28,7 @@
 #include "hw/loader.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
+#include "hw/display/ramfb.h"
 #include "hw/smbios/smbios.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_ids.h"
@@ -423,6 +424,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
     m->default_machine_opts = "firmware=bios-256k.bin";
     m->default_display = "std";
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
 }
 
 static void pc_i440fx_3_0_machine_options(MachineClass *m)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index b60cbb9266..19294949ce 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -45,6 +45,7 @@
 #include "hw/i386/ich9.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/display/ramfb.h"
 #include "hw/smbios/smbios.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
@@ -305,6 +306,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->no_floppy = 1;
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     m->max_cpus = 288;
 }
 
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 0af04985d2..fb8408c6d0 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -1,4 +1,5 @@
 common-obj-y += ramfb.o
+common-obj-y += ramfb-standalone.o
 
 common-obj-$(CONFIG_ADS7846) += ads7846.o
 common-obj-$(CONFIG_VGA_CIRRUS) += cirrus_vga.o
-- 
2.9.3

