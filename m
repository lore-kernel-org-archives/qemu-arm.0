Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7213153wrx;
        Thu, 11 Apr 2019 06:56:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJ1y95tLzxlzdIWDM3Lqk76ZpBETLTlD1sTmywD2uJuIIud9ryY60b7/NQIFG/yzFgALFH
X-Received: by 2002:a1c:b189:: with SMTP id a131mr6582007wmf.107.1554990978143;
        Thu, 11 Apr 2019 06:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554990978; cv=none;
        d=google.com; s=arc-20160816;
        b=iBoFPtJZnXZITF82OszVZJLbG/OGk994xBlAlY8An5tkH5UFcStgFkTeSDFBHt6OBY
         Qzo+ATMJsH4zayCs7iAPyBBor6aIjBHXBt5pNF3h+LA8L/po9ecwpg+F3V/4F9eRhpEF
         Bx5ya68ziCxZ/U5PDQML2Lo8apdV1iRNGwiCp5NnEJnsUfwIKEhg/hdw4WBBU3fH74ba
         K5sF+OtXASSf9ZcuG6r0D3CMDhzelNQwMjDv7IEl0BE2ADJdi3ZvAXsKj19hiphUBWvR
         9V7qWQ5B2QDGnDFCGtGt+3PiZ7ftB4uN4xPKGDTMfrf0hmMcUU/8Qjzqr44KPtrH4Opi
         lC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=i8AL1FO1VMztc5Fth9yWWlptgw9pTABvh5e9l2Xwh/w=;
        b=052BCj3iVXAd7W6ZnjJPbdYuH6C1LLDVktbEnww9U9d69PDRP+K91fygJ7HUkKZfpp
         8hSA9gYHbp4b9mPOtR1Np27s1aX8QOgq/meO4CtSJRkEb3Bul0Di6b2fk5+lT5kg9Chr
         PHSbE//2zTZ8Z7Lm/eJ8goZPE+uqoujY09Oy1u5W34gyBFrBrAk9D8ub6zstFAN0OJY6
         G9xQclAvCFeYrMsr67+YrzATjZI78wV1UNl/JJ3Beo2uhU/XD226UOzeEFmEcVUAKFSu
         8OflK5Atuh3Np5OpIs1AAs2xSjZT5wgAhA7rOvV7xPGxDH7Uonj03qDFG1mdJdkGSXuk
         Kafg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si24209437wro.416.2019.04.11.06.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 06:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEaBd-0001Ab-65
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 09:56:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEaBT-0001AQ-DX
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 09:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEaBS-0005gf-9E
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 09:56:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hEaBR-0005fa-S8; Thu, 11 Apr 2019 09:56:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 577053084294;
	Thu, 11 Apr 2019 13:56:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B25C018A51;
	Thu, 11 Apr 2019 13:56:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 46FDD1132BB6; Thu, 11 Apr 2019 15:56:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Apr 2019 15:56:01 +0200
Message-Id: <20190411135602.21725-2-armbru@redhat.com>
In-Reply-To: <20190411135602.21725-1-armbru@redhat.com>
References: <20190411135602.21725-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 11 Apr 2019 13:56:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] pflash_cfi01: New pflash_cfi01_legacy_drive()
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	mreitz@redhat.com, qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qv8chf6Asq1P

Factored out of pc_system_firmware_init() so the next commit can reuse
it in hw/arm/virt.c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/block/pflash_cfi01.c  | 30 ++++++++++++++++++++++++++++++
 hw/i386/pc_sysfw.c       | 19 ++-----------------
 include/hw/block/flash.h |  1 +
 3 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 16dfae14b8..eba01b1447 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -44,9 +44,12 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
+#include "qemu/error-report.h"
 #include "qemu/host-utils.h"
 #include "qemu/log.h"
+#include "qemu/option.h"
 #include "hw/sysbus.h"
+#include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 
@@ -968,6 +971,33 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
     return &fl->mem;
 }
 
+/*
+ * Handle -drive if=pflash for machines that use machine properties.
+ * Map unit#i (0 < i <= @ndev) to @dev[i]'s property "drive".
+ */
+void pflash_cfi01_legacy_drive(PFlashCFI01 *dev[], int ndev)
+{
+    int i;
+    DriveInfo *dinfo;
+    Location loc;
+
+    for (i = 0; i < ndev; i++) {
+        dinfo = drive_get(IF_PFLASH, 0, i);
+        if (!dinfo) {
+            continue;
+        }
+        loc_push_none(&loc);
+        qemu_opts_loc_restore(dinfo->opts);
+        if (dev[i]->blk) {
+            error_report("clashes with -machine");
+            exit(1);
+        }
+        qdev_prop_set_drive(DEVICE(dev[i]), "drive",
+                            blk_by_legacy_dinfo(dinfo), &error_fatal);
+        loc_pop(&loc);
+    }
+}
+
 static void postload_update_cb(void *opaque, int running, RunState state)
 {
     PFlashCFI01 *pfl = opaque;
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c628540774..d58e47184c 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -269,32 +269,17 @@ void pc_system_firmware_init(PCMachineState *pcms,
 {
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     int i;
-    DriveInfo *pflash_drv;
     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
-    Location loc;
 
     if (!pcmc->pci_enabled) {
         old_pc_system_rom_init(rom_memory, true);
         return;
     }
 
-    /* Map legacy -drive if=pflash to machine properties */
+    pflash_cfi01_legacy_drive(pcms->flash, ARRAY_SIZE(pcms->flash));
+
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
-        pflash_drv = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_drv) {
-            continue;
-        }
-        loc_push_none(&loc);
-        qemu_opts_loc_restore(pflash_drv->opts);
-        if (pflash_blk[i]) {
-            error_report("clashes with -machine");
-            exit(1);
-        }
-        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);
-        qdev_prop_set_drive(DEVICE(pcms->flash[i]),
-                            "drive", pflash_blk[i], &error_fatal);
-        loc_pop(&loc);
     }
 
     /* Reject gaps */
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index a0f488732a..f6a68c2a4c 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -24,6 +24,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
 MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
+void pflash_cfi01_legacy_drive(PFlashCFI01 *dev[], int ndev);
 
 /* pflash_cfi02.c */
 
-- 
2.17.2

