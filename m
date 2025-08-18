Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387ACCA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 04:25:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unrQg-00086m-9Z; Mon, 18 Aug 2025 00:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGQ-0005qN-0c
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGN-0002DX-2O
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:29 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-24457f3edd4so25497795ad.0
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 21:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755490463; x=1756095263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aps/5dRSIQxJoI5rTRRJw0UjbyCrM2YzxlFedWAMQo=;
 b=M1RkWEg+NQxV2M+5B0iFclZhH55b1nF/vSJYCI6c1BEgiGjVZ9ZovdUFcPZLYWzt/V
 RA9ewTayK73CHKHOT3pXeN/70ppIs6K5ZGjdyzrhIp06nTvWmC27dqXBx4TXyDkxMvqo
 l+vEjBhW2f0y9NrmqUueQnCmMBU9jujg3bahpxhOT3YyMycEx9DcpyrMA7eSpq7Q/gGf
 T2VIi8H/TXJ8jjKAV4g9Q6ONmVEu7IBtmB05sYVEH1EqRCtMDsFIkjBrDBQNalEtKXeh
 k34rVZAXX09n346PFNPu4ggbC4P/MmQc4NvOMSwsPl+p+Swm7gcrrzyd0PZX71sXq1MT
 qWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755490463; x=1756095263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aps/5dRSIQxJoI5rTRRJw0UjbyCrM2YzxlFedWAMQo=;
 b=welDyjyZVZwMPYp1rpuBzteGSwyaFxMpAgIPkeTZUtkPapxVUpq/OjPsFTaYUKHEiB
 csTMh9j9e2uIm0WPiN2gsuPcFv+4sdzhWt53bSlfs3p7h+g9sY/6BcB7/UBIqtV4mPLg
 nJHQxZC78Yo8Hx65RIN47Xk9FgZoSGAJu8YwbV69HYpvboGBEqCGRGgkNM75mFKKKM68
 BGwuuI5tg6GdklElA85ZMxyXAWZKUIy+1LueBAIoVNjH8g94nbLwxzO/k+iHVPDKpnuu
 vkVVbGl3xp64QpFpChAkVf0zBKwZRa6rTAg7siA4yinbTqMSeTVeTJux1sTZOLNX3KNh
 Q/Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcEaDXUlt7qi+3bMQiMOPQ+I77QiOpGM8forcCyZ87i6ytqD3KRmEX/NT5CJO6TUsx5fvwxbI/Nw==@nongnu.org
X-Gm-Message-State: AOJu0Ywj0qwWeXlO2l2TK3MCz0aOvw0Ltx645yqrYV6R34CHPBGnMIQ2
 xyxzAkEozYU4nHwo3q1NcG+XgjyHH0Zedwx4VeRXGS1ZWmWdStTo2rUC7DwC1P8GlUE=
X-Gm-Gg: ASbGncvwbqx5BEPE5izbzkw4TeBwmkSbYO0jPHmz0X+ui7yUPhgbXS9NTcM7SGLmnO+
 AdH5GAzzN6YxuAg1QaAeAJl7QXLfH7Ld5fp2mPqnb6Ypa1pc5ybSmSfGk/+lihEGddJGyNgvC7X
 cLblTRn/JQf0Fx5neMdp2DuyaZHbJVl2mX5Kp1sR7ahtlURHY1VMur6dhdNB8KsYkzY86uvylj+
 RaO1+UMqmATQceVi6Z0TiR3ihurMu8w9tcxVQnQKdn81VFNXg/6K2skv398dom9uZS6PEctsBoE
 jHizyHLFjmHH3mfJmj77JdmMldAZCpmO67G9xY52OYc2R8o+vFP3FapfBgpLc/+fb9jf8lnYO0d
 kuH7iLgHMTsjC+W9gFD2iFM4QEWXw93yliWsVqO1t/H2NLYY=
X-Google-Smtp-Source: AGHT+IHRZPC5BhM2arAFIalGfuOd77Sp7F7bnkxw6nT0FDuoL8H4HFBxT7rzNXnbUqNWH9VtzLk1cg==
X-Received: by 2002:a17:902:fc48:b0:240:125:1010 with SMTP id
 d9443c01a7336-2446d738cbcmr137235825ad.14.1755490462705; 
 Sun, 17 Aug 2025 21:14:22 -0700 (PDT)
Received: from localhost.localdomain ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f8c8e4bsm5498344a91.2.2025.08.17.21.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 21:14:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org, philmd@linaro.org
Subject: [PATCH 5/7] target/arm/hvf: Remove hvf_sreg_match.key
Date: Mon, 18 Aug 2025 14:13:52 +1000
Message-ID: <20250818041354.2393041-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818041354.2393041-1-richard.henderson@linaro.org>
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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


