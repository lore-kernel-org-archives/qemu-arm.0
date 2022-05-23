Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3754913lfh;
        Mon, 23 May 2022 13:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPaqgsUK/HP0q/0g5bA+2Jqcp8o1Vfoc5Ub0ZNN9An1Gc06nWMrLLyZHBmr5S0yrGZ/WMx
X-Received: by 2002:a37:62cd:0:b0:6a3:4cbe:e74e with SMTP id w196-20020a3762cd000000b006a34cbee74emr10295800qkb.550.1653339121964;
        Mon, 23 May 2022 13:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339121; cv=none;
        d=google.com; s=arc-20160816;
        b=YMk4A28VlceewFqZfIJ0q+w++BVjNNHpSxFlbrtTvJKbqiRDbuSOqQM+ppv1Q9Xf/f
         oK7SGNhe0NymUv8pPXLwxVkWZ3EFR7N9WSdHPMnVn8xo68UQaE5n6ZRlT90GmreIvry1
         rD3Cctk+n1cSDlRA/jePXRh9Pl3FZw2urFoYmMEFZ56KZMsyihMjoZ0n/qFF7Kasgq3e
         F2ecaABPsawZPzYilQAu8a1cwGbfi2JKFv28Esr6Zj+msEcgVv+rFa4gbJ6b/LLWYHkC
         KMmYFmZhqBx4CVXKW5vxOdfnbzLTAdmpcM7R0e+VLL/OQrowAo/3xKmBPNgVBDsy0p+n
         rZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HJoYOaaLuB8gatH0dOhmGoPETBA6JA7xdiNzavM9zuM=;
        b=l+CUIlIx/ouICvmUuFLz2DWZwwlmiy2hHzpRMjrvldcqDOEvzIqDaeqR47a/VVPkmK
         ix3Z534xglCTbdTa5saxEmvwQc3816d2yvCksj4cVPSUHhjDBvZU2xaJDiyVcz94/Phe
         Yvp1FWVv78lhb+DQtAYRucMPB0jQYIoTeF268NnNzcNT9b/2qttXm9i7qSlh/xakLJR3
         JL3uowc8OgOTY2GfkcTOcKJM5iNTW4YdCBbyjF1PukaHHE/GKLPVwlr4WzXFHMVrLYj5
         tYgdhq10PAZf4qk5UC02qsANzFnubCCJFdJSXpkePUMOVapxf5I53WDZfbjvdhfqCcKk
         etSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFnp1B3R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05620a0b0d00b006a3414c7235si2975834qkg.378.2022.05.23.13.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFnp1B3R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF21-0005Su-Ei
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-0008Dr-BW
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExw-0004zY-9u
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id n8so14140423plh.1
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJoYOaaLuB8gatH0dOhmGoPETBA6JA7xdiNzavM9zuM=;
 b=eFnp1B3RKHuwL1LsRt2UrnvVd39DBqmPiyF2mEAi8wmAZRELqu3C33fewhMTYHm+Yb
 kwvUBIwbR7zZRn9ro9dJZbM9AzxrAwbBPMAa4WRVSTafvawpuZDiszhGmNt4TvmP/G4h
 /q6iwzNYcvmmY4lEiw1ksvpe1Lxps1uDXB4QtB/T5IV4yLy8m1c9mAvYSHdY2sD5LtGl
 C1sFaVZEBI7qjxK6/Fln66PX/5i2AinxDHxBtdKq1bu0rhc4mWh9Cf3gMlehH0Wqte5t
 3MSDqKuq2Qo6GMgIMZhe3BmH5vY0ZSY7USgpAGptSW9zcYsyZ5orkOZt5lYA9dYHMaki
 nmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJoYOaaLuB8gatH0dOhmGoPETBA6JA7xdiNzavM9zuM=;
 b=Iv8JKGJZUQM5/Knf6z7R8XXB6fM6H/GjbiOe/1sJv2hjgGJuKDWb1Vo9wPgUzgDUkR
 pDryE+0Xq4yjh9qMTSxWQd+ZVn990gMq9VNXLhcJ9bx828l+egRO6j9lH2fCYtw/l9eX
 Ml9COWwYWdm1pNIgBWKwvgb0zjquh1Tvr3BvBaCcyxvMEIpX4bFEYObPVUdEqNJTVQdN
 K8mboUYxOdDAoZ4Gb3XGeXTGmYBmKpQlXbJ4S+VoB8by/E0HVhRFvYNa3yYA/ey4nrJc
 ETIQjmRkg6L6I0MDO3dhs0B1r202H7H4MpAuBcyApMWdjV2w7hQ5ml6zNlElQP0Gwn05
 z4NQ==
X-Gm-Message-State: AOAM532c/MkQ4s/sr5+BgLVaUVqZa1ESDmBQqVIga9WeMxqOv1WdomL2
 8eIOYtrfyZAqJPpiRgTm7GJ0YwmJ2nZKig==
X-Received: by 2002:a17:902:ea04:b0:161:c283:8c0b with SMTP id
 s4-20020a170902ea0400b00161c2838c0bmr24393937plg.52.1653338866899; 
 Mon, 23 May 2022 13:47:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/18] target/arm: Move and expand parameters to
 exception_target_el
Date: Mon, 23 May 2022 13:47:27 -0700
Message-Id: <20220523204742.740932-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5+1xnoSbauaI

Move exception_target_el out of line.
Add cur_el parameter, because 2 of 3 users already have that handy.
Add psyn parameter in preparation for more code movement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 15 +--------------
 target/arm/op_helper.c  | 17 ++++++++++++++++-
 target/arm/tlb_helper.c | 10 ++++++----
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 03363b0f32..a71f795628 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1091,20 +1091,7 @@ typedef struct ARMVAParameters {
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
-static inline int exception_target_el(CPUARMState *env)
-{
-    int target_el = MAX(1, arm_current_el(env));
-
-    /*
-     * No such thing as secure EL1 if EL3 is aarch32,
-     * so update the target EL to EL3 in this case.
-     */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
-    }
-
-    return target_el;
-}
+int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn);
 
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 61e9c1d903..6858b8980d 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,6 +28,21 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
+int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn)
+{
+    int target_el = MAX(1, cur_el);
+
+    /*
+     * No such thing as secure EL1 if EL3 is aarch32,
+     * so update the target EL to EL3 in this case.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
+        target_el = 3;
+    }
+
+    return target_el;
+}
+
 void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
                      uint32_t cur_or_target_el)
 {
@@ -35,7 +50,7 @@ void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     int target_el = cur_or_target_el;
 
     if (cur_or_target_el == 0) {
-        target_el = exception_target_el(env);
+        target_el = exception_target_el(env, 0, &syndrome);
     }
 
     if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 6421e16202..573e18f830 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -85,11 +85,13 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
                        int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
-    int target_el;
+    int cur_el, target_el;
     bool same_el;
     uint32_t syn, exc, fsr, fsc;
 
-    target_el = exception_target_el(env);
+    cur_el = arm_current_el(env);
+    target_el = exception_target_el(env, cur_el, NULL);
+
     if (fi->stage2) {
         target_el = 2;
         env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
@@ -97,7 +99,7 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
             env->cp15.hpfar_el2 |= HPFAR_NS;
         }
     }
-    same_el = (arm_current_el(env) == target_el);
+    same_el = cur_el == target_el;
 
     fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
 
@@ -139,7 +141,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
 {
     ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
-    int target_el = exception_target_el(env);
+    int target_el = exception_target_el(env, arm_current_el(env), NULL);
     int mmu_idx = cpu_mmu_index(env, true);
     uint32_t fsc;
 
-- 
2.34.1

