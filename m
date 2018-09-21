Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2866479wrd;
        Fri, 21 Sep 2018 01:36:04 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbIICqQmwycjSBN3sWVkaUU0U3Zg42oPNU4EMaDO3++E8Blp8oaA9EV7XdCW3qGs8ulAvSu
X-Received: by 2002:ac8:47cf:: with SMTP id d15-v6mr30766845qtr.24.1537518964676;
        Fri, 21 Sep 2018 01:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518964; cv=none;
        d=google.com; s=arc-20160816;
        b=ezD4PiOu8SaNyv2RICakHBjwElAI5ZWKmJxU/F/Jnbl0Z1X8r6nzEqrFmX8/520IES
         i9cwtyrviN4pA+CeQIxTFPl3pFJqyQKkFrbbZHCT6D1p6Av50hihUoWiBC0A7OqRkUbT
         WTunz/2ancYVA5CaL8vnuLqXD8G3DCksjVctfaqNhoZqSxnlfm4U4rHPPGpkW28XaGDQ
         WtX9El3VP24MQ9u6CtfjmQCLZYnS+DItBpsqGb7PmO4QkNYBVGzzTaO75OGMr4W6mtMb
         EQXeakT12aA93B1sPToPt89ERaSHXxz89x8t52G/dhhZ8YGqnJPCZJpk3EMGFviY8DSQ
         CDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=EH2a2M9C/76X9VdLThJ52v6uDBGfmJkT3Z8J0LqEVzE=;
        b=Q/BNS7XYW1pyWCfELMA3dgC04wvUDkASjY93WHu97EjJEaj3zL+x4mBxdzxFpGwxZn
         36iz/Qa+I7GU+U4UVou0kJQFRnWbPk2PXREb7mhL9wRBNHqVtGEotv/5GBmLNNHpQqb6
         oVPGtYBVV7EUNxShLEAb7875oUbTOjRKYGfnoGTqA9esfOLJQVN24NrxrD9jQXh4K5i3
         bAy6m5Uub/ic6O8vZfak09jPO700QGi6PtZ7oGD3zznbeMvWhZ1eABv02AKEL7a516+3
         8stBgFaZ40nvIX/6XyYx8NmHMJSkiiE+UXvItoK7h/zKhoKbEmT192BpUQ8m13D3Lfxv
         EViQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p71-v6si4657966qkh.51.2018.09.21.01.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Guy-0002oF-3b
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GgA-00057b-2y
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gg8-0005Y7-4f
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:20:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gfz-0005Ca-Aa; Fri, 21 Sep 2018 04:20:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E6CDC04F4C4;
	Fri, 21 Sep 2018 08:20:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47C227D665;
	Fri, 21 Sep 2018 08:20:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:06 +0200
Message-Id: <20180921081819.9203-16-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 21 Sep 2018 08:20:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 15/28] hw/arm/smmuv3: Notify on config changes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jEXzoMKrmUVt

In case IOMMU config notifiers are attached to the
IOMMU memory region, we execute them, passing as argument
the iommu_pasid_table_config struct updated with the new
viommu translation config. Config notifiers are called on
STE changes. At physical level, they translate into
CMD_CFGI_STE_* commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- do not notify anymore on CD change. Anyway the smmuv3 linux
  driver is not sending any CD invalidation commands. If we were
  to propagate CD invalidation commands, we would use the
  CACHE_INVALIDATE VFIO ioctl.
- notify a precise config flags to prepare for addition of new
  flags
---
 hw/arm/smmuv3.c | 61 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d609038724..196835739f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -16,6 +16,8 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "linux/iommu.h"
+
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
@@ -843,6 +845,46 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova)
     }
 }
 
+static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
+{
+    IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
+    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid};
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
+    if (mr->iommu_notify_flags & IOMMU_NOTIFIER_PASID_CFG) {
+        /* force a guest RAM config structure decoding */
+        cfg = smmuv3_get_config(sdev, &event);
+
+        if (cfg) {
+            IOMMUConfig *iommu_config = g_new0(IOMMUConfig, 1);
+
+            iommu_config->pasid_cfg.format = IOMMU_PASID_FORMAT_SMMUV3;
+            iommu_config->pasid_cfg.smmuv3.bypass =
+                cfg->disabled || cfg->bypassed;
+            iommu_config->pasid_cfg.smmuv3.abort = cfg->aborted;
+            iommu_config->pasid_cfg.smmuv3.s1contextptr = cfg->s1ctxptr;
+
+            memory_region_config_notify_iommu(mr, 0, IOMMU_NOTIFIER_PASID_CFG,
+                                              iommu_config);
+            g_free(iommu_config);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s error decoding the configuration for iommu mr=%s\n",
+                         __func__, mr->parent_obj.name);
+        }
+    }
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -893,22 +935,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
@@ -925,14 +959,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
-- 
2.17.1

