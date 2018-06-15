Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp978001wrq;
        Fri, 15 Jun 2018 08:23:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKD/DdGKrYRI0BbGJ47WDqWkh3Yg+cNdCG13AoYNHXCLTzxr7//k8NNVJyJevJMIWP2ap4e
X-Received: by 2002:ac8:520e:: with SMTP id r14-v6mr1886665qtn.11.1529076200804;
        Fri, 15 Jun 2018 08:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529076200; cv=none;
        d=google.com; s=arc-20160816;
        b=avz6XGWucuFYyWW/MM24TyanLS7z3b8l8bH3/rBGISwxsIpdwx/ohqw2fBTci7fo5s
         yDTkpP6kzMcwVhmzyGFWrLJq1FLA0AypxvZ9GM3GzYX3qtdDAH6KZyBvfSky/EB7fP5a
         Tdd+isBRPj/bXprHEZ/vRrAPwxfNVeK0upPX/CSHQg9+UqpofTlOcZz2w8tZEYRpwWv+
         ksSLCHXunA879RLy9JHM+iyZbhM7tz57nFgpuoEC9pI8JOiPW1lHfU38kfNxU6seQHpw
         S7I9Ita1YPhILSbutUR26IlWx4IHxPvRu29bwgd8VkAcPHqKfqGBw1C/o+m7gmehfHaT
         UDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Jufgdkbz63UGADwkcrNSIhWhLJNtbP1D/TGzR31kE0k=;
        b=mBMcUcu1ZfrTREAuTCP+M6Q+egYayX/861NyTGspU+dzyDm24zw+2KBBC+1C9QfuLv
         QpZHRIlSsr0C0q+4FjIRy+q1iYYMoCtUp1lzz1fA57w0AUN1OiFP6KogayB5piH2H9pt
         csqayWFf0t9LFBKvyuVJBqdOG1zjqMO/3EZcHaUVXER7r2wC+muc/IfcDdBPwP2T71L5
         j8PbXFftutTd8OWDZU0WElWc3+q5eIgrsGmLjrI2H7EdXA+jakGppmxrsTxRtBfdkh6t
         fqreg1xQU8Ww4fbuu07ZkyFPgG8kiAnhXPcOMrmCWcttnw2Bvbewe1u+v2l+bRQLihgL
         Rimg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a48-v6si5963068qta.95.2018.06.15.08.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqZM-0001Rn-8F
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:23:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiU-0004OJ-BG
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiS-0000r5-5v
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41222 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpiS-0000qb-12; Fri, 15 Jun 2018 10:28:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EB344067720;
	Fri, 15 Jun 2018 14:28:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1E52026DEF;
	Fri, 15 Jun 2018 14:28:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:20 +0200
Message-Id: <1529072910-16156-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:39 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 01/11] linux-headers: Update to 4.18-rc0
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBZGjIKiACbe

commit b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/standard-headers/linux/pci_regs.h            |  8 ++++++++
 include/standard-headers/linux/virtio_gpu.h          |  1 +
 include/standard-headers/linux/virtio_net.h          |  3 +++
 linux-headers/LICENSES/exceptions/Linux-syscall-note |  2 +-
 linux-headers/LICENSES/preferred/GPL-2.0             |  6 ++++++
 linux-headers/asm-arm/kvm.h                          |  1 +
 linux-headers/asm-arm/unistd-common.h                |  1 +
 linux-headers/asm-arm64/kvm.h                        |  1 +
 linux-headers/asm-generic/unistd.h                   |  4 +++-
 linux-headers/asm-powerpc/unistd.h                   |  1 +
 linux-headers/asm-x86/unistd_32.h                    |  2 ++
 linux-headers/asm-x86/unistd_64.h                    |  2 ++
 linux-headers/asm-x86/unistd_x32.h                   |  2 ++
 linux-headers/linux/kvm.h                            |  5 +++--
 linux-headers/linux/psp-sev.h                        | 12 ++++++++++++
 15 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index 103ba79..4da87e2 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -506,6 +506,8 @@
 #define  PCI_EXP_DEVCTL_READRQ_256B  0x1000 /* 256 Bytes */
 #define  PCI_EXP_DEVCTL_READRQ_512B  0x2000 /* 512 Bytes */
 #define  PCI_EXP_DEVCTL_READRQ_1024B 0x3000 /* 1024 Bytes */
