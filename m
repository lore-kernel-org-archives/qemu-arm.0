Received: by 10.28.91.67 with SMTP id p64csp3776777wmb;
        Tue, 20 Mar 2018 05:38:26 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsNwGtNIwGxbQwoB4tdtE2D1nypstvYlOBgVdsA20rFXHVCEeaR73KtMOoTB+LMK6Hhf1Q0
X-Received: by 10.55.214.211 with SMTP id p80mr23322234qkl.1.1521549506822;
        Tue, 20 Mar 2018 05:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549506; cv=none;
        d=google.com; s=arc-20160816;
        b=EX/nLPq8h/emn7VALa/iOztF+HmpgNV/t8L1pIINeH2pYQkRzsJHd7RXRjxSEvh+jk
         mtD9CIPJ1eYfZrHKXUOibvL/8kgEWCEj3ppk7XXL3TIh/wAaOr0BpMWaNKx6ZOoVrjIE
         j+dKY8HqBgX69Q7ydOI6rcNYlNLCs5k4F20kkY/sW0UmwjZxy8g+uBFgqPYaxvTu00KN
         YhzvpqHHmi6gEuDknz62oeMxRrDs58Mzuj0hb6yCUvTwn4H4DbBZZy9DCBo14H0WHDNC
         /o0cAbzPTiy8Yov9nqYcxtwYwwk4V8/hW3fL0KbQT7rsLtpX0zyL441YduOA125w6tro
         G3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Dz9a52fRqtAk1bKKIXKNYwrxxRkVvkrsNkHBuIsAnhI=;
        b=I7rgIM65wGBfytnxRqKXHPqGCE/4/qBvWY7TnS3J5rIWJUDhbaBv3h5cwWOEewxuwm
         PvH4FOLAPtRU0pgucrSs/qYA4Px+NMR65BZzSIJ9/CB939Chbl7OEBd2JqFEZwPmjqaw
         2qIxP92+MLbmN1B3nY+jXNHCMe0ufRKwa7+AUTgipiHgQTnrwpwq4sqf5y39hN+uV3z+
         evYcbEvK5xAn24N2km3eiCCrE8h2z0V8vfyOQmsf6KPTcbbqhOeLF5tVZreCqIOD9NnO
         LopKsb30+2MKdygetxkEMdLVFYpv+qNkHy6sGS9qvLGNAqaPFA1iGjVfDVH2S3PkIVbS
         SheA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1si797074qkh.193.2018.03.20.05.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGX4-0007KY-8s
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWa-00074P-Fk
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWY-0002uY-Bh
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:37:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39074 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGWY-0002tn-6H; Tue, 20 Mar 2018 08:37:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EDE74040853;
	Tue, 20 Mar 2018 12:37:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3B694583;
	Tue, 20 Mar 2018 12:37:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:23 +0100
Message-Id: <1521549456-14072-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:37:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:37:53 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 01/14] hw/arm/smmu-common: smmu base device
 and datatypes
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GxjieCclxvH9

The patch introduces the smmu base device and class for the ARM
smmu. Devices for specific versions will be derived from this
base device.

We also introduce some important datatypes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v9 -> v10:
- invoke the parent_realize
- use device_class_set_parent_realize
- use "" to include headers
- fix indent in SMMUTransCfg
- rename smmu_as_by_busptr into smmu_pcibus_by_busptr and
         smmu_as_by_bus_num into smmu_pcibus_by_bus_num
- mrtypename becomes const
- add Peter's R-b

v8 -> v9:
- remove page walk callback type from this patch (vhost related)
- add a new hash table for caching configuration data
- add reset function
- add asid

v7 -> v8:
- add bus_num property
- add primary-bus property
- add realize and remove instance_init
- rename TYPE and related macros to match naming convention using
  for GIC
- add SMMUPageTableWalkEventInfo
- tt[2] in translation config

v3 -> v4:
- added smmu_find_as_from_bus_num
- SMMU_PCI_BUS_MAX and SMMU_PCI_DEVFN_MAX in smmu-common header
- new fields in SMMUState:
  - iommu_ops, smmu_as_by_busptr, smmu_as_by_bus_num
- add aa64[] field in SMMUTransCfg

v3:
- moved the base code in a separate patch to ease the review.
- clearer separation between base class and smmuv3 class
- translate_* only implemented as class methods

Conflicts:
	default-configs/aarch64-softmmu.mak

Conflicts:
	hw/arm/Makefile.objs
---
 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/smmu-common.c                |  88 +++++++++++++++++++++++++
 include/hw/arm/smmu-common.h        | 124 ++++++++++++++++++++++++++++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 include/hw/arm/smmu-common.h

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 9ddccf8..6f790f0 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -8,3 +8,4 @@ CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
 CONFIG_XLNX_ZYNQMP_ARM=y
+CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2885e3e..558436f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -35,3 +35,4 @@ obj-$(CONFIG_MPS2) += mps2-tz.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
 obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
+obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
new file mode 100644
index 0000000..f4cda1f
--- /dev/null
+++ b/hw/arm/smmu-common.c
@@ -0,0 +1,88 @@
+/*
+ * Copyright (C) 2014-2016 Broadcom Corporation
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Written by Prem Mallappa, Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * Author: Prem Mallappa <pmallapp@broadcom.com>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+#include "exec/target_page.h"
+#include "qom/cpu.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+
+#include "qemu/error-report.h"
+#include "hw/arm/smmu-common.h"
+
+static void smmu_base_realize(DeviceState *dev, Error **errp)
+{
+    SMMUState *s = ARM_SMMU(dev);
+    SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    sbc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+}
+
+static void smmu_base_reset(DeviceState *dev)
+{
+    SMMUState *s = ARM_SMMU(dev);
+
+    g_hash_table_remove_all(s->configs);
+    g_hash_table_remove_all(s->iotlb);
+}
+
+static Property smmu_dev_properties[] = {
+    DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
+    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void smmu_base_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
+
+    dc->props = smmu_dev_properties;
+    device_class_set_parent_realize(dc, smmu_base_realize,
+                                    &sbc->parent_realize);
+    dc->reset = smmu_base_reset;
+}
+
+static const TypeInfo smmu_base_info = {
+    .name          = TYPE_ARM_SMMU,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SMMUState),
+    .class_data    = NULL,
+    .class_size    = sizeof(SMMUBaseClass),
+    .class_init    = smmu_base_class_init,
+    .abstract      = true,
+};
+
+static void smmu_base_register_types(void)
+{
+    type_register_static(&smmu_base_info);
+}
+
+type_init(smmu_base_register_types)
+
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
new file mode 100644
index 0000000..5910692
--- /dev/null
+++ b/include/hw/arm/smmu-common.h
@@ -0,0 +1,124 @@
+/*
+ * ARM SMMU Support
+ *
+ * Copyright (C) 2015-2016 Broadcom Corporation
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Written by Prem Mallappa, Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef HW_ARM_SMMU_COMMON_H
+#define HW_ARM_SMMU_COMMON_H
+
+#include "hw/sysbus.h"
+#include "hw/pci/pci.h"
+
+#define SMMU_PCI_BUS_MAX      256
+#define SMMU_PCI_DEVFN_MAX    256
+
+#define SMMU_MAX_VA_BITS      48
+
+/*
+ * Page table walk error types
+ */
+typedef enum {
+    SMMU_PTW_ERR_NONE,
+    SMMU_PTW_ERR_WALK_EABT,   /* Translation walk external abort */
+    SMMU_PTW_ERR_TRANSLATION, /* Translation fault */
+    SMMU_PTW_ERR_ADDR_SIZE,   /* Address Size fault */
+    SMMU_PTW_ERR_ACCESS,      /* Access fault */
+    SMMU_PTW_ERR_PERMISSION,  /* Permission fault */
+} SMMUPTWEventType;
+
+typedef struct SMMUPTWEventInfo {
+    SMMUPTWEventType type;
+    dma_addr_t addr; /* fetched address that induced an abort, if any */
+} SMMUPTWEventInfo;
+
+typedef struct SMMUTransTableInfo {
+    bool disabled;             /* is the translation table disabled? */
+    uint64_t ttb;              /* TT base address */
+    uint8_t tsz;               /* input range, ie. 2^(64 -tsz)*/
+    uint8_t granule_sz;        /* granule page shift */
+    uint8_t initial_level;     /* initial lookup level */
+} SMMUTransTableInfo;
+
+/*
+ * Generic structure populated by derived SMMU devices
+ * after decoding the configuration information and used as
+ * input to the page table walk
+ */
+typedef struct SMMUTransCfg {
+    int stage;                 /* translation stage */
+    bool aa64;                 /* arch64 or aarch32 translation table */
+    bool disabled;             /* smmu is disabled */
+    bool bypassed;             /* translation is bypassed */
+    bool aborted;              /* translation is aborted */
+    uint64_t ttb;              /* TT base address */
+    uint8_t oas;               /* output address width */
+    uint8_t tbi;               /* Top Byte Ignore */
+    uint16_t asid;
+    SMMUTransTableInfo tt[2];
+} SMMUTransCfg;
+
+typedef struct SMMUDevice {
+    void               *smmu;
+    PCIBus             *bus;
+    int                devfn;
+    IOMMUMemoryRegion  iommu;
+    AddressSpace       as;
+} SMMUDevice;
+
+typedef struct SMMUNotifierNode {
+    SMMUDevice *sdev;
+    QLIST_ENTRY(SMMUNotifierNode) next;
+} SMMUNotifierNode;
+
+typedef struct SMMUPciBus {
+    PCIBus       *bus;
+    SMMUDevice   *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
+} SMMUPciBus;
+
+typedef struct SMMUState {
+    /* <private> */
+    SysBusDevice  dev;
+    const char *mrtypename;
+    MemoryRegion iomem;
+
+    GHashTable *smmu_pcibus_by_busptr;
+    GHashTable *configs; /* cache for configuration data */
+    GHashTable *iotlb;
+    SMMUPciBus *smmu_pcibus_by_bus_num[SMMU_PCI_BUS_MAX];
+    PCIBus *pci_bus;
+    QLIST_HEAD(, SMMUNotifierNode) notifiers_list;
+    uint8_t bus_num;
+    PCIBus *primary_bus;
+} SMMUState;
+
+typedef struct {
+    /* <private> */
+    SysBusDeviceClass parent_class;
+
+    /*< public >*/
+
+    DeviceRealize parent_realize;
+
+} SMMUBaseClass;
+
+#define TYPE_ARM_SMMU "arm-smmu"
+#define ARM_SMMU(obj) OBJECT_CHECK(SMMUState, (obj), TYPE_ARM_SMMU)
+#define ARM_SMMU_CLASS(klass)                                    \
+    OBJECT_CLASS_CHECK(SMMUBaseClass, (klass), TYPE_ARM_SMMU)
+#define ARM_SMMU_GET_CLASS(obj)                              \
+    OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
+
+#endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

