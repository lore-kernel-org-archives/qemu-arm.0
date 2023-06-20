Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp243824ejt;
        Tue, 20 Jun 2023 05:45:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79l+RIPTmikVN2YuPpmWeY3mP04GYGQYrupK9LpfFe0450sKmIxtMu/yslb0VvZcR8W9JC
X-Received: by 2002:a05:620a:3d01:b0:75b:23a1:446 with SMTP id tq1-20020a05620a3d0100b0075b23a10446mr12209918qkn.12.1687265112276;
        Tue, 20 Jun 2023 05:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265112; cv=none;
        d=google.com; s=arc-20160816;
        b=TMiWgf9pFP+nVdQyxt1vdBBVCYExEO3c/aYfxx+7mJRgL3TasKwP7HhWkRfMY2Nmwh
         ZtvFxw6l+gNRgpn9k69hz8OFUmjr585JfSQ/yXKVMxPFekLmb2126RSWlZDCjBaUbPdv
         O8oHYK68C8kpvdH1+HUTcsWhYQb925raQbrXWYmpVKkXreScdgKXfdYPc5teCl5llNvy
         wE9coyn3ypUh7tWQnULlCGbInHVQ7EFeiU/3DEonbdymZf2KXEF09ORyB6Zgv8zQj3kP
         q24VOeErbZaVRIvQICaGvOlLui2ChR/C5WFi1gsZbipKogWNJ7uq8ps0f3RHdsejy2om
         DxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WJWL093vV/sudKyK+aOjpNFbGT4nrMy+vm7a5Pxrsp0=;
        b=CPitnNj8OtktJhnWLXXYeMWFbR+eUEfcRksdyLbHrtGSuRhirxURK9ESiKGpF7sKzl
         Fx8GyYrhaAul3/7Hb10OrJtrKF9WSigeqEQK+cDgE57MHINiM/rLxW5YXsi+NJmsx7WK
         fpDBVAbN9Cd1Ou4j+5xA0ZvYjpA4qJps8lSM1ip7p2o2miGdXWY9EQiMEc0ls4VPR7PM
         3LfBktTsy4z8yqz1ebVtjmA4WnOIaiMlWkAGQfwQb1wOAgsSgOuFadL+Cc/M/k3W1urK
         YLHjjmWa5Y0Rb9Hvxj9benpQlmf2tJnTPMu9Y6IghZ4MA+TYDglv4U73L5Y8vNKQhgwJ
         s0gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whFhR45r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020a37e203000000b007621274eb5bsi787492qki.177.2023.06.20.05.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whFhR45r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBaip-0001WX-V6; Tue, 20 Jun 2023 08:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBain-0001VI-V3
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:33 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaik-0001w7-M1
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:33 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so6085718e87.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265068; x=1689857068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJWL093vV/sudKyK+aOjpNFbGT4nrMy+vm7a5Pxrsp0=;
 b=whFhR45r/52C2reBPuQRxndmYiCuwu6GZoh9J4M3zoMlwUBwjWpqbCex3jY4OX0aFT
 sUbddhfnMoMBOAsUQaSKrq0LnYZufSR+SWLO3x1M6t23OIA/5ELv05b/An3bJJ1n26qA
 IeRYNBPbZ5zISA7XeDSSjKmOa0gyOtqAsqlmu3zLhTE6yEcrAk7DzG/E5e1DZMYK/bcr
 uDKFiqHRMWbke7MGVZvohKOjVJJA3RANxIQ1yIqEBrdsnir4Q5b4V973A+jth8j7Vj/M
 pQTXJgD4nWjLEyi+c7DuH7INXKZ2IUWQk/pFwzEFtBsJkT6hvBh4I2T82P7cZQOxJM5V
 GAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265068; x=1689857068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJWL093vV/sudKyK+aOjpNFbGT4nrMy+vm7a5Pxrsp0=;
 b=YAO9ZVNH8u4UZGOIZlaGJIjO3OY7CatUUKPcDOlcamnmKEHHeAv1ljkxX8jqoGP1aq
 qYDlJqwGzEE8/pdFHHCjGVq0lT1OwHlEIDzki5nNhypHwHlsevVmZV523GjuUCWS6DTR
 5HHps87Pdaazlf8TljGda0gOiETUymy90PTfzk3QPJ4lT2PtPznucQbNyxm7piQS3G6C
 If+Gu4LMKrzcFx5cgXn3CWgO6i1rPw9ED19W8Nr7LqE4srZkY4aD9Nb09V0lwnoKxLoy
 Lz53f7H56NjFgO6FDmM4gL8OSTwgASPmupzk79ilu3SlBR6lwoge8+vvJvrHIquAPdn3
 CNMg==
X-Gm-Message-State: AC+VfDwM7YUnjovsaxQZFQL8s8JtEtBq6mDA+cFNtd2E5IPCrQOFYyUV
 PgxkA1nYuf5Zjp4FeGaxHeJRb1KpT1//bQ1JId5IFE9l
X-Received: by 2002:a19:7718:0:b0:4f8:6d54:72f9 with SMTP id
 s24-20020a197718000000b004f86d5472f9mr3514039lfc.61.1687265068007; 
 Tue, 20 Jun 2023 05:44:28 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 08/20] target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
Date: Tue, 20 Jun 2023 14:44:06 +0200
Message-Id: <20230620124418.805717-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x130.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AJ9+19W0P4fo

With FEAT_RME, there are four physical address spaces.
For now, just define the symbols, and mention them in
the same spots as the other Phys indexes in ptw.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 23 +++++++++++++++++++++--
 target/arm/ptw.c | 10 ++++++++--
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b338619775..590216b855 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2870,8 +2870,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
 
     /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S     = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS    = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_Root  = 12 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_Realm = 13 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
@@ -2935,6 +2937,23 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
+static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
+{
+    /* Assert the relative order of the physical mmu indexes. */
+    QEMU_BUILD_BUG_ON(ARMSS_Secure != 0);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS != ARMMMUIdx_Phys_S + ARMSS_NonSecure);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_Root != ARMMMUIdx_Phys_S + ARMSS_Root);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_Realm != ARMMMUIdx_Phys_S + ARMSS_Realm);
+
+    return ARMMMUIdx_Phys_S + space;
+}
+
+static inline ARMSecuritySpace arm_phys_to_space(ARMMMUIdx idx)
+{
+    assert(idx >= ARMMMUIdx_Phys_S && idx <= ARMMMUIdx_Phys_Realm);
+    return idx - ARMMMUIdx_Phys_S;
+}
+
 static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
 {
     /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3f3517f70b..a742bc1826 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -215,8 +215,10 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
-    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         /* No translation for physical address spaces. */
         return true;
 
@@ -2672,8 +2674,10 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         break;
 
     default:
@@ -2861,6 +2865,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         /* Checking Phys early avoids special casing later vs regime_el. */
         return get_phys_addr_disabled(env, address, access_type, mmu_idx,
                                       is_secure, result, fi);
-- 
2.34.1

