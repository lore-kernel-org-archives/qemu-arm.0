Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3660216wru;
        Sat, 21 Jul 2018 02:57:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd7IKpGeqxmyKRXDxcfRxcL4Xxhd+btEYWL/G4a+1yC6IgALVd/ZdeqX2lBp6dSF96DPVaS
X-Received: by 2002:aed:221d:: with SMTP id n29-v6mr5191147qtc.361.1532167074982;
        Sat, 21 Jul 2018 02:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532167074; cv=none;
        d=google.com; s=arc-20160816;
        b=eMGDVCqZ+kY5yZ+tEofam5wjEODtt6W5THrcsX+wVEUfpdkUsIugM3ZjXXJ8gvaUjt
         6dIVVU3H0+74gZR2/Tj+AC7t5ct2dpzexYXsOfmH63YUIz48wCWf9n7KWY5EHFXEERgQ
         Dh6LZryahHwfBuuXZ4SiGD5IBsk/TJ19qLJtluxFQgJ3T3vUz4pC4V6Dd3B0aHLFPEpt
         OR1ghjCefDiKkg/apqMKLILwt6IlKbV4LxWW6tS2/RSOTiJFbeYYU+SdVBrX4SLxxNic
         paNW0Nitcip77zsYupAq48arAMnCwRM/1NOiI72B+fckJFs+GQX4v8x39S+AoXpPU10q
         KOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=r5irD4kWWsmCJYz73Dj9lvmNRuIcyiX9GmnEKGoCBCI=;
        b=W4J0R40jKZJ6AZoq4QWzP0p25fSy1jf+91TPcw5Ho15z0u81g5b0g93vv7mtWPQK3k
         6iMAsZnlgAOBsdNNVoa/Ef5q9Fs8NlwGYoV12FmZLfSK2qMPQhZz0jFjcl8dYwLTi+X2
         +BRSRykDqf3CM6DBYroMHuP+Mb9mTS6mZlwUP7wUOVMwma7+OKLlJQXiFJ3dSpdHQNtI
         Nnehu1DDAfa0ajJPqEMVOZXHK0uuE+yg6OmFOnXE8tOr1/AHmc9OQFCMT/q5xBnFPGW8
         ZMBe7qpJyS3ZtpOqN/9jVXxV3T2SDb26bhSxbM+4fShwTR00HS2rNHlUPwbDT4wP5R4m
         aLZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188-v6si4058965qkf.249.2018.07.21.02.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 02:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgoeA-0001O9-EO
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 05:57:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgodw-0001NT-TR
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgodt-0001Wp-Q9
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:57:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60216 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fgodt-0001W0-Bq; Sat, 21 Jul 2018 05:57:37 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id D53B88E08C619;
	Sat, 21 Jul 2018 17:57:31 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Sat, 21 Jul 2018 17:57:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 21 Jul 2018 14:02:41 -0400
Message-ID: <1532196162-29453-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
References: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v6 2/3] kvm: sync linux headers
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
X-TUID: mX3cBO4R3UKs

Import KVM_CAP_ARM_INJECT_SERROR_ESR and kvm_vcpu_events
struct definition.

The related kernel change have been already applied to kvmarm/next.
(https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=next)

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/asm-arm/kvm.h   | 13 +++++++++++++
 linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
 linux-headers/linux/kvm.h     |  1 +
 3 files changed, 27 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 72aa226..e1f8b74 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -27,6 +27,7 @@
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
@@ -125,6 +126,18 @@ struct kvm_sync_regs {
 struct kvm_arch_memory_slot {
 };
 
+/* for KVM_GET/SET_VCPU_EVENTS */
+struct kvm_vcpu_events {
+	struct {
+		__u8 serror_pending;
+		__u8 serror_has_esr;
+		/* Align it to 8 bytes */
+		__u8 pad[6];
+		__u64 serror_esr;
+	} exception;
+	__u32 reserved[12];
+};
+
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
 #define KVM_REG_ARM_COPROC_SHIFT	16
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 99cb9ad..e6a98c1 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -39,6 +39,7 @@
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
@@ -154,6 +155,18 @@ struct kvm_sync_regs {
 struct kvm_arch_memory_slot {
 };
 
+/* for KVM_GET/SET_VCPU_EVENTS */
+struct kvm_vcpu_events {
+	struct {
+		__u8 serror_pending;
+		__u8 serror_has_esr;
+		/* Align it to 8 bytes */
+		__u8 pad[6];
+		__u64 serror_esr;
+	} exception;
+	__u32 reserved[12];
+};
+
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
 #define KVM_REG_ARM_COPROC_SHIFT	16
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 98f389a..446f694 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -949,6 +949,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_GET_MSR_FEATURES 153
 #define KVM_CAP_HYPERV_EVENTFD 154
 #define KVM_CAP_HYPERV_TLBFLUSH 155
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 156
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
1.8.3.1

