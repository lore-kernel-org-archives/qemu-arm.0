Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp465105ocs;
        Sat, 1 Oct 2022 09:39:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6P2XKBxWOz5j5Dr/CkZQdAvNp0NwV/4tzcAl6dkgBybcJ6LL511Ti8GC/eGZRt/FJiBZ7i
X-Received: by 2002:a05:622a:4ca:b0:35d:539f:a35 with SMTP id q10-20020a05622a04ca00b0035d539f0a35mr10962461qtx.543.1664642377885;
        Sat, 01 Oct 2022 09:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642377; cv=none;
        d=google.com; s=arc-20160816;
        b=E8YK5+RYvcM83tdoUPZFl0146OuXA62qVdFR2df+WyZVg8hKhWdo47N2UbmRaGPIb5
         Pa51ITIJX+CpCjaJWdWBe2mjKzyq6SYHoB2PKQP8BEjomHIA92HRvs691pnalJVfioXR
         P5O1ER2491g34VbPgZPWJxUR9p5gRSC64psWkBh8k1OucYNPOPYXH+FKObOIxMhaedtb
         7WzEDGLHWyGuUGgo0vFAXHX5vPkx+X9wB6tUur8TnZcAYQGl1V50ahaLQhcF2fOp/FDZ
         EyOvtpk/dJ6DIViHQLYQAVPpJ50uRBlRVMihFjuzgxl95l2XLgldoMyQ8ssVlPD/FGw/
         NziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jzDPmkcbyBXmgF7/UF+Ax8S2mqEsTchVghdM8qEDw1g=;
        b=qKlrrnGT9TvjI+0OXVIfbagBxNEMR7XPPr99meXfQJ5y6mLndJSbL322OKJeVd9E6m
         vN1ZwXsodvUxDGFoCEmuSY64T9kXDQfZevPN1eVXBlb9KHpaM6NZry+cQ3GueDLb4bsV
         IcRK4iECLJHfcGHcpyCO4mFCh4/5ioXkopDlpMmGmg0QCzl+Cyg0vT27R4F/+lzQJa5U
         GTETAuCM8iqyLpd+TTTRTwVHzz/P/zp6yO8nsWVq+5NgPi6ue16WgohLlOOsrZXKbi5b
         3qKUdFnwHyU8urg+oWOoKDJ791jZsPfvFK9hm2u/WBcn+fRjhVbeJwrwyyalqwrAIyeX
         2VJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcOe+zxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt46-20020a05620a47ae00b006bbda605068si2812922qkb.548.2022.10.01.09.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcOe+zxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefWb-0004Fz-DT
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI1-0007sY-4O
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:33 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHz-0006Of-0M
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:32 -0400
Received: by mail-qk1-x72c.google.com with SMTP id o7so4535915qkj.10
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jzDPmkcbyBXmgF7/UF+Ax8S2mqEsTchVghdM8qEDw1g=;
 b=YcOe+zxAKVqqfDB2Vk5t/EcrMCxvWZGj9U2j7aNJBWwpYBR6mcD3+P99zpEacXx6Gt
 TmUVKEzQQ9653BBWHbyZTB9d9zOjLzoTt+lQwZVPCxjApqLQ24Jz2TvFfPGsnD8WxZTD
 WccAnYq3yZ80BTwYmdwwEvje7pwRUSnnGIPwOW07OlHh0oD6JH4Vbn99ADpxYWdBxdXK
 TUy9Qw/QH8xgQAcs3B+kwivW1OyDL6K9by0G+VPDQU7rcDqXIuOolGwmWnZEbn+6yp6b
 6mAqwg8oJvGpfQyEflwXYXe0xgLPEK0eHuA/iA0ldxHW5/bZm1KP4yOodhHOHEVJ4CAc
 zrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jzDPmkcbyBXmgF7/UF+Ax8S2mqEsTchVghdM8qEDw1g=;
 b=rnI+BtGWr2xDm34nR44cXOXrB+lJ4mPhtO/Wdp0uqbkFhvr6CcA4nZAlCQ1Ioyy1nD
 35UG5Py+kQxlq+Vg3mwhPCwWtl9yI4UzbazcU1xsNbv1bM90ceJD4Yn19FZ5z6Pr7otn
 Ce3tD6cawcaAFiIxQ4sIkhELWBQXJ2g5/nfuuRETK6lH/3yZGvnMdhTGE1G2DKIiH8WB
 kWd8/CP9xyNSvu/J+G9ENHRuajdzmHWEA35gXKkrWUhvcJ6GLEzi1u+kwrRC8bZvA6T2
 V3ynCz7HJYGm70kcO2Iu4nQGjaTa0cFksvk2ZWMP2jA7wiBsFkykz0s8qOdyzdNfW9MI
 NGSw==
