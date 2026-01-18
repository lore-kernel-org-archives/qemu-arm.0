Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422E9C9830C
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Jan 2026 22:01:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhaoW-0003lD-K2; Sun, 18 Jan 2026 17:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhaoR-0003hU-Lm
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 16:59:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhaoQ-0008JB-0y
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 16:59:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso23934395e9.2
 for <qemu-arm@nongnu.org>; Sun, 18 Jan 2026 13:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768773596; x=1769378396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Z2dvTrseTxOg307MHO4uCzaKs+nhbHFu0/LcG6p+m8=;
 b=nIs8G4BOFeNEji5yG/zmAFO1ZTRDnunlYTjUBweqI/RGt6mhtoFfBP1e8H2/dt4Tzi
 NjNH86mGjfBM257Yz6fAumU890T2xlSRSmq2cdYwOQiyEFqW5oygldsjovjFHBL47SrT
 XWKVQTGZ6tDeJlo+3Cr6WlLQUITAeZH23bwdyVq3waQ+0V2gxUoyoAvcZzhnmsi9IgHl
 YurGXrOnt9nDzBITMfyPYHO25GBkdmeSxDu0GgxFAWPB/j8NsnPrg3RzZLGT/CqaNIO0
 DcYo/EmUU1yaSO4uGF4BE5eI7YlL0BDmAgW+8H8bd2jY6meMOSmT1AMwIEpdbuh0wrsb
 uJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768773596; x=1769378396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Z2dvTrseTxOg307MHO4uCzaKs+nhbHFu0/LcG6p+m8=;
 b=chTyFQS6lqEoMXOtvEWJyelW/ZRfli8D5qiGQF8/T7T1H4K5kl0LKtrhU4/toy4+Qv
 nlSQ+Lc1bVrWXZ8dJ8BJ+00oPocQEajSNc7DqlYlY6VZahZDRMu2hla8Tz2VLi0bXNyK
 m9ySJutiI/UM1yXoNUanZlKb2eMZRbhyyYiEaSaIzdP/6lt3H5aKJIyvvqg07BwHizFo
 KqRhsMF5Ajf5RwK7fPjKHoa6xPOcuKLyLXFQH9YqJazhaZH7gB8xZKZhOmoXcpmv3t9l
 MfsqF190ZNh6EWuNVjbpC2Q/+yNSMO3+VhjXz7QX9rrJ8r6qwz08VwQKbddLDkZdGZCZ
 IHhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlZ5t4mtNnbI5dKzOcNOSbJWkf/0NzbbXx6hhjrGCslXrSoMJcvel6Fu/IDISmtH44JL7bWhZagg==@nongnu.org
X-Gm-Message-State: AOJu0YzdP5/J3HLBgt59ellNK4MUWbGRXURvPC2ZX68JVeFEGudrqjn8
 FNMoA1PH3I1Lr2Mz1HL7lpshAUrEXFfIadsEw9miBHDGJXj7SCMBz5H9J9/+wiuZjco=
X-Gm-Gg: AY/fxX7UnMRHI9RrTwyszYBJz8jQlBxMi0iuS/5CscvWOpvQE1FPrTsQRSXeEyvSviv
 zmtoPpT/fN5ZFkSU5I5MI9QTlCHVlGuiM4ctsjgPBT3Y0cDw9ZymaCtSCXJrjzU5hPOlIZEcTjR
 vMxCQsAnvEr61Ha7dQ2mDoBS6E03lMO9VkNZ8NCQV77vD8CGQEnQ/Da5JdZqKUToJ053mS3KgQJ
 QB3COS+sXj9MHFEAs7Co46iCGBV3UzAA9xuJM7JdOcIxs58XTl9iuz6CsEMV0sEGIHiMRjq9UzM
 y0e+sGnj/8Piu6BXoH7E/yLUr/EYA14eGWRUSM3uNL5XCUtwtz5M4ayVWz0W4BqD++XxnvqGRw5
 2mQeNZltYUfjxK6M7PumwYY0oErKix4SMuwcVcPOCnXCZEgThJLmEXrHaRXl6BeKqncr9ROJ0tK
 V1pxGfUSKExMx50/DxteiqoOKYHTCMAGajfUvNabpvDJKJsLdA8hEep50SOFz9
