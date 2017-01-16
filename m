Received: by 10.25.205.13 with SMTP id d13csp1291753lfg;
        Mon, 16 Jan 2017 01:35:42 -0800 (PST)
X-Received: by 10.237.41.36 with SMTP id s33mr27126665qtd.139.1484559342829;
        Mon, 16 Jan 2017 01:35:42 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id a187si13852868qkd.275.2017.01.16.01.35.42;
        Mon, 16 Jan 2017 01:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6E847401A1;
	Mon, 16 Jan 2017 04:33:51 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlyhWi23xBm1; Mon, 16 Jan 2017 04:33:46 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7CE974066D;
	Mon, 16 Jan 2017 04:33:45 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A138F405CC
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:44 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNHsjOxLJUG8 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:33:40 -0500 (EST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3FC50401A1
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:37 -0500 (EST)
Received: from 172.24.1.36 (EHLO SZXEML424-HUB.china.huawei.com)
 ([172.24.1.36])
 by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DTK49620; Mon, 16 Jan 2017 17:34:58 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:34:49 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH RFC 4/7] ARM64: KVM: emulate accessing ID registers
Date: Mon, 16 Jan 2017 17:33:31 +0800
Message-ID: <1484559214-2248-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090202.587C93C3.007C, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 922af54666ced144299a3733fdda249c
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
X-TUID: +Jfbx2Kkdnx8

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 arch/arm64/kvm/sys_regs.c | 83 ++++++++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 7c5fa03..f613e29 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1480,71 +1480,84 @@ FUNCTION_INVARIANT(id_aa64mmfr1_el1)
 FUNCTION_INVARIANT(clidr_el1)
 FUNCTION_INVARIANT(aidr_el1)
 
