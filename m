Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp644524ejn;
        Thu, 20 Oct 2022 15:39:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6p/4J2t4HZwwDg1mqhtykiUrY/y5ss5bSrlR9fNo+2/UHOOm7MtAWBfg48JJZeTY+gl4/c
X-Received: by 2002:a05:6214:2603:b0:4af:b5fa:71e3 with SMTP id gu3-20020a056214260300b004afb5fa71e3mr13244388qvb.61.1666305536431;
        Thu, 20 Oct 2022 15:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305536; cv=none;
        d=google.com; s=arc-20160816;
        b=MZOAVRAq5MiwResVYhR4PHzspUH9zl3i3rQINIEmiUMHOoI8wpNFxfbCIZEW2krI5V
         SSVxn8Y52sNFIE1PX4cPNW+UF9Pu5XxWe7SGpTDus12UWA9UCyaQ+EmsUiI9FW0LX6UF
         fal2UL5xjzPLxuhO+hQatTdpsOxejSIYySW0wXgW+CovphlG69Pr67jGtrDK4+D4cG08
         p1B6NT3ZChDQ4ucW8m5lvA7FBCw1gRp0APWWzrFBaaCM3gKJxPnZgvMzAJRLr3Z6OHLY
         kTJwdykPbwW3HU/MbsQQSU7MMtBvRzF9PXxe5PPjAH5PJQF6vJqjEel3qEA7xt/oCVsB
         bE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TugH2ukoL/GP7ZN02ws3Cq0+tk08ipGAjprVUPkbIZQ=;
        b=FP7Ta+RZYUJPf+eqwFrZHP5iESHaOcqq9KJK/KoJ88swq7L80sEPFsuChsuWaypvZv
         Ws6otwSPfFBouyXIpz0OF2THemlMDa6nWUEny/FDnG0faHC4AqLS7O3GsMfTO0izxqVS
         fOujJV/5Ll64G2EG52yKLjipe0sTsnWrPvXKdvFIxAi74uIjG5ElRjYICU3P++6mzRNV
         Fe0V8FNsUPUdKgWMH2PZi2zqPHR97fOR2LkQQ8Meoo/uGhDYrzThvjPQEV9gvkcCcneu
         BD6F+SB1+2iOGrSAQx3NSaJwIaaL/E065nrVDPlcVSfyekVWeE82C4xpzkOg68XA9cPD
         Z3yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5AbGgjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj13-20020a056214528d00b004ad613215d2si11430168qvb.424.2022.10.20.15.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5AbGgjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleBj-0003FK-Rp
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:38:55 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ole9g-0006RW-Fr
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9V-0006HR-Mm
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:39 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9S-0000z8-NA
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:36 -0400
Received: by mail-pl1-x630.google.com with SMTP id d24so635382pls.4
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TugH2ukoL/GP7ZN02ws3Cq0+tk08ipGAjprVUPkbIZQ=;
 b=I5AbGgjBHQqWVDMC84nSRRgKN+nHB4R0ixO6NJySBvvJBHOeKWsUKjF65HnbiBfhki
 sDaRT2BmireEGvPeS1tEGTajg2ferb3VU04+k6Q/JuVCLY1skiS80Y7mc5pFVmM/YTTy
 uF5jW18bA3UcUa4Zz6x4VHwKKqRS3JaPO8bvIHMBrTHi3xhIS3POa2xMDOcumr+bd0xp
 RbufC8LidcqYNkLEnH5I6JFdek9mwQ34L5PLIwKJ0gfX2onhAdQEgwFyX4zKgJrxz7tZ
 X12CuxwCzrujz8/VRithoBI9PcJ3dYPrPx3o4p0cFEuh0CS10DoZz2t6jESMmdknwH6K
 CUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TugH2ukoL/GP7ZN02ws3Cq0+tk08ipGAjprVUPkbIZQ=;
 b=xMyPD50hZI7D+T/SC3Nx+j8q4qBsnhq56qmOT++2svsGfrXr/AdbcPIPP9VpnhC93d
 JWsQ+xN5/tDjyJaLrANn9kzeiRkisArXigJHB600LxYNHFaa0ekCJPxckXRWFIKCy79B
 6D/NWPXXK+0OtemyN+kP5Kdo1F/0oL93pnB0W4VshUQIUWc20ioG54uMwWSZwuCugMc6
 1wPoJVgmfi43s8ZwlSXNwaihlndvVocrCKMbEB1G9C9Lu3vyrqgBNN3CFPJ3Sar+Ko9U
 3UzhoDim+4Z9TQ7vNNyYz7VfEmTD6ME+SXN/PK9tPHgBwXJJT7ujEmOKTlfggiOAN26M
 j1og==
