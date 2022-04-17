Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1278478lfk;
        Sun, 17 Apr 2022 11:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTBwYQDGRlaMO4EyBc8SOpihQMxuMl7Rvgqu/F49i8r+BQWGSPPseQOI2LoHBBXtUnwBTd
X-Received: by 2002:a05:622a:1987:b0:2f1:df49:44fa with SMTP id u7-20020a05622a198700b002f1df4944famr5168442qtc.125.1650219863290;
        Sun, 17 Apr 2022 11:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219863; cv=none;
        d=google.com; s=arc-20160816;
        b=ItxZOKU+ILO3is6LHiQSRliJgjHwK8DRDTxVMD85BvbV74YYltJf3fX5g0Irzy3+SI
         e5gMRdbDYHICxyyySClQH1A4jLvKr1a/GRSBG6IWJ9p4YrxUP+DKoMHVa7Rx16qWer3w
         8oDfbShdxlYU91RnQMt0azPuggSGtZnySWlDipeeQSVYEMJjKaXcQpuBV1IxHHaequDT
         rlI5++I1aJHpCpBxeIxPQi5WYZZ9vaX42ldgV0TlqEV//Uc6pzSuXaHqq/lUBI+M+hXz
         FooUn8tYvQlzcFQZLCpzJ7oJYRyvq9UyR7LM/6geU1xE/KzX7ZuiwotnhHA33yq5IUAc
         weiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hifCwEGN2LJwACcTt38/T1y33ShijigpbIfXemOwv90=;
        b=YJ2OsKBIcUjpYwSLdRuq3NZ2CjS+9Ekm77otJnaTc/ZUV10DLvgvzE85wHP3fEsTTp
         tEWmRQnlSMY4kGdwyOseH728SSTekj9k4SsMctqEJqM9bmyU/ggLUJQQwsoOFu/gIfDQ
         GdhcG43hktfkz3h5iWp2iv/OaZHfn5+VNLh7egM6BfCiDgGa44vbpY4CzHbZXy/sKAhg
         Di4Gesdupw/kuYQNnrJnXvZxX1cZQOUNB6F19Pg2o8ok7+0gjRAijKRQ7GPvVMkr0Cma
         EsiiG/Zv6gBVd4uJxFsxRrO3suQmipALbSkyLp7GnPs/ax/zln+oGY1eVqIItzRb2kPZ
         kS8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bIU79iLY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056214076b00b0044442fa2467si2305385qvz.60.2022.04.17.11.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bIU79iLY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9ZO-0005zk-FF
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xP-0001Zz-Ap
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xN-0003Ue-8U
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q19so14969381pgm.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hifCwEGN2LJwACcTt38/T1y33ShijigpbIfXemOwv90=;
 b=bIU79iLYpnr7IjvMxoxod5GuDpIgVIn1Avh2GoMgxsmZLL2IoqwwzjcNoIuS/a+W8z
 s9dKhfNRJwa8u4nfYbN2PwoV1ppvEBt+C+ptX4nDlv3UEmc2zKqUY43kZ8JhpUkb+GS9
 MapzNxpClvFm2U1cGk+hxTnsrtTGqQZVsqrZ0ECWAqBBakG94xgvL9TwmWSAlpR94nsQ
 vuTR0IFstPBZZKfaeGFCz/sJwo6OIHHHzlLHws0QejNpsl7bSZppGL1MSMCYVXfzxkzl
 M8Mag44UVqQ09aUtSv/yZdgWhSFeFAhDcxS4zJ5VMXdVzT8oxj1ydXILyOQ399NAR59q
 QMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hifCwEGN2LJwACcTt38/T1y33ShijigpbIfXemOwv90=;
 b=SsYl74+VmrsG4xJA2zbnqaejGD4wvbkKLf02PXFfebZigrbRu7jNGdaSIo1Ri4AJOa
 kc9D7Sl05txwyqiRmP0iHOLp7cRW/Cwst2uOpjoZJ3Ie26pbugZsudECh/AMrcDMphGs
 pQTMgD7lvTX172T2VqeTRX5Qg5msT+1mRuXgqD2HIZFcCP1ZGj/arxqF0M97XOwdlLWQ
 s68gXSCGn9Sj9gQY7BR1eF8Mj5c3w0e0AKV9ZYuBInLWLAGWxPsDN6F+4UeUv5OlLheq
 XJ80PStvxxvCA0D2O70myDl+0UoIfLbaTiRQBSTz9RIF8hNFVfDmM6386p7g/EVkYcMD
 UAKw==
X-Gm-Message-State: AOAM5313gXnda6fOHsTIkxYeN9rm8xVbrUjtY0SVgulvBd/n+X/W//GA
 NoQHV6DDrCbWYJ6qLUfQcu6gWsSrN4u8xw==
X-Received: by 2002:aa7:9522:0:b0:4e1:d277:ce8 with SMTP id
 c2-20020aa79522000000b004e1d2770ce8mr8479794pfp.16.1650217503114; 
 Sun, 17 Apr 2022 10:45:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/60] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Sun, 17 Apr 2022 10:44:05 -0700
Message-Id: <20220417174426.711829-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gCASwAg4EIOq

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e762054b5d..3570212089 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7256,11 +7256,14 @@ static const ARMCPRegInfo jazelle_regs[] = {
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
@@ -8222,6 +8225,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.25.1

