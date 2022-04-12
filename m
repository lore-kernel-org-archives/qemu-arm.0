Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2012355lfq;
        Mon, 11 Apr 2022 17:52:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMLJnzs6i3IAxn872nJg9chqHiaubSACQ+5UtEnAOWUanBId4VRFVIz51FZBEq8a+nZ7j0
X-Received: by 2002:a0d:ea42:0:b0:2eb:eaf1:eb71 with SMTP id t63-20020a0dea42000000b002ebeaf1eb71mr14474434ywe.57.1649724769047;
        Mon, 11 Apr 2022 17:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724769; cv=none;
        d=google.com; s=arc-20160816;
        b=hIk1WXT5RV7TJr1MK7ZKJ5VuGS2p52umqdsl6dnP1uW6KrZtLCaPBCUY+hglMYenb+
         xW8Bg8u9U77zTOdGTbik4Qf4l60aviuHPaNGQ3oC/GHfJ18fIC4VU7ORh3qMeR/JbKGY
         rgx0znsNVpqzYrvx51tFbP5ukjKzbLg1Mhz+qHpPIZYELS7XBAn+6xSgasgWW+bnGk7M
         gIOhhda4VOJAhg2loWPOV7T5R3acl68ZhlwzkLQUy+TuZN+7tHqh0XedXEMN0Zplk4YG
         OKyeKjPvoWDMGDyeQ2DZ+lUMpZ3gbm5/vdrpGZcM86pOlDSg4mp6p/s92aYxuHXTU4+9
         ApRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=R71DKHnNpsszAqAd9gp7Tv5CqWiO0+QYaifaOUiuVt4=;
        b=K8ng/R7T5/UFfA5gHOJ9o9/G1UuOj91EQBeMZ7VNjbZmf0spnbMD0qViV19ObVgR8z
         oCmVjNJ82rKloZZM7YvcDhj7yzV/MEsEQR+0r6ZWZmRkYFZA01kCTknGTEbAabJuT8Cc
         onpR2pX9TtiQhskG70+UYIl7W1iQ/p2jOIaj8QaIOz2cxKD7GqtRzURUY8r8QxJ3WNWE
         95Dhe7vQY9/4VPbmbu9BrgKPDRk3SkrOhA5eiO1oV5goJUWygFCy0PhNyKJSUmwy3jGR
         bWhkxNXE3AgV0KRV/PIYkEKs3+SrV2S7MgIpVtDmih+DT+KvOUWQXOXRLyfjcv9OnxzN
         0rZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o3vtlF5j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f127-20020a256a85000000b0063e8ee7a95asi4980399ybc.119.2022.04.11.17.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o3vtlF5j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4m0-0005Tl-G1
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tf-0001vk-Cr
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tb-0001sB-ID
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:49 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso1037967pjf.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R71DKHnNpsszAqAd9gp7Tv5CqWiO0+QYaifaOUiuVt4=;
 b=o3vtlF5jyJRiHIqbh36aOpY+arnfp7JyqfPTk2aWKciVTJZ52kkSw8h//l1nRgDpup
 JUYk+NdzxsTcNN/0ypblg+8JrEZsdcbIk9Uj9pm49FWaNo2DrXtJjE8b0Il9HEpCfxEf
 U2Mk8HxgMT5LvVZWZd3E8r7ZDB22hioPCLYsAfPuXYuTeEVx+SOsn+AfVxhiXh8taxOa
 pwTV2/0JiLEraEUPZTDSNXCAMQVEtXZO1DEFFl53Tl34ylVki3VemR3oG7YUGWO0jYT9
 5iFxxocd2+s5V0gSJjxoBzVwQeNXk637vY9OvBrakCoU9Lh4Sa4mtn16CmdDECOiQMl6
 D6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R71DKHnNpsszAqAd9gp7Tv5CqWiO0+QYaifaOUiuVt4=;
 b=pMVNpO85glee2LsHRcYNTTxL91wF4WJUNCZ4PQPZSMgOH/RhURamMegWyABCM+PN5b
 QNnDKypSrRWjbx31pmTpTRBKAM9BLN+KLGLIRUiPMEyck37dBVHd9hD75OEt2GpVBU3M
 uyzSKfztkwan4SqS7qIQMCQQFToPCeo584AFxf841mWYmhHGfetCPgL+UxtYVrmaFoP3
 QwdbI/aNRbJUU2B2l96WNPp0ymPhTDlOaPxrApi+o1+ERCYQ8LxzxncCnK/ChkeIaCsi
 W72B05nj+Xj1oHGDpL8tpCMFHOYGcXI1wodBmxDlvjFnZ8/CbmY6EpU7est4I2yiTftE
 MqWg==
X-Gm-Message-State: AOAM533AizbWs+/ltHBJxtwVGdBKachdSx/7qNp47pjPPYqcUF0UEdMH
 b1qP2K5V/nOjFz9SAjRXtYA24dBmrGZ/DA==
X-Received: by 2002:a17:902:74cb:b0:158:2f25:4051 with SMTP id
 f11-20020a17090274cb00b001582f254051mr15847457plt.29.1649723622316; 
 Mon, 11 Apr 2022 17:33:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/24] target/arm: Enable FEAT_RAS for -cpu max
Date: Mon, 11 Apr 2022 17:33:18 -0700
Message-Id: <20220412003326.588530-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lgLKcVREcPqS

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
index c89c344de1..35b6f7d4de 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -41,6 +41,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9bed76342f..3525aba610 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -744,6 +744,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 4ff4f30e89..4aa2eb0841 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void arm32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.25.1

