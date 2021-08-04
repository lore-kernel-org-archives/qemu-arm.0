Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3270135lff;
        Wed, 4 Aug 2021 01:54:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaauY/expW4xssaGo5Aw3UBhCGu8xbtC7tt/ObCi4/+VcM1k7Ir9OJPoL8DpOY99IY1ppG
X-Received: by 2002:a92:c52e:: with SMTP id m14mr752815ili.257.1628067293839;
        Wed, 04 Aug 2021 01:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628067293; cv=none;
        d=google.com; s=arc-20160816;
        b=RmpFIyTvV5qo2WgApV3XkFew/mD5GVv+ZH2h2kaBbxiUfq7Ec/VuvNR3kU6w29co7v
         u1IH6c2CZKIqBiZQMXj5zH/20I5uIAdrziDivwbLDavEGoMw+bqbzD97pLXVf06yPq6h
         GDS+oR5LCv0qDH3oAqNMkIi22FcqsYkOERcK8YNAqT8ZJC2HItvPnp97seYRTZq70F1l
         lL5M56RX/qSwBRJwjiGsq5ugeHS56K316aJ0N3J18qS88p6tmTWyeBlH9YaKjasPkrDM
         mB+vxUrgASDianPF+1rF4S2/IzJcu4ciKbJAPoiIkE+7J/0of1tUcYQZUwHNK7WvXkMC
         3L0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=9rm5paRwelTVGTyavKJqH981R58276lE28sDLBMH7HM=;
        b=aurFXZJlHFP0HIAp9wwshK1wf8wnZlWAL3QB1zhbrynnrLCXqwVkW4/ylV9w1kxx9G
         UySK1Y/+0V23cWdEbn9JkOV/UXH9Yu//pwKzZbU2mB0VTz7IbW8NaOs/rzZay6A/tRBE
         Yv3rAfxXf2zekDEfKMZ4Tz1oGKc4SopR0/KmPEp2gP+bi4wVBWMZqrAx9TxCkeWh9pPk
         1YWm88r5Vemgo8ai3RlgPy2nuyPOu58GTi4X8JqQB5044TYGikBXKqjT/C1js2AsH/2Y
         ruqEouSEuASTte8vc0S2c/ispoIc/RXwgrxYnjylICZZZwv4WTmulMaeTZhccIQsLMzH
         V07g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az3si1612932jab.111.2021.08.04.01.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Aug 2021 01:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hisilicon.com
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBCft-00042c-46
	for alex.bennee@linaro.org; Wed, 04 Aug 2021 04:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1mBCfc-00040D-1F; Wed, 04 Aug 2021 04:54:36 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1mBCfV-0003ot-M5; Wed, 04 Aug 2021 04:54:35 -0400
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GflnP5rz2z81Q1;
 Wed,  4 Aug 2021 16:50:33 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 4 Aug 2021 16:54:24 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <eric.auger@redhat.com>
Subject: [RESEND RFC] hw/arm/smmuv3: add device properties to disable cached
 iotlb
Date: Wed, 4 Aug 2021 16:49:29 +0800
Message-ID: <1628066969-29945-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Xiang Chen <chenxiang66@hisilicon.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, linuxarm@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pP2/EIzvlrPB

From: Xiang Chen <chenxiang66@hisilicon.com>

It splits invalidations into ^2 range invalidations in the patch
6d9cd115b(" hw/arm/smmuv3: Enforce invalidation on a power of two range").
So for some scenarios such as the size of invalidation is not ^2 range
invalidation, it costs more time to invalidate.
Currently smmuv3_translate is rarely used (i only see it is used when
binding msi), so i think maybe we can disable cached iotlb to promote
efficiency of invalidation. So add device property disable_cached_iotlb
to disable cached iotlb, and then we can send non-^2 range invalidation
directly.
Use tool dma_map_benchmark to have a test on the latency of unmap,
and we can see it promotes much on unmap when the size of invalidation
is not ^2 range invalidation (such as g = 7/15/31/511):

t = 1(thread = 1)
			before opt(us)   after opt(us)
g=1(4K size)	0.2/7.6		0.2/7.5
g=4(8K size)	0.4/7.9		0.4/7.9
g=7(28K size)	0.6/10.2		0.6/8.2
g=8(32K size)	0.6/8.3		0.6/8.3
g=15(60K size)	1.1/12.1		1.1/9.1
g=16(64K size)	1.1/9.2		1.1/9.1
g=31(124K size)	2.0/14.8		2.0/10.7
g=32(128K size)	2.1/14.8		2.1/10.7
g=511(2044K size)	30.9/65.1		31.1/55.9
g=512(2048K size) 0.3/32.1		0.3/32.1
t = 10(thread = 10)
			before opt(us)   after opt(us)
