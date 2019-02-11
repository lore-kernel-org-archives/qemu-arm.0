Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1942447wrq;
        Sun, 10 Feb 2019 17:09:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia9JKGn+Yljdsi0tQ8Vur3krPlJpq+AfGqo2YIJzV7qw1fS88qCfayEtVvkvloymWbO6VIR
X-Received: by 2002:adf:eb85:: with SMTP id t5mr14063184wrn.157.1549847394298;
        Sun, 10 Feb 2019 17:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847394; cv=none;
        d=google.com; s=arc-20160816;
        b=PIq2iQQKdbM95oP8CN3qxRQS0FZkLK6izc3UNmlnQYfy6d79cVsXErJfcZoRBdOvsD
         YgBKUZ7At8uHbavMjHGu/eg7nVtBbJQQaoPzqCIA/RNyIhK64rKWTVbz2JXuFuQyyHiv
         vC+Aeu8HzrK1k5XD01kmwpDzjOQKeAToZ3K4b6xtnslS3Fty38rrV3XiEfKPiwCTdhw2
         ysbi5Bfje4ATt+LoC4FmxsAJH4pwDOLb23TSCMbgxmyI+MwLjJOqCK+3x1Pi/z7/oOAu
         iuXkB1ZDiUFCI681KApwJ0cvMalWKoVoal1a23ycYpHAOZj2ZgOQEC6XGT9u205j2NXb
         ddXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EkQDtq1xSIGU1XROXRBBDpDZ5vELkcoeXfK8fEl97xA=;
        b=peUuqmKhYTaXyboxoYuPWwrjmloBTrt32FF6UXZR2NOciehncn/ahlY0550jejGFKS
         28VPCO8Om4uA8EyvE9UsdsRzs3CKf3KTOBBtyiP8o2VqCwg1h7WVmlXZbrU6cZgABWv7
         CF20AqdhPTdhIqRFQl73uuHYxgwZu0sVB5Olo8jSqjOlF8AxbWRsl3ykyFAIXAjZA8Ss
         V5liHk//VOvBtdq5Dm4nrK08fTYgiOBQwbpgW3DpKcjDr4qNK8pvTzSl1wDuNfyj9AHm
         AWc1aj6/EJMDh7N2FkYfSgMNCUwiplWfr5MjEUHNt6AgKgEszq12VnShD+rd4H0C/qk3
         5LOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGdu+rT5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 60si8265848wrm.369.2019.02.10.17.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGdu+rT5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt06b-0006Ci-79
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0005eY-3m
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05g-0008Ks-98
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05d-00084f-3B
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:55 -0500
Received: by mail-pl1-x644.google.com with SMTP id f90so4270496plb.10
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EkQDtq1xSIGU1XROXRBBDpDZ5vELkcoeXfK8fEl97xA=;
	b=XGdu+rT5c+sQC5EaiIx2SL8bIfqzBCHpC502b9FR+2GlFrTaCZ4vShU+2Og6FJk2fU
	V2FjZauGmz0K9gXbe8nC7dJUsYPo/a90gxBCnHBxnMqymY29+TeZ8wrahAAgFN6rFByc
	FGEALc6IZ73OZ/bLvzMjFCB5IV08Ss3tIc6DZkZWFOp+OUTQLs5DDcZEWskt3exAOie8
	V6MflrDSg/GDqyVJebGnYW/iWemYiwIY2DImTVWhax9pt+CxoNvKLBBr9Ge6lujzZi3F
	PXOKOFUB0lrxYeU56wsSboAX530Ym0RwMOgpUhUU9kmMDFOoXR3/fyV8G6cnVcNh9dn6
	ohjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EkQDtq1xSIGU1XROXRBBDpDZ5vELkcoeXfK8fEl97xA=;
	b=KiRGriGV7OjCwU5KUE7RY+ItGymRdey5Ajzm3s/4ZcptRF326bSjzrJr6QEhxKdV9l
	pnl69BwHx00PShRESh7pbMgc+xiQTW1rVz4bZDvR046uPxkgJ29ZaNcrVI/XNpFWAHkn
	+GIORucTRV023IEWhYPhNjULCHnXrLS4DCq/Z4gKegTFHL2mPbsbiPAZ6Lzvfsi15sN9
	IDaj1IGn8N5LcoIwY483W2n+tY7VRuOUPcg2eoMpJs9LoWq+9ZDkLdfKsP9B3QQ/Atx2
	iAlDoY3qtqkRufmPv9uQXK+2oKzbeVmrFSObPm/HvNtfveWgWZ99iuTxrFdLWNyinuqZ
	ZXTg==
X-Gm-Message-State: AHQUAuav0Bcub6liWNhrXDvAiOSAxnfDfyVjR3KEqJKQ9o+zd3qonFdt
	6Qdvm5cCuDO1TqQ6GUuqUqXIpQlKkCk=
X-Received: by 2002:a17:902:112c:: with SMTP id
	d41mr33972748pla.144.1549847319697; 
	Sun, 10 Feb 2019 17:08:39 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:09 -0800
Message-Id: <20190211010829.29869-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v2 06/26] target/arm: Add MTE system registers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qmeyQpjdbwjT

This is TFSRE0_EL1, TFSR_EL1, TFSR_EL2, TFSR_EL3,
RGSR_EL1, GCR_EL1, and PSTATE.TCO.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate.h     | 11 ++++++++++
 target/arm/helper.c        | 45 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 11 ++++++++++
 4 files changed, 72 insertions(+)

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
index cbe3500f78..2d9c070bb3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5732,6 +5732,48 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, apib_key.hi) },
     REGINFO_SENTINEL
 };
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
+      .access = PL1_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[0]) },
+    { .name = "TFSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 6, .crm = 5, .opc2 = 0,
+      .access = PL1_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[1]) },
+    { .name = "TFSR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 5, .opc2 = 0,
+      .access = PL2_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[2]) },
+    { .name = "TFSR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 6, .crm = 6, .opc2 = 0,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[3]) },
+    { .name = "RGSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 5,
+      .access = PL1_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.rgsr_el1) },
+    { .name = "GCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 6,
+      .access = PL1_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcr_el1) },
+    { .name = "TCO", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_NO_RAW,
+      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    REGINFO_SENTINEL
+};
 #endif
 
 void register_cp_regs_for_features(ARMCPU *cpu)
@@ -6577,6 +6619,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
+    if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
+        define_arm_cp_regs(cpu, mte_reginfo);
+    }
 #endif
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e782a0e579..8e9f40f2a6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1672,6 +1672,17 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
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

