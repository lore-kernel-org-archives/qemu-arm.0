Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp107387wrp;
        Mon, 11 Feb 2019 16:00:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbHx6bq0uEnjqZSpvnV73qqG/0VUbSn49zgjb5qBR5KKMa4h+k3rZ1ZA600z4hMu/tvp143
X-Received: by 2002:a25:6908:: with SMTP id e8mr689368ybc.324.1549929605100;
        Mon, 11 Feb 2019 16:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929605; cv=none;
        d=google.com; s=arc-20160816;
        b=e7N81TwKy+pqGS/k9u7p0TAZB9D0H3kGN90hOrurUkw7krY1X5qi2yavl2iAdJIpUK
         zBxUZcofK6Nm7P3uipJFyZAa8bMFiVugsborg7PckD1O9ZBvV5VCQjSManduQ0E1KiZY
         UAWJOb7NCE2Cjg4J6fPGSEh6qWRPDkFRwHFEoyyvKgxoh0jkH+q997+aFLtTmfGVLT+9
         A6IKLxvr/CjsEahnatPSZ6D5jFJCm5it2ijdTt3KjZ1YEmKOZ254YDnULBbnGFJG62f8
         6ziIQyvB7l7JYduZ9ZXPaIknT2R39JhiMMpDId4WFprHbPUER7XHcAq4IVd66r2LQdCs
         fNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZiSulLpDJWuscSL8L2vnGag9UcUin0Tqpz1gsAL73nE=;
        b=EXa7F5uOmLTUcWht+3Q4g+y/uteSWeuapxqbBCujYmZthkcH4xJNF0QW/wJAwY18rT
         f18hdSMCrdFQBKdfz9dU8bFt0hSdSKZzfyb4NS/OvYryPjJoK+g8gEjcymtJUKTQTeAb
         /fcOJFAveDE600jXZVZ9i4KtDBuZw2w6zeJsqQFvPSQsZNYzhJHtZLEWiy8R3tyCe80V
         6g7yf3jd7c4sf/QWMAuT0VMt9hvuJHXINookvMXy7CCNDvjRzvW4AXnp2sNmRfUqXzrb
         Fe0ZASFodLopfXQjOE8TR6+JfbSSJQEvdgnu8xq6s6q/LbTK0CwJs1Rlg6qAfPOeQhBC
         WIXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nmx489sU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x66si961118ywe.322.2019.02.11.16.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nmx489sU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58229 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLUa-0002G7-GF
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:00:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0005Mf-FH
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOC-0004YY-DG
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOC-0004OU-49
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:28 -0500
Received: by mail-pl1-x644.google.com with SMTP id s1so324101plp.9
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZiSulLpDJWuscSL8L2vnGag9UcUin0Tqpz1gsAL73nE=;
	b=Nmx489sUIZ/tOt9CFWnQHrRnttkrwSMaTPPip1jmlhaGIm+hZfobkzNfj6uz/e0i/n
	zrS8gpbElcjozzmG8458uUa45IR+Tu/cd2Rsb0qZK993A6zMRfitQqCapFXNLE9ippoB
	G94k/5hReX37JQZG3ac+KsQfL0cSJ47d/E/MTiZNxDAhyYt20jfTpjU3/4cvG79YSfng
	0hdC6cfSrkmAUIboxDlyglV7QPWPGXuHtqvcv1QnE0Hkcqo29S1ySMJB4iKhFWaJytRp
	tOAAK4psMumBTMPRlf9uMoZeludlBAj/0nSezHWNRcueKu+yW42SKjP3FWdFQEtQ4usZ
	Qd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZiSulLpDJWuscSL8L2vnGag9UcUin0Tqpz1gsAL73nE=;
	b=Oyu+Nhr9DvNFP0CAKcI7hGMw5St7Rp2iD/93Eh0IFXpQ42jBbpLlgPTYhC7vOlDBSM
	8nd5TKMkck7LeO1vfXPHhRMf/ImaAsCmUn+oTUnK11XNiI7NL+7bB9w6Jlz3V5xEqtvF
	YQ/0FU/7YS8TOUaJ1zIXp6b/5jFfU5JoQeBu2CTQD7FjyQD9OB4bTw4Dkw/5i9X0Vh9L
	ytKoCoOYs1bM42M70lXMRtEoq3ufb8Euyv8RbUfLq43RKMqmxNzufmzO83qa7U2qGEoJ
	RmQaGDBN0vqMrkSCqUBO3IJhdKfMd4q6oX/hQ0FxxfU2j4lRszYfX7tz8WHyuoH8yPIe
	kcyw==
