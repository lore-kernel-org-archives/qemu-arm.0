Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5118526ejc;
        Mon, 27 Feb 2023 15:03:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8QrnDkec3ODB2lP04crANe60BduCZRJzUErk7JlX524IoYY4LNLb5jfJrc1KQ7I1nOif2g
X-Received: by 2002:ac8:4e4a:0:b0:3bd:16cf:2f33 with SMTP id e10-20020ac84e4a000000b003bd16cf2f33mr1515882qtw.63.1677538985143;
        Mon, 27 Feb 2023 15:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538985; cv=none;
        d=google.com; s=arc-20160816;
        b=D9xllcle1HEIX9kUynhoEHpxtPGbgzx+XRqs1eb9/mtPjyBQnrxwvJ6kw/So3GEb9U
         EMhlEtzIJfkyH44NrSL8e+KMVJFRCYNmxKo+GM/7eyR4Nvp6jZMcBb9bJw3EwkgDYxbR
         n78A1bzj0kMaCeNVnPc+09I1PQnulzGpCRTx3N2FFXWu5NkhF0hFI8YCJLmpUVGWXpt+
         m+0LRI+5ex0JKmuKp2l8xojR8F8A2gkSd6fG7Ww8mZWo/qQB8MY+BeJbbWatSFPFXOqh
         BLq3VGiSC1vlYGB20Hap5qAJyGxqgZMmFNKHFXz794yZZtdaW48A3UJpQgmOwOBIAZk4
         O6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CXUGcnVq4p+V6/QgEEXXaOcAhNQGJeh+oZJI6zT9+Xw=;
        b=DY/+D0OxwT0NMzelx8Lc1aHfGKO4gmh7h4vx3X/t3frMxwYyhSJkpiI6GYgj8ENFq0
         eUcVhQe9PwdxJ7MxSzdxdqJKZv4OnhyBVzhuy07A5Nl1mASlFa6udKf4SSCv95JUOpBU
         aiFbp1nTTJ10dBWcYU/r8pGGnqxXJutQfBFPyZ8Lx6cSHSbZz4+crzCHGBxH3PRP+bCP
         19HhHExKcTDzGVUqz2qHO8+ta1tDZH/yQKZNHIODKuzpZKT97vDz+0GyzzpaE2K08b2k
         4piSxI2mBxQp/AmX4GWQZRkjZZULgyjy0mMKoBS5f4rC0NtVw0geuK/50g34/FcHGpwC
         u6xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SgZmI9Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191-20020a370cc8000000b0073ba5323d3csi6825124qkm.703.2023.02.27.15.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SgZmI9Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVO-0008DV-T9; Mon, 27 Feb 2023 18:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVF-0007wb-Op
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVD-00014z-Cl
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:53 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso6708998pjs.3
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXUGcnVq4p+V6/QgEEXXaOcAhNQGJeh+oZJI6zT9+Xw=;
 b=SgZmI9CvnIHXSfJM1HQCZTw17NYAZNbE6CBN8gaikgZS/xfwVyw6pLa3N4bq84vpoy
 g+IhAQpW7nGipAmihyNFkO+8Y8GNNNSs16owSOms5OONZ8Or2KfxlI1Uc4iTyZsYzm/D
 FVmRfPHT2jUParQ9P3xzX9+/6H+O0P8cRQDHw001ABIgJ6hkq/kDVSaPtjAjMq+oeJZ6
 UDtSZw1Cm51h+LL2mpgR+m9fC0yaxZ30g80qI7d7fChUmNHFnwQZss9+Z61sMy6pLHSz
 AYbu0mYEgG1gn2dUNcgEpH8jbE6586t/7knJnsFyOKUWF8uMJJRqSLGpXkQEgr8sN9W5
 kGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXUGcnVq4p+V6/QgEEXXaOcAhNQGJeh+oZJI6zT9+Xw=;
 b=QxcAaOhO8ata5BuzVfZA6mN8fjzzOD4p68nKOqP70zF/MHjb9EMH/qO2aNC2dj/AT7
 qShbXyMimzdz+OQUE7HVFRIR1hCqK04lsK9BuJNJrIqH3zAG/wuOGdOE8hFPfMNCubE5
 Xjz7851YweW6960UpTHQo8sQHRr0r2sDhmjwLPpN1y0MwgRfd/XnACTLnIXSM2yvjncy
 cgJlc32/gNXgKuZ4eXRxfr0RDYAZz4Bk3SaDz9zhH5wV7bnOwHI07pi9oGFR+3BghTsQ
 Pd7u7XUdL8BZmdC1oFlTLbfrCwj6aUKd8ug0553k0Fwlb6zlzLuVvUfxDPIfrQK5bpD+
 jE4Q==
X-Gm-Message-State: AO0yUKU1z3rGJtVz6yg7iyqUC8OKaj2JenxA+9QIC461csz+4pZ3nZBR
 Pm+D7y03hRipkUUjy4Gy/L8fOw==
X-Received: by 2002:a05:6a20:4287:b0:c7:13be:6dec with SMTP id
 o7-20020a056a20428700b000c713be6decmr1347819pzj.15.1677538910029; 
 Mon, 27 Feb 2023 15:01:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 15/21] target/arm: Move s1_is_el0 into S1Translate
Date: Mon, 27 Feb 2023 13:01:16 -1000
Message-Id: <20230227230122.816702-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UVvp5iuDFMMf

Instead of passing this to get_phys_addr_lpae, stash it
in the S1Translate structure.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0177dea0cf..eb3f37495c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -22,6 +22,12 @@ typedef struct S1Translate {
     ARMSecuritySpace in_space;
     bool in_secure;
     bool in_debug;
+    /*
+     * If this is stage 2 of a stage 1+2 page table walk, then this must
+     * be true if stage 1 is an EL0 access; otherwise this is ignored.
+     * Stage 2 is indicated by in_mmu_idx set to ARMMMUIdx_Stage2{,_S}.
+     */
+    bool in_s1_is_el0;
     bool out_secure;
     bool out_rw;
     bool out_be;
@@ -32,8 +38,7 @@ typedef struct S1Translate {
 } S1Translate;
 
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               uint64_t address, MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
@@ -1259,17 +1264,12 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
  * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
- * @s1_is_el0: if @ptw->in_mmu_idx is ARMMMUIdx_Stage2
- *             (so this is a stage 2 page table walk),
- *             must be true if this is stage 2 of a stage 1+2
- *             walk for an EL0 access. If @mmu_idx is anything else,
- *             @s1_is_el0 is ignored.
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1602,7 +1602,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             result->f.prot = get_S2prot_noexecute(ap);
         } else {
             xn = extract64(attrs, 53, 2);
-            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
+            result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
     } else {
         int nse, ns = extract32(attrs, 5, 1);
@@ -2824,7 +2824,6 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMSecuritySpace ipa_space, s2walk_space;
-    bool is_el0;
     uint64_t hcr;
 
     ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
@@ -2849,7 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         s2walk_space = ipa_space;
     }
 
-    is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
+    ptw->in_s1_is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_ptw_idx = arm_space_to_phys(s2walk_space);
     ptw->in_secure = s2walk_secure;
@@ -2868,8 +2867,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         ret = get_phys_addr_pmsav8(env, ipa, access_type,
                                    ptw->in_mmu_idx, is_secure, result, fi);
     } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
-                                 is_el0, result, fi);
+        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
     }
     fi->s2addr = ipa;
 
@@ -3045,8 +3043,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, ptw, address, access_type, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
-- 
2.34.1

