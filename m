Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5186848lfc;
        Wed, 28 Jul 2021 18:11:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpRo9hNBCeuKv1TjlBPnp4RlUxj55GasUuyd0g02yNc3auQnmMvEHahjhs9doHFJuyeNk3
X-Received: by 2002:a92:d8c5:: with SMTP id l5mr1801404ilo.79.1627521094486;
        Wed, 28 Jul 2021 18:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627521094; cv=none;
        d=google.com; s=arc-20160816;
        b=ktGBykH8/mxvfNbzcHYeDhtwX0QjZ2/EfNnhchsnOQNFDUdL2Lt54okgDGpFR/UZTF
         HgQIrsgtLPA/FWfQyqJfIUvCFXBEwPjkwJdsDE36sKn8RYXS4SXaXTFvps8FOVJ+GHo5
         8KlFzopzRes4KY257inYsNi82eo9WAuNLUQFbREKpgPWW6yQwte3DjmKzYsTmfpgGSLW
         ABsMMXATUVFVHcYzdNytZ6W6mT1FWqavpMFEAHxo6YdtxjqszmL1IcyMKGXQLdVgPR41
         0K21CRQQr8OFZD9uGzVDagMjKIxCL2Yy6f9peRpRrd73vY5b75abYG/lEphmBu5bfb0W
         S7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KtHrCMSK7Nl7NnSRCIKaSQmUffpETjRi2cgM4IGILXk=;
        b=YvNaei0WAZQCOFpe1IwwN/kjUCCRpwXyXz4OikJBHNkhPmagVlkwinF3tnwldC6GVe
         o23F80lEqkcJdETLFMfOPy5owD4oP6cdQGncEIMGnvb/8xQrLJ6+D9zf5RNP1L8UoYAR
         R/+yNRDI0MwMrQthIgDwyd0KYX3J9PuVu1FIqaQuPMY5B02pDrHiAIpoXlw92pWlY8wp
         Uqaaq/iH9g9AyoGbprFdIuTWcZKsmvJClryF0frYtMe90FWLXcCBUNfZYqSvUxgpI6dl
         aXt7nxxsJUAezM9ZbPXkaPXvfos4T4bU9lLsjJq1EhWqlynJLksCsAoWfkx1AYA8U4ow
         EI/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j3GNIJ/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si1496124ilm.61.2021.07.28.18.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 18:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j3GNIJ/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8uaC-0005Q6-1Q
	for alex.bennee@linaro.org; Wed, 28 Jul 2021 21:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD7-0005BF-BZ
 for qemu-arm@nongnu.org; Wed, 28 Jul 2021 20:47:42 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD4-0002sE-Ga
 for qemu-arm@nongnu.org; Wed, 28 Jul 2021 20:47:41 -0400
Received: by mail-pl1-x62e.google.com with SMTP id a20so4928833plm.0
 for <qemu-arm@nongnu.org>; Wed, 28 Jul 2021 17:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtHrCMSK7Nl7NnSRCIKaSQmUffpETjRi2cgM4IGILXk=;
 b=j3GNIJ/sGSFpN9dynQcKz//YSj3thPyDIM2xPSBXsFY7YNjyawt3BLpcgkGMmhlwQx
 UlxJdmNMW5Dbw/YAdQkyNV39lNiDL3qVg8Xb0ogopWVZC1L2eLj2x9srnJxOOB8ADKEX
 fT/FVMf4KSU7hcj53NWSjW8By7UrV7SRM4kp2oERWbj6GPBclEdxUJVVjZ07s9LjNFkc
 lXCw+dFAv2I364nAvS85xvKYa9Jt791URSCuj5R6Kc6Ua64EOzYKv9RR1BmKVY0L13fS
 kwDULizwgkVixdO+/n+Nu6wRALp64xULSneA2IsftFedR5zBUVd0CndCSKMV8BUobHz7
 KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtHrCMSK7Nl7NnSRCIKaSQmUffpETjRi2cgM4IGILXk=;
 b=j9Qx//xLUoKSx3lFgue5qPvtndcgOI1gp6IiHrfB4oK9SPPQcUJfZnsyk8aCOYOHw/
 kghTVJz5UrSuj7VVJ+s40xbmibgmmddxk1ASjW/pbyXe9PNN4kV4Zi+atu2E4ipdGR+E
 pLczznPyW7MY6tr6MG/xm7yCzC2N/4xvI+n7Iuw68ZQX3jgJAla4YBnyvNC9+OmCP42s
 hp0Voi8/RwhqCH0/XwYYuJf1VN/veM9GdqIiY4ED2d0oMZK87+oRvWeO3wQz7GrGS3js
 Itpewl70aJjaD+xekFaFfU1sHIhWn7MVGeyZSIkoL6xIRarWZaWYbRfy1uGLHRrSmYO3
 UmDQ==
X-Gm-Message-State: AOAM530ZnPTTG1S+X2Z/8AwMNZ8NPotbdw3PPtPUN6jzguz2zRUh/dgA
 VMX/IyjAaeVYyKGCfYyMN7Zi3fmNNl3bDw==
X-Received: by 2002:aa7:9ac9:0:b029:377:8e8d:910e with SMTP id
 x9-20020aa79ac90000b02903778e8d910emr2313159pfp.28.1627519655767; 
 Wed, 28 Jul 2021 17:47:35 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 38/43] target/arm: Use cpu_*_mmu instead of
 helper_*_mmu
Date: Wed, 28 Jul 2021 14:46:42 -1000
Message-Id: <20210729004647.282017-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXXkS6fb8cHS

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: qemu-arm@nongnu.org
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