g=1(4K size)	0.2/39.9		0.2/39.1
g=4(8K size)	0.5/42.6		0.5/42.4
g=7(28K size)	0.6/66.4		0.6/45.3
g=8(32K size)	0.7/45.8		0.7/46.1
g=15(60K size)	1.1/80.5		1.1/49.6
g=16(64K size)	1.1/49.8		1.1/50.2
g=31(124K size)	2.0/98.3		2.1/58.0
g=32(128K size)	2.1/57.7		2.1/58.2
g=511(2044K size)	35.2/322.2		35.3/236.7
g=512(2048K size) 0.8/238.2		0.9/240.3

Note: i test it based on VSMMU enabled with the patchset
("vSMMUv3/pSMMUv3 2 stage VFIO integration").

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/arm/smmuv3.c         | 77 ++++++++++++++++++++++++++++++++-----------------
 include/hw/arm/smmuv3.h |  1 +
 2 files changed, 52 insertions(+), 26 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 01b60be..7ae668f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "hw/irq.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-core.h"
@@ -682,19 +683,21 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     page_mask = (1ULL << (tt->granule_sz)) - 1;
     aligned_addr = addr & ~page_mask;
 
-    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
-    if (cached_entry) {
-        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
-            status = SMMU_TRANS_ERROR;
-            if (event.record_trans_faults) {
-                event.type = SMMU_EVT_F_PERMISSION;
-                event.u.f_permission.addr = addr;
-                event.u.f_permission.rnw = flag & 0x1;
+    if (s->disable_cached_iotlb) {
+        cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
+        if (cached_entry) {
+            if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
+                status = SMMU_TRANS_ERROR;
+                if (event.record_trans_faults) {
+                    event.type = SMMU_EVT_F_PERMISSION;
+                    event.u.f_permission.addr = addr;
+                    event.u.f_permission.rnw = flag & 0x1;
+                }
+            } else {
+                status = SMMU_TRANS_SUCCESS;
             }
-        } else {
-            status = SMMU_TRANS_SUCCESS;
+            goto epilogue;
         }
-        goto epilogue;
     }
 
     cached_entry = g_new0(SMMUTLBEntry, 1);
@@ -742,7 +745,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         }
         status = SMMU_TRANS_ERROR;
     } else {
-        smmu_iotlb_insert(bs, cfg, cached_entry);
+        if (s->disable_cached_iotlb) {
+            smmu_iotlb_insert(bs, cfg, cached_entry);
+        }
         status = SMMU_TRANS_SUCCESS;
     }
 
@@ -855,8 +860,9 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
     }
 }
 
-static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_s1_range_inval(SMMUv3State *s, Cmd *cmd)
 {
+    SMMUState *bs = ARM_SMMU(s);
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
     uint16_t vmid = CMD_VMID(cmd);
@@ -876,7 +882,9 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     if (!tg) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        if (s->disable_cached_iotlb) {
+            smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        }
         return;
     }
 
@@ -885,17 +893,23 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     num_pages = (num + 1) * BIT_ULL(scale);
     granule = tg * 2 + 10;
 
-    /* Split invalidations into ^2 range invalidations */
-    end = addr + (num_pages << granule) - 1;
-
-    while (addr != end + 1) {
-        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
-
-        num_pages = (mask + 1) >> granule;
+    if (s->disable_cached_iotlb) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
-        addr += mask + 1;
+    } else {
+        /* Split invalidations into ^2 range invalidations */
+        end = addr + (num_pages << granule) - 1;
+
+        while (addr != end + 1) {
+            uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
+
+            num_pages = (mask + 1) >> granule;
+            trace_smmuv3_s1_range_inval(vmid, asid, addr,
+                                        tg, num_pages, ttl, leaf);
+            smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+            smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
+            addr += mask + 1;
+        }
     }
 }
 
@@ -1028,18 +1042,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            if (s->disable_cached_iotlb) {
+                smmu_iotlb_inv_asid(bs, asid);
+            }
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
         case SMMU_CMD_TLBI_NSNH_ALL:
             trace_smmuv3_cmdq_tlbi_nh();
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_all(bs);
+            if (s->disable_cached_iotlb) {
+                smmu_iotlb_inv_all(bs);
+            }
             break;
         case SMMU_CMD_TLBI_NH_VAA:
         case SMMU_CMD_TLBI_NH_VA:
-            smmuv3_s1_range_inval(bs, &cmd);
+            smmuv3_s1_range_inval(s, &cmd);
             break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
@@ -1506,6 +1524,12 @@ static void smmuv3_instance_init(Object *obj)
     /* Nothing much to do here as of now */
 }
 
+static Property smmuv3_properties[] = {
+    DEFINE_PROP_BOOL("disable_cached_iotlb", SMMUv3State,
+                     disable_cached_iotlb, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1515,6 +1539,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e60..c94ab7e 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -62,6 +62,7 @@ struct SMMUv3State {
 
     qemu_irq     irq[4];
     QemuMutex mutex;
+    bool disable_cached_iotlb; /* Whether disable/enable cached iotlb */
 };
 
 typedef enum {
-- 
2.8.1

