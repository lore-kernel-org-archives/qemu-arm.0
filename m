Received: by 10.28.4.212 with SMTP id 203csp887350wme;
        Wed, 25 Apr 2018 07:30:40 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrp+QrtO5oBDyO7PZEexrQFLeMu7e6JTd6KwWBpbdSI1ak9+vgPhB+LpfKOviW1zK3YJGuG
X-Received: by 2002:aed:33e3:: with SMTP id v90-v6mr31451577qtd.199.1524666640661;
        Wed, 25 Apr 2018 07:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666640; cv=none;
        d=google.com; s=arc-20160816;
        b=tXTLbKgBD/G/Qp5TUzn+0xpEGU/d0rhDQwv6WFFv5+CouReGXJ4InPZknTWmUkCL+1
         9JXe/CnFD3037rKVbsYJhEkkcdbvpGCSWljIcHc54sGH7DXPnIOXB4wy+oFVsSD4eo2N
         Y9TfXFl4uI6EPDDZc1vDkDmwL/RrDHnpro8ZywG7LnfbrSrBmJkIIQZJq8fZY4XU8Rqo
         aozfidUvjFBby3D5XxiTmZSVOR7wwG74zNJXmOdjLwyU0toMbTEXrm2ZObIPaXVlONTU
         imjN5yarWweTkpzSp8e705BAGDTlCjeyCQk/coZsybj9es0L+z7ek3/AlzNO/2etjoVz
         bNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0O3JMYcwTthfFPd17Bk+QOCTE3N3tKNJFcBcGtyYPfk=;
        b=Zx/XrXkkPQgfSgPprBSaid7mwp1XrhQmzbjzzNvh3QYSZavoO+zLPbFhQI5MItNmo2
         61RihjH8sTz65aSEX1seNW1ioQY9CL3/neJwJi4A30DLlMftDfOx6/mg0tgejfP3DI9x
         Ka2H7lEnL18usYTuTG+s7h7bKfagH7c6+9o1V86HU8gXFfkQL+K4aimQXW6WiKtIMtfC
         xBAWjWv0Cz82MlsmA57k22Mto5J1s2N5/Sme87W5AlFL21osI5ZypPKWPTpOjkmUZ6Sx
         BnlA1faz1UyPgD06KbehL5FuDVDQwbXoFtok/SXBF2nICMiLJ+16tSF+IQwLURLC8Cd4
         Ak4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17si4532283qvd.105.2018.04.25.07.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLRQ-0003XQ-2f
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEE-0000za-DA
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:17:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEC-0006Bq-Ht
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:17:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55342 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLEC-0006B8-B9; Wed, 25 Apr 2018 10:17:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7495406C74B;
	Wed, 25 Apr 2018 14:16:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4796D2023430;
	Wed, 25 Apr 2018 14:16:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:16:01 +0200
Message-Id: <1524665762-31355-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 25 Apr 2018 14:16:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 25 Apr 2018 14:16:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 16/17] hw/arm/smmuv3: IOTLB emulation
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
X-TUID: 5GhNe/F7mXRe

We emulate a TLB cache of size SMMU_IOTLB_MAX_SIZE=256.
It is implemented as a hash table whose key is a combination
of the 16b asid and 48b IOVA.

Entries are invalidated on TLB invalidation commands, either
globally, or per asid, or per asid/iova.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- Add new trace point when smmu is bypassed
- s/iotlb_miss/iotlb_misses, s/iotlb_hit/iotlb_hits
- use SMMUIOTLBKey as a key

Credit to Tomasz Nowicki who did the first implementation of
this IOTLB implementation, inspired of intel_iommu implementation.
---
 hw/arm/smmu-common.c         |  59 ++++++++++++++++++++++++
 hw/arm/smmuv3.c              | 105 ++++++++++++++++++++++++++++++++++++++++---
 hw/arm/trace-events          |  10 +++++
 include/hw/arm/smmu-common.h |  13 ++++++
 4 files changed, 181 insertions(+), 6 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index eaa8a55..aaa80c3 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -24,11 +24,43 @@
 #include "qom/cpu.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qemu/jhash.h"
 
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
 #include "smmu-internal.h"
 
