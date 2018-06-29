Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730688wrq;
        Fri, 29 Jun 2018 06:31:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe7KUPyM1EuNQq8SR+VqDrzXZcStkU2KZ1fAGE3Ckphqq4Y5fvtgWnyqpDc+rUMPyZFqc0d
X-Received: by 2002:a0c:b98a:: with SMTP id v10-v6mr13183853qvf.175.1530279109488;
        Fri, 29 Jun 2018 06:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279109; cv=none;
        d=google.com; s=arc-20160816;
        b=xIkslxYB6oOaVpKgobgY486w4ckGYikL+hfScYUsCXcYECqRGENfYtgqP9rEJ3f+fo
         lDHSvx9sv1DTWcjwhFf+hZ+ibxPvqfCzVMlS6rlvLvwxPuOqQ4exo6+61qOAPu4+dgEf
         ZgotL/JKTMqsSUJuy/zWFyFvUf9MmGlLXYMl1UUqjtZbdOgJGfue5a8ql8vdlAJzBmyA
         XfrG5MjUWRBU3YFRr47Muu0wu0utpSLLu/nzNj5NhnVnkI7ung0xMCp0ZlcbUlemZDXO
         VUjiApn65dxwHN7yLJq6KB0owgXyMnZJHkKqOjwk+rrJCrSnlzQzxuR7Njgqf7Lu1ZTh
         Eugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=H/hRrZrvTCUPX7m+87mgJehPkiZwY3bFazUa046kBVI=;
        b=MxIej8E3ZhLthqFBiwcDHd6JFv5bFeSb67ti4yWjiCWwr2nw31cc0OOHskEaV5UYEA
         LAYbjuaJEEjhR1t9mZsMDdiSi9XHKE7/RmqIHjSlJMipeczSXHgwsfAAjVovPjJeMLpL
         W8a7ZGUxhZGVp1sucUAAd4SOcWP50sqUwIh5QwoXtlI/xIx/cBGY46INDHXQi092Gz4k
         0fJ+UIkec07RNQ2pfiizJ1/+ob4Hb16z9deUE8s2I+sNNA7BITxWMIhcQt0oY9Q0R4lK
         ie9wnMu0xI7JMbmPesAXcGviGrgESXWW2ujQr2xjs0W5+dhQTmzq2XQI1kQC1C3m9pkN
         3aUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="jIFblKF/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=etdF7Tgs;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Qgk/5YD6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24-v6si4758171qve.275.2018.06.29.06.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="jIFblKF/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=etdF7Tgs;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="Qgk/5YD6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtV7-0008DA-0O
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU8-0007a9-RZ
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006qj-4z
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:48 -0400
Received: from greensocs.com ([193.104.36.180]:58619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mY-Ar; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 29D8B4434B1;
	Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279039;
	bh=IZnUnSWK2zcIP/cCVEwvOa9/RpI3I0kZxu9SuWElsBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jIFblKF/w7O6RIcU8bvupawQdby4wXeYSo+zEbpwtXPG0r/crbeH5DhZ07ffaW8kD
	yO0TOJzIIaHWPKiGeVY4bQ7m9a3XpN/1OLlusI+yNReMnsCN6rMRHGFJnIU83yJLkB
	yEVNY4O4U/rnKqgkgASPOp57kTIuaHcH2n2NevBc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=etdF7Tgs;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Qgk/5YD6
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXasRcEDes06; Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 4DF1A4434B7; Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279038;
	bh=IZnUnSWK2zcIP/cCVEwvOa9/RpI3I0kZxu9SuWElsBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=etdF7Tgs+aKEJ3GVnCSIc3xgtWzGyJex38CPD22aQu0JeDMmGV+1R4vp1tTESqFtl
	MDDfy5Qfmz0BziNUPewZyKKDlOn2w1zcbEg2lcX/UtcAY1lKRe5qxjoSxzcUjTiyEu
	+DUXtz1/YuXtCjF6446t2G24RqJ4b6HVEtkFgm3w=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B1CF94434B5;
	Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279037;
	bh=IZnUnSWK2zcIP/cCVEwvOa9/RpI3I0kZxu9SuWElsBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qgk/5YD6aU+Z8wIovQ/EMbuF0lr81O1cErL08OyYjGNZh6nFFwFOUfYk9U+n5UB5E
	fw/GFDUB/m2eP1QadlusO3FwX4on2t3/uOlS4YNsZ/K9AEV7DNt5tCTuduZZek8WfI
	uJWpcxLf1Uzs8HwuaVAE+CbuB7S26YteG/F1rnZk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:46 +0200
Message-Id: <20180629132954.24269-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 12/20] intc/arm_gic: Implement virtualization
 extensions in gic_complete_irq
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oZg/g7eB8Qp8

Implement virtualization extensions in the gic_complete_irq() function.
When a guest tries to end an IRQ that does not exist in the LRs, the
EOICount field of the virtual interface HCR register is incremented by
one, and the request is ignored.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a7577ac073..434dc9c7b2 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -605,6 +605,15 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     int group;
 
     DPRINTF("EOI %d\n", irq);
+    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
+        /* This vIRQ does not have a valid LR entry. Increment EOICount and
+         * ignore the write.
+         */
+        int rcpu = gic_get_vcpu_real_id(cpu);
+        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
+        return;
+    }
+
     if (irq >= s->num_irq) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1023]
-- 
2.17.1

