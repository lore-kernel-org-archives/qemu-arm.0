Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp453567wri;
        Tue, 5 Nov 2019 01:12:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMAEybYf3cNiGIqlC9P+1hzDhn+bOud09ifwKaaoXgD4UDYACTR9CR0yGrmX/dZs2U6S0I
X-Received: by 2002:a37:8dc2:: with SMTP id p185mr18027807qkd.7.1572945160124;
        Tue, 05 Nov 2019 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945160; cv=none;
        d=google.com; s=arc-20160816;
        b=bhTvda3oiWnK8Xq2SjLqkKpCX5A33asF1zfCRH3OPYXwEIBDjqb5cY62RUiNhDUVCa
         b3RhkFn668TnyX6Lwsmcs4s/Kr1VxQloWEnZGfbGg1xTcganXq7mXO7RRE/rtex2nOd2
         0wyBP8OdYK26B63XTkKcYjBseghRiSymOAfTBNhiAQYhv9j2PnXiMtVYJEOs32yKusyd
         IRr3NnNqWrXTuk1uwRMCEaBNQj+3wwkoVoukTuYd/CkBb/IgY1mgaSg5zjWotfeTMOSq
         iQ6TFa0OgwwLe0kf2/ockL5yuH/xcaZ08A+409pdjhR1f2QS1qanYEOmoq+Tne4KTcWD
         cl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=AU9jnjhnzVC601YSebITylchpDete/uNAu0dhW2S5J4=;
        b=dd+rM+QAnlrzEJZ45Iok+a35rBZs3nHVqBSEHX8wh5I+27+YU6xyD0crpQmGYXaGYj
         3JJAdM3CCGCcaChjXbWLjp59Lrnxd+g0N3hZh5BnacF2+3JDAWoY+Zds5LK5Eyj3ZRm7
         iXHt1/e1w4Fy6jrUL5IKpIOMc+e5R8FP0uEjz+cXVi9/nOF1ILeEhtOlkrpCup9/PxX2
         Zmmn9TE5VluSDKOirquMrFj7ZbNNcJqY5DlfMbuMi/qWGIhDDVfedg4TPzL8io64nGof
         A7s2NqpxO0SYYuThReSI83bBJgPJCoFUYgrQvxr7wu940iMQ4ZnX4IRrtbG9+4+qhPgq
         bnMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h128si14365685qkf.233.2019.11.05.01.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRutC-00054L-NM
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusu-00051H-Ig
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRust-0007jZ-AH
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2191 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRuss-0007hi-V5; Tue, 05 Nov 2019 04:12:19 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 25CF166D1E71EF4D29B8;
 Tue,  5 Nov 2019 17:12:13 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:07 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 08/14] core/irq: add qemu_irq_remove_intercept interface
Date: Tue, 5 Nov 2019 17:10:50 +0800
Message-ID: <20191105091056.9541-9-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 James Morse <james.morse@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EDyGDHbXQO7I

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
index 7cc0295d0e..114bce6c21 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -145,6 +145,17 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_i=
rq_handler handler, int n)
     }
 }
=20
+void qemu_irq_remove_intercept(qemu_irq *gpio_in, int n)
+{
+    int i;
+    qemu_irq *old_irqs =3D gpio_in[0]->opaque;
+    for (i =3D 0; i < n; i++) {
+        gpio_in[i]->handler =3D old_irqs[i]->handler;
+        gpio_in[i]->opaque =3D old_irqs[i]->opaque;
+    }
+    qemu_free_irqs(old_irqs, n);
+}
+
 static const TypeInfo irq_type_info =3D {
    .name =3D TYPE_IRQ,
    .parent =3D TYPE_OBJECT,
diff --git a/include/hw/irq.h b/include/hw/irq.h
index fe527f6f51..1af1db93bb 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -56,8 +56,12 @@ qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
  */
 qemu_irq *qemu_irq_proxy(qemu_irq **target, int n);
=20
-/* For internal use in qtest.  Similar to qemu_irq_split, but operating
-   on an existing vector of qemu_irq.  */
+/*
+ * Similar to qemu_irq_split, but operating on an existing vector of qem=
u_irq.
+ */
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, =
int n);
=20
+/* Restore the irq handler intercepted by qemu_irq_intercept_in() */
+void qemu_irq_remove_intercept(qemu_irq *gpio_in, int n);
+
 #endif
--=20
2.19.1