+/* IOTLB Management */
+
+inline void smmu_iotlb_inv_all(SMMUState *s)
+{
+    trace_smmu_iotlb_inv_all();
+    g_hash_table_remove_all(s->iotlb);
+}
+
+static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
+                                         gpointer user_data)
+{
+    uint16_t asid = *(uint16_t *)user_data;
+    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
+
+    return iotlb_key->asid == asid;
+}
+
+inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
+{
+    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
+
+    trace_smmu_iotlb_inv_iova(asid, iova);
+    g_hash_table_remove(s->iotlb, &key);
+}
+
+inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
+{
+    trace_smmu_iotlb_inv_asid(asid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
+}
+
 /* VMSAv8-64 Translation */
 
 /**
@@ -330,6 +362,30 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
     return NULL;
 }
 
+static guint smmu_iotlb_key_hash(gconstpointer v)
+{
+    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
+    uint32_t a, b, c;
+
+    a = b = c = JHASH_INITVAL + sizeof(*key);
+    a += key->asid;
+    b += extract64(key->iova, 0, 32);
+    c += extract64(key->iova, 32, 32);
+
+    __jhash_mix(a, b, c);
+    __jhash_final(a, b, c);
+
+    return c;
+}
+
+static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
+{
+    SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1;
+    SMMUIOTLBKey *k2 = (SMMUIOTLBKey *)v2;
+
+    return (k1->asid == k2->asid) && (k1->iova == k2->iova);
+}
+
 static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
@@ -342,6 +398,8 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
         return;
     }
     s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    s->iotlb = g_hash_table_new_full(smmu_iotlb_key_hash, smmu_iotlb_key_equal,
+                                     g_free, g_free);
     s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
 
     if (s->primary_bus) {
@@ -356,6 +414,7 @@ static void smmu_base_reset(DeviceState *dev)
     SMMUState *s = ARM_SMMU(dev);
 
     g_hash_table_remove_all(s->configs);
+    g_hash_table_remove_all(s->iotlb);
 }
 
 static Property smmu_dev_properties[] = {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index cfece32..1a0e2e1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -572,6 +572,8 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
 
         if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
             g_hash_table_insert(bc->configs, sdev, cfg);
+            cfg->iotlb_misses = 0;
+            cfg->iotlb_hits = 0;
         } else {
             g_free(cfg);
             cfg = NULL;
@@ -595,8 +597,12 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     SMMUv3State *s = sdev->smmu;
     uint32_t sid = smmu_get_sid(sdev);
+    SMMUState *bs = ARM_SMMU(s);
     SMMUEventInfo event = {.type = SMMU_EVT_OK, .sid = sid};
+    uint64_t page_mask, aligned_addr;
+    IOMMUTLBEntry *cached_entry = NULL;
     SMMUPTWEventInfo ptw_info = {};
+    SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
@@ -605,10 +611,13 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
+    SMMUIOTLBKey key, *new_key;
     int ret = 0;
 
     if (!smmu_enabled(s)) {
-        goto out;
+        entry.perm = flag;
+        trace_smmuv3_translate_pt(mr->parent_obj.name, sid, addr, flag);
+        return entry;
     }
 
     cfg = smmuv3_get_config(sdev, &event);
@@ -621,8 +630,61 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto out;
     }
 
-    ret = smmu_ptw(cfg, addr, flag, &entry, &ptw_info);
-    if (ret) {
+    tt = select_tt(cfg, addr);
+    if (!tt) {
+        if (event.record_trans_faults) {
+            event.type = SMMU_EVT_F_TRANSLATION;
+            event.u.f_translation.addr = addr;
+            event.u.f_translation.rnw = flag & 0x1;
+        }
+        ret = -EINVAL;
+        goto out;
+    }
+
+    page_mask = (1ULL << (tt->granule_sz)) - 1;
+    aligned_addr = addr & ~page_mask;
+
+    key.asid = cfg->asid;
+    key.iova = aligned_addr;
+
+    cached_entry = g_hash_table_lookup(bs->iotlb, &key);
+    if (cached_entry) {
+        cfg->iotlb_hits += 1;
+        trace_smmu_iotlb_cache_hit(cfg->asid, aligned_addr,
+                                   cfg->iotlb_hits, cfg->iotlb_misses,
+                                   100 * cfg->iotlb_hits /
+                                   (cfg->iotlb_hits + cfg->iotlb_misses));
+        if ((flag & IOMMU_WO) && !(cached_entry->perm & IOMMU_WO)) {
+            ret = -EPERM;
+            if (event.record_trans_faults) {
+                event.type = SMMU_EVT_F_PERMISSION;
+                event.u.f_permission.addr = addr;
+                event.u.f_permission.rnw = flag & 0x1;
+            }
+        }
+        goto out;
+    }
+
+    cfg->iotlb_misses += 1;
+    trace_smmu_iotlb_cache_miss(cfg->asid, addr & ~page_mask,
+                                cfg->iotlb_hits, cfg->iotlb_misses,
+                                100 * cfg->iotlb_hits /
+                                (cfg->iotlb_hits + cfg->iotlb_misses));
+
+    if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
+        smmu_iotlb_inv_all(bs);
+    }
+
+    cached_entry = g_new0(IOMMUTLBEntry, 1);
+
+    ret = smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info);
+    if (!ret) {
+        new_key = g_new0(SMMUIOTLBKey, 1);
+        new_key->asid = cfg->asid;
+        new_key->iova = aligned_addr;
+        g_hash_table_insert(bs->iotlb, new_key, cached_entry);
+    } else {
+        g_free(cached_entry);
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
             event.type = SMMU_EVT_F_WALK_EABT;
@@ -672,6 +734,9 @@ out:
         smmuv3_record_event(s, &event);
     } else if (!cfg->aborted) {
         entry.perm = flag;
+        entry.translated_addr = cached_entry->translated_addr +
+                                    (addr & page_mask);
+        entry.addr_mask = cached_entry->addr_mask;
         trace_smmuv3_translate(mr->parent_obj.name, sid, addr,
                                entry.translated_addr, entry.perm);
     }
@@ -792,10 +857,39 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             smmuv3_flush_config(sdev);
             break;
         }
-        case SMMU_CMD_TLBI_NH_ALL:
         case SMMU_CMD_TLBI_NH_ASID:
-        case SMMU_CMD_TLBI_NH_VA:
+        {
+            uint16_t asid = CMD_ASID(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh_asid(asid);
+            smmu_iotlb_inv_asid(bs, asid);
+            break;
+        }
+        case SMMU_CMD_TLBI_NH_ALL:
+        case SMMU_CMD_TLBI_NSNH_ALL:
+            trace_smmuv3_cmdq_tlbi_nh();
+            smmu_iotlb_inv_all(bs);
+            break;
         case SMMU_CMD_TLBI_NH_VAA:
+        {
+            dma_addr_t addr = CMD_ADDR(&cmd);
+            uint16_t vmid = CMD_VMID(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr);
+            smmu_iotlb_inv_all(bs);
+            break;
+        }
+        case SMMU_CMD_TLBI_NH_VA:
+        {
+            uint16_t asid = CMD_ASID(&cmd);
+            uint16_t vmid = CMD_VMID(&cmd);
+            dma_addr_t addr = CMD_ADDR(&cmd);
+            bool leaf = CMD_LEAF(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh_va(vmid, asid, addr, leaf);
+            smmu_iotlb_inv_iova(bs, asid, addr);
+            break;
+        }
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
         case SMMU_CMD_TLBI_EL2_ALL:
@@ -804,7 +898,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_EL2_VAA:
         case SMMU_CMD_TLBI_S12_VMALL:
         case SMMU_CMD_TLBI_S2_IPA:
-        case SMMU_CMD_TLBI_NSNH_ALL:
         case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
         case SMMU_CMD_RESUME:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 8cb73d2..e0cfcfc 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -12,6 +12,11 @@ smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr,
 smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
+smmu_iotlb_cache_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, float p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%.1f"
+smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, float p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%.1f"
+smmu_iotlb_inv_all(void) "IOTLB invalidate all"
+smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
+smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 
 #hw/arm/smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
@@ -37,10 +42,15 @@ smmuv3_translate_bypass(const char *n, uint16_t sid, uint64_t addr, bool is_writ
 smmuv3_translate_in(uint16_t sid, int pci_bus_num, uint64_t strtab_base) "SID:0x%x bus:%d strtab_base:0x%"PRIx64
 smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
 smmuv3_translate(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=%d iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
+smmuv3_translate_pt(const char *n, uint16_t sid, uint64_t iova, int perm) "%s sid=%d iova=0x%"PRIx64" perm=0x%x PASSTHROUGH"
 smmuv3_decode_cd(uint32_t oas) "oas=%d"
 smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d"
 smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
 smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
+smmuv3_cmdq_tlbi_nh_va(int vmid, int asid, uint64_t addr, bool leaf) "     |_ vmid =%d asid =%d addr=0x%"PRIx64" leaf=%d"
+smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr) "     |_ vmid =%d addr=0x%"PRIx64
+smmuv3_cmdq_tlbi_nh(void) ""
+smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "     |_ streamid = %d"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 7ce95ca..d173806 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -67,6 +67,8 @@ typedef struct SMMUTransCfg {
     uint8_t tbi;               /* Top Byte Ignore */
     uint16_t asid;
     SMMUTransTableInfo tt[2];
+    uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
+    uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
 } SMMUTransCfg;
 
 typedef struct SMMUDevice {
@@ -89,6 +91,11 @@ typedef struct SMMUPciBus {
     SMMUDevice   *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
 } SMMUPciBus;
 
+typedef struct SMMUIOTLBKey {
+    uint64_t iova;
+    uint16_t asid;
+} SMMUIOTLBKey;
+
 typedef struct SMMUState {
     /* <private> */
     SysBusDevice  dev;
@@ -147,4 +154,10 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
 /* Return the iommu mr associated to @sid, or NULL if none */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
+#define SMMU_IOTLB_MAX_SIZE 256
+
+void smmu_iotlb_inv_all(SMMUState *s);
+void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
+void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
+
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

