Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3657554wru;
        Sat, 21 Jul 2018 02:53:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdTCwvg7uy8sm+wZ9yvFcbhUBPqx8MYFcAaXQyx1LUwj5oqA29C9HUmf1V0Zq/iBj/472GW
X-Received: by 2002:ae9:edc5:: with SMTP id c188-v6mr4630208qkg.92.1532166790925;
        Sat, 21 Jul 2018 02:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532166790; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/gS96Un82Ijn2paMDcjth5j0vlbUX/w+aYcO7jCKXyWDsEHLHL1w6VcjeqPmbwlQi
         C4xaS36nn/M6Ey1PCjswRDMpNMZnTUBhtVGAkgP2Bfd5/T8Qq2CivPoGQpYuMuR6H2PN
         i9Ao7SiCmfu3bK2qmJSecnZp93vRA93ururYMIfNbh3NC+fRfurln8PNPBEUaefyzUFC
         sjm9BSUeDlSANgwP2yfRuXk5ackAlxoijy4OXmvLXRQ01GOqEOHR7vQYB7paRRCIk3nZ
         9TXhZ6U/b7sVaUDT/aXbIuVZyaKmk0McKIbxdKXKmlH5tEQ8PPJKKYv2I8EV8LhAvTjl
         /yOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=gSsdin4xXdpMfuDjCLTy/i6EhbQi3fbkphR0mSt+3tQ=;
        b=jgM/0Cu55WBiTAzcGscQPiHpANg5BEjJUJx3T+L4gbkwZIUeiu5hj1lhefpjNBXhdc
         Y2Uc8a4ad+L92P2wXCgXD/09Ztp5PkhHDm3Lq53OkXmyDa8AjQgKEhlbvmEFud9eUcbQ
         VatB7zxYB+r2s68SMIqrg6Y4Nm7e2nNVEg1BbSpRRSDqvzkdS07+8JY7zB7sMfgL7I6t
         fS5OY3E5S2GC6AmWCzSfUiPKGDRs7MwdBduzjTxv26Sx7GkW5b3EhdMIgOjCiPrc5AQu
         7KlJTd7x3HjZ7cWOX8hd2XXod6NPLmaOXFn95XaFo754yaRxoFBkdfo4IbQx5n5LIndB
         HP6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r15-v6si4193771qkk.145.2018.07.21.02.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 02:53:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgoZa-00067G-Bt
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 05:53:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgoZL-00066Y-Qp
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgoZJ-0007Z1-Gn
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:52:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2557 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fgoZI-0007XE-Co; Sat, 21 Jul 2018 05:52:53 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 0300E6A9DA6B6;
	Sat, 21 Jul 2018 17:52:30 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.382.0; Sat, 21 Jul 2018 17:52:24 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 21 Jul 2018 13:57:42 -0400
Message-ID: <1532195863-23945-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532195863-23945-1-git-send-email-gengdongjiu@huawei.com>
References: <1532195863-23945-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v5 2/3] kvm: sync linux headers
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
X-TUID: +Ujarq6WpMkH

Import KVM_CAP_ARM_INJECT_SERROR_ESR and kvm_vcpu_events
struct definition.

The related kernel change has been already applied to kvmarm/next.
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

