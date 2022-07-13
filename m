Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp20667lfp;
        Tue, 12 Jul 2022 21:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sn/2EnpC0VZOHX0t16w5tgDPIeh+GWcO9P15D6BLPrtsUMnAcF1IIPEJxU3+TvMLzaP1CD
X-Received: by 2002:a05:622a:302:b0:31e:bdad:9bc9 with SMTP id q2-20020a05622a030200b0031ebdad9bc9mr1323684qtw.206.1657688375790;
        Tue, 12 Jul 2022 21:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657688375; cv=none;
        d=google.com; s=arc-20160816;
        b=uXPQkxaS2z8Sr13p4eI/q4mxmMAmOBilraMQdKzT3buDSc25aLd3iOF+XKqBg2kAi5
         hToOTrUtcOvPHl1wWpkR42wKIA0ZPRQGNjetfb2q4hRPBX/xqIzLYlpVkgoQMWTS//fK
         a9cbjXbH6ePQCxhCsTw6z7WiMMGhEkrkywEp50xeddoXBABrQZXdeLAE9BsUUAeaywrR
         nzbJR99nXpoasL2aFbMixLMO5tuxgZPhg99m2QvPn914CfQ5G8qEZsha8SWOkphsab+F
         dFIM4DMW1dyjUISoaG6cafTpZiAG1BQO70ueNB+MDNyH1P7iAT6Yy2T/4il5t0VKDyO/
         xDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=adgTAr9VDfDVcGX7dOUKK/5iltOe5AGqwdazS0Dpj50=;
        b=NwRTJfz2f0sIRwhgoZpfJd4R/ThVvdBunxb1l7TfCgfGJGFLB7EtBJN+dOq9b9cWsw
         5wNOAeEX+4jQmUQXJtbppEZ7Oc7BFkNluAkWs7H/kFeIFWiHXm08OMiqOkWYmXzQWVqR
         XVaQbbWx9z1oRmxLZnb9yKL433ceu6fdIowx64g5waWRUHa6o+VDbR3ToXdqgeTYQWNP
         CeCPSHzlV9AIKjADMlJOipH2CzuaM6qS31MPo1MrjIiTQUqUpzr3L+2Dk7bYKPNAzTAl
         aGq6mmUt2YfPsLvCnmFtOLyqowOFCdCD8xwk5el/upbMGu225IV0kepkAU9QDwZGoWdt
         50Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PqX9403U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a0cb2cb000000b00470bb6c8e9bsi5485830qvf.276.2022.07.12.21.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 21:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PqX9403U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBUTH-0000z1-AN
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 00:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSj-0000xf-2i
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 00:59:01 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSh-0006rF-ID
 for qemu-arm@nongnu.org; Wed, 13 Jul 2022 00:59:00 -0400
Received: by mail-pg1-x534.google.com with SMTP id bf13so9426000pgb.11
 for <qemu-arm@nongnu.org>; Tue, 12 Jul 2022 21:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adgTAr9VDfDVcGX7dOUKK/5iltOe5AGqwdazS0Dpj50=;
 b=PqX9403U7TMHZ1GrCG2x6F1rPzzkR7rnFAuEeXOCRi2vgmBPFprTI5Wgh2QHvyCO8q
 F5tRyR+DDq4PZxbsoIJTVW1rhNAMM0JSRvlX1JpKdQy1vn7Iwfh4Sb81IZpXeuPwe0k5
 2KxZNAEZiPkUJPggBgfi3ys9X9/miDHo/wGR7qQ502KcGpIAmc+m2beRIEmM69Zplouz
 +259hy+5EIv9GD2urFg0qjYwDXWZV5zgxNRmFDy48eygsxyO5fQFQvgZ773DrlzxSqa9
 FJAHilhUOzSIbe2bQXAfVWycTdyQd1vmAdDw5mFqeBJGCPCGaOPKDa7UI1QUNM9NaBOk
 hwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adgTAr9VDfDVcGX7dOUKK/5iltOe5AGqwdazS0Dpj50=;
 b=UOrt7ZO/GFkOKgA8xWrWwDExAT6N3Nyf90mnZAdTJljeuM8lT5gMlCIWaqyDCnJ6LC
 lOkQCwbK/Bw4ikXpm+DWnWNUeWx1gnc6oFXeyiUe0IbDJrjEJprxr9oF/WLqna2D/2T3
 hk6pt5WnlLAOh7mJh8Gd3XHJYPNVQ6RfoN+Bh4AX147m86l0IUA75cSSsopGhAJCV+8R
 Vifs95oYq2bOSQgnARJ8IPlYFzysSxOJDaPxTjDiIDqayvz0oeCi5dcoAiht376QzQFr
 +uZ2jViRNTIcK6+ycL19CzjZKgbav05qX6ia0zHrjDu6zh611qi3udUQbBWgRwmCkCLi
 iCuw==
X-Gm-Message-State: AJIora+yI/H1ffRx4yr1UJ4QdBCQGO4miwpdTXt29D4EpZBRvjUqAYxP
 61l6Gbe47zmD5qR+KS3jCa1bQA==
X-Received: by 2002:a63:20a:0:b0:411:909f:8ae2 with SMTP id
 10-20020a63020a000000b00411909f8ae2mr1523086pgc.132.1657688338182; 
 Tue, 12 Jul 2022 21:58:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d194-20020a621dcb000000b00525302fe9c4sm7677047pfd.190.2022.07.12.21.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:58:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: broonie@kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Fill in VL for tbflags when SME enabled and
 SVE disabled
Date: Wed, 13 Jul 2022 10:28:47 +0530
Message-Id: <20220713045848.217364-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713045848.217364-1-richard.henderson@linaro.org>
References: <20220713045848.217364-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sm2S47blVt4h

When PSTATE.SM, VL = SVL even if SVE is disabled.
This is visible in kselftest ssve-test.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfcad97ce0..6fff7fc64f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10882,13 +10882,19 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
         int sme_el = sme_exception_el(env, el);
+        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
 
         DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
         if (sme_el == 0) {
             /* Similarly, do not compute SVL if SME is disabled. */
-            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+            int svl = sve_vqm1_for_el_sm(env, el, true);
+            DP_TBFLAG_A64(flags, SVL, svl);
+            if (sm) {
+                /* If SVE is disabled, we will not have set VL above. */
+                DP_TBFLAG_A64(flags, VL, svl);
+            }
         }
-        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        if (sm) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
             DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
         }
-- 
2.34.1

