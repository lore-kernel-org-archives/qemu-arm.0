Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4761689ejc;
        Mon, 6 Mar 2023 07:13:15 -0800 (PST)
X-Google-Smtp-Source: AK7set89z5sgL2IAn0lv0PnhrzGqI2gYEpyqyVo3wer2UUvfciEcsITceGPmsaUjGuR0ZYFM51Q1
X-Received: by 2002:a05:6214:268c:b0:56b:f28a:ee2d with SMTP id gm12-20020a056214268c00b0056bf28aee2dmr26616273qvb.5.1678115595794;
        Mon, 06 Mar 2023 07:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678115595; cv=none;
        d=google.com; s=arc-20160816;
        b=JvefZh8I7SiJhHwAorBFen1qrpRKg1srZ7bSVHRk0R0naKzlSzywDaUw+Ui7l8QI1W
         +/K78b5NiWBqQC+9CPc2hxksuS+gntVN4fY8KzsUXD1vxXNpGnyb7w+CNECzK4KwB72k
         tfvhN+tp7j1ZHnFbxkD3LkxZZSgSrIUfhc1aTDIV7fAA8O/iyS5yzpGry+bKZFuJwZEs
         9iizSCkge4FMLiOkrjN+0M/iaNpynbzzHeYa3IkZCcZIb+q4Dv2isYLXIG9fGIrhNyhf
         tzUdNh2bZnOgRl03ox/14ZnJHoxoMELAyI2hjI7vIMVyTuupFIuEQdXBsBZGCW1YCzuW
         lzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=X/6SXs1lrRot7J7jbisXXZ/65/g70Bz3ww1T2vZff94=;
        b=FiPi7y7CY8l7JVXF+FhaafKmy1wZLH5mKGXd2zN3LewdrlO2HK3IDMsOxqVbXZThXZ
         pdY0ccwpA/uIbqHzNtG1dSzwCZIu8RzPkFOenh9vxt1sQStjgx8KGHz0GCKwu4Epg2Rh
         ndUgPseMgylHsD+Gd2U4GwL9q83x2jw8UfdoUZy9/2ZR4HP0KSvrGMrOnLJ2SEc9NhIY
         u2+AzQ6JSNFl3k1UztS3dGvUpiQIkubyM8LpXnhzG11iqGVn/CHDnaOk9quVhmlvY3Ob
         OR0WJWwFjcgy7J0T+o1hlmJByoOWdu+xyhiaFlj1qDlpqowVTTR2ie8WkcJt/bbjzL3z
         M0Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a37030c000000b00718e35db8f5si7187470qkd.88.2023.03.06.07.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:13:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCWK-0005Ub-92; Mon, 06 Mar 2023 10:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pZCWH-0005QJ-7v; Mon, 06 Mar 2023 10:12:57 -0500
Received: from azure-sdnproxy.icoremail.net ([20.232.28.96])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pZCWE-0005Wv-V6; Mon, 06 Mar 2023 10:12:56 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwBHwpbIAgZkNDJrBw--.35611S2;
 Mon, 06 Mar 2023 23:12:08 +0800 (CST)
Received: from localhost (unknown [113.246.80.233])
 by mail (Coremail) with SMTP id AQAAfwCH18DvAgZkMZQAAA--.720S2;
 Mon, 06 Mar 2023 23:12:47 +0800 (CST)
From: Chen Baozi <chenbaozi@phytium.com.cn>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] target/arm: Add Neoverse-N1 registers
Date: Mon,  6 Mar 2023 23:12:43 +0800
Message-Id: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwCH18DvAgZkMZQAAA--.720S2
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQAKEWQE4IkItAAAsv
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxKr43WFWfXFyDXr15uw1UGFg_yoW7XF1xpF
 nrJr1YgF12qFsxJay8A347Ca95Aw1Fgr4jkrZFgryfuFsxXrW5Kryqq34YgF98Ga4kJ34Y
 ka1jq3429w17ZrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=20.232.28.96;
 envelope-from=chenbaozi@phytium.com.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QCKPaysE+x/o

Add implementation defined registers for neoverse-n1 which
would be accessed by TF-A. Since there is no DSU in Qemu,
CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
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
index df0c45e523..03705eb601 100644
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
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
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
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
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

