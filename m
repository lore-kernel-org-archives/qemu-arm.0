Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7196647eje;
        Wed, 19 Jul 2023 08:57:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGIIBdweLA5sS0NcwZsxJXe6gkwNLf6cTIijkkl4mQLwRN3CExr3/oXJlJzy7rQp11i0eXn
X-Received: by 2002:a0c:cb85:0:b0:635:f2a4:9543 with SMTP id p5-20020a0ccb85000000b00635f2a49543mr2888750qvk.25.1689782257036;
        Wed, 19 Jul 2023 08:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689782257; cv=none;
        d=google.com; s=arc-20160816;
        b=CULTzTY0Z5sDVmEEoF8H3mnPKSVM1gTID0a2meT9+wzvJXSi85nIS4Lqni39dvaUZ9
         QmELUltgVMuHXv3MBOVXb78sc35hXn1IgjV76+0LCddQ8//AAHmR3dIz83XX/OVU30HL
         vEcslw/DPrBzAsHhzX0qGyT1ko1/07Pp4aifOMEe0WOwHroSavWExYoXHSwGFdgcJ2cr
         KJxOUpru0Xbu1vKqgjh/8CUh4CxqVb1kvkxUlEMR4Z5krvEPI8QDcyW5EU1M+eZGn7yx
         GiPHjOVPN+WGYQMoY65+uVo3va45zkffzxy5O5Fweml/ytveIz5Ish6p7eZAxQKFTYTg
         jO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FZ2bPahlx3LV2sRcFrJrnz1tXtkeMss0dhYnH4Xs6LA=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=KWd/QLapgAVKUz4suvEPTuHJSrpm2q1iQGyz646y7JCNygRU0OTEQEGsTQ2GqaW/Ty
         9B8dwlXa2DSg47N6KoSbM1121URT7VNgFIVm6FocTBl+Z/kSpCKpf8HQLLTUPRV+Ernt
         t7sI4IUtkftjA77XhR0A32wYksNh5X3j8rCH82OvdXhMThPaCBRH61bx76bLe2cWctzx
         Wx/jsfw6Xn/wp8rWmti/bjC/oG9dI0MKX7OlTIzn6eZBEhtAyRDD2aP7ln2sb87n08kg
         1b7SL3mLo+jFIxFpfX06M2x8sDz0x8B7WXRaeckisYx/erBSgnngeCM6lPZbG1ODp6AB
         3EWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xzLpRR+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9-20020a0cb3c9000000b00636ba32536fsi2898190qvf.74.2023.07.19.08.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jul 2023 08:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xzLpRR+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qM9Xq-00036e-VH; Wed, 19 Jul 2023 11:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xn-00035d-WC
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xl-0007Ix-8B
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbca8935bfso65387595e9.3
 for <qemu-arm@nongnu.org>; Wed, 19 Jul 2023 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689782207; x=1690387007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZ2bPahlx3LV2sRcFrJrnz1tXtkeMss0dhYnH4Xs6LA=;
 b=xzLpRR+hUzGzodg93yn4hDtKLGUPfQFnr/koe3PzlsNGsxvnAA5XuvR6Yr0LOS5ZNc
 EwL3noelyk8srQszf7xT8aHq4OLPZg6EGZf3rBmuC568hr9ZURbjgAyaaZWl7ldpFVaI
 6t1akIBKXsS1DZynLvcKB16BzT+JE4FW/iNTCdr2lFvmR0tiKdjWWzxfjzwikSQktQsG
 ckiWG8z45g/xrkdjHIB9Egt5F3IBunT/Oz2Qns1PMQY4jl74o8c1MrSjuvWzvyvHh6gQ
 7C0+DtBTor5xoUx15Q4MV8MDmcNODwoMECzx1AanU0zF2N95VP+rb4tXA2RlmIlP7pZd
 K1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689782207; x=1690387007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZ2bPahlx3LV2sRcFrJrnz1tXtkeMss0dhYnH4Xs6LA=;
 b=hZ25UdOESU0kVGxsnRnNIW8SqOETUfHe3//Zt9l5+IpqfDIfaZAU4+5ohynhqFarDV
 /Z2PxZ6PBiViSM8RaSdmyHVgqa7DqoPtIwfdYXkYrS1DDJB7JYKoUbrHMWfqti1O6dDz
 Zl3UL7qA+sYZHLBjnm9qa9AT1h63Hovrqg4HcZ6pz3u4r7xkbei0hPWC3+hDAHrpQrpD
 Ag+6bF475Aa2vM74zfd/PWB5srzC+0YhB1iFmpktuO0ZUBc7zXBOjzkW1C6AlaXO0u0V
 49h3gb6ow7hCdUh5bSGuvVavPKC1FhnvifcsJOjJ+J0rnuM2CC2QNocPJl8h9NPfndTe
 MM8g==
X-Gm-Message-State: ABy/qLalq2gWNJVhrmr0yTFB7pNW5ym9FYwbYE/4T/CIKNUI/Pkew3ms
 IQ79NAkpL4qCFEbgyb+1Nz9mVQ==
X-Received: by 2002:a7b:cd93:0:b0:3fc:1fb:79d3 with SMTP id
 y19-20020a7bcd93000000b003fc01fb79d3mr4796514wmj.15.1689782207102; 
 Wed, 19 Jul 2023 08:56:47 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03caa4sm2351006wme.0.2023.07.19.08.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:56:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 4/5] target/arm: Pass security space rather than flag for AT
 instructions
