Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564377ejj;
        Mon, 25 Mar 2024 01:53:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2fEzd0NkG6ucZr1zQUWXgzt6bUcPVag/rh8LyEbH4pa0yd/BSAgDpD4NwTMvN18qb3TaoSlW1Trivsf/OUInu2NBrZMB2
X-Google-Smtp-Source: AGHT+IEYPFRRscbPzhCoggMUVCGAbq3nlkdnE2WO+0MsxlCtJ2DLgPol6D5Z1wnup0WEy/xuVmK0
X-Received: by 2002:a05:6214:48c:b0:691:4c4a:54ac with SMTP id pt12-20020a056214048c00b006914c4a54acmr7942921qvb.30.1711356837340;
        Mon, 25 Mar 2024 01:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356837; cv=none;
        d=google.com; s=arc-20160816;
        b=uMzuz22udSXF2bR09IWi9q2672kLXJi297/qwK5+nQPrlvvL3qG5hKddujNM+RH6zi
         IV5ESx5qxQ+OHzhsLcxc1Kc214/t5hbL7NPM7XiNeQuK1rPTiJh7dgYltupPTPkC6vhO
         c0aKIyHj0ZczezyVacl00nmTOmelBD17S6HMXwzoQxspd6wh3Bt/UATd07Zpp/FNn+A/
         Y90k2X0DRBM1DeZDx6hbL9KQ2CsQwbI9WD/34TIXAhSaBnrTAJkOnfiMHe/EEbiKQGhQ
         fP1Bkb+2cE//vR8V6qsLxha75/CrNI1WfxeiMJ++k1GHMhR3znmwrT4noKvyIy3ACbsj
         /erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=UOP0RRjuA8FXA/qOLbqTLxoz7Pax4SmBwqH8y7x43ys=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=QM+HOtPN5677DLT0qmt1dH6Qf98PWxpchBJ17Q/36RHOWm7K7MmZSkyu45phKD41vs
         AaFsnNdHPYm7T4cOmC8m2GlYhfFXO809hMpYjbRvjkGuLaCWAXp9eRvFE+w97+ixnSRU
         qMhib42GwvD1M4WdmHXVPB8bSdW/ZYGAIEKiQosCWL5Fd8xEoPI/h7OPOqH3ma1WyxCa
         Q3CyCY/xbLwMLskpk6m/1kAGbLlf3IMF+lYkPZfZDYjWwHOtoHiCQrjrEZ0SMY0q54Tx
         M0ann2EUgBRaJmnORVqYoejQQ3iFpxJWf60YsNXj0m3Uu+FuefjMPWXwNK2icAYk4cAt
         5MZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020ad45c84000000b00690171413dfsi4124639qvh.498.2024.03.25.01.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rog4D-0003AS-GI; Mon, 25 Mar 2024 04:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3k-0002za-TA; Mon, 25 Mar 2024 04:52:03 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3i-0007ON-Gz; Mon, 25 Mar 2024 04:52:00 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V36700Fxnz2Bhcx;
 Mon, 25 Mar 2024 16:49:16 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id BA9831A016F;
 Mon, 25 Mar 2024 16:51:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:53 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 05/23] target/arm: Support MSR access to ALLINT
Date: Mon, 25 Mar 2024 08:48:36 +0000
Message-ID: <20240325084854.3010562-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: uGPOgPAoZEpK

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
index 7d6c6e9878..a65729af66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7497,6 +7497,37 @@ static const ARMCPRegInfo rme_mte_reginfo[] = {
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
@@ -9891,6 +9922,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

