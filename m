Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp529704wrq;
        Fri, 22 Jun 2018 00:45:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKsOba5MEZC/0BzAGWjwWjLoX5WenLtwKzKW4SDx8yK7GUNBI7B5tecNX6YPC5z+1suhHOc
X-Received: by 2002:ac8:7391:: with SMTP id t17-v6mr406184qtp.329.1529653528497;
        Fri, 22 Jun 2018 00:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529653528; cv=none;
        d=google.com; s=arc-20160816;
        b=X+SjlMbE9QZN6ZqToXLKEpDN/v3ct/0Xkt21bjFMf72ZpZDiwvwYYFQWjshUJYxO2J
         mGTCuTUuqqqF2YQbUwGYmLFrmfkrMtSEqucn0qdsz7ORKwemOlXvWZKfrHmR/yAwFwSE
         +/qQT5YmMfqTI7idsjMweOi/WiMs9ykw/X+9qmI/+xjLa4gc3DWeSQ+vxij9DaC/zGxq
         SmWy16kUvwS9X1V5o/lk2GMNsmsqxXsRzpuxWHwlFU2MKFL/p4P2m8g0C6ZXjGAfOTZ+
         Vo7kGoqOGlyRqyXuZ8nUPMohszOr9CrlCgoH4YigWrgmtnPr+jvrkZp0EZQLRc0o/9L6
         BFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=rWdZGTlf+cUDvctUqXlqpm0QFxtE693WgIrB16FY3es=;
        b=O0UqH0Eyf/X5Zj1X6+NQs5jZrnS9ZmjU95yZBoAnh1I3vuYC1zdKJ/y4EoVHvsw0g7
         azMOFxVBUnD0V9dnpCOMvUCynEOePAuOV5Dr2/WbJz57rjMEeBQec1RzKY6abWRALmKv
         mPA5kmQqvLvUyrGqoqfnJmoJwnCriyZ1zOF+4JMqkwiNjksBwMU+uGh2GztJlZQmAwxL
         BPTpfoH0SDAXM9bI+t771xfZSdNtos2iIsTCSjGHc4hheffIOO2ozr1e04g1/8Plhtwy
         AoQntcXLo2yM/pQ8B2HTIl7SODf5k/0KfmU4s/PQnVXAh+eSIWvRQ5HAK9fscycq87rm
         JyoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x52-v6si1992985qtb.19.2018.06.22.00.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWGl5-00010U-Ux
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:45:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWGkq-0000xG-TX
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:45:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWGko-00008O-QB
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:45:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41296 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWGko-00007L-KQ; Fri, 22 Jun 2018 03:45:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F36464079F07;
	Fri, 22 Jun 2018 07:45:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFFE42026D6B;
	Fri, 22 Jun 2018 07:45:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, jia.he@hxt-semitech.com,
	hejianet@gmail.com
Date: Fri, 22 Jun 2018 09:44:59 +0200
Message-Id: <1529653501-15358-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529653501-15358-1-git-send-email-eric.auger@redhat.com>
References: <1529653501-15358-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 07:45:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 07:45:10 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 2/4] hw/arm/smmuv3: Cache/invalidate config
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
X-TUID: WbdCEXS/FXDs

Let's cache config data to avoid fetching and parsing STE/CD
structures on each translation. We invalidate them on data structure
invalidation commands.

We put in place a per-smmu mutex to protect the config cache. This
will be useful too to protect the IOTLB cache. The caches can be
accessed without BQL, ie. in IO dataplane. The same kind of mutex was
put in place in the intel viommu.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v2 -> v3:
- use uint32_t instead of float in cache hit rate traces
- change the format of the new traces
- added Peter's R-b

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
index 3c5f724..db242c7 100644
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
index 70b8f29..df704c2 100644
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
+        sdev->cfg_cache_hits++;
+        trace_smmuv3_config_cache_hit(smmu_get_sid(sdev),
+                            sdev->cfg_cache_hits, sdev->cfg_cache_misses,
+                            100 * sdev->cfg_cache_hits /
+                            (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
+    } else {
+        sdev->cfg_cache_misses++;
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
                                       IOMMUAccessFlags flag, int iommu_idx)
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
index 0ab66bb..8ee4c21 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -40,3 +40,9 @@ smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t tr
 smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
 smmuv3_decode_cd(uint32_t oas) "oas=%d"
 smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d"
+smmuv3_cmdq_cfgi_ste(int streamid) "streamid =%d"
+smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%d - end=0x%d"
+smmuv3_cmdq_cfgi_cd(uint32_t sid) "streamid = %d"
+smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%d)"
+smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%d)"
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

