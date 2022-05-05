Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1295745lfj;
        Thu, 5 May 2022 12:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOzT+L8Lh/D4hVuyfT2qeqMh9+ONJ/JONxqTuo0Ai+3jN2ZPMF+3paGLNbOFe+wFXhFr3k
X-Received: by 2002:a37:b543:0:b0:69f:71de:23fb with SMTP id e64-20020a37b543000000b0069f71de23fbmr19849400qkf.90.1651777662895;
        Thu, 05 May 2022 12:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651777662; cv=none;
        d=google.com; s=arc-20160816;
        b=zPU/+DAk7jofK5Z9rv7u12wpmFed66/h7C3yHvUune2E4u5P/7IOqH0BSLSlZnx9D4
         td16JuOqNk4U0pntDelJ+6DfGGlgPq0vcI+/3BhhRztYiJE1z2/m7ZppSnlf6wUX2dIv
         uuuhoGcGEhf/MZOfay0HbUuZkLk27lGnf3yqd4KTtHSQgBUi7Uus+JU/VlnAfDJV9N4X
         OO1KcPgPuT7dmi1BvQLk/ako5P4DGoiOb3tABTs10l6dE7JdCJCkm7xwFbj6hG3uWF6/
         QC587Tr0GF99XHj/aG+z6ce1ewpR9D3KuwbmJIFJo5BRbNmzP9PmTifWBOcb/3rdHLs6
         KHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
        b=eiiC28N4p9D8zfBgC91N4VTqKRej87zHQnS+mehCuDQ9txwQ5HKdqdOZAHc5Ki96mS
         p/hMSC+5/eUBPLmZvbCSWohfw6JOmYsMVUgbOwaUZ2W2sTeL1HWWB90qh4OYw6fylwlh
         NVJU0yo7FgTPFkvnrks8CkDAYfBzUkgli3R3KUsxpiRUrzGFiXy6cMbnwFfY3duo4Sf0
         0ALstJ/3W9eVeJZ++zTYezKGxLH+TbDuXoeR05KTFpUeEk+2DR5O/nkMetMbsJGttZB1
         HKgyOihR3WjVxKI5WBfOwtR7ye7Y22R8rk04A/l4MH4C/fSNXI787aYwcoSYPtvnBquC
         Ayqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGvGo1B3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a0cd44c000000b004466b412465si1289328qvh.484.2022.05.05.12.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGvGo1B3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgp9-0006li-VD
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYU-0002ce-10
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:26 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004NR-Aw
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:25 -0400
Received: by mail-oi1-x233.google.com with SMTP id m11so5238885oib.11
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=VGvGo1B3u/KAzEvHca8v0UxU+Vr1yFXmmzyqe9nxGXiLaKaBjhInogR1eJOr/fNXoA
 0ya6ZrtXvq2JUvahAvb3lUakQbkSX/yEUdPC/Wl6/Rp+cqAkZ+fPZhBdeun+W29VlEbh
 A0HthL+domZv8nIA/73dF9DvCQVt+cADVw3vzg1KEqdt8V0etzsI/i+B3XGc8jnhCo42
 NdvZ5xgpq6Zft9J9svmVFhpscG9HAUBe8cz7MHnMt2UtlSEmiq0AxxQh9KskRKuHUt2T
 br1sRH4vVuF6V+auygk4QfOBOtCvQFWLV254Vn1BN9SGe3EJIFwCi9+zZveQFVi+czb+
 RIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=BRA7t4uOEGtvi2QIpa92hdMT7LPsPgE2s/nqY1pR+VB04Z/HtJkenbg+QJiQ8cUR9z
 8dkc6vg1MsekLPsylrJLp20oPIEo3sIEW+L5ufc3VtW/M+FX6KAS2MBWu0DWfc9KPjjs
 m+H+22LXWSpQcWwbZ03cpdT2yXy+oIAybI4HbMbs8WapFRUEPkfHrdkFOdH01lkb+blt
 pKgBYNF/B/LtKEjUAc4yM2BSnccOj5/YfVOkWUbf00Mq79/OGK5UviSP+J0w4N9Ipbb2
 KBFW/+J7QF6s8WbCwQvVzj9pn+o+NaqS1NhuWTyVsdwFA8tUGz49fK+LHR+R4W6YuLmK
 j0Ug==
X-Gm-Message-State: AOAM533VAy9BDYM0/Eic8kF/MazW0nLnXF4gJ/0H4KOsHFTfxOWpSWjK
 ZaU2WDrL6JNBeJDNVZhptLn0pA==
X-Received: by 2002:a05:6808:230c:b0:326:4acf:1517 with SMTP id
 bn12-20020a056808230c00b003264acf1517mr3123716oib.117.1651776614164; 
 Thu, 05 May 2022 11:50:14 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 04/24] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Thu,  5 May 2022 13:49:46 -0500
Message-Id: <20220505185006.200555-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
X-TUID: jVVSpAZzYeTv

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72d05070f0..7b31c71980 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7246,11 +7246,14 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+static const ARMCPRegInfo contextidr_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW,
+    .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2])
+};
+
 static const ARMCPRegInfo vhe_reginfo[] = {
-    { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
@@ -8215,6 +8218,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_vh, cpu) ||
+        cpu_isar_feature(aa64_debugv8p2, cpu)) {
+        define_one_arm_cp_reg(cpu, &contextidr_el2);
+    }
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
-- 
2.34.1

