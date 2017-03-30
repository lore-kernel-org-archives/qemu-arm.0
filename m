Received: by 10.25.15.230 with SMTP id 99csp2721224lfp;
        Thu, 30 Mar 2017 12:42:53 -0700 (PDT)
X-Received: by 10.233.237.135 with SMTP id c129mr1602883qkg.160.1490902973352;
        Thu, 30 Mar 2017 12:42:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q73si438539qkl.297.2017.03.30.12.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Mar 2017 12:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctfy8-0003Kq-RK
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 15:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfxv-0003DV-K8
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfxt-0007AQ-Q8
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58385)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ctfxt-00079q-Fv; Thu, 30 Mar 2017 15:42:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 421BE2E6065;
	Thu, 30 Mar 2017 19:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 421BE2E6065
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 421BE2E6065
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA0EF77D53;
	Thu, 30 Mar 2017 19:42:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	prem.mallappa@gmail.com
Date: Thu, 30 Mar 2017 21:42:15 +0200
Message-Id: <1490902938-9009-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
References: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 30 Mar 2017 19:42:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 2/5] hw/arm/smmu-common: smmu base class
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
Cc: drjones@redhat.com, Radha.Chintakuntla@cavium.com,
	christoffer.dall@linaro.org, Sunil.Goutham@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sYa9O+QTEcw7

Introduces the base device and class for the ARM smmu. Also introduces
common data types and helpers.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---

