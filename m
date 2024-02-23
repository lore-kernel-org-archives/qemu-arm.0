Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475326ejf;
        Fri, 23 Feb 2024 02:35:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURYHmU2qLC24TrPcWM+KKnGtDzL9SBqnWRUy4M3vYWm67N89zdMdJNru5YaPGGfJH0wtqPW1wB2Dx7+qHBpTavn0EgMAka
X-Google-Smtp-Source: AGHT+IEbJUQPKPC8jqRzPF1RsaMixPg0zvbAC5zKWyDx5UtOIEz1elZpQeVF6ucBu/hLjELF18OP
X-Received: by 2002:a05:622a:20a:b0:42e:685c:d4c3 with SMTP id b10-20020a05622a020a00b0042e685cd4c3mr372870qtx.55.1708684503922;
        Fri, 23 Feb 2024 02:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684503; cv=none;
        d=google.com; s=arc-20160816;
        b=JaxRaaitn3EUciiwk7/QA94dKU6rgS2njWSu2KPklUEfQHCavkrDpbI4czUgzN3oI5
         MTaYrPqHF9hcRGW0yqQ+MfxoAd3g2riOYSBEsQ+mUdwIoqyVvpWwVxouVnJoNwArkTUz
         K8k0T3wgOueL97pTm9k6Y1ThQ1lfSAcp9qlufk6HXY8NwzHqERfdSt7OLX3cfrpflXwK
         j6N6B9k/XXGEv2BkKCBxGaJCs5kaXXeMWgiHS7s9Bld3HqQkhTT8///jeHuvHA15+U6W
         8KoRAZZareXEy3xXJrHH9D03JZWBUNO3kZTTTniSNDGhQMtKtNxGo3RMpJywN1x1SYi8
         v+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xRMxM/sqTe9fRgujU3Tv4Er4U3woe5p/JHR+aQP1AGU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=NWClHYG/PZAG18BSJILKr8iv1gPq5ZegCAvlV55B9DzWohQclpN+Cgdc/hthNnGrRE
         tzquh8nUAVhV9gkktGRAhtTw7aNqFL0i3ZlbLayq/LHqptIYGh5b5wh0v0ZAbl/OHEMi
         MEo4xXMe5Thn8z5+VCehk9mc9TdLTBM74LawKdZzRbA4HUMqBnk6XQ86scE9skUfkA63
         6x7X9qjy3guXqNNLAaQKJCKmea9wYtKCp3fgm/drkrqoX+lfgM5V+YoCdCtrsbXdZWfe
         Uoiu4E0VqbqWtM5IWAQWGpNFhPO7gl8g+UTNl/l4VapWLdms2KxtN9fPxjDBxJMvCsC/
         tHcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a05622a015400b0042e28a34addsi8085112qtw.648.2024.02.23.02.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSst-0003nr-RX; Fri, 23 Feb 2024 05:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsT-0003bV-IJ; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001w3-LE; Fri, 23 Feb 2024 05:34:01 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Th5sT6J7HzXhBy;
 Fri, 23 Feb 2024 18:31:41 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4FD701400CA;
 Fri, 23 Feb 2024 18:33:39 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:38 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 05/21] target/arm: Support MSR access to ALLINT
Date: Fri, 23 Feb 2024 10:32:05 +0000
Message-ID: <20240223103221.1142518-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: pXUK0AEX9fFL

Support ALLINT msr access as follow:
	mrs <xt>, ALLINT	// read allint
	msr ALLINT, <xt>	// write allint with imm

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Remove EL0 check in aa64_allint_access() which alreay checks in .access
  PL1_RW.
- Use arm_hcrx_el2_eff() in aa64_allint_access() instead of env->cp15.hcrx_el2.
- Make ALLINT msr access function controlled by aa64_nmi.
---
 target/arm/helper.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b7e4c7ddbc..b01f23b939 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4618,6 +4618,37 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->daif = value & PSTATE_DAIF;
 }
 
+static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->allint = value & PSTATE_ALLINT;
+}
+
+static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->allint & PSTATE_ALLINT;
+}
+
+static CPAccessResult aa64_allint_access(CPUARMState *env,
+                                         const ARMCPRegInfo *ri, bool isread)
+{
+    if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
+        (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
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
+      .fieldoffset = offsetof(CPUARMState, allint),
+      .writefn = aa64_allint_write, .readfn = aa64_allint_read,
+      .resetfn = arm_cp_reset_ignore },
+};
+
 static uint64_t aa64_pan_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return env->pstate & PSTATE_PAN;
@@ -9724,6 +9755,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

