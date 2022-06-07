Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2404751lfb;
        Tue, 7 Jun 2022 13:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPK/HIpKKvM3cGiiRqjDD8k+c4bHqWvgbfPkikahaU0VrKtdCu36mAuPIxiPk56q5eEjCk
X-Received: by 2002:a05:620a:1423:b0:6a6:e89f:4e9d with SMTP id k3-20020a05620a142300b006a6e89f4e9dmr3022084qkj.591.1654634450784;
        Tue, 07 Jun 2022 13:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634450; cv=none;
        d=google.com; s=arc-20160816;
        b=T2FAWiGbpYrq7IYxgNfoKG4B7oe4mDkpiuJsghDG6sePSG9pzS48ViWenN1aprv/hU
         O3Ij5c5Pye7afVLsvWt9E6mv7W9KwZx3O+5k2PKJqe3lXc4nxy/jlOjpXaZ489GWb7lx
         0SKPubcJlMhoNBfOOVo76f3gq7Ykx/KqeOqQLzhuAeOlhZqCHje7RaU5VqqHgOkCY3/W
         dnqno2Qt9bJMnZEIDgND5MwTd5bn6/82j0Zigq+U7+GKL1ikfxfsZJd0wvM0/YAHOVfz
         ODpsEhosnf9DWgyMVtKTtq9zdwXrjQsONyDRWNtQQe4gr+Yq6kDdrj7XXKER+QRzFdi9
         I5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EhwnwnXu9GaRLFDW69ulBLl+dTP5VjSTIg+Z3UagrI0=;
        b=bkz9QlSqIQxyfnUILoIbtdAWr/vRIUo/Z3hXBuGW4wgW7P0qw/AJ5nyc37SerWExzT
         kYSa2dQHAxDk1HRYhgSfc5HL1IIZSV/4BXt+A8S5S2ARgyefO74Of4xHYqXsDAhCfp9F
         lRiPiSJSM5QM9/9nPddoSnWLOR+bQimh9WxD6i7cuJV0UKcrOdMJr5TdJrb4Ja905+w0
         sgb0z41V3yVXjyNZfMEamzKNByLbzvvxtKQISL7gZ/SmQdJqSLe7TCYcq1qaM+JfYjG0
         ZAZJatFx8JCKfuGM0qb53mI9OY3/g+kzCiBNbO3Ctzdc9iDW0/kLumSoZ8HP5y/or0yk
         GSmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MAEY0El3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq11-20020ad4596b000000b0046bb59aa778si1793331qvb.546.2022.06.07.13.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MAEY0El3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg0Q-0004xK-9g
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftF-0007bI-6u
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:25 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft9-0007FA-9N
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:24 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso21879650pjl.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhwnwnXu9GaRLFDW69ulBLl+dTP5VjSTIg+Z3UagrI0=;
 b=MAEY0El3J2InYhXJ6z4X6UcWp8e2SvknuCG/v5Y12gGflLdDCfgNnadpTQZVfPxsny
 SXBz+ejJVrbrEXTOVCmIUurbreh8Q8qD8a7wzqMhR6NCeP88wdjyNLPkdRE7zZJCb0uH
 +bmWrmt7kU3vrjh7GZqjTEaqGDKXS6xXUFJMExgDWF9n5aVbBCaLC1kg8l/to4hMIMSb
 DfPVS2OB+EzBku7bdoZKhAL9f6dR1pZm4qqonuMemRsI6kSbVHGXZOM17UnFFfTPsGCZ
 TwvHWdnodSfPKjlwg1VfydmqlhVhMeSRHsm5p4ns4INXj0NpgaEJnSdC2adED5miT/rT
 yDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhwnwnXu9GaRLFDW69ulBLl+dTP5VjSTIg+Z3UagrI0=;
 b=HcjPZFPO4oCwpfZ7spBbRGLFRVcvzYlPpXORCTE4HgYY5DUJnu+G915O9utNxaz6rV
 /mZ14PRnRoBE33Iks5iJW+7w8QUEnh3oeq7yfCJcUegs2CwL13HEngz5MFThd6Ss6k5B
 ItJ0z2mfAL+9xGAPXC/ccJtPeP/REBSb0CKxehHuhDW1VJC7znIV8WXVoOAipBZbynbp
 QQ5f8mC8tyRO21fymn5F6dePP3eZARqWpVDY48BE40Qywv8lZC6TRWPvZWnYJmmSblG4
 Zuu2KCLt0wqByLz18buD9U0sSQrQqnpnmEDrSasBp4WOmN6pizUugm4jHzjw2BqHg4He
 qKdA==
X-Gm-Message-State: AOAM5308XMVfjqEpRJVdg+5e9EUsxqXMXYeYD+s8xyOUOJeSNo56+XRq
 n4N2DWwYLckAeX6o3KEect2g/cxTUAYmiQ==
X-Received: by 2002:a17:90b:4c84:b0:1e8:6bea:d278 with SMTP id
 my4-20020a17090b4c8400b001e86bead278mr16853882pjb.232.1654633996489; 
 Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 10/71] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Tue,  7 Jun 2022 13:32:05 -0700
Message-Id: <20220607203306.657998-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: p8Ibg9oWuWnF

This function is used only once, and will need modification
for Streaming SVE mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a73f2a94c5..4dcdca918b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -189,17 +189,6 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-/**
- * aarch64_sve_zcr_get_valid_len:
- * @cpu: cpu context
- * @start_len: maximum len to consider
- *
- * Return the maximum supported sve vector length <= @start_len.
- * Note that both @start_len and the return value are in units
- * of ZCR_ELx.LEN, so the vector bit length is (x + 1) * 128.
- */
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
-
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc8f1e44cc..e84d30e5fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6222,39 +6222,31 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    start_len = MIN(start_len, ARM_MAX_VQ - 1);
-    end_len = start_len;
-
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
+    uint32_t len = cpu->sve_max_vq - 1;
+    uint32_t end_len;
 
     if (el <= 1 && !el_is_in_host(env, el)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
+    end_len = len;
+    if (!test_bit(len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, len);
+        assert(end_len < len);
+    }
+    return end_len;
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1

