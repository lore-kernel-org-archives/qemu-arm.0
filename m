Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045314wrp;
        Tue, 24 Sep 2019 08:23:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvMBV0P2ppHt4qcJBeuuZxJoYzVHpdIXmgkaOfIvCIsvGFcyZkiu3tWjzZdPQaEhuk3qrj
X-Received: by 2002:ae9:e109:: with SMTP id g9mr2719144qkm.345.1569338615437;
        Tue, 24 Sep 2019 08:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338615; cv=none;
        d=google.com; s=arc-20160816;
        b=xKL/fomKeK5xbNO3sO7xbtVqgyAmqgxhVJkhbTkLXtx6Fd2nJDi370uwwW8YzYDWHN
         a1Ok02XYdwhlECUnty3Xap67kXIi+PrAzQp0G4IXY54bOCGPvjyL2/GzQnNn7/DVV4tu
         5sVVGWsAGrn814xse+PgCvAaVgnSJ00TtDD03KEbXX3E5IXEQEJXHxDKPjtYybC46oYS
         XwZkZ6J+ZRgogDAkKg0iO+RT10oD01nH9W9yanwQwzHWtUGOIGgzHVcpAHxTI47fuPwo
         8ZPY5j3JXSslonuJozmH/3Clf5qsde4hJAK8H4hfWqTQfsPSC1lGbU2Dzqo92NyURscb
         87YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=MQmomjs5U01kJ+fuBhAFof7P8XZsnlwmYNBAPCIWqd4=;
        b=Haje8RQ+hX+U4/2gnp9FMDZqJ2p+35sxh5O6lmon+q1L8L5Ix1+LmxLGbjH+iuklue
         JCFUuHJXVziGcAlL9mbhihWx67Sdeg39RI5u5335Q1cPCh3HF8xQUrseJUYN5fFAQqib
         /1pcnsiNsgA6MgCqTT6mOeLprVYgmquLC92ZiXPIt1t4DYUGyZttQsjjCwbcI/mnoO85
         tJnFPzvyiXEotNUy6BRXnG5rKR57jfku7iPJDBV52TA2o+DT2GuI4M2CD2dX6004Pmbm
         7qYDNAPmmxmqKFvB3rLdXeQV77yoAM/OQLOWfLK92TOJ42528Eq1JlJMHvBPT3R4kjn3
         DEBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id n129si1455556qkn.268.2019.09.24.08.23.35;
        Tue, 24 Sep 2019 08:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 18EC14A6D0;
	Tue, 24 Sep 2019 11:23:35 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIvFfXRaaM4C; Tue, 24 Sep 2019 11:23:33 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EC3B54A681;
	Tue, 24 Sep 2019 11:23:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 80AD44A66F
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:32 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S86PFoBzTHOG for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:31 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 77B084A67B
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:30 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5EA36BE9A1306E7B3A53;
 Tue, 24 Sep 2019 23:23:27 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:17 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 05/12] arm/sdei: add support to trigger event by GIC
 interrupt ID
Date: Tue, 24 Sep 2019 23:21:44 +0800
Message-ID: <1569338511-3572-6-git-send-email-guoheyi@huawei.com>
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
X-TUID: UlFDYmUUlEM+

Add an external interface to trigger an SDEI event bound to an
interrupt by providing GIC interrupt ID.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/sdei.h |  7 +++++++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index f9a1208..088ed76 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -453,6 +453,29 @@ static int64_t sdei_version(QemuSDEState *s, CPUState *cs, struct kvm_run *run)
            (0ULL << SDEI_VERSION_MINOR_SHIFT);
 }
 
+static bool inject_event(QemuSDEState *s, CPUState *cs,
+                             int32_t event, int irq)
+{
+    QemuSDE *sde;
+
+    if (event < 0) {
+        return false;
+    }
+    sde = get_sde_no_check(s, event, cs);
+    if (sde->event_id == SDEI_INVALID_EVENT_ID) {
+        put_sde(sde, cs);
+        return false;
+    }
+    if (irq > 0 && sde->prop->interrupt != irq) {
+        /* Someone unbinds the interrupt! */
+        put_sde(sde, cs);
+        return false;
+    }
+    sde->pending = true;
+    dispatch_single(s, sde, cs);
+    return true;
+}
+
 static int64_t unregister_single_sde(QemuSDEState *s, int32_t event,
                                      CPUState *cs, bool force)
 {
@@ -1033,6 +1056,21 @@ void sdei_handle_request(CPUState *cs, struct kvm_run *run)
     }
 }
 
+bool trigger_sdei_by_irq(int cpu, int irq)
+{
+    QemuSDEState *s = sde_state;
+
+    if (!s || irq >= ARRAY_SIZE(s->irq_map)) {
+        return false;
+    }
+
+    if (s->irq_map[irq] == SDEI_INVALID_EVENT_ID) {
+        return false;
+    }
+
+    return inject_event(s, arm_get_cpu_by_id(cpu), s->irq_map[irq], irq);
+}
+
 static void qemu_shared_sde_init(QemuSDEState *s)
 {
     int i;
diff --git a/target/arm/sdei.h b/target/arm/sdei.h
index a69a0e4..a61e788 100644
--- a/target/arm/sdei.h
+++ b/target/arm/sdei.h
@@ -31,4 +31,11 @@
 
 void sdei_handle_request(CPUState *cs, struct kvm_run *run);
 
+/*
+ * Trigger an SDEI event bound to an interrupt.
+ * Return true if event has been triggered successfully.
+ * Return false if event has not been triggered for some reason.
+ */
+bool trigger_sdei_by_irq(int cpu, int irq);
+
 #endif
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
