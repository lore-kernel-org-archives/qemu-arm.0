Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75140C43327
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 22:48:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wf3ig-0001iD-Hn; Wed, 01 Jul 2026 18:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wf3if-0001hG-F1
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 18:47:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wf3id-0002al-Tk
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 18:47:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-472055b0efaso808092f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782946066; x=1783550866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcqzvScZe3os6JOomN8/b5wJyKlFUg/oKjQQfc8KlKY=;
 b=iXC1U7BBf0BlBpgPpz5/aAWIgO+4NtqWbE1AuCY3fuJKh1d7rRoU4b3dGRYYpwGbJ5
 TCdFN7emrUP5Eq/K7QUEwJ0Zqz+5xV/3t/KcApcd+7VE/G1p4DGLbmwkPQkxbR+xGWRx
 ibeI7SNGVuaV1A9iVxvtT2k1z+QZFxcUFJimrLGRC3kqx2f0mqgjsW89reSKU/UhO8b+
 HeqJcJu0D2fTcteZ5dNAP8ZY9OUlBUa7j356otvJhG7vHxwWvQ0iTyAtLi9sm9ahgR1R
 eiqBX3OUzuAbmi+mD4iklKK0BLf4E5RAcrQ1OMBXAbHYks2tEfK2qBBU/PTiMiwK+RIY
 Scmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782946066; x=1783550866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XcqzvScZe3os6JOomN8/b5wJyKlFUg/oKjQQfc8KlKY=;
 b=kMkv/FCv/kqDE5D+xhFWcLgrDBKPqPV5pzw0uZB96b6B2FuwAdpsNYmPr31+wVIfxL
 ZOYIWLxseIWrp5P3F75IuKnyy96fUS2YWD3F6MzBuBj/WBm8rTLIFBfJjBkavxZoYajh
 qsfrfYXJ26HV9M27Z1locahIa8kjIXD3OFD+T/IjYorYEm4wzZTi29WNK+cafC8dFcZQ
 hKsm15d43fnLKqnPf1ZxAxIvyNrPbVpEiqo7LHo6NmyrM/Iw1VNmhX3BNYGwyP14Sfy8
 gdCtEMQFiATiI+mPVvhbsiPgovU5lNfiqwwHrIlVhsgcTqFRquHomhqP27O1pSQ4bf11
 prOQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqkVmsDynhdcSr3YG/MZkXuL6ylxS8dJJqnA4MUNxj+56T3XcASeaAg5tBcZAJeM7CIOc0v8cSFWw==@nongnu.org
X-Gm-Message-State: AOJu0Yzc0BvT2pcc2fh6Hyz0xZdM3zL8K/lwFgHBiZAJwX0XEsAmjsQc
 eAPp5nEiYSZtCTidLfpV4T5+9v+r29P09PQE9CXyWWk3NaG/HSwJ5wQ9
X-Gm-Gg: AfdE7cmTz5EjO60R9BEq+Ge3DotB9frgcBI3uYm290iFdmSNf2XyCodbfLI8Ly1tMPU
 uQLMF7Dasdyg3QZmTzMCGKHCa3ZJqWLFaAd2LubNRsoEa+lsZdB0Z9on+g28joZxUvevMsuZtBU
 IJSZiHDgUE3l7tylCKn9eJPzBCGlsrrprTAxvakgZ5AItmWumkMQpLUPV8pI/jmzxXIh70btIL0
 fQNttA/pkGU67ddOY3XM3FKnPgw+Kczd6B8D35mwW5U5noj7c5TXeusjiFXzHB2Nz/NHUWFp2vf
 t1MZoTkBn8/TRnRyOjwwmOPskeqdUzI5PIRLijJKBHfEH1R25gR7dnQueoukb4pwFl6/reVR+4o
 5nBns0SaAb/DTNd3p7yNUvAXjWAQ3kYD1+FvchhQjMgmahvPjF1ApJlq5itFdnrvp8DyJHbNBNT
 HMwsaJWdn3esNnlsAxfljls0fhVjqdUi6v3umZlA/XnqFmYCHDXSPiUXa39ZMNzCGNd4kjfUtdm
 My5DfupXhWrf5syUFQO0O6xITeCVKCyQaaS
