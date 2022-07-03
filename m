Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2439215lft;
        Sun, 3 Jul 2022 01:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vD28cIyhJ1WDkoLRn7pTr/80HByfwaxkvDX1168swvJJGgNZ3HMl+UK7DjPOnd9HZj7IZt
X-Received: by 2002:a81:2f4c:0:b0:31c:2bee:dfa4 with SMTP id v73-20020a812f4c000000b0031c2beedfa4mr25108196ywv.483.1656837703702;
        Sun, 03 Jul 2022 01:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837703; cv=none;
        d=google.com; s=arc-20160816;
        b=BdISz9xEgoNEGpJwGeua08y2DyhVccMKx2pHjTij6Y7hh5iU+3QL53Xa6laO6sjCcn
         J+JtlomvYBYRvfHFAjMaw/81ld4EmNv+gHuEVtXkrLqcXog5rZrgRv35jjOICltXcveK
         EwDRhauE6YQVZ5kqLfsL+I1/dU9UHC3txqtYwuGq14v9uvfy4pPriWJSTlizSbkCgYlw
         tBK7EjRy0YHuVeuGOtNkG2NdPRPwcNnZzVdErEQSJo2O11X+6h4Hib64hUjEM0N/smnr
         kQULXgavTwHrUEMB1IDJqmuRpLmtCBLgCgzv2qQMFiI4c6+FGhCU6pMBEmHfwwFSB2zP
         AKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EzCzj0W0FC9zsZchyEyMQYjih3KhzZw2NYS2mL3V7Bc=;
        b=aiRahMdlSmbHaFFCZ8P5Nle5fuzJPD9X+3/tKw1+gHIpXeFH3isg0iKvH9gFcH8Rdc
         0D9nexcV9Q+t6rM6lBpGt5HXXu2pv+81U5p1blnsdUFL8PWDFWVT++WnRTZXImOpBDNM
         /9K7pht9CceajemrXjK7TbjbemmsWMCtI6flyXTypynFUIIETRN0lh0ozYuHv8En/E9P
         11V5oMBCvjg1L2oYQSFwxAmrFOlFJ8eAzCMunGv5X1yd8NowhLxA+EaNgAY28bFzM0+N
         SRzLpxjarJbFV6zB/vbGAya+/JcOELpZ/g+5vn0f8Xs5Vq1A4a8IbHcBfy9o7lsQBTU2
         JnKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pxBuHiZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y139-20020a253291000000b0066e23208492si5168510yby.562.2022.07.03.01.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pxBuHiZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vAl-0002bb-2K
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvF-00086E-Rm
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvE-0006B5-AU
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so2308732pjo.3
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzCzj0W0FC9zsZchyEyMQYjih3KhzZw2NYS2mL3V7Bc=;
 b=pxBuHiZel5Dhj4NXWMiBwl5NvAYViEMsX7AjKMF1AanQJlJdoUCxwlUJpQnUX+u34d
 ltZJBw9N0GIh7WWBYU2REFFADUK11v4evDOrVTC9j8NENtlRGWh3JcYI77e3BjoBNL8a
 cn5e/IQMO6hySzdK9b8WJgoExo19qwvZY++jva2vJ9WZZFdbdFuTDi9baPg7TS9vbP95
 ES2cUxHqJxXBtedr+gkUYkT/BszX00ksoQ0575nPmcqI4kJPCVk8TK4m+mLrW3HRDuE2
 wwK7mpyHvO57y09ddP3LvDiue+4amQVK5mMzs78I9MFHVJA1Rg59Y9zv3wfwT01gfoZ3
 bifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzCzj0W0FC9zsZchyEyMQYjih3KhzZw2NYS2mL3V7Bc=;
 b=V09GkVG5Y2aCaUHo884dMLWiXAWancRCi8+aFHiJIQhRee7vQDPsiSEehxFKF8YUC9
 SoscSX1tsIxpLzmdXQ1fH31icsSEcLk/Z4czLqsvHaWz2K3Hu54qmICDHjCK72R7owuL
 sDLPsunzpgKAYnH6taSABRqP0yZIJevN3dl7A2dDmoV//cYdA3iTSyAnpdO+8ToXgmBA
 3iZLjwfx07VOpAZKPozsSq/nwJ+saJ5SZJHzctvqpONa3MhJLZJjonAm6APblgsM1VXh
 lWSiF0TAUQXoEYtucbOxfuaJk8X4Cj/uwSabNDOTMdf2YHZDANm3Gjsc0l0iR1YRdkSt
 GYcg==
X-Gm-Message-State: AJIora+hAigDclSOiv+GOOakNJonspy29Y2qFADpTB/IHO5n5ItrjrqV
 97Z8k5+8tygjYKcmXlCzB4pzHIawJu1k+vd5
X-Received: by 2002:a17:90b:1c0f:b0:1ec:ef7b:8bfc with SMTP id
 oc15-20020a17090b1c0f00b001ecef7b8bfcmr27985969pjb.157.1656836739048; 
 Sun, 03 Jul 2022 01:25:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/62] target/arm: Add is_secure parameter to
 get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:53:41 +0530
Message-Id: <20220703082419.770989-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: H5Ex8WD2pOSj

Remove the use of regime_is_secure from get_phys_addr_lpae.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 23cfccce6c..b883826643 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,8 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -207,8 +207,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         GetPhysAddrResult s2 = {};
         int ret;
 
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2, fi);
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
+                                 *is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -961,8 +961,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1179,7 +1179,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
      */
-    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+    tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
         uint64_t descriptor;
         bool nstable;
@@ -2331,7 +2331,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+                                     ipa_secure, is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2499,8 +2499,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
+                                  is_secure, false, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1

