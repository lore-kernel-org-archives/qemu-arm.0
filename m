Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3968035wrv;
        Mon, 5 Aug 2019 06:10:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoW3UJSgh+Icac/0Fq2hx8eNyVqsIgbgYtRHW/2q4yNpVP4h5ocBlwTnO63/09gLu7KzyA
X-Received: by 2002:a17:906:454d:: with SMTP id s13mr119246680ejq.255.1565010608852;
        Mon, 05 Aug 2019 06:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565010608; cv=none;
        d=google.com; s=arc-20160816;
        b=dL02HmXRkcg0MEP/ZAH2iBK/CTf5Z/JXKNLqlMpDTWNhpfM+ATLw8jcUh9BizChsRP
         /ai/MMgG8xK84rt3iwT1cDBUV4IlX2zuWoDddNLkE+x4fhUbojKkJ/ILgHOH60ucCKf8
         vVbU9zc2tFGsalBZvWXavLkSfOsu0ic/M4A3QYy+gsnH4UCb8tDJipsts9hOZhMcKDdW
         Qt9BcPJxwI/sj4lL6ggSpemncjZZKJd7C2jp5kHeIxWP8tUloYbWD3vubaIeM3G6obwl
         kVX2v+HvevWke8SbZ0dmkOYLX/uEbm0axduSkGKR1hSztCB2sCy2DKbTWARObVVk4DdM
         gHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EGU+/MpxT8YGsEWvI+W5cKlSVCq/nVM+/LNMb9QzO4c=;
        b=m0IW/WmcgAHuyPGgzte5RdJUNgguoyhaaoYipqb3jB3O8UFPu1kcVvvQ/4o3RCZHX0
         E9qwF0jic6OPSkpXkErEoGNz183aR7zkUh77qQyau6LVE9ggQMhbGtDpQYEKU8NUDrDU
         TZwgAKM/O1tjs2EIuz42/SxclCm42SNlpqa1JvNQV3MAVLVwmdGDkbW4nX4t25uI/lsF
         bU58/qUYfOYj2vkgFuGjGBwX6L6xgpNXRpaNvaur8BUzuxpeP6Xo/FbTlBAoyBYohrQ1
         v8KGyBeahNUybVdvbUnxIZ4NbMFuddMMhOygK//E/2Rond98jCPorG0wrgAN5t0DD7hs
         FDKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Skq7d1PQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m47si28594656edd.144.2019.08.05.06.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 06:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Skq7d1PQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1huckZ-0000g6-TY
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 09:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1huckR-0000ZZ-Tb
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:10:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1huckQ-00048q-8f
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:59 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1huckQ-000486-2o
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id y4so84376570wrm.2
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EGU+/MpxT8YGsEWvI+W5cKlSVCq/nVM+/LNMb9QzO4c=;
 b=Skq7d1PQQKXxFfH2kBZuqrlsKs2tQBGi3UzIQBCmxL67trB3L7Vk26REcFp7wkj1Dd
 rXBhaaHOYFtjnCEiYv/6JOeo/cnMxX89KCrMKy+yXypK8dDMdk3ohpwjlBcVDrU2nAVG
 NHCmJft3LidBo8Y7lAcuMoxYSWKdoQhhMljJFfTrGY428O8ywENkxrhSB4IwVaAGvLGx
 hagIdEQ8DM4xNPXD3Kw9IssVdLlTeB69IWiSR24Ak4fht072PqcAEAWdamZ6+T9UvyYA
 h80S5IlHdlsNo/QnJeIcpKDphmsO2u4R4oOX2oIcwQIwsOgf9r34ote8wU90nu4+Wu9k
 o0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EGU+/MpxT8YGsEWvI+W5cKlSVCq/nVM+/LNMb9QzO4c=;
 b=qZT8uRRm0hlCJepdJU10WCeXBfIncZgGL3rSKQq/S4FI+OYENc0a8i3WojBVrZVeDN
 0yVZVdWyD7nIuV/epGTvtOE8L3StnCPIsV87DS1ayTg5i27rSuwMdhcnRq02ocz17ku5
 mqGPe6b73c4z1rtPv7WjsMboYCBtrD8vPOVhRyfxlv9kwq3H09DUoqKc6niDb3bU5b7t
 f5f7n1jTAbOH5yjoQiT6JlacApeWWmcdLqaU8UHr6I/v7RUIFtDSuj9J947O1RI3rldC
 2dL57AIJXRpZhusVfbIWjZawCWd4StQ0l0ZzbwgEDrzX9QxAZLmm5i5707Qqj7vYFzpw
 Wawg==
