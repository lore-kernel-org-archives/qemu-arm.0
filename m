Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970CCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:46:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usN7K-000841-Ip; Sat, 30 Aug 2025 11:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1urt9F-0007Ce-Tk
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 03:03:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1urt9D-0004bQ-Pc
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 03:03:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b7e69570bso4121095e9.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756451022; x=1757055822; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nAVy79qT+VRU3NUV4NcmYczu3zKLjpOZKa36nQp76eo=;
 b=yimbYOeZW1SiIZxeZMWpjDK/GwZt9xhrVrvtfD6W4jq42G6Fl3mD8bfY40lWJTyy4o
 j440B32cZUEM/NNz9z1OTolXzE+U5eCaoWjiFMLSaN/+9nqJxKGgRva/J771TC8VnLkO
 jVZ/QHdo+grdNthUbHWCfgA/5FuhADdsLqiKaepnOlUwHlbAoH9liPPE5oTajJk/rLEo
 rJFq1BVTAa8yGLy2GhNYbv+v+wE8qCyAEtGwA/30Ez6XUBz7YZPhu0J9F9qZkhPYx+eO
 lhXdH9Wr3t2MQWbvPOs3rLHlkfPwC4Jh/vtc/3H09PGGOgQ37pfzCDznfLexIQJ+GZhM
 tUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756451022; x=1757055822;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nAVy79qT+VRU3NUV4NcmYczu3zKLjpOZKa36nQp76eo=;
 b=fsMR+AzPpRKX/ylsZnkd9HgqLOH8fIW1F3PTyNWuvzor+n/YDfXVb6IBFqgdZBJIqg
 nN7n01BPhg4hqLlAMtDLIe5Ln10mY1uTHyrB36grt24w6n6zrZ4HbcXD3xJv8rEMiSvy
 nsoveYHZK3Adjh6viGUagjYd+tRbjLwFFmXP8fHUcVwHrBdzbiVRNia//0NHR2bY+crV
 0WGg9Wks9ZSVrEFRRbMoTCIlzCoyu/2tyXLTxNwWZAynvaULliMaD9EDOIbOkPMxYLzN
 4tOCbsgTChhEnNX/BHsWksN/RoWzqR0xASlPCKbykudXrYg/RRMSnY5Od7d2A2j15vbK
 3RkA==
X-Gm-Message-State: AOJu0Yy4I4wSPs5Kau1AA3+7rfvTIPp8wcMMltYlK/Bws8oW7aJPykKZ
 SLN9longpZYnUfyA5YkTDJCAN5MAhqgi4zLjDZo38/7WFnVbWwNsxphVgwRYKO18ylt8lVWoJux
 83gmc/AY=
X-Gm-Gg: ASbGncuUSBswJF4RpUiT9RnGJVhzdj41WdPmXRaPi+5hpSxyuX5egE4+yyoZfnbXHTw
 wEWbG/nQLKDZyzZdu1W4b46tf38+kpLHKbFfx0zuwsLNuvrjm81Sf8UE6zetlYgd0YSc42BHei3
 PSmb+QsYGRHJfHAIH732WdSGSU48qdgBDpPrB6/w32QTndU/kwzvvE8Dpm3z3J3r6M7hSSkaW90
 8e8A8YepQ9tHJ+o5mniyY2/wfH56mEqhg1zEPkokd7ZPLXj8tm7Pgoacebb2RhCivPJery15gPY
 Vn2Z04za/wgembZiGn78qqwZO5NYRjia/54hbJQixWXqZt1eO5GZqiNnMG3sovOSLTO6OWHMLqT
 7POXIc6tKI9UXU6o6pw33RnHDRaoj9TpF63vxfQ36nn7LMXXcsxBgz3sHPEF0twlf1OWs2FFNrl
 W1v+BMNa8=
X-Google-Smtp-Source: AGHT+IF0M6v6tWEMQ3+/dIGk6rqWMEzVMDZLzBo2z0mTftjlHCA+Qjn7YC9F812AnUVevX/ewc2k3Q==
X-Received: by 2002:a05:600c:4451:b0:45b:43cc:e558 with SMTP id
 5b1f17b1804b1-45b517cba3bmr218371165e9.35.1756451021607; 
 Fri, 29 Aug 2025 00:03:41 -0700 (PDT)
