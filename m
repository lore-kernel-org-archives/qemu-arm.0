Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C069D6AB10
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 21:58:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q2s-0000ND-4o; Thu, 02 Apr 2026 17:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2b-00009e-Gw
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2Y-0007E0-B6
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:28 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b97e6e48b24so206800166b.2
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167044; x=1775771844; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZPYiFfpkqs7OEfAorj2jjdtW/THFK7eOizNd6vUIEE=;
 b=eAXaA+y1x1p4cfrxlmaz6i95e6k3MJo048D5jJ+roayy68J/NXH7PA2CDk+L8OoGR/
 olcgeDL9uGlP+rkRaj5DTQOmWuZPZ1QF++Qr+TSg0sy8pMkJgj8mpi/2Gq/6GAYvFGJL
 Dqe4lhXuaWGHpfWyQYW6GN7dmk2qKY0Wh+iHA/0Ac1EVP8UQ8TSadoiyhulzVRY/jNf8
 gXtLUBHLjPo0EGLW7l8KLle6umH6BQCnPR82ve6ApanGH6NqndKIzLSZpjuSxgmXrp5T
 BtoEUw093wmarlc4mVdPcuIepcWGnJH6WK0MscxFANnJ25LljoqWQEtvLDGOhn5a8ul5
 Si0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167044; x=1775771844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SZPYiFfpkqs7OEfAorj2jjdtW/THFK7eOizNd6vUIEE=;
 b=Tc9pbaT/irVM2wteBIhh4HmL1yAcBmMlZp0ZcUUNgfufjwSDWymal48GThREglve4F
 XPsYBcHg162RfGlsprv9+PePclD/UgWcyzyT+ZPf5pv46P4OsufYdSfhMkPE0gBBWAeK
 90hjKxuXi7EMzVmDDJ/fkBpQq8p8rV/kYLRQHRsS7J9mNQMMRbsa0ArECgvMQAO7a+bi
 ndZtUbgcUxoenE+uxPg7/Y7nf4IacoE34tu3Rh5LU4zaWVfqeeN48IprtN59BF8VPOwa
 i9J9YbbuE+T51TlpKKcPp+tbRjdBIGNwdDjAQss/ZMQUN8MOx5TNuu6YmI31DGI/nNJI
 CR+w==
X-Gm-Message-State: AOJu0Yxigwlv6AqWDv2LwQXRpj8iSVvtmF3RNopG95yCMBgjQKMmhiI8
 nKNKgkJ99V5i+RvDvYVZRKSeknKebkUU2UGA4ofpwGEZLqf6O6hmqsJB
X-Gm-Gg: ATEYQzzsv46QdIhJWf0/0oBG8e04kGNaarwFAj+rVa8gsrngegt+aRNP9ANMOrXRV7U
 0fnCwSq0mPB8/bPKxAhEA7Y6prVP/eMwTvalqLWeAnWkb2veMd3WZqShd0XTP10tS8WTwuWS7Je
 NT96yIlmXLxI17yJQV8GzeQu9dfvlFo3ancZmbHQ+LiAtAKbmT1a4T6/O8/zYzlHoQreYudSbAG
 ytS+wXU31WGW9asLle+XPk0tDWYqGUppDjkAEwLzMc0IWL680JXwtK3fDTxUHrwYWX4iT93LVY5
 lTrh/0UdvRtBryxYL0T3GWs7WjZamiZ8qm48CORW/AcDkSyEOGPm/LnMxj72MciPlH/K/6ZSRHC
 GVDVelN9WxprqB269dQvo+eu0lHg9IgYAqyEDvBXWO4XwWTeQ33suD8AelMeeCapUm8sp3kdvQT
 HAhmrjUkCvfcrfanFfOwYDEPvFF4uS78xkE6ggHifQBGySATBvrzRb0YOa2RcTID0SaQwzAQ==
X-Received: by 2002:a17:907:5c9:b0:b98:3bb8:c10f with SMTP id
 a640c23a62f3a-b9c67423283mr24107866b.5.1775167044460; 
 Thu, 02 Apr 2026 14:57:24 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:24 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 24/33] target/arm/cpu: add fdt support for armv8-timer
Date: Thu,  2 Apr 2026 23:56:09 +0200
Message-ID: <20260402215629.745866-25-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x630.google.com
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

Implement FDT compatibility, so that timer can initilize
and wire irqs based on device tree information.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 target/arm/cpu.c | 112 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ccc47c8a9a..35e38f9970 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -54,6 +54,8 @@
 #include "target/arm/gtimer.h"
 
 #include "trace.h"
