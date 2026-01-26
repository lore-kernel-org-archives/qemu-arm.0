Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9904FD1950F
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:48:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQdA-0001gZ-SP; Mon, 26 Jan 2026 12:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcv-0001Sp-MG
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQct-0000Ar-UO
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so70306275e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449426; x=1770054226; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HThoZ4BzoXW1z+LSYKEUiv5+qqmWVhCSi3lu7EloCo=;
 b=ciG/geELFPSVC+YhrtsHNCbdcFw4XKBqBd1hGHw67vYpo7RbbubdB+GdOU0FKTP0RL
 8c0bnApAq+65K9iv+pVW6PY3xvikk5RJQeGl/T8tqxkygzQrSgufFgfxrg8qiOw9k9tK
 G5wqUK1TSy5v1kM673oeEPq5fvewCL7YlnB1VZGxLhp6Fi1+ro1Xio0sMEilYoeTFe2g
 egV0Kt5cvMyGSGjTTl01yYUjuzRT0HTskAyeNNgXKSF9ogVGT353DcGLiNmMYpT69qlK
 jbCt9dAR/O5ljNR+i1QayEPzXvF+5QpLdkBc4d2bSDBASbY/9d0gMkgvftUvIJQmkG0x
 UhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449426; x=1770054226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0HThoZ4BzoXW1z+LSYKEUiv5+qqmWVhCSi3lu7EloCo=;
 b=qVNdiJKgkudS9Q/S91XiTvJ2D1V0r5ehbkYJZxuTlMASkWr1lD+A9u+EO2WMaCjWY9
 38bijJGZaqaA5O4nRPX4++SB4A6QmX5gu2o680Hdd8LZpV2S033jb+pBqjHrhL9HfypX
 Qc3qTKgJl3ympsuQ5XB8lOG53UgW5qZzZVL5z+/iHnGiOgoEzIeEh4Ly0ttEKQ88Da28
 SATU6e2cOxDMxeOfA/S+mt0kt2sx8wMqMjaq846Rl4r8KnPKXw1tAp4NDCtDMM7d7LiU
 dEw5jMzVP3ma12vFgDrcJjayUBmGmpjczAhsB/TLTB9N6IP5h7EB9IEIldzuIcEPGzbi
 mZjA==
X-Gm-Message-State: AOJu0Yy/fhlwUtoyXrGZuXJInQU01QRJeMi0nYbmE2iqGQqhtSzn/Dra
 tlwUesdBVT3fWaNLb5m2rKQ8Mi2HSjMtalq6T50SmzENAAJv2r7tA9Iz
X-Gm-Gg: AZuq6aLNcHpCcCu5ieh/bgoKdGeSYdMFsW0zH/R3jUSR8420cRhckjX9f5lOo6RyBOb
 r3rXkUs3Zl9Lei1ya+Vc3JPKIkj0IdRtepydhN1nYewyCjRyF5hJwZbVzGzbG6RjSBRbOv0FyC5
 ZWlyX+cj+YSqu8Q6vP/vDgorPrQ29/S96NpPjzfOdOptbKA/FhTH0zK0pV5QrZulLCREZLBB98T
 6C2TCWHD8OnB1BqwwparmUwEKevKoLWcJrvqSk7kSSNeR7OgVb5McjSsL9XeGQHen5rjTjQn2WX
 AUIMnDvOrKhC+0clt+8QRJYnH8PEEvJvZoc3K57glLlH29XF5jAGYa5zl5ybps847MuT+AJDeC+
 aRhESKd1pFhTIOX5CaTV67Sp17Jw6qUvKIsVSSqARVY209FoheSXg6TxVO1/r2WrmxksKHpsg4+
 gP23efFY9YqReWhZwjPEfZ/BjSN3C/Mji24xs7H7P7wYUZDtZjgsTEpA==
X-Received: by 2002:a05:600c:3b93:b0:477:af8d:203a with SMTP id
 5b1f17b1804b1-4805d064549mr82656675e9.27.1769449426465; 
 Mon, 26 Jan 2026 09:43:46 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:46 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 22/27] target/arm/cpu: add fdt support for armv8-timer
Date: Mon, 26 Jan 2026 18:43:08 +0100
Message-ID: <20260126174313.1418150-23-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x335.google.com
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
index 6e1cbf3d61..96696ed4f1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -53,6 +53,8 @@
 #include "target/arm/gtimer.h"
 
 #include "trace.h"
+#include "hw/core/fdt_generic_util.h"
+
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -2446,3 +2448,116 @@ static void arm_cpu_register_types(void)
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
+    intc_phandle = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                         "interrupt-parent",
+                                         0, true, &errp);
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


