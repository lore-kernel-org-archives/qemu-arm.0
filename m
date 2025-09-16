Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5556FCAC59B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:30:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWap-0006IV-Ny; Tue, 16 Sep 2025 10:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa8-0005k4-4C
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:59 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa0-0008Id-Kk
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b54a8c2eb5cso4376235a12.2
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032566; x=1758637366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nq6JrE67XdC4DhChEEdPGkYsROtQVb32kfX4xjifCBA=;
 b=R9lORuQOv40l6EUd8zc6xBftuPAirF0TCA/hvn6RZIUMqodP5Npxc/o03Fkxvs55tY
 1BCuTKacJ/oxUOonkK3t82LAUJp8HIwzOsxiUif+FcdMriH8QdxdXjt8KHPyLodEOSuI
 cBj2wxJj4KTngmyo5V7onm3+V5JYDGn9wK5aEtofyOtj3txdu+d0uYjLLil4uGKO+/Ps
 IWtAF5tp+1/q4avV6f2Inub88QDxTd9bdgJaR0Tkcbu7XoV79lSFL/i29Jq+DZE1sg/G
 SGz/v/eZNaB7FTs8Y8YLoJtkD6D9Bn8BnIBOxLPJNpO516CeF6GVzS9sKVfm3sKFqz9q
 LyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032566; x=1758637366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nq6JrE67XdC4DhChEEdPGkYsROtQVb32kfX4xjifCBA=;
 b=Lmik/Oogo0H6sSkcRao4t1aXl7N0EB2LPH/SyfR1HOoj5Mkud4+hNeihPRztdFm7uN
 ampkjGutH9PdvL5cTljXUA+gdHHcNvuU2tMN5ObJCFMdQ/d+9iKmCGbCLOD0WCb/hJDC
 PVOY32YAzeJMgYleBuksGW3tdTn/7FmEnuZX8QKRCWo8UihP7Q5ocrH1on7zjlT4K/5l
 OqQ8jgADDejd5Nxoa5jR6Y5DRZLR7/jA7ltv3PT13QT665H/8hdx0Eo6lIEaAsQIheqb
 g6RTIOGapSJIRH4Z17wEmiffkaAy7zoq3RPB+aCG3I8iZieyu484ybnk1TGLg32TYkSs
 Of4g==
X-Gm-Message-State: AOJu0YynIwkT5hMqEggiD4vx88rBaBB8kfNCUUhy4hGyNpYmhoqULSRL
 0ym91vPzrvYQHJLdtgxI9FwQywj93QAk0kisjrifEZzXuSUL+MHay8vpV99w6dNz2ok=
X-Gm-Gg: ASbGnctJKsKKDhLIWwmxjl9Gl2HxnErpm9hpn7V0Hjq+cuGBPWMge8w0UNqpDaRUqrl
 2tlI1YtdxvUsRyahe1WmdLHp0BlTngYKQ4D6y5v2rvNIzNU++wYUZd1ALR3/qEvY6Z/gM0XAUzK
 8CLBG/icSLAZGEdPCrgvVFRlAqrAR4hqhaG5h0FuuwVDJmlLzv3sVdq3q9CE5a+z2BZAMv8wNSu
 4X6fojee87IGOD1zL9dypQKxTLrp6oplGVdLXG9q/iqApV0zA0sS1slpkxDjzhK9oiremk1H+uR
 NymolSxgZjQ6Ib2mOcf+RbNFTgRpgciiRi1HqzwQyf7BOIyDX4xXZdC7Ghel4WB3B/+znq3ZB5f
 DE6uCA4rkgohkkMv1JXyXaZf1SSkJ
X-Google-Smtp-Source: AGHT+IE3hBaJlIif+4VDQfMuDeMPJZ+Faz7nCisIxhK7cfCDDoX2f6okBKa/CgqFI0MdnVff+fVung==
X-Received: by 2002:a17:902:da4f:b0:264:416:8cad with SMTP id
 d9443c01a7336-26404169009mr137311855ad.38.1758032565952; 
 Tue, 16 Sep 2025 07:22:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 07/36] target/arm/hvf: Replace hvf_sreg_match with
 hvf_sreg_list
Date: Tue, 16 Sep 2025 07:22:08 -0700
Message-ID: <20250916142238.664316-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Change hvf_get_registers and hvf_put_registers to iterate over
cpregs_indexes instead of hvf_sreg_match.

This lets us drop the cp_idx member of hvf_sreg_match, which leaves
only one member in the struct.  Replace the struct with a const array.
Instead of int, use the proper enum type: hv_sys_reg_t.
Rename from hvf_sreg_match to hvf_sreg_list because there is no
longer any matching going on.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 45 +++++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 98f49ce33a..b043eac8c6 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -394,11 +394,6 @@ static const struct hvf_reg_match hvf_fpreg_match[] = {
     { HV_SIMD_FP_REG_Q31, offsetof(CPUARMState, vfp.zregs[31]) },
 };
 
