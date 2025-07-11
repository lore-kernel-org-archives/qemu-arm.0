Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC5AC83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 22:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaMb5-0001Au-UR; Fri, 11 Jul 2025 18:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYc-0007RT-9J
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:42 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYY-0008Rf-QY
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:29 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-40b859461easo1304866b6e.1
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 15:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752274164; x=1752878964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCFS6cqTwlg3fFOqku117fnhPK1D7OaRJaQ+ElcEeuA=;
 b=OK/3CtOtNlG1YwdCbDsLgaV0C0IR94svBNywGbUrkb8ap+wQS0I6mLjb2dt+WZ2uCB
 l0t2fZtDITQ1WhuA7eLSG7K125G+svmNy7Kd7KXlvguSJKWrQCXzdlRdOYtHVQc680fO
 e6CxxHxf/wE48x4F++sIwZHMvhpFEr6v58E0c2xBd4hlcY5y523Ail56qtJ43bGCNLmG
 xnm24wJSLa7r2wPXgK8OhCAesDFQ29tNo3yCP0PqjVcn+p9xwZioNlfKCWLI8885X18q
 ucWwwF7MCz3R4FpTTw3kpXAGxzqAQzeW8HF3wE/0bCJkOvecFxnMprXZ9JZTUF+qIMtz
 bkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752274164; x=1752878964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCFS6cqTwlg3fFOqku117fnhPK1D7OaRJaQ+ElcEeuA=;
 b=WHMLkilRsSRJOMIcRW6wzZkhS/yqNjxIc5mh7AZpfkYMRfXcP55cU6tnLsqVa7SaxZ
 KSV35emKxXrGUmkgFCPDf4aa5WN+wURshJAFrIkKCweP6kRCzq9jEEpcYTW7goMWqzir
 n59UT4eebwwm8Jws+yOwe79G0HjU9OxWzOLpaY+qXK9fNAXeBip7b8E6Um3Oc1eeTqTT
 9RLTDTXQZEGkaZWOEfogiXpoRlosaFBbgumhxTRgQ+QuqCNRdfE2awvyR53BxOyxaZjC
 ik2jSGjPVjvT49KQSxKdp7riY1wrpD+i+KJGxXsbDkCQWw1+Kt/or8FKhuEhTMSXCn2X
 kqKw==
X-Gm-Message-State: AOJu0YwOBK2ajkUB2NgUmKRLn+kYkjRu0pqyenYhEj1rDxyt6qCRGhV4
 NqFoonCXu/hVFWSJXbyFOHttlC6deuBrtHf22WSaiGzi9bah0TKkjBYvHEOj1cX7nQDT4bGUSWF
 oi2E5Zfo=
X-Gm-Gg: ASbGncsihG0muuqHCRkS9mut1fbbNaDdzpt6yOJLeOsQjmmAJf5mSajE/D1j1d30LRG
 EsW12Q8cTeZqtJ5RbeHlH2QUXkF2C/8FYgyTlvlOJnInmksRtg+Zj6GJrmPkWkemnIbyndcIV8c
 ZvXyxoZ1EoOuXknxbbxSwhbMMa7raVIWldnDn/NSOVBtKpVmg9AJ/u4JpF5UkQHgJ8vi4cXaM95
 FM6Wc8N/9PJmnsfRJwDkPPkHngYuLB/BJa9N0Vu8AakXIYo/R8PFEScSHKz7h5Y5SdNDurRKOw/
 u9gONInZZ4CxETQbf4oCYtljT+m7y7on5EVr4sT2AR9h7r4Xf45veSZfG8dvW73pp4Yq7of2bdi
 fIT7pKkXMWxqbdcNc/eV+z//3ak6rxGks8t11YN8jEpkPmMt6KIs1XkCfxWdiGu8ZkW3DvW8F61
 Q51TIKSaV4
X-Google-Smtp-Source: AGHT+IE0kbKNmv08MvHE23M3QnsEtA91s/oN4v56/+kvsVhJ/ISBjSMp6NA19DZO4UgR2OdUB31cVg==
X-Received: by 2002:a05:6808:3025:b0:410:f243:a502 with SMTP id
 5614622812f47-415659ac4ecmr3328808b6e.8.1752274164100; 
 Fri, 11 Jul 2025 15:49:24 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c6064sm696638b6e.20.2025.07.11.15.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:49:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 5/9] target/arm: Skip AF and DB updates for AccessType_AT
Date: Fri, 11 Jul 2025 16:49:11 -0600
Message-ID: <20250711224915.62369-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711224915.62369-1-richard.henderson@linaro.org>
References: <20250711224915.62369-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We are required to skip DB update for AT instructions, and
we are allowed to skip AF updates.  Choose to skip both.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1866c494ef..efbad7af1f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -58,6 +58,12 @@ typedef struct S1Translate {
      * and will not change the state of the softmmu TLBs.
      */
     bool in_debug;
+    /*
+     * in_at: is this AccessType_AT?
+     * This is also set for debug, because at heart that is also
+     * an address translation, and simplifies a test.
+     */
+    bool in_at;
     /*
      * If this is stage 2 of a stage 1+2 page table walk, then this must
      * be true if stage 1 is an EL0 access; otherwise this is ignored.
@@ -1929,7 +1935,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
 
-    if (likely(!ptw->in_debug)) {
+    /*
+     * For AccessType_AT, DB is not updated (AArch64.SetDirtyFlag),
+     * and it is IMPLEMENTATION DEFINED whether AF is updated
+     * (AArch64.SetAccessFlag; qemu chooses to not update).
+     */
+    if (likely(!ptw->in_at)) {
         /*
          * Access flag.
          * If HA is enabled, prepare to update the descriptor below.
@@ -3553,6 +3564,7 @@ bool get_phys_addr_for_at(CPUARMState *env, vaddr address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = space,
+        .in_at = true,
         .in_prot_check = prot_check,
     };
     /*
@@ -3653,6 +3665,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
+        .in_at = true,
         .in_prot_check = 0,
     };
     GetPhysAddrResult res = {};
-- 
2.43.0


