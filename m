Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7FFCAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:28:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWd1-0001IC-8U; Tue, 16 Sep 2025 10:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWan-0006BN-Ad
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:37 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaW-0008IR-Cj
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-776b0100de0so2215580b3a.0
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032565; x=1758637365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrsLIYa/QaAtepVhdLt9uWw8TsTHaDZ3hg9nTee82WI=;
 b=g3TCEvwNoqcl82tF34AYM0DH/2B7xZ2yB+Ds4IlKJuaUo0kUeloHKh1AGJ5pLeJ0JY
 2bz031d8XfvUQHyU6lTqLO1NH0Uz/HrtMvQuXTgnByvaRKTrrt58CbGoj07b282SyzoP
 79JJ+xXHofhv2F4u6YKZ1s9XnPVVOeX0z2X0IghRDKFMHonmAh1n3/lQ2zBBSzbiIqwb
 wQpLirc9fk8f3EKKcVSF1N85XFlWkXUg7JjOBIXDZ65dfDott/2Jz5g673Gdrabi8eHJ
 Ecj4uKJQ5EJea0gnDXd128nAaOjVNXE/Rl9vLp1WKUZ55VGNbWbbIeQURiv5gn4N6Guw
 6GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032565; x=1758637365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xrsLIYa/QaAtepVhdLt9uWw8TsTHaDZ3hg9nTee82WI=;
 b=rxfgWW2U/RwaUImlhLy1LQjad2xbiAVtlSSy+C/8q1PVlbarj81mevzxcIfv3w6RhH
 58d1p9fD3jl2165oSSi/YJw01cvSwt9V9iUfWBMlzKR0VW474LY44ezi6FXX7IftuL1X
 qvS9DCY56MhAjuxQjkkMgvy5Q9iiHRdxz6Y8xFI5YevtztA8ocx2WJXNp51rSb/9JNkd
 ++JcnDU9RqmMaV9Un97CvLv/2N6cParEfzwhOR+l2XAzICAwJGe6dFvbedeGnTDrrVNE
 f1Gv2asaLVS+Jjw39aSUideZD2Q1pMXGAqb2yMGSE6iqRS9fTi+y/3T+U/pc5a131Fm9
 eBkA==
X-Gm-Message-State: AOJu0YyPGCAw3j2NE7QIXZ32ZlDoQBh2ToLY+uU29wrHiwBLJ3r/bd+G
 hf+G6U6zMBW+wZQBK0FNM7rSO2tfF/x2L5VdjhSglCIuPO0qQJyxgyKlhR0qT1lN+PKOCvEj9fX
 ltMkH
X-Gm-Gg: ASbGncv0D8D6qPUSXDGupkntZw7ZG1LbAjuszyIqIy0XrscTae67lKco2TSY30PHOAP
 yjfsqjiT1ZDTpa+RMjLQImaMlDXUli5QXj+cKaLOU7DapGokEAxE4QRJcqk0h5iQxP2LBltgWA5
 CQktXQUAG0+9qg9MAHxSMQFKbsw1HzXhjRM8zpvKD01t0MG/IuuQODFa3Ju+M/+BSFEinJGtB2p
 B01CaihtqLSqE+4lVlUmr29NICD+JjYKFHlxfs4NWYUp2M2d4Th8FnCHd65DC1RJ1193qrY2ir2
 F4J7PjTicFZ83ifyma14YgJcxrF6+RDLHoihe2N1KUm9YGFZyX1W6l7qPi+cjIHawvObUKbxwN0
 f0fRL90sCvoRiL83XIzql2QafhR8WWlpv3dqSlI8=
X-Google-Smtp-Source: AGHT+IF/zhnb/fEY2Hdhh0Qrn3V8VxKk40FFxX7eXlIG+bNC5weT8MNhEYkiuAcqeYiD23M0K2BSlQ==
X-Received: by 2002:a17:902:d2cd:b0:25b:e5a2:fb29 with SMTP id
 d9443c01a7336-267d158f7bbmr37492245ad.12.1758032565016; 
 Tue, 16 Sep 2025 07:22:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 06/36] target/arm/hvf: Remove hvf_sreg_match.key
Date: Tue, 16 Sep 2025 07:22:07 -0700
Message-ID: <20250916142238.664316-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Use conversion functions instead of table lookup.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 7515e59c56..98f49ce33a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -152,9 +152,6 @@ void hvf_arm_init_debug(void)
         g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
 }
 
