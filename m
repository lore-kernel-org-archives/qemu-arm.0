Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3720793wrq;
        Mon, 18 Jun 2018 02:58:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIujQ1T4oy5ymyVEtL0y9nM//CmYEuL4PFeHpc01r9iBdMOvXulyc3s6rbhPI/xXIU+4t7X
X-Received: by 2002:a37:9f16:: with SMTP id i22-v6mr9591185qke.157.1529315903097;
        Mon, 18 Jun 2018 02:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529315903; cv=none;
        d=google.com; s=arc-20160816;
        b=cWm7SDQRMHRAtY1bfzEWJ/G6My3FuQTZGvNPzdMUejoyhzpCZl+E/jyoA38Ez37yIO
         TcKwVyVVksITCZ6qcbC/CK4rpBcvUN5bIqjONe21C90XYryQDRsSfLpMHwXQVq44MN5v
         9eWu89DuHl5q54xFl4f5clKR7H0IWRmx1fwG6NikgtqM5i6vjEHFbUPkZeT4VvTXHr2R
         4u3UKtrY4czmUTbnIQnjQuFIrkyIhEbVBtTFsaUG7yK+dQ4teG4okYGxcDcPQlW58NCs
         vgR28G0HMUwvrDRt4OO1iX6Km+eqNa3Gc2LTVZiFLaqmLtYIFEUus7rwlGuizD0+dGpt
         3faA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DdkkUPmCfBeSf7GetSY+nyywXugzBfKw4xuYzed6Agg=;
        b=d9ud0RF1t34clzk9nV8uMAbe4uFJaVOugJcPmLfBZpJegqmkBl4DOCqO0AKEguu61z
         dZcisXwA16TGyMIok206HYsJ+EQ9QOqceFvHhU1AC4tUYknmWU8PHllDA2mMsVJOWppc
         SQcbmVSEUiUhm8wUSAF52sOvAF/2nDLtE2PZfv1Mou/u3P03OhWFX7bZpfSgTp6X1b5U
         wjhoJPEDNQawzCpen4MAmn6ADX0xnuyYO8AvLrWpLqG4Okz6cwSVchku1RYfPyiBJZiF
         o25NBX9z/2sF6JXqfpHtoxyH8hiYQHj0XZzvoM81sL8vJIva+LLpLRzG5e21UyTvXU5D
         YPlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v51-v6si7666567qta.51.2018.06.18.02.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 02:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUqvW-0001M5-I2
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 05:58:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvF-0001Ji-Iw
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvB-0003IX-Cf
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48538 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fUqvB-0003IQ-6E; Mon, 18 Jun 2018 05:58:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DF49401DEAF;
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 458362156A21;
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 823FD24EF10; Mon, 18 Jun 2018 11:57:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Jun 2018 11:57:57 +0200
Message-Id: <20180618095758.5006-4-kraxel@redhat.com>
In-Reply-To: <20180618095758.5006-1-kraxel@redhat.com>
References: <20180618095758.5006-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 3/4] hw/display: add standalone ramfb device
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cxhjysPfBJNN

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Message-id: 20180613122948.18149-3-kraxel@redhat.com
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
index 0000000000..c0d241ba01
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
+#define RAMFB(obj) OBJECT_CHECK(RAMFBStandaloneState, (obj), TYPE_RAMFB_DEVICE)
+
+typedef struct RAMFBStandaloneState {
+    SysBusDevice parent_obj;
+    QemuConsole *con;
+    RAMFBState *state;
+} RAMFBStandaloneState;
+
+static void display_update_wrapper(void *dev)
+{
+    RAMFBStandaloneState *ramfb = RAMFB(dev);
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
+    RAMFBStandaloneState *ramfb = RAMFB(dev);
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
+    .instance_size = sizeof(RAMFBStandaloneState),
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
index 3b87f3cedb..e9b6f064fb 100644
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
index 087f2630f9..1a73e1848a 100644
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

