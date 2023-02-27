Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5119867ejc;
        Mon, 27 Feb 2023 15:04:38 -0800 (PST)
X-Google-Smtp-Source: AK7set83r89eB1cueARc2Qb4q5JIAwLikb5ANjzwCTJPa9GxcQVLL2wf1nhFptiBD3NBtb/BJ9S9
X-Received: by 2002:ad4:5cc7:0:b0:537:4b09:670f with SMTP id iu7-20020ad45cc7000000b005374b09670fmr2488998qvb.25.1677539078258;
        Mon, 27 Feb 2023 15:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539078; cv=none;
        d=google.com; s=arc-20160816;
        b=jBkw4wwjDEzF1Wtp0r0p0ELJyBwnfW/fzQXnpaNZA7qisM8iHA7xa6qrlBDMzDZRFk
         6rYzDIFdNTxROqwVsGzgfg4d2230JxYKdbdukhra0wm5wjanQIseIfSiI9rGGNrRxN9y
         DTOYZ3FtuAUhvQdYsKxSyqJnjQlmnPSR0iBzh1qQXgZbWQmh1JDEabyilKWA/G1sPvtO
         1qCRI4A4otxcddZMmICPDjmmnwEJMHQZNRRlescT+tquInZk9UpfLxjnS5Z497G79dF/
         9BkqJ+nHFnlVMBqkPsiVyFjad7orhAm7aaIF5zeWO1qev7FbXpt5AicmDhMWg2+jaag0
         OkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PP4E13jT/Sv96Ax+VfQqfeV0Z6Vd+p408nT+Z3wCuJQ=;
        b=MaaywKKdDhkHBSonOnXottxnp0kpe7kVcFy9rST4jle90Zan46a4CnxfzQfTc3L3cb
         cG3dQQwspiQjNMOivp7/788XN/jIboaD/zFb6HS82x5xWaTbn9AbAfgyG9Dtzn+ubG2h
         DVJI/VGnVmzGlmSZNtQcojyBwKMWbQKXVG81jx/dcbovY0GcrARNIRLN4PopVncxJcjT
         B0EstY64CC/dBIXDm3quYpzw1GwJ6c421yP5NrIK294RWEPVScAdBGJjasDtm7kUa1Me
         4CbWHRCs/pVXM+yBZfCMP8fnKggIthfL/CytuUVDz0SVuOEMO7NSfflb8Z1ZIyClOX63
         5HVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uInLixzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020a0ce48c000000b0056eda581378si6949248qvl.34.2023.02.27.15.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uInLixzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVT-00009I-DY; Mon, 27 Feb 2023 18:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV9-0007tq-OZ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:55 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV6-00013C-MH
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:47 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7780525pjz.1
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PP4E13jT/Sv96Ax+VfQqfeV0Z6Vd+p408nT+Z3wCuJQ=;
 b=uInLixzRQQtO0QsfPkZ79882CFSX6TYtQIKw/HkxQ3NVEtuHbRxS++K5clg+7Eg0pG
 akqGN4ujRdtHP8v0HnIMy/HZuFKIxatqNry0JrHbJipjh8BQjQsSQf8tqczJgyxUDtKi
 tNdkLzmzYPi5AXdFWNJO9Y3YLOjG8VaFFWBSvthN+hSU+0fo9gPGFm/MU9OVOyOl+YWC
 5NDPyO4IbdietvTGxrDSrX2rux8xJSoTHmQ11vkknk0zC9dB1CkANXB7hFsxmmxTc+hV
 KtUIVgX6JO7WzWgq+EJGJ18zavF2TasbdxAvsuL7DefTttAATHrPH9MEOHH2Qc7Eaxmt
 zSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PP4E13jT/Sv96Ax+VfQqfeV0Z6Vd+p408nT+Z3wCuJQ=;
 b=d2LEpl5jDVx1RxOolHrwRzGTeFi6V7OBspasgLK6p0o9NuvciQeRUMyqhkOfxMYJvu
 7AzwX7inh8l21HWbJ22BaJBLnZBG3wRtSkFP86hOV+FGIFsmUYPJ6b6zZBbq1cv+v0Pv
 U4nOAUFUiFfDLaJKvIWR69QK7J26d+0ewXaxXng8yRIq8vPPuPTx4eayASOb/PW5i3JJ
 VVz9drUtQzpmhbb1I8QnDIsYL8nB9rt7s60XPLs/hEiIE3lRcifaW/sONZvCiGDTni2n
 f1jDQtA4hYe6ffU/7in9szyFGp8ylX2JFUrZ7m/Z5P0W9LwfpmI0rzhuIKYODh3mhADn
 LIOg==
X-Gm-Message-State: AO0yUKXbsXbqzJ/L0VMpTPOGhBGwNCxgtR0q8nBTH+EGHNkfNHywFs03
 OJRkWugE+iX3eAG1O3c3c57UKw==
X-Received: by 2002:a05:6a20:6915:b0:cb:cb17:eac6 with SMTP id
 q21-20020a056a20691500b000cbcb17eac6mr999586pzj.32.1677538903324; 
 Mon, 27 Feb 2023 15:01:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 11/21] target/arm: NSTable is RES0 for the RME EL3
 regime
Date: Mon, 27 Feb 2023 13:01:12 -1000
Message-Id: <20230227230122.816702-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eIwltm8p548f

Test in_space instead of in_secure so that we don't switch
out of Root space.  Handle the output space change immediately,
rather than try and combine the NSTable and NS bits later.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 75f276b520..0c07e5e24f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1242,7 +1242,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1258,7 +1257,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1419,20 +1417,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
@@ -1441,7 +1438,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
@@ -1544,7 +1545,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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

