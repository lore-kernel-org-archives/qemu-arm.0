Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827073ejb;
        Tue, 21 Feb 2023 18:34:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/RwvelIMn8u+qKALhyO4CBe/ypV00b09it4tONDkFtPdINLLCmIKCnYKP7XHF2oXlG6yxQ
X-Received: by 2002:ac8:5c48:0:b0:3a8:e35:258f with SMTP id j8-20020ac85c48000000b003a80e35258fmr10125114qtj.31.1677033291201;
        Tue, 21 Feb 2023 18:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033291; cv=none;
        d=google.com; s=arc-20160816;
        b=q46D4AgeyzH07DCZs6nsSn2XGljtxeJd7miyCx5qTGPzxAukERRKewGAY4DlNNVVgL
         MEqpMYCNGuCvQnTwgvHLW2iTNHkPZB9Gjn/V9bbDysmALI2HzmWY4QMV91AT/yNYnPrb
         2VQdQ1dXns0aqf5SptCkfvxTbr+1jhRBkPUglHxOSycqrbhteFmGXqs//ZxJtlUgPgzA
         HOvzKbbLcdlrcEvwBxG9RqNVyT1xSfcRKjUQbGpVnTqvawhhAn4UvELO8WJOCXdDOXy4
         deecIpoSXIepPSCaLwVRm8eyUA6Xwz3whAt10PI/I4ERHZ5apjs6snwy3Y6h8T21cxB+
         CKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q+0eq15fAwExTOnJJP3OmVXwymVtdfUriRFeQ7/we5Q=;
        b=cFHzGOHSulBfFAU2SBm5f1ng17g6v+3jMdyp0+8nUA8p+PFTSrtOrh0JB/ujavFAxC
         enKLO/q0azx/SBOOE711Bg+tZjJ8bDQv45RywH7xq21q5WF9u0EGVP9NV74wZ0Aa2wec
         EeQNt3ou7Qn7D8ev9YdcrA7op68hPaQeDIrN1d1WtmcTSlyLuqOVp3cxwOIwGZh+kQZJ
         D8J3kXta1HN7JkKTOm7mK5BTJHBM5PG9chBlaAlcdDcIEHzBKHw8XNJgeMyC5fcspoHf
         egljuvmVcaCAHvRBzSxjPQg7kYu4qX7jH0NXhDsNHtesUvOPtcgaHvKJsDzE0Kqs1OTU
         A0qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOrSOeJq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21-20020a05622a149500b003b9a4eebe00si539474qtx.649.2023.02.21.18.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:34:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOrSOeJq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexT-0007gU-Gb; Tue, 21 Feb 2023 21:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexO-0007XK-M5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:10 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexL-0001hW-5l
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id z2so7364134plf.12
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+0eq15fAwExTOnJJP3OmVXwymVtdfUriRFeQ7/we5Q=;
 b=QOrSOeJq/rkXq46oJl7o3x/XrDMyw7N7OEO5LBmI4fmYu+zyGt9vFUcgdnjDtK5VaR
 flXTgYpiAAGF7jaoMZvIqmgyMtx69rBzQpTlwoh438PQKKnTh5m+OK8w8SOcsCckv6sP
 EGxwYN8tRdcgn/9VmRctLzD/celBjtgn0bbRiFOY8LxVN7Ep9N3JIGDCnTS9+h6sC5zq
 pSpI/YdJ/ckTc1DAn1dMrODrfFFgaE4yxiTASMZu6FKFdRUKoPKssZ6dMvPiOTvUCmdD
 AS/OvDjT2NCLUoAVe6OwDA2LyN3eMTLHf9oQyVAVwgdKdJBmMEqca9bxTTV7PeTdUl2u
 JPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+0eq15fAwExTOnJJP3OmVXwymVtdfUriRFeQ7/we5Q=;
 b=HczJuvl5I/vF/UBqQVoEXeyarhrdqjGg2bY1K1akDF6WCyh3TTO2byFdaKHndNY33H
 JGKySMR/NfqKlzhnkhvfanqCjfI+z4lqkIHWpjqw5wVXGnoXw4sF5AUxfpakXG8ewJwl
 QNRh4AfTDuBS5mk5fyCxsha0gXDYUQa724CdAHDMA+D1swtZ2j5dOWeXcwz9y+kCtXBI
 +DH3U0XSthiAB1fks7mJUCm2+wcXZxmWJHcYSf2MghM+yoG8hmWwM8OHZJCGUyShomAs
 4WlUhq8fuQ06pETBUQe5imvCnQ4Vkt186kUsyRA/fgxJEFI+gEo5u8SnfmBL/T8brY7n
 sXmg==
X-Gm-Message-State: AO0yUKVOMA++udgWtQoAYXCJV4KshyykjYqDQNi9ANiamf55/10+p5YL
 J6ShSjbDbXTZ5PN1HzMRnEwGOSR3RC/7uHMCZB8=
X-Received: by 2002:a17:903:2804:b0:196:1c45:6fc8 with SMTP id
 kp4-20020a170903280400b001961c456fc8mr7074025plb.60.1677033244687; 
 Tue, 21 Feb 2023 18:34:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/25] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Tue, 21 Feb 2023 16:33:29 -1000
Message-Id: <20230222023336.915045-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: sewqiUNAVfDr

Do not provide a fast-path for physical addresses,
as those will need to be validated for GPC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fc4c1ccf54..8a31af60c9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -232,29 +232,22 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (regime_is_stage2(s2_mmu_idx)) {
-            S1Translate s2ptw = {
-                .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = arm_space_to_phys(space),
-                .in_space = space,
-                .in_secure = is_secure,
-                .in_debug = true,
-            };
-            GetPhysAddrResult s2 = { };
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_ptw_idx = arm_space_to_phys(space),
+            .in_space = space,
+            .in_secure = is_secure,
+            .in_debug = true,
+        };
+        GetPhysAddrResult s2 = { };
 
-            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                   false, &s2, fi)) {
-                goto fail;
-            }
-            ptw->out_phys = s2.f.phys_addr;
-            pte_attrs = s2.cacheattrs.attrs;
-            pte_secure = s2.f.attrs.secure;
-        } else {
-            /* Regime is physical. */
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
+        if (get_phys_addr_with_struct(env, &s2ptw, addr,
+                                      MMU_DATA_LOAD, &s2, fi)) {
+            goto fail;
         }
+        ptw->out_phys = s2.f.phys_addr;
+        pte_attrs = s2.cacheattrs.attrs;
+        pte_secure = s2.f.attrs.secure;
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
-- 
2.34.1

