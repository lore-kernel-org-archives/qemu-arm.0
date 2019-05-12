Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1640956wrg;
        Sun, 12 May 2019 01:36:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7yxC5yP9xFCZ1xg2q/YRkuVC1IZ03Ho7j+LC/lQ8sqn8X6fty7qAMniCMOKqd2OH+9nmJ
X-Received: by 2002:a0c:8ae9:: with SMTP id 38mr17487998qvw.157.1557650208163;
        Sun, 12 May 2019 01:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650208; cv=none;
        d=google.com; s=arc-20160816;
        b=GynvnN2MT01KWSvKrA+OjRHnvMciEVWcTQoOwMHq/WajjxJVOojuW5gCfNsgyZLQUR
         XjDhEVC7xz2qN47BJumrUW2DjmpsSNgxG+e+9KDBGwH9kqf1LokQg0hUz5PDw01V525q
         lBaf9uJL89kv0J1QVo0ShsOmlqBY4ffz8FnnNUgJV3ffmyJE7yxuk3l20pyivyDm1J1A
         6Ny1zsad2lnoy5cN301isOQdDEtyiLOgEuWAeeDkFP62XMtueyJzM7zut11btosz4z0D
         rs4bVHudP70qDu1EptP2ryyBOa3eF5tmub70p+Mb7/d30NUOGGZEJIP3YBgaa6ye6jLu
         dy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4CGvaGBXPX36DVrue9uTkOEF0mW4r3liwV26rxlMNNU=;
        b=EKb8XUwjou1iCX4+KMPRjXvITxIvNhI0J3rveCcZU1+0MUzZvKZW5FVtdiFzae0/dq
         jRYEWsOB312T2NZFY+QkLH3T5/AvDZy0E7GJfxmbEjhvZOg+ydzxR9WCeuscDFX0reXp
         spRDH8aJ4/SA0IsiNuJrG9dKwroQmAnC5kPhopgdoHY25e75Q64yjqSk2pV/IMYcwnUT
         m3VrDAGN/Y+Bh9nWrV00eQvJzGI6akS5tqB2B7gixsh4ad0p3VR0DbPoo6UQ/Sw98mkP
         U/YCISvrfmROYlrieGpel+SG5EH/nU/hfCrJ+3iBiPXyfq0A+yaN3UT8Vtq4XrcuuvlU
         MvCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m63si1185384qkb.95.2019.05.12.01.36.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23A4C3086201;
	Sun, 12 May 2019 08:36:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0D535D706;
	Sun, 12 May 2019 08:36:43 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 03/13] HACK: linux header update
Date: Sun, 12 May 2019 10:36:14 +0200
Message-Id: <20190512083624.8916-4-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 12 May 2019 08:36:47 +0000 (UTC)
X-TUID: l0VSGku6jzWc

---
 linux-headers/asm-arm64/kvm.h         | 41 +++++++++++++++++++++
 linux-headers/asm-arm64/sve_context.h | 53 +++++++++++++++++++++++++++
 linux-headers/linux/kvm.h             |  5 +++
 3 files changed, 99 insertions(+)
 create mode 100644 linux-headers/asm-arm64/sve_context.h

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index e6a98c14c848..3e73a4c67b67 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -35,6 +35,7 @@
 #include <linux/psci.h>
 #include <linux/types.h>
 #include <asm/ptrace.h>
+#include <asm/sve_context.h>
 
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
@@ -102,6 +103,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
 #define KVM_ARM_VCPU_PSCI_0_2		2 /* CPU uses PSCI v0.2 */
 #define KVM_ARM_VCPU_PMU_V3		3 /* Support guest PMUv3 */
