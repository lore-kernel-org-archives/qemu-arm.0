Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2217301lff;
        Mon, 2 Aug 2021 21:35:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyepalNI+R3oDlTDVva9SWMUwzLDUX2kjf5RvQ2ZDS/1sSXNWnN/BKySlfM0GIHYOX55dYf
X-Received: by 2002:a02:90d0:: with SMTP id c16mr17625721jag.106.1627965310115;
        Mon, 02 Aug 2021 21:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627965310; cv=none;
        d=google.com; s=arc-20160816;
        b=Iz3LWDf2EZ5+Un4AsKLhEybXGmwIgqIGCS9xAgvfelx1ySQAhkBBQFPxQjZSEvu6ey
         BAuErc3cUCkEOLov7/aefrxp1klIbmKFdMHP3Yt/tVoqpgtBQS7w0N6i+jnNtycCD+kk
         tngYo/fg4+mactqPK0Bg8EIR7y/CW2YUkUSke+X87Ga5sIjMtVwQUqPVSdhSd4yEp/91
         DaMhK/563+swE9C45F/ccIn4nFLa+xogkuOFkBrYDh80TSUrheg6ofH7VeVPyKBHF9+O
         FU2TR67lq4FSlGHcdPTMzmwETUDXCjFDc3aUJK7S4cBrInsqKfolnQIF//ngrNP97P/c
         qYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vcey1IaftmTAFoPi1JXk0SLrU7sPrAiRY1q5NRBsbUE=;
        b=tXIOSmF+HBmlMsvv+3ezYyHXt1WUIdP2SO8pv/A4bTFpOMsqkjlw3H9HWJ69zJ9bgE
         Dtq02AeZTJkCMLRQhHgT00n8WbihuT1BzCIuJKncK24qZHz8IIkQGTpfXRHt1gRORFIk
         nd2uLVCEjwvGDRglAua+yg8E9Fq+smVf5QzYIFoEJYNpUKb1mpGjg0wLaC08VoGY0iBq
         hx0Ryy5ZQUYpeiq6/w6XvSzqs9W4JjMNuEzTIsEp9n7eRXTRoEGZyByL8D2WuyYPemkk
         lf1uCOvWeKBgazZqzDBgLAr22/pgZz+CcfKK7A9GRxd35AM9Oc/2Dw/t7NAzK9kBzjz0
         C3eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwIK7SU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si13019607ilq.87.2021.08.02.21.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 21:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwIK7SU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAm8z-0000n6-BY
	for alex.bennee@linaro.org; Tue, 03 Aug 2021 00:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt1-0005K2-MS
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 00:18:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlsy-0005BB-9L
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 00:18:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so2080170pjb.3
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 21:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vcey1IaftmTAFoPi1JXk0SLrU7sPrAiRY1q5NRBsbUE=;
 b=IwIK7SU0lS+HAmE1XdJLzfwZ5E1H+p2TCGZnkm7qHZaCOET9m4ooQVfijL3IIccpv3
 Mj8A8LaZc0vZEYY6iszCf/bUJRicuRSCXcg0HE+rEWhxYg2+7Nv/QWM3nvh4nKY2/lM6
 48ZCCMFFFKBbUgDyTKJeamocSLl9Y864cg6pw3uIT3WDqt9mpc7HgqhCiKqU2SOMFT7Y
 nb6HbYoBF5LMyMBRNBnFZ9PZVCJCFLl7qsrh1ndGVLntWo72ex6PG4+7wtGa/PuZ16FY
 7IYQId1dLvWI129UCgzhdbDgyeYkn1Sax1VGGJ0qa1NZ/PZzS50x+OSSJGcsIYE7sqSq
 O14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vcey1IaftmTAFoPi1JXk0SLrU7sPrAiRY1q5NRBsbUE=;
 b=IaOcf1uTE+Q9daTSUPhi6zsUO/u3zSMlONvc+OUawD71bgn/02SA3EaGYBZnkPyEOH
 Jyps2RIwWaxlMg6XpM6tZEbuP6S/f8PdXsIyehjE5HNN6iGCGIEk30eerk5KMHzdEBAL
 58sP7foQDU7rK2OtRoc7/D1oe5Ex7oJhR57zF1+w6b0Lv6gq0mOOTE322oPLytK4oqEc
 te/dBcwFMfBzgftbH4p7ag6v1/XeBAFTQ0pmkR5ncvsoyw0EdydB0rVIEKSLGaG6zqPj
 O+7R+3dq3SupfPKcncxZvdBxmwVed6NTDDoA37HDm1oZ8pRb3h7FDPdxdqErvfHGiwLY
 LKGQ==
