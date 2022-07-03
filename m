Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2448047lft;
        Sun, 3 Jul 2022 02:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sU2FJnOx6wTY5qQjpvVXOBlLsmQCoO7KB1deeXmkICJw2IrRCKtPTV5d1OdYcgLY1MyqHI
X-Received: by 2002:a25:c616:0:b0:66c:9431:6aa4 with SMTP id k22-20020a25c616000000b0066c94316aa4mr23997161ybf.94.1656839112187;
        Sun, 03 Jul 2022 02:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839112; cv=none;
        d=google.com; s=arc-20160816;
        b=YaPio3VtTPbG9aGhtzvPIa5jpzcVmib0Ndh/zyWY+8trXtuWHZJ7DksOvlXyBL23t/
         l5Ht2mT8mGa/WsPhYal+4RM/kArlkb9BCoal9UpTVD4AC4mmkfZfzDvL0/NJXovZWxGO
         /Hdvy94eIiOLd/dRL1AkfpGkwBzCsVOK7NtwjMFKwYX8PViUlajdIcrr9arVENb3xHkN
         QwnDnMDkFPewd25HSUqMQqZFTDeqq6P3N0yCXpHAgmzh07BGxoeqFo51njOiGhKBIWBu
         3rU9+GKtW8FXlk8DAfACxYOMEPpK1tU5hy7Az66yDIuKedTzMZeBjPYvfFMdUQN6PLiB
         1NwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yTNXhqFSHn8pbiumNmiwmPSQUngzr2Sw6IYLLyUmSFI=;
        b=X3U9Bc63NCaLuDjElzw7fQjBWx4MFzr3ojoC1Lu7ntEVzT6TWMsCFrDeVxRPvvousZ
         imN02Lx6NwCdUNDa4NA0XBDJZw9DNo6S6T6BzhuVkzVC/a3pRWAxokWnS62wM/lvhAaD
         OiSIzAaumc81ifqOj9Z0+2YkPCVZfVtvYuKZbFcUj++twLh4kriKWuIR7JW3v/n9fBbS
         JSjDR1RSC8y/8C+vZflYOmlaU/Uj7rgMrdvVrSZOXUx0CJwlWTXx953a3XTi7Ga/oph/
         x47agQ/EjAFhDt2+jUoKy6oqJ4OUzURLETRn6ucJmsApWn3wExM+cIDe38v6bILd0k29
         Vz4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XGf/7sda";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a056902070300b0066ce6f64f04si32543378ybt.177.2022.07.03.02.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XGf/7sda";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vXT-0000Mp-IM
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uze-0001Xl-Ct
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:15 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzc-0006oa-JO
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:14 -0400
Received: by mail-pl1-x62a.google.com with SMTP id b2so6020378plx.7
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTNXhqFSHn8pbiumNmiwmPSQUngzr2Sw6IYLLyUmSFI=;
 b=XGf/7sda8RHFmhDOLRycVlGBNrzL5CnEZF3PfFX1pnekabU2IKSrYSO6/xRIPZbG8T
 jjtC62x/oGRhDlTsi+jrfzTUDPYrVDn+weRYKMLhW3fMlA1mpXVdSsWJcGK22reYhP+J
 IOt6J8reIvhxc0mqlQ1dRYRxMvaziDrW0sy+iLnJ70zct5kdPOAfNeHyJNFgXbmixQrd
 sHK+b+xbS/g4xxU7HVAW135uJqF00ZqVSFFQ7t5mTphCLV5L7oTf3/OWEzjaFkSOhUHu
 Ar/8irZX6KCjg15dqcpi6O+qSxLuyr6lgmb4O8nKJ8ygv8FhPiEa+F6p9uPASHm9f5te
 o6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTNXhqFSHn8pbiumNmiwmPSQUngzr2Sw6IYLLyUmSFI=;
 b=IpoaUPKt4c0aTl1DKZ2ST/s7H61jzFh9DlaXLpauwX2YCz/xQSkB11IDZyn3BtTJiR
 mml7t7zVSP7V0PkW/hmnHJMFbSzR+PoECJivBrjD3DsUFf8ZGNU6myAP/wrlalyweX9z
 rbFyHbKtmaizrFgl3OcKLkDAa+UZ5mZxTV1KDP1oXgmc9hKooZZop+cANNWOlPgArE6M
 NrKg9BRDxH5qp8wUmGWEGCA9HR8hJeiinpdXsXU09BHxorieAUFMbqBuxa3UJDRDvr0V
 1TGet7iaM7V5sGdUvfxTsnAYs3cCWsn3ZTta+KOFb2Gh75jfVHwR8ckEOa0OZVemYOYo
 aR6Q==
