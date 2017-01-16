Received: by 10.25.205.13 with SMTP id d13csp1289636lfg;
        Mon, 16 Jan 2017 01:29:08 -0800 (PST)
X-Received: by 10.237.36.238 with SMTP id u43mr30580161qtc.51.1484558948542;
        Mon, 16 Jan 2017 01:29:08 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u11si5315210qte.278.2017.01.16.01.29.08;
        Mon, 16 Jan 2017 01:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 19CAF40664;
	Mon, 16 Jan 2017 04:27:17 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.493
X-Spam-Level: 
X-Spam-Status: No, score=-1.493 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	UPPERCASE_50_75=0.008] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkiUC97LXuQ1; Mon, 16 Jan 2017 04:27:09 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1DE9540666;
	Mon, 16 Jan 2017 04:27:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 53A624018B
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:27:05 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NacDeosmmTU for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:27:01 -0500 (EST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id A250B400E9
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:26:38 -0500 (EST)
Received: from 172.24.1.136 (EHLO szxeml426-hub.china.huawei.com)
 ([172.24.1.136])
 by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DXW50567; Mon, 16 Jan 2017 17:28:09 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:27:59 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH RFC 2/6] target: arm: Add the qemu target for
 KVM_ARM_TARGET_GENERIC_V8
Date: Mon, 16 Jan 2017 17:26:57 +0800
Message-ID: <1484558821-15512-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020206.587C922E.01AF, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 55dd8b30267b0e0b4b777f1e06945666
Cc: qemu-devel@nongnu.org, wu.wubin@huawei.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 8MQ572yPIkGe

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 target/arm/kvm-consts.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index a2c9518..fc01ac5 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -128,6 +128,7 @@ MISMATCH_CHECK(QEMU_PSCI_RET_DISABLED, PSCI_RET_DISABLED)
 #define QEMU_KVM_ARM_TARGET_CORTEX_A57 2
 #define QEMU_KVM_ARM_TARGET_XGENE_POTENZA 3
 #define QEMU_KVM_ARM_TARGET_CORTEX_A53 4
+#define QEMU_KVM_ARM_TARGET_GENERIC_V8 5
 
 /* There's no kernel define for this: sentinel value which
  * matches no KVM target value for either 64 or 32 bit
@@ -140,6 +141,7 @@ MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_FOUNDATION_V8, KVM_ARM_TARGET_FOUNDATION_V8)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A57, KVM_ARM_TARGET_CORTEX_A57)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_XGENE_POTENZA, KVM_ARM_TARGET_XGENE_POTENZA)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A53, KVM_ARM_TARGET_CORTEX_A53)
+MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_GENERIC_V8, KVM_ARM_TARGET_GENERIC_V8)
 #else
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A15, KVM_ARM_TARGET_CORTEX_A15)
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A7, KVM_ARM_TARGET_CORTEX_A7)
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
