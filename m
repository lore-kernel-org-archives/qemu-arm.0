Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1317684ejc;
        Fri, 3 Mar 2023 09:09:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9st9w+xM8mIITiOeeCaaDN3zreuXVeV6HxDELp3l797/O3Qnm7Yqmf716sVfrEDino8ZLC
X-Received: by 2002:a05:6102:511f:b0:417:dc9:9374 with SMTP id bm31-20020a056102511f00b004170dc99374mr1600951vsb.32.1677863357378;
        Fri, 03 Mar 2023 09:09:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677863357; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+u8wmWUqG+vXU/9bkHP0uQcsQqST3mv9AsQSJSAxEH0SVPbSK3p0ZFsBr5e0EJxzq
         vXsBziNZRp80AW86ZDOXkHMW4Te+ED0DfciGvzrW1A4wIZ8yv3O+GeMFRqA56zY4PLeO
         2PxvovVM6LiFmT50jRexisfVwe4qt8OOpOuSNBGzL3pNNX9GEOGGk1WomSk+H40m31TG
         m2S5qeW42l9Q3nEQslbdSiQrty7aKFYEYMUlmZxLZHtwqySXW86NELsguL7BEnDEDujh
         Kc9CYO2V2g9tQSbIQBwWsZj2emnXJ9Hyr7t1h+q9+K6dav8m2LRbnviY7YaP1C1nmd+3
         eGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=gVt94Sz/l+eioNpAX5KSYHMzQCk8bo+0NBVhaDD8bjk=;
        b=uyLTKxSLRIFTkMxZaICnvxZIG2VOMHqDNVTHy31w6gBESujmlrJOO3iIXgvZTvM+Lb
         494INocF4g91H2UfAjyDc4jmAwau4rZY9VTL/7Dfu+JgIKXn5hpVJeb3TssK7bhAyAqv
         HQLYSd9e06AjM/E1BtIFqoIZAraLO9vi43Mubil3QFyDE7q/gRjqj3pWC38mqzU99G3C
         c6enGC9+gmEvE98Bvg1lZ+mDxM/h/O1nAIqLNq61KmVDa3bhcfnj6xFztz0sJ6PVAlw8
         k7bGAnMr8l1GDr6s3WVbYbHyERmsdY4lXfVGCtYdqOUQFkVs/Tr4x3rJWJxFOXDWrWP2
         WNGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a67f305000000b003b1331294ecsi704405vsf.474.2023.03.03.09.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:09:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY8tm-00062x-Jf; Fri, 03 Mar 2023 12:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pY85A-0007se-Ms; Fri, 03 Mar 2023 11:16:32 -0500
Received: from azure-sdnproxy.icoremail.net ([20.231.56.155])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pY856-0008Tg-5l; Fri, 03 Mar 2023 11:16:32 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwAXlaasHQJkocIdAQ--.45954S2;
 Sat, 04 Mar 2023 00:17:48 +0800 (CST)
Received: from localhost (unknown [113.247.214.165])
 by mail (Coremail) with SMTP id AQAAfwCHYPArHQJkrYAAAA--.526S2;
 Sat, 04 Mar 2023 00:15:44 +0800 (CST)
From: Chen Baozi <chenbaozi@phytium.com.cn>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH 1/2] target/arm: Add Neoverse-N1 registers
Date: Sat,  4 Mar 2023 00:15:17 +0800
Message-Id: <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
References: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwCHYPArHQJkrYAAAA--.526S2
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQAHEWQA7A0IoQAKsx
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxWF17uF4UKw47Gry8WF1kGrg_yoW7Gr1kpF
 1DJr15WF12qFsxXay8A34UCa95A3WFgr4jkrZFgryfuanxXrW5Kryqq34YgF98Ga4kJ34Y
 9a1jq34Y9w17ZrUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=20.231.56.155;
 envelope-from=chenbaozi@phytium.com.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Mar 2023 12:08:44 -0500
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
X-TUID: xjBbNC1dpmt/

Add implementation defined registers for neoverse-n1 which
would be accessed by TF-A.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
---
 target/arm/cpu64.c     |  2 ++
 target/arm/cpu_tcg.c   | 62 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |  2 ++
 3 files changed, 66 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..a6ae7cafac 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1094,6 +1094,8 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
     /* From D5.1 AArch64 PMU register summary */
     cpu->isar.reset_pmcr_el0 = 0x410c3000;
+
+    define_neoverse_n1_cp_reginfo(cpu);
 }
 
 static void aarch64_host_initfn(Object *obj)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index df0c45e523..6a1bb56b25 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -150,6 +150,68 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
 {
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
+
+static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
+    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL12", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 5, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
+    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+};
+
+void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
+}
 #endif /* !CONFIG_USER_ONLY */
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3c7341e774..0c393e971a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1356,8 +1356,10 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
+static inline void define_neoverse_n1_cp_reginfo(ARMCPU *cpu) {}
 #else
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
+void define_neoverse_n1_cp_reginfo(ARMCPU *cpu);
 #endif
 
 bool el_is_in_host(CPUARMState *env, int el);
-- 
2.37.3

