Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2886147ocg;
        Mon, 10 Oct 2022 20:27:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5j1W46nZ99iqlzYf4k7LpRRMv7n3JE1R0JE0dfvnOYtFpaeW/IL4zmxxHU5uT2YKWm+qCA
X-Received: by 2002:ac8:5f47:0:b0:399:aa82:3c6f with SMTP id y7-20020ac85f47000000b00399aa823c6fmr7649221qta.627.1665458853908;
        Mon, 10 Oct 2022 20:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458853; cv=none;
        d=google.com; s=arc-20160816;
        b=hdPQr0pE9UKRKgVsYPy7YNlB6NoLf+pdCnK6BEzuxeR6QECChL8Bra/th+uMOX2Ugo
         beEa78OMten8X0MJP7+P7y5FST1Uce3C8IAo7mlbuvmYWzQbGR/GeOus5dahM5X6nVw3
         VHH+fj2wjvFeipaPp6oKT1gONYBSJqmmX5WUEXxVLwwWm2cnwutwWvZCaglrGh/Mp6iU
         uhdDN+reWzFVRzyCdYKCnthD5YRtwxoQJN2Pbow3OX5WSkIbgA6W5PfgWck2uOj+m+aL
         StZ/s8QeICCdhZ6j17WQGAgbmJ/GGyB8KJJjaNIVUkdXg6yJPcKyWC+AKrdL8Ec8qDpR
         OBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xuiahaoEiVXlEWMWoZrC9RsYeFhfjxrmLG3QQS2jVro=;
        b=M/rlHKQviFwALZJzbhX1lOfjCj8obF7KuM8HG0fK90qVtZ4HlBdY0wJqSp+C3dvEku
         0lpxLYEEJh/QAYDbbnzO7nIulx58xP6wioatd0atmFcRiCggRPcRkDntg6hyIU3izKvL
         mfLDbAnf81VNrMq6QnA8CWh1x9kRsIWjOhqN7lPtUofxkT4XAl2w3xqPP2apE32HTJQW
         4kI32PnmrHGVndeeIEFOBKOuS9exmWMKMVlpvMgZpYywAcQ0sCzqrD6QEs0vyYCRcoln
         6YS6nwx8H6NX1eYay7WQXRXtXA/bNEqizTPK0ztsUexkVxPbYRyH4fZ6ipuKd+j1okvS
         Cc9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiM3QLQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a05620a430500b006e7bc836363si6460020qko.685.2022.10.10.20.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiM3QLQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5vZ-0007w8-Du
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nr-0002MZ-HY
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:35 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nk-00031J-M0
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:35 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so11946634pjo.4
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuiahaoEiVXlEWMWoZrC9RsYeFhfjxrmLG3QQS2jVro=;
 b=GiM3QLQVJoJRttJ8CKLTLc0SgJ7+E527/RkG+z2N+oeoz7/4LEpHKgCa3K4u+/aMGY
 esXyczKHzLHOsYxAgKk/pvGU8/O5noPw5KN9KlxlX0S/FMGNaCrLb8PxUo3KNCe862oe
 TNNnJSEQderXVV65LEFZptBXmhLk1cnbjKcv4ZoSmElD18ITH+mONAFj1nJA+WhRxEVJ
 sO4oMA0c+y78uaYOkggtR7Aw1w8HzV/IBe3SvD0NTtO3Tw5m+z1xp6OgJ9lbQxKBI1VP
 Ziav712riKXjoRZXX2iFkemKeTQb+jj6wbU6PSSltq3dZLmq9aW8EefOyZDStjBbnY9N
 bxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuiahaoEiVXlEWMWoZrC9RsYeFhfjxrmLG3QQS2jVro=;
 b=hm5TISO0N0QtkECdX/wGMK2x8nZK/DvtvLuhLBOKpzE2Qb1OC8G/NOqUqBrwjHH/0K
 dSptzigVawYNppRuJQL0v1OVaXGYqOmwJ+n5Fcfiyvmn6NXbkUMrbeAShiODVn8/irYH
 DdB8ImfkwSZp6qo83TbVg/sHiabJdRlrptlDWbLbGcQZy4iVYR7MBV4uCg2KDQYHpjyk
 21+rGLH9WxPalBM2FH77aM0AQMU64P44kbqVGc9oQx0+0y8RsT7qlUENv6qdLvEdayLa
 OcNddxWI+Rwi838wiXxLgmUbT58IYBsJ2Re6G57LvupITVGil06pPQ4SCJ9HNtPlkF7z
 o/Iw==
