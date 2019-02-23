Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7781367wrx;
        Fri, 22 Feb 2019 23:50:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IapvmQvfiULk3yY4m1IHTFi9qmDBZEzX+v3M5beJrEomhWLOVDW32YwsAuDm2N40kTEyrYP
X-Received: by 2002:a81:7446:: with SMTP id p67mr6455115ywc.233.1550908210038;
        Fri, 22 Feb 2019 23:50:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908210; cv=none;
        d=google.com; s=arc-20160816;
        b=bjfYZofaPgliqFPio9xrI3WFysOxKhEYtxxm9FhjktTehdXEC4YBqmGVLUy81TezZr
         dPcPav1+riCdmdl5510MTpGLJVnRjipk2tUjp3nzy02c7FjhARPSTm5D7zoO8GoKDPg+
         UQXw4ic7xMbpybtkEluxW75BONkVXOfrEqzELdadhfv/Ts3wqKl7FDM4hEr8Zp4wA4Tl
         LGsglyX5oY1J6sOjakLRFJe9SbuNNHR/EFfTVJS64kuHy3fRPPqQzWcwq4HljB/5A0cQ
         a7OsfDVxhdOvlBgg9i1PmiF2zcDw+EWGqmjdwJRcyjJo+93wgMdOL6iGedMQXkSRFmUn
         nRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=blLYKMz8Zn21py/Q7AtyVTXHfaxZwh+0lszJmF/J7mw=;
        b=0R6qE0fhv2O3/UOjmmoLuW6HwBOF58U02gBeJQzj9RhugZuMfvCvAe4YwJaz0lfq9m
         U6qvdyIFwTR+f4eDgjrNpFjqGQSm0pA2SyTeKiMPjhH+8NCq5VfYh3ULPeiMK7Zsu2QW
         gwTaAmasODm3Ald7Xg82JTes9mw2kOwgyaRAdMhypPSTECnOSw6k0rucJce4Q9LCFHwy
         AhcltcwLKLRi4IpSIxRiokf7RdCpjtOltu5W9hpMBjckhUcA9dk7dEWgzLMd3eVV2prx
         TQqKJGq5ouKyV84uF/mZlVLoni9kllNy26S46Q0H8FcveVtANCATWI5EXZVBSlRMDCCf
         hZVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si2170893ywe.230.2019.02.22.23.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:50:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS4X-0004VR-AR
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:50:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS46-0004Tu-3V
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS44-0001pM-82
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS42-0001nF-4j; Sat, 23 Feb 2019 02:49:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 350A03082208;
	Sat, 23 Feb 2019 07:49:36 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9E3F5D9CA;
	Sat, 23 Feb 2019 07:49:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:56 +0100
Message-Id: <1550908162-22644-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sat, 23 Feb 2019 07:49:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 04/30] hw/sd/sdhci: Move PCI-related code into
 a separate file
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBSdPApj0MLi

Some machines have an SDHCI device, but no PCI. To be able to
compile hw/sd/sdhci.c without CONFIG_PCI, we must not call functions
like pci_get_address_space() and pci_allocate_irq() there. Thus
move the PCI-related code into a separate file.

This is required for the new Kconfig-like build system, e.g. it is
needed if a user wants to compile a QEMU binary with just one machine
that has SDHCI, but no PCI, like the ARM "raspi" machines for example.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Philippe, I dropped your "Reviewed-by" since I modified the patch for
 Kconfig now. Please have another look at the Kconfig and Makefile.objs
 changes, the rest is still the same.

 hw/sd/Kconfig          |  6 +++-
 hw/sd/Makefile.objs    |  1 +
 hw/sd/sdhci-internal.h | 34 ++++++++++++++++++
 hw/sd/sdhci-pci.c      | 87 ++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/sdhci.c          | 98 +++-----------------------------------------------
 5 files changed, 132 insertions(+), 94 deletions(-)
 create mode 100644 hw/sd/sdhci-pci.c

diff --git a/hw/sd/Kconfig b/hw/sd/Kconfig
index 864f535..c5e1e55 100644
--- a/hw/sd/Kconfig
+++ b/hw/sd/Kconfig
@@ -12,6 +12,10 @@ config SD
 
 config SDHCI
     bool
