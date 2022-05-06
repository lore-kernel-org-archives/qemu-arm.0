Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1975238lfj;
        Fri, 6 May 2022 11:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIXyrtCQ0QB64yPXs07TxRgeYDeBTo/6XtCSFBt4DW4BwsjuO5b7rHGXrW92l0Jfny6+rj
X-Received: by 2002:ac8:5a44:0:b0:2f3:61e5:a575 with SMTP id o4-20020ac85a44000000b002f361e5a575mr4025513qta.114.1651860235190;
        Fri, 06 May 2022 11:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860235; cv=none;
        d=google.com; s=arc-20160816;
        b=OADsofqWeTt8Zk0qL3drcwlkJZOSnxu+H5IZ33+BYFd5oj1HNFtt6mR16g8w37edYv
         sFCv5PvoecfIs+DELHAVtrR0cjihztcFKb31Dh0l7DLo+cyFLemsc62pKbukwcUA7O85
         Cm8ufnQEfLUx9ZAqt774p0p+c2vPRQfxNkYm3Ikfg/YMle+bYlfRrJlCVcdn+KY6ss5j
         2N3pvZdI/CwhyRVORnuzTUh2o61g7mB0Yiwo4aYSdI5cmkNJqrMAvctdZJYXyAsTFBS+
         9U4RG4ofHXnhDGGAy+X2ZoqSjCRDXwzz8KJB76+23IJHzJqr58eHUfRZq00fUi+55OLx
         VpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
        b=v62GIEn01ZNqRqzD2sTlltKF4ghZHZax/YGulu3K1nkxH3HvF7oRnPWhBkgZJAT2Db
         vNBOdO1LvQp5q31xyoUQlePkbVO3fGlJlr/66xQ+vR1gmcsUwJBNfjjO4mE0EDWFEWPK
         fSpdts75dlW9/6vBunp6XjUERl+YSdCbF1p2kaXUrp7mIIneSm3QHlXJYUhHwYe98D3l
         KaGZ7RA89QPKKdnltPqWhFp2NCUugfaCaySWNMhs4oMir8CvlBw4B3/k+YsEc4FBGRNx
         m33SB3tg+Lyh9zsNCV8od/PlDptObxCv0xh2nEmS9a8S7OjE43KimIEIusddvlDPn7rC
         zgLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyWnOsr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020ac87f45000000b002f3cd9314cbsi96256qtk.417.2022.05.06.11.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyWnOsr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2J0-00078f-Lk
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I2-0005G8-Sv
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:54 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I1-0003qH-5b
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:54 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso5407065otr.13
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=nyWnOsr6qBdaLl8HsfRZJjCu5x+U4d0tsiENH35bL2NwRF+FuKWU2iNVM9xvf/fgPD
 FLZ76tET77saNgxIpuwjAUmaMkeQw+SBZvggyBYOaR7YI1LN8wxIVLvISaVKMvdRSH9h
 UuXWneBPgPnnyf/YO3bni6bNPTGoBIcSSRtSTGQZWu/iVBixoPB2VlEgjIR4qCuKbn5c
 pmYMnXoUcLzyZ97gBSr0V/aoa0cDp0aBPhLIQh34CTiG3azVf2y1+gBPB1mreF3E9eCU
 fPkw4/Xyifeco4lFVnxvE/9DsRFLCZjq3lqbIa/RGbJDBMwZ7p8CJr2g3I7439CEd8Du
 QW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBDZ88vPTqEGnY2FKq55qff77wGeCpGFi1CrZCVsHDk=;
 b=Rr9hthM9OJEhm+MFlamH035wZQ+RH/QmqJeAOn/YBj02Dsrvn+Yzgzr7OA6wgJfX/1
 uG94HicefV8n9AvkuH2tshxfl9f9olCOzjHqvplCSBR0uhoU2hSU0h2M4bRfeCWcdKw9
 zbl7b4zaDWBYOa/RxMydIQBRRZO2rydQBx5IcyDmC1zsffUByCCmiOnj+rruI5cS7IwO
 LkTmk5ttKPV89GXsX8uwmqS2CRuyVdaUYJJZa6NApAbjtxguY35riRP7Lfyos/OLfZKx
 c2I0Qsj7G6di/NX/hIvIO5EnTMU39wFWZ6UJje2e1BbsDAhpzcN/xGJfwidJubMZEPz6
 OhfA==
X-Gm-Message-State: AOAM5339jh9i9ynfDX+Zuk6hC2WTQqdnuH0mOS+XTP0TvB4VH36tJFE5
 C5S2yb9fYLUKRgTCOO77WE9g9Q1wTiAI73HQ
X-Received: by 2002:a9d:37cb:0:b0:5cc:7a51:c984 with SMTP id
 x69-20020a9d37cb000000b005cc7a51c984mr1461553otb.98.1651860171954; 
 Fri, 06 May 2022 11:02:51 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 04/24] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Fri,  6 May 2022 13:02:22 -0500
Message-Id: <20220506180242.216785-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
X-TUID: DOTAr9oonXrO

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

