Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp486716lfu;
        Sat, 30 Apr 2022 23:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKXNKLPVyBRgkyVKxjKqJlk74E7iAoFrRd5qmPERXGkDn+qnqviUyquAfFhahLb7Ihi+xm
X-Received: by 2002:a05:622a:5cd:b0:2f3:705e:dec6 with SMTP id d13-20020a05622a05cd00b002f3705edec6mr5754957qtb.70.1651388369848;
        Sat, 30 Apr 2022 23:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651388369; cv=none;
        d=google.com; s=arc-20160816;
        b=k1Fj5A1fJ5utyEZ3bXrliKr2Ot1K7wl3VwAT8EZVJAD3b4uQqTn2X1xeZZHkm68YQT
         EfKaM4VddIWALSf87Y3cij8xWG09vRM8XLwhIdW/jNLr7e2QmD1P0Jv3Ft4AlK4JByS6
         hMuSpVxQRuQPoFJe5sduVjfTL3Rv909e2gQaBgsoGbatyqq9vJhdhjbI38OdVJTo/U8V
         IAmhc4avPj+URYppSGTlcY+R6jcu13F/B2o/RC9kPm2h52nLIhAx4JekrDiVJ/1TTvJs
         3qBUft85Oapp559cFlUCXtoPVE8lEwcBGy0zmNzklt1U9NGRsWlvfQUp0ddJ5eSwNAfw
         Kikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yvCvZqd/G9ya+Ohyp6HL6QjxXksg2p0BkixwWFQxr5M=;
        b=GULlLqbixXN2N/S8BSC2mrjzP+fVxp5FMDBPSYY4gWqwxHI90NQ5S4S+NNjGScIkrF
         2oyHqhFVcmjIC4d4iZfRN5knigddy0+cd+Kfhzx1veBr6Vy8lPUds4ij7L9B6JrUpJsM
         TefrWnnCsY8+i1UzAKWSiupg+CjtNxqLR7iA0jiKsPo2W8iyJlVJr6qqm8d8PepYHEgt
         pYaCNB+X2/wVz6HQ6xpW5tYJMTDe0eENs5Qv3EZ/OZo3r3MWeOA5qrff5QsBDYiZs/et
         BqbLQgZm5/wuVo1FoLHiS64sH5dtAUjWpiQ2wC3X901HNEiVa86ib/Z8XkgkX6ICJ+K3
         3ugg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bKRJ+yvT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac85d49000000b002f36b61b0ebsi2404679qtx.330.2022.04.30.23.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bKRJ+yvT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3YH-00009P-By
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tx-0006tp-UR
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tt-0001L8-Si
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id o69so8976106pjo.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yvCvZqd/G9ya+Ohyp6HL6QjxXksg2p0BkixwWFQxr5M=;
 b=bKRJ+yvTIKKDRxoS6GLShppVZJUTKoPxXEyXZi4Vt4xEUAcRpc4fUe8z1Mfbed1Hx6
 aKgasFfLDevmJvcqjxqVG41tR2PRZ5qzPBPpg5BsO9LL6l5mqBT/LWtO1HNF2Gzenuyr
 krekMVaXCGOsgUHRmGNB+SLsQE4m85k8Ee3rNB8qqOqxrLDKDCx0Erj/L0NPTu1aSRrk
 0jxmQpkPJpmF26o2gIBBw9oK6wY5pJ0tufrW+mIoiQI3hB2eqd/yuGlcenOq41x2Ut9e
 Oav7uLFUBIQgcT6SUBhLvkFVSHxJFITShJ7IYKNGzoLyLTL0kl1rUSAC+V2+Bhr+m64P
 NHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yvCvZqd/G9ya+Ohyp6HL6QjxXksg2p0BkixwWFQxr5M=;
 b=rKvvsTGiMiVqVJH2MB/FFZmkci08hLSUmZYuKN7kHIZuDeqRTgkY2h/g6JXM3bMydV
 2sv/468dZ30egQtsXjoIAKF4IVHPwnWRfJkgyLv6si2sfKtTYTivV+Vz9UcwjBMYCxqC
 a1c8m9wFHzj8C9JXO8QR1D7el28yGEYbra6AC1kwB0Tc41J3wz6AQAnlN5ObaPYgQa9l
 /cBO7AkPmdEkeGRDsop3Qh+Q4lKZPmYO+9hL8T2EPaCyU9I28Gi7zNMKtyzQhWFZWyXh
 jFqYeNEQdu9ENGDvixDw0kxcWl1/yHyAC4cxjN62Wv6rGlDfHUB+44MLrevBW3MuhKTr
 YkUA==
X-Gm-Message-State: AOAM532kKBY+HiMcez5ubh8bk3XEb+NPzPstUA/q3o+Or025rJtYlZNx
 cG28TyUHDVIKVAor6cSLGd6vq6FeqXPX8A==
X-Received: by 2002:a17:902:a705:b0:156:9cc5:1d6f with SMTP id
 w5-20020a170902a70500b001569cc51d6fmr6358930plq.66.1651384252739; 
 Sat, 30 Apr 2022 22:50:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/45] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Sat, 30 Apr 2022 22:50:06 -0700
Message-Id: <20220501055028.646596-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: 0H8pqlbWetD0

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 228472506d..a5741e0ad7 100644
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
@@ -8212,6 +8215,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

