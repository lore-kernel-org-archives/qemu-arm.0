Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51863C87FD2
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:05:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLld-0001ic-31; Sat, 02 Aug 2025 19:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiv-0002SC-Lw
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:33:10 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiu-0005JQ-1I
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:33:09 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2eb5cbe41e1so2562313fac.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177587; x=1754782387; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZOw9ryR7txUPbUNE8ys+z7FS49ZXU14iEzf3W4F/4k=;
 b=EIcdRDc7SAW2FC5lZZc9JRtiEBUIvF3o7j4+6NoSdPzEiXyBMr+IOsFubTjY2L8JLl
 3kcoHp20ehfrsM5wBHdEA1v+CvHD7zyEqcYVvdH7ltKOA8u1oVnkqAWEnmOlvtRSl2pc
 hJ/Ul43+ezrF/+o60ya7T43H0sDHu9V2WtFscWFe0qIHTT9Y0OLIsi0JNndBgybkAasX
 rdZXOlVJ48bAKH1UrBfMB4ORoB8Lpx3sOOcRbJWjlJkH3V6Cdv011JP/wBT5RqIAuno0
 MNgFX1sTKU4o6eTq3cE0HvSU86lczXDK+0+yTyT4hB0NMXugUYb6/fRe8aEJpkVWm4hl
 7zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177587; x=1754782387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZOw9ryR7txUPbUNE8ys+z7FS49ZXU14iEzf3W4F/4k=;
 b=vwqEGv5n5XWays/O21MZLt4rAC18ha96ax4chjRau+fSbHMpU57YoUHFkyJzo2wnQA
 Lxi4WaixHqQwItirqLsfAl5nz1YkxmTlFR15Hr+VcO8wvuUihuuwmZGlvBHNQr/G5zR2
 fZwgH26R7BEYnp4ckJDmk5as7QpUJkWzlhSXyI/SbGd837PHLqdtCfRSepbDrwbeTMJ7
 G9EtVGf7zB5oS0/PMDKXri9uVlaL+WZVq9E/gsEq9kKHpCirj7b0qEiSMj6W+UdLuc6k
 xpDC32fUqTrToyBsp4/3QByunJSzosZ/rc/Ni1/QwuRQeVzJ0uksURoitmCVkYpvRdEk
 Yo+A==
X-Gm-Message-State: AOJu0Yxy9UYyMe8+9V5bjL4soQ70S10JGFfSonoWV/DKg2DOFFMifgDN
 CWI12jyeF+reFbEoLmt0uydJbxlWfBfNmhDBl9Dz4GS2euH7kEmziyVm4YUSc4hw+6E=
X-Gm-Gg: ASbGncuM78YZuspEve4uakxbNvU7GyzuEt+dmTcsJ3vUjAQt7YekMh3iIg1s9hpHN9M
 UQKpNFyfSkBePjGEsa01LJ0alZzXR3y7g1KMmkQvz2fzhdrq8OxI6GkEDU15KFeTN0MDfTntY8U
 td3vuHzYfSVHfaJ41whz6FZg1vaQXNYgdLe8SYI5hbrVjYn+U8Nk883/yrbuB8BbMNZwFUYzhTg
 qkfCl285GqRcZdsHesapayviahyK3IvtVQdeFqdIyr5NHJ/tePZOgoKtOX9YQv6XzsaNBco+yVT
 YRBBdf7wf19XpNMcDmEevr3sZPMs9XHSeSV/G+VqMhgBc7pKTIAYOOxbNLfE1LjnHl/vW9QaBkg
 y520QfuLY4J1iQdket2OH2p34NnvxmmItgUsyBNPI0oyZ2L1ueFp8dfu1v5FWQm4=
X-Google-Smtp-Source: AGHT+IH0EzsRlOzQYJxanoiCj/EWxT2adLgfV4RiogBEjgQRPRARAdLAq1jGkbGtwLdAt9tFZFWJig==
X-Received: by 2002:a05:6870:ad08:b0:2ea:83e7:d525 with SMTP id
 586e51a60fabf-30b676c5e7dmr2352236fac.16.1754177586827; 
 Sat, 02 Aug 2025 16:33:06 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:33:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 39/85] target/arm: Remove unused env argument from
 regime_is_user
Date: Sun,  3 Aug 2025 09:29:07 +1000
Message-ID: <20250802232953.413294-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 +-
 target/arm/helper.c    |  2 +-
 target/arm/ptw.c       | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f665971b97..ea210c7179 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1034,7 +1034,7 @@ static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
     return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
 }
 
-static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+static inline bool regime_is_user(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 78f670314d..090076af24 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9692,7 +9692,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ds = extract64(tcr, 59, 1);
 
         if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
-            regime_is_user(env, mmu_idx)) {
+            regime_is_user(mmu_idx)) {
             epd = true;
         }
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c75b15b263..493ec78c1a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -964,7 +964,7 @@ static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                          int ap, int domain_prot)
 {
    return ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot,
-                                regime_is_user(env, mmu_idx));
+                                regime_is_user(mmu_idx));
 }
 
 /*
@@ -990,7 +990,7 @@ static int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
 
 static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 {
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(mmu_idx));
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
@@ -1377,7 +1377,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                       ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool have_wxn;
     int wxn = 0;
 
@@ -1539,7 +1539,7 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(mmu_idx)) {
             p_perm &= ~(PAGE_READ | PAGE_WRITE);
         }
-        perm = regime_is_user(env, mmu_idx) ? u_perm : p_perm;
+        perm = regime_is_user(mmu_idx) ? u_perm : p_perm;
     }
 
     if (in_pa != out_pa) {
@@ -2384,7 +2384,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env,
     uint32_t mask;
     uint32_t base;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
         /* MPU disabled.  */
@@ -2551,7 +2551,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
     ARMCPU *cpu = env_archcpu(env);
     int n;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool secure = arm_space_is_secure(ptw->in_space);
 
     result->f.phys_addr = address;
@@ -2771,7 +2771,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * memory system to use a subpage.
      */
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -3651,7 +3651,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    result->f.attrs.user = regime_is_user(env, mmu_idx);
+    result->f.attrs.user = regime_is_user(mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
-- 
2.43.0


