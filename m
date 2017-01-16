Received: by 10.25.205.13 with SMTP id d13csp1291816lfg;
        Mon, 16 Jan 2017 01:35:52 -0800 (PST)
X-Received: by 10.237.36.85 with SMTP id s21mr30323531qtc.80.1484559352637;
        Mon, 16 Jan 2017 01:35:52 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id t188si13871878qkb.122.2017.01.16.01.35.52;
        Mon, 16 Jan 2017 01:35:52 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 45211406A7;
	Mon, 16 Jan 2017 04:34:01 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OlzyiZ-DHCy; Mon, 16 Jan 2017 04:33:58 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D701A40697;
	Mon, 16 Jan 2017 04:33:48 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 2DA854027C
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:47 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdeAMIrJprjQ for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:33:41 -0500 (EST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id DD9B2402EC
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:40 -0500 (EST)
Received: from 172.24.1.36 (EHLO SZXEML424-HUB.china.huawei.com)
 ([172.24.1.36])
 by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DTK49612; Mon, 16 Jan 2017 17:34:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:34:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH RFC 1/7] ARM64: KVM: Add the definition of ID registers
Date: Mon, 16 Jan 2017 17:33:28 +0800
Message-ID: <1484559214-2248-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090201.587C93C3.006C, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8b40d135be5df224043ce0a10ecb85c0
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com
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
X-TUID: WSEudYbVmtZA

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a new memeber in kvm_cpu_context to save the ID registers value.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e505038..6034f92 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -187,12 +187,57 @@ enum vcpu_sysreg {
 
 #define NR_COPRO_REGS	(NR_SYS_REGS * 2)
 
+enum id_vcpu_sysreg {
+	MIDR_EL1,
+	/* ID group 1 registers */
+	REVIDR_EL1,
+	AIDR_EL1,
+
+	/* ID group 2 registers */
+	CTR_EL0,
+	CCSIDR_EL1,
+	CLIDR_EL1,
+
+	/* ID group 3 registers */
+	ID_PFR0_EL1,
+	ID_PFR1_EL1,
+	ID_DFR0_EL1,
+	ID_AFR0_EL1,
+	ID_MMFR0_EL1,
+	ID_MMFR1_EL1,
+	ID_MMFR2_EL1,
+	ID_MMFR3_EL1,
+	ID_ISAR0_EL1,
+	ID_ISAR1_EL1,
+	ID_ISAR2_EL1,
+	ID_ISAR3_EL1,
+	ID_ISAR4_EL1,
+	ID_ISAR5_EL1,
+	MVFR0_EL1,
+	MVFR1_EL1,
+	MVFR2_EL1,
+	ID_AA64PFR0_EL1,
+	ID_AA64PFR1_EL1,
+	ID_AA64DFR0_EL1,
+	ID_AA64DFR1_EL1,
+	ID_AA64ISAR0_EL1,
+	ID_AA64ISAR1_EL1,
+	ID_AA64MMFR0_EL1,
+	ID_AA64MMFR1_EL1,
+	ID_AA64AFR0_EL1,
+	ID_AA64AFR1_EL1,
+	ID_MMFR4_EL1,
+
+	NR_ID_SYS_REGS
+};
+
 struct kvm_cpu_context {
 	struct kvm_regs	gp_regs;
 	union {
 		u64 sys_regs[NR_SYS_REGS];
 		u32 copro[NR_COPRO_REGS];
 	};
+	u64 id_sys_regs[NR_ID_SYS_REGS];
 };
 
 typedef struct kvm_cpu_context kvm_cpu_context_t;
@@ -277,6 +322,7 @@ struct kvm_vcpu_arch {
 
 #define vcpu_gp_regs(v)		(&(v)->arch.ctxt.gp_regs)
 #define vcpu_sys_reg(v,r)	((v)->arch.ctxt.sys_regs[(r)])
+#define vcpu_id_sys_reg(v,r)	((v)->arch.ctxt.id_sys_regs[(r)])
 /*
  * CP14 and CP15 live in the same array, as they are backed by the
  * same system registers.
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
