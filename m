Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1015435wrm;
        Fri, 11 Oct 2019 08:58:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwr09zZI+Kr8MnyG1dASumpipXpcBeXRU25fuH44la+vG32w6e8TEnc/YWST1b41TbpIfCu
X-Received: by 2002:a17:906:1342:: with SMTP id x2mr14470737ejb.304.1570809523027;
        Fri, 11 Oct 2019 08:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809523; cv=none;
        d=google.com; s=arc-20160816;
        b=hsNSlP0i77Mc0pka+TjR2YdhmTY/Za17aTo/JRz13j2+UFX49q7ToNpBnR23bGW0bX
         BL8Hb/LecMOYWudjwilWpqawSvQVCWgfBRBVUAXdfXxUx4PqDLLVnwHkk5cROAfWUklL
         3rEfhKb/ZEyc6aaeSmKv4F0oD+y3ZciYOdP4A3IeDosfEVCEw69okc5FPLnHOolRrSWx
         bQijB9rhn/ddPIrNodr9pvg+z5dP8vNXN70D7nAZKTVL91OuYQLOsR9oEBI6sPRs/aDW
         iVEZYcB5jY75e2qIkV/bnlnT6/ysMAth3g3p48L7yN1wJbVkwwdWX5un1AcTNVBmDTxm
         nv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=X98g4BsONciVZ3hWGnQlafESmVIuzpNrlu/v750SDKY=;
        b=XStQ0GXlzrce8BxOZDg605FpNNYADmnkTmkGVzVTxSgiOPMFkIm0KTlF1PpcMTr3W7
         TjeAGyRdZhdwH4+kKekjrJGEdsrkPCxCiN6VMSsAUYwpLxS4+868XD/KhTezum0Rj+p6
         GLk77eSzA+52DccQdnhTrYMsT/qjdhXcdqUjav3DFXYWJfxLDlUABZaGjMxU+37x29Mb
         rPa0L19SmW1Hx52Qm1LOrjmgI409LPV9KHvEKVbUTVnOgt6HiQJ+WC+46DSiGGdKSjBf
         YQkY7YlBUObw8wFheOuZzhh/RCR3CUaJ7Y47kgsVGwQQnn6WJvVOY7A30Hm8hTLJvCUH
         kX6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wS7Ogpgp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si5563901ejs.415.2019.10.11.08.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wS7Ogpgp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxJR-0006ry-Qg
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33573)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGk-0002F7-KJ
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGj-0007a5-CI
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:54 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:40315)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGj-0007Zg-82
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:53 -0400
Received: by mail-yw1-xc43.google.com with SMTP id e205so3645710ywc.7
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X98g4BsONciVZ3hWGnQlafESmVIuzpNrlu/v750SDKY=;
 b=wS7Ogpgplyc/4NSq2H5jSIQ8GdEEb1rDD02/9GzuYtvMVQeSdl4pXR3/jGAPWVU1gR
 ghg/yN6wHmcIi2M22DUUZ0vRxmWFoJyw8hi3wRMnJLqedGOHyj6Jfc1mfPaOIv7PtPR1
 Eg49nnnObo7euxACvyhZYNMZnuvwu1JCTlwIY1d+yrypdV68xxhW8EmgK/VcQn4ukz6B
 rig6enWoDt6W4u01vShVXT7srNViCxlw7x1YM1SMx/fv+jorW9GHeAM4+ZBsOjOjASIo
 xRFwTkl4JaXq6lXOofB51gOn8OBl+DNCRvw5d6aktgbmAG9i47TnrnOnmI+VGe/7HqV6
 MIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X98g4BsONciVZ3hWGnQlafESmVIuzpNrlu/v750SDKY=;
 b=BjjIYU/YDPlGjUSM0Urr35M5XfVie9KpeYXex2nXw4/EKftk9dd1BYgT8dA1208FN8
 ef7BLU4RaYBfGS/lhW6cOMbeNKrdaf5rl7G38ZEAYIbG1Cgmcy4AYdn6Ewo1MEdiYl2c
 89Yjs7XOg/vjmX7qv/wQCE/iV8nO7bmVvosUMDLloZd0YhOQKXFQ+l9tDpp86jbbZc9J
 JvF3y//+kVxiO1ekugxco/eRb6A7d5I4ix7su0meZkumnkU0YQxIF2bOQCnGyaIURWO+
 q4er58GXGneMqeCULER4u26e04W0w9/ssIosyDtf4aoP3fdQ1rleNySxwp2dxf0Tm4qw
 /JTg==
X-Gm-Message-State: APjAAAVgGcQGjSyUCCPI3vRJfKg4WRUzXNO1DixIEN95hbkHGLg2KoSB
 CwfRHetOtFVzYV3e5atlPTi1BOGKOhc=
X-Received: by 2002:a81:8282:: with SMTP id s124mr2993235ywf.498.1570809352608; 
 Fri, 11 Oct 2019 08:55:52 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/20] target/arm: Split arm_cpu_data_is_big_endian
Date: Fri, 11 Oct 2019 11:55:30 -0400
Message-Id: <20191011155546.14342-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wzUpcEI8fGG9

Set TBFLAG_ANY.BE_DATA in rebuild_hflags_common_32 and
rebuild_hflags_a64 instead of rebuild_hflags_common, where we do
not need to re-test is_a64() nor re-compute the various inputs.

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