X-Gm-Message-State: ACrzQf0eE4/lsGxPy4WM1LhNdUXEwFNcIMlOgrYSnkQRSopj46rnf2pb
 uauFI6Wuv16lbQraluyvsT/RCw==
X-Received: by 2002:a17:902:c94b:b0:185:2d36:9dc6 with SMTP id
 i11-20020a170902c94b00b001852d369dc6mr16471138pla.68.1666305391980; 
 Thu, 20 Oct 2022 15:36:31 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 02/14] target/arm: Add ptw_idx to S1Translate
Date: Fri, 21 Oct 2022 08:35:36 +1000
Message-Id: <20221020223548.2310496-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tCmFGSlCoM8C

Hoist the computation of the mmu_idx for the ptw up to
get_phys_addr_with_struct and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 71 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 004375e02b..161b7922e3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,6 +17,7 @@
 
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
+    ARMMMUIdx in_ptw_idx;
     bool in_secure;
     bool in_debug;
     bool out_secure;
@@ -233,33 +234,24 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 {
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    bool s2_phys = false;
+    ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
     uint8_t pte_attrs;
     bool pte_secure;
 
-    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
-        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-        s2_phys = true;
-    }
-
     if (unlikely(ptw->in_debug)) {
         /*
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (s2_phys) {
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
-        } else {
+        if (regime_is_stage2(s2_mmu_idx)) {
             S1Translate s2ptw = {
                 .in_mmu_idx = s2_mmu_idx,
+                .in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS,
                 .in_secure = is_secure,
                 .in_debug = true,
             };
             GetPhysAddrResult s2 = { };
+
             if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
                                     false, &s2, fi)) {
                 goto fail;
@@ -267,6 +259,11 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             ptw->out_phys = s2.f.phys_addr;
             pte_attrs = s2.cacheattrs.attrs;
             pte_secure = s2.f.attrs.secure;
+        } else {
+            /* Regime is physical. */
+            ptw->out_phys = addr;
+            pte_attrs = 0;
+            pte_secure = is_secure;
         }
         ptw->out_host = NULL;
     } else {
@@ -287,7 +284,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         pte_secure = full->attrs.secure;
     }
 
-    if (!s2_phys) {
+    if (regime_is_stage2(s2_mmu_idx)) {
         uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
 
         if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
@@ -1282,7 +1279,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        ptw->in_secure = !nstable;
+        if (!nstable) {
+            /*
+             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
+             * Assert that the non-secure idx are even, and relative order.
+             */
+            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
+            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
+            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
+            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
+            ptw->in_ptw_idx &= ~1;
+            ptw->in_secure = false;
+        }
         descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -2468,6 +2476,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
     ptw->in_secure = s2walk_secure;
 
     /*
@@ -2527,10 +2536,32 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
     bool is_secure = ptw->in_secure;
+    ARMMMUIdx s1_mmu_idx;
 
-    if (mmu_idx != s1_mmu_idx) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+        /* Checking Phys early avoids special casing later vs regime_el. */
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
+
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+        /* First stage lookup uses second stage for ptw. */
+        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+        break;
+
+    case ARMMMUIdx_E10_0:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E0;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1_PAN:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+    do_twostage:
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
          * translations if mmu_idx is a two-stage regime, and EL2 present.
@@ -2541,6 +2572,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
             return get_phys_addr_twostage(env, ptw, address, access_type,
                                           result, fi);
         }
+        /* fall through */
+
+    default:
+        /* Single stage and second stage uses physical for ptw. */
+        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        break;
     }
 
     /*
-- 
2.34.1

