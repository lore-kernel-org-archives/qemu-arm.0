Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1034734wrq;
        Wed, 23 Oct 2019 08:23:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxH3teRI9CrDMqVWly3IJMYarXJGazusKvWs+Q2RX4+uUzH+mQba+IW3Gdd+6MabO0/rx9T
X-Received: by 2002:a05:6402:1548:: with SMTP id p8mr37974785edx.43.1571844234835;
        Wed, 23 Oct 2019 08:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844234; cv=none;
        d=google.com; s=arc-20160816;
        b=jjOn/uO1i1kPUKz63/bLDq3WZTK/Xmy/c7trVJfbT/o033ZrGdi7Sfy7FnfUzoMOOS
         O7kUchI6ts8oONrHppKxoJ7FPdFeuK5qym5sQ6sB25jMFioroKoqBpokKJ7WIZAg+RT+
         uZll004C5CEjXro/I9zJw/Pa2i53GR3rHrf8gIDkX9WmE0kKSk62I5yD+tQ+lIJ5DAEz
         AuPn6y8KazxBcjEoui9dg5vfZN4k0H/sCFIaTNMmst1beUp74risntv7G35mNG0uom0y
         WCQwt1VgGrTenKP30O/ipaG7uEdn8ZKeujEVgtGFIfShQcC9OSj4FLfSKzfx8kexONPZ
         sSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
        b=iWO9bAqM/LzOqVjZ1ubh7MRNw6N8AtzZsoMzpnNYzCocYeR7t3dzooz1q05kwyV9iX
         5BRz9nd7MoXEURkdQi74U8lM+rsxj+HPWJ3EydrBPGgHjXAJup0GdaXo1RG1m7vdxSH1
         aHKyotgHjjfwk1lEDw48r5iyV9mx/xtycauo/6xfdhMm3//DdS7r6iJRZDVUuk3c4gUB
         f0bmge+t/DXj1TloxJZcCorkFcS/5cfookaW/vxGd09T+Of3eEWzRX/edjGlBOUmIxhS
         JnppPpRYNpBFizPxS6RBZAfBMBp3IIMLPk94AV8nUoe3TnMDGdvnU/ga1efd0yh96/Am
         vIYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1Xi4wHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si12660494eje.331.2019.10.23.08.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1Xi4wHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIUL-00010t-7f
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-00086o-C5
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8q-0001DW-M0
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:38194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8o-00010c-Jg
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:38 -0400
Received: by mail-qk1-x742.google.com with SMTP id p4so20045482qkf.5
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
 b=m1Xi4wHUB/rzh8DpWQCx77XUam/NZg86g5fXAVetykgByxXTBaAFPeQ1uAMWCy4Hmd
 /OZppLkfuU0wTbUAXtwcsbfhXndK6buDKQ5bRcH4xM7SRB2p0lfMdnjVJ5aUPY8novNs
 6OsJAGTfu+X1KkUYf11KhXS4LkTWU6baMUESKtzszMJVLT4CHnTZex/TmF7EQoRpbdmi
 sx5vCXuCndE2PWMfRXBJOwpnaqJti4Z3Ij7tGnvNn9HXdhKzaBDtTQTNWI23xhaJA4CP
 GQ6wbDn4avRbHN/tfGsXUqX/fcQp2jKnLG5BLQAi2fZ4lszGdkCUjZ3BbW4s6LIS39j5
 FtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
 b=lPGiCBwC3xyws8QGU/8aPLT+i6jdGpfnJzwrmydOzka9Cj4cOKKPGlKfwGr7Uei599
 qINuqB5EWkxdVnzwBebpgc3l0xZaz515Eyl7A24TsNR95HRZxdW563XbBKc4W5VV5DGC
 A24U4tIwhSGWT/Ry0JUVcpEaTaeVVS71sKNHqGayBB24qM5znGSD7ydUN9RqilxS/ocS
 Q2JPT7ffQjA4CBqMWmBTJQgMMbgJqgAwDaXY36BOB3rFsvIn8wvWbJnqB/wr2oCA0Ul5
 hFCjMFjYJc9Qs1DhsFcF0ye4l5KFAj+ddcZoEdICxO17swNwk6hwXCp9FVhG6Jt6B9jE
 G8Iw==
