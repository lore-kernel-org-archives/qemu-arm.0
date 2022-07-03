Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2456453lft;
        Sun, 3 Jul 2022 02:23:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzWrwm7ibzQzwpLGwnDJInj8pqd96pBAHmKamorYEBv6VgUhRiI+eXR3geOi/pqjkq+LtT
X-Received: by 2002:a25:ed0f:0:b0:66c:a82f:8c3b with SMTP id k15-20020a25ed0f000000b0066ca82f8c3bmr24574327ybh.28.1656840210448;
        Sun, 03 Jul 2022 02:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656840210; cv=none;
        d=google.com; s=arc-20160816;
        b=d8LDgOhhdwnOO7CR4SK/rp8zy5vcoX2Bcxv8eNUvHhNrOr4FddMEJXxO7+rEHymHJW
         zkXPlVEGvVo/y1808z1ZLq69ZW26lFasQfmLviH3iKgAw1/VBbyqr9aK/Si0s5tjw1qD
         OhJ8egpVGFRwNPWT5xdl21OiGiJiylqAG5e4nGkBJx0iT1gWaVtONmaobdrB5wVtB+X4
         Ln9oE6MTWR9/aGQmUTMDFieBFR8SNsUKsYtnPW2hwftf8G4FztVerR2bA+Yb2+0ZsIk1
         pa1wb4a87mYy+omG2bpdIs8mZQjSgHDuzX1xtW0fcDngfUlqF02e0tQChuyNx+XbMuuz
         b6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wSNR2kbAW9oQa+mDxGRThKTDiu+IXYao0zmFIiXWIZ0=;
        b=dXXirfQDMdp2eZ5guv3Va0uCpiv4y1c+LWIephQpVAYiQpgvHLFYW/QCrbbjNkoaa8
         R2R9y3ku2amyMU8vn6YtG1LHYaOC8WqUHcktz49gYXy70Jp2e3YscSmhA6CUfrW8NFZH
         YWFI0dnlSjJBo8sKR1OaswERj5lK3rYL8B9P0Cc8Dn8U7Km/m0w2FRDA/hEYoSpJlwqH
         QYMHdVzV5+XCPD8XQIAfav640SZGU7Ok3xv59qgG8AnrUxbbqeCLeOHws55+1VsixgBe
         V79oOobD68J8XRvkAZpELavRoNyozgCpterV/W8flFNO/PU4kHrgB2lZ6VrXJt8Vhci8
         czUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T4ce/4Rj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020a056902070f00b0066ceb0bb407si31922703ybt.182.2022.07.03.02.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T4ce/4Rj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vpB-0005s4-Rj
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzj-0001hk-W3
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzi-0006pd-3T
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:19 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso199887pjc.1
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wSNR2kbAW9oQa+mDxGRThKTDiu+IXYao0zmFIiXWIZ0=;
 b=T4ce/4RjBiL5U7E54ur6JPK1AZM8MBWrdfat7ZB7xbkr4Rmtm+TT9E86TXhAUZ9pLk
 64vE1+X3aVHBQ977WJbpxecGgQFmuQg3BpRNFIYSFKct/h2ecjg4bLB1lE7XNlO/sLYK
 T8xAVrA1MhbqQsTwdlMV7klJJdlJA/eLCW+o20HR5wUGwLJEYP9M011MW+0ipcZXx8sk
 SbZhdJ/ae1V/RtjFL2PFY3eeCt1f8hMzVp7T0P4SUxHJnWF9s7YBQ57ml8M4LGms0XPY
 4jnLZ2p3uzgdGUqXT1kEseBR1YCqAA0hkaedQy53qDWtmIDXpeXa5AszqhmlR+jYKam0
 7hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wSNR2kbAW9oQa+mDxGRThKTDiu+IXYao0zmFIiXWIZ0=;
 b=2i0HWNiTPfG+uwYWCecPWBGuO0Mt+4BJqeu+3h1m6Pc3FJPkvx9IpNM+XJUs51XAg8
 28PwQKADT/fVUvo6rbSDj6ymtJJyS9TvggyHXHeYLbpWsxEOV555tYWY8FvARKJixUpt
 cguuTI5fMyHPzcjIv3JGJ+0bFVyjcoQMSCXfRqqrk7OOr98JUvoG4gdzXOOkOdZzLwZM
 FCSwwzhJTb87hnbXSFTTOmvrJNAPJpYqLTGN8ZS3l6RwgDdA+8Ti8VUX81wrLXgiHgzY
 WLLbwfX+NaMpdXT0FeQ27lNsU0Ecrt+mGGVjqa1ao3LlmOkOTjT/rLj65W0c5urpuUXi
 sjLA==
X-Gm-Message-State: AJIora+1WnBe/6ieSicthXjByZzQWA8wTV2kGcEjp0aw9rkEZJJ45Pyd
 f3A/50iUGbiAbAxyiWAypk894g==
X-Received: by 2002:a17:90b:4a12:b0:1ed:56ab:b2d5 with SMTP id
 kk18-20020a17090b4a1200b001ed56abb2d5mr28406053pjb.152.1656837016767; 
 Sun, 03 Jul 2022 01:30:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 56/62] target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
Date: Sun,  3 Jul 2022 13:54:13 +0530
Message-Id: <20220703082419.770989-57-richard.henderson@linaro.org>
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
X-TUID: oDQwVHYIjTZ5

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 83 +++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 39 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b5105a2e92..dee857ae89 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -268,37 +268,29 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+static uint32_t arm_ldl_ptw(CPUARMState *env, const S1TranslateResult *s1,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint32_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldl_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldl_be_p(s1->hphys);
         } else {
-            data = ldl_le_p(s1.hphys);
+            data = ldl_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldl_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -309,37 +301,29 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint64_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldq_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldq_be_p(s1->hphys);
         } else {
-            data = ldq_le_p(s1.hphys);
+            data = ldq_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldq_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -467,6 +451,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     int domain = 0;
     int domain_prot;
     hwaddr phys_addr;
+    S1TranslateResult s1;
     uint32_t dacr;
 
     /* Pagetable walk.  */
@@ -476,7 +461,10 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table, is_secure, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -514,7 +502,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -590,6 +582,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     int domain_prot;
     hwaddr phys_addr;
     uint32_t dacr;
+    S1TranslateResult s1;
     bool ns;
 
     /* Pagetable walk.  */
@@ -599,7 +592,10 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table, is_secure, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -652,7 +648,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1228,13 +1228,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
+        S1TranslateResult s1;
         uint64_t descriptor;
         bool nstable;
 
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
+                              !nstable, &s1, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1

