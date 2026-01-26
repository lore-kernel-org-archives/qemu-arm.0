Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C926D1950F
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:51:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd7-0001dE-Kz; Mon, 26 Jan 2026 12:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQd6-0001b4-1h
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:44:00 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQd4-0000JK-9h
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:59 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-59dcd9b89ecso5831983e87.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449436; x=1770054236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaQNJ8ctjloGg8ogNJ9hZj1p+S+3oUkMGg8iiDuQ6N8=;
 b=hmajqz3TwxsKbweNRXp2oA4EyJVAzuIzIu1hoENV/CfMjF7ZHNTk56EFMqTzgouXWA
 pq69mXcm1kBD5Y1ojfVEVwHR9YHofVxvHHUoMlVP1Ph23RrqbdnZ5YpiHs3DMyDN/Ej/
 7Qg+IKtoF1bqWAjFtRVJwUbOTJ3cIc62szeHycCZ/ccsOVxcsg6JAikRSPWg6ehF4wMV
 4EEAexqlEX9DW+z5wrgTd8/wX7bJiwBXjvGqApLe3XfLJtj890Pda3oLSopCeh6qRZcF
 qs17CAIfmu+qIwtxWibl7q+SIbKNffoSrnTbB7XIRp6VjnSK9q3Tmq17+ZyG3kSYDDdW
 hRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449436; x=1770054236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zaQNJ8ctjloGg8ogNJ9hZj1p+S+3oUkMGg8iiDuQ6N8=;
 b=KiXOWi/PwwAppXmiWE1ya9JW+l1BOm4Lr4v6PXrZimU8chjD+emwnBsQq705sq1l5h
 qVAOQGraGEnQMpQ5YLuplcRbsScyb1PQf2FBOoDQCT3GknyycMjA5gYjgg51V4Yedu7a
 5OMNKjDkajgIiPia0CYuF2UIJ6IjXaSEc/jpVbITqMh6JDC6dRjjs2YOY1o8IPITHUnt
 G3wj2xYAeJfV/LMGeO49zPKZx5p1qtnUy6S45KoWrj1DW/cAd+hJzxzM8ZvAyMOvFCvR
 XxXpuyh8UimwR4rYStcGW7D4vfnpm+gAwC0sxKmHaLlOJmMm8YSB9Uz/rt/PoQfUoHsr
 gaqg==
X-Gm-Message-State: AOJu0YzpvpsuKciqkp5+9cPdthgaib7E+9vOM2gYbkjMXptnDFSTQtCp
 60jWzotDkFU7eTeiDsyw8de8OXmyC2vH7KTr5kpeKqbwrTxYV8I0HqT+2dJhtHRy
X-Gm-Gg: AZuq6aL1u3G1o00NhyeOQtQ7+Vq5DsbXTboJdFzcn4f3j29dG2HW9PxP3cTFYy0kuTd
 TvYj1HQUBfLxIhK792vDNKNzz69AUm5ZRg8djdhuOOeGOU7suvQu0+Kdchwc4+EiowBquodcNa2
 7zG3fD4smoHd8hissj/7QHF4NkNOySHO8ekxjhjU/7SNbvQuNkrcqXkyfq5ynR63WSEyNwCgQdo
 qCeUeugMmcUezmweI2xms0yblJ/Lf/pxbsgSCklWhXM6tOuatE69lDVJO50MPo2MwxEWU27d62m
 ilCsRQcXSRWqF6jr/3ONA8SeWrscv9JmNBQQdF78Wknr5u2iqdGqt9C/gaBBwgEtesU1zE2vrbg
 bWJnMluqZiJsPooIhx92Pqc9LUBThTFYubEE4711IZhq5iJmTVwjK39tvwsl2UUB+ZqEs7Y7Q3o
 PFmmN535IHeP6dVyE1XpNrtaLZ/4CXsSpmoGNet/ZhL8UHCiiMJXNZLkJCmF1LRcQD
X-Received: by 2002:a05:600c:474e:b0:47d:6c36:a125 with SMTP id
 5b1f17b1804b1-4805ce57334mr79494285e9.17.1769449425260; 
 Mon, 26 Jan 2026 09:43:45 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:44 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 21/27] hw/intc/arm_gic: implement FDT_GENERIC_INTC and fdt
 support
Date: Mon, 26 Jan 2026 18:43:07 +0100
Message-ID: <20260126174313.1418150-22-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

The patch implements TYPE_FDT_GENERIC_INTC interface, which
enables GIC to be instantiated and wired via the device tree
description.

The implemented interface method are following:
1. 'get_irq': Parses device tree interrupt specifiers
and return correct qemu_irq for devices which has IRQ's wired
to GIC.
2. 'auto_parent': Automatically connect the GIC's output signals
to the CPU's found in current machine configuration.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/intc/arm_gic.c        | 32 +++++++++++++++++++++++++
 hw/intc/arm_gic_common.c | 50 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 4d4b79e6f3..2be44d8e5b 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -24,12 +24,15 @@
 #include "gic_internal.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
