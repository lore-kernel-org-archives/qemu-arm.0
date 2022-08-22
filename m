Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1018858ejc;
        Mon, 22 Aug 2022 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7PylQD7jg6K82dcrxzksZXf+zVN8zdAAjDrtBMWwetow00WlSTI3289F7WJkSEQnxtlMHg
X-Received: by 2002:a05:622a:1889:b0:343:19a6:d972 with SMTP id v9-20020a05622a188900b0034319a6d972mr16105673qtc.290.1661186592523;
        Mon, 22 Aug 2022 09:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661186592; cv=none;
        d=google.com; s=arc-20160816;
        b=WXhP0sygSN60ryE7qbQNfaqNAty055iJFDeCPky2vmvbR8sL1PHSjPz2o48zWvd/if
         /dRODC7KTr5DJ0nNlv4ZF5J7IEw+fMhuZWNn3R68Y/LwDo0H1v+MR6Sv0lYBBNZfSgCN
         MmhcuaDw+uzGvtWx8r85albQA1ovHHca8UcshJSjvntF1jZn144CMliz0gLCaTl+Zhoe
         BMLxiD7DtRHmn1RVJ7r5MYX6OiCpfUuzVvPGTHBwKvGBCz5QoVTYtVdly/xLgrnxnROQ
         TBYE5cyEfabr8uLR02FpHv8BXZskQcri7dmq870gwN5cRJfSO6ZzWIjP7GCf/H+2BTV7
         jmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d/aaxeEB38f4APqu+4DPv/6ce6klQuxkyZkiEyQwHcw=;
        b=uf9zWCLFybz96hI6pLk/nx4I97vRc1x/bGmUz2YH3mwQXHD1TkygRsVa/HhHTOsRxJ
         VKu5dVtP7GeXw+fbKbgyx9U2IqoseGBljCzePUbW0tzyx1Q5KSX8dy4e7vw9CvFT6uKE
         0W37fA5q7gzclg98WU//wKuzDyfi76DSuxOxB5qFLh4sd7shrx+vhO6Ny2AtSKhaE3g4
         8Ll93S0Tc6RoMfpWNiD9fbABFsoH7SYA1Hu/Ltk5yupo7zPthUmKvogNKBsj8zelLyXv
         f0N0u0ufrmI/eQakp3PczjQRh3owgCxdtznsalkxZJaNZUjrB0wIWmdCrd7SkVXWovU7
         Y2Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMfIAwLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ae9ec0d000000b006b8e0315a14si4445267qkg.195.2022.08.22.09.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMfIAwLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQAW7-0004UY-UH
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lp-0000Po-Lf
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:29 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LY-0000j5-Ml
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso10990424pjd.1
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=d/aaxeEB38f4APqu+4DPv/6ce6klQuxkyZkiEyQwHcw=;
 b=KMfIAwLmby1RwdnpRd2TFkkaVbj1UsXWn3nbpOCSHFZcry1KYVrCGC0+HmPUmU4gtK
 7P1u7lzBA3fSJh9C4mGlTdgPmWnnV3RXW/p06t8uiMULyvH6bZkxLDUPNP6YdWzoq0gu
 3QvYsH4b0uyjC5wRXICglzw0HPqHpLaiZKk0aARTr9ZIXQ/MUvzVpOVgTdxOVPykZjwZ
 7U77+/5EQZWZbW7Ao9Q/cx4yCPW//XEsJ9IHOd4MFyQ5Y6DMUDZoM6A5T/Qa7Fr1WmCo
 XPnk1q9FnVSKHEnVlJMIFEgBZttyf37JCCArrvpJPSgLlhIal80nuvAKTXeBzxK45eio
 xqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=d/aaxeEB38f4APqu+4DPv/6ce6klQuxkyZkiEyQwHcw=;
 b=Izd5S9OwD1P4h5Owb9fF4w6fs10ZbZDGoXIfrtRsCiYBd+TOrrYxgaC8znEDYuxnKK
 Kwh3BpJVDfTWyyQeb5qX4Ulr8cuBYblICuoagnIEe2HchbZ1GzxdeIrCyTt8f7DRWAac
 08P3mcGnqFy0YQ98qw9HjnL0cAZVPx235U/h8t28PIQSyzZwzo//qv1yNynJs0wJJ/Ge
 KBUjFLkDrsiYKPDY0uX5AZpOQk2vrrPoI8/olRgpMAm6Y5024CahMkpAXdJw96CY9lSp
 yDGpJCFrzDR4hTPtUhU7mkiVWTAZ5gkRdC4RnP3bmweWG5GFM1OA1yh2FnZwB9NtVitz
 EuVA==
