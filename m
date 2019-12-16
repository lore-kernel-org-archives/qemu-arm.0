Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4582717lff;
        Mon, 16 Dec 2019 06:03:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAcAUANQmn259aRhYknTdS/6XHQCJDyxxc6J9dSzHfbf3GXf2NqHsuyYzVol8Jn/pq9TCh
X-Received: by 2002:a9d:6f0d:: with SMTP id n13mr32350875otq.165.1576505034397;
        Mon, 16 Dec 2019 06:03:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505034; cv=none;
        d=google.com; s=arc-20160816;
        b=uc2lOu1U5sQAhC8R2anBwLS1hcWFrUfJ1Q0UeHgDkche4Ql/psjA3AIWxY60POT8Gr
         7l/tmeat/bwzBd6e3LY6FbcwZK3PwcBF1ICAgDtIksRlSLx5KpWMKdZCIPLePGwz6wV8
         WaBUngCBjMCm+tEGAhiIo1BbP0kLVytkYG4mi+Q45wPHQPQlOFoCLcN9vAy5y4gHTkTM
         xskuxKp9l5cUQmRkjNUk+oNGh9QtqCJuOtP3ynsCHdR+DtlJ1I7Je6mjowDf3jAT05x9
         fNgKviqdISa/VHEI2n0ygZqGiv0Zn4mQVROmq3gBaSGkfywyiv1bjpHT62NB2MVldg+0
         sIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=wIBn80+V74amPBupfe+F9anDq8XfKyQu39ZmejTiR10=;
        b=HmYzzbbh1082+ZEaWrpzXOGwaEozaKigiiu1QNXcYrtRHA7n/QYCbqhZ7AJO0ChYDn
         NaYnkqtVtlhhVeZm2Og1WENMSao/r8yno3QIyQRNe0gRXnNFNVmy6aBzjRDiKLoawCgt
         NdpraO3zBZkLGJSxkJZZUKbcQCtKKXHD8WLnMqAQLVqnKsvDGmYoqu9xTmn0rEpZeDoA
         2jvXpfiulz0rCPiv3gtmyGjJdxydXk1uijmSP1UKwYCUOuBdImZepVhapWGnfXaxB4bc
         X4LxadypiAdidjBxdU6ykURqRsSYLPPoBxQnCDbZpLTdT85d0XptDGZSTHH1+4SI5lzD
         UV7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BxJVH3Xa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t18si10467446oij.133.2019.12.16.06.03.54;
        Mon, 16 Dec 2019 06:03:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BxJVH3Xa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfLPODx (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:03:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32509 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727950AbfLPODx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 09:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wIBn80+V74amPBupfe+F9anDq8XfKyQu39ZmejTiR10=;
        b=BxJVH3Xah74LAYZCEHLAOxai6gwRpmdRthnFhcGx0cH2C9U5xVKsBJE2ed4Y2dam1Iaoap
        p5lin7XPmHjffgncFGs0yjeb5uWUbfimQE+EGOpT7n9MvBu3alTJ/q+iT7sOhaamYJ/CPc
        T/nuUOm4Lm2Z8b6LRYu5wHNiN6dhTf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-J5MIrWbNMCydWN3sERnNSw-1; Mon, 16 Dec 2019 09:03:50 -0500
X-MC-Unique: J5MIrWbNMCydWN3sERnNSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17434DBC9;
        Mon, 16 Dec 2019 14:03:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C94ED675B9;
        Mon, 16 Dec 2019 14:03:38 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 03/16] arm/arm64: gic: Introduce setup_irq() helper
Date:   Mon, 16 Dec 2019 15:02:22 +0100
Message-Id: <20191216140235.10751-4-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Y1J6GBN34oc3

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