X-Gm-Message-State: AHQUAua9V/Fei/yoS6MM++xb7soqCz35bGFf6x8D/aj5Wec/wVcAs5tk
	C5NR1NYOwVU7y4854Vo3Lo2S5w==
X-Received: by 2002:a17:902:b681:: with SMTP id
	c1mr916873pls.103.1549929189649; 
	Mon, 11 Feb 2019 15:53:09 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:36 -0800
Message-Id: <20190211235258.542-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v3 06/28] target/arm: Add MTE system registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sklZsF1tFKuf

This is TFSRE0_EL1, TFSR_EL1, TFSR_EL2, TFSR_EL3,
RGSR_EL1, GCR_EL1, GMID_EL1, and PSTATE.TCO.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Add GMID; add access_mte.
---
 target/arm/cpu.h           |  5 +++
 target/arm/internals.h     |  6 ++++
 target/arm/translate.h     | 11 +++++++
 target/arm/helper.c        | 66 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 11 +++++++
 5 files changed, 99 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2776df6981..74633a7a78 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -495,6 +495,11 @@ typedef struct CPUARMState {
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
+#ifdef TARGET_AARCH64
+        uint64_t tfsr_el[4]; /* tfsrel0_el1 is index 0.  */
+        uint64_t gcr_el1;
+        uint64_t rgsr_el1;
+#endif
     } cp15;
 
     struct {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2922324f63..fbfa770c23 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1002,4 +1002,10 @@ static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
     return sctlr != 0;
 }
 
+/*
+ * The log2 of the words in the tag block, for GMID_EL1.BS.
+ * The is the maximum, 256 bytes, which manipulates 64-bits of tags.
+ */
+#define GMID_EL1_BS  6
+
 #endif
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 5a101e1c6d..a24757d3d7 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -204,6 +204,17 @@ static inline TCGv_i32 get_ahp_flag(void)
     return ret;
 }
 
+/* Set bits within PSTATE.  */
+static inline void set_pstate_bits(uint32_t bits)
+{
+    TCGv_i32 p = tcg_temp_new_i32();
+
+    tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
+    tcg_gen_ori_i32(p, p, bits);
+    tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
+    tcg_temp_free_i32(p);
+}
+
 /* Clear bits within PSTATE.  */
 static inline void clear_pstate_bits(uint32_t bits)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cbe3500f78..f8e4e6f8ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5732,6 +5732,69 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, apib_key.hi) },
     REGINFO_SENTINEL
 };
+
+static CPAccessResult access_mte(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 &&
+        arm_feature(env, ARM_FEATURE_EL2) &&
+        !(arm_hcr_el2_eff(env) & HCR_ATA)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 &&
+        arm_feature(env, ARM_FEATURE_EL3) &&
+        !(env->cp15.scr_el3 & SCR_ATA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static uint64_t tco_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_TCO;
+}
+
+static void tco_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
+{
+    env->pstate = (env->pstate & ~PSTATE_TCO) | (val & PSTATE_TCO);
+}
+
+static const ARMCPRegInfo mte_reginfo[] = {
+    { .name = "TFSRE0_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 6, .crm = 6, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[0]) },
+    { .name = "TFSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 6, .crm = 5, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[1]) },
+    { .name = "TFSR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 5, .opc2 = 0,
+      .access = PL2_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[2]) },
+    { .name = "TFSR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 6, .crm = 6, .opc2 = 0,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[3]) },
+    { .name = "RGSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 5,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.rgsr_el1) },
+    { .name = "GCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcr_el1) },
+    { .name = "TCO", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_NO_RAW,
+      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },
+    REGINFO_SENTINEL
+};
 #endif
 
 void register_cp_regs_for_features(ARMCPU *cpu)
@@ -6577,6 +6640,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
+    if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
+        define_arm_cp_regs(cpu, mte_reginfo);
+    }
 #endif
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3950067b79..f397603688 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1666,6 +1666,17 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         s->base.is_jmp = DISAS_UPDATE;
         break;
 
+    case 0x1c: /* TCO */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_TCO);
+        } else {
+            clear_pstate_bits(PSTATE_TCO);
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
-- 
2.17.2

