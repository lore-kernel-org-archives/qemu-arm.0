Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp244059ejt;
        Tue, 20 Jun 2023 05:45:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4I6aODRm/wFHtbrK+nUKfWPWnqhb5MxcQhx6mESRnb878+Fn5fMAuey2ykzV5drVqvCtrV
X-Received: by 2002:a05:620a:8b82:b0:75b:23a1:452 with SMTP id qx2-20020a05620a8b8200b0075b23a10452mr11026303qkn.24.1687265137522;
        Tue, 20 Jun 2023 05:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265137; cv=none;
        d=google.com; s=arc-20160816;
        b=GjToiNLi1VhguQt8VhDyM76Z4qYOfi23Yeb46KcuKMjoRhqySO9pLr6J/FJ+x6yVcg
         14gwyJGRNgh0tMu8MhZ5PzxLRVWo5mljjZfgoCxeU3fE4ncbgPcHofCkNZfymQoJrBlt
         BRO6X03YXRhXU4XKQBPw++p4ai58sFSnZ/PAtJV5RhNTuqdVMVZsjZBrFtvMp7JG/oqy
         S0C0fY3fNF4eVUKPDGSEkdc4atrFjlzAW/5pNUa86JtH0yoJGnrqrpLGSgWZwr90h8se
         ztZN8CVks6A/GQmgUOZrmXqA1MGe9amJEbR55BIE4Ea2iK7A96GPOe9RYugDH5rTJgkZ
         U5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gZoCPFOzdlqGrG+xNAx7E2r/mp3y3fmrhU6I+AHQFUA=;
        b=QoXDl7r7LvGOuvysJGARlCyTUq+0LOodR7OlMMBXwIeyJZpFCecE4D0FMafzX0/p6y
         673hhgu84AucJ8tQeFGxk8vqKh1Ywflb202TC/QitdEmo2NevSYLogDFTktlMkww9LI3
         9nj1iBmfWhKis2469o6YS5yLt8/UclxyfK8nxh9jpOHihMZcUrD62VMGarhiskYoqYGU
         PY1JiMd4mUu7O2p0BkkpPmsCLDaz/WJ5igTBNhyfdc9eKfRj8WxmIVCZzP4gVWfuVhMV
         a4Y1LWsptkAoRo+U+bruIrV72UfwK3ay5guH6k5bbmJunV9WZ786OVdS1B2BRtQwKVS9
         aqzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rmZ17cyz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a05620a16d000b00763a3b1b597si763887qkn.81.2023.06.20.05.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rmZ17cyz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBaiu-0001cJ-1K; Tue, 20 Jun 2023 08:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaiq-0001XW-9z
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:36 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBain-0001zM-0k
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:35 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-519f6e1a16cso5494975a12.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265071; x=1689857071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZoCPFOzdlqGrG+xNAx7E2r/mp3y3fmrhU6I+AHQFUA=;
 b=rmZ17cyzWMyEsHX3V9Kbr6fJBPvs3oNk9mpOh1U8uOiTMPCBlwAdEpv5N7YmlH20xA
 OrFLnAV5Xfifk8bNGMsc9CMnSvkXJE/r6HXmPTkcQqR5tExRILMfFhbg1DfmrMpW6nxX
 7ZiOU2+dZ/OCDdbGjsrEZwSK1d1pdR0g6N+nCqmz+fcEjIMGzJzVnQA6q18nLVeQ0904
 8L8CA2EbvIiKi684HDaHgQJlLnCTs2/kN1lNZ3J1ps7N+coZ2Uva2oGKeuR5ygYS9YpV
 wx7QfV5P0g4UP9pvlZjuh/MrJvrZnDDOI9EcD9p8apszaeraBvRXJdOn031RpZ106sVG
 xjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265071; x=1689857071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZoCPFOzdlqGrG+xNAx7E2r/mp3y3fmrhU6I+AHQFUA=;
 b=YcNHoQbjX+lNGmuu156/oi/u7/zZuHHnBtomwD7bpTMnUJ+KjpeuRLZWFgY65+OzFI
 uOhlemRLn+e0Hu6flctsOmMG7ZD2VM1AIdvr8iigRz4jIeI3mAlRwAqaiEpKIzyXXsia
 NuqmFO87AgbnlSEuLOILXixeNqCtbwQD7iPzeZNoyv8ElF2yR4HqHvq5qYAdoN1tmsfH
 I8bdbFjHqdr6vORY1aMf1L6eTLR8/n7w4guowAG1HnaiHBO5zExL+JWg3CjyE/jVbaeT
 ucH4nCEEr1MuwqWqg/3iGqQQzFV8MPk0eN79QEkCi6YtzYl7X2JJYZJNDxnAVjWgGs1W
 apqg==
X-Gm-Message-State: AC+VfDwH2YJH495DQ6UWV74ynp2zx1Vd/0DPvTChVi8Wpo2qor4/WkPG
 AA3eglDFO/qzhKnrh6VPC0XzA1PVeQM6oRhdNso16ur9
X-Received: by 2002:a50:ef03:0:b0:51a:453b:a49a with SMTP id
 m3-20020a50ef03000000b0051a453ba49amr5738656eds.33.1687265071580; 
 Tue, 20 Jun 2023 05:44:31 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 11/20] target/arm: NSTable is RES0 for the RME EL3 regime
Date: Tue, 20 Jun 2023 14:44:09 +0200
Message-Id: <20230620124418.805717-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8rDvTFb5wb98

Test in_space instead of in_secure so that we don't
switch out of Root space.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e1e7c9a3d2..ea0ad56f13 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1275,7 +1275,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 {
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_secure = ptw->in_secure;
     int32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1291,7 +1290,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
-    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1453,21 +1451,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddrmask = MAKE_64BIT_MASK(0, 40);
     }
     descaddrmask &= ~indexmask_grainsize;
-
-    /*
-     * Secure stage 1 accesses start with the page table in secure memory and
-     * can be downgraded to non-secure at any step. Non-secure accesses
-     * remain non-secure. We implement this by just ORing in the NSTable/NS
-     * bits at each step.
-     * Stage 2 never gets this kind of downgrade.
-     */
-    tableattrs = is_secure ? 0 : (1 << 4);
+    tableattrs = 0;
 
  next_level:
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
-    nstable = !regime_is_stage2(mmu_idx) && extract32(tableattrs, 4, 1);
-    if (nstable && ptw->in_secure) {
+
+    /*
+     * Process the NSTable bit from the previous level.  This changes
+     * the table address space and the output space from Secure to
+     * NonSecure.  With RME, the EL3 translation regime does not change
+     * from Root to NonSecure.
+     */
+    if (ptw->in_space == ARMSS_Secure
+        && !regime_is_stage2(mmu_idx)
+        && extract32(tableattrs, 4, 1)) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert the relative order of the secure/non-secure indexes.
@@ -1476,7 +1474,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
+        ptw->in_space = ARMSS_NonSecure;
     }
+
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
         goto do_fault;
     }
@@ -1579,7 +1579,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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

