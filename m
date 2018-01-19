Received: by 10.28.71.27 with SMTP id u27csp869947wma;
        Fri, 19 Jan 2018 07:27:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBot5gYKdNF0EulO619ayF8SrmdG1dhfIUM+fCUl9G65Gigq+8BesZAaTCGjceLpjJmUuCp2P
X-Received: by 10.129.108.2 with SMTP id h2mr9928383ywc.445.1516375623612;
        Fri, 19 Jan 2018 07:27:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516375623; cv=none;
        d=google.com; s=arc-20160816;
        b=qjQTbO12hEqmfP+QeXn2LRMH0KoIrPMeKHomCJYYYtJX43N6uaqbKKxprFUsFaTAHC
         bmalhN2IQHEWBIfJ+DRMhH9viUHsHbP/6s8n4ntsa5ltSun2v3W7Y4YVEEuxvNqfzser
         OKD4lQillSWTBDdvubJyDEWj2cCCwMj4zRKlNUjk9jmkazwiYgZPleiShuYR4vKcTk7s
         Xx0QOzdJCnC5nU8zT7q2tkWyQLask94Lp3IVfOuEe8EFYeuuQV4PFvDotT4x5+bONjBS
         wFmG/wcjL5rjU2adxC4mhVL5s/uvFdoXoy7fhrpppQAg/vcUz0ngdSxWbejFsHZytu8I
         iV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=jAZ2fFtQadCa37Uty61AEXfEVF9G7bkxFY76qHP22EI=;
        b=0P9+ucZ1o/ksk/5H+SpGi9d3qpdmQA1UQRxy0MAhf5QsfSXUB2Sib0WAKNoMPTTYrq
         +MumHVQdE/EMwbAq0GDfloJuvHwk6XF2HVgL06EmlHJQyjwVoI1qEnZY8dXpQV9EiP2y
         +OJz235xYe44/ADoXys9nlbPUdjadtIkrvD4XVVmNywUMTJ4zFVYgvrhrCYfFsTqsOC9
         5uempfNSq38nVsavERvzuRzH6m6OsftnY6N7uM10MBYt8ODAKbdkOd83p/jTkzeieuQV
         1QPnTf+LCJ7ipipZtURlJlP221KEfZdfn8W7rTjEbq5mIl3rJtMJGKoh1UBRqUMJEp/b
         a81A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=DBRH2mZV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KucRMA2o;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=28BinC0m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w1si623728yba.363.2018.01.19.07.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:27:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=DBRH2mZV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KucRMA2o;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=28BinC0m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:55404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYZL-0001yv-2T
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:27:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7U-0002n4-7N
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7Q-0003jq-Ak
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:16 -0500
Received: from greensocs.com ([193.104.36.180]:39270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ecY7P-0003iM-W3; Fri, 19 Jan 2018 09:58:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7365B319FD1;
	Fri, 19 Jan 2018 15:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373881;
	bh=HrHpyMxolNmkgunbKJZFrlz035vs8W/r8Ad5WckIJao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DBRH2mZV1CeRM+GBB2yjEalJ38brZKoC2amh661gfYMjF++RLrVAB/R7hrORvNvYn
	J7MDKlet+DBFMo87rmlSub9ySam5yFoSzJPqT2YUzsHglF1AeiLLJQfGqa5bNDmk+c
	V8XfV0ciQPK4RbSG0gt7EqUm58oHtgQLlHHzokgg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KucRMA2o;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=28BinC0m
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOD40wOXCPEF; Fri, 19 Jan 2018 15:58:00 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 0D324319FC7; Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=HrHpyMxolNmkgunbKJZFrlz035vs8W/r8Ad5WckIJao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KucRMA2o81uQh4F9qBuLpmhVND+faKI22wnlZDWMGePrH9bAZZl9BGT66HpofqmJc
	3LQEj1/E1QFT9e6JOEIXDZl29BfeRhz4zCK2OltzenkQKnAMHVrgxnvWM9TJC3NHEU
	CAVqD04UVbafAm4Nsqz1hUAnlJsYubH9XqIg8Qoo=
Received: from michell-laptop.hive.antfield.fr (tima-dhcp-h14.imag.fr
	[147.171.132.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B54355E2F8;
	Fri, 19 Jan 2018 15:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373879;
	bh=HrHpyMxolNmkgunbKJZFrlz035vs8W/r8Ad5WckIJao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=28BinC0mPAFgWEJDhSg6rCd0mdRit7fcW5zBoAvMR2q8iL3tbOsQe+S7tmuRMmPZ1
	ItEM6/mZtd4C0GyhZ9uibD9ky56YCc9jVCqxJvwoPpcXb7qRDwDPIOjRciNu32ESvQ
	VKRGI+tYKvNrr0LkKyltPbYa0BdWjK3afBH4yYcQ=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 15:57:53 +0100
Message-Id: <20180119145756.7629-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180119145756.7629-1-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 19 Jan 2018 10:23:16 -0500
Subject: [Qemu-arm] [PATCH 1/4] hw/intc/arm_gic: Prevent the GIC from
 signaling an IRQ when it's "active and pending"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zlsxb/muJvcO

From: Luc MICHEL <luc.michel@git.antfield.fr>

In the GIC, when an IRQ is acknowledged, its state goes from "pending"
to:
   - "active" if the corresponding IRQ pin has been de-asserted
   - "active and pending" otherwise.
The GICv2 manual states that when a IRQ becomes active (or active and
pending), the GIC should either signal another (higher priority) IRQ to
the CPU if there is one, or de-assert the CPU IRQ pin.

The current implementation of the GIC in QEMU does not check if the
IRQ is already active when looking for pending interrupts with
sufficient priority in gic_update(). This can lead to signaling an
interrupt that is already active.

This usually happens when splitting priority drop and interrupt
deactivation. On priority drop, the IRQ stays active until deactivation.
If it becomes pending again, chances are that it will be incorrectly
selected as best_irq in gic_update().

This commit fixes this by checking if the IRQ is not already active when
looking for best_irq in gic_update().

Note that regarding the ARM11MPCore GIC version, the corresponding
manual is not clear on that point, but it has has no priority
drop/interrupt deactivation separation, so this case should not happen.

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
---
 hw/intc/arm_gic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d701e49ff9..dad383ea12 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -93,6 +93,7 @@ void gic_update(GICState *s)
         best_irq = 1023;
         for (irq = 0; irq < s->num_irq; irq++) {
             if (GIC_TEST_ENABLED(irq, cm) && gic_test_pending(s, irq, cm) &&
+                (!GIC_TEST_ACTIVE(irq, cm)) &&
                 (irq < GIC_INTERNAL || GIC_TARGET(irq) & cm)) {
                 if (GIC_GET_PRIORITY(irq, cpu) < best_prio) {
                     best_prio = GIC_GET_PRIORITY(irq, cpu);
-- 
2.16.0

