Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5463086wre;
        Wed, 30 May 2018 20:49:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKl5NqQRbwsWlLEOmtQv7pinLiPxQLJ2kvG8jvm0rKM9IUX+d66zE8vsgRx9c3psf416JOi
X-Received: by 2002:a37:9184:: with SMTP id t126-v6mr4929805qkd.294.1527738561135;
        Wed, 30 May 2018 20:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527738561; cv=none;
        d=google.com; s=arc-20160816;
        b=EpgirbIQgxPPJlTzUBAFq1qU7LwZLh03xknRTw8rZPOgZZTBGSMSQgj50tCnTbHN2H
         ykjrp1qVeT+FhJqq5AS9rKtV5ukGBZmUafJ8R99uNI3k+31+tnBYBSofFbvA7PaDm8wC
         OTMX30JnLclio9CuTmka+R9YBt6z+MRlZhSzzKXlHot/+OxxNnLZGsKlBJ6nEtpD+rGj
         wh7ZmU8TSkyECLhcxZ2xVurvMtG5elwbJnDhUjvpcgCQfwJxbY5JUaEpjjT2kn8Aih2e
         pfxf9hRuwBhRwB+IaNS2oFSl6wtxa3ok3InlRVC1K6XXg7SjAqU03mY00YbXsH+Ol9xg
         zStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=novJ6G+ATjP3WzEBsoOMTJmGgS3+1Nuz4jS2pu5K0a8=;
        b=vimyKDFSpk5tWn79+iBsJNUDWEekxWaqgX6XQGv1OVF3885sna7PIxV21BYe1+zLJS
         tz0naoi3IufTLgsgqR6vdzluw+ffkXGwyhTSmxy4yfHYqBFtCNI7LtkkGZadRI2JZWWb
         MAJ84OgBEmfA0+niRU6k4hB/hTXC11ua/Vf3VXyI3vGPYPbUZxYQS2OllaV2Qn7Z3qE/
         PzjkkQPm4ePvThS9M4IAyUlNRGvKaw8+7o/hTFQo2M69lAElO8foZLe4X7jegqFMhaAl
         iQCxoemEj4f6scld+Dx1tuQ1A/ls8PGUotVHMQxjIbhW13V8ClA7vxtkbGaYEUyODDkX
         NAbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a21-v6si18403qtp.111.2018.05.30.20.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:49:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOEaW-0007TK-Io
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEa1-0007Hr-UR
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:48:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEZx-0003bS-78
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:48:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2624 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOEZw-0003a1-SQ; Wed, 30 May 2018 23:48:45 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 40CA2694F0898;
	Thu, 31 May 2018 11:48:30 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:48:21 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Date: Thu, 31 May 2018 19:53:49 +0800
Message-ID: <1527767630-6479-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527767630-6479-1-git-send-email-gengdongjiu@huawei.com>
References: <1527767630-6479-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH RESEND v1 2/3] kvm: sync linux headers
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yQccD84JzBGt

Import KVM_CAP_ARM_INJECT_SERROR_ESR and struct kvm_vcpu_events
for arm64

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
 linux-headers/linux/kvm.h     |  1 +
 2 files changed, 14 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 17315ab..e240afc 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -39,6 +39,7 @@
 #define __KVM_HAVE_GUEST_DEBUG
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
@@ -153,6 +154,18 @@ struct kvm_sync_regs {
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
index cdb148e..cd8be47 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -948,6 +948,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_BPB 152
 #define KVM_CAP_GET_MSR_FEATURES 153
 #define KVM_CAP_HYPERV_EVENTFD 154
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 155
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.7.4

