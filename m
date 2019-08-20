Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4458173wrs;
        Tue, 20 Aug 2019 14:11:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwepBm/OXTyfylcBxRG/cDnNnEbiULRxTiUdDDskzRcvaT5s6ti9lKe8eYo8ZMiOcZrysEy
X-Received: by 2002:aa7:d8d5:: with SMTP id k21mr33126707eds.167.1566335466982;
        Tue, 20 Aug 2019 14:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566335466; cv=none;
        d=google.com; s=arc-20160816;
        b=LbT964fcmlu9q2RN9EiE4zhmfVzb5mLdO5icpc/WZR35TqnI6ARCVnp/yYz0G+z/Mu
         xvQ4tYga6VKHG1L4rdYkKT/ou08eoDfB3G9Odz8H3dgpm830vA/v4Xony9UIx1HSYp40
         nfEnQ2pqvoAGqGMnJvxxkpEwsfSGMOdeJrShu+SmWCf7rz6giZ6GfNfwivO+cuUJur31
         ixvsD5rs5tLd8fjPaJn8digW77SjOduLPWF2hsu0rnIleYCqVRXipplTyvTnkzpzu4Oz
         Ustr/9gpSF197d85yXtbSKH3Js1qSTAGAvCr8U38ci+632/h4pv7Nww0in/ALvY5HX1h
         PQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=OwNfnh1sHVV11pbivoEAA9XWKfCqVu4eJ/dxTMaKEyM=;
        b=Dcw+cilylDlS5gMubboWcEjieqFluvHQkWgqt0GRMEi32YOPmSsW+mr4o6sPr100N2
         A7OGQ4T6mfDvnV+m16rbDUS2dLtVBiRNnDAxG6cCN1XEKu+fG739Cq6Oh7zygqwS0OLo
         fgnG7jVF/mvcASuw3Ho1ooM/FgZHvR647iLTgGNGbdRJoGT28XWvgF6kj/d+ZL/XBUSs
         vlF1/NE46PM8vjGIebP9Oqw5qNnycc/BNWL9SQJRB+Spx1mDXiCpBxmfLVQSjSaf0b3N
         SQlRUajHQggsHEXps4RxPMVsj+oUqlHxBwDkUZHroAC9e+uY3A4AxlCdIyvbgXAT09Cx
         emLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xu4zyEif;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bo4si3426009ejb.162.2019.08.20.14.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xu4zyEif;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BPF-000314-9I
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLr-0000Gb-3f
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLn-0008QA-KY
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:33 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLl-0008OD-P1
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:30 -0400
Received: by mail-pf1-x442.google.com with SMTP id 129so4112882pfa.4
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 14:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OwNfnh1sHVV11pbivoEAA9XWKfCqVu4eJ/dxTMaKEyM=;
 b=xu4zyEifir0nm0LpEl9CD5PgFX+yVrYbk7X+Huxu/l06wzEnNL8f1n1YLevlfTRQcD
 aakMzoIyTEM+Wiz++lYMu1tLfrBxsu9EJS+o7E2kuJdVodZryfhq9l29sUNG1xawpPLg
 C6XIuL8M1xnWwYRa9icITpEZmuH6wsdLmwZvoZSilZwSJcBqSEYr726HjAxrQjx29WZp
 C1ojDx8JC4dy+Dl6Xrb1QE413/bbwWEhgUHxQtiqN/+jlmmToYUp8e4SPj294OPxpGWF
 S6+5sRS5cleHeqDDK6dB2r81EnGbVC6Q5VY+7X5h+cZpka2jbGSTMl6PLN/ycC6u3H2B
 bAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OwNfnh1sHVV11pbivoEAA9XWKfCqVu4eJ/dxTMaKEyM=;
 b=g1HRgLUGLhVVQA5vNZgxss/QWjGahZVF55p6CXkldUqFnCIkIFJJN4RBOiZaObzJ3a
 GQ8RQSfK74MwiQu2gTHkLgOr0HrTb+xf6lJNTi911CdzBOXMJogfFIGrWF7J1SpY9hJU
 C0UPQy6vWUudmrwJoquPrgM4v1o4nF59BYgi7JiwtVNFFjnVNhfHmKgFJcgzZVnhYcN5
 SDQF4Q+o65tKtzeg7ba69St5YAbRrbLzuEX4h070lXiVgdGPb3WQTTRPx0vk4dhcsCLq
 +PTvDCJ+Q+wHjKayVQEG3ta7v3fIXnQAfnIEeRxbiJNX3slRAjXZBgGPJZgmBEK67ew1
 C5Hg==
X-Gm-Message-State: APjAAAXs1sQ5z5gJaaSCRdBTUA+hhJdd/z2JTNmCDBU0A2iuEyH7Q2Y/
 C2FBVodSUpTrp7xzqfVbTMx6xk5bhWA=
X-Received: by 2002:a63:dc4f:: with SMTP id f15mr26768692pgj.227.1566335248245; 
 Tue, 20 Aug 2019 14:07:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:07 -0700
Message-Id: <20190820210720.18976-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v5 04/17] target/arm: Split
 arm_cpu_data_is_big_endian
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
X-TUID: VUEHtx7N731S

Set TBFLAG_ANY.BE_DATA in rebuild_hflags_common_32 and
rebuild_hflags_a64 instead of rebuild_hflags_common, where we do
not need to re-test is_a64() nor re-compute the various inputs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 49 +++++++++++++++++++++++++++------------------
 target/arm/helper.c | 16 +++++++++++----
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3dc52c032b..5dec4d3b3a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3104,33 +3104,44 @@ static inline uint64_t arm_sctlr(CPUARMState *env, int el)
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
index 1844c13a19..6570d7e195 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11023,9 +11023,6 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
                        arm_to_core_mmu_idx(mmu_idx));
 
-    if (arm_cpu_data_is_big_endian(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
-    }
     if (arm_singlestep_active(env)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
     }
@@ -11035,7 +11032,14 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
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
@@ -11084,6 +11088,10 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
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

