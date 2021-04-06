Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1689133lfr;
        Tue, 6 Apr 2021 10:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzptgGuvWFbSi7XR9sgYxTUXrUTgS3NRUdOpPJvUB2VJFWD/fHnKgg6v3CmFFFX0nOQ06C4
X-Received: by 2002:a02:c017:: with SMTP id y23mr30284375jai.3.1617731049702;
        Tue, 06 Apr 2021 10:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731049; cv=none;
        d=google.com; s=arc-20160816;
        b=m80iE14tYoL1LH32GeAPSoVOBMuLJjZhhe9mYHjnYMMA6hzN+4IWVD1dCcKlAt4vFo
         H+jtLXbPRzC9XV/J/gEPPkIgVYygP1HdPD+adJHDxepB1nTWzHmyBRQy0BEMTreAVBJC
         xvcVGvDWp5nqtPJGFM8ab98wmqGLzqOaoQIdplzXa5CHWZHu48z02nN1KRQnm0iW9+6A
         xEISG9wE6eaAHhU71XxGjWVH58TZh+r3hvco0TknmL/C5ZsLoAIIbcpXGQUyBzXCsFpH
         8ChnvzLDcUE31A7luQtEgVWXhbY5gndSYrk+AWhgzfnXyBNuRt2G28mBt/uguO2Ks/Nh
         UwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
        b=WciIGNashPx93e5toMCui3ZgxKwdbHDoFT0xz2VVkruPdkZo03Lmr/R0p5pEJgglmX
         keywh7/IHzzKAkMbvsDiy6LVBGD5SpFjrmMo+j6wcWo8splrWSYtE2T0H4hqPiC/e8s8
         4FAo4RaM+O0KGQ7NoBe4C4Df8z7+yeigxieE9/rVVkAJ11gvuJYrTSDydtTvYrUQepim
         89kZ9z8hMVyY1zAF++vk40LpMZwhCa2ehc97+QJhe6RyKjX3Vqru6nfZdrK/2hl7qCQf
         cVTl0sijQEv/ArsbgZ7Ozvo3CEtGboRbM6RUOXk3Ld50kz2FB3ExqJhDUO9B6WFQDvSE
         a8dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X/xm6Ep5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24si17714775ioh.28.2021.04.06.10.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X/xm6Ep5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTpkG-0005sF-TS
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgv-0001fe-H7
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgr-0006J2-0B
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id b17so7244791pgh.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=X/xm6Ep5i+3WG9oCNPKExXqJNHZTZUZo9HQfDwtMnsP5WgJECs90FR9/S1r5qNNJBa
 lkmwpACXwZHh9u+8vihMS+7CrVNHX/AaEwNjowi0Ka3K0N/8zEgF9JodWqRqp12KziSe
 rNF9gmmvvvSWjTRAedBDLLZWSDK3icm836KQLBYAYikdK55udG92S1zlmdF65mu1B2yB
 wdbIUNN+XzcErvMdKLLq0cKb5Q6z1Hx0SiK49Vd7p1Ne9hdAKkUMo/1rVotRYO04Emnt
 NdIfpdAFmR3JKsveCZJKfN1ZrbAqD0wDgNzRwWtZK28mxQ4AgH7i92yWpDXDXwMYc1BV
 P4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=EbmQLfehi78EnKp0QGf69eLEvthrs5ioGg3Qfa7bbMbHGEJEsW6dIi8VjZFdjneA+u
 jcWCekL1E1bTME9krQguIBiiuvg3zlVp3/4sdlmn+uHwEi6SbskPhKaP09K5RTmKVjkI
 nNZ3zoEGF2STuKF4LEYVxv7glHkZIUI2qAePRsVPwmTAWI2m8uhitA5NuzRkRBl0wKh+
 60tHdLyznatuBVuHl/bRqfh9ySElWyL810EdmK9fa37r8QDqvocmsNEobstHAhm7cZJG
 TSyM7qjrvd8Bn6pY6CL5KlB2LV3jQI+ePNa8sRuGL6fDf6VVeEazvFU9iEqAvY51v3V2
 eaKQ==
X-Gm-Message-State: AOAM531dUsAJxE2rcJLFJ1CMF9eqp9tOji+kOppEi2hxKu6W6sB5qsAs
 kpUX8RoCFY9KTlsCYfIGDmqUBZAupxTU6A==
X-Received: by 2002:a63:dc43:: with SMTP id f3mr20047475pgj.290.1617730835344; 
 Tue, 06 Apr 2021 10:40:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/12] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Tue,  6 Apr 2021 10:40:21 -0700
Message-Id: <20210406174031.64299-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rvOwDN5qWPbh

We can remove PAGE_WRITE when (internally) marking a page
read-only because it contains translated code.

This can be triggered by tests/tcg/aarch64/bti-2, after
having serviced SIGILL trampolines on the stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 0bbb9ec346..8be17e1b70 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -83,7 +83,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uint8_t *tags;
     uintptr_t index;
 
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
         /* SIGSEGV */
         arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
                          ptr_mmu_idx, false, ra);
-- 
2.25.1

