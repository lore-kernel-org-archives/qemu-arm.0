Received: by 10.28.4.212 with SMTP id 203csp885774wme;
        Wed, 25 Apr 2018 07:29:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqPtbDNl4JtM8N13G8dt/bwD/gA1aBpX3VuBZ8jGoMizIgpdAweLnYTZL9wGK1CTdYwiRil
X-Received: by 10.12.188.145 with SMTP id l17mr8213008qvg.228.1524666561461;
        Wed, 25 Apr 2018 07:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666561; cv=none;
        d=google.com; s=arc-20160816;
        b=PiUJ/y+mBzFcCItJvDTB5CLOYAdeKNsTd523TlIhXOlLJM5/ozS8tT8JiJWF333JIP
         pdjjicPlH/5JAGoLsWT5Ozp4VU5Wb9yaG+BCZApCS4jQYtvgeMYJnVnVaSx73YTFs+1K
         JXvfXVPxCUQANKYdAS871OZSighNdYj/51lXDG8MBxaESwE3kTcp9vk2kNCnwuyUNn2q
         NY9rixBn+/4D+c1JNJeiA7aciPNL4Giq0VpCGVP2EHIt7DqY1aZzPIoSjHr01XjveL9p
         aKTO77kXBX2+AGpO8B566LP81l0mLgKWw7PYQuuRIbP6Zp37BcBtsNQO8aS4Cl88jeEy
         FvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9hZAbtt+L6X1FxSpWK0jn608YHpZdGYqXCnnY9H0uYs=;
        b=Ica8le07yl9LdL5wUmYpoCnXzVyQxgYpT5Gjs0LsW6TaMGuyumXEYS7wiXyjpYGZk/
         9/L59eYS36utkmiwVG2NAsxOYbA4/kK+/UmoODowJPEAS2FQDedhrAF67OlBRJsCL73/
         qQdSWDcSNNbcmQiiPc7clF0tEJU0QN7Z4do+8UrJA2cJrmAPaAWSP++BF8y4364jWXn2
         ROt4+skpQwGWYmAqOG94PSxr69Z1sIP3Rt4liQQIRA4gYLYxXdUCTLFyeKb3h0bvKXXe
         WE1YqHX+EfvvWPvcYIhQRpbFhrQt1BwjwxFPVxLfRweHQRJLyIt3jjG8qu28RubuzIbu
         qtJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8si11198487qkr.151.2018.04.25.07.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLQ8-0002IR-PG
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:29:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEB-0000w1-9K
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLE9-00069P-Kj
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33166 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLE9-00069E-Ea; Wed, 25 Apr 2018 10:16:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02E538DC3B;
	Wed, 25 Apr 2018 14:16:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C7A92023239;
	Wed, 25 Apr 2018 14:16:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:16:00 +0200
Message-Id: <1524665762-31355-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:16:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:16:57 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 15/17] hw/arm/smmuv3: Cache/invalidate config
 data
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
X-TUID: W/jBDB2sEoy8

Let's cache config data to avoid fetching and parsing STE/CD
structures on each translation. We invalidate them on data structure
invalidation commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- only insert the new config if decode_cfg succeeds
- use smmu_get_sid for trace_* and store hits/misses in the SMMUDevice
- s/smmuv3_put_config/smmuv3_flush_config
- document smmuv3_get_config
- removing the mutex as BQL does the job
---
 hw/arm/smmu-common.c         |  26 ++++++++-
 hw/arm/smmuv3.c              | 130 +++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events          |   6 ++
 include/hw/arm/smmu-common.h |   5 ++
 4 files changed, 159 insertions(+), 8 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 01c7be8..eaa8a55 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -297,6 +297,8 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
         sdev->smmu = s;
         sdev->bus = bus;
         sdev->devfn = devfn;
+        sdev->cfg_cache_misses = 0;
+        sdev->cfg_cache_hits = 0;
 
         memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
                                  s->mrtypename,
@@ -310,6 +312,24 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
     return &sdev->as;
 }
 
+IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
+{
+    uint8_t bus_n, devfn;
+    SMMUPciBus *smmu_bus;
+    SMMUDevice *smmu;
+
+    bus_n = PCI_BUS_NUM(sid);
+    smmu_bus = smmu_find_smmu_pcibus(s, bus_n);
+    if (smmu_bus) {
+        devfn = sid & 0x7;
+        smmu = smmu_bus->pbdev[devfn];
+        if (smmu) {
+            return &smmu->iommu;
+        }
+    }
+    return NULL;
+}
+
 static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