+#define  PCI_EXP_DEVCTL_READRQ_2048B 0x4000 /* 2048 Bytes */
+#define  PCI_EXP_DEVCTL_READRQ_4096B 0x5000 /* 4096 Bytes */
 #define  PCI_EXP_DEVCTL_BCR_FLR 0x8000  /* Bridge Configuration Retry / FLR */
 #define PCI_EXP_DEVSTA		10	/* Device Status */
 #define  PCI_EXP_DEVSTA_CED	0x0001	/* Correctable Error Detected */
@@ -655,6 +657,11 @@
 #define  PCI_EXP_LNKCAP2_SLS_16_0GB	0x00000010 /* Supported Speed 16GT/s */
 #define  PCI_EXP_LNKCAP2_CROSSLINK	0x00000100 /* Crosslink supported */
 #define PCI_EXP_LNKCTL2		48	/* Link Control 2 */
+#define PCI_EXP_LNKCTL2_TLS		0x000f
+#define PCI_EXP_LNKCTL2_TLS_2_5GT	0x0001 /* Supported Speed 2.5GT/s */
+#define PCI_EXP_LNKCTL2_TLS_5_0GT	0x0002 /* Supported Speed 5GT/s */
+#define PCI_EXP_LNKCTL2_TLS_8_0GT	0x0003 /* Supported Speed 8GT/s */
+#define PCI_EXP_LNKCTL2_TLS_16_0GT	0x0004 /* Supported Speed 16GT/s */
 #define PCI_EXP_LNKSTA2		50	/* Link Status 2 */
 #define PCI_CAP_EXP_ENDPOINT_SIZEOF_V2	52	/* v2 endpoints with link end here */
 #define PCI_EXP_SLTCAP2		52	/* Slot Capabilities 2 */
@@ -981,6 +988,7 @@
 #define  PCI_EXP_DPC_CAP_DL_ACTIVE	0x1000	/* ERR_COR signal on DL_Active supported */
 
 #define PCI_EXP_DPC_CTL			6	/* DPC control */
+#define  PCI_EXP_DPC_CTL_EN_FATAL 	0x0001	/* Enable trigger on ERR_FATAL message */
 #define  PCI_EXP_DPC_CTL_EN_NONFATAL 	0x0002	/* Enable trigger on ERR_NONFATAL message */
 #define  PCI_EXP_DPC_CTL_INT_EN 	0x0008	/* DPC Interrupt Enable */
 
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index c1c8f07..52a830d 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -260,6 +260,7 @@ struct virtio_gpu_cmd_submit {
 };
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
+#define VIRTIO_GPU_CAPSET_VIRGL2 2
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
diff --git a/include/standard-headers/linux/virtio_net.h b/include/standard-headers/linux/virtio_net.h
index e9f255e..260c368 100644
--- a/include/standard-headers/linux/virtio_net.h
+++ b/include/standard-headers/linux/virtio_net.h
@@ -57,6 +57,9 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 
+#define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
+					 * with the same MAC.
+					 */
 #define VIRTIO_NET_F_SPEED_DUPLEX 63	/* Device set linkspeed and duplex */
 
 #ifndef VIRTIO_NET_NO_LEGACY
diff --git a/linux-headers/LICENSES/exceptions/Linux-syscall-note b/linux-headers/LICENSES/exceptions/Linux-syscall-note
index 6b60b61..9abdad7 100644
--- a/linux-headers/LICENSES/exceptions/Linux-syscall-note
+++ b/linux-headers/LICENSES/exceptions/Linux-syscall-note
@@ -1,6 +1,6 @@
 SPDX-Exception-Identifier: Linux-syscall-note
 SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
-SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, LGPL-2.1, LGPL-2.1+
+SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, LGPL-2.1, LGPL-2.1+, GPL-2.0-only, GPL-2.0-or-later
 Usage-Guide:
   This exception is used together with one of the above SPDX-Licenses
   to mark user space API (uapi) header files so they can be included