+    select SD
+
+config SDHCI_PCI
+    bool
     default y if PCI_DEVICES
     depends on PCI
-    select SD
+    select SDHCI
diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index a99d9fb..0665727 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -2,6 +2,7 @@ common-obj-$(CONFIG_PL181) += pl181.o
 common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
 common-obj-$(CONFIG_SD) += sd.o core.o sdmmc-internal.o
 common-obj-$(CONFIG_SDHCI) += sdhci.o
+common-obj-$(CONFIG_SDHCI_PCI) += sdhci-pci.o
 
 obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
 obj-$(CONFIG_OMAP) += omap_mmc.o
diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 19665fd..3414140 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -304,4 +304,38 @@ extern const VMStateDescription sdhci_vmstate;
 
 #define ESDHC_PRNSTS_SDSTB              (1 << 3)
 
+/*
+ * Default SD/MMC host controller features information, which will be
+ * presented in CAPABILITIES register of generic SD host controller at reset.
+ *
+ * support:
+ * - 3.3v and 1.8v voltages
+ * - SDMA/ADMA1/ADMA2
+ * - high-speed
+ * max host controller R/W buffers size: 512B
+ * max clock frequency for SDclock: 52 MHz
+ * timeout clock frequency: 52 MHz
+ *
+ * does not support:
+ * - 3.0v voltage
+ * - 64-bit system bus
+ * - suspend/resume
+ */
+#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
+
+#define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
+    DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
+    DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
+    \
+    /* Capabilities registers provide information on supported
+     * features of this specific host controller implementation */ \
+    DEFINE_PROP_UINT64("capareg", _state, capareg, SDHC_CAPAB_REG_DEFAULT), \
+    DEFINE_PROP_UINT64("maxcurr", _state, maxcurr, 0)
+
+void sdhci_initfn(SDHCIState *s);
+void sdhci_uninitfn(SDHCIState *s);
+void sdhci_common_realize(SDHCIState *s, Error **errp);
+void sdhci_common_unrealize(SDHCIState *s, Error **errp);
+void sdhci_common_class_init(ObjectClass *klass, void *data);
+
 #endif
diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
new file mode 100644
index 0000000..f884661
--- /dev/null
+++ b/hw/sd/sdhci-pci.c
@@ -0,0 +1,87 @@
+/*
+ * SDHCI device on PCI
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ * See the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/sd/sdhci.h"
+#include "sdhci-internal.h"
+
+static Property sdhci_pci_properties[] = {
+    DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
+{
+    SDHCIState *s = PCI_SDHCI(dev);
+    Error *local_err = NULL;
+
+    sdhci_initfn(s);
+    sdhci_common_realize(s, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
+    dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
+    s->irq = pci_allocate_irq(dev);
+    s->dma_as = pci_get_address_space(dev);
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
+}
+
+static void sdhci_pci_exit(PCIDevice *dev)
+{
+    SDHCIState *s = PCI_SDHCI(dev);
+
+    sdhci_common_unrealize(s, &error_abort);
+    sdhci_uninitfn(s);
+}
+
+static void sdhci_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = sdhci_pci_realize;
+    k->exit = sdhci_pci_exit;
+    k->vendor_id = PCI_VENDOR_ID_REDHAT;
+    k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
+    k->class_id = PCI_CLASS_SYSTEM_SDHCI;
+    dc->props = sdhci_pci_properties;
+
+    sdhci_common_class_init(klass, data);
+}
+
+static const TypeInfo sdhci_pci_info = {
+    .name = TYPE_PCI_SDHCI,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(SDHCIState),
+    .class_init = sdhci_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void sdhci_pci_register_type(void)
+{
+    type_register_static(&sdhci_pci_info);
+}
+
+type_init(sdhci_pci_register_type)
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 83f1574..17ad546 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -40,24 +40,6 @@
 
 #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
 
-/* Default SD/MMC host controller features information, which will be
- * presented in CAPABILITIES register of generic SD host controller at reset.
- *
- * support:
- * - 3.3v and 1.8v voltages
- * - SDMA/ADMA1/ADMA2
- * - high-speed
- * max host controller R/W buffers size: 512B
- * max clock frequency for SDclock: 52 MHz
- * timeout clock frequency: 52 MHz
- *
- * does not support:
- * - 3.0v voltage
- * - 64-bit system bus
- * - suspend/resume
- */
-#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
-
 static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
 {
     return 1 << (9 + FIELD_EX32(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH));
@@ -1328,16 +1310,7 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
 
 /* --- qdev common --- */
 
-#define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
-    DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
-    DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
-    \
-    /* Capabilities registers provide information on supported
-     * features of this specific host controller implementation */ \
-    DEFINE_PROP_UINT64("capareg", _state, capareg, SDHC_CAPAB_REG_DEFAULT), \
-    DEFINE_PROP_UINT64("maxcurr", _state, maxcurr, 0)
-
-static void sdhci_initfn(SDHCIState *s)
+void sdhci_initfn(SDHCIState *s)
 {
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
                         TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
@@ -1348,7 +1321,7 @@ static void sdhci_initfn(SDHCIState *s)
     s->io_ops = &sdhci_mmio_ops;
 }
 
-static void sdhci_uninitfn(SDHCIState *s)
+void sdhci_uninitfn(SDHCIState *s)
 {
     timer_del(s->insert_timer);
     timer_free(s->insert_timer);
@@ -1359,7 +1332,7 @@ static void sdhci_uninitfn(SDHCIState *s)
     s->fifo_buffer = NULL;
 }
 
-static void sdhci_common_realize(SDHCIState *s, Error **errp)
+void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
     Error *local_err = NULL;
 
@@ -1375,7 +1348,7 @@ static void sdhci_common_realize(SDHCIState *s, Error **errp)
                           SDHC_REGISTERS_MAP_SIZE);
 }
 