+#include "hw/core/boards.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
 #include "system/kvm.h"
 #include "system/qtest.h"
 
+#include "hw/core/fdt_generic_util.h"
+
 /* #define DEBUG_GIC */
 
 #ifdef DEBUG_GIC
@@ -2162,12 +2165,41 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
 
 }
 
+static void arm_gic_fdt_auto_parent(FDTGenericIntc *obj, Error **errp)
+{
+    GICState *s = ARM_GIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int num_cpus = current_machine->smp.cpus;
+    CPUState *cs;
+    int i = 0;
+
+    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+        if (i >= s->num_cpu) {
+            break;
+        }
+
+        sysbus_connect_irq(sbd, i,
+                           qdev_get_gpio_in(DEVICE(cs), 0));
+        sysbus_connect_irq(sbd, i + num_cpus,
+                           qdev_get_gpio_in(DEVICE(cs), 1));
+        sysbus_connect_irq(sbd, i + 2 * num_cpus,
+                           qdev_get_gpio_in(DEVICE(cs), 2));
+        sysbus_connect_irq(sbd, i + 3 * num_cpus,
+                           qdev_get_gpio_in(DEVICE(cs), 3));
+        i++;
+    }
+
+    /* FIXME: Add some error checking */
+}
+
 static void arm_gic_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ARMGICClass *agc = ARM_GIC_CLASS(klass);
+    FDTGenericIntcClass *fgic = FDT_GENERIC_INTC_CLASS(klass);
 
     device_class_set_parent_realize(dc, arm_gic_realize, &agc->parent_realize);
+    fgic->auto_parent = arm_gic_fdt_auto_parent;
 }
 
 static const TypeInfo arm_gic_info = {
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 304d89cf56..04787cff79 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -28,6 +28,8 @@
 #include "migration/vmstate.h"
 #include "system/kvm.h"
 
+#include "hw/core/fdt_generic_util.h"
+
 static int gic_pre_save(void *opaque)
 {
     GICState *s = (GICState *)opaque;
@@ -348,6 +350,51 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
     }
 }
 
+static int arm_gic_common_fdt_get_irq(FDTGenericIntc *obj, qemu_irq *irqs,
+                                      uint32_t *cells, int ncells, int max,
+                                      Error **errp)
+{
+    GICState *gs = ARM_GIC_COMMON(obj);
+    int cpu = 0;
+    uint32_t idx;
+
+    if (ncells != 3) {
+        error_setg(errp, "ARM GIC requires 3 interrupt cells, %d cells given",
+                   ncells);
+        return 0;
+    }
+    idx = cells[1];
+
+    switch (cells[0]) {
+    case 0:
+        if (idx >= gs->num_irq) {
+            error_setg(errp, "ARM GIC SPI has maximum index of %" PRId32 ", "
+                       "index %" PRId32 " given", gs->num_irq - 1, idx);
+            return 0;
+        }
+        (*irqs) = qdev_get_gpio_in(DEVICE(obj), cells[1]);
+        return 1;
+    case 1: /* PPI */
+        if (idx >= 16) {
+            error_setg(errp, "ARM GIC PPI has maximum index of 15, "
+                       "index %" PRId32 " given", idx);
+            return 0;
+        }
+        for (cpu = 0; cpu < max && cpu < gs->num_cpu; cpu++) {
+            if (cells[2] & 1 << (cpu + 8)) {
+                *irqs = qdev_get_gpio_in(DEVICE(obj),
+                                         gs->num_irq - 16 + idx + cpu * 32);
+            }
+            irqs++;
+        }
+        return cpu;
+    default:
+        error_setg(errp, "Invalid cell 0 value in interrupt binding: %d",
+                   cells[0]);
+        return 0;
+    }
+}
+
 static const Property arm_gic_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICState, num_cpu, 1),
     DEFINE_PROP_UINT32("first-cpu-index", GICState, first_cpu_index, 0),
@@ -368,12 +415,14 @@ static void arm_gic_common_class_init(ObjectClass *klass, const void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
+    FDTGenericIntcClass *fgic = FDT_GENERIC_INTC_CLASS(klass);
 
     rc->phases.hold = arm_gic_common_reset_hold;
     dc->realize = arm_gic_common_realize;
     device_class_set_props(dc, arm_gic_common_properties);
     dc->vmsd = &vmstate_gic;
     albifc->arm_linux_init = arm_gic_common_linux_init;
+    fgic->get_irq = arm_gic_common_fdt_get_irq;
 }
 
 static const TypeInfo arm_gic_common_type = {
@@ -385,6 +434,7 @@ static const TypeInfo arm_gic_common_type = {
     .abstract = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_ARM_LINUX_BOOT_IF },
+        { TYPE_FDT_GENERIC_INTC },
         { },
     },
 };
-- 
2.43.0


