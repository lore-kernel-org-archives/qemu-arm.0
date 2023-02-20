Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706489ejb;
        Mon, 20 Feb 2023 15:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set965kgMF46+6FxpNI9YULaU2cOdwWFFBJNqpTXZ0gGs+0MWRsDCFJkK8BYDV6ZlN7totqJA
X-Received: by 2002:a05:622a:90:b0:3ba:2722:e8d7 with SMTP id o16-20020a05622a009000b003ba2722e8d7mr4067693qtw.7.1676935633557;
        Mon, 20 Feb 2023 15:27:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935633; cv=none;
        d=google.com; s=arc-20160816;
        b=Nm/DkSRI//Q8tsCIXYrXeke72eUkqFIIaoVJmzWDlTemrXQHILfcejDIoe5roEHI6U
         RdDgBqp9paBvVa+e81pKJdfx9GIyGorgYxc1/ZTGZ7nMFpIO/oczTwyMzC9HQPG4IS3+
         sqaoh8svkkQKpWGFM3BQzNanLblySJDNo8YwryRgNY0cjIDIL7McoVzN4zXpZo0Ntnam
         KfOsfCmFThZzlPV5BLW/wEiZFoiMZ6VLHutr6jOMLH6vXHDp9/D6IUzh4CKZtWMbPkpr
         KNo5IdQm3/n4FdIKCOcykyQr/FENp5vUGfJhaO1oXuUvYKzmSNr92qui7Ug7tNdLpat8
         Blyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9O4rQ+1tSrDA/VIHaikB47RvthTap5eXu1DpMH/jhqs=;
        b=n9plIdzI0A1pA/ym1wE0nB4+GqKetB/xT0teYTgRxdWXJXwg1Il/tb/mcWmo6E2p2+
         D4X6AnpDT1RX3Nolijv4CRW/X+rvlWUMxujZwsvmDdFXFF51Ck34MHxEQIw8Gmk/Oy/v
         LsX49jAWtywI/o6zu9O9F2Eu2PWSBDZLI+lNljneP1Rr7R7Zzc9aW8hilKLpeE0DqgdS
         99PpmjO72sLCeusGI52Cr1gwpTHjHe/BBMGTupfXBdvm7SDM06qEzr3K44z+jYzL3E5C
         QTIdeI8PrPoF8k2fADkSFmzsJAJbsHNVvyGkGij/51kX1C7zI59peWSQyTrGpfk28FfC
         XEag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A7/KCoOv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020a05620a2a0300b00719da35ca42si11662090qkp.586.2023.02.20.15.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A7/KCoOv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYc-00048M-5m; Mon, 20 Feb 2023 18:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYZ-00043a-Os
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:51 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYX-0000Or-NT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:51 -0500
Received: by mail-pl1-x636.google.com with SMTP id e5so4173347plg.8
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9O4rQ+1tSrDA/VIHaikB47RvthTap5eXu1DpMH/jhqs=;
 b=A7/KCoOvzdkchqGOJQIfJM9hQTufU2tNpCTEO9VwXDuY3E49vaflRpzqnfGj3L7wj8
 PzSsZGiEDQm36f5zCTtlpyrTCSmCzotgP4daU2b1/s+YLmcOTRxBlP/Yoadhl3UcOWta
 qa4OL9tAHQzVeHvDwQfMnDlC9U3MxtnrHlYF5diehNDjmrABFwEqt6iqEeCwhkJ09cSa
 lFX1gqWKE+s8LUNTySJATjVjRx7yxUphN8com+DzFHF0HjZ9yr/EzDPN7SUUxj33aafn
 uDAW+L9IWYfL1jp0xFib/LAb8HJjP2LFBnY7zq55ZfgaL3lwYzUQKBjelkqGVfsdPfYK
 cHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9O4rQ+1tSrDA/VIHaikB47RvthTap5eXu1DpMH/jhqs=;
 b=tcSRIjR/3NmbcNfgjdyhjH9srE9bfUfXl5s4svtTogr1qeO3CdtryNoXwQmfhr8oMZ
 dsFEj7dRGiodpCH+EwQBH0tOHmqFMZ0WbtvW9Q38tozHmrve40Y7XUqetnpBG0QMQXZa
 zJXNvuU3o6zbugJPPPtCBIgYJrvqx7EHOJxjHqqmWsER91D9V5tgpBXLz7x3/ZY8rPrf
 xE0OMO0ScyoCgO7ism/TmcIk6AchxcifVjA0lRQxLPszsqT3CLuvwAkyTI+Vb+LSi9QD
 H7XIgSG/ZG5mddObMjKnhNmB4Z9dP8nBX2W5wtrbyWIENHp4zi1/3Cp2AqN8QKr3kLzR
 1dhw==
X-Gm-Message-State: AO0yUKUEXHudxzTG/ngajw7rMzBxBJEcqsu9WjFiQ8SJ4X8SagsDS8Mr
 K2/TydJZyNOCz+Qm6Pd35QGS9AkLRFQGU5/z3mw=
X-Received: by 2002:a17:903:2305:b0:19a:a4fc:7f80 with SMTP id
 d5-20020a170903230500b0019aa4fc7f80mr6249197plh.26.1676935608092; 
 Mon, 20 Feb 2023 15:26:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 11/21] target/arm: NSTable is RES0 for the RME EL3 regime
Date: Mon, 20 Feb 2023 13:26:16 -1000
Message-Id: <20230220232626.429947-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7ZyPhrR4cLYI

Test in_space instead of in_secure so that we don't switch
out of Root space.  Handle the output space change immediately,
rather than try and combine the NSTable and NS bits later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7745287a46..d612e5f38a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1240,7 +1240,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1256,7 +1255,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1417,20 +1415,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddrmask = MAKE_64BIT_MASK(0, 40);
     }
     descaddrmask &= ~indexmask_grainsize;
-
-    /*
-     * Secure accesses start with the page table in secure memory and
-     * can be downgraded to non-secure at any step. Non-secure accesses
-     * remain non-secure. We implement this by just ORing in the NSTable/NS
-     * bits at each step.
-     */
-    tableattrs = is_secure ? 0 : (1 << 4);
+    tableattrs = 0;
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = extract32(tableattrs, 4, 1);
-    if (nstable && ptw->in_secure) {
+
+    /*
+     * Process the NSTable bit from the previous level.  This changes
+     * the table address space and the output space from Secure to
+     * NonSecure.  With RME, the EL3 translation regime does not change
+     * from Root to NonSecure.
+     */
+    if (extract32(tableattrs, 4, 1) && ptw->in_space == ARMSS_Secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert the relative order of the secure/non-secure indexes.
@@ -1439,7 +1436,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
+        ptw->in_space = ARMSS_NonSecure;
+        result->f.attrs.secure = false;
+        result->f.attrs.space = ARMSS_NonSecure;
     }
+
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
         goto do_fault;
     }
@@ -1542,7 +1543,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= nstable << 5; /* NS */
+        attrs |= !ptw->in_secure << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
-- 
2.34.1

