Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2436085lft;
        Sun, 3 Jul 2022 01:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vFsjP23Xufb/Oiy9jRWbo4yU/Zqgj6QRg3HntoxxRgT0JzIugYoPv3LXBxmQDyzwk9xlIa
X-Received: by 2002:a25:e08c:0:b0:66d:1004:f345 with SMTP id x134-20020a25e08c000000b0066d1004f345mr24061885ybg.221.1656837194970;
        Sun, 03 Jul 2022 01:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837194; cv=none;
        d=google.com; s=arc-20160816;
        b=Cszhi+f695oSK70qsko9xUbPAjyCoOZfAEBLuwO3NRYelUWoYaS0sOG2IFA8WFwJtl
         /OuZ+GdtDzuQt5n4kCRwJrlhMjMgjBqI93LWYerP4pkGT06shK5kskivtWOyoh8Tt1ow
         xRBmmvz7k4rTeb1/UY3z2ro01B6NHY27dkHyg6GSfVDljQsEoMEeAvLWa78h0xrN0q1G
         fvuHsajM/KYh7zYYPjwNkFg1qQpN9egMmMUyg9EKU72JV5UJBkdkjzIrogcb2OAT/Hpb
         MRsAnq07xOLM25wJr0/yjBERAEJQFvj8SeO2LNlV1uhwJSdr1AmE6EQIm6wUfKuNUGiq
         es7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nWhJRX2CcLLqjJLeiFrCW24//WXCOsrf/EygkQpW/6g=;
        b=trTHbhamFiAHUHajcNbLXF5oKfArUjlhoNVbeHV8UU5r9MN/YI5ZHTjw2izh2Sj+nL
         QR/SsSs9schtj//nS34/7p7iSUhCe6Ev0Do76ojp/KV3Jln8m4BbIMoq3WvyYZ4MXPhl
         t+1VV0GqNdedr/ohwsMDi7cnUAO0rtCXCerboBMoeX3OOsM3TI5xrgR9ZfC7GRSK8bIZ
         KzO6gVVGvXTGRVOyG0OvnihByXpAa63TiuHEmN7oPP8amAdNf47UYWuq5OBBNXVmeduJ
         P7mLA3Wa7OPHpenWRYIuNWalKehtsJ6uuhYCfcHLzre8EHwcyDHjDkn6LodWS1pHCKHP
         moaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MuttzmbS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp13-20020a05690c068d00b003175acf2f24si36166067ywb.238.2022.07.03.01.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MuttzmbS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v2Y-0004OR-AZ
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuZ-0006rA-1E
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuX-0005sG-2u
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id go6so6628882pjb.0
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWhJRX2CcLLqjJLeiFrCW24//WXCOsrf/EygkQpW/6g=;
 b=MuttzmbSQvnQ4fDjSiKUpl9JiTPG1eNTnxWXj15G3yp6TXpYvXu1W988Ah7Eo1dI2w
 CSpSBq4mAPaUHqnpsx8OKknvRoTXedMJ8P7/834A9766VCXRmBEhPJiAuhwuNx1qQyIM
 iQBtnu097NzckEEJiSsaRDQ5EaE7Jq/xa3TfhjZ7FENTTqC11sHt6ZWDlpeoIfp4mjav
 mPWGWbv3ZiyK8q545xLW6vYQznHnRN88slLeRLXlbKyk9UpXl7ZrM8890I+41fUKh1gE
 hhB3POkqmyu6wVH1CYBprVLpYq02w0Nko4AJABatxDbjDyr/24XKsGb6lTQdbk/WtYOC
 5OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWhJRX2CcLLqjJLeiFrCW24//WXCOsrf/EygkQpW/6g=;
 b=FWUA7COoTb5Qy17Kt8PH61hshyGP4KFgim0SA0wudwcViIsj4uhJLo871WjNThkLd5
 vJ+Fbl+yiLH4PXJ76eyQFwN4IlpsWke1MN2H3qoEYzVy2U2Hc8vSNVm2MPV1ERUCJytv
 rHPdWMALRLA4Wq3n+6ikCKMQ29AdUIgF5VREKvO1xA6tA46WNcQSuauiWhtWXz1H0Gub
 XmkLI9kFdFwYjlVOP7tM3wMF+6XBADtEUT7i+o9QFoe4VeW95XelRv8S7M2A+9bwXgSV
 OEkQ68F8NfeuHc5zCS2cPhCAgsNdDpJbP1s+OAETgXAiQq3kEBcxCUY4brfwS0Jo2XAg
 ldkw==
