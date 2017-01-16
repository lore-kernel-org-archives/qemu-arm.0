Received: by 10.25.205.13 with SMTP id d13csp1291746lfg;
        Mon, 16 Jan 2017 01:35:41 -0800 (PST)
X-Received: by 10.55.11.13 with SMTP id 13mr32802986qkl.201.1484559341402;
        Mon, 16 Jan 2017 01:35:41 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id j6si13882633qtd.51.2017.01.16.01.35.41;
        Mon, 16 Jan 2017 01:35:41 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0A18740019;
	Mon, 16 Jan 2017 04:33:50 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nc0xoxxSiDvb; Mon, 16 Jan 2017 04:33:44 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 60520405D5;
	Mon, 16 Jan 2017 04:33:42 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 99837405B9
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:41 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HO3bwvDuTFGg for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:33:38 -0500 (EST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 137984019C
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:37 -0500 (EST)
Received: from 172.24.1.137 (EHLO SZXEML424-HUB.china.huawei.com)
 ([172.24.1.137])
 by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DTK49627; Mon, 16 Jan 2017 17:35:02 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:34:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH RFC 7/7] ARM64: KVM: Add user set handler for id_aa64mmfr0_el1
Date: Mon, 16 Jan 2017 17:33:34 +0800
Message-ID: <1484559214-2248-8-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090205.587C93C6.0039, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d8f162774cb52edab493b3e398066f8f
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
X-TUID: WAdFQXFEZTld

From: Shannon Zhao <shannon.zhao@linaro.org>

Check if the configuration is fine.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 arch/arm64/kvm/sys_regs.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f613e29..9763b79 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1493,6 +1493,35 @@ static bool access_id_reg(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static int set_id_aa64mmfr0_el1(struct kvm_vcpu *vcpu,
+				const struct sys_reg_desc *rd,
+				const struct kvm_one_reg *reg,
+				void __user *uaddr)
+{
+	u64 val, id_aa64mmfr0;
+
+	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)) != 0)
+		return -EFAULT;
+
+	asm volatile("mrs %0, id_aa64mmfr0_el1\n" : "=r" (id_aa64mmfr0));
+
+	if ((val & GENMASK(3, 0)) > (id_aa64mmfr0 & GENMASK(3, 0)) ||
+	    (val & GENMASK(7, 4)) > (id_aa64mmfr0 & GENMASK(7, 4)) ||
+	    (val & GENMASK(11, 8)) > (id_aa64mmfr0 & GENMASK(11, 8)) ||
+	    (val & GENMASK(15, 12)) > (id_aa64mmfr0 & GENMASK(15, 12)) ||
+	    (val & GENMASK(19, 16)) > (id_aa64mmfr0 & GENMASK(19, 16)) ||
+	    (val & GENMASK(23, 20)) > (id_aa64mmfr0 & GENMASK(23, 20)) ||
+	    (val & GENMASK(27, 24)) < (id_aa64mmfr0 & GENMASK(27, 24)) ||
+	    (val & GENMASK(31, 28)) < (id_aa64mmfr0 & GENMASK(31, 28))) {
+		kvm_err("Wrong memory translation granule size/Physical Address range\n");
+		return -EINVAL;
+	}
+
+	vcpu_id_sys_reg(vcpu, rd->reg) = val & GENMASK(31, 0);
+
+	return 0;
+}
+
 static struct sys_reg_desc invariant_sys_regs[] = {
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0000), Op2(0b000),
 	  access_id_reg, get_midr_el1, MIDR_EL1 },
@@ -1549,7 +1578,8 @@ static struct sys_reg_desc invariant_sys_regs[] = {
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0110), Op2(0b001),
 	  access_id_reg, get_id_aa64isar1_el1, ID_AA64ISAR1_EL1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b000),
-	  access_id_reg, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1 },
+	  access_id_reg, get_id_aa64mmfr0_el1, ID_AA64MMFR0_EL1,
+	  0, NULL, set_id_aa64mmfr0_el1 },
 	{ Op0(0b11), Op1(0b000), CRn(0b0000), CRm(0b0111), Op2(0b001),
 	  access_id_reg, get_id_aa64mmfr1_el1, ID_AA64MMFR1_EL1 },
 	{ Op0(0b11), Op1(0b001), CRn(0b0000), CRm(0b0000), Op2(0b001),
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