X-Received: by 2002:adf:fa06:0:b0:475:f100:360a with SMTP id
 ffacd0b85a97d-4775a6d1b39mr4051455f8f.57.1782946066279; 
 Wed, 01 Jul 2026 15:47:46 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2d44-b300-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2d44:b300:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dba0esm3178614f8f.7.2026.07.01.15.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 15:47:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 3/4] hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
Date: Thu,  2 Jul 2026 00:46:11 +0200
Message-ID: <20260701224612.48342-4-shentey@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701224612.48342-1-shentey@gmail.com>
References: <20260701224612.48342-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Introduce class FslImx8mpEvkState which will be needed for holding
CanBusState attributes and associated properties.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mp-evk.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index 4a0c9df76b..ca0ee2d3f2 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -19,6 +19,17 @@
 #include "qapi/error.h"
 #include <libfdt.h>
 
+#define TYPE_IMX8MPEVK_MACHINE MACHINE_TYPE_NAME("imx8mp-evk")
+OBJECT_DECLARE_SIMPLE_TYPE(FslImx8mpEvkState, IMX8MPEVK_MACHINE)
+
+struct FslImx8mpEvkState {
+    MachineState parent_obj;
+
+    FslImx8mpState soc;
+
+    struct arm_boot_info boot_info;
+};
+
 static void imx8mp_evk_modify_dtb(const struct arm_boot_info *info, void *fdt)
 {
     int i, offset;
@@ -57,8 +68,7 @@ static void imx8mp_evk_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
 static void imx8mp_evk_init(MachineState *machine)
 {
-    static struct arm_boot_info boot_info;
-    FslImx8mpState *s;
+    FslImx8mpEvkState *s = IMX8MPEVK_MACHINE(machine);
 
     if (machine->ram_size > FSL_IMX8MP_RAM_SIZE_MAX) {
         error_report("RAM size " RAM_ADDR_FMT " above max supported (%08" PRIx64 ")",
@@ -66,7 +76,7 @@ static void imx8mp_evk_init(MachineState *machine)
         exit(1);
     }
 
-    boot_info = (struct arm_boot_info) {
+    s->boot_info = (struct arm_boot_info) {
         .loader_start = FSL_IMX8MP_RAM_START,
         .board_id = -1,
         .ram_size = machine->ram_size,
@@ -74,10 +84,9 @@ static void imx8mp_evk_init(MachineState *machine)
         .modify_dtb = imx8mp_evk_modify_dtb,
     };
 
-    s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
-    object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_FSL_IMX8MP);
+    object_property_set_uint(OBJECT(&s->soc), "fec1-phy-num", 1, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX8MP_RAM_START,
                                 machine->ram);
@@ -93,14 +102,14 @@ static void imx8mp_evk_init(MachineState *machine)
         }
 
         blk = blk_by_legacy_dinfo(di);
-        bus = qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
+        bus = qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
         qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
         qdev_realize_and_unref(carddev, bus, &error_fatal);
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &boot_info);
+        arm_load_kernel(&s->soc.cpu[0], machine, &s->boot_info);
     }
 }
 
@@ -128,9 +137,10 @@ static void imx8mp_evk_machine_class_init(ObjectClass *oc, const void *data)
 
 static const TypeInfo imx8mp_evk_machine_types[] = {
     {
-        .name = MACHINE_TYPE_NAME("imx8mp-evk"),
+        .name = TYPE_IMX8MPEVK_MACHINE,
         .parent = TYPE_MACHINE,
         .class_init = imx8mp_evk_machine_class_init,
+        .instance_size = sizeof(FslImx8mpEvkState),
         .interfaces = aarch64_machine_interfaces,
     },
 };
-- 
2.54.0


