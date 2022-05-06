Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1983996lfj;
        Fri, 6 May 2022 11:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjSwDwlmB/tqB/pujmdTJOYuhzPr9B+CchAJ2SYP80PEiOq8Xtb1Pv0QZvFKzl2kJpSxj/
X-Received: by 2002:a05:622a:188f:b0:2f3:b92d:c704 with SMTP id v15-20020a05622a188f00b002f3b92dc704mr4020050qtc.666.1651861116500;
        Fri, 06 May 2022 11:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861116; cv=none;
        d=google.com; s=arc-20160816;
        b=KIkFkDSNpr9ZmPabkw7YXah5KwiQpZFNXnMDfDTE+I6fe1OfppsOfAjfiDfuWmGRIk
         8UMeS5psPvU5OVE/+MpyznKlSf1yJNN//Q5zJLoca6lj4jiuDytlV33d+1CuGgJa4kyu
         gIiRXhshm3vI+5NxdNclnYzQOYJO5InNw0BiKIM0bzOdnKK1SF3RaSa18CXwgg+nOs21
         4NhGwEwZipH/FRqX2ThhOWaHspOq0wHpHioKeLU9UpyVSLFB2poJ3qImgG9mkCmV4WZk
         oQuzpbvFe0+aZEVOVXR3wc7j3hJ3X5hysxi73Y+NW0C3OoniJq33uAlQHGfHDFqe8uhG
         AtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
        b=Tc8o/YHKM5pa92sSF28AU5MV6LmXe6qlCNjUdLuvav6/Kcx4PgQbCeSYRzwnZUUqUe
         Xo67kVYleHG9PzUeFg5Vk18yLLqF5zvPVzvuoBYjSilPIs5JSppDYS4+YQGIrCbDC5XW
         A8cKHN37RRLE1urM0ZNCt4TMTvA2jA9D45vr3YyG1q+HQfh0td3upCaDElUbUs3g56Fy
         wWKTA6xau6pENgmchCiGrYTK/OhiN8e+rueVdPkWcfb1+m0z/AnGgqg9Fa4DV0USb3v6
         OTL3SYofi8jKpxJYVSt2EIxLvSHY9JJ0S2GcJrCKyYPH2U07qHlRSHaGU2upNqOz/IdR
         m0PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOVCrE4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a056214016b00b0045810a63ca5si2536834qvs.146.2022.05.06.11.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOVCrE4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2XD-0000WF-VV
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IR-00061l-S7
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:21 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IN-0003qy-Eq
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:17 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso5407097otr.13
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=nOVCrE4DhyinVWLnYHIJublaDDaVYrOVUuu0iAi6RSyOMNXySK8UDDnYYSx07gnfRB
 5pjC4vpOlKaHCTnoP1h/+kPnuTJOvBOTJuY0T1mOzxIJ5QNYh9GUOEJjKGjZCOyEigGE
 Kp9ydpdGQLp5J8dkexg1oT+dYazNqxkvJIhYDZTkuPiO8zb4ZtFQhUoaeEaH3JufH2Xc
 COP6iGRck558Jc2VlJF/4Yhn3mq8VNeCxNhCByi5MPhaaPjqjfa9/fHM7xSD2/3epTkq
 P7habZVl9U7ZkrwCXWsm0vw2stpY63vbZDU3pN4VYh7cP6jcmm2W/F8GY+8luE29kofx
 GjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=dJv7B/6khxo0ozK8GBiCtTYFIL2++fSMtlzfQ/IQu4TzTa6LG2jp9W1QEz2++c7ICN
 I9UjY88kSQZroU7ePx39/u8cSuEweXXpj671eo9yMeYMkg6JVV0eJig8O+YNl/MP4hfK
 HR22+BarpKECP4L1t8ehRzStEdCZPL08qFHE6ty6foVSKovfKyDtnuMIJ2KS78E23acl
 qeQUi9+iv1kogzxETKc74ye3NBtwZ4UMgQtEhr8fFtZ9NjMuGdnsUl5hMCSrXece1Ftj
 NX0dhSKQNCmRvnc1iAcYQVpylURJ6LXlAIq8b9eyI448TA/Pr2YfzOEJgt4E5AmFQL3P
 a9ZA==
X-Gm-Message-State: AOAM530WOe27T4eN5vvbmDFj14ViiXDJV7SqRtb5BDrmEymR3oj+1S1K
 eDKpSH0FPqsifVeLt+EgFKhMXI2h9JzhHSCv
X-Received: by 2002:a05:6830:1099:b0:605:fa6e:ac2a with SMTP id
 y25-20020a056830109900b00605fa6eac2amr1479809oto.305.1651860193587; 
 Fri, 06 May 2022 11:03:13 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 17/24] target/arm: Enable FEAT_RAS for -cpu max
Date: Fri,  6 May 2022 13:02:35 -0500
Message-Id: <20220506180242.216785-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
X-TUID: 7S/ERfWGJt0z

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
index 0acac6347c..8110408000 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -42,6 +42,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 88d3cef93e..35881c74b2 100644
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
index 337598e949..c5cf7efe95 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -69,6 +69,7 @@ void aa32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.34.1

