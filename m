Received: by 10.223.159.82 with SMTP id f18csp1393361wrg;
        Mon, 27 Nov 2017 02:44:51 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb/zGs69VRC0DRZIOjRqPDURnDXu3laIW9kzGZVfv/FqVlUddPA34SEUo+it0DgNqn1Hq7N
X-Received: by 10.13.222.133 with SMTP id h127mr23452096ywe.351.1511779491740;
        Mon, 27 Nov 2017 02:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779491; cv=none;
        d=google.com; s=arc-20160816;
        b=jiXqK8ore4EcH9himTPluvxXUcluD5n+4jL8ZzS3gB+wHSR733+lku8j/z/hv+jhdN
         bgVBWgG6hJL34BXgB5d/tPKpjw8CucdAN0Ti8KFpovUMRUDEBwcv8bBFS8kNd5MhkMkq
         GfMRJPvWX+JqWsOoErCQz9HKrvejDL1IvxFwefgrbfYK9Xk7vENrLTopldT+CzD6Dcp0
         fRmhg8GQHwN4STWdEB3FX1NMBwl3YwUsD7YSHIq41fi41DOx8wqppuPyxPK4/jXfy8W4
         bdMdoD6humOHrDW30cQUy8CeZYSC9CSmb+0Mx8qGVbAtl3nE/df/6VgXG0R4TYKLlQCq
         WXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=L9LMR0LgE491w8bnMumfPC5kH085A6ueYrYxY4ge5yw=;
        b=YAvusUjcp1ctw+8JEfmmUOr2gsFR9btU1IYPtbwm7s97ZOrPvvCOMed5qSkDsHRBjU
         5bT/E2jgjSy3ghY7FLYtpA5a/CTqlYyjo+9vwy1a4brQM8z+DcMfXvyR8U+KnXAqZv6S
         nww4JyIhrt1hPkw+syab706wYlRopribkft+PXiLGjg9yGnlcr+W8LW7vElhOlE07EPK
         6EEojWwM2ew8Cg5wDiYRxNVFEStSTe9p21fAPZyP/v+5HJzYub70WQ9beLPJtOHGwbJF
         idz6ZF4AoZKrEqWpQaJ/8gyKtxoi01eNiOFIO/Oq1W2TbW89jtPoe0vVgrBW2H6HhoUr
         t4iA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si2331751ywk.517.2017.11.27.02.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Nov 2017 02:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJGuB-00026O-5A
	for alex.bennee@linaro.org; Mon, 27 Nov 2017 05:44:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1eJGty-00025q-4J
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 05:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1eJGtt-0007e7-Sc
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 05:44:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2110 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1eJGtt-0007cv-Bj; Mon, 27 Nov 2017 05:44:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8B971620DE0C1;
	Mon, 27 Nov 2017 18:44:25 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.361.1; Mon, 27 Nov 2017 18:44:19 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
	<marc.zyngier@arm.com>, <christoffer.dall@linaro.org>, <rth@twiddle.net>,
	<ehabkost@redhat.com>, <kvm@vger.kernel.org>, <guohanjun@huawei.com>,
	<lijinyue@huawei.com>, <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
	<zhengqiang10@huawei.com>, <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, 
	<qemu-arm@nongnu.org>
Date: Tue, 28 Nov 2017 02:49:48 +0800
Message-ID: <1511808595-24158-6-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v13 05/12] linux-headers: sync against Linux
 v4.14-rc8
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
X-TUID: 292jy7YCQOuT

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Peter's comments to sync mainline Linux header file in [1]
Address Michael's comments to not sync SPDX from Linux kernel header file

[1]: https://lkml.org/lkml/2017/9/5/575
---
 linux-headers/linux/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 7971a4f..06a217f 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -929,6 +929,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SMT_POSSIBLE 147
 #define KVM_CAP_HYPERV_SYNIC2 148
 #define KVM_CAP_HYPERV_VP_INDEX 149
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 150
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1355,6 +1356,8 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_S390_CMMA_MIGRATION */
 #define KVM_S390_GET_CMMA_BITS      _IOWR(KVMIO, 0xb8, struct kvm_s390_cmma_log)
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
+/* Available with KVM_CAP_ARM_INJECT_SERROR_ESR */
+#define KVM_ARM_INJECT_SERROR_ESR       _IOW(KVMIO,  0xba, __u32)
 
 #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
 #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
-- 
1.8.3.1

