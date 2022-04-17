Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1281401lfk;
        Sun, 17 Apr 2022 11:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlKGy6jEQ4WRHRVe+k8ybjsqBs0MHLYQSJzZKY8qChpNEjQaPASxfy5IEB4ApgyBzp/dJ5
X-Received: by 2002:a05:6214:224f:b0:43f:cd6a:1d6b with SMTP id c15-20020a056214224f00b0043fcd6a1d6bmr5793436qvc.12.1650220447255;
        Sun, 17 Apr 2022 11:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650220447; cv=none;
        d=google.com; s=arc-20160816;
        b=nByDg2tZnGBsj3AaQDm2J3nPTt+S+3Cwxaq/4t5eFiBsfsLWipkyJprTPcHDg104Kp
         e2z9bYDuqXuj5QAPQBudMuAsDmwN5dkc6G1tV1WFs7vOBeKM7I3CLbpPV5YwqwyRtGMB
         WsUG2tvkYbIKUctmeTTYPiXo9i8fNpV9MznZfjVIePpogAbqPd2Xay9zjVwij2AhenzK
         Lg8ZjhHjqYJJiSvz2dh33YexTbU4atzcQFxHPskKgHHnbnLgIh0lpbktuw4LsLpKV8rK
         blf/D706I4bFvanxhRZu7bgj34diZtbYAjA1i80WJs4AIFds4jaxf8K2A9Mrydorc4dZ
         CqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4gebW4IdC/Bc62zWIHS5hydZkGTIlOLeMNTIUwSy2Ks=;
        b=VVeRG3p6DvX7CYGf84GqGLM+7979Lzk5oCXS9TAcsr5ERGjdI7sCxicitizdAkqSbG
         EjHGGNA87vNauktvWscluE7Pauh811D0gSiC2edZed3WGelh0XhbpQdgWZIKF8jYzCn9
         BnD1TFHGtQDjK/y6Jq4ZGZERysEgX6tSx9rY+omJ/2lYJlFAkdwr2MGArEB4zeNvrjdn
         VnAgTvwRwbxV7GA/+g9z8mOIuwSrYfKchEoRbFqbayh0jRHnmwGNRIhD8ZT+Lz2gh7pY
         QCE6RIS5wGu7conw+mHxqSlDGQCJEHp8UtYml5FyV2txV/cwScPQa2uzZU7kEw0T6bMz
         0jXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CetYLbkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac859d3000000b002f1fc598b9esi501156qtf.785.2022.04.17.11.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CetYLbkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9io-00062a-6b
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90W-0004jB-Ll
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90V-00046B-3C
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id s137so14967573pgs.5
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gebW4IdC/Bc62zWIHS5hydZkGTIlOLeMNTIUwSy2Ks=;
 b=CetYLbkrh2Emx4+viVrzNk2w06xK1Rh0zkQV/5RcLrJr2HpgyqKgR2xAFCrHXBm9Gh
 +xQKrxnGaTeocMQFYsn3+hpAl7IcOwCf+UVpYqGx9ENdsRGW3jxvAowQ5kDSIGKpIXBR
 VyGYdVEyzu1PZ2H/yOsov+XnQD7ChckHXaAvPFhdaAZsd9cGgY3OVVaeI61kqjqmkPrh
 zLGbLpSyXEdlXBTCEeWU+mBJ6c79GjO7UeonwJ1DCdREvt0Ld1TGAd23smVc6FDjxkqa
 jcw3M1m8gACwiH5M/+cB/9IVva5br17T8TFx5booqwz4Mfia9yyBfT8ayioPzYWpt6Sj
 hRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gebW4IdC/Bc62zWIHS5hydZkGTIlOLeMNTIUwSy2Ks=;
 b=xKG21FXnfGuJz8LnhUGM4JVcIeBWvnHC1NagGjYm7y7Z7fsjdLZVq2uoErZtIgR8Lr
 4dTFPNYLoWlh8d+HAOsfPRuo223IJY/ZFjPvkjJHNjMWEWZCoTsH5HchB3MPwC/lsuCX
 V+8eElD2JWeEaNnpTlSRX5KcwVFfbWQF91nNs3C7pgr4tvxO8H7zXSJDTMJ3uOfS+Anu
 pwS8PYxs3KecGZUd7NxsbjGYopRW8FgWPIRZYWv2pEf6SFuBDgBiSfRQfvFgQ3jyadtT
 /F9ZEsaE41MlfTxSG7yDcvBt9HLdvCnBXQYlNNb0ATT5DKsTBGKL9eWRv/1xbl9/P35V
 04sA==
X-Gm-Message-State: AOAM533dxxZ6wlqMaJC2M2pfDnvpCNKvIjkA5UmjkFsiHwZgeDAfrEY0
 d16BiBdVtvM7KDdKyMoRwJbkIQ==
X-Received: by 2002:a05:6a00:8c5:b0:4fe:134d:30d3 with SMTP id
 s5-20020a056a0008c500b004fe134d30d3mr8405509pfu.3.1650217697790; 
 Sun, 17 Apr 2022 10:48:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 55/60] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Sun, 17 Apr 2022 10:44:21 -0700
Message-Id: <20220417174426.711829-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hMqR43CP2A0x

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index ebd9e418cc..91fb06c579 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -11,6 +11,7 @@ the following architecture extensions:
 - FEAT_AES (AESD and AESE instructions)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 03fbb34e4e..b62656f3c3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c5cf7efe95..762b961707 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.25.1

