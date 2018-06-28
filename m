Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7191752wrq;
        Thu, 28 Jun 2018 02:18:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdSeX41MMPpelQKCbmzQ3QvnU8HeqKbb7FealDykgVMbKZeORw+ktA9RfHsz+nciTDbnzCA
X-Received: by 2002:a0c:e28a:: with SMTP id r10-v6mr8306675qvl.172.1530177510469;
        Thu, 28 Jun 2018 02:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530177510; cv=none;
        d=google.com; s=arc-20160816;
        b=aRjaLKAAQDg5HTIYMZEGkqQ4iWsy/zjXMHsOPtsK6UyGXz4Wa4faL1HpnfMD3rrzRX
         Tb3U4Pc662X46zdzr9pg0zzhOc++Tou0T6HvEQXCyl5iddpp482Nx1LacmgwPkHo9k6/
         VUddw0EAh3VbfWV9CRR9s1VMHLU+iuFoPsYqiioidIpPahHHCe3oXp0mxE2j6Zd7ACsy
         8ZxRx7C1iDdsv0hpfKNcd3ztrwnAgw+6mv4/5OqXlfCjiox+vXwJHhFrVXNpDcD+hH8c
         wjFYyma7/fAna+Ud/euAIjTENwYjprZbjupUUJUqjJcZeCy/pnUAp9QY+VeIzsoZT2b7
         CG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=VDFmkzXcEuo6z0M88gUDe+/Asp73NYhyF3m4QcYa//I=;
        b=WRQhk4u8//ZdU318L7DO/hFhzUbgLc++bCC2REatjoEQZzwV6dE1z4ua7YvuBPssYJ
         uWD/aUmjsfzC8s73xuN7SXYvs7j5+vwgbT6nvOUROYAe75h0kczzxw0CBfKNE/tjQMIN
         ha4T8lOFaho/3hXHvQymnrNlAsSfjVmtIjuhakXod4sl1K3HUf5xCBx2e1GLylEedl+/
         I9h+fNgWSaxRXf/96IzCSpz+62S/Hq779N7oCAU1A1skNvk12Q2X9MJowsqj/zcxViN4
         3xCYYvlykXjKpDSYm2K1jNgiIE4DViAEMvVctZET4bwL0Q3kwDfKT/xBAxFX7Iu/qmAZ
         0jCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i41-v6si2186368qvd.67.2018.06.28.02.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 02:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYT4P-00069h-Vp
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 05:18:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fYT3s-0005vU-Pi
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fYT3p-00068P-LV
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:17:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2631 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fYT3p-00062Y-86; Thu, 28 Jun 2018 05:17:53 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 88E29F6B12995;
	Thu, 28 Jun 2018 17:17:33 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 28 Jun 2018 17:17:24 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <zhengxiang9@huawei.com>, <gengdongjiu@huawei.com>,
	<linuxarm@huawei.com>
Date: Fri, 29 Jun 2018 01:22:40 +0800
Message-ID: <1530206561-22348-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530206561-22348-1-git-send-email-gengdongjiu@huawei.com>
References: <1530206561-22348-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v4 RFC 1/2] linux-headers: sync linux header
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
X-TUID: xd+gkwo/Fguw

Import KVM_CAP_ARM_INJECT_SERROR_ESR and struct kvm_vcpu_events
for arm64, they are added manually in the kernel tree, so it will be
added after re-running scripts/update-linux-headers.sh. This linux
header sync is based on 4.17-rc7, linux kernel tree commit is
b04e217704b7f879c6b91222b066983a44a7a09f

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
1.8.3.1

