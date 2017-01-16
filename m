Received: by 10.25.205.13 with SMTP id d13csp1289658lfg;
        Mon, 16 Jan 2017 01:29:14 -0800 (PST)
X-Received: by 10.55.139.5 with SMTP id n5mr7711866qkd.225.1484558954022;
        Mon, 16 Jan 2017 01:29:14 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id p3si13823084qkf.314.2017.01.16.01.29.13;
        Mon, 16 Jan 2017 01:29:14 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A0D6C405E9;
	Mon, 16 Jan 2017 04:27:22 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKUhWcWv3DBM; Mon, 16 Jan 2017 04:27:17 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4AFB240698;
	Mon, 16 Jan 2017 04:27:10 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 306CB40670
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:27:09 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkC1qJr-zUuF for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:27:05 -0500 (EST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id C864940537
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:27:00 -0500 (EST)
Received: from 172.24.1.136 (EHLO szxeml426-hub.china.huawei.com)
 ([172.24.1.136])
 by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DXW50581; Mon, 16 Jan 2017 17:28:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:28:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH RFC 6/6] target-arm: cpu64: Add support for Cortex-A72
Date: Mon, 16 Jan 2017 17:27:01 +0800
Message-ID: <1484558821-15512-7-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020202.587C9236.0149, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 828304195dcbdbde2d71cf49cf75590a
Cc: qemu-devel@nongnu.org, wu.wubin@huawei.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 8LlWGj44404I

From: Shannon Zhao <shannon.zhao@linaro.org>

Add the ARM Cortex-A72 processor definition. It's similar to A57.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c      |  1 +
 target/arm/cpu64.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 49b7b65..2ba93e3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -166,6 +166,7 @@ static const char *valid_cpus[] = {
     "cortex-a15",
     "cortex-a53",
     "cortex-a57",
+    "cortex-a72",
     "generic",
     "host",
     NULL
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 223f31e..4f00ceb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -204,6 +204,61 @@ static void aarch64_a53_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
 }
 
+static void aarch64_a72_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a72";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_VFP4);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
+    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
+    set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_GENERIC_V8;
+    cpu->midr = 0x410fd081;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034080;
+    cpu->mvfr0 = 0x10110222;
+    cpu->mvfr1 = 0x12111111;
+    cpu->mvfr2 = 0x00000043;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50838;
+    cpu->id_pfr0 = 0x00000131;
+    cpu->id_pfr1 = 0x00011011;
+    cpu->id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0x00000000;
+    cpu->id_mmfr0 = 0x10201105;
+    cpu->id_mmfr1 = 0x40000000;
+    cpu->id_mmfr2 = 0x01260000;
+    cpu->id_mmfr3 = 0x02102211;
+    cpu->id_isar0 = 0x02101110;
+    cpu->id_isar1 = 0x13112111;
+    cpu->id_isar2 = 0x21232042;
+    cpu->id_isar3 = 0x01112131;
+    cpu->id_isar4 = 0x00011142;
+    cpu->id_isar5 = 0x00011121;
+    cpu->id_aa64pfr0 = 0x00002222;
+    cpu->id_aa64dfr0 = 0x10305106;
+    cpu->pmceid0 = 0x00000000;
+    cpu->pmceid1 = 0x00000000;
+    cpu->id_aa64isar0 = 0x00011120;
+    cpu->id_aa64mmfr0 = 0x00001124;
+    cpu->dbgdidr = 0x3516d000;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    cpu->ccsidr[2] = 0x71ffe07a; /* 4096KB L2 cache */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
+}
+
 static void aarch64_generic_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -285,6 +340,7 @@ typedef struct ARMCPUInfo {
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "generic",            .initfn = aarch64_generic_initfn },
 #ifdef CONFIG_USER_ONLY
     { .name = "any",         .initfn = aarch64_any_initfn },
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
