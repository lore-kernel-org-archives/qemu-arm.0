Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484411ejv;
        Wed, 3 Apr 2024 03:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVatDYs/o4Y6KbbylveLSoZSmyVpD/01/3jMwL4utof/HsOSnWRBsSCcdUGftWhg7g0daohbTmohRm6UEuf+EiHCK2UP5WS
X-Google-Smtp-Source: AGHT+IGZvwRRnba8yCHzPShummsiB/fQRnUtQGK720iWRqlLVqxaoOtzLdIkuA5dvzm0YEQMtKWN
X-Received: by 2002:a05:6808:6392:b0:3c3:89dd:9e71 with SMTP id ec18-20020a056808639200b003c389dd9e71mr13172269oib.50.1712139555461;
        Wed, 03 Apr 2024 03:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139555; cv=none;
        d=google.com; s=arc-20160816;
        b=MIKtx2VaHw4JWpCc4nEVwRFe+PzYc3f3XveiRusl9wE41G3XbKcKx0BlCKQulsR67d
         AdZAvzbvUxhOEJIG45Dmp50gFibfMVEv3sdJnAWF+YJLYdPRMmYqr+YpIgoD3qpFXxLl
         1KxmexQE/v4EL/ldsDGlKNnldYEECu/IZkQWatamkIhYH+AIpvKiaxzeiGkxg8nGAD6t
         By3m2kCK50a82p51RiyHZ7PJzI9ZfSfSQ4GlHY+jMdbf2R9RwlNFdyM0jehpNsYS695w
         jdGjC0iCRnfl127HvrDtMHzNiBx013ZZ0/Bh1+3PX8M1qLfRviAcF9ay1voSeGaaSJ5z
         8uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=t3jazX+6tDWzajfl7GWHjXKqn5VEYTJAYHbEOWxOgL8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=TnoRyV4bdjA1s2NFpYxRk5yuEgYIouzzPJHuZkuYgSqxhvcTpVYx7rJphQ031nkqTq
         hQEVG8Jb1OjIdsGs+iDpOYVUVZ/eEJQBOHAXnZPZ0nrQ+aigv3nYBye9RSVr+nKw6Adh
         ZCsavlFBp/gftO3n+7KNgF05YMwB4x9nglobU8I4vx5gnYkHMW/1oI5HHBZJ89o+UveY
         1Ap8WEt5+tLJvIYX68L4wcJCtUBk8oZJONVhUlPCMG0MXnVxbHagPXBtZorilCw9jkZh
         M7DvPCH7QfSWNNUj0rJ6khETuG3J+kgjSF3TOrAxXXrYyoWsyh4uF7PLsYJldP/Cmupg
         GC0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020ac8574f000000b004343a7044cesi2807837qtx.555.2024.04.03.03.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrxgt-0000qi-Q7; Wed, 03 Apr 2024 06:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgo-0000m4-RA; Wed, 03 Apr 2024 06:17:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgk-0006cH-33; Wed, 03 Apr 2024 06:17:54 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V8gcS0lssz1ylZ8;
 Wed,  3 Apr 2024 18:15:36 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 29F2F14010C;
 Wed,  3 Apr 2024 18:17:44 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:43 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 05/23] target/arm: Support MSR access to ALLINT
Date: Wed, 3 Apr 2024 10:15:53 +0000
Message-ID: <20240403101611.3204086-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JDSPyr1hW2GV

Support ALLINT msr access as follow:
	mrs <xt>, ALLINT	// read allint
	msr ALLINT, <xt>	// write allint with imm

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Move nmi_reginfo and related functions inside an existing ifdef
  TARGET_AARCH64 to solve the --target-list=aarch64-softmmu,arm-softmmu
  compilation problem.
- Check 'isread' when writing to ALLINT.
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
 target/arm/helper.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 408922c94d..5ed3eacbea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7496,6 +7496,37 @@ static const ARMCPRegInfo rme_mte_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 14, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NOP },
 };
+
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
+    if (!isread && arm_current_el(env) == 1 &&
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
+      .fieldoffset = offsetof(CPUARMState, pstate),
+      .writefn = aa64_allint_write, .readfn = aa64_allint_read,
+      .resetfn = arm_cp_reset_ignore },
+};
 #endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
@@ -9890,6 +9921,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

