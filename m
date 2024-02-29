Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp374907eja;
        Thu, 29 Feb 2024 05:14:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAZ57gL79qW1CRU+K/I3DOJza8goYxPGOvb052cUzWFcJaKSW5qOVROMJdbKoD+47xzvoWuElQUTsfiyy8QYSZgjUjfhj1
X-Google-Smtp-Source: AGHT+IHAPpuIF7dDGsOXhlv+zqczKo01Q5PzTzbuOdFrRymbEhLr+MYJ8+8aXlN3Eou7kNEgVoHS
X-Received: by 2002:a1f:eb02:0:b0:4d3:4aad:22d4 with SMTP id j2-20020a1feb02000000b004d34aad22d4mr1825072vkh.0.1709212468856;
        Thu, 29 Feb 2024 05:14:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212468; cv=none;
        d=google.com; s=arc-20160816;
        b=1LkVgMbh3yh35a3u+soLZgRuMJJYtzb/NR3fX2wtWdmOYfm3Y6HRkAW2U/0mGjbXKD
         yHgmiQ9zyMamhsRaBUfLm+WALwae6770bNzWdltG5/wLSzwtSTZ4QlOnd98meafG6hqh
         19GpwdwlmWNo5nDvPcSBNnhGbkcWR9Lc0J19GZ16gqVOWzRubEHR3Gm80tGQBP9afMW9
         YcKqoNx9p32ASfCyFj+qmL9Ld4LhY+W+CWCP51ws4zRLYMErBPJLNcOEOwv8oPKwHi1N
         t3+rWdTGWXjU0NJ6f+ZEcBodT1sp0dX0qFjhRJC1yL3J+JlR4Ktz7KOhzhxldfx3x1aH
         Ojnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+nRSNrjth2UwdRhfgwlk/qN0zTPWTDhsfhu94f5mEiQ=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ioZ3uf6nkc7leOGwEXu2pLfjZzI0FO0dKkNCnb3Rs3cyCAoHw3pFGOnchju0f1PumJ
         LvvkFAALCJ9ltcJ5VY3cfxMdT8NIZw9RjG0v6Fff0n5Z8Vb6247BqIUTskqCLpfWKi0x
         a0OBOZdYxA/id9CGtpv/wUMIUBPOR7PjYKt1/2mhTUFSA2ylfdUXbADop4aJIqaEda7F
         HREJCz/CJeuNBrMuBRF3V8WcjKZ9igjdT/SNELDfdjUiGGe3yEHV7Qq57GMr2QZt+z4C
         iPFrdawiGG932YgctRiUDrYQKy5xTNVnIg+do3ML5TQvoD7YfJllykWNlStbwbvaHoeu
         Ck1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a056122004a00b004d341fabf6esi139628vkn.237.2024.02.29.05.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfgCr-0005pe-Iy; Thu, 29 Feb 2024 08:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCb-0005ai-67; Thu, 29 Feb 2024 08:11:57 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCZ-0002dc-8T; Thu, 29 Feb 2024 08:11:56 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Tls6g0hPGzqhth;
 Thu, 29 Feb 2024 21:11:07 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id BBA0B1402CE;
 Thu, 29 Feb 2024 21:11:44 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:44 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 05/22] target/arm: Support MSR access to ALLINT
Date: Thu, 29 Feb 2024 13:10:22 +0000
Message-ID: <20240229131039.1868904-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fzi/SuNSo63+

Support ALLINT msr access as follow:
	mrs <xt>, ALLINT	// read allint
	msr ALLINT, <xt>	// write allint with imm

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v5:
- Add Reviewed-by.
v4:
- Remove arm_is_el2_enabled() check in allint_check().
- Change to env->pstate instead of env->allint.
v3:
- Remove EL0 check in aa64_allint_access() which alreay checks in .access
  PL1_RW.
- Use arm_hcrx_el2_eff() in aa64_allint_access() instead of env->cp15.hcrx_el2.
- Make ALLINT msr access function controlled by aa64_nmi.
---
 target/arm/helper.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index affa493141..497b6e4bdf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4618,6 +4618,36 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->daif = value & PSTATE_DAIF;
 }
 
+static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_ALLINT) | (value & PSTATE_ALLINT);
+}
+
+static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_ALLINT;
+}
+
+static CPAccessResult aa64_allint_access(CPUARMState *env,
+                                         const ARMCPRegInfo *ri, bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo nmi_reginfo[] = {
+    { .name = "ALLINT", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .opc2 = 0, .crn = 4, .crm = 3,
+      .type = ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = aa64_allint_access,
+      .fieldoffset = offsetof(CPUARMState, pstate),
+      .writefn = aa64_allint_write, .readfn = aa64_allint_read,
+      .resetfn = arm_cp_reset_ignore },
+};
+
 static uint64_t aa64_pan_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return env->pstate & PSTATE_PAN;
@@ -9724,6 +9754,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_nv2, cpu)) {
         define_arm_cp_regs(cpu, nv2_reginfo);
     }
+
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        define_arm_cp_regs(cpu, nmi_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.34.1