diff --git a/linux-headers/LICENSES/preferred/GPL-2.0 b/linux-headers/LICENSES/preferred/GPL-2.0
index b8db91d..ff0812f 100644
--- a/linux-headers/LICENSES/preferred/GPL-2.0
+++ b/linux-headers/LICENSES/preferred/GPL-2.0
@@ -1,5 +1,7 @@
 Valid-License-Identifier: GPL-2.0
+Valid-License-Identifier: GPL-2.0-only
 Valid-License-Identifier: GPL-2.0+
+Valid-License-Identifier: GPL-2.0-or-later
 SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
 Usage-Guide:
   To use this license in source code, put one of the following SPDX
@@ -7,8 +9,12 @@ Usage-Guide:
   guidelines in the licensing rules documentation.
   For 'GNU General Public License (GPL) version 2 only' use:
     SPDX-License-Identifier: GPL-2.0
+  or
+    SPDX-License-Identifier: GPL-2.0-only
   For 'GNU General Public License (GPL) version 2 or any later version' use:
     SPDX-License-Identifier: GPL-2.0+
+  or
+    SPDX-License-Identifier: GPL-2.0-or-later
 License-Text:
 
 		    GNU GENERAL PUBLIC LICENSE
diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 670b43c..72aa226 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -91,6 +91,7 @@ struct kvm_regs {
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
 #define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
diff --git a/linux-headers/asm-arm/unistd-common.h b/linux-headers/asm-arm/unistd-common.h
index 8d5ceae..60c2d93 100644
--- a/linux-headers/asm-arm/unistd-common.h
+++ b/linux-headers/asm-arm/unistd-common.h
@@ -354,5 +354,6 @@
 #define __NR_pkey_alloc (__NR_SYSCALL_BASE + 395)
 #define __NR_pkey_free (__NR_SYSCALL_BASE + 396)
 #define __NR_statx (__NR_SYSCALL_BASE + 397)
+#define __NR_rseq (__NR_SYSCALL_BASE + 398)
 
 #endif /* _ASM_ARM_UNISTD_COMMON_H */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 17315ab..99cb9ad 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -91,6 +91,7 @@ struct kvm_regs {
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
 #define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
diff --git a/linux-headers/asm-generic/unistd.h b/linux-headers/asm-generic/unistd.h
index 8bcb186..4299067 100644
--- a/linux-headers/asm-generic/unistd.h
+++ b/linux-headers/asm-generic/unistd.h
@@ -732,9 +732,11 @@ __SYSCALL(__NR_pkey_alloc,    sys_pkey_alloc)
 __SYSCALL(__NR_pkey_free,     sys_pkey_free)
 #define __NR_statx 291
 __SYSCALL(__NR_statx,     sys_statx)
+#define __NR_io_pgetevents 292
+__SC_COMP(__NR_io_pgetevents, sys_io_pgetevents, compat_sys_io_pgetevents)
 
 #undef __NR_syscalls
-#define __NR_syscalls 292
+#define __NR_syscalls 293
 
 /*
  * 32 bit systems traditionally used different
diff --git a/linux-headers/asm-powerpc/unistd.h b/linux-headers/asm-powerpc/unistd.h
index 0c08edc..3629858 100644
--- a/linux-headers/asm-powerpc/unistd.h
+++ b/linux-headers/asm-powerpc/unistd.h
@@ -398,5 +398,6 @@
 #define __NR_pkey_alloc		384
 #define __NR_pkey_free		385
 #define __NR_pkey_mprotect	386
+#define __NR_rseq		387
 
 #endif /* _ASM_POWERPC_UNISTD_H_ */
diff --git a/linux-headers/asm-x86/unistd_32.h b/linux-headers/asm-x86/unistd_32.h
index 8a206df..c1b30a0 100644
--- a/linux-headers/asm-x86/unistd_32.h
+++ b/linux-headers/asm-x86/unistd_32.h
@@ -382,5 +382,7 @@
 #define __NR_pkey_free 382
 #define __NR_statx 383
 #define __NR_arch_prctl 384
+#define __NR_io_pgetevents 385
+#define __NR_rseq 386
 
 #endif /* _ASM_X86_UNISTD_32_H */
diff --git a/linux-headers/asm-x86/unistd_64.h b/linux-headers/asm-x86/unistd_64.h
index 336c2e4..c2e464c1 100644
--- a/linux-headers/asm-x86/unistd_64.h
+++ b/linux-headers/asm-x86/unistd_64.h
@@ -334,5 +334,7 @@
 #define __NR_pkey_alloc 330
 #define __NR_pkey_free 331
 #define __NR_statx 332
+#define __NR_io_pgetevents 333
+#define __NR_rseq 334
 
 #endif /* _ASM_X86_UNISTD_64_H */
diff --git a/linux-headers/asm-x86/unistd_x32.h b/linux-headers/asm-x86/unistd_x32.h
index cb98a52..3722902 100644
--- a/linux-headers/asm-x86/unistd_x32.h
+++ b/linux-headers/asm-x86/unistd_x32.h
@@ -287,6 +287,8 @@
 #define __NR_pkey_alloc (__X32_SYSCALL_BIT + 330)
 #define __NR_pkey_free (__X32_SYSCALL_BIT + 331)
 #define __NR_statx (__X32_SYSCALL_BIT + 332)
+#define __NR_io_pgetevents (__X32_SYSCALL_BIT + 333)
+#define __NR_rseq (__X32_SYSCALL_BIT + 334)
 #define __NR_rt_sigaction (__X32_SYSCALL_BIT + 512)
 #define __NR_rt_sigreturn (__X32_SYSCALL_BIT + 513)
 #define __NR_ioctl (__X32_SYSCALL_BIT + 514)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index cdb148e..98f389a 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -677,10 +677,10 @@ struct kvm_ioeventfd {
 };
 
 #define KVM_X86_DISABLE_EXITS_MWAIT          (1 << 0)
