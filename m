Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2065144lfi;
        Thu, 2 Apr 2020 07:53:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgeWmMrg3pdoCgV9RlyVI2f+jxUdXo6Ki8VGCG7NP199KXaXDHJBfkr1naB25QkB24N0tB
X-Received: by 2002:ad4:514d:: with SMTP id g13mr3497267qvq.229.1585839191220;
        Thu, 02 Apr 2020 07:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585839191; cv=none;
        d=google.com; s=arc-20160816;
        b=JpQAu4GjA9mnO1KRy/wbaFdDFs1BFBg5TeMNZ3EyOep1/pJzl/msc01K1Z8pY/xGPT
         tCzujBAs3uBPIc5B+C9OP3sPszTgcDXEF4nwA8Ps2JJhWLVUmI6khKamYCO7Ld4LYjxq
         iYIXCLaBJ9L7Y07zRVOmLL4WGdwNmqf9BxUXiWe62U+eNvWRUZTgM3fq0T/2xNLzoqPp
         KhKedJ9+olFsN/8mz+iyL7JLYYPvNZfXHuUFLRhMood76KmJhx6HQCEP1qii0ONT58Wi
         W6P9RwufM233OoRvkZHeotdWYlkKE+mxQAlZO0Us1p0mZJf1GLK/W31u5gT6cQ09y+mY
         0WMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Svaro9ya8gIshoCY1/TSx7lahchaaNkktV6D9hBDRVU=;
        b=nbT9wcYQosZf26Y5DYZerx2vcBGTGNtM0K/NUfpzUNKr8t1ztb9Hs1FIDVWeB/wHHl
         DEWQwkZxqHdNaMOQC61Xs0F6HWI4IfszbOgUpzn138FhCTVkfQlfPAWiMT6I5oHNRcJP
         wFgZ/QDGlFmV5cvQ3Mtm54AlKXV/nQdvsOI3Aijya3E+Ixvr87KXLvVQRyQ85eiLPc+U
         d7asUKqDdLi6nUYNN4klfhGFvJUT7Idm8Xu4RmtwUsW8y+h6qeJVa9vB0jVDRhEhqNjV
         EtuvZ9PGeqz0k509ML0r2YIMRW2I7YkV56mfk0XasHrF3MZNAtzxi6D+W8Tra0YjaJ2M
         X+mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=TQriTeW5;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id n39si3458355qtf.215.2020.04.02.07.53.11;
        Thu, 02 Apr 2020 07:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=TQriTeW5;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E3E754B162;
	Thu,  2 Apr 2020 10:53:10 -0400 (EDT)
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
	with ESMTP id 8FRRQwI77cxB; Thu,  2 Apr 2020 10:53:09 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id DBC8E4B143;
	Thu,  2 Apr 2020 10:53:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 655DD4B142
 for <kvmarm@lists.cs.columbia.edu>; Thu,  2 Apr 2020 10:53:08 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ug8adZmj1SI7 for <kvmarm@lists.cs.columbia.edu>;
 Thu,  2 Apr 2020 10:53:07 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 84DC64B143
 for <kvmarm@lists.cs.columbia.edu>; Thu,  2 Apr 2020 10:53:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585839187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1He/Rpf4JLCiKi93YfAGw3px9JkkCyAWLJbg5rNbYc=;
 b=TQriTeW5yD0wzq4i8gleRiYiIuTehrpKE69SjI1Ke70UIShtaZV07b+PBJqHFZ3fhtF5y7
 Sy+5qYEN2bGE/oZNZ/2ZLqOoB8Cvbq+STBUmtHUwqaZl5Cv80VxWpFyPfJxh5W/ILr+Gxn
 NdjGg/mYQbdbGq96mKsG6QxhQmsbvPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-SGK9YdU5O7C0ZhVWCBXbSg-1; Thu, 02 Apr 2020 10:53:06 -0400
X-MC-Unique: SGK9YdU5O7C0ZhVWCBXbSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E94118B9FC7;
 Thu,  2 Apr 2020 14:53:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 631B65D9CD;
 Thu,  2 Apr 2020 14:53:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v8 03/13] arm/arm64: gic: Introduce setup_irq()
 helper
Date: Thu,  2 Apr 2020 16:52:17 +0200
Message-Id: <20200402145227.20109-4-eric.auger@redhat.com>
In-Reply-To: <20200402145227.20109-1-eric.auger@redhat.com>
References: <20200402145227.20109-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-TUID: XIi93X9GeXlA

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
