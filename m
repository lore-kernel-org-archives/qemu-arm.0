Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3692140wrx;
        Tue, 16 Apr 2019 02:14:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzws4cRgf/ExUv+6nP1rfypZdH2VzWGhC1nCinzu8n3lYBieHexR6/yZ6jl1iScSKfmZpXE
X-Received: by 2002:a1c:f312:: with SMTP id q18mr24520421wmq.96.1555406072399;
        Tue, 16 Apr 2019 02:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555406072; cv=none;
        d=google.com; s=arc-20160816;
        b=jqsqcZrbaaIITISOUYWR/sAK6rZ4I7EjX/hOMRG5O8EjiiNMl1pBHtIZvqPLNxdv0P
         uMVqkzLfng8N1vnk7wyk4y801wgvdwq7YiMF+LT7eH2ZpXeQbUlZtR9iZYyJ7DBWD15C
         p5jwzxAoo77PhxihWr8QoBhdAskWZgQtOp9h/CkYw+oP34TYaBwT+N2sr+GSyHojnSp6
         UsrQSdVYYqziF15p2QC1u8hek34xJV/+OnYZQXKadsSRbpTMctdXf1irkDN4alCZeDNx
         9pozks8LP4TBNiz2FDExPFbHKalz18gBaUDw/yt1hkYR92Of6bFIvCnC4qXSwoinSETm
         NNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=mAA1chyks3kJSsDavtH+7fVL+cIQqJZfZ+KT54EFuEk=;
        b=kRUF/4H0lrVQpxnmHTfMHTR+ubwX08SK7NlBuR5HeVehUUd4ofH3Mq5YWpdZGa6oRj
         sxJDyH9HnzUAvfoEQxMgLTazw+ZCl70hk9+L/On3oKll0jF3L7oqbriuwTWR+0hi8SwN
         5mP+BES8T9vtHkL2dz2GJcTJqUfX1qgsAVN0jxA56KpNf05j9Jif6oH4t/L4ry5bAqP4
         ybZM3rqtJ0jO6tcOmJhBo5aTMLF1r/8q1MPCUFKL3y2QqFpeMgddXR8uy/IIkWVvbgFT
         CU0ZqG8kFMI27aw8L6A6YTIqfmf6mlxTPL5LEqHYIdbs5kO29GYI0K7iiaJHo/LA0r6b
         42HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si34226097wrn.223.2019.04.16.02.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 02:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGKAh-0004kU-Cr
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 05:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA7-0004OU-W3
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA6-0004Th-W3
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGKA6-0004T9-MA; Tue, 16 Apr 2019 05:13:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D47F380F79;
	Tue, 16 Apr 2019 09:13:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 922745D9CA;
	Tue, 16 Apr 2019 09:13:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1B4511132BD3; Tue, 16 Apr 2019 11:13:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 11:13:47 +0200
Message-Id: <20190416091348.26075-3-armbru@redhat.com>
In-Reply-To: <20190416091348.26075-1-armbru@redhat.com>
References: <20190416091348.26075-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 16 Apr 2019 09:13:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/3] pflash_cfi01: New
 pflash_cfi01_legacy_drive()
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
	philmd@redhat.com, mreitz@redhat.com, qemu-arm@nongnu.org,
	lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LnSjdLIbGs4Q

Factored out of pc_system_firmware_init() so the next commit can reuse
it in hw/arm/virt.c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/block/pflash_cfi01.c  | 28 ++++++++++++++++++++++++++++
 hw/i386/pc_sysfw.c       | 16 ++--------------
 include/hw/block/flash.h |  1 +
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 16dfae14b8..333b736277 100644
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
 
@@ -968,6 +971,31 @@ MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
     return &fl->mem;
 }
 
+/*
+ * Handle -drive if=pflash for machines that use properties.
+ * If @dinfo is null, do nothing.
+ * Else if @fl's property "drive" is already set, fatal error.
+ * Else set it to the BlockBackend with @dinfo.
+ */
+void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
+{
+    Location loc;
+
+    if (!dinfo) {
+        return;
+    }
+
+    loc_push_none(&loc);
+    qemu_opts_loc_restore(dinfo->opts);
+    if (fl->blk) {
+        error_report("clashes with -machine");
+        exit(1);
+    }
+    qdev_prop_set_drive(DEVICE(fl), "drive",
+                        blk_by_legacy_dinfo(dinfo), &error_fatal);
+    loc_pop(&loc);
+}
+
 static void postload_update_cb(void *opaque, int running, RunState state)
 {
     PFlashCFI01 *pfl = opaque;
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 75925f5d3f..751fcafa12 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -269,9 +269,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
 {
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     int i;
-    DriveInfo *pflash_drv;
     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
-    Location loc;
 
     if (!pcmc->pci_enabled) {
         old_pc_system_rom_init(rom_memory, true);
@@ -280,18 +278,8 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_drv = drive_get(IF_PFLASH, 0, i);
-        if (pflash_drv) {
-            loc_push_none(&loc);
-            qemu_opts_loc_restore(pflash_drv->opts);
-            if (pflash_cfi01_get_blk(pcms->flash[i])) {
-                error_report("clashes with -machine");
-                exit(1);
-            }
-            qdev_prop_set_drive(DEVICE(pcms->flash[i]), "drive",
-                                blk_by_legacy_dinfo(pflash_drv), &error_fatal);
-            loc_pop(&loc);
-        }
+        pflash_cfi01_legacy_drive(pcms->flash[i],
+                                  drive_get(IF_PFLASH, 0, i));
         pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
     }
 
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index a0f488732a..1acaf7de80 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -24,6 +24,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(PFlashCFI01 *fl);
 MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
+void pflash_cfi01_legacy_drive(PFlashCFI01 *dev, DriveInfo *dinfo);
 
 /* pflash_cfi02.c */
 
-- 
2.17.2

