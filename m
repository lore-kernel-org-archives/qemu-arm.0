Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045380wrp;
        Tue, 24 Sep 2019 08:23:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLW34rcvd/FvcABbhMFitzO0Mt+msPJnJJXUwY8Og/TWyv6wyU8Bk2s3pOJcoeImGZCAtH
X-Received: by 2002:a37:a68e:: with SMTP id p136mr2935419qke.49.1569338618072;
        Tue, 24 Sep 2019 08:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338618; cv=none;
        d=google.com; s=arc-20160816;
        b=i3H2otyT+1IC5KNN9qY5JB3x0XaPN3yqwiklhwgQ5jtIwaU9pw32QA0Uc/3HZYiQ3y
         2HLAtIBpReLd19ULC2Go5t2vPKKH5eT/Vh4l+W1v7NifmkO2svW94DuWvi7xYle4/3yJ
         Orz0QWqJ4AIFglOQoR+IPajEXPDcLuZca9JH9pkHZZfCRIHeMsP4diCR94RGO9ip9lPi
         B8Fay2MGqGcEGQaRdcUhj9cZmSdPwJ/KV2v2zJQR+nE8vzGibOgcfcIhJrwL7wtm3c2W
         IbG8e0Dd0bRfFwUdDbb7WP+VIILGYlaznyVzH0mP4FHaZR1VGnvPdLq1tfYPtja7qd3w
         0wlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=N63jhOzgmqQrsk5Nt2pCcyoKtQVQtsEDd6+UWXWRuOk=;
        b=lLnsypBO5dXULVyB+qqDT6geIBYvzAWhaezUE/gv8otM2qzElxTghbwXLrIMEDhh7L
         ARlTsJuaPhar/cX3rVVzIt/ebuKQTRFmYkWAcLOearGGeOLh15KuHd9klLeCgzAPAlmz
         j4an0bdEbo+n6DOqdX3xN8H0XTsdCrOtknAio2HLRxHzAo9+d+0f9VPXVIMf0s5SKPJk
         NshBXOby9/ibAEUiOvnILc9KtPsUnuDH8nIkhRy+B6HYNZJLLWh1Dpco7QqoRkyn0o18
         z5Hfw13Xhv5e2BJ/kft2c+8MVxY6oc2GtX9fJOU8i4u/AXHUC6YXU0CwzfWFzK2wUsuJ
         jwMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id p48si1453449qvc.84.2019.09.24.08.23.37;
        Tue, 24 Sep 2019 08:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C350E4A6CF;
	Tue, 24 Sep 2019 11:23:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIYrlfDQkgYT; Tue, 24 Sep 2019 11:23:36 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 3EE124A6B7;
	Tue, 24 Sep 2019 11:23:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 0C8214A64A
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:33 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivpj9-RlOdjX for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:32 -0400 (EDT)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id E25CF4A650
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:31 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 89D0CC4FB6F9F57E2490;
 Tue, 24 Sep 2019 23:23:27 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:20 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 09/12] linux-headers/kvm.h: add capability to forward
 hypercall
Date: Tue, 24 Sep 2019 23:21:48 +0800
Message-ID: <1569338511-3572-10-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Heyi Guo <guoheyi@huawei.com>, Dave Martin <Dave.Martin@arm.com>
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
X-TUID: 3DlWA9aUhhcl

To keep backward compatibility, we add new KVM capability
"KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
hypercall to userspace.

The capability should be enabled explicitly, for we don't want user
space application to deal with unexpected hypercall exits. We also use
an additional argument to pass exception bit mask, to request KVM to
forward all hypercalls except the classes specified in the bit mask.

Currently only PSCI can be set as exception, so that we can still keep
consistent with the original PSCI processing flow.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-headers/linux/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 18892d6..20e8a68 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -711,6 +711,8 @@ struct kvm_enable_cap {
 	__u8  pad[64];
 };
 
+#define KVM_CAP_FORWARD_HYPERCALL_EXCL_PSCI (1 << 0)
+
 /* for KVM_PPC_GET_PVINFO */
 
 #define KVM_PPC_PVINFO_FLAGS_EV_IDLE   (1<<0)
@@ -995,6 +997,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_SVE 170
 #define KVM_CAP_ARM_PTRAUTH_ADDRESS 171
 #define KVM_CAP_ARM_PTRAUTH_GENERIC 172
+#define KVM_CAP_FORWARD_HYPERCALL 174
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