+static bool access_id_reg(struct kvm_vcpu *vcpu,
+			  struct sys_reg_params *p,
+			  const struct sys_reg_desc *r)
+{
+	if (p->is_write) {
+		vcpu_id_sys_reg(vcpu, r->reg) = p->regval;
+	} else {
+		p->regval = vcpu_id_sys_reg(vcpu, r->reg);
+	}
+
+	return true;
+}
+
 static struct sys_reg_desc invariant_sys_regs[] = {
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b000),
-	  NULL, get_midr_el1, MIDR_EL1 },
+	  access_id_reg, get_midr_el1, MIDR_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b110),
-	  NULL, get_revidr_el1, REVIDR_EL1 },
+	  access_id_reg, get_revidr_el1, REVIDR_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b000),
-	  NULL, get_id_pfr0_el1, ID_PFR0_EL1 },
+	  access_id_reg, get_id_pfr0_el1, ID_PFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b001),
-	  NULL, get_id_pfr1_el1, ID_PFR1_EL1 },
+	  access_id_reg, get_id_pfr1_el1, ID_PFR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b010),
-	  NULL, get_id_dfr0_el1, ID_DFR0_EL1 },
+	  access_id_reg, get_id_dfr0_el1, ID_DFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b011),
-	  NULL, get_id_afr0_el1, ID_AFR0_EL1 },
+	  access_id_reg, get_id_afr0_el1, ID_AFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b100),
-	  NULL, get_id_mmfr0_el1, ID_MMFR0_EL1 },
+	  access_id_reg, get_id_mmfr0_el1, ID_MMFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b101),
-	  NULL, get_id_mmfr1_el1, ID_MMFR1_EL1 },
+	  access_id_reg, get_id_mmfr1_el1, ID_MMFR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b110),
-	  NULL, get_id_mmfr2_el1, ID_MMFR2_EL1 },
+	  access_id_reg, get_id_mmfr2_el1, ID_MMFR2_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0001), Op2(0b111),
-	  NULL, get_id_mmfr3_el1, ID_MMFR3_EL1 },
+	  access_id_reg, get_id_mmfr3_el1, ID_MMFR3_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b000),
-	  NULL, get_id_isar0_el1, ID_ISAR0_EL1 },
+	  access_id_reg, get_id_isar0_el1, ID_ISAR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b001),
-	  NULL, get_id_isar1_el1, ID_ISAR1_EL1 },
+	  access_id_reg, get_id_isar1_el1, ID_ISAR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b010),
-	  NULL, get_id_isar2_el1, ID_ISAR2_EL1 },
+	  access_id_reg, get_id_isar2_el1, ID_ISAR2_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b011),
-	  NULL, get_id_isar3_el1, ID_ISAR3_EL1 },
+	  access_id_reg, get_id_isar3_el1, ID_ISAR3_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b100),
-	  NULL, get_id_isar4_el1, ID_ISAR4_EL1 },
+	  access_id_reg, get_id_isar4_el1, ID_ISAR4_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0010), Op2(0b101),
-	  NULL, get_id_isar5_el1, ID_ISAR5_EL1 },
+	  access_id_reg, get_id_isar5_el1, ID_ISAR5_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b000),
-	  NULL, get_mvfr0_el1, MVFR0_EL1 },
+	  access_id_reg, get_mvfr0_el1, MVFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b001),
-	  NULL, get_mvfr1_el1, MVFR1_EL1 },
+	  access_id_reg, get_mvfr1_el1, MVFR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0011), Op2(0b010),
-	  NULL, get_mvfr2_el1, MVFR2_EL1 },
+	  access_id_reg, get_mvfr2_el1, MVFR2_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0100), Op2(0b000),
-	  NULL, get_id_aa64pfr0_el1, ID_AA64PFR0_EL1 },
+	  access_id_reg, get_id_aa64pfr0_el1, ID_AA64PFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0100), Op2(0b001),
-	  NULL, get_id_aa64pfr1_el1, ID_AA64PFR1_EL1 },
+	  access_id_reg, get_id_aa64pfr1_el1, ID_AA64PFR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b000),
-	  NULL, get_id_aa64dfr0_el1, ID_AA64DFR0_EL1 },
+	  access_id_reg, get_id_aa64dfr0_el1, ID_AA64DFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b001),
-	  NULL, get_id_aa64dfr1_el1, ID_AA64DFR1_EL1 },
+	  access_id_reg, get_id_aa64dfr1_el1, ID_AA64DFR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b100),
-	  NULL, get_id_aa64afr0_el1, ID_AA64AFR0_EL1 },
+	  access_id_reg, get_id_aa64afr0_el1, ID_AA64AFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0101), Op2(0b101),
-	  NULL, get_id_aa64afr1_el1, ID_AA64AFR1_EL1 },
+	  access_id_reg, get_id_aa64afr1_el1, ID_AA64AFR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b000),
-	  NULL, get_id_aa64isar0_el1, ID_AA64ISAR0_EL1 },
+	  access_id_reg, get_id_aa64isar0_el1, ID_AA64ISAR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b001),
-	  NULL, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
+	  access_id_reg, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b000),
-	  NULL, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
+	  access_id_reg, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b001),
-	  NULL, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
+	  access_id_reg, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
 	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b001),
-	  NULL, get_clidr_el1, CLIDR_EL1 },
+	  access_id_reg, get_clidr_el1, CLIDR_EL1 },
 	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b111),
-	  NULL, get_aidr_el1, AIDR_EL1 },
+	  access_id_reg, get_aidr_el1, AIDR_EL1 },
 	{ Op0(0b11), Op1(0b011), CRn(0b0000), CRm(0b0000), Op2(0b001),
-	  NULL, get_ctr_el0, CTR_EL0 },
+	  access_id_reg, get_ctr_el0, CTR_EL0 },
 };
 
 /* Target specific emulation tables */
@@ -1809,8 +1822,12 @@ static int emulate_sys_reg(struct kvm_vcpu *vcpu,
 
 	/* Search target-specific then generic table. */
 	r = find_reg(params, table, num);
-	if (!r)
+	if (!r) {
 		r = find_reg(params, sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
+		if (!r)
+			r = find_reg(params, invariant_sys_regs,
+				     ARRAY_SIZE(invariant_sys_regs));
+	}
 
 	if (likely(r)) {
 		/*
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
