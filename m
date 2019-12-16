Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5074954lff;
        Mon, 16 Dec 2019 12:48:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWYIY2V2Svs6D2fJHQb38fb13S8FccxPeRhAxvq7CUAPDRcFgrb6E2v2Velikgt/L2jEj3
X-Received: by 2002:a05:6830:1cf:: with SMTP id r15mr35342316ota.231.1576529325280;
        Mon, 16 Dec 2019 12:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576529325; cv=none;
        d=google.com; s=arc-20160816;
        b=TM6n9Hk2ZHSKg0o84n6I9q9C7AOjxOKYIDlGY+LYPiR+lOhkvhFK5QZqt2mus4w6e2
         Ch7PabYSy1TwaG89xLt8evs1mw7ex/I85gcje44rcYBr84Ul2PMoMe/QAjL1tCX2cEqu
         BC7M3Mq4HD1FGQxQCH1olXO02nDQSFCUBnOq5tYHm+zMMfIelWr3oYVtTj84+2gubp5L
         9nzqRg+ktwlEQygIG9BnDYrLVxbWoZyJ2I9DuosU8E5HaREwOOQ4XrSIbNOJCCBDIMkq
         GYvZx9UVFJ6kX5EJSAlAX2xTZ8kHL7aKOb6MKWBSOp22iAfZrXL+ICkuBT2i8/JoLWI8
         nlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=wIBn80+V74amPBupfe+F9anDq8XfKyQu39ZmejTiR10=;
        b=l7HCiZ8XuEpbgB/9IEtqIdAnNllH09Yn6f29dcY8mGOngBWNcuSWK2U8pbnHYcHsw8
         Qi3Nb/+lB2PZmgfoLtBk63tIehD8lZ+/JV71YT2eZ8dvV9qWSUoV5TN2xRzy3bA5JbgK
         hVclKn+4HOuMt5+1aOg4IwWR+bG+aQBgr6AlPtVK6gBhyNAPjByoJaDuDg/jZFw0pEmj
         hg4F+pW8jaXGrA1OYATOAUXumVbZYyF6JakpoBvufsYRAADVfCafM8fYI4vfcufDf8ar
         LKJ1huIP+MKlLUbUfUF6zM7gtU6Hj/KYaNgcZgtfgTWV6uTpv0XUhMPMlnGYoRnty1vm
         Mg6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KWureBRn;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q10si11463915otn.53.2019.12.16.12.48.45;
        Mon, 16 Dec 2019 12:48:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KWureBRn;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfLPUso (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 15:48:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47614 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727539AbfLPUsn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 15:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576529323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wIBn80+V74amPBupfe+F9anDq8XfKyQu39ZmejTiR10=;
        b=KWureBRnuqBP2CVxwO0mjGV0YingWtGbOdRyqivR4k3xpe+Hz/tNDaIK3kHV+of8M5mQJT
        HEXDd2fsnVHn4XwZgX2S2uRyXmUi3VBM24T7cY1/fhb8av5EGtgx50lAdkJJwRcC7v111R
        x+eszrq80Oco4ZStfZoTOVBMy45UfIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-gv3zSrO2M92zwqDgWdhoog-1; Mon, 16 Dec 2019 15:48:42 -0500
X-MC-Unique: gv3zSrO2M92zwqDgWdhoog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12AAB8E10DB;
        Mon, 16 Dec 2019 20:48:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0485D9C9;
        Mon, 16 Dec 2019 20:48:37 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH 09/10] arm/arm64: gic: Introduce setup_irq() helper
Date:   Mon, 16 Dec 2019 21:47:56 +0100
Message-Id: <20191216204757.4020-10-eric.auger@redhat.com>
In-Reply-To: <20191216204757.4020-1-eric.auger@redhat.com>
References: <20191216204757.4020-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: hcPFtbt+Pgc+

ipi_enable() code would be reusable for other interrupts
than IPI. Let's rename it setup_irq() and pass an interrupt
handler pointer. We also export it to use it in other tests
such as the PMU's one.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/gic.c         | 24 +++---------------------
 lib/arm/asm/gic.h |  3 +++
 lib/arm/gic.c     | 11 +++++++++++
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index fcf4c1f..ba43ae5 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -215,20 +215,9 @@ static void ipi_test_smp(void)
 	report_prefix_pop();
 }
=20
-static void ipi_enable(void)
-{
-	gic_enable_defaults();
-#ifdef __arm__
-	install_exception_handler(EXCPTN_IRQ, ipi_handler);
-#else
-	install_irq_handler(EL1H_IRQ, ipi_handler);
-#endif
-	local_irq_enable();
-}
-
 static void ipi_send(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	wait_on_ready();
 	ipi_test_self();
 	ipi_test_smp();
@@ -238,7 +227,7 @@ static void ipi_send(void)
=20
 static void ipi_recv(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	cpumask_set_cpu(smp_processor_id(), &ready);
 	while (1)
 		wfi();
@@ -295,14 +284,7 @@ static void ipi_clear_active_handler(struct pt_regs =
*regs __unused)
 static void run_active_clear_test(void)
 {
 	report_prefix_push("active");
-	gic_enable_defaults();
-#ifdef __arm__
-	install_exception_handler(EXCPTN_IRQ, ipi_clear_active_handler);
-#else
-	install_irq_handler(EL1H_IRQ, ipi_clear_active_handler);
-#endif
-	local_irq_enable();
-
+	setup_irq(ipi_clear_active_handler);
 	ipi_test_self();
 	report_prefix_pop();
 }
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index 21cdb58..55dd84b 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -82,5 +82,8 @@ void gic_set_irq_target(int irq, int cpu);
 void gic_set_irq_group(int irq, int group);
 int gic_get_irq_group(int irq);
=20
+typedef void (*handler_t)(struct pt_regs *regs __unused);
+extern void setup_irq(handler_t handler);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_H_ */
diff --git a/lib/arm/gic.c b/lib/arm/gic.c
index aa9cb86..8416dde 100644
--- a/lib/arm/gic.c
+++ b/lib/arm/gic.c
@@ -236,3 +236,14 @@ int gic_get_irq_group(int irq)
 {
 	return gic_masked_irq_bits(irq, GICD_IGROUPR, 1, 0, ACCESS_READ);
 }
+
+void setup_irq(handler_t handler)
+{
+	gic_enable_defaults();
+#ifdef __arm__
+	install_exception_handler(EXCPTN_IRQ, handler);
+#else
+	install_irq_handler(EL1H_IRQ, handler);
+#endif
+	local_irq_enable();
+}
--=20
2.20.1
