Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2530514wrt;
        Sun, 13 Jan 2019 17:12:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7ZSw0CjQBV25jegOE+zSJI/O+BuiIEDQCPE5FmqFSpYqk/ZpXnhTi0jvECOfkK4WXRe9+R
X-Received: by 2002:adf:a28d:: with SMTP id s13mr23218502wra.100.1547428323820;
        Sun, 13 Jan 2019 17:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428323; cv=none;
        d=google.com; s=arc-20160816;
        b=xuFCnl0meSKDHG+8TNHWab4vw3qfEE8HCOyLOgxt4Vj4dlgwZSpjoJoC1BsVvXie5y
         zbzB+KIK0uZZO2DOU4cZVtKvw7ArtMh8gsYupkhdfWA/YhdPGVvDiOqzQV5mEt7heG2A
         hDGyAYTa/JdKJkgFtm88mVvLcIaHHHUBB2ZPN99m3zu+VEDgHsZ4VX6GPj8yQTFtwffu
         GYwOXnTeC96/9QvT7h5bIaVN8ZbfDcS7TCfZHP2gjvorlNyVYuHinRGMk5kJp8TnBGFn
         83DC1qrdLs8+uhkxul0IZ5b5aLkxlOmPw/mZecHVqtgC/uG7YuhYKHVQUG/nzvDLajmP
         NgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=U6gvtB4GZaUVNgdldGItRCxrxALoLGPnopUyctrDnBA=;
        b=Kcs24mrf1f3qDEUEUYazz0vdIQxOu/zHtvvea+BZSsuSUka8E8fT2ag8K3R3NLwSmv
         Mp/d5WRuduP8SlHPGRWozGs5RkVt3cdUhUyCPL04QYvmBEzJxPfLcJR/8Txi1vd3SWJI
         WiW7QMyMSVZ4GVp4m97ByHKjK79fEMNwP4hr/JabDwnZ0/TbdrJstEpx91QJ8HbkCe8l
         cPs77EpWHuMxlcRU0Y/SJaULqSVBWb2ug5Ibs5kXw6eQyP0LVibrjUgTD5XDqp6Rakn+
         P0Jb23LVGA04FwtNdFhRWzNoRc9/xU3jDx2oPbMvprW1FEmUcKxKH8TR5OAyDPVifSvZ
         uNKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZkLzi6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k132si17872103wmd.106.2019.01.13.17.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:12:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZkLzi6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqnK-0005W8-Ls
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqn2-0005US-2L
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqn1-0000n1-1L
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:44 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40190)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqn0-0000mV-Re
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:42 -0500
Received: by mail-pg1-x541.google.com with SMTP id z10so8735143pgp.7
	for <qemu-arm@nongnu.org>; Sun, 13 Jan 2019 17:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U6gvtB4GZaUVNgdldGItRCxrxALoLGPnopUyctrDnBA=;
	b=LZkLzi6py4+2Uf1bP5l2zbgiqOZmn14PGSQZXkkSDsKebtWnGKXOzFu7AXpQ83f/+s
	9HopvOL5tv4VXDdNrD4O0BJkdrOqCSh7rJNuLbRCFC7o2l+oHz87zc2/KvqoABtTGp1b
	SY9P9wlwbQ5GQwcvww+CHJtz6fnMJvRIlcWFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U6gvtB4GZaUVNgdldGItRCxrxALoLGPnopUyctrDnBA=;
	b=nxqCD1DSBZjYq7CKNHlFqyJB1QRpV/x8CV9WYOpfT3wJ6kBzp9EWcNBuE9fJVIiI3L
	Coum+taYeajXJFdZJ+AUQoIoTHTA7r0HJEEQYwaGGz0Ah0t2NbUyk08qtroLPo2ltMr0
	Yjp67Ycj83S/nbLscYV5WaaJ3N0/yGkFUdYbeaV87BHFd34BHhmPEk0fHssLPs//vdJN
	C5SJkhBFoeX6vHHn2sXN94WV4LW1XWSU1YEiMrD0L8+PNLn6P6fw/lyos+LljL47RvLd
	8Xhgkh6jBr3Cp7Jf1H3Hon+VHU2ifUK8CYuSiTBd0iy0bD9+N2FBMW41zx83EXk0zqfG
	4sAQ==
X-Gm-Message-State: AJcUukdsI5heY4hLW74asbzE+jVOIBhjliKJ4VUfFOWQOFNdVkhRnmuS
	ykdwX7CuyQXJcDB/v3TiuVWiIA==
X-Received: by 2002:a63:9256:: with SMTP id s22mr20518382pgn.224.1547428301751;
	Sun, 13 Jan 2019 17:11:41 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:08 +1100
Message-Id: <20190114011122.5995-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH 03/17] target/arm: Add MTE system registers
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
X-TUID: TRaq8wRiqpwT

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
index 22163c9c3f..c8b447e30a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -482,6 +482,11 @@ typedef struct CPUARMState {
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
index 5a59fc4315..df43deb0f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5132,6 +5132,48 @@ static const ARMCPRegInfo pauth_reginfo[] = {
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
+      .opc0 = 0, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_NO_RAW,
+      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    REGINFO_SENTINEL
+};
 #endif
 
 void register_cp_regs_for_features(ARMCPU *cpu)
@@ -5923,6 +5965,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
+    if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
+        define_arm_cp_regs(cpu, mte_reginfo);
+    }
 #endif
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0286507bae..5c2577a9ac 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1668,6 +1668,17 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
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

