Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp796343lfc;
        Wed, 11 Mar 2020 06:51:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vseKImWJnvPq5PzDnymT4EFyJKORIGSWfk+h2AHGFeDRk5/QpIA00XfpQU1VxO64X7V/ydV
X-Received: by 2002:aca:5757:: with SMTP id l84mr2113876oib.56.1583934709669;
        Wed, 11 Mar 2020 06:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583934709; cv=none;
        d=google.com; s=arc-20160816;
        b=r+j7QOJOTB8vbwogLALCYNoS9/1oEAbWnB9XBLJ+WEMOgILBzX5834cpikpS8gcB//
         ioo2Wi/GtdhNxunpBNvIzZQeF4hY7S/5nhp3W/l8gPxT4FRsfCA86sI07mWJawptI8Fc
         lxe6k5rup7rOubww7wj+Uk9XXQBzHIV/jcDxuPMWFALLiqTsmEHuy5ti9kAzoTTQhHba
         4O9Biuc0sZItUVn7Qh+yJEKkIkNPC13LkOjaBI6uNGvGb54EsYJfPOfJ5Cj/PF30AMlo
         MiCTBzgjiAJN+9IoGgMGasMb3NPcCreU3j16rS8lQ3XKblhKKvRJLCkhNyLZOYueeLfB
         Erpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=S1He/Rpf4JLCiKi93YfAGw3px9JkkCyAWLJbg5rNbYc=;
        b=YSHjquujdyO/j0wibgqcw8darrh3xgmlYjSVSCaXlGkiN6ll5o5fiBI3pfhGAJ4hhR
         0zXSEUmX2sVxZzxlwWXBvOypQ6wMRCnDynYXwrrKbTTdGUZLaWVnkBlWmoX1cTiYealG
         FhcIdpPCWK8du0qlsKLS0dh9nlXNpvfz8fGHKrQQFT5PCN/sOv2PpPhBd2mL2Vh5muMB
         F/MVk2fJF4s4uuym9W8DwuupygS1RdzrgBZyYmagyACM9AX8yxpbV1o/ZVPxD4ooGp3F
         tsfEB9fm7RkjK//21Fv6jT4Hxbqb095AutMy12RV9kctxMhj8hGS4PJa90N1u5tv+a8m
         GnHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B3y++5XN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 194si1229016oii.2.2020.03.11.06.51.49;
        Wed, 11 Mar 2020 06:51:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B3y++5XN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgCKNvs (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 11 Mar 2020 09:51:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22835 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729559AbgCKNvs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 11 Mar 2020 09:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583934707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S1He/Rpf4JLCiKi93YfAGw3px9JkkCyAWLJbg5rNbYc=;
        b=B3y++5XN7JpRnacDV1HnfqU9XDPLwfVMGr3b122yLArbW2uHathxr4IEhH43Kr/BBEno7G
        xLIUMWuw4AeXiRbZMuXFDNBzjV0jylrU0le+HV+U0Sv6b6Ct44ychDD/5GZ/SbubU/bBQm
        Mv6RXiqs1erBTYx4BwpzOT9zFzWO8UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Y8tlArngP2eITKWtybUnnQ-1; Wed, 11 Mar 2020 09:51:43 -0400
X-MC-Unique: Y8tlArngP2eITKWtybUnnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B410E6A6;
        Wed, 11 Mar 2020 13:51:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 265CE5C13D;
        Wed, 11 Mar 2020 13:51:36 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v6 03/13] arm/arm64: gic: Introduce setup_irq() helper
Date:   Wed, 11 Mar 2020 14:51:07 +0100
Message-Id: <20200311135117.9366-4-eric.auger@redhat.com>
In-Reply-To: <20200311135117.9366-1-eric.auger@redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: UiF6iqs41w22

ipi_enable() code would be reusable for other interrupts
than IPI. Let's rename it setup_irq() and pass an interrupt
handler pointer.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- s/handler_t/irq_handler_t
- also add irq_handler_fn in lib/arm/asm/processor.h

v2 -> v3:
- do not export setup_irq anymore
---
 arm/gic.c               | 19 ++++++-------------
 lib/arm/asm/processor.h |  2 ++
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index fcf4c1f..2f904b0 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -215,20 +215,20 @@ static void ipi_test_smp(void)
 	report_prefix_pop();
 }
=20
-static void ipi_enable(void)
+static void setup_irq(irq_handler_fn handler)
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
@@ -238,7 +238,7 @@ static void ipi_send(void)
=20
 static void ipi_recv(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	cpumask_set_cpu(smp_processor_id(), &ready);
 	while (1)
 		wfi();
@@ -295,14 +295,7 @@ static void ipi_clear_active_handler(struct pt_regs =
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
diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index 1e1132d..e26ef89 100644
--- a/lib/arm/asm/processor.h
+++ b/lib/arm/asm/processor.h
@@ -26,7 +26,9 @@ enum vector {
 	EXCPTN_MAX,
 };
=20
+typedef void (*irq_handler_fn)(struct pt_regs *regs);
 typedef void (*exception_fn)(struct pt_regs *);
+
 extern void install_exception_handler(enum vector v, exception_fn fn);
=20
 extern void show_regs(struct pt_regs *regs);
--=20
2.20.1
