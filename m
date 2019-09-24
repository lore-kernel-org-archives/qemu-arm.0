Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045437wrp;
        Tue, 24 Sep 2019 08:23:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIJzMxxTWs3Jx7SRevB6GMaOKR5tVgUUwmPXwbKqMEuANDgVdOwdYFz/DMysf895ntiZkk
X-Received: by 2002:a37:9503:: with SMTP id x3mr1273610qkd.418.1569338620618;
        Tue, 24 Sep 2019 08:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338620; cv=none;
        d=google.com; s=arc-20160816;
        b=D3vzqMcQOA9S2DKlc7407Hbwa+iGZevVErwN/kOazVYuBIINE6auGr5+/eKvjtpDo4
         L2fH7oZs7SeVgEPV/ZiX0lgwjoBE2G4GHVACLdYMBKlj1PHpL5xD+A1+USGrOhwQVcTB
         STldkztc1P8XbuBnVL2WjTI1U37KLLcPJHGhvRnj0Xab4Ek0xmA11owchkyTBaqFMcoI
         gnxd2kpPXxFps8p/M30MYuspuKdP4PWFm2j9S993LvBPDdF5zUhgnJtqMgxVUdAVRfWS
         L2AGsriCcD8Ff4OF8VSuhn9zl5bw9pMuvQd37uPrSB4/qZUzllcXNGZa1zP/SjHGl2Au
         D0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=369mpe7VUwlPnJKHR2YJ8H6FUDRwfCuVDnLcX6+VeBU=;
        b=tq7eYa/cHb8h3Nw04V1q9nwjl7/cv7xQgOQYic3IsVjhAICBfpsbQ+Izfsq3qIs7wa
         F59Q22i92e9D2m4GLBO5INe4eWMreFD2uP7mcSneR/Ovy6BfnNYMrl2ljCldy5AYvcZ3
         XdUm3xFndc/a92HSw6goEFt4zQfkAgxXKGWkMgUKaz1t49lMewQqPSfARDS+ZXgx9feo
         NVnJDphGVfKvhFAEWxOZkJksxd44ReZeOZK0AZc00b8h1Mj/ZzAeZxeD4a9Jj+FO86u/
         IX9yMYZ9gilI4V1ZGS8fHjt2MuheHUNxD5kx8U5p2vTUUoFuZ0e9/ye9PwaMe0dJtpFV
         /hkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id h26si1291829qtq.18.2019.09.24.08.23.40;
        Tue, 24 Sep 2019 08:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4F3CF4A6DA;
	Tue, 24 Sep 2019 11:23:40 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ild3r7t3ZmNH; Tue, 24 Sep 2019 11:23:39 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8C19F4A6B2;
	Tue, 24 Sep 2019 11:23:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3CA114A691
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:34 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaStOtPe84qg for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:33 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 14EB64A650
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:33 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 51FF67C2680FDC283024;
 Tue, 24 Sep 2019 23:23:27 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:18 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 06/12] core/irq: add qemu_irq_remove_intercept interface
Date: Tue, 24 Sep 2019 23:21:45 +0800
Message-ID: <1569338511-3572-7-git-send-email-guoheyi@huawei.com>
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
X-TUID: cM1A9Wnlz0uG

We use qemu_irq as the bridge for other qemu modules to switch from
irq injection to SDEI event trigger after VM binds the interrupt to
SDEI event. We use qemu_irq_intercept_in() to override qemu_irq
handler with SDEI event trigger, so we also need a corresponding
interface to restore the handler to default one (i.e. ARM GIC).

qemu_irq_remove_intercept() is the new interface to do the above
job.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 hw/core/irq.c    | 11 +++++++++++
 include/hw/irq.h |  8 ++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 7cc0295..114bce6 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -145,6 +145,17 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
     }
 }
 
+void qemu_irq_remove_intercept(qemu_irq *gpio_in, int n)
+{
+    int i;
+    qemu_irq *old_irqs = gpio_in[0]->opaque;
+    for (i = 0; i < n; i++) {
+        gpio_in[i]->handler = old_irqs[i]->handler;
+        gpio_in[i]->opaque = old_irqs[i]->opaque;
+    }
+    qemu_free_irqs(old_irqs, n);
+}
+
 static const TypeInfo irq_type_info = {
    .name = TYPE_IRQ,
    .parent = TYPE_OBJECT,
diff --git a/include/hw/irq.h b/include/hw/irq.h
index fe527f6..1af1db9 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -56,8 +56,12 @@ qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
  */
 qemu_irq *qemu_irq_proxy(qemu_irq **target, int n);
 
-/* For internal use in qtest.  Similar to qemu_irq_split, but operating
-   on an existing vector of qemu_irq.  */
+/*
+ * Similar to qemu_irq_split, but operating on an existing vector of qemu_irq.
+ */
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n);
 
+/* Restore the irq handler intercepted by qemu_irq_intercept_in() */
+void qemu_irq_remove_intercept(qemu_irq *gpio_in, int n);
+
 #endif
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
