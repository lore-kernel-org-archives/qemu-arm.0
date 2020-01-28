Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp304867lfp;
        Tue, 28 Jan 2020 02:35:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLjOoJg/Ai3GAqMFo2+ArkbxyUtzpldMcDdbpsa9giWAS2c+o/ciWylBVyGisYq+aOPtYU
X-Received: by 2002:a9d:7e8c:: with SMTP id m12mr16561090otp.346.1580207744116;
        Tue, 28 Jan 2020 02:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207744; cv=none;
        d=google.com; s=arc-20160816;
        b=Bbckw6E0lfWZ6PRym1gS/bJ7vpFtuz3cRCHPBt1nA+z5tzi/hVafAGruPe5/aPR3yx
         Gp3DmMUCyGKPJhLXsUUteFJ1pVwphc4X3NV8sbtfSAx6p5IIjF2NZ7A3bYA4M7vByovs
         NaGBTHA0gzR/o13okzUPJQnXcvxRBhByrzlLypNsWIZGCJLGi4vPvakX/z/o2VyB/pq0
         KYXq1c0s+/7RKjUZvxeN5nok1ckEUCzIfpkbH3i+grQVvjKn+7CbfwplLDA/NEX0bv8Y
         Vkm96QaPNEmH5kupKaPujR0QetoFzfOTs9ZEURRpkrVxplFO3AtfPZltdaBJ1Cdz0xXL
         ZrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=MvayPD2KrkjvVludp3nPmXgg5XhOf+bBUlyipWBvYKU=;
        b=HlyZr7eeNV4s73l3Q1Cn1ufq9GeE0rr5g8OlyPPbMus9ZZMZVSFNyMAC1OFaQJbBQl
         s88P09WcqCoqgT0bBn4j/ypMQUUG5BtwWNxN8RS+2LbOfVYj/7K5hHdNhIwVESNGQBZ2
         oYSeXoOnG/QwiaTm9Xt9A1BVYIQPBjGv45lYVNVxZUbU/4+WmhmqOUIEtF4O/0Et6Me8
         1W4uzbpClZoKC/U05QijUdAzf8OTsPS2LKCoFNsPROjvNc0G7kMEaRVDsIuhrvr5b/sj
         u+CqbFXSVwETB2EpVSnxOfDF1/JhsB84odkq6OCYv/vNyDkkLSE+rWFx5n7A9+fe/Gts
         WjAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O5zSv6vm;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a10si5035526oia.232.2020.01.28.02.35.43;
        Tue, 28 Jan 2020 02:35:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O5zSv6vm;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgA1Kfn (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:35:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51668 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726067AbgA1Kfm (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 28 Jan 2020 05:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MvayPD2KrkjvVludp3nPmXgg5XhOf+bBUlyipWBvYKU=;
        b=O5zSv6vmzaCd+4T9V2SXKVvG/qpF+yg6mC/9JFeSspiZhgLDDfFvZcDJa9C+XJO3wlDHkQ
        ckOLJNfwx3J0H6Wlo4taduudtSBFx0aLMUexSDjwIi3jjgjkuELh7HkhzJGP9XeXcdMkxO
        n83cGD3H7tblQDkRZS4/T+suqkR/BFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-xHLUGjwBM7-GS3DpZpuesQ-1; Tue, 28 Jan 2020 05:35:33 -0500
X-MC-Unique: xHLUGjwBM7-GS3DpZpuesQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC38107ACC4;
        Tue, 28 Jan 2020 10:35:31 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E637C1084194;
        Tue, 28 Jan 2020 10:35:22 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 03/14] arm/arm64: gic: Introduce setup_irq() helper
Date:   Tue, 28 Jan 2020 11:34:48 +0100
Message-Id: <20200128103459.19413-4-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 5ty7J+LrW2T3

ipi_enable() code would be reusable for other interrupts
than IPI. Let's rename it setup_irq() and pass an interrupt
handler pointer.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- do not export setup_irq anymore
---
 arm/gic.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index fcf4c1f..abf08c7 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -34,6 +34,7 @@ static struct gic *gic;
 static int acked[NR_CPUS], spurious[NR_CPUS];
 static int bad_sender[NR_CPUS], bad_irq[NR_CPUS];
 static cpumask_t ready;
+typedef void (*handler_t)(struct pt_regs *regs __unused);
=20
 static void nr_cpu_check(int nr)
 {
@@ -215,20 +216,20 @@ static void ipi_test_smp(void)
 	report_prefix_pop();
 }
=20
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
=20
 static void ipi_send(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	wait_on_ready();
 	ipi_test_self();
 	ipi_test_smp();
@@ -238,7 +239,7 @@ static void ipi_send(void)
=20
 static void ipi_recv(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	cpumask_set_cpu(smp_processor_id(), &ready);
 	while (1)
 		wfi();
@@ -295,14 +296,7 @@ static void ipi_clear_active_handler(struct pt_regs =
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
--=20
2.20.1