Date: Wed, 19 Jul 2023 16:30:18 +0100
Message-ID: <20230719153018.1456180-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719153018.1456180-2-jean-philippe@linaro.org>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PTqZ5zSJQgVj

At the moment we only handle Secure and Nonsecure security spaces for
the AT instructions. Add support for Realm and Root.

For AArch64, arm_security_space() gives the desired space. ARM DDI0487J
says (R_NYXTL):

  If EL3 is implemented, then when an address translation instruction
  that applies to an Exception level lower than EL3 is executed, the
  Effective value of SCR_EL3.{NSE, NS} determines the target Security
  state that the instruction applies to.

For AArch32, some instructions can access NonSecure space from Secure,
so we still need to pass the state explicitly to do_ats_write().

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
I haven't tested AT instructions in Realm/Root space yet, but it looks
like the patch is needed. RMM doesn't issue AT instructions like KVM
does in non-secure state (which triggered the bug in the previous
patch).
---
 target/arm/internals.h | 18 +++++++++---------
 target/arm/helper.c    | 27 ++++++++++++---------------
 target/arm/ptw.c       | 12 ++++++------
 3 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fc90c364f7..cf13bb94f5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1217,24 +1217,24 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     __attribute__((nonnull));
 
 /**
- * get_phys_addr_with_secure_nogpc: get the physical address for a virtual
- *                                  address
+ * get_phys_addr_with_space_nogpc: get the physical address for a virtual
+ *                                 address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
  * @mmu_idx: MMU index indicating required translation regime
- * @is_secure: security state for the access
+ * @space: security space for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
- * Similar to get_phys_addr, but use the given security regime and don't perform
+ * Similar to get_phys_addr, but use the given security space and don't perform
  * a Granule Protection Check on the resulting address.
  */
-bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
-                                     MMUAccessType access_type,
-                                     ARMMMUIdx mmu_idx, bool is_secure,
-                                     GetPhysAddrResult *result,
-                                     ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
+                                    MMUAccessType access_type,
+                                    ARMMMUIdx mmu_idx, ARMSecuritySpace space,
+                                    GetPhysAddrResult *result,
+                                    ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3ee2bb5fe1..2017b11795 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3357,7 +3357,7 @@ static int par_el1_shareability(GetPhysAddrResult *res)
 
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure)
+                             ARMSecuritySpace ss)
 {
     bool ret;
     uint64_t par64;
@@ -3369,8 +3369,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
      * I_MXTJT: Granule protection checks are not performed on the final address
      * of a successful translation.
      */
-    ret = get_phys_addr_with_secure_nogpc(env, value, access_type, mmu_idx,
-                                          is_secure, &res, &fi);
+    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
+                                         &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
@@ -3535,7 +3535,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint64_t par64;
     ARMMMUIdx mmu_idx;
     int el = arm_current_el(env);
-    bool secure = arm_is_secure_below_el3(env);
+    ARMSecuritySpace ss = arm_security_space(env);
 
     switch (ri->opc2 & 6) {
     case 0:
@@ -3543,10 +3543,9 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_E3;
-            secure = true;
             break;
         case 2:
-            g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
+            g_assert(ss != ARMSS_Secure);  /* ARMv8.4-SecEL2 is 64-bit only */
             /* fall through */
         case 1:
             if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
@@ -3564,10 +3563,9 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_E10_0;
-            secure = true;
             break;
         case 2:
-            g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
+            g_assert(ss != ARMSS_Secure);  /* ARMv8.4-SecEL2 is 64-bit only */
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
@@ -3580,18 +3578,18 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     case 4:
         /* stage 1+2 NonSecure PL1: ATS12NSOPR, ATS12NSOPW */
         mmu_idx = ARMMMUIdx_E10_1;
-        secure = false;
+        ss = ARMSS_NonSecure;
         break;
     case 6:
         /* stage 1+2 NonSecure PL0: ATS12NSOUR, ATS12NSOUW */
         mmu_idx = ARMMMUIdx_E10_0;
-        secure = false;
+        ss = ARMSS_NonSecure;
         break;
     default:
         g_assert_not_reached();
     }
 
-    par64 = do_ats_write(env, value, access_type, mmu_idx, secure);
+    par64 = do_ats_write(env, value, access_type, mmu_idx, ss);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3608,7 +3606,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t par64;
 
     /* There is no SecureEL2 for AArch32. */
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2, false);
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2,
+                         ARMSS_NonSecure);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3633,7 +3632,6 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
 #ifdef CONFIG_TCG
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
-    int secure = arm_is_secure_below_el3(env);
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
 
@@ -3653,7 +3651,6 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
-            secure = true;
             break;
         default:
             g_assert_not_reached();
@@ -3673,7 +3670,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     env->cp15.par_el[1] = do_ats_write(env, value, access_type,
-                                       mmu_idx, secure);
+                                       mmu_idx, arm_security_space(env));
 #else
     /* Handled by hardware accelerator. */
     g_assert_not_reached();
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1aef2b8cef..d0270776be 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3412,15 +3412,15 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
-                                     MMUAccessType access_type,
-                                     ARMMMUIdx mmu_idx, bool is_secure,
-                                     GetPhysAddrResult *result,
-                                     ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
+                                    MMUAccessType access_type,
+                                    ARMMMUIdx mmu_idx, ARMSecuritySpace space,
+                                    GetPhysAddrResult *result,
+                                    ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
-        .in_space = arm_secure_to_space(is_secure),
+        .in_space = space,
     };
     return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
 }
-- 
2.41.0

