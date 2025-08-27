Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC823CA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4cU-0004R0-Kx; Tue, 26 Aug 2025 21:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4bc-0003lk-NI
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:05:41 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4bX-0007Hh-MG
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:05:40 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-323267bc2eeso4675797a91.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256734; x=1756861534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aps/5dRSIQxJoI5rTRRJw0UjbyCrM2YzxlFedWAMQo=;
 b=bE2b6rp97dc77zCnHTFKNDWNdDNlb2ZA3AbfAaPSOsatJKqE9V5SD+Qoxkc/Gkb2TS
 /OiNk/w983CM7vGun16PAF8MCoJ/7isTVh9vGr8sA4Ch6lvIB4gmFD4DPHmXMlZzLXpW
 Divj+sM3JdVsaGvzbhf4IbJfFGgQlTYZuMSFPuYQihM2ehnGHc1WaMqIKv0Dy5HXcyUY
 CKxkiIjA6le2srIpiXvuAwqYxKvqWP1463r9SiO0TXb0As9vAKWFP5+FpIV/L46cqQqt
 qijwhuXHKli62k0GTBMbAZl3R0HgQR+5svhEllflDkY6U3mRiqG8WPpRIbuegNHAVYkR
 STfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256734; x=1756861534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aps/5dRSIQxJoI5rTRRJw0UjbyCrM2YzxlFedWAMQo=;
 b=vLej4ecJS2C3qRQjUKPh92ctd0J352Sq/8j9ymG7P2sHOLDBzu4DPBzgZEXyYEftEL
 yW74nV6I9RPbnJV3DcPk3s9ykq7XLqBJ95Kw85qvh/iqxFYOsgb112eqBXN92Va0jtNS
 3YkjaBiAzSujY0SLcE/Aq1j9EleIq8Fkue2Qr7RJNNy/BbCn2ChB7QTFgQLtL1czWJ8/
 K61YqFVYPPJ2lHIKkHCXbxW0v+V+xajCbLSCWb2ZYvbRM6igEvAVHKpJKGBLWO6sMJjH
 FGL07Ipxg/LlVZkqsbhJa0LJgh9L+6bo/zmE2Rjwx2Pste+JJxhyFuMazoTrpU1MDioj
 KOUw==
X-Gm-Message-State: AOJu0YzGGvwXE1tXtMz8Pps6kCcwc3OFSvuM+h1VzEXHSeOtr6Gl7+8F
 2frJNIdKa8/hVqerS7Qi5cx6OJ4k71R+UHq5pxyUlsa5q1OJXLPiIytW7ZZdR1qIOls=
X-Gm-Gg: ASbGnctfRd0rUo3V+fsGn2WnmmftCIpO848cN7zE/R1X476NU+kA3ftLxnpFyy4iXxc
 0ie1Rrly+Wpya7KYR3kiEhWIf3XJdEUMe1NIjM1vFeB1osD2D/5YlzO4pym+PIhqdrFSgY0escd
 aUmXR7qRGAYOMYVI/LhCZWdbA7KtrhxO6zcq6OdkwS7ch+s4xTR5JfN/mQ70+KvTtHv5kYKYiTr
 g5B6fVcnyiOHf43MHVTmJ3Q5hbUtwyKFjqvH3EmTBryx+s18v63i5ClI+uEsrJVHhVF6LT/Sv9M
 MZgbxMNTiwZ5Yx2bh8EftUK6DL0ffQ+NQz34po3YuzWKPbPXC870S1EAwPAFa8nvkt6sTMLlX+O
 2rNQUZHUS5KeQhPdFlAY3Ys5BxKRPLPqMgDEL
X-Google-Smtp-Source: AGHT+IH90EsGhqOkJUhrZ8ZiuhrpO0NZDQQtod664p79QlxpnXbqAScPmseFRvmeKtfzDtn9Hv8wZA==
X-Received: by 2002:a17:90b:57c4:b0:321:c37e:e325 with SMTP id
 98e67ed59e1d1-32515ec8ce9mr24809462a91.12.1756256733852; 
 Tue, 26 Aug 2025 18:05:33 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:05:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/7] target/arm/hvf: Remove hvf_sreg_match.key
Date: Wed, 27 Aug 2025 11:03:54 +1000
Message-ID: <20250827010453.4059782-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 2577dc1c0c..46e52e8d34 100644
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
 
-#define DEF_SYSREG(HVF_ID, crn, crm, op0, op1, op2) \
-    { HVF_ID, HVF_SYSREG(crn, crm, op0, op1, op2) },
+#define DEF_SYSREG(HVF_ID, crn, crm, op0, op1, op2)  { HVF_ID },
 
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


