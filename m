Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110750dlb;
        Wed, 28 Feb 2024 01:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUc22EBEgx2xOTDlPfCtJFAU5Oku50WU9TgZnhHG5uh8bp4GiSnLcNSC0ka8hJ8toXSZnRI5VGJF606IBdjkl6blrYWc1R+
X-Google-Smtp-Source: AGHT+IFK5t2ISyzf74zl2NTf9ey9WilRLrZth0m0Y6iLv08MSGwxe29CCB+rQ66pq/AiJ2x/P6ZN
X-Received: by 2002:a05:620a:4712:b0:787:f549:ff4e with SMTP id bs18-20020a05620a471200b00787f549ff4emr197198qkb.19.1709112868973;
        Wed, 28 Feb 2024 01:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112868; cv=none;
        d=google.com; s=arc-20160816;
        b=saXJb23x1QOcVMLa/R7nF2qO25SYbkX52HwBLAldD/AuG8J85wEl9nwB+DDNdJfWv4
         CBLycJMqUdcoRGXIbmtlME+KmhHhgVCaUhYD9vG4FClBg5UsYOlZBnuwbmSjzd0TsaVI
         D1C8hBuEG6UFVN5s93WTeAtCMAnZzAekZt37ynawvmh7yrNYDPUmIQLO7e0tc8s6nwL8
         82fsm0jLRGh77uXDVIDyMTg68uiP4PDfw9xrYuXRIYh80WkmwE+MO/uWoKIaoVJUM8Cs
         /hgNLZaqJgAw6hku+MamjauaiURtG7aDlsIeQu5dNuj+7TU6d6NRTkEIeIcXafSJn4qs
         Uvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=oc7jcZ/VwD/a4L52Hi7AjNBBvkxdlh8+dy5C2DxauIU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=PQxH5lYJZD1iRiyc0HhyDfcsidu1IaIL0Qs8dYj22rWlsX/DWpHIhArW/PvRxx2FC+
         JaODxNoX+QSUo9K/A31qALLT2oBGqwQP7xw6VJ0UKKYw5W5J6kWXRUFO95qayXgr3jsf
         SZOa77ZheL3f0vaa0s9giu7SUoFdNPdoDSbFXcs2CqtDKQCUxgzCAKKoCUCOL7fmRe3N
         OSmp4TrEEBmY6lEVx1pMwbCaAwGbhtliqMuP8RppooP8fjPTe6jV1sT1WUH/lLXCqznz
         48uH0+R1SBfRhy4BDaZDoY5OS2hfINPtip94+uwmO80SsOaHzobY9TEdJH0P1qhE9HOW
         XMoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05620a084d00b00785d846cf6asi8897476qku.393.2024.02.28.01.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:34:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHX-00019R-Mx; Wed, 28 Feb 2024 04:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHO-00012Z-1e; Wed, 28 Feb 2024 04:31:11 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHK-0001Ss-7B; Wed, 28 Feb 2024 04:31:09 -0500
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Tl8FJ0YtDzNlnY;
 Wed, 28 Feb 2024 17:29:24 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 94133140134;
 Wed, 28 Feb 2024 17:30:54 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:53 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 05/22] target/arm: Support MSR access to ALLINT
Date: Wed, 28 Feb 2024 09:29:29 +0000
Message-ID: <20240228092946.1768728-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9b/L2/U2tMWR

Support ALLINT msr access as follow:
	mrs <xt>, ALLINT	// read allint
	msr ALLINT, <xt>	// write allint with imm

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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

