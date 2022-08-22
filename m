Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979511ejc;
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:172:aafb:4927 with SMTP id n8-20020a170902e54800b00172aafb4927mr21391156plf.106.1661182076980;
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182076; cv=none;
        d=google.com; s=arc-20160816;
        b=kYz43vuJ3/8IepdVXrn5zitBF+dn+0cKA1/U9y7XgZM0F+eQlgXvDcJsuKDVm/2KZr
         m8jBJNeMcmVU5F7NzizmDImcIdyNl8qUXW7GuT3zqE/G4EtcxwIRJe/9vx7OudO/npEU
         tDZGpWlVBqsfjBB71SoobhFCPX/y8f2CzgxxgQ47N31U/JSIQtj1BchYMh4Je2AIjh0o
         nGfiTZBpWA+T+aHjB+3bBvMg/pzvrvvNX2uTrsAS+m4z4NrWyZ7AVXOqe2SYXgejk26y
         ueiiQFBpzQWG/Vg6HDvGXY1HlSGWlCXoVrIw6S/zMKEajaxSCOf+gU4CNXYe6xJiGxpt
         B+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uZ0BWDD1zBt6bJvdrc6PkSh3qsVXaWKa3Xv5dez69Ms=;
        b=ruyCBMptJPnOVRkgOdLJLscUYvJqFYPVvrFlqXPmGqEndNn5tTTJJzuJVxKnkSM5pX
         UOdvM8ZxBsUz09s43XEAMaGbYsinSxIRETCdVKyHN+ekJMGfE92AvVhE8R6Pe9MknSXz
         fSDh6bY2wRZOgRq3BWpvc8DPPu78ANJLYLfUrGNFRWvbCc5x2013xOcUEuh51G1DCzQJ
         nIp7VvSI4tiEd96FaXE33XvGP9kpWW98XQJZstrO5vJQwL9ac2D4z6xjUjgJ9dl8RcIY
         IhXejZ729ul5poisyM5OIX9g3/Qrxt3YfZh0qvoLqA0KrznSIkzFQPxR+uFlWJd+9vOn
         PrgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fOP1LlOG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m3-20020a170902db0300b00172e4755e85sor1666502plx.185.2022.08.22.08.27.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fOP1LlOG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uZ0BWDD1zBt6bJvdrc6PkSh3qsVXaWKa3Xv5dez69Ms=;
        b=fOP1LlOGMN6mfCeMpw9nJBqwfjvPhESkLcrYvh+OazEJdXUlHcvJTmaSnUK6+6cJO3
         Vf6Smv5bMK0wdtD7sLggtNW4sSUtKIT8AZZk7Fpnblm3TilKfzvXOxs0C6/AmbiGRakO
         uwRz+FDSUlz4KMcWv3OmX5YI7kj0kwIIrjAQFOM9KX8VcuYrkQ3A+KisvkUjwTiXd8Lz
         6NRSMe7cYwpU/20N/Cg3xUYoh8Yog/y3SvAhhh6eB2ZncWmOSQauDaBxndFUicE0Kr4I
         Y8rBRJ74QzQALAg0xeagec3xX5W5GE5uFjzKQERf4QzCd+VSdhfDEVgbTJ8HqTYuyYof
         Gl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uZ0BWDD1zBt6bJvdrc6PkSh3qsVXaWKa3Xv5dez69Ms=;
        b=wDnQ5aoLRlRpqfpYERBsPI00ZY7RxsbGQIO1Fo0nnU7Ghpd5k0Q7ujs/JXMfnxOt29
         3euUxVpFv2q+4D1XtnXE/B0FG5RonLLpTKcvWAKs5tilj3z03cvEa4xO9lXRDMt5p/jT
         aKzmIy3n+7ZtE9/wdPk52p52WIWfRQEJof0op7YS1yBpXqOwrpRuoflwZzsUw2o3Olhw
         TObtZ7sjKcVTDMN6r4qE153o8Akv6TBZT5z0n9iNhNWfGK9sLK1Y7wUzzPv6qsQCV7D+
         NJQWcuchSPAODypUKcXK15t05FIaKIKVxnIqJFB9pmjF2+3ycfsAnKL2os8374/QsZbc
         +XYQ==
X-Gm-Message-State: ACgBeo05jQS44qCpcpaKPN4DBHPF0T2xV2TvaRz1p8gvAOuoPKA9x2Df
	GAEyX1KJ1v4hSOkhVJ5mEG/ieiarjpYE/BgM
X-Google-Smtp-Source: AA6agR5c89mKcIzyl0OHtBqzdZOMLoNa40DI4GWtlW+jFTVny+GrJPN0iHcID2KDlrDbNLk1+Hnk9A==
X-Received: by 2002:a17:902:70c4:b0:172:d8f5:b4bc with SMTP id l4-20020a17090270c400b00172d8f5b4bcmr9697659plt.32.1661182076515;
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 17/66] target/arm: Add is_secure parameter to get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:26:52 -0700
Message-Id: <20220822152741.1617527-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UvHOl2m/+5vd

Remove the use of regime_is_secure from get_phys_addr_lpae,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b7911e88c1..e95fd6b0d9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,8 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -207,8 +207,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         GetPhysAddrResult s2 = {};
         int ret;
 
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2, fi);
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
+                                 *is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -965,8 +965,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+                               bool is_secure, bool s1_is_el0,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1183,7 +1183,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * remain non-secure. We implement this by just ORing in the NSTable/NS
      * bits at each step.
      */
-    tableattrs = regime_is_secure(env, mmu_idx) ? 0 : (1 << 4);
+    tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
         uint64_t descriptor;
         bool nstable;
@@ -2334,7 +2334,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+                                     ipa_secure, is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2502,8 +2502,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
+                                  is_secure, false, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1
