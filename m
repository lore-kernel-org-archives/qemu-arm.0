Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3660220wru;
        Sat, 21 Jul 2018 02:57:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdL7tZqbkk5qVgFN+urSgztIASiFjTflYhI9ExT/zu5Jr7Am21acsLFbKRs4UE9noeFOfva
X-Received: by 2002:a0c:d4d7:: with SMTP id y23-v6mr4695289qvh.234.1532167075633;
        Sat, 21 Jul 2018 02:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532167075; cv=none;
        d=google.com; s=arc-20160816;
        b=QlM8s5sDXIZlVG1YmRlAIduUXoJ0TtGHfohbF3pkyCyoqypXenR+4aCFSyIImnbTxg
         QHSxxmAillBnUd7TAZJs/asBpGR1d5U7+Wx5cikAN2L8zpoBBQ91nb2J5ipBgXfKbl8X
         YSUJhw7uWcEY0UQsp5Q2JvcY1e+ec/YMR+UIaB8pMXIICiph2EOUQNujIXextrN0vpNE
         dkzp1jAXZJriI0ko0xXwAE+FtwxmHNrbD6KrVl6W4OBBOG4PqaR1Qiv5R/aNDIR2IosZ
         ofcP/ltYTdOugoXRACrkvizu8VSUUooMJMT3ArmKxuect4Vm9P7fQiFskVKDO4KYQVYV
         fphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=7xncFyOe34/Q0G5pfL5JwY63DaufM1c0+f26bskNX/o=;
        b=JYiyobPRVtjWLzJHKQuyvM0eJs8g93jheMY/gQ1qimE8qDq6z7hwAitYGW9gL0EHCb
         e7IAP/QqTJalpJyShiEBQw0rq7QnhpmSxJFxa50NxMKdH6FMTu0dHlD7oHO6BzSxdX2r
         38PiI6YNEMZsVHqxpotIcoHl+CZYVbi5B+2t8tlK/Z8AqhdtvABTamgmon3O1bNbu1jo
         6dlLdaA5hcnVqTC4uBNbuwv1th5H7Iq8uqaaNdYt2jbMeGzEbBZjAEoMXQA7vuWFjGu2
         38y3mi2ioTT7TdF9e+7wmwF1ulLY1KKcUuG3iJc3YrEBsDin7giduF7dyNVOqBkEiphu
         edBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4-v6si2460346qtc.217.2018.07.21.02.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 02:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgoeB-0001OH-3e
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 05:57:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgodw-0001NU-TS
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgodt-0001X0-SV
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:57:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60217 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fgodt-0001W3-EQ; Sat, 21 Jul 2018 05:57:37 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C64A4A4DCE742;
	Sat, 21 Jul 2018 17:57:31 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Sat, 21 Jul 2018 17:57:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 21 Jul 2018 14:02:40 -0400
Message-ID: <1532196162-29453-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
References: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v6 1/3] Update Linux headers to 4.18-rc5
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
Cc: linuxarm@huawei.com, gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ypvDmkodNk4f

Update our copy of the Linux headers to upstream 4.18-rc5
(kernel commit 9d3cce1e8b8561fed5f38)

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 include/standard-headers/linux/virtio_config.h | 16 ++++++++++++----
 linux-headers/asm-mips/unistd.h                | 18 ++++++++++++------
 linux-headers/asm-powerpc/kvm.h                |  1 +
 linux-headers/asm-powerpc/unistd.h             |  1 +
 linux-headers/asm-s390/unistd_32.h             |  2 ++
 linux-headers/asm-s390/unistd_64.h             |  2 ++
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index b777069..0b19436 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -45,11 +45,14 @@
 /* We've given up on this device. */
 #define VIRTIO_CONFIG_S_FAILED		0x80
 
-/* Some virtio feature bits (currently bits 28 through 32) are reserved for the
- * transport being used (eg. virtio_ring), the rest are per-device feature
- * bits. */
+/*
+ * Virtio feature bits VIRTIO_TRANSPORT_F_START through
+ * VIRTIO_TRANSPORT_F_END are reserved for the transport
+ * being used (e.g. virtio_ring, virtio_pci etc.), the
+ * rest are per-device feature bits.
+ */
 #define VIRTIO_TRANSPORT_F_START	28
-#define VIRTIO_TRANSPORT_F_END		34
+#define VIRTIO_TRANSPORT_F_END		38
 
 #ifndef VIRTIO_CONFIG_NO_LEGACY
 /* Do we get callbacks when the ring is completely used, even if we've
@@ -71,4 +74,9 @@
  * this is for compatibility with legacy systems.
  */
 #define VIRTIO_F_IOMMU_PLATFORM		33
