Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3943441lfb;
        Mon, 16 Nov 2020 10:34:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTY9R69dQ8oLKYETm+DSEdteo04mMm3CnVIV7J/GqKU5biYQyAbBkdVJTJ3U+ZwOpDLLZM
X-Received: by 2002:a25:a525:: with SMTP id h34mr23493430ybi.152.1605551677879;
        Mon, 16 Nov 2020 10:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605551677; cv=none;
        d=google.com; s=arc-20160816;
        b=C+pWvRJvFEOxpFgCzs/5Vmf0dm2MeRhbLno1kY3nFNy6ZGufMMj0newL55q+mHhXal
         /BR8E1bX/EclaL+4lU/9eDlVFwc8PdW/voOjCMN3XZTMg0NrUdIRrWL+P4AzxdptLjSx
         rn3DmkDLE4yagJJYtGprct2uIs/q7izofE/JdiJLZJu5ueFjqQORRxJo1kIJ1HwweTtY
         Z7Vi0KpRPfgJW2f0vU2S6VBg6qlbfZ6HSmk7uW0U5A9KHwqsS1rAN82xy0L2/Je9ZtOW
         a3eIOLFESUVXETV/i02xvRPmcTd2Q49qMuG6/lG8zgXaw/t7cEC68sWtVoCZebYNwO6f
         ijtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gJvNlMPcGTPAbFboGsstPpVzQRHGQSY2TQRLZKzwVck=;
        b=Uzrd3fqHhg9PnjeWpi7lqZSDpp7X+ActBlNpDN9Sk4rgCLki43ml6P6n6iLSs11nYY
         3Uajo+5MFStUkgzpd3soplbStiRz2IbBijsP0AfuIA2TrmKAeAvkHYGZAH2msPnqRn0p
         krI08vqqXzLfJhzkgrp951nu0ahuWVN3krqRCtBEawbZMV+KD9MGQrBa2FQ4xUF/IZZR
         B1/XTXl2l/lpOFwiLBKm/ceI7Da14AN0h19WNzS6f2+gVG0cIIfvUma+9IegYRW3N1AM
         UinKGWkKl7Ybzm9Giwd5TNftq7OUIt0ksTg2NEt4Vns71pqeyOFmVy+Wk/aRZji+bhin
         bSHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XrO2TNx/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si9838286ybp.374.2020.11.16.10.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XrO2TNx/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kejKn-0005Wb-7d
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4p-0002qn-Jq
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4e-0001qt-RJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJvNlMPcGTPAbFboGsstPpVzQRHGQSY2TQRLZKzwVck=;
 b=XrO2TNx/f/dyFJLZCudUmIaSCvQ+LQATZ1ZNcJFvD1ZbcqVOs36oE0nFT7QfTbSew/vr3l
 DaZ/zGYBuvRep3LP323U7MxRRkvgJL1la+qnhDd+W3N9gOWNVhE5Ry3lSUDWsi7cKrGwcl
 r63HLvpttE9pb6NAn9Lb7toZeSF8UqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-215GnqueONmNXzO2cTIghg-1; Mon, 16 Nov 2020 13:17:53 -0500
X-MC-Unique: 215GnqueONmNXzO2cTIghg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9CF64152;
 Mon, 16 Nov 2020 18:17:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4AD15C1CF;
 Mon, 16 Nov 2020 18:17:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 22/26] hw/arm/smmuv3: Pass stage 1 configurations to the host
Date: Mon, 16 Nov 2020 19:13:45 +0100
Message-Id: <20201116181349.11908-23-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MM3RMcFTEORz

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
 hw/arm/smmuv3.c     | 78 +++++++++++++++++++++++++++++++++++----------
 hw/arm/trace-events |  1 +
 2 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c314f9e4c9..2b36bb4e4f 100644
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
@@ -878,6 +882,61 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
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
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -928,22 +987,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
@@ -960,14 +1011,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             trace_smmuv3_cmdq_cfgi_ste_range(start, end);
 
             for (i = start; i <= end; i++) {
-                IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, i);
-                SMMUDevice *sdev;
-
-                if (!mr) {
-                    continue;
-                }
-                sdev = container_of(mr, SMMUDevice, iommu);
-                smmuv3_flush_config(sdev);
+                smmuv3_notify_config_change(bs, i);
             }
             break;
         }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index a335ee891d..35e562ab74 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -52,4 +52,5 @@ smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s1ctxptr) "iommu mr=%s config=%d s1ctxptr=0x%"PRIx64
 
-- 
2.21.3