-struct hvf_sreg_match {
-    int reg;
-    uint32_t cp_idx;
-};
-
 /*
  * QEMU uses KVM system register ids in the migration format.
  * Conveniently, HVF uses the same encoding of the op* and cr* parameters
@@ -419,9 +414,9 @@ struct hvf_sreg_match {
 
 #undef DEF_SYSREG
 
-#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2)  { HVF_ID },
+#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2)  HVF_ID,
 
-static struct hvf_sreg_match hvf_sreg_match[] = {
+static const hv_sys_reg_t hvf_sreg_list[] = {
 #include "sysreg.c.inc"
 };
 
@@ -434,7 +429,7 @@ int hvf_get_registers(CPUState *cpu)
     hv_return_t ret;
     uint64_t val;
     hv_simd_fp_uchar16_t fpval;
-    int i;
+    int i, n;
 
     for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
         ret = hv_vcpu_get_reg(cpu->accel->fd, hvf_reg_match[i].reg, &val);
@@ -463,13 +458,9 @@ int hvf_get_registers(CPUState *cpu)
     assert_hvf_ok(ret);
     pstate_write(env, val);
 
-    for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
-        int hvf_id = hvf_sreg_match[i].reg;
-        uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
-
-        if (hvf_sreg_match[i].cp_idx == -1) {
-            continue;
-        }
+    for (i = 0, n = arm_cpu->cpreg_array_len; i < n; i++) {
+        uint64_t kvm_id = arm_cpu->cpreg_indexes[i];
+        int hvf_id = KVMID_TO_HVF(kvm_id);
 
         if (cpu->accel->guest_debug_enabled) {
             /* Handle debug registers */
@@ -553,7 +544,7 @@ int hvf_get_registers(CPUState *cpu)
 
                 val = read_raw_cp_reg(env, ri);
 
-                arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+                arm_cpu->cpreg_values[i] = val;
                 continue;
             }
             }
@@ -562,7 +553,7 @@ int hvf_get_registers(CPUState *cpu)
         ret = hv_vcpu_get_sys_reg(cpu->accel->fd, hvf_id, &val);
         assert_hvf_ok(ret);
 
-        arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+        arm_cpu->cpreg_values[i] = val;
     }
     assert(write_list_to_cpustate(arm_cpu));
 
@@ -578,7 +569,7 @@ int hvf_put_registers(CPUState *cpu)
     hv_return_t ret;
     uint64_t val;
     hv_simd_fp_uchar16_t fpval;
-    int i;
+    int i, n;
 
     for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
         val = *(uint64_t *)((void *)env + hvf_reg_match[i].offset);
@@ -605,12 +596,9 @@ int hvf_put_registers(CPUState *cpu)
     aarch64_save_sp(env, arm_current_el(env));
 
     assert(write_cpustate_to_list(arm_cpu, false));
-    for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
-        int hvf_id = hvf_sreg_match[i].reg;
-
-        if (hvf_sreg_match[i].cp_idx == -1) {
-            continue;
-        }
+    for (i = 0, n = arm_cpu->cpreg_array_len; i < n; i++) {
+        uint64_t kvm_id = arm_cpu->cpreg_indexes[i];
+        int hvf_id = KVMID_TO_HVF(kvm_id);
 
         if (cpu->accel->guest_debug_enabled) {
             /* Handle debug registers */
@@ -688,7 +676,7 @@ int hvf_put_registers(CPUState *cpu)
             }
         }
 
-        val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
+        val = arm_cpu->cpreg_values[i];
         ret = hv_vcpu_set_sys_reg(cpu->accel->fd, hvf_id, val);
         assert_hvf_ok(ret);
     }
@@ -899,7 +887,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
-    uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_match);
+    uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_list);
     uint32_t sregs_cnt = 0;
     uint64_t pfr;
     hv_return_t ret;
@@ -924,17 +912,14 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
     /* Populate cp list for all known sysregs */
     for (i = 0; i < sregs_match_len; i++) {
-        int hvf_id = hvf_sreg_match[i].reg;
+        hv_sys_reg_t hvf_id = hvf_sreg_list[i];
         uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
         uint32_t key = kvm_to_cpreg_id(kvm_id);
         const ARMCPRegInfo *ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
 
         if (ri) {
             assert(!(ri->type & ARM_CP_NO_RAW));
-            hvf_sreg_match[i].cp_idx = sregs_cnt;
             arm_cpu->cpreg_indexes[sregs_cnt++] = kvm_id;
-        } else {
-            hvf_sreg_match[i].cp_idx = -1;
         }
     }
     arm_cpu->cpreg_array_len = sregs_cnt;
-- 
2.43.0


