Received: by 10.25.159.131 with SMTP id i125csp1771992lfe;
        Mon, 5 Dec 2016 13:47:58 -0800 (PST)
X-Received: by 10.55.154.205 with SMTP id c196mr48978130qke.25.1480974478309;
        Mon, 05 Dec 2016 13:47:58 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i46si9924263qta.29.2016.12.05.13.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:58 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5214431B315;
	Mon,  5 Dec 2016 21:47:57 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKi019596;
	Mon, 5 Dec 2016 16:47:53 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 14/15] arm/arm64: gic: Generalize ipi_enable()
Date: Mon,  5 Dec 2016 22:46:45 +0100
Message-Id: <1480974406-29345-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 05 Dec 2016 21:47:57 +0000 (UTC)
X-TUID: DDvf515AMA7P

For ITS test we plan to reuse the ipi_enable() code to
install the IRQ handler and enable the IRQ at CPU level.
Let's rename the function into setup_irq().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/gic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 88c5f49..cbaab3f 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -134,6 +134,8 @@ static void check_irqnr(u32 irqnr)
 		bad_irq[smp_processor_id()] = irqnr;
 }
 
+typedef void (*handler_t)(struct pt_regs *regs __unused);
+
 static void ipi_handler(struct pt_regs *regs __unused)
 {
 	u32 irqstat = gic_read_iar();
@@ -209,20 +211,20 @@ static void ipi_test_smp(void)
 	report_prefix_pop();
 }
 
-static void ipi_enable(void)
+static void setup_irq(handler_t handler)
 {
 	gic_enable_defaults();
 #ifdef __arm__
-	install_exception_handler(EXCPTN_IRQ, ipi_handler);
+	install_exception_handler(EXCPTN_IRQ, handler);
 #else
-	install_irq_handler(EL1H_IRQ, ipi_handler);
+	install_irq_handler(EL1H_IRQ, handler);
 #endif
 	local_irq_enable();
 }
 
 static void ipi_send(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	wait_on_ready();
 	ipi_test_self();
 	ipi_test_smp();
@@ -232,7 +234,7 @@ static void ipi_send(void)
 
 static void ipi_recv(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	cpumask_set_cpu(smp_processor_id(), &ready);
 	while (1)
 		wfi();
@@ -323,7 +325,7 @@ int main(int argc, char **argv)
 	if (argc < 2) {
 
 		report_prefix_push("ipi");
-		ipi_enable();
+		setup_irq(ipi_handler);
 		ipi_test_self();
 		check_spurious();
 		report_prefix_pop();
-- 
2.5.5