X-Gm-Message-State: APjAAAXfFvBoxUUzApGEvrgHewCwzcd/92ZXKHkT9OVoQ6s+gu8HAZc6
 h4mFDPy41Zs9IXIZgI74EwBQHA==
X-Received: by 2002:a37:93c4:: with SMTP id v187mr9021367qkd.490.1571842867655; 
 Wed, 23 Oct 2019 08:01:07 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/24] target/arm: Split arm_cpu_data_is_big_endian
Date: Wed, 23 Oct 2019 11:00:37 -0400
Message-Id: <20191023150057.25731-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3QheKts/Wya+

Set TBFLAG_ANY.BE_DATA in rebuild_hflags_common_32 and
rebuild_hflags_a64 instead of rebuild_hflags_common, where we do
not need to re-test is_a64() nor re-compute the various inputs.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 49 +++++++++++++++++++++++++++------------------
 target/arm/helper.c | 16 +++++++++++----
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ad79a6153b..4d961474ce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3108,33 +3108,44 @@ static inline uint64_t arm_sctlr(CPUARMState *env, int el)
     }
 }
 
+static inline bool arm_cpu_data_is_big_endian_a32(CPUARMState *env,
+                                                  bool sctlr_b)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+     * In system mode, BE32 is modelled in line with the
+     * architecture (as word-invariant big-endianness), where loads
+     * and stores are done little endian but from addresses which
+     * are adjusted by XORing with the appropriate constant. So the
+     * endianness to use for the raw data access is not affected by
+     * SCTLR.B.
+     * In user mode, however, we model BE32 as byte-invariant
+     * big-endianness (because user-only code cannot tell the
+     * difference), and so we need to use a data access endianness
+     * that depends on SCTLR.B.
+     */
+    if (sctlr_b) {
+        return true;
+    }
+#endif
+    /* In 32bit endianness is determined by looking at CPSR's E bit */
+    return env->uncached_cpsr & CPSR_E;
+}
+
+static inline bool arm_cpu_data_is_big_endian_a64(int el, uint64_t sctlr)
+{
+    return sctlr & (el ? SCTLR_EE : SCTLR_E0E);
+}
 
 /* Return true if the processor is in big-endian mode. */
 static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
 {
-    /* In 32bit endianness is determined by looking at CPSR's E bit */
     if (!is_a64(env)) {
-        return
-#ifdef CONFIG_USER_ONLY
-            /* In system mode, BE32 is modelled in line with the
-             * architecture (as word-invariant big-endianness), where loads
-             * and stores are done little endian but from addresses which
-             * are adjusted by XORing with the appropriate constant. So the
-             * endianness to use for the raw data access is not affected by
-             * SCTLR.B.
-             * In user mode, however, we model BE32 as byte-invariant
-             * big-endianness (because user-only code cannot tell the
-             * difference), and so we need to use a data access endianness
-             * that depends on SCTLR.B.
-             */
-            arm_sctlr_b(env) ||
-#endif
-                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
+        return arm_cpu_data_is_big_endian_a32(env, arm_sctlr_b(env));
     } else {
         int cur_el = arm_current_el(env);
         uint64_t sctlr = arm_sctlr(env, cur_el);
-
-        return (sctlr & (cur_el ? SCTLR_EE : SCTLR_E0E)) != 0;
+        return arm_cpu_data_is_big_endian_a64(cur_el, sctlr);
     }
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f05d042474..4c65476d93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11061,9 +11061,6 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
                        arm_to_core_mmu_idx(mmu_idx));
 
-    if (arm_cpu_data_is_big_endian(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
-    }
     if (arm_singlestep_active(env)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
     }
@@ -11073,7 +11070,14 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
 static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
                                          ARMMMUIdx mmu_idx, uint32_t flags)
 {
-    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    bool sctlr_b = arm_sctlr_b(env);
+
+    if (sctlr_b) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
+    }
+    if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+    }
     flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
@@ -11122,6 +11126,10 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = arm_sctlr(env, el);
 
+    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+    }
+
     if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
         /*
          * In order to save space in flags, we record only whether
-- 
2.17.1

