Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1236774wrm;
        Fri, 18 Oct 2019 10:58:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmsHpY/4v2vxao9yWnBvNrJP5CnFSV8KNxW+zj8NS40HWIw5QFPNK0VsFYiqoTGYafd8BU
X-Received: by 2002:ac8:2f9b:: with SMTP id l27mr11089749qta.218.1571421529668;
        Fri, 18 Oct 2019 10:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421529; cv=none;
        d=google.com; s=arc-20160816;
        b=xNUCWdGD9HsP5FCEMWp/QMYfn9j8SUnidiYPVr/QnQDfx7R0iu03+NxfMSCKY0bCkH
         Mpu+NMTKzzi6/RKGWPX0IIEY2u2++X/om7aW2JlAlIkrUYUBBDkePjwI5xiILXINrPWM
         AtLgPZnACGYBKiX+roMEaHLK83LYIcXL65E2RzfmgkdQvLq+zCwiJI8BEeRaTL7/8uVA
         8LRDDQBBv+ip+zAijPrrpgK7MGYXQ/6g6rQX6odNbW607js1njlx985R5IZNivHECtqi
         vVdoBQlMhSTA9aZgvK6QahN3aEpXFEJuRkf9t7qXdPdxAM8hk+RNMiO6LJDSv7WOErCB
         j2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
        b=nKOMehsnmLKMOsDaCRMWQtStULMiJvRddw20iDTNy+qP2McZCaNtDlKQYDThupc5tr
         Rc/Oevu2j3dRWkc1EiWfV8wmG6v9jeEvpySgolY6KWYTqY5odBSnFBBF7RSemP8JYEay
         3vKwg8NWD2dUjvE6UoR6EDNdiF2JTL+B20TlkmOfHiiWO4A7NP9LBaUB4+Z137wmjor+
         dinWJPFVc2qQ0jQczCtezh0uH/TwpQFnULF9pBuQZJCusYaQBtCm4HlNsXT41tR+2Wnw
         /NiWa+HeZ6D1Ieu2Xxsd6ojiAQs3g9lL90jO7WQoa4ZRpuE+kptetuKATvr+zzItFVM4
         +T7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pan73PhX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28si6171608qta.386.2019.10.18.10.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pan73PhX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWWW-0004KE-RB
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIu-0006Su-AU
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIr-0005OV-Mu
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:44 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIp-0005MN-Lg
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:40 -0400
Received: by mail-pf1-x443.google.com with SMTP id q21so4303166pfn.11
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
 b=pan73PhXQV5z7gdX5CbXBk0Q7XbJeIfWLw5XQZxD1KJU6n0g+opRjZLEB0F1X7qa/K
 N0RwSUbCterjFa2wjt//ev4aC7x0heMSEIswoDQcxozmjtWy26NttRiR60HsWgrWoT/4
 70JHBQg75hYuCGs1vXemUd4v2R0Mzs32ZGzjaX6cXLqXZGlHupex3O/71JX10niXWCxt
 0X2jmhxxuu1xYo0IoUxcCTsMHQIE1FzDA1rVk189BCoFsetkECAg9yH8xZpRHmlQjZcX
 Qd3dcV0uxSlCgQc9/RPDpdDfqOsjyQID+6e1DeApnHxBTZoBvADOvfzyqgnwp/grMV9H
 F6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
 b=HHYzv6xo76RapPpISdkOPLYT4XFWLkdY844SEE+4HMUPPLXzD2fbBWU30ptZFd6ljc
 DS3GEjpUvGv1YBOXIHVtY0Fek75JAwHPClvKIGluaEDAJ40jHjTDhxtN7wrdBqEmiIuQ
 u4JbAWpv1S/0GsBPb8/qRfUfr5LrpUUYlxOJ6PIVcaJJSlvf3P2VeFF1w8lKotcKaH8S
 yo0YTU1xOx96qVdNQF+27DWm3w+TSS8SUCiArDN5+4tE1d44IZc9uxv2rRjRTPAAVElb
 0MRpcgHV5YqaFTXlYMo2RkfZ37i/5X5oGwEoboTDLF0nqRroAhmGQxuuHsWnTJ+EeXMM
 JIvQ==
X-Gm-Message-State: APjAAAWmPVYv/bzxLJoXVXb5Y5tVwoa9ssvdrY0L55IkexTFPOpcb+c6
 3NAlIsb7DM0bosObqj00wk9eP/5iL/8=
X-Received: by 2002:aa7:9156:: with SMTP id 22mr8171150pfi.246.1571420677165; 
 Fri, 18 Oct 2019 10:44:37 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/22] target/arm: Split arm_cpu_data_is_big_endian
Date: Fri, 18 Oct 2019 10:44:13 -0700
Message-Id: <20191018174431.1784-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: BA4+H9l5uvDQ

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