X-Received: by 2002:a05:600c:b93:b0:480:1db1:b44d with SMTP id
 5b1f17b1804b1-4801e34cab5mr128428675e9.27.1768773596257; 
 Sun, 18 Jan 2026 13:59:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8c9cbcsm158555475e9.12.2026.01.18.13.59.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Jan 2026 13:59:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 1/2] target/arm/hvf: Move hvf_sysreg_[read,
 write]_cp() functions around
Date: Sun, 18 Jan 2026 22:59:44 +0100
Message-ID: <20260118215945.46693-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118215945.46693-1-philmd@linaro.org>
References: <20260118215945.46693-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Next commit will use these functions prototype earlier. Rather
than forward-declaring them, move them around.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 142 +++++++++++++++++++++----------------------
 1 file changed, 71 insertions(+), 71 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index e4c0d936f1f..fcb7fa3b30c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -423,6 +423,77 @@ static const hv_sys_reg_t hvf_sreg_list[] = {
 
 #undef DEF_SYSREG
 
+static uint32_t hvf_reg2cp_reg(uint32_t reg)
+{
+    return ENCODE_AA64_CP_REG((reg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK,
+                              (reg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK,
+                              (reg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK,
+                              (reg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK,
+                              (reg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK);
+}
+
+static bool hvf_sysreg_read_cp(CPUState *cpu, const char *cpname,
+                               uint32_t reg, uint64_t *val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+    if (ri) {
+        if (!cp_access_ok(1, ri, true)) {
+            return false;
+        }
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
+                return false;
+            }
+        }
+        if (ri->type & ARM_CP_CONST) {
+            *val = ri->resetvalue;
+        } else if (ri->readfn) {
+            *val = ri->readfn(env, ri);
+        } else {
+            *val = raw_read(env, ri);
+        }
+        trace_hvf_emu_reginfo_read(cpname, ri->name, *val);
+        return true;
+    }
+
+    return false;
+}
+
+static bool hvf_sysreg_write_cp(CPUState *cpu, const char *cpname,
+                                uint32_t reg, uint64_t val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+
+    if (ri) {
+        if (!cp_access_ok(1, ri, false)) {
+            return false;
+        }
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
+                return false;
+            }
+        }
+        if (ri->writefn) {
+            ri->writefn(env, ri, val);
+        } else {
+            raw_write(env, ri, val);
+        }
+
+        trace_hvf_emu_reginfo_write(cpname, ri->name, val);
+        return true;
+    }
+
+    return false;
+}
+
 int hvf_arch_get_registers(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1161,46 +1232,6 @@ static bool is_id_sysreg(uint32_t reg)
            SYSREG_CRM(reg) < 8;
 }
 
-static uint32_t hvf_reg2cp_reg(uint32_t reg)
-{
-    return ENCODE_AA64_CP_REG((reg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK,
-                              (reg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK,
-                              (reg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK,
-                              (reg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK,
-                              (reg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK);
-}
-
-static bool hvf_sysreg_read_cp(CPUState *cpu, const char *cpname,
-                               uint32_t reg, uint64_t *val)
-{
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    CPUARMState *env = &arm_cpu->env;
-    const ARMCPRegInfo *ri;
-
-    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
-    if (ri) {
-        if (!cp_access_ok(1, ri, true)) {
-            return false;
-        }
-        if (ri->accessfn) {
-            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
-                return false;
-            }
-        }
-        if (ri->type & ARM_CP_CONST) {
-            *val = ri->resetvalue;
-        } else if (ri->readfn) {
-            *val = ri->readfn(env, ri);
-        } else {
-            *val = raw_read(env, ri);
-        }
-        trace_hvf_emu_reginfo_read(cpname, ri->name, *val);
-        return true;
-    }
-
-    return false;
-}
-
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1454,37 +1485,6 @@ static void pmswinc_write(CPUARMState *env, uint64_t value)
     }
 }
 
-static bool hvf_sysreg_write_cp(CPUState *cpu, const char *cpname,
-                                uint32_t reg, uint64_t val)
-{
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    CPUARMState *env = &arm_cpu->env;
-    const ARMCPRegInfo *ri;
-
-    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
-
-    if (ri) {
-        if (!cp_access_ok(1, ri, false)) {
-            return false;
-        }
-        if (ri->accessfn) {
-            if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
-                return false;
-            }
-        }
-        if (ri->writefn) {
-            ri->writefn(env, ri, val);
-        } else {
-            raw_write(env, ri, val);
-        }
-
-        trace_hvf_emu_reginfo_write(cpname, ri->name, val);
-        return true;
-    }
-
-    return false;
-}
-
 static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
-- 
2.52.0


