Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3227532lfc;
        Wed, 13 Oct 2021 11:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym5eHCPl5IK2TD3BfmlqimKDO6600dKcaTwdt6fi1I1bmjPsbQM3nxsz8Meb8lwtjIR3nB
X-Received: by 2002:a37:5f43:: with SMTP id t64mr856366qkb.82.1634150365311;
        Wed, 13 Oct 2021 11:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634150365; cv=none;
        d=google.com; s=arc-20160816;
        b=OBqmoI5vxxiPbiL2adxw716S9j2+7oFuXxfaF9Kktg6UCfRaDuIbKO8EiwnMF3emon
         dcev4Sf6mGIUQsjxYp76fcixQlks173ml3hhZzXihDRHMfxN1LVJcsRh1sDVJjlP0VNQ
         oMijQ2dqsmvJbnR8oJuWBMY+0IeOYCGtXbSoYqCh0bzq/7vKM6+jgzymb7CC/H5/no04
         4wHbbICUeOQ91XPhm6BzihZTFUz6vkqSqvbeU5bx9ekPghhKriytuWLe9Fpyk4sfuoGv
         V1BKcAZmvaguX7SciRiAcsDSh2LohvgZarM75IaNLhAJ727kQ4thF5cGFcNabSUi7UnR
         bPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=56pglvy67AYwWdSDilcVWIN0xfuG/5o2eEFwbxuVXXQ=;
        b=TREVwuFGXTmqGKQbdbxU4HPGkGaqgwoOAYFn8ilW7ekfkz7raaBoDoNb8OmXvJjhns
         YK/3LqWB32FFV9ikXHbuxfGGdpo8CPrXqt3XBIl0BSejPUHPn3j3ag0fy3CbjJ+sEc0C
         nf0Cpt2I9a8Y/i/chPgr9Okoig5ItuiY3qI5ev3p0+GxKUoBcHVGphqTlAl/zgz/48On
         WxCK80nM69FWI/+6/ZCV1Twxr6gVaJIf8Ca0KYafn00O4r4yXAlnqVfIgTDfZjVuku3T
         /L8PlgkfzN4QpO8l/VVRlJuMD8qzbTOvlCyTZ6nYPtNGMS/2Og9pLQF4F730gvAhCjqj
         K7BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SSXRDsZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si182224qko.326.2021.10.13.11.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 11:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SSXRDsZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maj9w-00014v-Md
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 14:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu4-0004B5-O6
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 14:23:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu2-00038G-Gt
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 14:23:00 -0400
Received: by mail-pg1-x529.google.com with SMTP id m21so3115208pgu.13
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=56pglvy67AYwWdSDilcVWIN0xfuG/5o2eEFwbxuVXXQ=;
 b=SSXRDsZn264P/rWpUOoftMdyJO6C2kEpAc/xGX12fiqP6wrLPWbPf+AKD6WTBPrMd/
 WNL+21nv90HtiJZubI5lkWuJN+hakS0D2x/eu1UuR/H73tN2izgQNJ3QSG0x1kQhnGor
 9uPcYNmlfNHM6S8P0KiXH0Kek5zWPJ2XYcM3Fkc2AsSUUjd2Ddv1U37ic4Xd9CKF2fwm
 +G8hrVT0OsvjCQsi8TCSzdxwOzjs6mnV6FAyx6I+V3QzjUZtqxZbX0dJt3GHZdj7qlRt
 kqifxxHqps0Am8X8BGrJQRvuEOSSf1EZ0ZmXoYWG7WREPEoWaC/V/o0DhP7tA6J7cvnh
 6Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=56pglvy67AYwWdSDilcVWIN0xfuG/5o2eEFwbxuVXXQ=;
 b=eLe6bPw90Zl0Nein3Rf66eCWCEHO/u1JPWzB4eMAw9L9RrPc7Al9I85QKcJA5yBMCL
 PSOWoyZi9Z1uAYuZFVgbA1+R8LvJiqJpA6PT1LUZfWpvPVq60ZtQPEWjMvMud7Gnbmzs
 0Hwyo2iU5rcqIRkC088tCTEhsKC+MsSDbDenNexJZDgruc7yyfHuaaYuj6ZNIQ2nGQaD
 1SUowi8f/y5ID9DLNZ/8CiCOBsJvbU9Gg+sMimQcahMBs9vdEK9vFUHLYj97nOnBD15E
 tiPGnKYffPLMhQE8IzQHSdRgrsy6mYNCUKQEvPXpYkZJmdcnpgRF7pVRV/5yMKX9Kcij
 J89A==
X-Gm-Message-State: AOAM533eerdZZp+yVvFrmqybDvxGX06bxHvJ7LfIJa5h6AEax3DLB3h2
 cpNveByg6Ta9hnOGeXA7mU82IaoC5wbFUA==
X-Received: by 2002:a63:d94b:: with SMTP id e11mr559496pgj.295.1634149377007; 
 Wed, 13 Oct 2021 11:22:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] target/arm: Use cpu_*_mmu instead of helper_*_mmu
Date: Wed, 13 Oct 2021 11:22:37 -0700
Message-Id: <20211013182239.991127-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +LibelfZyrKR

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
index b110c57956..5ae2ecb0f3 100644
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
index 62aa12c9d8..2c9922dc29 100644
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