X-Gm-Message-State: AJIora806LOH6r5qfQ13WTz2Pj81G8dqAkM/Qx1wLgwHNTjTPs2w9VEH
 rSjCkM2taKZLezwOuXCnLV0DntlldEsi7+3k
X-Received: by 2002:a17:90b:218:b0:1ef:1440:ebe1 with SMTP id
 fy24-20020a17090b021800b001ef1440ebe1mr28988693pjb.166.1656836695664; 
 Sun, 03 Jul 2022 01:24:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/62] target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:53:27 +0530
Message-Id: <20220703082419.770989-11-richard.henderson@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yNFt1rBiK0KY

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b78658161f..5e79c9be98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,10 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, hwaddr *phys_ptr,
-                               MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                               bool s1_is_el0, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -204,18 +202,13 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
         !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        target_ulong s2size;
-        hwaddr s2pa;
-        int s2prot;
-        int ret;
         ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
                                           : ARMMMUIdx_Stage2;
-        ARMCacheAttrs cacheattrs = {};
-        MemTxAttrs txattrs = {};
+        GetPhysAddrResult s2 = {};
+        int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
-                                 &cacheattrs);
+                                 &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -225,7 +218,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, cacheattrs)) {
+            ptw_attrs_are_device(env, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -249,7 +242,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             assert(!*is_secure);
         }
 
-        addr = s2pa;
+        addr = s2.phys;
     }
     return addr;
 }
@@ -968,19 +961,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  *             table walk), must be true if this is stage 2 of a stage 1+2
  *             walk for an EL0 access. If @mmu_idx is anything else,
  *             @s1_is_el0 is ignored.
- * @phys_ptr: set to the physical address corresponding to the virtual address
- * @attrs: set to the memory transaction attributes to use
- * @prot: set to the permissions for the page containing phys_ptr
- * @page_size_ptr: set to the size of the page containing phys_ptr
+ * @result: set on translation success,
  * @fi: set to fault info if the translation fails
- * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, hwaddr *phys_ptr,
-                               MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                               bool s1_is_el0, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1298,16 +1285,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
-        *prot = get_S2prot(env, ap, xn, s1_is_el0);
+        result->prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         ns = extract32(attrs, 3, 1);
         xn = extract32(attrs, 12, 1);
         pxn = extract32(attrs, 11, 1);
-        *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
+        result->prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
     fault_type = ARMFault_Permission;
-    if (!(*prot & (1 << access_type))) {
+    if (!(result->prot & (1 << access_type))) {
         goto do_fault;
     }
 
@@ -1317,23 +1304,23 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        txattrs->secure = false;
+        result->attrs.secure = false;
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        cacheattrs->guarded = guarded;
+        result->cacheattrs.guarded = guarded;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        cacheattrs->is_s2_format = true;
-        cacheattrs->attrs = extract32(attrs, 0, 4);
+        result->cacheattrs.is_s2_format = true;
+        result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 0, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
-        cacheattrs->is_s2_format = false;
-        cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+        result->cacheattrs.is_s2_format = false;
+        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
     }
 
     /*
@@ -1342,13 +1329,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * that case comes from TCR_ELx, which we extracted earlier.
      */
     if (param.ds) {
-        cacheattrs->shareability = param.sh;
+        result->cacheattrs.shareability = param.sh;
     } else {
-        cacheattrs->shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 6, 2);
     }
 
-    *phys_ptr = descaddr;
-    *page_size_ptr = page_size;
+    result->phys = descaddr;
+    result->page_size = page_size;
     return false;
 
 do_fault:
@@ -2350,10 +2337,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
-                                     &result->phys, &result->attrs,
-                                     &result->prot, &result->page_size,
-                                     fi, &result->cacheattrs);
+            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                                     is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2524,9 +2509,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  &result->phys, &result->attrs,
-                                  &result->prot, &result->page_size,
-                                  fi, &result->cacheattrs);
+                                  result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 &result->phys, &result->attrs,
-- 
2.34.1