+#include "hw/core/fdt_generic_util.h"
+
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -2447,3 +2449,113 @@ static void arm_cpu_register_types(void)
 }
 
 type_init(arm_cpu_register_types)
+
+#ifndef CONFIG_USER_ONLY
+
+static Object *fdt_armv8_timer_get_intc(FDTMachineInfo *fdti, char *node_path)
+{
+    char intc_node_path[DT_PATH_LENGTH];
+    uint32_t intc_phandle;
+    Error *errp = NULL;
+    DeviceState *intc;
+
+    intc_phandle = qemu_fdt_getprop_cell_inherited(fdti->fdt, node_path,
+                                         "interrupt-parent",
+                                         0, &errp);
+
+    /* There must be an interrupt-parent */
+    if (errp ||
+        qemu_devtree_get_node_by_phandle(fdti->fdt,
+                                         intc_node_path, intc_phandle)) {
+        g_assert_not_reached();
+    }
+
+    while (!fdt_init_has_opaque(fdti, intc_node_path)) {
+        fdt_init_yield(fdti);
+    }
+
+    intc = DEVICE(fdt_init_get_opaque(fdti, intc_node_path));
+
+    while (!intc->realized) {
+        fdt_init_yield(fdti);
+    }
+
+    return OBJECT(intc);
+}
+
+static int armv8_timer_fdt_init(char *node_path, FDTMachineInfo *fdti,
+                                void *priv)
+{
+    Object *intc = fdt_armv8_timer_get_intc(fdti, node_path);
+    CPUState *cpu;
+    qemu_irq *sec_irqs = NULL;
+    qemu_irq *ns_irqs;
+    qemu_irq *v_irqs;
+    qemu_irq *h_irqs;
+    uint32_t first_cpu_idx;
+    uint32_t num_cpu;
+    bool has_sec_ext;
+    Error *err = NULL;
+
+    first_cpu_idx = object_property_get_uint(intc, "first-cpu-idx", &err);
+    if (!err) {
+        num_cpu = object_property_get_uint(intc, "num-cpu", &err);
+        assert(!err);
+        has_sec_ext = object_property_get_bool(intc, "has-security-extensions",
+                                               &err);
+        assert(!err);
+    } else {
+        /*
+         * Connect all CPUs with the ARM_FEATURE_GENERIC_TIMER set for
+         * backwards compatibility when the 'first-cpu-idx' property does not
+         * exist.
+         */
+        num_cpu = 0;
+        has_sec_ext = true;
+    }
+
+    if (has_sec_ext) {
+        sec_irqs = fdt_get_irq(fdti, node_path, 0);
+        ns_irqs = fdt_get_irq(fdti, node_path, 1);
+        v_irqs = fdt_get_irq(fdti, node_path, 2);
+        h_irqs = fdt_get_irq(fdti, node_path, 3);
+    } else {
+        ns_irqs = fdt_get_irq(fdti, node_path, 0);
+        v_irqs = fdt_get_irq(fdti, node_path, 1);
+        h_irqs = fdt_get_irq(fdti, node_path, 2);
+    }
+
+    for (cpu = first_cpu; cpu; cpu = CPU_NEXT(cpu)) {
+        ARMCPU *acpu = ARM_CPU(cpu);
+        bool is_gic_cpu;
+
+        if (!arm_feature(&acpu->env, ARM_FEATURE_GENERIC_TIMER)) {
+            continue;
+        }
+
+        is_gic_cpu = cpu->cpu_index >= first_cpu_idx &&
+                     cpu->cpu_index < (first_cpu_idx + num_cpu);
+
+        if (!num_cpu || is_gic_cpu) {
+
+            assert(*ns_irqs);
+            assert(*v_irqs);
+            assert(*h_irqs);
+            qdev_connect_gpio_out(DEVICE(acpu), 0, *ns_irqs++);
+            qdev_connect_gpio_out(DEVICE(acpu), 1, *v_irqs++);
+            qdev_connect_gpio_out(DEVICE(acpu), 2, *h_irqs++);
+
+            if (has_sec_ext) {
+                assert(*sec_irqs);
+                qdev_connect_gpio_out(DEVICE(acpu), 3, *sec_irqs++);
+            }
+        }
+    }
+
+    return 0;
+}
+
+fdt_register_compatibility(armv8_timer_fdt_init,
+                           "compatible:arm,armv8-timer");
+
+#endif
-- 
2.43.0


