Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6315085lfp;
        Tue, 18 Feb 2020 08:47:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqztKb0cCCLwxIlQmPHSmZc1Xky8Xin+O1U46BD1nmvpQEDfJTP/gU6lpC0MDbh1aSkBqJfs
X-Received: by 2002:ac8:2902:: with SMTP id y2mr5009787qty.258.1582044462180;
        Tue, 18 Feb 2020 08:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582044462; cv=none;
        d=google.com; s=arc-20160816;
        b=bLGrg+cCk/4QGCIyvbxqXQ14bl+T2n7bboW7wziFCgAVQ9DVA5BE12jcntnOAMv9+/
         5b5OmU1R2+E3k39BqSUYoMMCeLnm409QfCA9bQ3hzx9iHE5fnd8gyKs18cKbBVfbAWAV
         Vgk0ZRqXJ25eNuZysyI3RKNkG4Q2dR2zxjod3FE8S9ymwKnidFFNXkFAB8Unudld6afx
         RJmzzGfW7jTnFjUTwEChun2+haEXsPftIRcKHPmH3nY/WVi2DQe4E7nffTB+27GLP/BL
         gQ/qTjptxMk1l/M2jziZqA0QYNGBR8A3DqavEDyIMAoWClzEGkdZ3UM50JMOuE7o8xvU
         3SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sJagifWpn6uhasrVbYbX7C8kWfDQ+S6CVHfZbQrfkHs=;
        b=b9EHacZuPWol4qRVCeFhtbceZIvWOfvuI/qTtgcmaZCVP9yDAaYfuJdKvGnK4GM0sJ
         0GGGV+TI5YTS41QTJ39zg3I5JMPC7vF6QFYjiMyfEZewEE90J84dAP0o2C+FQjvP4fIF
         N1SWt3vrblvEfEGXjNGL/u9W/UA83AzWibSUDFQ/R5f4M8/cDVOv6xw/whZYu6k4U8Sf
         vx7/IOmKbU2uMsyEPTBYq+UWJ0hSapjh/SwiGm4IcQIs3dSCzOzajheFl0MjV9xDBHef
         yFAR9UezZLDnhTRwOvl6iyGbKAACHJUvOqztp9R6V/Z1pC6Z4kxuHgw15lG3RSBE2dZp
         neOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJSG3rhH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si2104832qki.349.2020.02.18.08.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 08:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJSG3rhH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4629-00047e-KU
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 11:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j461v-00047K-TY
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j461p-0007KO-A0
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:47:26 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36597)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j461p-0007K7-1E
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:47:21 -0500
Received: by mail-pl1-x644.google.com with SMTP id a6so8308019plm.3
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJagifWpn6uhasrVbYbX7C8kWfDQ+S6CVHfZbQrfkHs=;
 b=QJSG3rhH9S1wrjdjW64CkJvV++hHpPqB+EctHzO0VvbJe6RI9CD6aVoa7G2sWIv2uY
 Wh1QbumYpgq0slfdLLjrGi+zdiysK3QdI5l2DASxADrgwATNNLClQ4MnUrJcp6btme+D
 pbLZ0Z1PgyIjsg83kx5J+3Jqvq2ezMomPKPxFP/2r6XFfD8u9u/ZSG2O0rLI7gBqIGhI
 rnbmCHm1cQcJvtJjJhAHhIRU2Ow7p8TJmjhgU3hxWaUhiRkvi+c4Jnj8kxKifg2tXmW2
 58xshMWBlOSEjoDxS1b7uOpmIigPG4ubmI997ZrhYYR+U6VbN9NhOXw1XjHdNKUtp7lF
 BXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJagifWpn6uhasrVbYbX7C8kWfDQ+S6CVHfZbQrfkHs=;
 b=YBNMd92x2SjrHApgZ4DgTx5rVkMB9R36vwkIcZTpUeBN+ZtNB8d8bLEya/QXOOMZei
 ggEugNT9GnasvT6BlL0HXT+VScph//Ir1Pb3pUQplYF0sflOkzZPCg2rP/5hkKh0plqj
 valiCVMJBLetm85hbwImhZU1ZuBy/qWgar8knmg+z8pVc82LEQ6z/MkzEuDyvB2ZHpGC
 5OHpixFJ5mDup1CJbm+lqfDzzfdPijK0hfY9w3wW27x4u1+uJQb3acidbY5Ub/j4we1K
 DVD7PS0WvBKNjKVKLu7DqF+UlZ3v9BbpAoNCP/RfjnrmsMrsitbVF/Ub4bTdDdreAyAo
 FuaQ==
X-Gm-Message-State: APjAAAVmnAhhRoiUgRhkickRBBd9A+f5F6Dl2Stupfz4Alk+Oik04/JR
 fNXSs5fHaD82pr68DoGVn3TAPQ==
X-Received: by 2002:a17:90a:fa8d:: with SMTP id
 cu13mr3642788pjb.68.1582044439626; 
 Tue, 18 Feb 2020 08:47:19 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d73sm4858392pfd.109.2020.02.18.08.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 08:47:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Honor the HCR_EL2.TSW bit
Date: Tue, 18 Feb 2020 08:47:17 -0800
Message-Id: <20200218164717.12842-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+pT2JKV4se3

These bits trap EL1 access to set/way cache maintenance insns.

Buglink: https://bugs.launchpad.net/bugs/1863685
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Based-on: <20200218152844.29351-1-richard.henderson@linaro.org>
("target/arm: Honor the HCR_EL2.{TVM,TRVM} bits")

Not really dependent on the above, but there will be a
trivial patch conflict without it.


r~

---
 target/arm/helper.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 69946a57f8..b87518b97a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -542,6 +542,16 @@ static CPAccessResult access_tvm_trvm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TSW.  */
+static CPAccessResult access_tsw(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TSW)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -4659,14 +4669,14 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_W, .type = ARM_CP_NOP },
     { .name = "DC_ISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
       .accessfn = aa64_cacheop_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
@@ -4677,7 +4687,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .accessfn = aa64_cacheop_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
@@ -4858,17 +4868,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCCSW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 11, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     /* MMU Domain access control / MPU write buffer control */
     { .name = "DACR", .cp = 15, .opc1 = 0, .crn = 3, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
-- 
2.20.1

