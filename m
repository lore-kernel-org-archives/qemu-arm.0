Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1024308wrq;
        Wed, 23 Oct 2019 08:15:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdHDpw6vp90mvX4pDataHC1pfeGGWGAT02Ql/CDJMoLbZ+G3zelycrNrupUtZiokRVBBdv
X-Received: by 2002:ac8:1242:: with SMTP id g2mr4125120qtj.141.1571843738361;
        Wed, 23 Oct 2019 08:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571843738; cv=none;
        d=google.com; s=arc-20160816;
        b=AWqo6jFeMD0O8w/K4/IheWPiScyLxBSji1MUrXCWby1iXMihTTivqxakG6FT+SR00/
         6vbEtYq2n6a98pVR7pU3LZp8KTugY/QQ/6h8EVrKCLgdvr0UeGCthDb1uKp5/A9AQCNd
         kNljyKxQENSGDkoQWLtJHzu2RVAep+GlZjmDPLfhSnDHiJAZ4EKcrAq6Lo2LHzK6uxPM
         EvWHXurOzLvVjjkQb1GgCIlMHCOx2owOHV+WxPkLXWfVWL3rUkadh53g4HlxoC6rcFqf
         v/oaklgCA8ItdUwt9qZK4Tv7oYbLIdiCUFaOR5qFKgS3+Q03RECOVfvppVcTaS3tFwWd
         y8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PtanC1h+OlQIbLy4htGIe38tBGV1DOrNspWjSEGlJl4=;
        b=imTsRIrP3eLmN+mNkftGaS7GS9hW9Zg2dW8jFvVAUigfVOL3dXTkBENYbTI+wj9m5Y
         3JASwj6pN3OL0tkVls93senx/IQQuhmtjtSsYacGggA+atVRJC0dhF0x7FEz8ZWex5fG
         AX9YXlDHrcsFC0a4QJzjwzcvYQm6/eelxn1CBhIXcEZRfgUxtCdgA5IpcBaVBFwTGguJ
         hRB5oB28FK+bJJYU8FmZwGyX0k+Lq0CqelCB6qZMJHsUyX/VvPD0IzRNqbSnVJEuK77Z
         CFZAMgBQa6ioKflW6mqzXPG4qXbdjoFV9qmuQWxkAmqR0bv3uSsLXC5i5/Cy6R67npJR
         f/zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gT/PMVO8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f188si19762904qke.235.2019.10.23.08.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gT/PMVO8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIML-0002IB-I8
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8t-00088p-PP
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001Eg-74
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:43 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:37776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8q-00016v-Uz
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qt1-x844.google.com with SMTP id g50so18582856qtb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtanC1h+OlQIbLy4htGIe38tBGV1DOrNspWjSEGlJl4=;
 b=gT/PMVO8fSLBK5v5I57cupb/YDFLU7LxWI80c3PtF3u5wlTT+TCVchjkQFyaZn1DGE
 Y2nM8RAf1Jd0AmRXzNEPMA+HAXGuWCcCl83DNRiwM7eBMCGgc2kuCcyM7gXWSRbiLHBy
 tu9+HqS6PH0QosydLNCCBgA6uhK+P77pOKMyo95P/ioyGUuNKuxanpl8lks+XoyjvnTe
 QzBTJOoBiQ/L4AEj2vNZeaPAhnxfmWA7vhGVqYh+VSdb/9aAcq1yUEr+wiS3uZYHwJk+
 ta0RsfU23frI7derHLkzkrqei4scRqtiwZrUYuLQhwvqKI1hUwfPhHhEFfXEC9s41X0c
 JhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtanC1h+OlQIbLy4htGIe38tBGV1DOrNspWjSEGlJl4=;
 b=fNPAUJ2tnO5X/9stS9WFmdsUV/XkVuMnojoSnLuPesLqdVSykBTwCgmU5hlLOxhPec
 HdblQL6iS2LMdVB+khA9k/iX0tpRsGFtdgDL/E0aedeaeQlDVXoxu/iHAec4TYsLxJAA
 NH0Q72Hixm74jsyA7oRjQ/22qLVEq0R3rTr3+xGAxYoaL101YL5KfozJGrrBgnBSDWSR
 XpMr8SqMBeo/rYDVbL70y/990VzEcPsSAZnFRh/+xWSz2N+5vn+pZbtNshkAXF831NdJ
 hkhKbvlE6wB8XKrat59GMMgQCYbALWduGykvVt9pS5JuSTdesesC3QOfqdDtYdIXRUnR
 3oJQ==
X-Gm-Message-State: APjAAAWs66Yz30PUcVZAFIABz7Txp7XbQ6ROoxFfFQHV7i7xw25oNxy+
 KniokbnPr6vKwBVsBK2UMBYhUurULt8=
X-Received: by 2002:ac8:5547:: with SMTP id o7mr8502758qtr.315.1571842878494; 
 Wed, 23 Oct 2019 08:01:18 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 12/24] target/arm: Add arm_rebuild_hflags
Date: Wed, 23 Oct 2019 11:00:45 -0400
Message-Id: <20191023150057.25731-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HCQRCPSEO8Rd

This function assumes nothing about the current state of the cpu,
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9909ff89d4..d844ea21d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3297,6 +3297,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
         *opaque);
 
+/**
+ * arm_rebuild_hflags:
+ * Rebuild the cached TBFLAGS for arbitrary changed processor state.
+ */
+void arm_rebuild_hflags(CPUARMState *env);
+
 /**
  * aa32_vfp_dreg:
  * Return a pointer to the Dn register within env in 32-bit mode.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 89aa6fd933..85de96d071 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11198,17 +11198,35 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_internal(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+
+    if (is_a64(env)) {
+        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+    } else if (arm_feature(env, ARM_FEATURE_M)) {
+        return rebuild_hflags_m32(env, fp_el, mmu_idx);
+    } else {
+        return rebuild_hflags_a32(env, fp_el, mmu_idx);
+    }
+}
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    env->hflags = rebuild_hflags_internal(env);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    int current_el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, current_el);
     uint32_t flags, pstate_for_ss;
 
+    flags = rebuild_hflags_internal(env);
+
     if (is_a64(env)) {
         *pc = env->pc;
-        flags = rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
@@ -11217,8 +11235,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         *pc = env->regs[15];
 
         if (arm_feature(env, ARM_FEATURE_M)) {
-            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-
             if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
                 FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
                 != env->v7m.secure) {
@@ -11242,8 +11258,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-
             /*
              * Note that XSCALE_CPAR shares bits with VECSTRIDE.
              * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
-- 
2.17.1