X-Gm-Message-State: ACrzQf2bLrEpvXnE/CbECE91ypUs6ufzxBBUSvHEYNm7SPeVw52ifxcD
 vGSU03vVmPtKEM0kHdr+csN48g==
X-Received: by 2002:a17:90a:e7cd:b0:20a:c658:c185 with SMTP id
 kb13-20020a17090ae7cd00b0020ac658c185mr24710531pjb.114.1665458366555; 
 Mon, 10 Oct 2022 20:19:26 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 08/24] target/arm: Plumb debug into S1Translate
Date: Mon, 10 Oct 2022 20:18:55 -0700
Message-Id: <20221011031911.2408754-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DtIgdrwQ3eUs

Before using softmmu page tables for the ptw, plumb down
a debug parameter so that we can query page table entries
from gdbstub without modifying cpu state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Add debug to S1Translate, and plumb the S1Translate structure down
    from the very outside.  It means that S1Translate is now perhaps
    mis-named, but it also eliminates the "secure_debug" function name.
---
 target/arm/ptw.c | 55 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dee69ee743..8fa0088d98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,6 +17,7 @@
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
     bool in_secure;
+    bool in_debug;
     bool out_secure;
     hwaddr out_phys;
 } S1Translate;
@@ -230,6 +231,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         S1Translate s2ptw = {
             .in_mmu_idx = s2_mmu_idx,
             .in_secure = is_secure,
+            .in_debug = ptw->in_debug,
         };
         uint64_t hcr;
         int ret;
@@ -2370,13 +2372,15 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+                                      target_ulong address,
+                                      MMUAccessType access_type,
+                                      GetPhysAddrResult *result,
+                                      ARMMMUFaultInfo *fi)
 {
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    S1Translate ptw;
+    bool is_secure = ptw->in_secure;
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2392,8 +2396,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             bool is_el0;
             uint64_t hcr;
 
-            ret = get_phys_addr_with_secure(env, address, access_type,
-                                            s1_mmu_idx, is_secure, result, fi);
+            ptw->in_mmu_idx = s1_mmu_idx;
+            ret = get_phys_addr_with_struct(env, ptw, address, access_type,
+                                            result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2413,9 +2418,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 s2walk_secure = false;
             }
 
-            ptw.in_mmu_idx =
+            ptw->in_mmu_idx =
                 s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-            ptw.in_secure = s2walk_secure;
+            ptw->in_secure = s2walk_secure;
             is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
@@ -2427,7 +2432,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, &ptw, ipa, access_type,
+            ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
                                      is_el0, result, fi);
             fi->s2addr = ipa;
 
@@ -2534,19 +2539,29 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                       is_secure, result, fi);
     }
 
-    ptw.in_mmu_idx = mmu_idx;
-    ptw.in_secure = is_secure;
-
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, &ptw, address, access_type, false,
+        return get_phys_addr_lpae(env, ptw, address, access_type, false,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, &ptw, address, access_type, result, fi);
+        return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
-        return get_phys_addr_v5(env, &ptw, address, access_type, result, fi);
+        return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
     }
 }
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
+{
+    S1Translate ptw = {
+        .in_mmu_idx = mmu_idx,
+        .in_secure = is_secure,
+    };
+    return get_phys_addr_with_struct(env, &ptw, address, access_type,
+                                     result, fi);
+}
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
@@ -2595,12 +2610,16 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    S1Translate ptw = {
+        .in_mmu_idx = arm_mmu_idx(env),
+        .in_secure = arm_is_secure(env),
+        .in_debug = true,
+    };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     bool ret;
 
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.34.1

