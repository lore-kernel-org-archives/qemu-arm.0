Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2444104lft;
        Sun, 3 Jul 2022 01:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uS1dnMUHx/A3mqcDnia0eP/OtV16WlNS/mG3FMtt9Yl1oQDVDEfsO+PpNHDOxlRbvNgGIa
X-Received: by 2002:a0d:ca09:0:b0:31c:86b4:1e71 with SMTP id m9-20020a0dca09000000b0031c86b41e71mr3998318ywd.267.1656838570252;
        Sun, 03 Jul 2022 01:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838570; cv=none;
        d=google.com; s=arc-20160816;
        b=dEen20x4AzaoWUaVdDNFo974k08CR/iow7/ueNxHYiLjo6fjsyTM7D5KZLwdoiIdCf
         F0fbjiJIxdhb/xRBxF0XCTih3QtyK4munX+Yw1JbemFS9kzoge4+YxMNQtyvjvrFEzpq
         V9A5GxWmRp/C1s9P+a2AJZDmvvTEKf585loyv97ZZYAbb6ljdY5MP2NQ02ao4a0HhH7y
         tZINXWTJMgr9E6DjSZmItOEX9vZClJHVI8B0y+Z2F45+SA+PbwOKzDMlfD9bcwsPOjTk
         WLp3VXPdaYMB0vU8Ff6dzc19+izB9DOOdnqTrrgSV/qc66VVL1fbsllN8FGYSEkAyFjk
         Iyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=27Wz5DSCW8ENXu7065ZoRBnr2V/wpxEQdmpGVTXjexE=;
        b=z0T6RlvJVl2K2+5ed2EYs6u8bX3JMALbX6S2Iz55KNwVez+mxnELLrN0sH4McxVwhs
         ng4qHdQM4PsWGm1IwxxrzhH27LOvx5K9tUbYy6V0ufuPxG/nBzYbe/Qcc0Z4ighIlyGm
         4B3QRpMTzaQwX3nBJFerUBtqGx9i/HSx5XnYzrGS22o1wtO9hXPJRL+sMA6ukOOCHlHM
         iOKO59cur2tRE1NIzbSh6KP5xuZivbxmTFHTAwtHe98e50s3h574dJ9A3FstpjsoV49h
         B0UCsIvvEL2zLEe6nSDSZkB090csE7V64IDyfrC/7/KFSSZGI8MEthHpWH/l4sFyab6q
         7nMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xu9jo53r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i189-20020a2554c6000000b0066e2c8cbce7si3781118ybb.477.2022.07.03.01.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xu9jo53r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vOj-0005er-H4
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz0-0007zi-Bl
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:34 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uyy-0006ea-MS
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id o15so2058884pjh.1
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=27Wz5DSCW8ENXu7065ZoRBnr2V/wpxEQdmpGVTXjexE=;
 b=Xu9jo53rFlJ5Dh9QjQrdUNB4WTXW4vg8+1m2VgkVZW/YcSpGmTbvNArlRlVqniHUWf
 fWV/Is4uoz2xBBWB/J+k7mVXneuqo2t/ss8fYS4j6AdjSy/miy1CG6XTuScaYncPD1Le
 qag4k9osKMzhcF0E4p7i/7JhWfjgaRo8ePEiV2MbbpSgR2jUWNz3N27pwr2jtQSOzOMz
 0wQDlJ3G6fDguWsETHVFy/XRqJMmFZYPAxIgSXfg2+4saCQA6edpozimCOOUG9bdWw5b
 PolXg2NbstWN+C2ayLOGBpvgABBFZcCPl4Z3EFGBpHN0E/5TcnHQ/Qy9aimOm6V3kSmS
 ZXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=27Wz5DSCW8ENXu7065ZoRBnr2V/wpxEQdmpGVTXjexE=;
 b=O1RdhFhgR747yNjb9RUnKaIm6pwUiHrFfLfokbfGBg3yd5DgCt0ApQZ35Q2lvhWO1x
 aFGYnlwgI4dX9a9H30euwnvlSyK0jedD7Ju0up1ah2EIyH9nF/W7E/UXvXKTOeggmxPL
 RXiQpeJTjlGnlr89JdMmGIzDYKMp6WwlSyfTpTQ6eI6O+k4f1mJMQztWF2D3eIRDkp3E
 Qlwf1sR8J0wmumRpGYQedqF8nJWS7hoLQWDDOL2f3/sfVYgqyOxvGHPmobvqRvMkJzKF
 ZywwMeQ1M3BT15s2K51gvDO7I7KvD+KS0lCoSPRIGZA6ZLtzQolOfbSik3Q3FwroLTKT
 LRAQ==
X-Gm-Message-State: AJIora88OwWm/HfP2f4g+mQJQXNYOR+oAKLLplDmK6PHq1a+SSTHmdFv
 lt1p7Qwg7rkaaheT0lhQbNZW8w==
X-Received: by 2002:a17:90b:4d84:b0:1ec:aa85:b8ea with SMTP id
 oj4-20020a17090b4d8400b001ecaa85b8eamr27145064pjb.194.1656836971216; 
 Sun, 03 Jul 2022 01:29:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 40/62] target/arm: Pass HCR to attribute subroutines.
Date: Sun,  3 Jul 2022 13:53:57 +0530
Message-Id: <20220703082419.770989-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: vz8SpQEfGPNs

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
index 93c533e60d..a760ab86c5 100644
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
@@ -2055,14 +2057,14 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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
@@ -2108,12 +2110,12 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
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
@@ -2213,7 +2215,7 @@ static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
@@ -2240,10 +2242,10 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
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
@@ -2309,6 +2311,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
+            uint64_t hcr;
 
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
@@ -2354,7 +2357,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (arm_hcr_el2_eff(env) & HCR_DC) {
+            hcr = arm_hcr_el2_eff(env);
+            if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
@@ -2367,7 +2371,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 }
                 cacheattrs1.shareability = 0;
             }
-            result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
+            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-- 
2.34.1

