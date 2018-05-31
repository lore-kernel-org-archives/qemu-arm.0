Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5457059wre;
        Wed, 30 May 2018 20:38:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL30KFdLwIFhA6MZlM7BlTz/IPrNRMGqWRSJEGNw3MkKFa7pgqEciqmreEJ7UKbp9utst85
X-Received: by 2002:a37:4e97:: with SMTP id c145-v6mr4883019qkb.151.1527737939463;
        Wed, 30 May 2018 20:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527737939; cv=none;
        d=google.com; s=arc-20160816;
        b=mTONbxoa9Ky5815SBfR/+Eh9Q/6IDc/qcYdjG0mTmthaOKpvoWfEii2k7FxdN8DfrN
         ua6SZaSaI7aZfAJ0zvlTjLg+yjvc3pzclFAzSznoQbQhCGZ5UUAp8mOBnQJvCp+xD3Gn
         k1PAGH1BwRJoHIUCgRdhuW/1d36UE/jIj5v+W6L6EOO16QOqT4Uw24ZtuU9AGnhdZNJg
         5E5tS3zTGFSz/YDA6uCSdMncd+c/gwgmdpCpxEcGHDkz2g0GVGvdQczUFFuFLsTroeX3
         6Ka4cyKv4oThj7DlgqGdSPiuw9skyeF9SIhOqj8+osw8qaqJN2WeqELsThO5LuwfZzgs
         REnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=novJ6G+ATjP3WzEBsoOMTJmGgS3+1Nuz4jS2pu5K0a8=;
        b=Y1+Sbsa/kcL8ODtd2rCNX+f0+OIwlYEjfUtbzIGXddIGoVOKFOg80D2z/d0vqz8rY9
         3Bdeu7WnOkF6M9ovIhx7/WFgqMCoc1NDxmkbbC7PnX54eVUMoT7EAiuBHE5EgjX4YRnC
         r6yUeJB/kj8Epm2mpDDSgf+cWioKK+3KtXkvklAMyY3+BJ3fTdcztGio3fdXNcGtmbwV
         qVif0TuTqXHHn3zQw+4cE8oryGwY5hdm0UUtuGAY7Vlx/n2ZxdVEw1CKD7hZ2Ut/LzPb
         vA25dKKJpk98+wi34wqwwZDqs6QU8wWQ0J7v4XI1bs7AagKrKIw/qH8s/yEpZzlWIYrp
         Vo2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20-v6si7481342qtq.80.2018.05.30.20.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOEQU-000340-QK
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:38:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEQF-00031n-Bz
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEQE-0007EX-9y
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:38:43 -0400
Received: from [45.249.212.32] (port=33520 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOEQD-0007CY-UV; Wed, 30 May 2018 23:38:42 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id AD89888087AC9;
	Thu, 31 May 2018 11:38:37 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:38:28 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Date: Thu, 31 May 2018 19:43:56 +0800
Message-ID: <1527767037-6105-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527767037-6105-1-git-send-email-gengdongjiu@huawei.com>
References: <1527767037-6105-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v1 2/3] kvm: sync linux headers
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
X-TUID: WzhPYMyFTT1i

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