X-Gm-Message-State: APjAAAVw13xZU4hBf+pFgqLybUc9dhhtAm7JV6tdRNG/MseMU0M5RUJE
 zU6JOjYWchnbm6O7PTTQFOHg3BTUaUomvQ==
X-Received: by 2002:adf:df10:: with SMTP id
 y16mr140679568wrl.302.1565010596914; 
 Mon, 05 Aug 2019 06:09:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x20sm65233782wmc.1.2019.08.05.06.09.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:09:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 14:09:52 +0100
Message-Id: <20190805130952.4415-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805130952.4415-1-peter.maydell@linaro.org>
References: <20190805130952.4415-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 2/2] target/arm: Fix routing of singlestep
 exceptions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HvmH0EQr0DNu

When generating an architectural single-step exception we were
routing it to the "default exception level", which is to say
the same exception level we execute at except that EL0 exceptions
go to EL1. This is incorrect because the debug exception level
can be configured by the guest for situations such as single
stepping of EL0 and EL1 code by EL2.

We have to track the target debug exception level in the TB
flags, because it is dependent on CPU state like HCR_EL2.TGE
and MDCR_EL2.TDE. (That we were previously calling the
arm_debug_target_el() function to determine dc->ss_same_el
is itself a bug, though one that would only have manifested
as incorrect syndrome information.) Since we are out of TB
flag bits unless we want to expand into the cs_base field,
we share some bits with the M-profile only HANDLER and
STACKCHECK bits, since only A-profile has this singlestep.

Fixes: https://bugs.launchpad.net/qemu/+bug/1838913
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In theory it would be possible to use just a single TB flag
bit, because other than the route_to_el2 bool, all the
state arm_debug_target_el() checks is either constant or
known from other TB flags. But I think trying to do this
would be pretty hard to maintain and might well break
anyway with future architectural changes.

Slightly less painfully we could reclaim the existing
TBFLAG_ANY_SS_ACTIVE, since the debug target EL can't
be 0 and is irrelevant if SS is not active, so we
could arrange for SS_ACTIVE to be DEBUG_TARGET_EL == 0.
But we're going to have to overspill into cs_base pretty
soon anyway so I'm not too keen on being very stingy with
the current flags word at the expense of maintainability.
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate.h     | 15 +++++++++++----
 target/arm/helper.c        |  6 ++++++
 target/arm/translate-a64.c |  2 +-
 target/arm/translate.c     |  4 +++-
 5 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94c990cddbd..23ca6c79144 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3142,6 +3142,11 @@ FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
 FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
+/*
+ * For A-profile only, target EL for debug exceptions.
+ * Note that this overlaps with the M-profile-only HANDLER and STACKCHECK bits.
+ */
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
 
 /* Bit usage when in AArch32 state: */
 FIELD(TBFLAG_A32, THUMB, 0, 1)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 45053190baa..b65954c669b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -50,6 +50,8 @@ typedef struct DisasContext {
     uint32_t svc_imm;
     int aarch64;
     int current_el;
+    /* Debug target exception level for single-step exceptions */
+    int debug_target_el;
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
     /* Because unallocated encodings generate different exception syndrome
@@ -70,8 +72,6 @@ typedef struct DisasContext {
      * ie A64 LDX*, LDAX*, A32/T32 LDREX*, LDAEX*.
      */
     bool is_ldex;
-    /* True if a single-step exception will be taken to the current EL */
-    bool ss_same_el;
     /* True if v8.3-PAuth is active.  */
     bool pauth_active;
     /* True with v8.5-BTI and SCTLR_ELx.BT* set.  */
@@ -251,8 +251,15 @@ static inline void gen_exception(int excp, uint32_t syndrome,
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
-    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, isv, ex),
-                  default_exception_el(s));
+    bool same_el = (s->debug_target_el == s->current_el);
+
+    /*
+     * If singlestep is targeting a lower EL than the current one,
+     * then s->ss_active must be false and we can never get here.
+     */
+    assert(s->debug_target_el >= s->current_el);
+
+    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_target_el);
 }
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b74c23a9bc0..24806c16ca2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11170,6 +11170,12 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
+    if (!arm_feature(env, ARM_FEATURE_M)) {
+        int target_el = arm_debug_target_el(env);
+
+        flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL, target_el);
+    }
+
     *pflags = flags;
     *cs_base = 0;
 }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f6729b96fd0..90850eadc1b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14180,7 +14180,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
     dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
     dc->is_ldex = false;
-    dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
+    dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 19b9d8f2725..b32508cd2f9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11882,7 +11882,9 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
     dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
     dc->is_ldex = false;
-    dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
+    if (!arm_feature(env, ARM_FEATURE_M)) {
+        dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
+    }
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
 
-- 
2.20.1

