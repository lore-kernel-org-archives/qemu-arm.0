Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp529lfb;
        Fri, 3 Jun 2022 21:36:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtzZHlLmvTDqjF7f3gPBg9icB7PjXNL9kviXLue/0lzgTzY/M1urHQcJtAx2tVuAkWhxGb
X-Received: by 2002:a37:5404:0:b0:6a6:48c7:b137 with SMTP id i4-20020a375404000000b006a648c7b137mr9175341qkb.284.1654317366739;
        Fri, 03 Jun 2022 21:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654317366; cv=none;
        d=google.com; s=arc-20160816;
        b=XOJ+9zZ1+RecMbpV2BSJPJM0qIsVERxpd4+8SoXDT0l7a9BqjtygUyLtxI7jfWtwcx
         1UoMz7cJ+eNGCfzri3zIKrKKw7eQN9+fy92WM3pTtbnSlMn/wyAlT7qsGMexkz/I3eZ5
         YS2kDpl+4kIme/43UCgCWTbS8jRn2VFCp9Pvj2irhiBm/rKpDZY5EYkDW0fbBHC+tzo0
         UBNRoGYV5CgYlUL+jVxCDzQ20cjUdTAmx21Qi6Ma3dNgoEKmTsRAoZdZJMcoclzCWaY+
         17kzQcALMb8Vsn2dPtLlQZC51rkKX0zZ/2OlZAI8U3i3LCoR7gTMeYwNGQ0BsVLmqU3L
         SGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JZyYsyMR5C2jCP429J1iL+9VPu9Dr37P/n1C5u4W6jI=;
        b=NwvA0vjZ72AuyzY+r21Xs6xTNAWazqhLSup3cCNb7+11qZsIu6ACdPc4pJkiCmqzP9
         qlZdMXdgosnxmKkLYqo/Ad9asFX5X0LrDz2TCfxMqnkNEblZKV8TdRTHeWJDZtDasoMx
         Ssez/PRuZJhgbKPQZ4kGo2qFRiPak2GioHfE4twVZTMCT87tgWns/KzrntgAegsa08vJ
         VHKFuuM2xGcyFfgx5ou5kWwMp9yx9uPG/Ll5MZY7fBm7twSI38E5swooe8kBgR8M3hUd
         NxdnzOjdvU8u8jJq/zLZwrqwt2MWTrYGyG6e7XN2dr6t+wkcCuJASmUehuTmC2XaEW6Q
         ymVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJhGlFVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05620a0bc200b0069f6dfefd01si5458910qki.532.2022.06.03.21.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJhGlFVL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLWA-0003bf-1u
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Y-0008S0-Vr
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:33 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3X-0008VE-3R
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:32 -0400
Received: by mail-pl1-x634.google.com with SMTP id d22so8098023plr.9
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZyYsyMR5C2jCP429J1iL+9VPu9Dr37P/n1C5u4W6jI=;
 b=TJhGlFVLXCmu0ZFOVZ3IWzZG9CuRbm0AlNX5MfZ4bvA1h8KC6ymBz0PQgdZV1hqdKB
 cAqGLMwMecLhJQiuVUtC3s1T8l2u5BECGSFcmZiO4xYAx4nHVoc7AhlmjiAkI8lzNcsC
 73U4xqvsa287+CviR4qnOPBK/bJjR3eS3F3n5dUwyDVmGcfqQT156M/fj3NjY6rje0V2
 phO6F8YwkGwD1mG27WXL+gHug47xGBQLKiNWa+IumowFaByjoYXs8hZ6xWXpKh7bFCU3
 10hEMe6cp1RQLtz+aaKH5O8h+Rnlj8rn8nJOeL6hEqZU0XmkXsRbJuhgWKwefBIv1BZu
 fuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZyYsyMR5C2jCP429J1iL+9VPu9Dr37P/n1C5u4W6jI=;
 b=IjmadX7a6xs2tx3mZ9wnCw1OCKDE2syrVLVN+BZsVupZeHW8mtFx40nzn8yBIASxZv
 PHMxbaXICzyIwoSY7TC2K1fV23GA5caVQVtDp4JEQyzAuBfiCQZobhyCA/FyBW/G00k9
 1C9YE9eETbt7FLi4lswt+GyLE/P9auMG0J7ZNR+nNcQLDQt8BHHrUHltRIiw0YP/RJal
 IEbmgiIH3HZ9C1pjrdEfCQafOW5j6iqXhSpANq+hYMrTVSGZd2RinMcldJHVqPt3AUHc
 2fCipd2m/eWK/IuR+cdoZBkemvryg/i3wlTVC7VKa+4C9ekLNPcKS00Nxcfpk06rkL/c
 7rcw==
X-Gm-Message-State: AOAM530/Em1mLvDqmDfmpOaVKAqN9M/h9XLZ87Wno5ubFxYDt4jB/Ppu
 VtAjp+crEtgVAqWJ/5uh7czuig==
X-Received: by 2002:a17:902:d506:b0:167:5021:d644 with SMTP id
 b6-20020a170902d50600b001675021d644mr4834092plg.159.1654315590325; 
 Fri, 03 Jun 2022 21:06:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/28] target/arm: Move regime_is_user to ptw.c
Date: Fri,  3 Jun 2022 21:06:02 -0700
Message-Id: <20220604040607.269301-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: tIWTHI5V7spm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  1 -
 target/arm/helper.c | 24 ------------------------
 target/arm/ptw.c    | 22 ++++++++++++++++++++++
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 85ad576794..3d3061a435 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,7 +11,6 @@
 
 #ifndef CONFIG_USER_ONLY
 
-bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3a39a10e43..568e02c5dc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10479,30 +10479,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-#ifndef CONFIG_USER_ONLY
-bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-#endif /* !CONFIG_USER_ONLY */
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9ab77c3998..8db4b5edf1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -53,6 +53,28 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
+static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.34.1