X-Gm-Message-State: ACgBeo2zLvLPu8NozZtUdeHYXKlaiZsCwKyDcIN25uc5qHvngKDIiupH
 UUPruQbmQDaDeIbsjcbbmxVfT5dGkIrZgQ==
X-Received: by 2002:a17:90b:4b8d:b0:1fb:4def:1fc1 with SMTP id
 lr13-20020a17090b4b8d00b001fb4def1fc1mr2471775pjb.121.1661182091764; 
 Mon, 22 Aug 2022 08:28:11 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 33/66] target/arm: Pass HCR to attribute subroutines.
Date: Mon, 22 Aug 2022 08:27:08 -0700
Message-Id: <20220822152741.1617527-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: k7/oBtXlB7nu

These subroutines did not need ENV for anything except
retrieving the effective value of HCR anyway.

We have computed the effective value of HCR in the callers,
and this will be especially important for interpreting HCR
in a non-current security state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5c6e5eea88..fe06bb032b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -186,7 +186,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
+static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
 {
     /*
      * For an S1 page table walk, the stage 1 attributes are always
@@ -198,7 +198,7 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
      * when cacheattrs.attrs bit [2] is 0.
      */
     assert(cacheattrs.is_s2_format);
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+    if (hcr & HCR_FWB) {
         return (cacheattrs.attrs & 0x4) == 0;
     } else {
         return (cacheattrs.attrs & 0xc) == 0;
@@ -216,6 +216,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
         !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
+        uint64_t hcr;
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
@@ -228,8 +229,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ns = !is_secure;
             return ~0;
         }
-        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, s2.cacheattrs)) {
+
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -2058,14 +2060,14 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
  * ref: shared/translation/attrs/S2AttrDecode()
  *      .../S2ConvertAttrsHints()
  */
-static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
+static uint8_t convert_stage2_attrs(uint64_t hcr, uint8_t s2attrs)
 {
     uint8_t hiattr = extract32(s2attrs, 2, 2);
     uint8_t loattr = extract32(s2attrs, 0, 2);
     uint8_t hihint = 0, lohint = 0;
 
     if (hiattr != 0) { /* normal memory */
-        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
+        if (hcr & HCR_CD) { /* cache disabled */
             hiattr = loattr = 1; /* non-cacheable */
         } else {
             if (hiattr != 1) { /* Write-through or write-back */
@@ -2111,12 +2113,12 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
  * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_nofwb(CPUARMState *env,
+static uint8_t combined_attrs_nofwb(uint64_t hcr,
                                     ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
 
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+    s2_mair_attrs = convert_stage2_attrs(hcr, s2.attrs);
 
     s1lo = extract32(s1.attrs, 0, 4);
     s2lo = extract32(s2_mair_attrs, 0, 4);
@@ -2216,7 +2218,7 @@ static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
@@ -2243,10 +2245,10 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     }
 
     /* Combine memory type and cacheability attributes */
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+    if (hcr & HCR_FWB) {
         ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
-        ret.attrs = combined_attrs_nofwb(env, s1, s2);
+        ret.attrs = combined_attrs_nofwb(hcr, s1, s2);
     }
 
     /*
@@ -2312,6 +2314,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
+            uint64_t hcr;
 
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
@@ -2357,7 +2360,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (arm_hcr_el2_eff(env) & HCR_DC) {
+            hcr = arm_hcr_el2_eff(env);
+            if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
@@ -2370,7 +2374,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 }
                 cacheattrs1.shareability = 0;
             }
-            result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
+            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-- 
2.34.1

