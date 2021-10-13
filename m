Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2470922lfc;
        Tue, 12 Oct 2021 20:04:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8wntASE6X8E4L+TYE9hBvxeihr9I0hGVog/4CPosK54XDlBjwExtCyXVZgmyRns8SiiMO
X-Received: by 2002:ab0:5602:: with SMTP id y2mr27177310uaa.120.1634094245341;
        Tue, 12 Oct 2021 20:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634094245; cv=none;
        d=google.com; s=arc-20160816;
        b=y41mPhHGJPvm5vZf1NYzg3sCxpr4REjZia2tbs/5NiANAwuadwyDn+a/OLS3vNxiYA
         q87CBFGdz0wsN62ZTxyFoUeDnoFZLJ4RQBpux4GRPuU7QRAlmkYEwwbnyGPiNqFWlNa0
         pwfPTT30Ll2IOeX9V09EJJwP+s0ngpsTKbuduJwgGE0sW3ITjs80PVyx9gov43zmtwev
         zxNgabIPdP/+m2W/R3FHhiG209yTHsV0NjXSu6XvZ3pLmOhJs4B7/NxKxDZhFTzanf3i
         YXohaMyaq0ZqhFw3nGx4bYBZZVQMvSML0XoEeJme9N1tJ0ZHFSxyWAIYZjM86iaDPCLv
         XlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=56pglvy67AYwWdSDilcVWIN0xfuG/5o2eEFwbxuVXXQ=;
        b=G3tkV899uIPPqCHHflkc2Hh6TvNudHCkwHsr8ta7Hs6h+oI/IO7mqnIDdVf00pk6Ux
         Avobvitzh6KSiCER1QvAVkkLQ+QwxnCOnZSBs7s5OBco4Lhpy8lXRm/Jgw1LZ9wbANLy
         gbC/FGtN/y2Gp1EqaNB0l7m33uftdPP6a4SV9lYfjxjb5P4RBUhzpmQA57urOafBL1Ua
         Y3rS80aJ2iTsykuJtz3OtfhNiUKuxsIB2gnlEo9O+0fa5ULCZ7YLsho0tziHLMApNXwN
         HpV1i1RCCxOhehxuK8ShRW2BcnBJxF7FAtoDuetHxvt639j5cw1V1EsB0hWA23uKX+V5
         X/aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tzg7l2V0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si6829132vsj.407.2021.10.12.20.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 20:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tzg7l2V0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maUYm-0000bM-Kq
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 23:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHw-0004vK-1O
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHu-00055N-Cf
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id kk10so1083212pjb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=56pglvy67AYwWdSDilcVWIN0xfuG/5o2eEFwbxuVXXQ=;
 b=Tzg7l2V0zOMh0VFRZG6JHz4lFFxNmlRCDhtau/5pGV7HJJ40gkKczSxqB/KeUyRFXR
 9Ac9TiOGKkv5tCYLYgO0MgDaaM9C0z7i49/mzNAwHQCug5UaRpDuIglh8IatIqHiZiYO
 +ZwSw/LQhD6GYOLuUsNhhsxCGheg4DFhuwVMcy6U3E1NzgYJc2gmKBQg2P7K3Xr2r7yT
 BmNehhJhdo3QYpysVr13wH21IrlS/ZFrLwOiWK0FJHovzCec2h49G9GyAtCMbVdnpe+6
 45ZkWq9X4ZtxR7Gp1JPJws5FNPUTNLpiT7kMfQb3wLTwyk6z2jqdI9Q83DAg2oNVR03V
 66Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=56pglvy67AYwWdSDilcVWIN0xfuG/5o2eEFwbxuVXXQ=;
 b=pd08Qr88kIwpkJuf/RsutQrfGXzPdj2aRoGS8+Vy1lECQeiTclGtHQvJq3PPkluWzU
 ICSkOeBHrL4/JrH2pJYwut9Q+lUQOWJZf5Glsx/GZmY9KmiBZ8xfPEZDEL9qE+JYlV3y
 fceeWZQUP2AcPzNk0zQWcTbCaHzKXE20srk6hfmgrLMX27whv6cj7iMfxvNeipfFfcXi
 igLZ5Teyh81FjoW7ipGwFLZpQzzQ86BrWYm8bycj1ZWWaw4w/UIhaGivckmwyly1iB2s
 aqSPsNevZkgmpLmHvjSjeMK9hp592rxeKDp6g4yHrZjaBtiRDr0IFLtYQENBjvtNqDwY
 YK+w==
X-Gm-Message-State: AOAM533Nhs6otzbzSF98uAGq6elPk9FF/JOOvMwXC8mcYDQPRRjPnQUy
 RxQ7eUWVa1Ng8IBdWqykNN2YqDSQtKA+uA==
X-Received: by 2002:a17:90b:350c:: with SMTP id
 ls12mr10459675pjb.36.1634093197096; 
 Tue, 12 Oct 2021 19:46:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/48] target/arm: Use cpu_*_mmu instead of helper_*_mmu
Date: Tue, 12 Oct 2021 19:45:47 -0700
Message-Id: <20211013024607.731881-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56HcOpwq6tsN

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

