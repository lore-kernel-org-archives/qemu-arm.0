Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp250597lfg;
        Thu, 25 Feb 2021 03:11:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3/X6VF6J3+fBpB6sP//qF0SJzAVEJnIE2apCVqViJuZXdsjoY4XI1G2zB6yZpduSFag4u
X-Received: by 2002:a5d:9250:: with SMTP id e16mr2237786iol.27.1614251476414;
        Thu, 25 Feb 2021 03:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251476; cv=none;
        d=google.com; s=arc-20160816;
        b=fIFtTpy+uu0MWTsKQhT9AkbiDd1uYg5pEOgUX/dmOLjP9EBJb0+oUpz/ogFqcHVLWG
         iMk0txtjtATN8kb+S8ARygcqAEx9yTVB0dS+xHvt07qpfVyvlLD1Ffsj6MxwxbSjq/+w
         6nBVo3ZsbTLna6w3kR6+03M2rhkSzhR7Bxwr6YmOQIG/6dFXooeCtNAFct9Xo5gxBLuF
         VyS9fIDNdkUiYrUjy7sgLisCFINRdMtqSIy2aoUbNaOODkl/kWhtqzxjhs725bLWcMh7
         XvgMLqx8Tm6QNvwjFmMh569J1TXoZ2EtgyzDIbsedRcsJ2ILEupWDpcnWOSfGTjnX+AP
         d6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vrKqmRz9AcNgo7RCVJAFwz3/iAtnH0I8AIXV6rOC2p4=;
        b=aerlHs5urCvKmp7/kmichmKZOjmTUOoNdvKgFFeYlzc3ORXFpHsgjoN5G5Bnc9MUWQ
         Z5XxUAKTXN1iYgVcGSlaUt7FbCfUOBpZs4dadnHwPgOuIm6lG6yF99B6YLFEs1T8gXEr
         TI+k2CPZEuKH0cx0zbgZvwXrAm7jMP8E05uwRZ6E4MH7Kwrx9E7kiqup1w/DbzKeO/NX
         F57W27tTj55UzUzlDXl42K+OQ0KLvXpFMCs9AM07gJf4o110GnvUOyLd3iV+1CwfEqg+
         Um0j7NGteWUmSr37oyliM/4U+ifNsR8k11lEXb6TanRylFXO6k3RVgakhoUTWsuGY51/
         eVTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PEFpq/NX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si5273150ile.47.2021.02.25.03.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PEFpq/NX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEY7-0007N7-Lc
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEL5-0003o2-Tr
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEL3-0006nc-IA
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrKqmRz9AcNgo7RCVJAFwz3/iAtnH0I8AIXV6rOC2p4=;
 b=PEFpq/NXh3hJrK1zzJepzKp3dHQqV1RJhtt+ZGkF+gjypq/WSRtGTKfzAsNGPr3Udtt/kW
 FyEtgk9McnvLOmvOSt8Ii15xrhnMTDIWmyo7Teit+s/WZ1qEnwEgoG1rU9b2h1UddHpC1S
 vhLpHP6WdOtkgRX1g1o+JrGo4kjA0qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-cpq5Y8-nN2miDWhE7PNRaw-1; Thu, 25 Feb 2021 05:57:41 -0500
X-MC-Unique: cpq5Y8-nN2miDWhE7PNRaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0CF80196E;
 Thu, 25 Feb 2021 10:57:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C34335D9D7;
 Thu, 25 Feb 2021 10:57:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 24/28] hw/arm/smmuv3: Pass stage 1 configurations to the host
Date: Thu, 25 Feb 2021 11:52:29 +0100
Message-Id: <20210225105233.650545-25-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WPaPWkuJeuTj

In case PASID PciOps are set for the device we call
the set_pasid_table() callback on each STE update.

This allows to pass the guest stage 1 configuration
to the host and apply it at physical level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- Use PciOps instead of config notifiers

v3 -> v4:
- fix compile issue with mingw

v2 -> v3:
- adapt to pasid_cfg field changes. Use local variable
- add trace event
- set version fields
- use CONFIG_PASID

