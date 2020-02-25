Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1989682lfg;
        Tue, 25 Feb 2020 10:08:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqzoKYIdzj1tAcoA7wo8fbfAyvDxRmSxqI/mIqUodGyBQyxyrO6hvqWh03CHCOzYoyWl6RoF
X-Received: by 2002:a05:620a:74c:: with SMTP id i12mr57220qki.286.1582654133528;
        Tue, 25 Feb 2020 10:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582654133; cv=none;
        d=google.com; s=arc-20160816;
        b=DUsCNr24Cn8Pn1bX9SMgnj15UzpN1/nv5t85EoTjZ2TXHHxwc803MjvPRGrZOM6Mbv
         xZH4yJPUaZtCxa1qWS8CJvG5XGk0eomIsR8qT9rHXdw2v50i8WgxXaeWZkISTJk2qX1b
         tsKx/xvFxrmRtBKtGNWHbQbhzS/vUXlwlnYNA560qOKfedfIwGcBn4S5eZhX9IXe+YH2
         iVO5iOB4mAI3VvFe6eMqUgmPRJRyytzG8M7tpfRyEZrHTNI7fYf2wODypMHBEzYmju+0
         oU0e7fesYAxCSnKZNOM55RyT2N8dM1kjkwJvEZCVmCoJ0SZOWUFE3yxPIj7rOMfBnRZh
         TqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oDXzsq0/YvSiQdzdpF94Ig5JPRMqXV2OYmMtHFtNL2o=;
        b=yiHNrjRkogalRLW5QQE2QHPzWyut1TI6XMvp7htYZc0InTx2tjK78oWD+hr+aZVcWo
         lsI0C2bJo/VjCiz+YrgrBstOerqUobmfVZUnrzaQaMrCku7Jppl4zUr+xEVtrDBxMN6S
         RTtW0ezK6UAfqUP9i0UabkkeG+dtU5qtTYKlbtGZIW8VB+NRZwhjGtflcwSIpZjFDRyg
         kGd87DTOxF7zojGmVogzPsVbl2OCVNrKvVgYDDUVceDq8WChtI/5NU1zoHuUrcWOVFBR
         /LvCgxgp5muGp7Mhyf3WmF2w6ufpXtZIWErQehXB2FJ5Nd7IszGj/dWSTAXaYaENsNiK
         8Ohw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dj+Avin1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si34180qtv.47.2020.02.25.10.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 10:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dj+Avin1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6edY-0002Kp-S0
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 13:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edO-0002FG-NO
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edM-0004NW-Tt
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:42 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6edL-0004Ij-5t
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:39 -0500
Received: by mail-pf1-x443.google.com with SMTP id j9so7598221pfa.8
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 10:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oDXzsq0/YvSiQdzdpF94Ig5JPRMqXV2OYmMtHFtNL2o=;
 b=Dj+Avin13YTXRoFhgeuU/WW/jvjBnqXw/h3/iQXc7B/TESIkkXIZlponud6ocxp1M+
 2QlNczoDFKT4JUmWHuXn77kGM7GPVAG8GeconevLLl9qS8QxkB4GasXgnuP/DSX3ShlF
 s+jjtHanP7Uxl7Oi0ZWbivrvYI2vx8NBTD3Xdfi6q4HiWNyC790dXGjdtev8NetN/QVb
 I1YarIgfiSG8uzwmaoyRPf2hfeS3t4Rk2a1GQcfljS0bHgBFgg0geyPSfE0TsfQ8pym2
 b9/VvuowBkYaHu9vVqtmPi1SNvRYSgJMr3hIJ+pDNm0afdx5NC4PLwymSTenJOBtucE6
 jljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oDXzsq0/YvSiQdzdpF94Ig5JPRMqXV2OYmMtHFtNL2o=;
 b=CzUMo5rX2FbhLM1/2UWQzWSrgjV7F0du5xfMxBmxRYZEec/B6wWQdy5RNT/CpwKpol
 GWsQUT/yR4z8vpcBfU7XXsBywXPq59xtPRuFto+3ngKAj2U1OCSy/GWhSm9vIW8ae1L0
 NV0U1aNgV/BxCxWG0bYWtWkqr4eyk8D18qLOXWrvI2uYksXPQtJlfmxMVfHe/6VpyUzS
 dhXjaLhpQQddpGXryrkSubJ9cHaa6FsJFOlO6xawZmCjjOSwkohs3TlWYMuWl5sTFoUh
 gf+w4SE1as8y4p2DCCGa6dL0aEUJkqujSbcx2QVRF/qfz8HhZUWa/kEYUuPcfWkB0z+s
 5Yfw==
X-Gm-Message-State: APjAAAVV6kx8aSjoY3EAipKcLFdFxpxAJpjUeKY5z0/VPVzTEo/3YdWM
 cvDBRrFlcJah6MEfyDw8rC1n23vAzJk=
X-Received: by 2002:aa7:9a52:: with SMTP id x18mr58712858pfj.73.1582654118239; 
 Tue, 25 Feb 2020 10:08:38 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d69sm19069704pfd.72.2020.02.25.10.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:08:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] target/arm: Honor the HCR_EL2.TSW bit
Date: Tue, 25 Feb 2020 10:08:27 -0800
Message-Id: <20200225180831.26078-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225180831.26078-1-richard.henderson@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: uDssiqfuGqR9

These bits trap EL1 access to set/way cache maintenance insns.

Buglink: https://bugs.launchpad.net/bugs/1863685
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e45d717cf3..ea42e0d26d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -543,6 +543,16 @@ static CPAccessResult access_tvm_trvm(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -4704,14 +4714,14 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
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
@@ -4722,7 +4732,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .accessfn = aa64_cacheop_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
@@ -4903,17 +4913,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
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

