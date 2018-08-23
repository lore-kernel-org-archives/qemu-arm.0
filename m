Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp875411wrd;
        Thu, 23 Aug 2018 00:45:53 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzUo1Ih8/dhAOLIcXLAEIRbaYt7vKPUQjo/gEW49j6TxKqbJIXpX+TZ9i+b0B5prDnCPYwO
X-Received: by 2002:ac8:427:: with SMTP id v39-v6mr57419626qtg.120.1535010352937;
        Thu, 23 Aug 2018 00:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535010352; cv=none;
        d=google.com; s=arc-20160816;
        b=zFWA07dRYrIRI28Q8uDcQRVou0F6pjue0rZg/dpK31jA0EbR6lSEYG8JSwwjpUB1Qu
         4nb10iPegkq++qPDDrbI8Z3xoXKiu6C5IAK1v5yJOFEmkA/sSFmREQuMd9Ih9QqHSbxq
         TF2QER/eT+lidH8osB/sUNOosdKVCVmaca2M6C6JQOsLWbq/pOWSA+lb9G3SPcpacIKu
         ZIn+DJBh9y+0KC7jFo0WFKmpaEdH579HmOGlZPbXVLhrvyX9GYdQVylUavS2yHdvWJhw
         CQj8PeVKJdHSD1kT6DSsgDV8AX5C8t7G2KTXDwyvpjuEDnoaNxICHADPmTlzjfX5qmqK
         7sjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=VRDQaULeyRgMJEwbSqxejhDrzJqZtb3D3LyMWwraO+0=;
        b=LrPNbxLTx2FOIdiJEfAUtsl5LHY8r0WKf8jnbvJHW2P9oI63s2KSmXcrYUvLyIGJPT
         et0tCbq9NsLAVPQU8ohRpbxKbRkf5uo8yeWqcluvqxdaed2JotduBYflfmqsX6x1zwWM
         9HoRhfuIUqWjVOQjNVYnXShRH3CMkwWuWIb1SYoDe6kzrlN2m0oY71lDgozcn6YGMdRx
         uhoKL9QgG/GVM9DLt41qWquVthNzQtplYn1Olh+KLThJFfeersoHw/8xEYumRLHXAeL6
         3VsO4XCXGmMwcSx6OWKj0R7ohozCohnEy2RNL8Yl0pLmE5wvx3lDlyuVdw4U786JlkeS
         vJTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p76-v6si537qkl.188.2018.08.23.00.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 00:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fskJU-0004kq-BL
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 03:45:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fskJD-0004do-Az
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 03:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fskEI-0006km-P6
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 03:40:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2640 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fskEI-0006fn-Ax; Thu, 23 Aug 2018 03:40:30 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 168D445342D01;
	Thu, 23 Aug 2018 15:40:20 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.399.0; Thu, 23 Aug 2018 15:40:15 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 23 Aug 2018 11:44:59 -0400
Message-ID: <1535039100-11248-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v6 1/2] linux-headers: Update to kernel mainline
 commit 815f0ddb3
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
X-TUID: NJPHSZXHAB4Z

Update our kernel headers to mainline commit
815f0ddb346c196018d4d8f8f55c12b83da1de3f
(include/linux/compiler*.h: make compiler-*.h mutually exclusive)

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 include/standard-headers/linux/input.h |  9 +++++----
 linux-headers/asm-arm/kvm.h            | 13 +++++++++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++++++++
 linux-headers/linux/kvm.h              |  1 +
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/standard-headers/linux/input.h b/include/standard-headers/linux/input.h
index 6d6128c..c0ad9fc 100644
--- a/include/standard-headers/linux/input.h
+++ b/include/standard-headers/linux/input.h
@@ -267,10 +267,11 @@ struct input_mask {
 /*
  * MT_TOOL types
  */
-#define MT_TOOL_FINGER		0
-#define MT_TOOL_PEN		1
-#define MT_TOOL_PALM		2
-#define MT_TOOL_MAX		2
+#define MT_TOOL_FINGER		0x00
+#define MT_TOOL_PEN		0x01
+#define MT_TOOL_PALM		0x02
+#define MT_TOOL_DIAL		0x0a
+#define MT_TOOL_MAX		0x0f
 
 /*
  * Values describing the status of a force-feedback effect
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
index 6679072..bae1c89 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -951,6 +951,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_HYPERV_TLBFLUSH 155
 #define KVM_CAP_S390_HPAGE_1M 156
 #define KVM_CAP_NESTED_STATE 157
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 158
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
1.9.1