X-Gm-Message-State: AJIora/HP7Lcv9NZxcwQTZhKEYiMYn4DI2tJdc16yKrUcpJwW2yTfPa5
 sPXt7cg0Ye56IHFbI+3mliMWlOEEvzPWTFYm
X-Received: by 2002:a17:902:a589:b0:16b:c227:d7f9 with SMTP id
 az9-20020a170902a58900b0016bc227d7f9mr10266098plb.29.1656837011220; 
 Sun, 03 Jul 2022 01:30:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 54/62] target/arm: Split out S1TranslateResult type
Date: Sun,  3 Jul 2022 13:54:11 +0530
Message-Id: <20220703082419.770989-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: /w98ryz085bb

Consolidate the results of S1_ptw_translate in one struct.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 60 ++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6eb61849d3..32937ec7db 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -190,13 +190,18 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
+typedef struct {
+    bool is_secure;
+    void *hphys;
+    hwaddr gphys;
+} S1TranslateResult;
+
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                              ARMMMUIdx s2_mmu_idx, hwaddr addr,
-                             bool *is_secure_ptr, void **hphys, hwaddr *gphys,
+                             bool is_secure, S1TranslateResult *res,
                              ARMMMUFaultInfo *fi)
 {
-    bool is_secure = *is_secure_ptr;
     MemTxAttrs attrs = {};
     PageEntryExtra extra;
     int flags;
@@ -204,7 +209,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
     env->tlb_fi = fi;
     flags = probe_access_extra(env, addr, MMU_DATA_LOAD,
                                arm_to_core_mmu_idx(s2_mmu_idx),
-                               true, hphys, &attrs, &extra, 0);
+                               true, &res->hphys, &attrs, &extra, 0);
     env->tlb_fi = NULL;
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
@@ -250,14 +255,13 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    if (is_secure) {
-        /* Check if page table walk is to secure or non-secure PA space. */
-        *is_secure_ptr = !(attrs.secure
-                           ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
-                           : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
-    }
+    /* Check if page table walk is to secure or non-secure PA space. */
+    res->is_secure = (is_secure &&
+                      !(attrs.secure
+                        ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
+                        : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW));
 
-    *gphys = extra.x & R_PAGEENTRYEXTRA_PA_MASK;
+    res->gphys = extra.x & R_PAGEENTRYEXTRA_PA_MASK;
     return true;
 }
 
@@ -267,36 +271,34 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
         return 0;
     }
 
     be = regime_translation_big_endian(env, mmu_idx);
-    if (likely(hphys)) {
+    if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
         if (be) {
-            data = ldl_be_p(hphys);
+            data = ldl_be_p(s1.hphys);
         } else {
-            data = ldl_le_p(hphys);
+            data = ldl_le_p(s1.hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = is_secure };
+        MemTxAttrs attrs = { .secure = s1.is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
         if (be) {
-            data = address_space_ldl_be(as, gphys, attrs, &result);
+            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -312,36 +314,34 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
         return 0;
     }
 
     be = regime_translation_big_endian(env, mmu_idx);
-    if (likely(hphys)) {
+    if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
         if (be) {
-            data = ldq_be_p(hphys);
+            data = ldq_be_p(s1.hphys);
         } else {
-            data = ldq_le_p(hphys);
+            data = ldq_le_p(s1.hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = is_secure };
+        MemTxAttrs attrs = { .secure = s1.is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
         if (be) {
-            data = address_space_ldq_be(as, gphys, attrs, &result);
+            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
-- 
2.34.1