-static void sdhci_common_unrealize(SDHCIState *s, Error **errp)
+void sdhci_common_unrealize(SDHCIState *s, Error **errp)
 {
     /* This function is expected to be called only once for each class:
      * - SysBus:    via DeviceClass->unrealize(),
@@ -1445,7 +1418,7 @@ const VMStateDescription sdhci_vmstate = {
     },
 };
 
-static void sdhci_common_class_init(ObjectClass *klass, void *data)
+void sdhci_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
@@ -1454,66 +1427,6 @@ static void sdhci_common_class_init(ObjectClass *klass, void *data)
     dc->reset = sdhci_poweron_reset;
 }
 
-/* --- qdev PCI --- */
-
-static Property sdhci_pci_properties[] = {
-    DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
-{
-    SDHCIState *s = PCI_SDHCI(dev);
-    Error *local_err = NULL;
-
-    sdhci_initfn(s);
-    sdhci_common_realize(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
-    dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
-    s->irq = pci_allocate_irq(dev);
-    s->dma_as = pci_get_address_space(dev);
-    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
-}
-
-static void sdhci_pci_exit(PCIDevice *dev)
-{
-    SDHCIState *s = PCI_SDHCI(dev);
-
-    sdhci_common_unrealize(s, &error_abort);
-    sdhci_uninitfn(s);
-}
-
-static void sdhci_pci_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = sdhci_pci_realize;
-    k->exit = sdhci_pci_exit;
-    k->vendor_id = PCI_VENDOR_ID_REDHAT;
-    k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
-    k->class_id = PCI_CLASS_SYSTEM_SDHCI;
-    dc->props = sdhci_pci_properties;
-
-    sdhci_common_class_init(klass, data);
-}
-
-static const TypeInfo sdhci_pci_info = {
-    .name = TYPE_PCI_SDHCI,
-    .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(SDHCIState),
-    .class_init = sdhci_pci_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
 /* --- qdev SysBus --- */
 
 static Property sdhci_sysbus_properties[] = {
@@ -1846,7 +1759,6 @@ static const TypeInfo imx_usdhc_info = {
 
 static void sdhci_register_types(void)
 {
-    type_register_static(&sdhci_pci_info);
     type_register_static(&sdhci_sysbus_info);
     type_register_static(&sdhci_bus_info);
     type_register_static(&imx_usdhc_info);
-- 
1.8.3.1

