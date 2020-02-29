Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1318882lfg;
        Fri, 28 Feb 2020 17:30:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxC3qSnXiAKctXO2DEbxjJfe+OHZmxo9kVlE7bEMkceiwb9ei9eCQM9dO/0X9yAHH/9lZO3
X-Received: by 2002:a05:6214:10c1:: with SMTP id r1mr6243152qvs.70.1582939842537;
        Fri, 28 Feb 2020 17:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939842; cv=none;
        d=google.com; s=arc-20160816;
        b=uRWyN1lBTeIa4oLERH8AxlDGX5jQ5xff7f40KIOvUSUrvpmP50J3QQw2YAidpS5k7d
         hl/7JZcEi7rbmaG/wNf/S4uC1wUlckxl6IfEyjhfoPIlpfIkhdnTtnuUV3uiZdgCDDCC
         KpaRYDGYlNvk3qszOXQUGsPRJQ7UjR+xxvMbzoZom8g81vk6QQvTcJE8ekSoJYGb0N8w
         1EXQ4UaR0dgkiTbibJl0O7OYaSsajwsqgJ9Wj3Rfv6mS+6ugHyYFhoGBCppvofR9Eon7
         nVK8HIuPqD8N4mJkJYaHF5zhde2wGLO2K01hFrGbK0DKOkuzVBxE6v0lkKfuaaBz03zN
         hGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4ajglCXwTcimWMRoub0cmqXlu4Sl0gLTr8uSkY1gHjo=;
        b=oPWiFK7hXPHavrdk0YDIX4ywnglTSlcjFBB1UBy4jSmpV1B5V3tNT2Vz51fLFK3uWW
         RN1piYKBB9QITS6p+Lsy5l5DlY1xbTOYmebVPWGhXcDJPItFEPrzKT501hNPPsAxOL9T
         8AQft8dZo0TaSJckMDfieEaUFgfPGKouiFdG5EHsGuYgQqxWC5BlAJrGGa8rId1H6mFh
         wKTVIl3wodyCQqN9yq0GnWFhyh/j8ZFZIjrm8d529jPIKnPmt0M8Vj9vEwWOJ3QT3Exg
         iF7CNNstNnBrblRTz1hzSwG3L6PcsB9aTrjAGOpVLuaR7O67nAHupyNOXOalqiA47Aqv
         /+GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PjYVbNuY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si2333496qtq.6.2020.02.28.17.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PjYVbNuY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qxl-0001Mu-LZ
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvc-0004uV-2v
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvZ-00064r-QU
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:27 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvY-00063h-JT
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:25 -0500
Received: by mail-pl1-x643.google.com with SMTP id ay11so1920081plb.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ajglCXwTcimWMRoub0cmqXlu4Sl0gLTr8uSkY1gHjo=;
 b=PjYVbNuYXVZoO+Mh/NKpUDUhSzgPCyft37XZStvJiaTAIM1YCc5dFu3SipLwyMAKx7
 MCZWF6PZms87SW5nHBZyqJNEGX4PSNPXXdIijvbNcW9LBy8YEaXYbkCuyBvNN0tg6kc+
 yBpt7khsm31kTgPzDNntZyRfAi8HCeymDo0Xu6W7oA3dEkfGWAGsXLiDh4K4Y4eGJg6k
 aCEGzl872u5UgCehWevbnapogNuwwxAHuW73yCSsJsAcTFf1UEGAcThkdrytO/tHtHjk
 hNf+s75ia5bP7qgDj2XpHUS5u3tA/zwIK/UGaTHoEWTGxO1UK2rAs0hh2xHfHMyPhq4L
 lkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ajglCXwTcimWMRoub0cmqXlu4Sl0gLTr8uSkY1gHjo=;
 b=gZDbHSkC5ihbgCCBoZbQSi/g+li3DT5b3rprb3qQVPgYoBMCx3murWg7BI6q6K2Qkc
 hemqh/zbDWxoQsiy8cp1Lq3fFBfCxQV9lVGlInQHgJPoTsX9t48g8Q31OdUWQDuGlJJZ
 MkolevPxRNGXarICfzaKCvqxGBsOiGcDQ3L8np8hO9VLvfxFRr1cNL2jHEHTRTG0MZrR
 PTlo4qmXauMC28uy3IrRtPGpf4dMfZUGGZKicFLngM8bywnXDR0nAEVBOxM2jmaQbP0x
 pW1cad4XumpEc4U6ZGHz1nIrEDpqd50Ja/fXMhCfPjJCP451CDz3LXxJ02VZFMYry6Lf
 9gpA==
X-Gm-Message-State: APjAAAUN70zpjr1fNOOODnRK4xAGS9PYxqWeWmZJ7fzAE5nssJLMkavc
 NqdoG+SCEZ9KCGurPgYQ6tG7Q3766dA=
X-Received: by 2002:a17:902:bf41:: with SMTP id
 u1mr6547110pls.207.1582939703650; 
 Fri, 28 Feb 2020 17:28:23 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/12] target/arm: Honor the HCR_EL2.TSW bit
Date: Fri, 28 Feb 2020 17:28:06 -0800
Message-Id: <20200229012811.24129-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-TUID: RMA3zdXwODEj

These bits trap EL1 access to set/way cache maintenance insns.

Buglink: https://bugs.launchpad.net/bugs/1863685
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1f371b0391..ddef3d7dc3 100644
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

