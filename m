Received: by 10.80.163.71 with SMTP id 65csp881691edn;
        Mon, 12 Sep 2016 09:46:12 -0700 (PDT)
X-Received: by 10.237.54.164 with SMTP id f33mr21229829qtb.139.1473698772719;
        Mon, 12 Sep 2016 09:46:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a5si4467259qtb.29.2016.09.12.09.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Sep 2016 09:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bjUN2-0001aU-1P
	for alex.bennee@linaro.org; Mon, 12 Sep 2016 12:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bjULj-0000dw-12
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 12:44:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bjULd-00026b-SH
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 12:44:50 -0400
Received: from mail-pa0-f67.google.com ([209.85.220.67]:34314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bjULd-0001xl-MJ; Mon, 12 Sep 2016 12:44:45 -0400
Received: by mail-pa0-f67.google.com with SMTP id ph5so1892167pab.1;
	Mon, 12 Sep 2016 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6WayaGcTLp6KmR2Id0ZF7ZITH6k/jpgOQUWycIKFVkg=;
	b=eQ/DiBCa3QVfly14uckZ8ZlyqiOleJjjsLw/NxViXCAOvfzKlVxGtYufd8uI5z/wjP
	lv0OZEAPDJDoGYV1RGkUrcSKV019ICouQ2RCMIp8vU/xt+So00xIM5B16lo+2BtiZo/8
	DRinvlQIzTOZg2fUsMPyrwGz2+0jf0Jk9ROQ4NNGhMNj6JTOetVhSOJrNzQ+yajttIrj
	gSsWKX+3ZfUrRAlUDey5hApao2mMb1fuXXLE6BH6Q9kRJIIdMsMk1uo9LrLG1Ve91Ttl
	EAVI7R9l1kXelLqI/AVXAvet3xdfWgE+dvpYaiK/HKOn6JfbkFo2lp4a+r54dOC8phWu
	VoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6WayaGcTLp6KmR2Id0ZF7ZITH6k/jpgOQUWycIKFVkg=;
	b=EICv6KfIvh5jpzP3K1dg0HIkTZ2GT/EakmpXEX9v34o0bSwof9TC6mj8T0tNBCOKbk
	2Qlrhz+Zl80CKSmWIayvnAVMCyxdNhO/MCktBk0Lt5MSVNbtz+Xa5CUTWQWdXXffO7yl
	WcLZdAzVGFgcqwaIK8UnKvbED7cF6iyRxuLfwtyp6kMGlTSiZwpJAlD5tS9l4xR1jajn
	O76N2RKZBLy6M5brryt4x2CbDSTJsu4FyHhg3FBXK/BmNYxwdh9WXSMa198O/NreRRh5
	hUnU3BZWqOvVDjGi+kzHewiyI10LIXqJ9JuWFsH3c70kA+C2KXsaRvwyIjtP84e4AFqN
	VGUg==
X-Gm-Message-State: AE9vXwOpL1xMqTFiamccXlGm3XpYL+1Ko9zVgnhZEHxibxM2x4K17hnzz426vb9Pb0iN9Q==
X-Received: by 10.66.0.99 with SMTP id 3mr13759923pad.109.1473698603687;
	Mon, 12 Sep 2016 09:43:23 -0700 (PDT)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	s12sm25734728pfj.73.2016.09.12.09.43.20
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 09:43:23 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net, marc.zyngier@arm.com
Date: Mon, 12 Sep 2016 22:12:56 +0530
Message-Id: <1473698577-18365-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1473698577-18365-1-git-send-email-vijay.kilari@gmail.com>
References: <1473698577-18365-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.67
Subject: [Qemu-arm] [RFC PATCH v4 1/2] kernel: Add definitions for GICv3
 attributes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: p.fedin@samsung.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTSTJV64uDFj

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Vijaya Kumamr K <Vijaya.Kumar@cavium.com>
---
 linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..3dc0860 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -199,10 +199,23 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
+                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
+                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
+#define VGIC_LEVEL_INFO_LINE_LEVEL	0
+
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
 
 /* Device Control API on vcpu fd */
-- 
1.9.1

