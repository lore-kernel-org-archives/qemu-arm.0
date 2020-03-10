Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp847898lfc;
        Tue, 10 Mar 2020 07:54:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuvyHHl8CdKFRFhGOlNco5IQcgG+mSFvSRrD5N5oRTw8LO08aBIZ+D5HS+JNXRAjZTdkX99
X-Received: by 2002:a05:620a:1362:: with SMTP id d2mr20574752qkl.120.1583852079594;
        Tue, 10 Mar 2020 07:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852079; cv=none;
        d=google.com; s=arc-20160816;
        b=1FL+P7m31pnCHu+Zq7DNq9FX9lNracT28ySQPHDu9O3j/mQgaVJlykNm+cJ4KOfCsb
         uTqiJgOBF+LTzStC84lxYsN+ddoiSflDwv+L20h5TiUawhdaGoG6oRKXdibL84A+rifw
         qRPOkqn+OGNsJSUtIz/l6SYTDlT0VnQcdTb5Ubyqax4m9MxQZBGeDAiEiLpAd/p2Nurv
         zT3ZPx9yTcdcht1XwzvpyDj0TPuDi/1xskk2tFdyvh8L+XZX1rq2S0whg8OtsjrhYrAo
         cgTRBCeIIQSFs/GxvBtEIUY7Pp7/t3puZMsgcldXZaCyXmFJiUs8SoT4vBG/eCblOhXW
         FvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Svaro9ya8gIshoCY1/TSx7lahchaaNkktV6D9hBDRVU=;
        b=MG7XipN+pUkQlfKTfqQX22tga6IpokRLnVqjr7i+aqjB/Hg6A5l8e4jL7kh0YAEIUP
         sClErtZFK4CHlzYpB4RHjFF4+rkYjYtHK5qOXlzzGqGnz2Pb3rCz53WQNtTF4yVekran
         rywRzYLmvzauhm9RruIdSslx4HFWI40LoUsx62uzyjuUf+Dnhf/ZjRZIhEYYtpZLteLM
         QA3laD1xNKpNcI4rPOUwMqDTMybiBAnfE0FV91GQ0bkuTlg1b5rZKpF8D/d8MVVUiaxT
         HL4UZhEKq6SJ9IjJ83/IFcKR6Wgo9F8ASRYr6ckmHnRa9pRa3nZa201tiuvqPvkSZkp3
         HVFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=doP9XKnp;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id i3si4135608qki.27.2020.03.10.07.54.39;
        Tue, 10 Mar 2020 07:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=doP9XKnp;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5341B4A551;
	Tue, 10 Mar 2020 10:54:39 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgwvkHTll6W5; Tue, 10 Mar 2020 10:54:38 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4A5A94A591;
	Tue, 10 Mar 2020 10:54:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id ADFF74A551
 for <kvmarm@lists.cs.columbia.edu>; Tue, 10 Mar 2020 10:54:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dm13LGM65i1i for <kvmarm@lists.cs.columbia.edu>;
 Tue, 10 Mar 2020 10:54:36 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BF3BD4A54B
 for <kvmarm@lists.cs.columbia.edu>; Tue, 10 Mar 2020 10:54:36 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583852076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1He/Rpf4JLCiKi93YfAGw3px9JkkCyAWLJbg5rNbYc=;
 b=doP9XKnpDHnLWVkSI3PjhZlxCzfL03o2FQpPIxeIp0Oa6D0dT6i7YVayEl25vjuaWm6BEs
 XFwKT4DbjMqC4yFOov2uV9Nlgjo2BfAuVdnlTLfJUoF+lPmii9xBpl0ogDJt95RyO5hduS
 6VadofTIVvThwCKXVrDL8qE8xyQ5J1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-75yIwRbYNVqc9bkaXDnWSw-1; Tue, 10 Mar 2020 10:54:34 -0400
X-MC-Unique: 75yIwRbYNVqc9bkaXDnWSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D3E11005509;
 Tue, 10 Mar 2020 14:54:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-85.ams2.redhat.com [10.36.117.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAF3C60E3E;
 Tue, 10 Mar 2020 14:54:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v5 03/13] arm/arm64: gic: Introduce setup_irq()
 helper
Date: Tue, 10 Mar 2020 15:54:00 +0100
Message-Id: <20200310145410.26308-4-eric.auger@redhat.com>
In-Reply-To: <20200310145410.26308-1-eric.auger@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: andre.przywara@arm.com, thuth@redhat.com
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
X-TUID: g4uvfw8SyYlj

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
 
 static void ipi_send(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	wait_on_ready();
 	ipi_test_self();
 	ipi_test_smp();
@@ -238,7 +238,7 @@ static void ipi_send(void)
 
 static void ipi_recv(void)
 {
-	ipi_enable();
+	setup_irq(ipi_handler);
 	cpumask_set_cpu(smp_processor_id(), &ready);
 	while (1)
 		wfi();
@@ -295,14 +295,7 @@ static void ipi_clear_active_handler(struct pt_regs *regs __unused)
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
 
+typedef void (*irq_handler_fn)(struct pt_regs *regs);
 typedef void (*exception_fn)(struct pt_regs *);
+
 extern void install_exception_handler(enum vector v, exception_fn fn);
 
 extern void show_regs(struct pt_regs *regs);
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