-#define KVM_X86_DISABLE_EXITS_HTL            (1 << 1)
+#define KVM_X86_DISABLE_EXITS_HLT            (1 << 1)
 #define KVM_X86_DISABLE_EXITS_PAUSE          (1 << 2)
 #define KVM_X86_DISABLE_VALID_EXITS          (KVM_X86_DISABLE_EXITS_MWAIT | \
-                                              KVM_X86_DISABLE_EXITS_HTL | \
+                                              KVM_X86_DISABLE_EXITS_HLT | \
                                               KVM_X86_DISABLE_EXITS_PAUSE)
 
 /* for KVM_ENABLE_CAP */
@@ -948,6 +948,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_BPB 152
 #define KVM_CAP_GET_MSR_FEATURES 153
 #define KVM_CAP_HYPERV_EVENTFD 154
+#define KVM_CAP_HYPERV_TLBFLUSH 155
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/linux-headers/linux/psp-sev.h b/linux-headers/linux/psp-sev.h
index 33e2474..b7b933f 100644
--- a/linux-headers/linux/psp-sev.h
+++ b/linux-headers/linux/psp-sev.h
@@ -30,6 +30,7 @@ enum {
 	SEV_PDH_GEN,
 	SEV_PDH_CERT_EXPORT,
 	SEV_PEK_CERT_IMPORT,
+	SEV_GET_ID,
 
 	SEV_MAX,
 };
@@ -124,6 +125,17 @@ struct sev_user_data_pdh_cert_export {
 } __attribute__((packed));
 
 /**
+ * struct sev_user_data_get_id - GET_ID command parameters
+ *
+ * @socket1: Buffer to pass unique ID of first socket
+ * @socket2: Buffer to pass unique ID of second socket
+ */
+struct sev_user_data_get_id {
+	__u8 socket1[64];			/* Out */
+	__u8 socket2[64];			/* Out */
+} __attribute__((packed));
+
+/**
  * struct sev_issue_cmd - SEV ioctl parameters
  *
  * @cmd: SEV commands to execute
-- 
2.5.5

