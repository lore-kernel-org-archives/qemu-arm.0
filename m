Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp622013wrd;
        Sat, 1 Sep 2018 07:29:07 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbkcneRyTIuG94AXqNJE+YSy5X79ClDa1lrW7ZMNdxl9/+KpgUPrE1lo+G/SB/oYjW2LwZi
X-Received: by 2002:ac8:2278:: with SMTP id p53-v6mr19155818qtp.200.1535812147107;
        Sat, 01 Sep 2018 07:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812147; cv=none;
        d=google.com; s=arc-20160816;
        b=KLC1Yw1kVPYjc23yLpyT0F9nMXMOPGOFwBgE9a052nFn0AKN6ElKuPl0FpT9Cjs3bS
         sdFU5LEFt0X0wtI4TnO8vSx4s+CX0TQOA9xvCkjMWsijNgk9mRL9xzSOlTSYXQynsYyI
         n600k1cajcMOraPl8hXh8yAW8b3bFAp1/iXz43p4gvoVsNUMRgtDfk2/0KUsTM4+c02g
         1aJjFIZfHr6bpIC3YrPcCWyTZ6G5rn7tUcJlfdsRAbBv6c9a66bkLpLq4F8VUtYj10qQ
         lxdW5YWkHbotf6l+TJEqT4w+4xJ36dbuIcMuwVMUZAZJreM+0JeCLG6Hs57XMt+OY1Jy
         +Dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hfjbp9ETVKCd5w/PyY0s0ER7Vsp+yL0WKP2klg+K9mU=;
        b=GwxOEnBvvoW9AQjRcqvt6qLUMpK4Lx0bj2CUWeyauwOvZCFqRJBg+in4KnMERC7lqV
         CFh4R5dJAa4GjvH4cOcaITc3/0z4GELrUsXkW/uutI46608/XfcjZ+z67luJGvx2AOsu
         wSygxTpLk4ZxZq6JkGDLN9ECWMVIbfkkMLOtgx14J8SddgCQJJiZd1DSGlti6nbETCvU
         A+rzveffD3glBXpzv1Reb3YH69bBOtrx7ibR2CgledrET33LoMt6By/CSeOhfeEhIzAh
         D32H0c0Q61kpWdclmEVsxsBek21o0Hz1D8/nDk7PXindgY2A/LiH5PXc8T8CQSdxAdfB
         WPBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m45-v6si919574qvm.228.2018.09.01.07.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6te-0000wr-IJ
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:29:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qM-0006BB-Es
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6or-0005nK-4D
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:24:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42842 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oq-0005mx-V9; Sat, 01 Sep 2018 10:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8627E4021715;
	Sat,  1 Sep 2018 14:24:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC2102166B41;
	Sat,  1 Sep 2018 14:24:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:05 +0200
Message-Id: <20180901142312.11662-14-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Sat, 01 Sep 2018 14:24:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Sat, 01 Sep 2018 14:24:08 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 13/20] hw/arm/smmuv3: Notify on config changes
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8yOXIez8FFB7

In case IOMMU config notifiers are attached to the
IOMMU memory region, we execute them, passing as argument
the iommu_guest_stage_config struct updated with the new
viommu translation config. Config notifiers are called on
STE and CD changes. At physical level, they translate into
CMD_CFGI_STE_* and CMD_CFGI_CD_* commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 71 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ff92f802bd..a31df03d47 100644
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
@@ -843,6 +845,47 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova)
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
+    if (mr->iommu_notify_flags & IOMMU_NOTIFIER_S1_CFG) {
+        /* force a guest RAM config structure decoding */
+        cfg = smmuv3_get_config(sdev, &event);
+
+        if (cfg) {
+            struct iommu_guest_stage_config *kcfg =
+                 g_new0(struct iommu_guest_stage_config, 1);
+
+            kcfg->flags = SMMUV3_S1_CFG;
+            kcfg->smmu_s1.flags = cfg->disabled ? IOMMU_SMMU_S1_DISABLED : 0 |
+                                  cfg->bypassed ? IOMMU_SMMU_S1_BYPASSED : 0 |
+                                  cfg->aborted  ? IOMMU_SMMU_S1_ABORTED : 0;
+            kcfg->smmu_s1.cdptr_dma = cfg->s1ctxptr;
+            kcfg->smmu_s1.asid_bits = 16;
+
+            memory_region_config_notify_iommu(mr, 0, kcfg);
+            g_free(kcfg);
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
@@ -893,22 +936,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
@@ -925,14 +960,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
@@ -940,21 +968,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_CD_ALL:
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
             trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            smmuv3_notify_config_change(bs, sid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
-- 
2.17.1

