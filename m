Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp991620wrv;
        Thu, 11 Jul 2019 10:45:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzySbqT1vzF8DBJOj4NE4LGww9f/czi09XAwgG+rm7x/WZtwsSHdJoi4ASdE/+q7VMrcYqu
X-Received: by 2002:a17:906:69c4:: with SMTP id g4mr4440956ejs.9.1562867143052;
        Thu, 11 Jul 2019 10:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867143; cv=none;
        d=google.com; s=arc-20160816;
        b=eqq/8QP0fi7sjgdwRZ5zNm2BF4IOIOdJGnJ4V8cNvLHn2JqQHsfgWBh5HEkpnyClvV
         9zVn3uwL6HTB9x2J3AYbF7fDcMnHVpNICzRBQGqBixwkjQ5fv83/gL/MZprP0Y+ABo/6
         Vr+EgvIhZZ734kkHGh9h+Mj+rLIYycq7AtqlwzCXVS6+a3rbkRZbTfE+KnpGrcUektbf
         vHOI3hNswoNkQ6Squ1qmjpqUx2mlbKZDGVIz2dWyfjpVzs4KZyxc3JOxZOms3Z7uwqh0
         ZAUoaAEG3HlTQgUB4Rl/A5wUts3A3g/xm58l2s6+L2RgOV5nn2K/va6Lbb6NfNqeVah1
         oSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9E8M6yHPov+fhct/MS1yUixcEXGPhJlbK/Ch9hcGvT8=;
        b=oYF/phSbLLfKmukXmuQqECNSiQamWfbWqjoEue1C3ihwh3LW+qU9JHkDX0LvES8DBB
         1jsjrC5tMIR377SbuHrKUNiaHENrxmfhjSuu6mCGRMyRted0lxKRsoWUrflYiPt3vgBI
         hpZQ2ZQ0FirPnSMMsyD+d1xWGkQmL8yyvNXNcKvo3ua0jfyiKoB2cNxbjoRYJMSKIjnG
         95WI6nm178e0ZbwXUcTRAveFBRD2nQoAMHlvGLDe+Ua5EQWsb+VUbokHIkkoe6yJJY0c
         TdBM3A6ugCD1QRFI5gMEgNsWfJxw7DVohRtffyRriUKhjaYtcihZBlRiwEpeMivMLnGl
         PhNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si3638617ejx.36.2019.07.11.10.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld8W-00069Z-SB
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5s-0003ft-M5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5q-0006aj-J5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5l-0006U2-Nl; Thu, 11 Jul 2019 13:42:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F042430842A8;
 Thu, 11 Jul 2019 17:42:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE8B60600;
 Thu, 11 Jul 2019 17:42:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:31 +0200
Message-Id: <20190711173933.31203-28-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Jul 2019 17:42:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 27/29] hw/arm/smmuv3: Pass stage 1
 configurations to the host
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4TLGcaJqn2Vn

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
 hw/arm/smmuv3.c     | 77 +++++++++++++++++++++++++++++++++++----------
 hw/arm/trace-events |  1 +
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2a6bf78a8e..4474682a33 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -16,6 +16,10 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
=20
+#ifdef __linux__
+#include "linux/iommu.h"
+#endif
+
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
@@ -847,6 +851,60 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, =
int asid,
     }
 }
=20
+static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
+{
+#ifdef __linux__
+    IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
+    SMMUEventInfo event =3D {.type =3D SMMU_EVT_NONE, .sid =3D sid,
+                           .inval_ste_allowed =3D true};
+    IOMMUConfig iommu_config;
+    SMMUTransCfg *cfg;
+    SMMUDevice *sdev;
+
+    if (!mr) {
+        return;
+    }
+
+    sdev =3D container_of(mr, SMMUDevice, iommu);
+
+    /* flush QEMU config cache */
+    smmuv3_flush_config(sdev);
+
+    if (!pci_device_is_pasid_ops_set(sdev->bus, sdev->devfn)) {
+        return;
+    }
+
+    cfg =3D smmuv3_get_config(sdev, &event);
+
+    if (!cfg) {
+        return;
+    }
+
+    iommu_config.pasid_cfg.version =3D PASID_TABLE_CFG_VERSION_1;
+    iommu_config.pasid_cfg.format =3D IOMMU_PASID_FORMAT_SMMUV3;
+    iommu_config.pasid_cfg.base_ptr =3D cfg->s1ctxptr;
+    iommu_config.pasid_cfg.pasid_bits =3D 0;
+    iommu_config.pasid_cfg.smmuv3.version =3D PASID_TABLE_SMMUV3_CFG_VER=
SION_1;
+
+    if (cfg->disabled || cfg->bypassed) {
+        iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_BYPASS;
+    } else if (cfg->aborted) {
+        iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_ABORT;
+    } else {
+        iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_TRANSLATE;
+    }
+
+    trace_smmuv3_notify_config_change(mr->parent_obj.name,
+                                      iommu_config.pasid_cfg.config,
+                                      iommu_config.pasid_cfg.base_ptr);
+
+    if (pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config=
)) {
+        error_report("Failed to pass PASID table to host for iommu mr %s=
 (%m)",
+                     mr->parent_obj.name);
+    }
+#endif
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs =3D ARM_SMMU(s);
@@ -897,22 +955,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            smmuv3_notify_config_change(bs, sid);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -929,14 +979,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             trace_smmuv3_cmdq_cfgi_ste_range(start, end);
=20
             for (i =3D start; i <=3D end; i++) {
-                IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, i);
-                SMMUDevice *sdev;
-
-                if (!mr) {
-                    continue;
-                }
-                sdev =3D container_of(mr, SMMUDevice, iommu);
-                smmuv3_flush_config(sdev);
+                smmuv3_notify_config_change(bs, i);
             }
             break;
         }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 3809005cba..741e645ae2 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -52,4 +52,5 @@ smmuv3_config_cache_inv(uint32_t sid) "Config cache INV=
 for sid %d"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iom=
mu mr=3D%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iom=
mu mr=3D%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova=
) "iommu mr=3D%s asid=3D%d iova=3D0x%"PRIx64
+smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s=
1ctxptr) "iommu mr=3D%s config=3D%d s1ctxptr=3D0x%"PRIx64
=20
--=20
2.20.1