-#define HVF_SYSREG(crn, crm, op0, op1, op2) \
-        ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
-
 #define SYSREG_OP0_SHIFT      20
 #define SYSREG_OP0_MASK       0x3
 #define SYSREG_OP0(sysreg)    ((sysreg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK)
@@ -399,7 +396,6 @@ static const struct hvf_reg_match hvf_fpreg_match[] = {
 
 struct hvf_sreg_match {
     int reg;
-    uint32_t key;
     uint32_t cp_idx;
 };
 
@@ -423,8 +419,7 @@ struct hvf_sreg_match {
 
 #undef DEF_SYSREG
 
-#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2) \
-    { HVF_ID, HVF_SYSREG(crn, crm, op0, op1, op2) },
+#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2)  { HVF_ID },
 
 static struct hvf_sreg_match hvf_sreg_match[] = {
 #include "sysreg.c.inc"
@@ -469,13 +464,16 @@ int hvf_get_registers(CPUState *cpu)
     pstate_write(env, val);
 
     for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
+        int hvf_id = hvf_sreg_match[i].reg;
+        uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
+
         if (hvf_sreg_match[i].cp_idx == -1) {
             continue;
         }
 
         if (cpu->accel->guest_debug_enabled) {
             /* Handle debug registers */
-            switch (hvf_sreg_match[i].reg) {
+            switch (hvf_id) {
             case HV_SYS_REG_DBGBVR0_EL1:
             case HV_SYS_REG_DBGBCR0_EL1:
             case HV_SYS_REG_DBGWVR0_EL1:
@@ -549,8 +547,10 @@ int hvf_get_registers(CPUState *cpu)
                  * vCPU but simply keep the values from the previous
                  * environment.
                  */
-                const ARMCPRegInfo *ri;
-                ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_sreg_match[i].key);
+                uint32_t key = kvm_to_cpreg_id(kvm_id);
+                const ARMCPRegInfo *ri =
+                    get_arm_cp_reginfo(arm_cpu->cp_regs, key);
+
                 val = read_raw_cp_reg(env, ri);
 
                 arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
@@ -559,7 +559,7 @@ int hvf_get_registers(CPUState *cpu)
             }
         }
 
-        ret = hv_vcpu_get_sys_reg(cpu->accel->fd, hvf_sreg_match[i].reg, &val);
+        ret = hv_vcpu_get_sys_reg(cpu->accel->fd, hvf_id, &val);
         assert_hvf_ok(ret);
 
         arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
@@ -606,13 +606,15 @@ int hvf_put_registers(CPUState *cpu)
 
     assert(write_cpustate_to_list(arm_cpu, false));
     for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
+        int hvf_id = hvf_sreg_match[i].reg;
+
         if (hvf_sreg_match[i].cp_idx == -1) {
             continue;
         }
 
         if (cpu->accel->guest_debug_enabled) {
             /* Handle debug registers */
-            switch (hvf_sreg_match[i].reg) {
+            switch (hvf_id) {
             case HV_SYS_REG_DBGBVR0_EL1:
             case HV_SYS_REG_DBGBCR0_EL1:
             case HV_SYS_REG_DBGWVR0_EL1:
@@ -687,7 +689,7 @@ int hvf_put_registers(CPUState *cpu)
         }
 
         val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
-        ret = hv_vcpu_set_sys_reg(cpu->accel->fd, hvf_sreg_match[i].reg, val);
+        ret = hv_vcpu_set_sys_reg(cpu->accel->fd, hvf_id, val);
         assert_hvf_ok(ret);
     }
 
@@ -922,14 +924,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
     /* Populate cp list for all known sysregs */
     for (i = 0; i < sregs_match_len; i++) {
-        const ARMCPRegInfo *ri;
-        uint32_t key = hvf_sreg_match[i].key;
+        int hvf_id = hvf_sreg_match[i].reg;
+        uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
+        uint32_t key = kvm_to_cpreg_id(kvm_id);
+        const ARMCPRegInfo *ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
 
-        ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
         if (ri) {
             assert(!(ri->type & ARM_CP_NO_RAW));
             hvf_sreg_match[i].cp_idx = sregs_cnt;
-            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);
+            arm_cpu->cpreg_indexes[sregs_cnt++] = kvm_id;
         } else {
             hvf_sreg_match[i].cp_idx = -1;
         }
-- 
2.43.0


