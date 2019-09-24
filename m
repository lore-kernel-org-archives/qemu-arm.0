Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045468wrp;
        Tue, 24 Sep 2019 08:23:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1rwRPzAHnGw8h4JSSx6c7dN/TbEq1XW+oJc1AZ6uULdkrGpSO4IMUrhpMoUmprd4gZFqo
X-Received: by 2002:a05:620a:15d2:: with SMTP id o18mr2912655qkm.341.1569338621831;
        Tue, 24 Sep 2019 08:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338621; cv=none;
        d=google.com; s=arc-20160816;
        b=nEgA/HNVKZhYke8SwJgBDdiJQ2rWBOKVdkF6oJPe1eRR+BomChkWGPF1IavSDjc0Sm
         RCY0wBlP8ETKz89HDf0bb+lDYrM7haQ2vvDgr9YZacrr5Z9FO+oGnqvC1Gy73Q3YGjTG
         vr3ilbAJDIKM0ynY2DxWhFCAb12KW4eFz+nXgUOP0zJAwobIkKVEGY4nci176WnOz6Z0
         Uhu5btH8RiMs3S38sHymRMfDBFXnxw9/zfzPfdeLcHqsEFrWXGt090yja+b3vkAgbRjN
         /Z7AYcSui7gHLFopP5OWek/bGTA7fpES8QLC7JGQKHhib9GUYLEkBZTlydyMbFUcOgAA
         il9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LudcK1EYKiQlZUcrTYvhskMcGuqBIoydOQEyExYvlDQ=;
        b=xuMhJLNF2wOMLnjra5B0KecToY5UVWtHdvMiGmLBgyYji5gz2pzWItwM7G/vcbEylM
         DCuIA/Hesa8sGTWDccrNcibo/bZvxza94ZIaCi7s7Hjj0n0sV78Pzol7kxwBTbmmNTF4
         V82GWhW+xC9OcSBSXnXiugbyskZC1QilFQF6hrwnG6jJY3dqORosc+B6P9nSdq5nKbNv
         Kccn6bkRh3JEJby7+hEMxpV8PqbpsK53rVd+/hsDF4Lk9ENpTfy4cKKYHHfw/vkuwOiC
         WhU9DMPhdw0abdZ0SrYxWrB0GSob4KDrZ25ADNjWP7UVjYdNCm3GDH90Go6Qfob9iYWt
         Wpog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id b18si1361352qkl.303.2019.09.24.08.23.41;
        Tue, 24 Sep 2019 08:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8A2794A650;
	Tue, 24 Sep 2019 11:23:41 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UT2XvcmmKGDe; Tue, 24 Sep 2019 11:23:40 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id AAAD24A6CC;
	Tue, 24 Sep 2019 11:23:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6E71D4A6A5
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99MzbqiMlFIg for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:36 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 2FF774A6CA
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:34 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 619AEE0D577D65100598;
 Tue, 24 Sep 2019 23:23:32 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:21 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 11/12] arm/kvm: handle guest exit of hypercall
Date: Tue, 24 Sep 2019 23:21:50 +0800
Message-ID: <1569338511-3572-12-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <marc.zyngier@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 Dave Martin <Dave.Martin@arm.com>
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
X-TUID: +7NTajc9mEs+

Add support to handle guest exit of hypercall, and forward to SDEI
dispatcher if SDEI is enabled and it is an SDEI request.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/kvm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b2eaa50..97a67b1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -30,6 +30,7 @@
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
+#include "sdei.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -668,6 +669,19 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 }
 
 
+static void kvm_arm_handle_hypercall(CPUState *cs, struct kvm_run *run)
+{
+    uint32_t func_id = run->hypercall.args[0];
+
+    if (sdei_enabled &&
+        func_id >= SDEI_1_0_FN_BASE && func_id <= SDEI_MAX_REQ) {
+        sdei_handle_request(cs, run);
+    } else {
+        run->hypercall.args[0] = -1;
+    }
+}
+
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     int ret = 0;
@@ -678,6 +692,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             ret = EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
+    case KVM_EXIT_HYPERCALL:
+        kvm_arm_handle_hypercall(cs, run);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
