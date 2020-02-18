Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6439385lfp;
        Tue, 18 Feb 2020 11:14:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxX+4YWz/jqWOiNt9l2LFXPvtHKhA175MtQqdVwitG55+EIQKb1IjgYTt6zwr3KD+2nblgl
X-Received: by 2002:a05:6214:13a8:: with SMTP id h8mr17383206qvz.41.1582053245379;
        Tue, 18 Feb 2020 11:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582053245; cv=none;
        d=google.com; s=arc-20160816;
        b=GJ7kDaoSzsLFVA4u6rqsOClkztR7Vn0wI52g7B/Lluve62eIlXKssd9IFvN0Di34JC
         L4cliRdq8ZV+8CQbjF5YR8+Rx/h994R/u4Sw+lO3Y3u6+yuWs81682sNY4WF75raatt5
         pSAShbMgdauNG64y8zdq+JpZAwSDwWdql7CTUxq9At8+s56MruOuqPHMuBDwnLjZveQl
         WPS1XIUmAAPGqpGTWZrHJ6o0ELuRf/0oTSHhnFeQgTWDGpi6V3dVdEjkGPIOSC2CYXTM
         3v435X/8csngAA0Qcute5qayHpyrSpHPAgqGTYDYfmHxQeuI8NwpTJdTJHs+6xvvlr9z
         8o0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aT+wiWpglSLXunTwVoN4RPF1V0ishR6Qd0crZF3h7bM=;
        b=RUznYRs+pr7jZIhhEmt1mvlEExt9Oao2iIf59qJs6mrduPuiHF0+nbx7RTYxANil47
         LmzSCCdQTeto0k6Sd8XS7SHs9LxqxBcCmt7VO9JnXp66UJZzdsZMCZGHQqW3Lord3BgN
         uOXTICPPJpUbZ3VpCFWbjKB34h7D1cie5JFB+qf5FZ1TQMs9ytkxVZYM//Nq2sSBu/vu
         RPsCoiYzbeGBV5poLHAGgh2Cwj8JRqlPe6cWfVBLd4x1eWByqD8WgoCay8FaLWA3Y5VJ
         Ln/gO+KsOWXAfiCc3OMg3s5GOmMmlEUbuuEeq4yh5x+5S6vaJBKiehFD+y4FuTl4nzNk
         G26A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8QubRib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si2456094qkl.281.2020.02.18.11.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 11:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8QubRib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j48Jo-0002g9-R6
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 14:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fz-0004vk-Dj
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fy-0001pZ-4b
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:07 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40496)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48Fx-0001nj-T8
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:06 -0500
Received: by mail-pj1-x1044.google.com with SMTP id 12so1405705pjb.5
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aT+wiWpglSLXunTwVoN4RPF1V0ishR6Qd0crZF3h7bM=;
 b=v8QubRibTLDCjL+qLjfh4h5/fAFDbGbXAy+5GhWoynru3nPS/7itzgaySkz1lo+GyN
 mTGRwKAbgDSCkvdEcncMXlvGPg4uyjmFTQmI6adYie4q3gPeTQnroRKNAKEFBUMZQpbV
 TPMawS9kxVptSWmGKWyD/n4io81KMAyehUuuOCxm6kGpgUeXN+1U0GSgIBCeixvvKYiS
 yisNbxm9QIqfN1KL0+WEPlLaII5qR1bGAirvYjmUllO5+rziLR+Ymuui0MwPbUZgluBp
 XrFejTmOqHnqQF0arcbtMI8a6LnHcL7Q1qkpIS5fCrPqfrJsvaHiRzR3uwHWkaj904r1
 +Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aT+wiWpglSLXunTwVoN4RPF1V0ishR6Qd0crZF3h7bM=;
 b=Q2t6k2PfR8XWajDIrbXshFL+PVMPjRPjLaMhBR8KCLOMhEdPby/+vvxyTAkKUbbLdQ
 ZCUSPHGmCg2DwP3Lmq+FnTXqJEqwrtP0+PYrOKQ2cSEUoG3s7ZOuwSmBlo/iTQfvUJS1
 cWbudx10z38tMguXd+Hn5ZiEFj+Vtub6Y/7honTVRk134wW/bYJZ7fXn2dRUV3LWHDMR
 pTqij7AFJHM9okd1SO6UJQAcP50n0USqGeYQ/3sXsayzRkVkh9DOHEQHF7mTjMmoZ0h+
 nUnj7rGb2PwczDr5d2S8lMkeRG2GkFkge2E3zn4m1H/lmLMlU9n+hJp2ocKPhWZ1wgkW
 DuZA==
X-Gm-Message-State: APjAAAWWKp16DYZtvJJUfSklpxPLZpSqZOCgoq8bJCm6z38c3RuCxywN
 MFA9+DaxFK95Qhoncjf2u552Ww==
X-Received: by 2002:a17:90a:fa8d:: with SMTP id
 cu13mr4328683pjb.68.1582053004856; 
 Tue, 18 Feb 2020 11:10:04 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i68sm5139399pfe.173.2020.02.18.11.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:10:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] target/arm: Honor the HCR_EL2.TSW bit
Date: Tue, 18 Feb 2020 11:09:54 -0800
Message-Id: <20200218190958.745-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218190958.745-1-richard.henderson@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: y4O31I1gEvLN

These bits trap EL1 access to set/way cache maintenance insns.

Buglink: https://bugs.launchpad.net/bugs/1863685
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8abbc4e991..dc99ee5d18 100644
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

