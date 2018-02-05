Received: by 10.28.71.27 with SMTP id u27csp2510332wma;
        Mon, 5 Feb 2018 05:40:43 -0800 (PST)
X-Google-Smtp-Source: AH8x226NNeyy9OXQrhOL/c2Ykaf/NcMGJl2ig4xNhfryKlkgnuwg8auPGT6UUfR/lJnyvonlnEzG
X-Received: by 10.129.46.151 with SMTP id u145mr33407666ywu.164.1517838043416;
        Mon, 05 Feb 2018 05:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838043; cv=none;
        d=google.com; s=arc-20160816;
        b=DBpDFRuUoTWpUbwiwR89TBKOd4jMHRZb14FxBn3VTYyI+Qxxw7ew9oVJbqboar99rI
         14HswUg5/hhXhSx5w8a65VHY1Wa8Muo9cLamM6jgYSnaoCMrM3kRQ9Y3XAc3SDAOwzHf
         ecsKLzUCqch2DpEbVTcqrwrvDxirIF2vQT5xf9ehsxth4Rrv9gzOWMo3Jr9gOOKDx1wz
         z6Pp37GhSgTIhwqs7i6MLd0A84pBdNPvzb2cifZ6V2leg9eolvkUX4wFkunuI2rieq0k
         lqYJ/AKqrGzZaboS62i+msfpPnjsXVnUa0te3QcId66mtJCR43AYPjPz5/vcUgLQhRqA
         h26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=rw/EaPk5xIjVIGno23558JSVNMdpGdUZcNEg+D1C32Q=;
        b=ECKJ4y46FL6WrnhzhQ5VVFN2+lp8LrxcMIy+QNU2FNLTjgdnyZ7vaXJdwLqzGxcsea
         WIsdcAUvxN/PpzxvuHxROIJcPei8LmGMYSw9jwY7Hzo+lvniD3BBfsyPaj7e0Q1fGbYd
         ZJ7uFcjccsUAyi5idQMrHZd/I2Lrjd5iFdPCnna52ZzewFIdJ7RPiD6b4P7DiA5SddQz
         1CTHV/F9fVqr8I2H3eIOzrF8vY0S4DeVmQrnfPBTlv6s9hv87BewkU2RrrxnWT10kuU7
         DBlLgQCiil6ElywWlrajo7d/ktIAjm1yTUylphNj7OkTlBo9JpMempirCv7yxfl6dymx
         bsJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13si1444699ybm.177.2018.02.05.05.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eih0k-0004so-Q3
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:40:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih0U-0004qV-1f
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:40:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih0P-0005FN-I0
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:40:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih0P-0005Eq-Ac; Mon, 05 Feb 2018 08:40:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 409232820C;
	Mon,  5 Feb 2018 13:40:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9A6B177C3;
	Mon,  5 Feb 2018 13:39:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:19 +0100
Message-Id: <1517837972-1904-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 05 Feb 2018 13:40:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 01/14] hw/arm/smmu-common: smmu base device
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8UbTK8ePxjcg

The patch introduces the smmu base device and class for the ARM
smmu. Devices for specific versions will be derived from this
base device.

We also introduce some important datatypes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---
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
---
 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/smmu-common.c                |  71 ++++++++++++++++++++
 include/hw/arm/smmu-common.h        | 126 ++++++++++++++++++++++++++++++++++++
 4 files changed, 199 insertions(+)
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
index 1c896ba..c84c5ac 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
+obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
new file mode 100644
index 0000000..c2f6b15
--- /dev/null
+++ b/hw/arm/smmu-common.c
@@ -0,0 +1,71 @@
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
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
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
+    sbc->parent_realize = dc->realize;
+    dc->realize = smmu_base_realize;
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
index 0000000..0f9af40
--- /dev/null
+++ b/include/hw/arm/smmu-common.h
@@ -0,0 +1,126 @@
+/*
+ * ARM SMMU Support
+ *
+ * Copyright (C) 2015-2016 Broadcom Corporation
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Written by Prem Mallappa, Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_ARM_SMMU_COMMON_H
+#define HW_ARM_SMMU_COMMON_H
+
+#include <hw/sysbus.h>
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
+    int      stage;            /* translation stage */
+    bool     aa64;             /* arch64 or aarch32 translation table */
+    bool     disabled;         /* smmu is disabled */
+    bool     bypassed;         /* translation is bypassed */
+    bool     aborted;          /* translation is aborted */
+    uint64_t ttb;              /* TT base address */
+    uint8_t oas;               /* output address width */
+    uint8_t  tbi;              /* Top Byte Ignore */
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
+    char *mrtypename;
+    MemoryRegion iomem;
+
+    GHashTable *smmu_as_by_busptr;
+    SMMUPciBus *smmu_as_by_bus_num[SMMU_PCI_BUS_MAX];
+    PCIBus *pci_bus;
+    QLIST_HEAD(, SMMUNotifierNode) notifiers_list;
+    uint8_t bus_num;
+    PCIBus *primary_bus;
+} SMMUState;
+
+typedef int (*smmu_page_walk_hook)(IOMMUTLBEntry *entry, void *private);
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
+    OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARm_SMMU)
+
+#endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

