Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp376185wrx;
        Fri, 12 Apr 2019 03:20:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNLsPvGhu8jdttFmf95oiLpJpe3+BrvOBE2imoFEg7rKiKSv+zw8sTazP1FCR5WRTLAzW/
X-Received: by 2002:a1c:1903:: with SMTP id 3mr4896268wmz.103.1555064429576;
        Fri, 12 Apr 2019 03:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555064429; cv=none;
        d=google.com; s=arc-20160816;
        b=Quib16TxvqV+iYtPQINxQsGm9Gh1KqqzjhgpIIG/Q6yKH44BUe/FPMY3bimXIYl6Jw
         X8rdKufJMQL8Mubf9nq7ql/6erFVZGLVYZ77QueFl1dTUbwH6xad3rfXB0/2En22ZWoD
         Gv3ZUzhcOMMi4W2V85W+qwmEToeIZ0TsU/USOWyl9mrnDnrWnqjXJlzhqDNEX9Zllmkr
         sNYirCFaM3oGbbm5RtlAYknz1rZ4nHhwSs1jI4DCia1xf3o2zYiSUM5cSx4908W+P3va
         GSPMWzJtdnrUiRiqnGsD2c3N6QSV6gH0Y0LkNOomXEqFNCDqRGJO2mYWL/YwQLyJIna3
         V8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sNIYqmv4HFFf4wmyb49QRQrVMw4+Om4Rf/MDuEX7LuY=;
        b=WWD/a7nhEDgDCP3T7YCbVSnR9whoTAmvMzmDXxNsX6EGeWlyQZ31cmb4XczWWq3TL+
         k0P3ALvAKXrByyJx+M71doIyRdJjJhUClUqMw7b1B8iOxK0b+qH5ebqMC2TUXc//+pQL
         XLAx3nYLun9aW3nifMrcR1DqJGIDVvt3Pl2wEsFtgolhV5A1ZwF12fBfMFvBCl5EVQlV
         mux6zNQH6lKwWqRnUwxhCx4H8Tw1eWoShi1Arx10cf78AWsUOwX+iy1CJ9vmlxFtThpf
         DQgD4+YRSpEb2ovaCaWk057Xgeoz/YySwJ7jpsnzGTNvfL5WVUlnfow0h8fLGlra48tb
         tGvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si5002456wmd.39.2019.04.12.03.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtIK-0006c8-Hr
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:20:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt4A-000223-Sf
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt49-0004bc-9q
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:05:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt45-0004ZU-4F; Fri, 12 Apr 2019 06:05:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 620D381E1B;
	Fri, 12 Apr 2019 10:05:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C637419C65;
	Fri, 12 Apr 2019 10:05:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:43 +0200
Message-Id: <20190412100354.6409-17-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 12 Apr 2019 10:05:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 16/27] hw/arm/smmuv3: Notify on config changes
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pi1ZxumulVEN

In case IOMMU config notifiers are attached to the
IOMMU memory region, we execute them, passing as argument
the iommu_pasid_table_config struct updated with the new
viommu translation config. Config notifiers are called on
STE changes. At physical level, they translate into
CMD_CFGI_STE_* commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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
 hw/arm/smmuv3.c     | 72 ++++++++++++++++++++++++++++++++++-----------
 hw/arm/trace-events |  1 +
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f2f3724686..2574989f2e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -16,6 +16,8 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
=20
+#include "linux/iommu.h"
+
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
@@ -847,6 +849,57 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, =
int asid,
     }
 }
=20
+static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
+{
+    IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
+    SMMUEventInfo event =3D {.type =3D SMMU_EVT_NONE, .sid =3D sid};
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
+    if (mr->iommu_notify_flags & IOMMU_NOTIFIER_CONFIG_PASID) {
+        /* force a guest RAM config structure decoding */
+        cfg =3D smmuv3_get_config(sdev, &event);
+
+        if (cfg) {
+            IOMMUConfig iommu_config =3D {
+                .pasid_cfg.version =3D PASID_TABLE_CFG_VERSION_1,
+                .pasid_cfg.format =3D IOMMU_PASID_FORMAT_SMMUV3,
+                .pasid_cfg.base_ptr =3D cfg->s1ctxptr,
+                .pasid_cfg.smmuv3.version =3D PASID_TABLE_SMMUV3_CFG_VER=
SION_1,
+            };
+
+            if (cfg->disabled || cfg->bypassed) {
+                iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_BYP=
ASS;
+            } else if (cfg->aborted) {
+                iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_ABO=
RT;
+            } else {
+                iommu_config.pasid_cfg.config =3D IOMMU_PASID_CONFIG_TRA=
NSLATE;
+            }
+
+            trace_smmuv3_notify_config_change(mr->parent_obj.name,
+                                              iommu_config.pasid_cfg.con=
fig,
+                                              iommu_config.pasid_cfg.bas=
e_ptr);
+
+            memory_region_config_notify_iommu(mr, 0,
+                                              IOMMU_NOTIFIER_CONFIG_PASI=
D,
+                                              &iommu_config);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s error decoding the configuration for iommu=
 mr=3D%s\n",
+                         __func__, mr->parent_obj.name);
+        }
+    }
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs =3D ARM_SMMU(s);
@@ -897,22 +950,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
@@ -929,14 +974,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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