Received: from meli-email.org (athedsl-4441256.home.otenet.gr.
 [79.129.180.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b81a9e971sm6511175e9.18.2025.08.29.00.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:03:41 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:00:45 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 06/61] target/arm/hvf: Remove hvf_sreg_match.key
User-Agent: meli/0.8.12
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
 <20250827010453.4059782-9-richard.henderson@linaro.org>
In-Reply-To: <20250827010453.4059782-9-richard.henderson@linaro.org>
Message-ID: <t1qua4.2jl6eivk2f8kt@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
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

On Wed, 27 Aug 2025 04:03, Richard Henderson <richard.henderson@linaro.org> wrote:
>Use conversion functions instead of table lookup.
>
>Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> target/arm/hvf/hvf.c | 35 +++++++++++++++++++----------------
> 1 file changed, 19 insertions(+), 16 deletions(-)
>
>diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>index 47165bd29c..5fcfa9a999 100644
>--- a/target/arm/hvf/hvf.c
>+++ b/target/arm/hvf/hvf.c
>@@ -152,9 +152,6 @@ void hvf_arm_init_debug(void)
>         g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
> }
> 
>-#define HVF_SYSREG(crn, crm, op0, op1, op2) \
>-        ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
>-
> #define SYSREG_OP0_SHIFT      20
> #define SYSREG_OP0_MASK       0x3
> #define SYSREG_OP0(sysreg)    ((sysreg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK)
>@@ -399,7 +396,6 @@ static const struct hvf_reg_match hvf_fpreg_match[] = {
> 
> struct hvf_sreg_match {
>     int reg;
>-    uint32_t key;
>     uint32_t cp_idx;
> };
> 
>@@ -423,8 +419,7 @@ struct hvf_sreg_match {
> 
> #undef DEF_SYSREG
> 
>-#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2) \
>-    { HVF_ID, HVF_SYSREG(crn, crm, op0, op1, op2) },
>+#define DEF_SYSREG(HVF_ID, op0, op1, crn, crm, op2)  { HVF_ID },
> 
> static struct hvf_sreg_match hvf_sreg_match[] = {
> #include "sysreg.c.inc"
>@@ -469,13 +464,16 @@ int hvf_get_registers(CPUState *cpu)
>     pstate_write(env, val);
> 
>     for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
>+        int hvf_id = hvf_sreg_match[i].reg;
>+        uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
>+
>         if (hvf_sreg_match[i].cp_idx == -1) {
>             continue;
>         }
> 
>         if (cpu->accel->guest_debug_enabled) {
>             /* Handle debug registers */
>-            switch (hvf_sreg_match[i].reg) {
>+            switch (hvf_id) {
>             case HV_SYS_REG_DBGBVR0_EL1:
>             case HV_SYS_REG_DBGBCR0_EL1:
>             case HV_SYS_REG_DBGWVR0_EL1:
>@@ -549,8 +547,10 @@ int hvf_get_registers(CPUState *cpu)
>                  * vCPU but simply keep the values from the previous
>                  * environment.
>                  */
>-                const ARMCPRegInfo *ri;
>-                ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_sreg_match[i].key);
>+                uint32_t key = kvm_to_cpreg_id(kvm_id);
>+                const ARMCPRegInfo *ri =
>+                    get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>+
>                 val = read_raw_cp_reg(env, ri);
> 
>                 arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
>@@ -559,7 +559,7 @@ int hvf_get_registers(CPUState *cpu)
>             }
>         }
> 
>-        ret = hv_vcpu_get_sys_reg(cpu->accel->fd, hvf_sreg_match[i].reg, &val);
>+        ret = hv_vcpu_get_sys_reg(cpu->accel->fd, hvf_id, &val);
>         assert_hvf_ok(ret);
> 
>         arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
>@@ -606,13 +606,15 @@ int hvf_put_registers(CPUState *cpu)
> 
>     assert(write_cpustate_to_list(arm_cpu, false));
>     for (i = 0; i < ARRAY_SIZE(hvf_sreg_match); i++) {
>+        int hvf_id = hvf_sreg_match[i].reg;
>+
>         if (hvf_sreg_match[i].cp_idx == -1) {
>             continue;
>         }
> 
>         if (cpu->accel->guest_debug_enabled) {
>             /* Handle debug registers */
>-            switch (hvf_sreg_match[i].reg) {
>+            switch (hvf_id) {
>             case HV_SYS_REG_DBGBVR0_EL1:
>             case HV_SYS_REG_DBGBCR0_EL1:
>             case HV_SYS_REG_DBGWVR0_EL1:
>@@ -687,7 +689,7 @@ int hvf_put_registers(CPUState *cpu)
>         }
> 
>         val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
>-        ret = hv_vcpu_set_sys_reg(cpu->accel->fd, hvf_sreg_match[i].reg, val);
>+        ret = hv_vcpu_set_sys_reg(cpu->accel->fd, hvf_id, val);
>         assert_hvf_ok(ret);
>     }
> 
>@@ -922,14 +924,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> 
>     /* Populate cp list for all known sysregs */
>     for (i = 0; i < sregs_match_len; i++) {
>-        const ARMCPRegInfo *ri;
>-        uint32_t key = hvf_sreg_match[i].key;
>+        int hvf_id = hvf_sreg_match[i].reg;
>+        uint64_t kvm_id = HVF_TO_KVMID(hvf_id);
>+        uint32_t key = kvm_to_cpreg_id(kvm_id);
>+        const ARMCPRegInfo *ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
> 
>-        ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>         if (ri) {
>             assert(!(ri->type & ARM_CP_NO_RAW));
>             hvf_sreg_match[i].cp_idx = sregs_cnt;
>-            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);
>+            arm_cpu->cpreg_indexes[sregs_cnt++] = kvm_id;
>         } else {
>             hvf_sreg_match[i].cp_idx = -1;
>         }
>-- 
>2.43.0
>
>