+
+/*
+ * Does the device support Single Root I/O Virtualization?
+ */
+#define VIRTIO_F_SR_IOV			37
 #endif /* _LINUX_VIRTIO_CONFIG_H */
diff --git a/linux-headers/asm-mips/unistd.h b/linux-headers/asm-mips/unistd.h
index 9bfef7f..d4a85ef 100644
--- a/linux-headers/asm-mips/unistd.h
+++ b/linux-headers/asm-mips/unistd.h
@@ -388,17 +388,19 @@
 #define __NR_pkey_alloc			(__NR_Linux + 364)
 #define __NR_pkey_free			(__NR_Linux + 365)
 #define __NR_statx			(__NR_Linux + 366)
+#define __NR_rseq			(__NR_Linux + 367)
+#define __NR_io_pgetevents		(__NR_Linux + 368)
 
 
 /*
  * Offset of the last Linux o32 flavoured syscall
  */
-#define __NR_Linux_syscalls		366
+#define __NR_Linux_syscalls		368
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
 
 #define __NR_O32_Linux			4000
-#define __NR_O32_Linux_syscalls		366
+#define __NR_O32_Linux_syscalls		368
 
 #if _MIPS_SIM == _MIPS_SIM_ABI64
 
@@ -733,16 +735,18 @@
 #define __NR_pkey_alloc			(__NR_Linux + 324)
 #define __NR_pkey_free			(__NR_Linux + 325)
 #define __NR_statx			(__NR_Linux + 326)
+#define __NR_rseq			(__NR_Linux + 327)
+#define __NR_io_pgetevents		(__NR_Linux + 328)
 
 /*
  * Offset of the last Linux 64-bit flavoured syscall
  */
-#define __NR_Linux_syscalls		326
+#define __NR_Linux_syscalls		328
 
 #endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
 
 #define __NR_64_Linux			5000
-#define __NR_64_Linux_syscalls		326
+#define __NR_64_Linux_syscalls		328
 
 #if _MIPS_SIM == _MIPS_SIM_NABI32
 
@@ -1081,15 +1085,17 @@
 #define __NR_pkey_alloc			(__NR_Linux + 328)
 #define __NR_pkey_free			(__NR_Linux + 329)
 #define __NR_statx			(__NR_Linux + 330)
+#define __NR_rseq			(__NR_Linux + 331)
+#define __NR_io_pgetevents		(__NR_Linux + 332)
 
 /*
  * Offset of the last N32 flavoured syscall
  */
-#define __NR_Linux_syscalls		330
+#define __NR_Linux_syscalls		332
 
 #endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
 
 #define __NR_N32_Linux			6000
-#define __NR_N32_Linux_syscalls		330
+#define __NR_N32_Linux_syscalls		332
 
 #endif /* _ASM_UNISTD_H */
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 833ed9a..1b32b56 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -633,6 +633,7 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_PSSCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xbd)
 
 #define KVM_REG_PPC_DEC_EXPIRY	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xbe)
+#define KVM_REG_PPC_ONLINE	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0xbf)
 
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/linux-headers/asm-powerpc/unistd.h b/linux-headers/asm-powerpc/unistd.h
index 3629858..ec3533b 100644
--- a/linux-headers/asm-powerpc/unistd.h
+++ b/linux-headers/asm-powerpc/unistd.h
@@ -399,5 +399,6 @@
 #define __NR_pkey_free		385
 #define __NR_pkey_mprotect	386
 #define __NR_rseq		387
+#define __NR_io_pgetevents	388
 
 #endif /* _ASM_POWERPC_UNISTD_H_ */
diff --git a/linux-headers/asm-s390/unistd_32.h b/linux-headers/asm-s390/unistd_32.h
index d0f97cd..514e302 100644
--- a/linux-headers/asm-s390/unistd_32.h
+++ b/linux-headers/asm-s390/unistd_32.h
@@ -361,5 +361,7 @@
 #define __NR_statx 379
 #define __NR_s390_sthyi 380
 #define __NR_kexec_file_load 381
+#define __NR_io_pgetevents 382
+#define __NR_rseq 383
 
 #endif /* _ASM_S390_UNISTD_32_H */
diff --git a/linux-headers/asm-s390/unistd_64.h b/linux-headers/asm-s390/unistd_64.h
index 23ffb97..d2b73de 100644
--- a/linux-headers/asm-s390/unistd_64.h
+++ b/linux-headers/asm-s390/unistd_64.h
@@ -328,5 +328,7 @@
 #define __NR_statx 379
 #define __NR_s390_sthyi 380
 #define __NR_kexec_file_load 381
+#define __NR_io_pgetevents 382
+#define __NR_rseq 383
 
 #endif /* _ASM_S390_UNISTD_64_H */
-- 
1.8.3.1