X-Gm-Message-State: ACrzQf2hMu7TI9mhGDLALfjoyuzyRRE1u+y8pWsuzAmUmtLTjxoAKx7k
 6GVj36kO6TCIzczxx5gGGNSy+w==
X-Received: by 2002:a05:620a:15d2:b0:6cf:2d38:9c0d with SMTP id
 o18-20020a05620a15d200b006cf2d389c0dmr9718953qkm.426.1664641470154; 
 Sat, 01 Oct 2022 09:24:30 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 28/42] target/arm: Split out get_phys_addr_twostage
Date: Sat,  1 Oct 2022 09:23:04 -0700
Message-Id: <20221001162318.153420-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Xj/hpv8C9y3q

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 196 +++++++++++++++++++++++++----------------------
 1 file changed, 106 insertions(+), 90 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ba496c3421..3f5733a237 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -21,6 +21,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+static bool get_phys_addr_with_secure_debug(CPUARMState *env,
+                                            target_ulong address,
+                                            MMUAccessType access_type,
+                                            ARMMMUIdx mmu_idx,
+                                            bool is_secure, bool debug,
+                                            GetPhysAddrResult *result,
+                                            ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
     [0] = 32,
@@ -2426,6 +2435,98 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
+static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
+                                   MMUAccessType access_type,
+                                   ARMMMUIdx s1_mmu_idx,
+                                   bool is_secure, bool debug,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    hwaddr ipa;
+    int s1_prot;
+    int ret;
+    bool ipa_secure, s2walk_secure;
+    ARMCacheAttrs cacheattrs1;
+    ARMMMUIdx s2_mmu_idx;
+    bool is_el0;
+    uint64_t hcr;
+
+    ret = get_phys_addr_with_secure_debug(env, address, access_type,
+                                          s1_mmu_idx, is_secure, debug,
+                                          result, fi);
+
+    /* If S1 fails or S2 is disabled, return early.  */
+    if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        return ret;
+    }
+
+    ipa = result->f.phys_addr;
+    ipa_secure = result->f.attrs.secure;
+    if (is_secure) {
+        /* Select TCR based on the NS bit from the S1 walk. */
+        s2walk_secure = !(ipa_secure
+                          ? env->cp15.vstcr_el2 & VSTCR_SW
+                          : env->cp15.vtcr_el2 & VTCR_NSW);
+    } else {
+        assert(!ipa_secure);
+        s2walk_secure = false;
+    }
+
+    s2_mmu_idx = (s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+    is_el0 = s1_mmu_idx == ARMMMUIdx_Stage1_E0;
+
+    /*
+     * S1 is done, now do S2 translation.
+     * Save the stage1 results so that we may merge prot and cacheattrs later.
+     */
+    s1_prot = result->f.prot;
+    cacheattrs1 = result->cacheattrs;
+    memset(result, 0, sizeof(*result));
+
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                             s2walk_secure, is_el0, debug, result, fi);
+    fi->s2addr = ipa;
+
+    /* Combine the S1 and S2 perms.  */
+    result->f.prot &= s1_prot;
+
+    /* If S2 fails, return early.  */
+    if (ret) {
+        return ret;
+    }
+
+    /* Combine the S1 and S2 cache attributes. */
+    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    if (hcr & HCR_DC) {
+        /*
+         * HCR.DC forces the first stage attributes to
+         *  Normal Non-Shareable,
+         *  Inner Write-Back Read-Allocate Write-Allocate,
+         *  Outer Write-Back Read-Allocate Write-Allocate.
+         * Do not overwrite Tagged within attrs.
+         */
+        if (cacheattrs1.attrs != 0xf0) {
+            cacheattrs1.attrs = 0xff;
+        }
+        cacheattrs1.shareability = 0;
+    }
+    result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
+                                            result->cacheattrs);
+
+    /* Check if IPA translates to secure or non-secure PA space. */
+    if (is_secure) {
+        if (ipa_secure) {
+            result->f.attrs.secure =
+                !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
+        } else {
+            result->f.attrs.secure =
+                !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
+                || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
+        }
+    }
+    return 0;
+}
+
 static bool get_phys_addr_with_secure_debug(CPUARMState *env,
                                             target_ulong address,
                                             MMUAccessType access_type,
@@ -2442,97 +2543,12 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
          * translations if mmu_idx is a two-stage regime.
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-            hwaddr ipa;
-            int s1_prot;
-            int ret;
-            bool ipa_secure, s2walk_secure;
-            ARMCacheAttrs cacheattrs1;
-            ARMMMUIdx s2_mmu_idx;
-            bool is_el0;
-            uint64_t hcr;
-
-            ret = get_phys_addr_with_secure(env, address, access_type,
-                                            s1_mmu_idx, is_secure, result, fi);
-
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
-                                                   is_secure)) {
-                return ret;
-            }
-
-            ipa = result->f.phys_addr;
-            ipa_secure = result->f.attrs.secure;
-            if (is_secure) {
-                /* Select TCR based on the NS bit from the S1 walk. */
-                s2walk_secure = !(ipa_secure
-                                  ? env->cp15.vstcr_el2 & VSTCR_SW
-                                  : env->cp15.vtcr_el2 & VTCR_NSW);
-            } else {
-                assert(!ipa_secure);
-                s2walk_secure = false;
-            }
-
-            s2_mmu_idx = (s2walk_secure
-                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
-
-            /*
-             * S1 is done, now do S2 translation.
-             * Save the stage1 results so that we may merge
-             * prot and cacheattrs later.
-             */
-            s1_prot = result->f.prot;
-            cacheattrs1 = result->cacheattrs;
-            memset(result, 0, sizeof(*result));
-
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     s2walk_secure, is_el0, debug, result, fi);
-            fi->s2addr = ipa;
-
-            /* Combine the S1 and S2 perms.  */
-            result->f.prot &= s1_prot;
-
-            /* If S2 fails, return early.  */
-            if (ret) {
-                return ret;
-            }
-
-            /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-            if (hcr & HCR_DC) {
-                /*
-                 * HCR.DC forces the first stage attributes to
-                 *  Normal Non-Shareable,
-                 *  Inner Write-Back Read-Allocate Write-Allocate,
-                 *  Outer Write-Back Read-Allocate Write-Allocate.
-                 * Do not overwrite Tagged within attrs.
-                 */
-                if (cacheattrs1.attrs != 0xf0) {
-                    cacheattrs1.attrs = 0xff;
-                }
-                cacheattrs1.shareability = 0;
-            }
-            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
-                                                    result->cacheattrs);
-
-            /* Check if IPA translates to secure or non-secure PA space. */
-            if (is_secure) {
-                if (ipa_secure) {
-                    result->f.attrs.secure =
-                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-                } else {
-                    result->f.attrs.secure =
-                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
-                }
-            }
-            return 0;
-        } else {
-            /*
-             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-             */
-            mmu_idx = stage_1_mmu_idx(mmu_idx);
+            return get_phys_addr_twostage(env, address, access_type,
+                                          s1_mmu_idx, is_secure, debug,
+                                          result, fi);
         }
+        /* For non-EL2 CPUs a stage1+stage2 translation is just stage 1. */
+        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1