+#define KVM_ARM_VCPU_SVE		4 /* enable SVE for this CPU */
 
 struct kvm_vcpu_init {
 	__u32 target;
@@ -226,6 +228,45 @@ struct kvm_vcpu_events {
 					 KVM_REG_ARM_FW | ((r) & 0xffff))
 #define KVM_REG_ARM_PSCI_VERSION	KVM_REG_ARM_FW_REG(0)
 
+/* SVE registers */
+#define KVM_REG_ARM64_SVE		(0x15 << KVM_REG_ARM_COPROC_SHIFT)
+
+/* Z- and P-regs occupy blocks at the following offsets within this range: */
+#define KVM_REG_ARM64_SVE_ZREG_BASE	0
+#define KVM_REG_ARM64_SVE_PREG_BASE	0x400
+#define KVM_REG_ARM64_SVE_FFR_BASE	0x600
+
+#define KVM_ARM64_SVE_NUM_ZREGS		__SVE_NUM_ZREGS
+#define KVM_ARM64_SVE_NUM_PREGS		__SVE_NUM_PREGS
+
+#define KVM_ARM64_SVE_MAX_SLICES	32
+
+#define KVM_REG_ARM64_SVE_ZREG(n, i)					\
+	(KVM_REG_ARM64 | KVM_REG_ARM64_SVE | KVM_REG_ARM64_SVE_ZREG_BASE | \
+	 KVM_REG_SIZE_U2048 |						\
+	 (((n) & (KVM_ARM64_SVE_NUM_ZREGS - 1)) << 5) |			\
+	 ((i) & (KVM_ARM64_SVE_MAX_SLICES - 1)))
+
+#define KVM_REG_ARM64_SVE_PREG(n, i)					\
+	(KVM_REG_ARM64 | KVM_REG_ARM64_SVE | KVM_REG_ARM64_SVE_PREG_BASE | \
+	 KVM_REG_SIZE_U256 |						\
+	 (((n) & (KVM_ARM64_SVE_NUM_PREGS - 1)) << 5) |			\
+	 ((i) & (KVM_ARM64_SVE_MAX_SLICES - 1)))
+
+#define KVM_REG_ARM64_SVE_FFR(i)					\
+	(KVM_REG_ARM64 | KVM_REG_ARM64_SVE | KVM_REG_ARM64_SVE_FFR_BASE | \
+	 KVM_REG_SIZE_U256 |						\
+	 ((i) & (KVM_ARM64_SVE_MAX_SLICES - 1)))
+
+#define KVM_ARM64_SVE_VQ_MIN __SVE_VQ_MIN
+#define KVM_ARM64_SVE_VQ_MAX __SVE_VQ_MAX
+
+/* Vector lengths pseudo-register: */
+#define KVM_REG_ARM64_SVE_VLS		(KVM_REG_ARM64 | KVM_REG_ARM64_SVE | \
+					 KVM_REG_SIZE_U512 | 0xffff)
+#define KVM_ARM64_SVE_VLS_WORDS	\
+	((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)
+
 /* Device Control API: ARM VGIC */
 #define KVM_DEV_ARM_VGIC_GRP_ADDR	0
 #define KVM_DEV_ARM_VGIC_GRP_DIST_REGS	1
diff --git a/linux-headers/asm-arm64/sve_context.h b/linux-headers/asm-arm64/sve_context.h
new file mode 100644
index 000000000000..1d0e3e1d0950
--- /dev/null
+++ b/linux-headers/asm-arm64/sve_context.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright (C) 2017-2018 ARM Limited */
+
+/*
+ * For use by other UAPI headers only.
+ * Do not make direct use of header or its definitions.
+ */
+
+#ifndef __ASM_SVE_CONTEXT_H
+#define __ASM_SVE_CONTEXT_H
+
+#include <linux/types.h>
+
+#define __SVE_VQ_BYTES		16	/* number of bytes per quadword */
+
+#define __SVE_VQ_MIN		1
+#define __SVE_VQ_MAX		512
+
+#define __SVE_VL_MIN		(__SVE_VQ_MIN * __SVE_VQ_BYTES)
+#define __SVE_VL_MAX		(__SVE_VQ_MAX * __SVE_VQ_BYTES)
+
+#define __SVE_NUM_ZREGS		32
+#define __SVE_NUM_PREGS		16
+
+#define __sve_vl_valid(vl)			\
+	((vl) % __SVE_VQ_BYTES == 0 &&		\
+	 (vl) >= __SVE_VL_MIN &&		\
+	 (vl) <= __SVE_VL_MAX)
+
+#define __sve_vq_from_vl(vl)	((vl) / __SVE_VQ_BYTES)
+#define __sve_vl_from_vq(vq)	((vq) * __SVE_VQ_BYTES)
+
+#define __SVE_ZREG_SIZE(vq)	((__u32)(vq) * __SVE_VQ_BYTES)
+#define __SVE_PREG_SIZE(vq)	((__u32)(vq) * (__SVE_VQ_BYTES / 8))
+#define __SVE_FFR_SIZE(vq)	__SVE_PREG_SIZE(vq)
+
+#define __SVE_ZREGS_OFFSET	0
+#define __SVE_ZREG_OFFSET(vq, n) \
+	(__SVE_ZREGS_OFFSET + __SVE_ZREG_SIZE(vq) * (n))
+#define __SVE_ZREGS_SIZE(vq) \
+	(__SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET)
+
+#define __SVE_PREGS_OFFSET(vq) \
+	(__SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq))
+#define __SVE_PREG_OFFSET(vq, n) \
+	(__SVE_PREGS_OFFSET(vq) + __SVE_PREG_SIZE(vq) * (n))
+#define __SVE_PREGS_SIZE(vq) \
+	(__SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq))
+
+#define __SVE_FFR_OFFSET(vq) \
+	(__SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq))
+
+#endif /* ! _UAPI__ASM_SVE_CONTEXT_H */
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index b53ee5974802..1a639ae0ceed 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -988,6 +988,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_VM_IPA_SIZE 165
 #define KVM_CAP_MANUAL_DIRTY_LOG_PROTECT 166
 #define KVM_CAP_HYPERV_CPUID 167
+#define KVM_CAP_ARM_SVE 168
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1145,6 +1146,7 @@ struct kvm_dirty_tlb {
 #define KVM_REG_SIZE_U256	0x0050000000000000ULL
 #define KVM_REG_SIZE_U512	0x0060000000000000ULL
 #define KVM_REG_SIZE_U1024	0x0070000000000000ULL
+#define KVM_REG_SIZE_U2048	0x0080000000000000ULL
 
 struct kvm_reg_list {
 	__u64 n; /* number of regs */
@@ -1440,6 +1442,9 @@ struct kvm_enc_region {
 /* Available with KVM_CAP_HYPERV_CPUID */
 #define KVM_GET_SUPPORTED_HV_CPUID _IOWR(KVMIO, 0xc1, struct kvm_cpuid2)
 
+/* Available with KVM_CAP_ARM_SVE */
+#define KVM_ARM_VCPU_FINALIZE	  _IOW(KVMIO,  0xc2, int)
+
 /* Secure Encrypted Virtualization command */
 enum sev_cmd_id {
 	/* Guest initialization commands */
-- 
2.20.1