v1 -> v2:
- do not notify anymore on CD change. Anyway the smmuv3 linux
  driver is not sending any CD invalidation commands. If we were
  to propagate CD invalidation commands, we would use the
  CACHE_INVALIDATE VFIO ioctl.
- notify a precise config flags to prepare for addition of new
  flags
---
 hw/arm/smmu-internal.h |  1 +
 hw/arm/smmuv3.c        | 72 ++++++++++++++++++++++++++++++++++++------
 hw/arm/trace-events    |  1 +
 3 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 2d75b31953..5ef8c598c6 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -105,6 +105,7 @@ typedef struct SMMUIOTLBPageInvInfo {
 } SMMUIOTLBPageInvInfo;
 
 typedef struct SMMUSIDRange {
+    SMMUState *state;
     uint32_t start;
     uint32_t end;
 } SMMUSIDRange;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 24d77175bf..03cc299710 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -16,6 +16,10 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#ifdef __linux__
+#include "linux/iommu.h"
+#endif
+
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "hw/irq.h"
@@ -923,6 +927,61 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     }
 }
 
+static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
+{
+#ifdef __linux__
+    IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
+    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid,
+                           .inval_ste_allowed = true};
+    IOMMUConfig iommu_config = {};
+    SMMUTransCfg *cfg;
+    SMMUDevice *sdev;
+
+    if (!mr) {
+        return;
+    }
+
+    sdev = container_of(mr, SMMUDevice, iommu);
+
+    /* flush QEMU config cache */
+    smmuv3_flush_config(sdev);
+
+    if (!pci_device_is_pasid_ops_set(sdev->bus, sdev->devfn)) {
+        return;
+    }
+
+    cfg = smmuv3_get_config(sdev, &event);
+
+    if (!cfg) {
+        return;
+    }
+
+    iommu_config.pasid_cfg.argsz = sizeof(struct iommu_pasid_table_config);
+    iommu_config.pasid_cfg.version = PASID_TABLE_CFG_VERSION_1;
+    iommu_config.pasid_cfg.format = IOMMU_PASID_FORMAT_SMMUV3;
+    iommu_config.pasid_cfg.base_ptr = cfg->s1ctxptr;
+    iommu_config.pasid_cfg.pasid_bits = 0;
+    iommu_config.pasid_cfg.vendor_data.smmuv3.version = PASID_TABLE_SMMUV3_CFG_VERSION_1;
+
+    if (cfg->disabled || cfg->bypassed) {
+        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_BYPASS;
+    } else if (cfg->aborted) {
+        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_ABORT;
+    } else {
+        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_TRANSLATE;
+    }
+
+    trace_smmuv3_notify_config_change(mr->parent_obj.name,
+                                      iommu_config.pasid_cfg.config,
+                                      iommu_config.pasid_cfg.base_ptr);
+
+    if (pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config)) {
+        error_report("Failed to pass PASID table to host for iommu mr %s (%m)",
+                     mr->parent_obj.name);
+    }
+#endif
+}
+
 static gboolean
 smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
 {
@@ -933,6 +992,7 @@ smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
     if (sid < sid_range->start || sid > sid_range->end) {
         return false;
     }
+    smmuv3_notify_config_change(sid_range->state, sid);
     trace_smmuv3_config_cache_inv(sid);
     return true;
 }
@@ -1003,22 +1063,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid = CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
 
-            if (!mr) {
-                break;
-            }
-
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            smmuv3_notify_config_change(bs, sid);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1026,7 +1078,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             uint32_t start = CMD_SID(&cmd);
             uint8_t range = CMD_STE_RANGE(&cmd);
             uint64_t end = start + (1ULL << (range + 1)) - 1;
-            SMMUSIDRange sid_range = {start, end};
+            SMMUSIDRange sid_range = {bs, start, end};
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 8e530ba79d..b0b0030d24 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,4 +53,5 @@ smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s1ctxptr) "iommu mr=%s config=%d s1ctxptr=0x%"PRIx64
 
-- 
2.26.2

