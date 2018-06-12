Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5015525wrq;
        Tue, 12 Jun 2018 01:09:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKImKLX2Zq566vsB9KitlRF7X2d9yYIdtynz6cN07Pu2d0dIGkiIAe1LdRCmos9WKjgV58ma
X-Received: by 2002:a37:c01:: with SMTP id 1-v6mr2385727qkm.118.1528790942761;
        Tue, 12 Jun 2018 01:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528790942; cv=none;
        d=google.com; s=arc-20160816;
        b=d4dVIoRGBDeYMOur4uwj/fGfqO/Qopdq3t7wIaWq9sEcrejUpJFVfqV992T9bt1X0w
         VCWTxcCSEH1m+jVYW7Nycch/5pc5OaCeoeCXp8LKWalXv7UKdzVqXLoapve5F1Nq5FLE
         tVHLVrTQgv4cbS4CAIdjTkccsRkjratlAN/vXQRIBxVaOfuvgD41La1+fJySfhNaj0C9
         sYLpO3ttCDEUTKE9wkvOQKQ8S7zNBk4Rwmb4AiDeC9tV4NAI7HvSYEFg9HF78NJTPJC2
         ZGhSpfpIGQ1GfDTg8girepl3/7MKQ6XM/dD7R7vLLQtAcyOiyP7LelSsgx377hUl86Pl
         Y3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=wcBsoVjCmlp8V/J9GoEvpprI9RulfsLR2lg5lScdpOA=;
        b=KV/bZtm47ZBgTLx0PmXNuzDclYaWBgeGZCqClbsEX+q2vG/7imXj/HPA8GFeYIlCn5
         EY40ueaFapS3yjPU3j0QBYBKv6Ajg2o+TCSgdBQMWvesmDmyb+mlxUU9tNNBDqlYunou
         Nn+QOPRtfcaqZk0LYi2hfyzFN4VNnTV22JrHMWkVntkCtgD+QbvLDw0ae3XOsWtXhL0/
         FJcqCeSSmo9aTBXTYfKbZcEh3LxBkNJNhG1exAqrcR7Py+foxljPUr/ZFrIEyt/5QGBy
         llvPtGO/Z7ehQqTPeBC7T9GalbqJULAidcDPL7+VKsbhwr7IAs6oRBJLQeMDpZuev5PL
         WSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y36-v6si297704qvf.270.2018.06.12.01.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 01:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSeMQ-0007Du-3l
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 04:09:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fSeM3-0007Ar-Sj
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 04:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fSeM2-0003eR-0T
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 04:08:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33350 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fSeM1-0003eK-Ps; Tue, 12 Jun 2018 04:08:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D93A818BAED;
	Tue, 12 Jun 2018 08:08:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42EA62035721;
	Tue, 12 Jun 2018 08:08:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, jia.he@hxt-semitech.com,
	hejianet@gmail.com
Date: Tue, 12 Jun 2018 10:08:26 +0200
Message-Id: <1528790908-23441-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 12 Jun 2018 08:08:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 12 Jun 2018 08:08:37 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 2/4] hw/arm/smmuv3: Cache/invalidate config
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WKyMr7lZgocs

Let's cache config data to avoid fetching and parsing STE/CD
structures on each translation. We invalidate them on data structure
invalidation commands.

We put in place a per-smmu mutex to protect the config cache. This
will be useful too to protect the IOTLB cache. The caches can be
accessed without BQL, ie. in IO dataplane. The same kind of mutex was
put in place in the intel viommu.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- restore mutex

v1:
- only insert the new config if decode_cfg succeeds
- use smmu_get_sid for trace_* and store hits/misses in the SMMUDevice
- s/smmuv3_put_config/smmuv3_flush_config
- document smmuv3_get_config
- removing the mutex as BQL does the job
---
 hw/arm/smmu-common.c         |  24 +++++++-
 hw/arm/smmuv3.c              | 135 +++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events          |   6 ++
 include/hw/arm/smmu-common.h |   5 ++
 include/hw/arm/smmuv3.h      |   1 +
 5 files changed, 164 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 01c7be8..264e096 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -310,6 +310,24 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
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
@@ -321,7 +339,7 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
-
+    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
     s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
 
     if (s->primary_bus) {
@@ -333,7 +351,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
 
 static void smmu_base_reset(DeviceState *dev)
 {
-    /* will be filled later on */
+    SMMUState *s = ARM_SMMU(dev);
+
+    g_hash_table_remove_all(s->configs);
 }
 
 static Property smmu_dev_properties[] = {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4e7833b..4c41f51 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -544,6 +544,58 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
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
@@ -553,7 +605,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid};
     SMMUPTWEventInfo ptw_info = {};
     SMMUTranslationStatus status;
-    SMMUTransCfg cfg = {};
+    SMMUTransCfg *cfg = NULL;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
@@ -562,27 +614,30 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .perm = IOMMU_NONE,
     };
 
+    qemu_mutex_lock(&s->mutex);
+
     if (!smmu_enabled(s)) {
         status = SMMU_TRANS_DISABLE;
         goto epilogue;
     }
 
-    if (smmuv3_decode_config(mr, &cfg, &event)) {
+    cfg = smmuv3_get_config(sdev, &event);
+    if (!cfg) {
         status = SMMU_TRANS_ERROR;
         goto epilogue;
     }
 
-    if (cfg.aborted) {
+    if (cfg->aborted) {
         status = SMMU_TRANS_ABORT;
         goto epilogue;
     }
 
-    if (cfg.bypassed) {
+    if (cfg->bypassed) {
         status = SMMU_TRANS_BYPASS;
         goto epilogue;
     }
 
-    if (smmu_ptw(&cfg, addr, flag, &entry, &ptw_info)) {
+    if (smmu_ptw(cfg, addr, flag, &entry, &ptw_info)) {
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
             event.type = SMMU_EVT_F_WALK_EABT;
@@ -628,6 +683,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     }
 
 epilogue:
+    qemu_mutex_unlock(&s->mutex);
     switch (status) {
     case SMMU_TRANS_SUCCESS:
         entry.perm = flag;
@@ -664,6 +720,7 @@ epilogue:
 
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
+    SMMUState *bs = ARM_SMMU(s);
     SMMUCmdError cmd_error = SMMU_CERROR_NONE;
     SMMUQueue *q = &s->cmdq;
     SMMUCommandType type = 0;
@@ -698,6 +755,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
         trace_smmuv3_cmdq_opcode(smmu_cmd_string(type));
 
+        qemu_mutex_lock(&s->mutex);
         switch (type) {
         case SMMU_CMD_SYNC:
             if (CMD_SYNC_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
@@ -706,10 +764,74 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
@@ -735,6 +857,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                           "Illegal command type: %d\n", CMD_TYPE(&cmd));
             break;
         }
+        qemu_mutex_unlock(&s->mutex);
         if (cmd_error) {
             break;
         }
@@ -1114,6 +1237,8 @@ static void smmu_realize(DeviceState *d, Error **errp)
         return;
     }
 
+    qemu_mutex_init(&s->mutex);
+
     memory_region_init_io(&sys->iomem, OBJECT(s),
                           &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, 0x20000);
 
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 0ab66bb..5bddfeb 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -40,3 +40,9 @@ smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t tr
 smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
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
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 23f7036..36b2f45 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -59,6 +59,7 @@ typedef struct SMMUv3State {
     SMMUQueue eventq, cmdq;
 
     qemu_irq     irq[4];
+    QemuMutex mutex;
 } SMMUv3State;
 
 typedef enum {
-- 
2.5.5

