Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2039015ejc;
        Sun, 12 Mar 2023 20:40:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set+iS+xvXj3OJsyLfsG5YGDO6lvS/KWxscPP5dMrzNZijXNPOqXLx4Mug1msFWojT8uzFtVN
X-Received: by 2002:a05:6214:622:b0:56f:87f:d92c with SMTP id a2-20020a056214062200b0056f087fd92cmr12020769qvx.0.1678678852809;
        Sun, 12 Mar 2023 20:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678678852; cv=none;
        d=google.com; s=arc-20160816;
        b=Gi4qoN2xKhKNSGvV7/4tmcg6Wp5DpQ+Ru/a5097ZMCyBNXD60ce8zun8P+8MlcPrbF
         /1LTLVDdDTBUQADn4St908XlV/fQF7OVqJK/I/rMwA1ii0EJjiPlZ/7Hbgrb6Ite88e9
         pwrjbXnLkgoTxm9HcNnbQ2AGewz7F1wYQ6MBunze8RDSeTa7AONWm96g4qck1C1iQqgI
         q669HM/qC3a8EaydhsEm29w7oc/OjgIKqBTDDobztVHvS4zPp02oV7vUFyADH4ZMLrcD
         q+pgjZyfAnHuqxvqKuPSjaLOiXwGkrAO9uXtYGmTQpl7q0hfU9gQPhnzgD52OWXUVYUS
         gODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=4VJqjHpEacPhp9NFzvBHjnnflhxit0XRGq7DRMimM0Q=;
        b=oKYRD4mCjItgL+B4wzTQdGIv+UvGozaWwSesrLLhTJcu7HXGQB/39RSpHv1qZhXPHL
         pmVcbyWvAX5LYVvGYcEnXHT+AerN9zJHVxD4778Sx/IFSKs4tBq2Sdl2hQpd+zseAR1p
         gotElveAWrZCewX8rWgpJBaY4i4ewBRAFUkiNIECjqkGBD14A3Ll47wvZCJPJdkAFurI
         +OHr0N/6ay3TQAK9p7i1HXBZ6n1FcAzJRm1oTUFR4l8gzXGzn2MUpklp4ykmADgTyc+Q
         0cqnuQ71qebSzsvr2xmXEytnwyTGlsYH/kLNjjimPu63Nk+JK8gfGIFl/4DSq6Hbdw6t
         bK9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020a0cab4c000000b0056eadcd1558si4052014qvb.174.2023.03.12.20.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Mar 2023 20:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbZ2n-0004k2-Nk; Sun, 12 Mar 2023 23:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pbZ2j-0004jV-JY; Sun, 12 Mar 2023 23:40:13 -0400
Received: from azure-sdnproxy.icoremail.net ([20.228.234.168])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pbZ2f-0002Qa-Be; Sun, 12 Mar 2023 23:40:13 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwCHTZLRmg5kIDsTCg--.11017S2;
 Mon, 13 Mar 2023 11:38:57 +0800 (CST)
Received: from localhost (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDHCLf+mg5kEK4CAA--.938S2;
 Mon, 13 Mar 2023 11:39:42 +0800 (CST)
From: Chen Baozi <chenbaozi@phytium.com.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v4] target/arm: Add Neoverse-N1 registers
Date: Mon, 13 Mar 2023 11:39:36 +0800
Message-Id: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwDHCLf+mg5kEK4CAA--.938S2
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQAREWQOJWUC5gACsN
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxWF17uF4UKw43JrykCw4Durg_yoWrur4kpF
 nrAr15WFyjqFsxJF4xC343Ca95A3WFgr4jkrZFgryI9F13XrW5KFyqq34YgF98GaykJ34F
 ka1jqryfuw17ZrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=20.228.234.168;
 envelope-from=chenbaozi@phytium.com.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C8S/QC90yrWh

Add implementation defined registers for neoverse-n1 which
would be accessed by TF-A. Since there is no DSU in Qemu,
CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
---
 target/arm/cpu64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..0fb07cc7b6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "cpregs.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
@@ -1027,6 +1028,72 @@ static void aarch64_a64fx_initfn(Object *obj)
     /* TODO:  Add A64FX specific HPC extension registers */
 }
 
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
+    /*
+     * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
+     * (and in particular its system registers).
+     */
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
+static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
+}
+
 static void aarch64_neoverse_n1_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1094,6 +1161,8 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
     /* From D5.1 AArch64 PMU register summary */
     cpu->isar.reset_pmcr_el0 = 0x410c3000;
+
+    define_neoverse_n1_cp_reginfo(cpu);
 }
 
 static void aarch64_host_initfn(Object *obj)
-- 
2.37.3

