Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp639125ejb;
        Thu, 5 Jan 2023 14:46:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuUDBJXf6gl4WUk0gJv4HrTMtJQD1wpYeczzRmmyi6iJJGwCrZdtas0A4CKDAFGyEbYQa67
X-Received: by 2002:a05:6214:4383:b0:4c7:7e73:464d with SMTP id oh3-20020a056214438300b004c77e73464dmr19854489qvb.20.1672958777854;
        Thu, 05 Jan 2023 14:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672958777; cv=none;
        d=google.com; s=arc-20160816;
        b=UxGRXiTOhGRzSiuyI10VlNDO0ASJLMmVVzhihvv0tKzYQkdkAuXGvTpsI0CxVYm1xN
         52iLiqz4ZV5bMYcZHMpwXO4Hi4xJSCGNXljks+BoSTBrP/1BsUCfBjoWJXkmo6jmyoUx
         iyMaB7y8V3N5FKLZei972v1DXRKtjGxuWWyCanK7t0IvNn/6J/GAXmb4IYZ/7jZQZzBs
         ITN8zcybdFWJp/RO5OnhRoYETuzErOS5/eyrCCsaITS+tEM5/tB7sGo1/urDkfznIVdI
         YHRtCEvY1qHo/+LTo0Zg4Ia6qMpzJwpLnPX/TDSuFEOE3r/TQtQuVaAkCWNUiwEkTg28
         1yFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=3xTNu8Cn5pLkQiBZj1i8qn+BWwLvT1/xbvKGDj2Yv7U=;
        b=bNkVfGun09bW7TPX90EGrK+kQ5KZ0Q+AZ/+dStIK5Um5C0b53SYUXoy//2TP11gdve
         MKUgcBYLllRfD7icrZo8C7S/OZKFigKDE48ALNu2nXCcHYl4BFP+OGUN9ueta9IB4T3D
         HrYkOKYvqMmpdxEbI/xb3G37J4tPXWy9F1qYlBy5/Lj2VoSQF7k00OrVMdB30ji3JZCQ
         r78CvT/s5Pc/QdMGEFLO6bms7m4yDQS+uPtrGVF08HlsWoukXclcCBJROVjcKLFRnwrs
         52h7XATqcw6lOPVwo5YU1mSpuVYoWcKAUWTaCNyhfUTUHNUTaiWXxlucCT2eKUdj3+Fn
         oI5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UlJ5zOdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ad45c62000000b004bbb0cf46b3si20967411qvh.325.2023.01.05.14.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 14:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UlJ5zOdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDYzn-0001Az-4M; Thu, 05 Jan 2023 17:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTu-0006h6-4N; Thu, 05 Jan 2023 17:13:02 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTs-00022m-CH; Thu, 05 Jan 2023 17:13:01 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id ED32D20B92AA;
 Thu,  5 Jan 2023 14:12:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ED32D20B92AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672956778;
 bh=3xTNu8Cn5pLkQiBZj1i8qn+BWwLvT1/xbvKGDj2Yv7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UlJ5zOdPmFH5noNgqx3ytjm1peVk3zT/TbPE/B4ylFHfGvNoxZQ5qYmdzgrYaRyiV
 UbcdTXQxZN9mVdN1jtnph+aAUFNLAuO8d722SCG8P/IVl7+1JlOKYqq1ncNDCO8DGk
 m9qjT0pSvTRSItrpt/EXIo6yT5qWvDUMAzg0QLT8=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 1/3] target/arm: implement DBGCLAIM registers
Date: Thu,  5 Jan 2023 23:12:49 +0100
Message-Id: <20230105221251.17896-2-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:45:50 -0500
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ff0qCZ0rD/b9

The architecture does not define any functionality for the CLAIM tag bits.
So we will just keep the raw bits, as per spec.

Helps Hyper-V boot on aarch64-tcg because it context-switches DBGCLAIM
on EL2 entry/exit.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d..eddec155b0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -494,6 +494,7 @@ typedef struct CPUArchState {
         uint64_t dbgbcr[16]; /* breakpoint control registers */
         uint64_t dbgwvr[16]; /* watchpoint value registers */
         uint64_t dbgwcr[16]; /* watchpoint control registers */
+        uint64_t dbgclaim;   /* DBGCLAIM bits */
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t osdlr_el1; /* OS DoubleLock status */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c21739242c..b244e146e2 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -629,6 +629,18 @@ static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void dbgclaimset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim |= (value & 0xFF);
+}
+
+static void dbgclaimclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim &= ~(value & 0xFF);
+}
+
 static const ARMCPRegInfo debug_cp_reginfo[] = {
     /*
      * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
@@ -712,6 +724,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
+    /*
+     * Dummy DBGCLAIM registers.
+     * "The architecture does not define any functionality for the CLAIM tag bits.",
+     * so we only keep the raw bits
+     */
+    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimset_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
+    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimclr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
-- 
2.34.1

