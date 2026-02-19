Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EFBE9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:51:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5MG-0003yt-DV; Thu, 19 Feb 2026 09:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Lr-0003lD-Hs
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Ll-00083s-Ks
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:49:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1064989f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771512586; x=1772117386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fV6i9rtDXdnI27689aLd0ED9E25Vhh0hdUPcZBXgSBs=;
 b=WYi/cIpVTq8HdDsuurAGPhTmkkSKwbAGOC0852WNgoIaEsyfuQnaJTzczLAu2WRPLm
 KVsFGkTfGv2RdJ3ppK3XZLhyhOKzu9QoREUCiTJiuMZiPGt7ybnXGY/nkaboFnQRryjq
 nHXY2UJfZ4fPAqf1PofAE39SIo+BMTg/IaSqpN0VucpHu6Ab/+KWlDp0KmFMtUXdAABA
 SeOmVMmXZyjhYncfGqimenU0hcBsfz2f8YcwP0fzI1E+U6FHmr5TqDSJtDoxes1SsPDG
 igHS+5KJOJttSeS1EHT3jaoQKuywCnM5aP4LttZvAo0aw9Sq4FOkBnhLWvQYTI3RVjR4
 tTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512586; x=1772117386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fV6i9rtDXdnI27689aLd0ED9E25Vhh0hdUPcZBXgSBs=;
 b=JrsHV13ruI9GOzDy9dBgZQ7uyrVk7gYcNLYtgKUmvJgsjdkjMsGtN3QajFYmFyyQfK
 HDDQ8MH5fcS4HtsDwNhmUYF+YY+MPbKEH9sDyYZzGMYrJnOl+NIy9kH9vhi6EbeHiEt+
 +4hXa7YhomqaVChbjGPO2trHSCgC2DEiXIU+ZbNKmlowj8+0YCvVPJHy/ZyWzhwsDEYO
 RuumT+k+1DTK+hjwngfBwBKABNgk7V4TcWXKAm2rJns51j6Bqh6gIH0QVehxbh13fm4y
 z1Q0jpPjXpfh+io5wEiGlzizXQKCtj/m+DaV0mNwtQmBB0qvrnBNhaPc8wg3o33ZIkI6
 Ag+A==
X-Gm-Message-State: AOJu0YyP5WT7Wm3Dp/TJYbNLrkqh3URhbOySLHtxGRdHAvlcq+3KB8GE
 W3hjlWj2+UDtDYWemxYqcbohJxHAnWFrccH8lwMXe1FalF4eZEO1mt5o
X-Gm-Gg: AZuq6aKw6JdLWcFiBsf4MCF/fXwYV1rj3py1kpgAS04r2uoIEk/NZpfTc9DqKG/BWeL
 J13M5yvK8Qn++XA/MjtkUwF8FuEVEhWINb79rxVvQwoFMva1urCKLLzA75sFmQE56yhQ2YI0Cut
 Us+vQ89pTD7oUQjmqYTk01rsqX/N9BR+ZPj+cIQxk2+ts2MEwNBVy6j5kT/BsOQMQ8zkFVgu0EU
 fHGOq57LHkAwoirZ8TMprGIQ2kcziDCTBVijMgHqMtFrd+6laYO/17njce52SNFcyvh6c5Wln56
 rxKAcQ2kloK4pyzFFBqIXLyFRyYfYOyZmkFSG6il55mszYF+dZJrmFtIrD8znKDHg0bOo3CJPxt
 VlvERnt4SDsL52dVYcxIr6dZE4eUlXpL3rkIW3IMo5NKSYhuTTBx1OZ9u4WiBL9hBHw1nX7Z6Rj
 lJHDm2z6z6SHfL11FwrnzMEC1PeJyEzlErfLsuBP/06Beec6aBgl1SpYBaiQ4/q/sZ33GV
X-Received: by 2002:a05:6000:18a6:b0:436:3267:3edd with SMTP id
 ffacd0b85a97d-437978d54e7mr36071459f8f.22.1771512585416; 
 Thu, 19 Feb 2026 06:49:45 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50163087f8f.31.2026.02.19.06.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:49:44 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 23/33] target/arm/cpu: add fdt support for armv8-timer
Date: Thu, 19 Feb 2026 15:48:51 +0100
Message-ID: <20260219144901.3317747-5-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219144901.3317747-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x431.google.com
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
 target/arm/cpu.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7542444b18..6e68aa457e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -54,6 +54,8 @@
 #include "target/arm/gtimer.h"
 
 #include "trace.h"
+#include "hw/core/fdt_generic_util.h"
+
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -2455,3 +2457,116 @@ static void arm_cpu_register_types(void)
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
+    bool map_mode = false;
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
+        sec_irqs = fdt_get_irq(fdti, node_path, 0, &map_mode);
+        ns_irqs = fdt_get_irq(fdti, node_path, 1, &map_mode);
+        v_irqs = fdt_get_irq(fdti, node_path, 2, &map_mode);
+        h_irqs = fdt_get_irq(fdti, node_path, 3, &map_mode);
+    } else {
+        ns_irqs = fdt_get_irq(fdti, node_path, 0, &map_mode);
+        v_irqs = fdt_get_irq(fdti, node_path, 1, &map_mode);
+        h_irqs = fdt_get_irq(fdti, node_path, 2, &map_mode);
+    }
+
+    assert(!map_mode); /* not supported for PPI */
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