X-Gm-Message-State: AOAM530YVY5amSQrB6Aagq1mKVX2cHHViwQO/urbauBO6ZXAAulmI2F1
 tVrb1WggwJZC5hX0eClIx7Fn97x+nBCGLQ==
X-Received: by 2002:a17:90a:b10f:: with SMTP id
 z15mr11309931pjq.56.1627964314910; 
 Mon, 02 Aug 2021 21:18:34 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/55] target/arm: Use cpu_*_mmu instead of helper_*_mmu
Date: Mon,  2 Aug 2021 18:14:28 -1000
Message-Id: <20210803041443.55452-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wCTkHn5vszbY

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 52 +++++++----------------------------------
 target/arm/m_helper.c   |  6 ++---
 2 files changed, 11 insertions(+), 47 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index f1a4089a4f..17c0ebebb2 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -512,37 +512,19 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
     uintptr_t ra = GETPC();
     uint64_t o0, o1;
     bool success;
-
-#ifdef CONFIG_USER_ONLY
-    /* ??? Enforce alignment.  */
-    uint64_t *haddr = g2h(env_cpu(env), addr);
-
-    set_helper_retaddr(ra);
-    o0 = ldq_le_p(haddr + 0);
-    o1 = ldq_le_p(haddr + 1);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        stq_le_p(haddr + 0, int128_getlo(newv));
-        stq_le_p(haddr + 1, int128_gethi(newv));
-    }
-    clear_helper_retaddr();
-#else
     int mem_idx = cpu_mmu_index(env, false);
     MemOpIdx oi0 = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
     MemOpIdx oi1 = make_memop_idx(MO_LEQ, mem_idx);
 
-    o0 = helper_le_ldq_mmu(env, addr + 0, oi0, ra);
-    o1 = helper_le_ldq_mmu(env, addr + 8, oi1, ra);
+    o0 = cpu_ldq_le_mmu(env, addr + 0, oi0, ra);
+    o1 = cpu_ldq_le_mmu(env, addr + 8, oi1, ra);
     oldv = int128_make128(o0, o1);
 
     success = int128_eq(oldv, cmpv);
     if (success) {
-        helper_le_stq_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
-        helper_le_stq_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
+        cpu_stq_le_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
+        cpu_stq_le_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
     }
-#endif
 
     return !success;
 }
@@ -582,37 +564,19 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
     uintptr_t ra = GETPC();
     uint64_t o0, o1;
     bool success;
-
-#ifdef CONFIG_USER_ONLY
-    /* ??? Enforce alignment.  */
-    uint64_t *haddr = g2h(env_cpu(env), addr);
-
-    set_helper_retaddr(ra);
-    o1 = ldq_be_p(haddr + 0);
-    o0 = ldq_be_p(haddr + 1);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        stq_be_p(haddr + 0, int128_gethi(newv));
-        stq_be_p(haddr + 1, int128_getlo(newv));
-    }
-    clear_helper_retaddr();
-#else
     int mem_idx = cpu_mmu_index(env, false);
     MemOpIdx oi0 = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
     MemOpIdx oi1 = make_memop_idx(MO_BEQ, mem_idx);
 
-    o1 = helper_be_ldq_mmu(env, addr + 0, oi0, ra);
-    o0 = helper_be_ldq_mmu(env, addr + 8, oi1, ra);
+    o1 = cpu_ldq_be_mmu(env, addr + 0, oi0, ra);
+    o0 = cpu_ldq_be_mmu(env, addr + 8, oi1, ra);
     oldv = int128_make128(o0, o1);
 
     success = int128_eq(oldv, cmpv);
     if (success) {
-        helper_be_stq_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
-        helper_be_stq_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
+        cpu_stq_be_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
+        cpu_stq_be_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
     }
-#endif
 
     return !success;
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index efb522dc44..b6019595f5 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1947,9 +1947,9 @@ static bool do_v7m_function_return(ARMCPU *cpu)
          * do them as secure, so work out what MMU index that is.
          */
         mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
-        oi = make_memop_idx(MO_LE, arm_to_core_mmu_idx(mmu_idx));
-        newpc = helper_le_ldul_mmu(env, frameptr, oi, 0);
-        newpsr = helper_le_ldul_mmu(env, frameptr + 4, oi, 0);
+        oi = make_memop_idx(MO_LEUL, arm_to_core_mmu_idx(mmu_idx));
+        newpc = cpu_ldl_le_mmu(env, frameptr, oi, 0);
+        newpsr = cpu_ldl_le_mmu(env, frameptr + 4, oi, 0);
 
         /* Consistency checks on new IPSR */
         newpsr_exc = newpsr & XPSR_EXCP;
-- 
2.25.1