@@ -321,7 +341,7 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
-
+    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
     s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
 
     if (s->primary_bus) {
@@ -333,7 +353,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
 
 static void smmu_base_reset(DeviceState *dev)
 {
-    /* will be filled later on */
+    SMMUState *s = ARM_SMMU(dev);
+
+    g_hash_table_remove_all(s->configs);
 }
 
 static Property smmu_dev_properties[] = {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index b3026de..cfece32 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -537,6 +537,58 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
     return decode_cd(cfg, &cd, event);
 }
 
+/**
+ * smmuv3_get_config - Look up for a cached copy of configuration data for
+ * @sdev and on cache miss performs a configuration structure decoding from
+ * guest RAM.
+ *
+ * @sdev: SMMUDevice handle
+ * @event: output event info
+ *
+ * The configuration cache contains data resulting from both STE and CD
+ * decoding under the form of an SMMUTransCfg struct. The hash table is indexed
+ * by the SMMUDevice handle.
+ */
+static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
+{
+    SMMUv3State *s = sdev->smmu;
+    SMMUState *bc = &s->smmu_state;
+    SMMUTransCfg *cfg;
+
+    cfg = g_hash_table_lookup(bc->configs, sdev);
+    if (cfg) {
+        sdev->cfg_cache_hits += 1;
+        trace_smmuv3_config_cache_hit(smmu_get_sid(sdev),
+                            sdev->cfg_cache_hits, sdev->cfg_cache_misses,
+                            100 * sdev->cfg_cache_hits /
+                            (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
+    } else {
+        sdev->cfg_cache_misses += 1;
+        trace_smmuv3_config_cache_miss(smmu_get_sid(sdev),
+                            sdev->cfg_cache_hits, sdev->cfg_cache_misses,
+                            100 * sdev->cfg_cache_hits /
+                            (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
+        cfg = g_new0(SMMUTransCfg, 1);
+
+        if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
+            g_hash_table_insert(bc->configs, sdev, cfg);
+        } else {
+            g_free(cfg);
+            cfg = NULL;
+        }
+    }
+    return cfg;
+}
+
+static void smmuv3_flush_config(SMMUDevice *sdev)
+{
+    SMMUv3State *s = sdev->smmu;
+    SMMUState *bc = &s->smmu_state;
+
+    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
+    g_hash_table_remove(bc->configs, sdev);
+}
+
 static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                       IOMMUAccessFlags flag)
 {
@@ -545,7 +597,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     uint32_t sid = smmu_get_sid(sdev);
     SMMUEventInfo event = {.type = SMMU_EVT_OK, .sid = sid};
     SMMUPTWEventInfo ptw_info = {};
-    SMMUTransCfg cfg = {};
+    SMMUTransCfg *cfg = NULL;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
@@ -559,16 +611,17 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto out;
     }
 
-    ret = smmuv3_decode_config(mr, &cfg, &event);
-    if (ret) {
+    cfg = smmuv3_get_config(sdev, &event);
+    if (!cfg) {
+        ret = -EINVAL;
         goto out;
     }
 
-    if (cfg.aborted) {
+    if (cfg->aborted) {
         goto out;
     }
 
-    ret = smmu_ptw(&cfg, addr, flag, &entry, &ptw_info);
+    ret = smmu_ptw(cfg, addr, flag, &entry, &ptw_info);
     if (ret) {
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
@@ -617,7 +670,7 @@ out:
                       mr->parent_obj.name, addr, ret);
         entry.perm = IOMMU_NONE;
         smmuv3_record_event(s, &event);
-    } else if (!cfg.aborted) {
+    } else if (!cfg->aborted) {
         entry.perm = flag;
         trace_smmuv3_translate(mr->parent_obj.name, sid, addr,
                                entry.translated_addr, entry.perm);
@@ -628,6 +681,7 @@ out:
 
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
+    SMMUState *bs = ARM_SMMU(s);
     SMMUCmdError cmd_error = SMMU_CERROR_NONE;
     SMMUQueue *q = &s->cmdq;
     SMMUCommandType type = 0;
@@ -670,10 +724,74 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             break;
         case SMMU_CMD_PREFETCH_CONFIG:
         case SMMU_CMD_PREFETCH_ADDR:
+            break;
         case SMMU_CMD_CFGI_STE:
+        {
+            uint32_t sid = CMD_SID(&cmd);
+            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
+            SMMUDevice *sdev;
+
+            if (CMD_SSEC(&cmd)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
+            if (!mr) {
+                break;
+            }
+
+            trace_smmuv3_cmdq_cfgi_ste(sid);
+            sdev = container_of(mr, SMMUDevice, iommu);
+            smmuv3_flush_config(sdev);
+
+            break;
+        }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
+        {
+            uint32_t start = CMD_SID(&cmd), end, i;
+            uint8_t range = CMD_STE_RANGE(&cmd);
+
+            if (CMD_SSEC(&cmd)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
+            end = start + (1 << (range + 1)) - 1;
+            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+
+            for (i = start; i <= end; i++) {
+                IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, i);
+                SMMUDevice *sdev;
+
+                if (!mr) {
+                    continue;
+                }
+                sdev = container_of(mr, SMMUDevice, iommu);
+                smmuv3_flush_config(sdev);
+            }
+            break;
+        }
         case SMMU_CMD_CFGI_CD:
         case SMMU_CMD_CFGI_CD_ALL:
+        {
+            uint32_t sid = CMD_SID(&cmd);
+            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
+            SMMUDevice *sdev;
+
+            if (CMD_SSEC(&cmd)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
+            if (!mr) {
+                break;
+            }
+
+            trace_smmuv3_cmdq_cfgi_cd(sid);
+            sdev = container_of(mr, SMMUDevice, iommu);
+            smmuv3_flush_config(sdev);
+            break;
+        }
         case SMMU_CMD_TLBI_NH_ALL:
         case SMMU_CMD_TLBI_NH_ASID:
         case SMMU_CMD_TLBI_NH_VA:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index d7273bd..8cb73d2 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -39,3 +39,9 @@ smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
 smmuv3_translate(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=%d iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
 smmuv3_decode_cd(uint32_t oas) "oas=%d"
 smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d"
+smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
+smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
+smmuv3_cmdq_cfgi_cd(uint32_t sid) "     |_ streamid = %d"
+smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
+smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
+smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index c41eb5c3..7ce95ca 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -75,6 +75,8 @@ typedef struct SMMUDevice {
     int                devfn;
     IOMMUMemoryRegion  iommu;
     AddressSpace       as;
+    uint32_t           cfg_cache_hits;
+    uint32_t           cfg_cache_misses;
 } SMMUDevice;
 
 typedef struct SMMUNotifierNode {
@@ -142,4 +144,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
 
+/* Return the iommu mr associated to @sid, or NULL if none */
+IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
+
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

