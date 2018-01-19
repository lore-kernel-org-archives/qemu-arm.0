Received: by 10.28.71.27 with SMTP id u27csp866403wma;
        Fri, 19 Jan 2018 07:23:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBouvexOcZF31AWkBfIQk3FKcnqcKyRzdMJbFj9OI/W7HXZkYujFxazaVMH7ndrqO+LlF4qv5
X-Received: by 10.37.233.7 with SMTP id n7mr26992685ybd.522.1516375410808;
        Fri, 19 Jan 2018 07:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516375410; cv=none;
        d=google.com; s=arc-20160816;
        b=HMLZriV9/2v5XTyvMOE83XkKeueW8JucuO3TqIjwJUR0RFvCo2H9Jx/jeuoZvXJgth
         NgXeZDfX8h1uOxm8eKq73tcVO15qEkvj8g6V2hvjK7Jaba0yW9SR7hS0jBnNBk7q9dOw
         M3di06viRG13MMgP/6BFDKy1Ak7NNngBzLLssV/tsmh8rqNiP5DlqKHsESf0lp4GjwOS
         mruhAOt0qdJ1kvdsPcyoeAzNjGOPMcMJqAgYZBzbS1DN0BEKYUDv/4WRxPNSgniIoVIp
         vmI0ZJqzD2xxgMmP+b5MoLesMbGIhC5Egxk2PAUY0UBuHon2i6KuD1+qg5VRfYPLETz7
         UPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=2vNzCkhLRZ4mEKClldlJa1YkZDzTbJBjlByRDjgtmoE=;
        b=OjiAzX6akoi3kHfUcZo6HdjEyGzo8OJnAm/VW7im2ZCjqrjMLX76QDpB4D9yEXzSdU
         9GDtANV19jl4IPlbIwrnf+Eaye0sIX3qdRao63rx8l31Pjm9ASc/3ffp62R5XajdHhHX
         uMtOPDbEOz1bILGHIv9nP32Antz0kIwfjPpe0OO6gGBiesSgMFbdugZOMokS1gQprqHq
         jdYpvuYmbmg1czB2Ju5p6KsXymYRdo4Rt+CeCGnPZDZDzGvSu4+9hDWjhTij+u3zPke1
         1d3YFbJ6xevT4vGbhB7MYS68qAB1+5i2Whm6Rve8WGiPdrep11WD/cp+AiFH7uVzva3t
         aETw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pQSyzoOe;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pOv5g5cu;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pOv5g5cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si2201224ywc.471.2018.01.19.07.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:23:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pQSyzoOe;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pOv5g5cu;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pOv5g5cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:55303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYVu-0007Vs-90
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:23:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7U-0002my-78
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7Q-0003jS-9E
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:16 -0500
Received: from greensocs.com ([193.104.36.180]:39272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ecY7P-0003iK-W6; Fri, 19 Jan 2018 09:58:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A23FE5E2F8;
	Fri, 19 Jan 2018 15:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373883;
	bh=FlcRuHgM7HCaRegPGAVU37r0+yEoKHRp0N1iIQwTaDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pQSyzoOe8YEX3VzsCnuqBiU0qYrk40pUDsWguGegoVpIR/k7ISPSm8kpbGNWzSd+C
	rAVeP/0BgzXW0R3YkSfex9vlHAQXx4iLA2OeUlnY+EHnoPgzvgUl7xpvtjDWXlFNqW
	ydHM0wLmEPmwVIy0igClzSSWJsl07AYsMN1S+aro=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pOv5g5cu;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pOv5g5cu
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-rtn_aslmTM; Fri, 19 Jan 2018 15:58:02 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id C3E0965A17; Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=FlcRuHgM7HCaRegPGAVU37r0+yEoKHRp0N1iIQwTaDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pOv5g5cuZZ7Zj7Pm5RiUa7aUMzq0foA9mpsEnqQkKfkM+duwlYilfj9oW1hUQOk6T
	boLvYnedTZ+cIRgBp4I5b7XQlICVLd3LPsSmW7ProsgIu9P35UGVmVAa1l+YPcV/Z/
	tLKbzu0l72EBfvJR9yowiSUcTAo4Fb8kjPbEaUzY=
Received: from michell-laptop.hive.antfield.fr (tima-dhcp-h14.imag.fr
	[147.171.132.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 5AED2319FD0;
	Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=FlcRuHgM7HCaRegPGAVU37r0+yEoKHRp0N1iIQwTaDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pOv5g5cuZZ7Zj7Pm5RiUa7aUMzq0foA9mpsEnqQkKfkM+duwlYilfj9oW1hUQOk6T
	boLvYnedTZ+cIRgBp4I5b7XQlICVLd3LPsSmW7ProsgIu9P35UGVmVAa1l+YPcV/Z/
	tLKbzu0l72EBfvJR9yowiSUcTAo4Fb8kjPbEaUzY=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 15:57:55 +0100
Message-Id: <20180119145756.7629-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180119145756.7629-1-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 19 Jan 2018 10:23:16 -0500
Subject: [Qemu-arm] [PATCH 3/4] hw/intc/arm_gic: Fix group priority
 computation for group 1 IRQs
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
X-TUID: Wh/AvEidpLMM

From: Luc MICHEL <luc.michel@git.antfield.fr>

When determining the group priority of a group 1 IRQ, if C_CTRL.CBPR is
0, the non-secure BPR value is used. However, this value must be
incremented by one so that it matches the secure world number of
implemented priority bits (NS world has one less priority bit compared
to the Secure world).

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
---
 hw/intc/arm_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 713de3084f..d0a41a89ae 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -256,7 +256,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
     if (gic_has_groups(s) &&
         !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
         GIC_TEST_GROUP(irq, (1 << cpu))) {
-        bpr = s->abpr[cpu];
+        bpr = s->abpr[cpu] - 1;
     } else {
         bpr = s->bpr[cpu];
     }
-- 
2.16.0

