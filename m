Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2035881wrq;
        Thu, 7 Jun 2018 05:26:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ1yz5dL5NYGrnPIOwDtkNZVtSh7S0llhUiLjJhtc/5+/ZFnR3sZkHFfuowIK9wuN57Denq
X-Received: by 2002:ac8:2a46:: with SMTP id l6-v6mr1517422qtl.118.1528374388511;
        Thu, 07 Jun 2018 05:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528374388; cv=none;
        d=google.com; s=arc-20160816;
        b=MF6K69XSwT8A+YaapYa/9YwebW5MVQHdretugzzTOysL9Z0JM86uKq1B9JjLoCcUa+
         fRaoOBdgTfUtDymBDj/L+FgZLZqNYjFtX2fLzeFolao55nwQLUcazdILsaPm7hCHuDq7
         JA5nsX+V2Lk0LtsQDaYJFIrqQcuxTsqyr7hihliaNFUK3C6ls4IU9AonOf50OxLK6oEz
         4n3HorgtxmDHlwz2fXcciQh6+yw+WE7uBgyLoerSz+9rnS/g2rB3MqDl+x1As573S3zh
         lrBib0ZgvFOehWSF0hDdBzXltq/tRL3O1YgXKu4c8kqTtlrlj7wHv1JCguOvlQN7/lhB
         bPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=UsTcq6K1Nhr7p48IkL54ufG7IL26wpcCOmSdhjOCKoI=;
        b=v6O2Q3Ity6zLv2yXIpl/21em61VuFhGTLnkCo5aJKnIq4ARkVxeeYpjtzEFWlkvctV
         HpaVHB1CAG86cvdyXzJyZfKoRL8a6s2UejF/cRM4fnqyEssbXwDHZVJ7aeYWJmvwq05k
         WGIbupXCUThFS4cngR9MOEsiL2i8Zwym7JvnMsS1IqLux60LD1T3zQMXbC9ZhkjRE+XX
         R+s7PiYQE18bP+PkAsirs21zv6KEk3SesrBhwznHBE2ZZL72/7RjyE5LAbruFOr2PEcA
         Ot+a1ln2mEfZL4f6lMq/PeVbv2I7kQhR5Z/Ru3QpjbKIqkd1HP3F3MgmJ8VX+/RWQ3e1
         ADvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10-v6si2123866qvd.227.2018.06.07.05.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 05:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQtzn-0003Dh-Vs
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 08:26:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQtzG-0003B7-PU
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 08:25:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fQtzF-0005q2-NM
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 08:25:54 -0400
Received: from [45.249.212.35] (port=47998 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fQtz9-0005l3-Hz; Thu, 07 Jun 2018 08:25:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 43D8629F9EA4F;
	Thu,  7 Jun 2018 20:25:42 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 7 Jun 2018 20:25:37 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Fri, 8 Jun 2018 04:30:59 +0800
Message-ID: <1528403460-30526-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
References: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH v3 RFC 1/2] linux-headers: sync linux headers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SU84O+AHqXjh

Import KVM_CAP_ARM_INJECT_SERROR_ESR and struct kvm_vcpu_events
for arm64, they are added manually in the kernel tree, so it will be
added after re-running scripts/update-linux-headers.sh.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/asm-arm/kvm.h   | 12 ++++++++++++
 linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
 linux-headers/linux/kvm.h     |  1 +
 3 files changed, 26 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 670b43c..058dce6 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -124,6 +124,18 @@ struct kvm_sync_regs {
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
1.8.3.1