v3:
- moved the base code in a separate patch to ease the review.
- clearer separation between base class and smmuv3 class
- translate_* only implemented as class methods
---
 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/smmu-common.c                | 193 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h        | 151 ++++++++++++++++++++++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 include/hw/arm/smmu-common.h

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 2449483..83a2932 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4c5c4ee..6c7d4af 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
+obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
new file mode 100644
index 0000000..7444c79
--- /dev/null
+++ b/hw/arm/smmu-common.c
@@ -0,0 +1,193 @@
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
+
+#include "hw/arm/smmu-common.h"
+
+#ifdef ARM_SMMU_DEBUG
+uint32_t dbg_bits =                             \
+    DBG_BIT(PANIC) | DBG_BIT(CRIT) | DBG_BIT(WARN) | DBG_BIT(IRQ);
+#else
+const uint32_t dbg_bits;
+#endif
+
+inline MemTxResult smmu_read_sysmem(hwaddr addr, void *buf, int len,
+                                    bool secure)
+{
+    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
+
+    switch (len) {
+    case 4:
+        *(uint32_t *)buf = ldl_le_phys(&address_space_memory, addr);
+        break;
+    case 8:
+        *(uint64_t *)buf = ldq_le_phys(&address_space_memory, addr);
+        break;
+    default:
+        return address_space_rw(&address_space_memory, addr,
+                                attrs, buf, len, false);
+    }
+    return MEMTX_OK;
+}
+
+inline void
+smmu_write_sysmem(hwaddr addr, void *buf, int len, bool secure)
+{
+    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
+
+    switch (len) {
+    case 4:
+        stl_le_phys(&address_space_memory, addr, *(uint32_t *)buf);
+        break;
+    case 8:
+        stq_le_phys(&address_space_memory, addr, *(uint64_t *)buf);
+        break;
+    default:
+        address_space_rw(&address_space_memory, addr,
+                         attrs, buf, len, true);
+    }
+}
+
+static SMMUTransErr
+smmu_translate_64(SMMUTransCfg *cfg, uint32_t *pagesize,
+                  uint32_t *perm, bool is_write)
+{
+    int     ret, level;
+    int     stage      = cfg->stage;
+    int     granule_sz = cfg->granule_sz[stage];
+    int     va_size    = cfg->va_size[stage];
+    hwaddr  va, addr, mask;
+    hwaddr *outaddr;
+
+
+    va = addr = cfg->va;        /* or ipa in Stage2 */
+    SMMU_DPRINTF(TT_1, "stage:%d\n", stage);
+    assert(va_size == 64);      /* We dont support 32-bit yet */
+    /* same location, for clearity */
+    outaddr = &cfg->pa;
+
+    level = 4 - (va_size - cfg->tsz[stage] - 4) / granule_sz;
+
+    mask = (1ULL << (granule_sz + 3)) - 1;
+
+    addr = extract64(cfg->ttbr[stage], 0, 48);
+    addr &= ~((1ULL << (va_size - cfg->tsz[stage] -
+                        (granule_sz * (4 - level)))) - 1);
+
+    for (;;) {
+        uint64_t desc;
+#ifdef ARM_SMMU_DEBUG
+        uint64_t ored = (va >> (granule_sz * (4 - level))) & mask;
+        SMMU_DPRINTF(TT_1,
+                     "Level: %d va:%lx addr:%lx ored:%lx\n",
+                     level, va, addr, ored);
+#endif
+        addr |= (va >> (granule_sz * (4 - level))) & mask;
+        addr &= ~7ULL;
+
+        if (smmu_read_sysmem(addr, &desc, sizeof(desc), false)) {
+            ret = SMMU_TRANS_ERR_WALK_EXT_ABRT;
+            SMMU_DPRINTF(CRIT, "Translation table read error lvl:%d\n", level);
+            break;
+        }
+
+        SMMU_DPRINTF(TT_1,
+                     "Level: %d gran_sz:%d mask:%lx addr:%lx desc:%lx\n",
+                     level, granule_sz, mask, addr, desc);
+
+        if (!(desc & 1) ||
+            (!(desc & 2) && (level == 3))) {
+            ret = SMMU_TRANS_ERR_TRANS;
+            break;
+        }
+
+        /* We call again to resolve address at this 'level' */
+        if (cfg->s2_needed) {
+            uint32_t perm_s2, pagesize_s2;
+            SMMUTransCfg s2cfg = *cfg;
+
+            s2cfg.stage++;
+            s2cfg.va = desc;
+            s2cfg.s2_needed = false;
+
+            ret = smmu_translate_64(&s2cfg, &pagesize_s2,
+                                    &perm_s2, is_write);
+            if (ret) {
+                break;
+            }
+
+            desc = (uint64_t)s2cfg.pa;
+            SMMU_DPRINTF(TT_2, "addr:%lx pagesize:%x\n", addr, *pagesize);
+        }
+
+        addr = desc & 0xffffffff000ULL;
+        if ((desc & 2) && (level < 3)) {
+            level++;
+            continue;
+        }
+        *pagesize = (1ULL << ((granule_sz * (4 - level)) + 3));
+        addr |= (va & (*pagesize - 1));
+        SMMU_DPRINTF(TT_1, "addr:%lx pagesize:%x\n", addr, *pagesize);
+        break;
+    }
+
+    if (ret == 0) {
+        *outaddr = addr;
+    }
+
+    return ret;
+}
+
+static void smmu_base_instance_init(Object *obj)
+{
+     /* Nothing much to do here as of now */
+}
+
+static void smmu_base_class_init(ObjectClass *klass, void *data)
+{
+    SMMUBaseClass *sbc = SMMU_DEVICE_CLASS(klass);
+
+    sbc->translate_64 = smmu_translate_64;
+    sbc->translate_32 = NULL; /* not yet implemented */
+}
+
+static const TypeInfo smmu_base_info = {
+    .name          = TYPE_SMMU_DEV_BASE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SMMUState),
+    .instance_init = smmu_base_instance_init,
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
index 0000000..b29648f
--- /dev/null
+++ b/include/hw/arm/smmu-common.h
@@ -0,0 +1,151 @@
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
+#include <qemu/log.h>
+#include <hw/sysbus.h>
+#include "hw/pci/pci.h"
+
+typedef enum {
+    SMMU_TRANS_ERR_WALK_EXT_ABRT = 0x1,  /* Translation walk external abort */
+    SMMU_TRANS_ERR_TRANS         = 0x10, /* Translation fault */
+    SMMU_TRANS_ERR_ADDR_SZ,              /* Address Size fault */
+    SMMU_TRANS_ERR_ACCESS,               /* Access fault */
+    SMMU_TRANS_ERR_PERM,                 /* Permission fault */
+    SMMU_TRANS_ERR_TLB_CONFLICT  = 0x20, /* TLB Conflict */
+} SMMUTransErr;
+
+/*
+ * This needs to be populated by SMMUv2 and SMMUv3
+ * each do it in their own way
+ * translate functions use it to call translations
+ */
+typedef struct SMMUTransCfg {
+    hwaddr   va;                        /* Input to S1 */
+    int      stage;
+    uint32_t oas[3];
+    uint32_t tsz[3];
+    uint64_t ttbr[3];
+    uint32_t granule[3];
+    uint32_t va_size[3];
+    uint32_t granule_sz[3];
+
+    hwaddr pa;                          /* Output from S1, Final PA */
+    bool    s2_needed;
+} SMMUTransCfg;
+
+struct SMMUTransReq {
+    uint32_t stage;
+    SMMUTransCfg cfg[2];
+};
+
+typedef struct SMMUDevice {
+    void         *smmu;
+    PCIBus       *bus;
+    int           devfn;
+    MemoryRegion  iommu;
+    AddressSpace  as;
+} SMMUDevice;
+
+typedef struct SMMUPciBus {
+    PCIBus       *bus;
+    SMMUDevice   *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
+} SMMUPciBus;
+
+typedef struct SMMUState {
+    /* <private> */
+    SysBusDevice  dev;
+
+    MemoryRegion iomem;
+} SMMUState;
+
+typedef struct {
+    /* <private> */
+    SysBusDeviceClass parent_class;
+
+    /* public */
+    SMMUTransErr (*translate_32)(SMMUTransCfg *cfg, uint32_t *pagesize,
+                                 uint32_t *perm, bool is_write);
+    SMMUTransErr (*translate_64)(SMMUTransCfg *cfg, uint32_t *pagesize,
+                                 uint32_t *perm, bool is_write);
+} SMMUBaseClass;
+
+#define TYPE_SMMU_DEV_BASE "smmu-base"
+#define SMMU_SYS_DEV(obj) OBJECT_CHECK(SMMUState, (obj), TYPE_SMMU_DEV_BASE)
+#define SMMU_DEVICE_GET_CLASS(obj)                              \
+    OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_SMMU_DEV_BASE)
+#define SMMU_DEVICE_CLASS(klass)                                    \
+    OBJECT_CLASS_CHECK(SMMUBaseClass, (klass), TYPE_SMMU_DEV_BASE)
+
+/* #define ARM_SMMU_DEBUG */
+#ifdef ARM_SMMU_DEBUG
+
+extern uint32_t  dbg_bits;
+
+#define HERE()  printf("%s:%d\n", __func__, __LINE__)
+
+enum {
+    SMMU_DBG_PANIC, SMMU_DBG_CRIT, SMMU_DBG_WARN, /* error level */
+    SMMU_DBG_DBG1, SMMU_DBG_DBG2, SMMU_DBG_INFO, /* info level */
+    SMMU_DBG_CMDQ,                               /* Just command queue */
+    SMMU_DBG_STE, SMMU_DBG_CD,                   /* Specific parts STE/CD */
+    SMMU_DBG_TT_1, SMMU_DBG_TT_2,                /* Translation Stage 1/2 */
+    SMMU_DBG_IRQ,                                /* IRQ  */
+};
+
+#define DBG_BIT(bit)    (1 << SMMU_DBG_##bit)
+
+#define IS_DBG_ENABLED(bit) (dbg_bits & (1 << SMMU_DBG_##bit))
+
+#define DBG_DEFAULT  (DBG_BIT(PANIC) | DBG_BIT(CRIT) | DBG_BIT(IRQ))
+#define DBG_EXTRA    (DBG_BIT(STE) | DBG_BIT(CD) | DBG_BIT(TT_1))
+#define DBG_VERBOSE1 DBG_BIT(DBG1)
+#define DBG_VERBOSE2 (DBG_VERBOSE1 | DBG_BIT(DBG1))
+#define DBG_VERBOSE3 (DBG_VERBOSE2 | DBG_BIT(DBG2))
+#define DBG_VERBOSE4 (DBG_VERBOSE3 | DBG_BIT(INFO))
+
+#define SMMU_DPRINTF(lvl, fmt, ...)             \
+    do {                                        \
+        if (dbg_bits & DBG_BIT(lvl)) {          \
+            qemu_log_mask(CPU_LOG_IOMMU,        \
+                          "(smmu)%s: " fmt ,    \
+                          __func__,             \
+                          ## __VA_ARGS__);      \
+        }                                       \
+    } while (0)
+
+#else
+#define IS_DBG_ENABLED(bit) false
+#define SMMU_DPRINTF(lvl, fmt, ...)
+
+#endif  /* SMMU_DEBUG */
+
+MemTxResult smmu_read_sysmem(hwaddr addr, void *buf, int len, bool secure);
+void smmu_write_sysmem(hwaddr addr, void *buf, int len, bool secure);
+
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
+}
+
+#endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

