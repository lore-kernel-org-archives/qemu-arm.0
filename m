Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1343818wrm;
        Thu, 17 Oct 2019 11:52:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLtfG81SEX7np/h9DGDb528pLqiKzlTD1eD+/8x3w/9gu1zG+h21Sh9sqT+TJJNuVtUXpb
X-Received: by 2002:a50:8b45:: with SMTP id l63mr5420716edl.31.1571338334414;
        Thu, 17 Oct 2019 11:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338334; cv=none;
        d=google.com; s=arc-20160816;
        b=qacobYJhGLbQ8mUSo8hfLL7FAcfHNDmzMgUrysCbIlyBW4mR2vzBGSAZ9ixeUiyLq4
         JFRNMDbTv67CUpxp5XvRvc7kJlqZUo80HkF2eoF7GLiWHoewvF6qrFgsZSiX5VkD0LxM
         Z0shdw1bqPpNRmLsx10d5nnTn7/K5yPvbGM/uGX7HD7hLeuSzX1Zpu02CdHoj9WtOSBP
         lJWDSV20ICCI5SQCIeG44V77Jj20lubSZiakoPSWrOewj4kX0pR6MHc/iIFXaJGUSFAF
         xhaqyKoJNOFItwgtVQcHeqxBX8LfnKFMqIbmC73XAKMatixpBdTIAsNnhDQRmOviA+N5
         wkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
        b=ghGps9c4czu+a6RKcAaw00a92LPLoKebC6OZmKYF2wrGEC2akWVvqjSr6ENpvKsRn0
         /qqwJeoW6NyjgqPtigxgmsJYwFW55+aTXDuCVrny0KqdoiSUAWSCtcy6IoshQ1lAqmtN
         o+A0pyl0hmkj1hQ1KLu6R2+adveGrpEmrdEl5kkhXZR07Q2ahUHXmgaZMWS2itVSoASF
         CmAh6LafBOhRWqZ0xk516mVCdZqQnuep70e5RrUhD6K8/U4FfvTT7tjP8+d23WYKcXID
         OEsEBUI/EC3Jfzc+4PvhjX0s0dFlH/uorEmHdifSmTfuBeKeQirBrgL0Z3errn6nxB9a
         boMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWqvcsHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si1850397ejj.47.2019.10.17.11.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWqvcsHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAse-0001b1-3p
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArn-00014K-Vb
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArm-0000qa-LD
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:19 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLArm-0000q9-FC
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:18 -0400
Received: by mail-pg1-x544.google.com with SMTP id r1so1845932pgj.12
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
 b=LWqvcsHxCL65vPcrjAt9j3r+wBkdpmSzYoL2h9szRSUzTBmvhxItK3wEP1Y3hiDrZ4
 Ri2X3uv8zNDoQBF2wYvWWRjDdEm8z2loF8BG5+8wncW2TBgsth+x+JLUT7bi79woGQKX
 qKcnyd1AA+vgf733RPz+rTVtAT1Xso3cMWQX+746L518nQJs60I6w4ypj8k/g8+cRS/C
 dO7VJJQjLbJVJTW2PbLqORcHgmDHeRtD3GGZCQpmiY+4za32dOlg1J621ljLKQNBcy+R
 +nf3DLxCK4HbhTC6HUxLQYm//M2nXNnGuf0JTnDBGhbW2HKw/PgJRowZ8KR+dpjfKEXJ
 gNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wk2rFtSmeyIzF6QnNFgZDZnR49h41R/PQfqDCLolPT8=;
 b=mCxy4LNIUxG4hEbnsUZVsxVAIGW3keBVftneVStiVyXZczhv7iWXve58yyg766ndqs
 cjH7X1gIHhFSiKBzIEGSeI5vc/pM7CgyxVqb1YVVcoJFWlXFAcuU9Btf2E2oBIOEkn3A
 qicBHilyMnua6+75a27j1oM/BTP0sQZgBKzIMIuCG5CjNpcWbfci39w1OYfbscY6FFS/
 4Jyz2LxpxwMqGBpDzP6JCQbQabGWYdUAqJtn8K5dua9/D+4z7i4CxjHBX73sKucWsG/H
 HkoK+ANOxosRoiV7zji1f8zBYlwaK7EjOCAfLvycAtqZpYztLt2ivd3sNd0SaT0SuCwV
 mB3A==
X-Gm-Message-State: APjAAAV8aN7xco0mZMpGjGrbMzoPoTnPjdC+SqkU0Ori6RSYashZeMXb
 +Eik3vUjI5ORXXaTpYLps2G0Fg==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr6168103pjr.4.1571338277438; 
 Thu, 17 Oct 2019 11:51:17 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/20] target/arm: Split arm_cpu_data_is_big_endian
Date: Thu, 17 Oct 2019 11:50:54 -0700
Message-Id: <20191017185110.539-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-TUID: SyMsaY4AaOoV

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

