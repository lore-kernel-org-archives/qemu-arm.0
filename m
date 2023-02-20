Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2707119ejb;
        Mon, 20 Feb 2023 15:28:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8pbXyVsVPMdvyMwieVG4d3+VKttJnOtkrTsBg0wWJRG2l8y9FXyoRlJtjV4tOuFbQFWx0q
X-Received: by 2002:a05:622a:1009:b0:3b9:bc8c:c1ff with SMTP id d9-20020a05622a100900b003b9bc8cc1ffmr3840701qte.10.1676935694922;
        Mon, 20 Feb 2023 15:28:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935694; cv=none;
        d=google.com; s=arc-20160816;
        b=HIIFmqadLigNna1ZOfa2R13XmjLAbS39wBQRrjj9YaS+UlZ29rPt1Ff4RQjRv6OwD4
         XLuhQf/KVB7qwlgxUT81JsaBGLFedneWT39EeNYbVVHsyjSF/GIllkx7nIGK1tiOKKPb
         cJurL86q1XlFu4HuBhlccES51yOqIIZcNLcRwIP3G32WXPa9o+V5L5RpbwFSNboolrmc
         fhK9Td5tV94ulbjrcEzM96Or8aiQYxyzNgbpnJFUC3ae87FQU3UjmdxYk9Ni/0NXlBC4
         vyV8pVprpOMyc+Pjt0cGE02NG49Ct6GitggQcZnPzCi22Sk2NFJuG5VySqJ9yqwQ1p/Z
         5X4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BVEetkVG320ZxIQr9yDM+qYom+RuVqLVN5o0T0FCipE=;
        b=CJHMYdUPgqA/+d8h+JpTy2byfut7slk0cgLKewEI2SRjNZb7/sfYrKTPbN5k7jrdV5
         wS1M7r3690c1c95MaxiUqU9Th6CeefpcUkPqdcJOxf+tJUbhzRIijG1qViDpzxTi3JCs
         a+PrSvAlZECP3vKkefQBflICgvwPZa74FIBGvSEUqoiu2/HN4NFmfYXuWhUjNNayKTR3
         kh3qlnP8Y+j+qPSGWTrehQnBQJ8xOsPoBIWSPY3QeqcQ0uilTb16lzyWcit+yVOJUHdy
         dfDvn9F7GW1+GD+zg3PEXt/Nel7PAme7261ombPhQXL7mFYFCnoRkkaEWtimSmoOh/bL
         n7fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OW8KVE9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020a05620a440700b00718de0ca2ffsi11610387qkp.220.2023.02.20.15.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:28:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OW8KVE9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYk-0004W7-5k; Mon, 20 Feb 2023 18:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYg-0004IJ-4U
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:58 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYc-0000LG-Uv
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:57 -0500
Received: by mail-pl1-x629.google.com with SMTP id z2so3270292plf.12
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVEetkVG320ZxIQr9yDM+qYom+RuVqLVN5o0T0FCipE=;
 b=OW8KVE9sJMbB+drBXDgUajHsWhzA/EGZfNsi8UmVDZwIek6zhfldCnEmhcogxh8IaG
 7wHHo7hQmh+HmFneIlIqtCzDpViXDzz+MXDBkapjOlIrdAjsFnv1k40Dt0TWTV/mrVHQ
 a/3ngITwO+idNWOv1yakpDwq3UEvGh/3kajqy+Aa4apd6v47nGN41sY2vIhuCyDFbHle
 vWhlx4GhG7AWtUHahTK59jGXV7oO1MF9660Hs/9SR6finiqwyGG+zgbN1Z8rUWYITv8O
 /egsoV/gxZ0m9vCx2EL4VAJgUqLW3TaZLYin6/4duS4/gK91JparqugLmbd8Vc3/hbvq
 A1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVEetkVG320ZxIQr9yDM+qYom+RuVqLVN5o0T0FCipE=;
 b=IOoH6TE0JbD+1TCbWdOMlXO5N/SXrktrpnWzgAMVMvx3VlmdzBRTMAadPTLlJeIo+h
 844ClS957oyRWxGsATgRdJn3aJvHMjJkiNjJk+CWy8sPTRWMqYFWxslzU8dQoiVmHjZh
 WEnx4qNi+Nk6Fj1cB/rkYX9NWLwELhCWTcQUZJvz9wcyyDvbBc7yCgPgRsPogj90/Zy1
 LmNUwYeDq3ZAKZAZ5lfM6JKRTPlh9RhfSZ9OdqBqx8YL+hoZJnctrCPDQj08sjr8Q2cx
 H8bE4Yyt1faNaK30T7DBgdPTZt95k/BXmuc9nlCv6C4cRjrauY41jxpmZmDVgm9AcP1r
 cSxg==
X-Gm-Message-State: AO0yUKW5Mgu6/lK2uD6lGPKjOiq8x+zSdJ9ypRLUn1iW4VRmdOATt/yE
 KdVi7QTKoy0m/4obucrBO3UCEpvAgdHSxssgoNM=
X-Received: by 2002:a17:902:f546:b0:19a:8304:21eb with SMTP id
 h6-20020a170902f54600b0019a830421ebmr2215395plf.6.1676935614019; 
 Mon, 20 Feb 2023 15:26:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 15/21] target/arm: Move s1_is_el0 into S1Translate
Date: Mon, 20 Feb 2023 13:26:20 -1000
Message-Id: <20230220232626.429947-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: 7FZpIoQeN9fL

Instead of passing this to get_phys_addr_lpae, stash it
in the S1Translate structure.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6e980654be..d4027ce763 100644
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
@@ -33,7 +39,7 @@ typedef struct S1Translate {
 
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -1257,17 +1263,12 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
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
@@ -1600,7 +1601,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             result->f.prot = get_S2prot_noexecute(ap);
         } else {
             xn = extract64(attrs, 53, 2);
-            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
+            result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
     } else {
         int nse, ns = extract32(attrs, 5, 1);
@@ -2822,7 +2823,6 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMSecuritySpace ipa_space, s2walk_space;
-    bool is_el0;
     uint64_t hcr;
 
     ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
@@ -2847,7 +2847,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         s2walk_space = ipa_space;
     }
 
-    is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
+    ptw->in_s1_is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_ptw_idx = arm_space_to_phys(s2walk_space);
     ptw->in_secure = s2walk_secure;
@@ -2866,8 +2866,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         ret = get_phys_addr_pmsav8(env, ipa, access_type,
                                    ptw->in_mmu_idx, is_secure, result, fi);
     } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
-                                 is_el0, result, fi);
+        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
     }
     fi->s2addr = ipa;
 
@@ -3043,8 +3042,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
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

