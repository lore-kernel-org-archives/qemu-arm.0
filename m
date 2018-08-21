Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1940587wrd;
        Tue, 21 Aug 2018 06:52:20 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwWu3aOhYIjpiO5GGm7lKj0c/pktbW1bNqaFcM3l9MjGMvVGJtN+I1OQhuHiaBeo4LrmGEX
X-Received: by 2002:ae9:e105:: with SMTP id g5-v6mr46017604qkm.264.1534859540000;
        Tue, 21 Aug 2018 06:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859539; cv=none;
        d=google.com; s=arc-20160816;
        b=NSvB5BKIytkxqInZP4RHwXG0elPrk8wsecvRlqW5roQ9OUn/UNR6ePujhiMfx2e3xE
         bvUzhJ2g+E4VDYM10Bnptz+QEDU3jXc3KJLsBHkURIGuwt1zBRgpNSReT6vJiI5E7Ut2
         /fH3kkT5/mGY5irgEq8Y0iYmmRgso+NB8P8jlVYNSG2a1hCoyoMfFkNsMd8artAy/UCe
         KK8wer+7mmQQBHMJXz1rUpRCCBRKGrhNXmiketQbgLLBpkGMPlQHi6oawNZCZeV+HUka
         tm1fA+fm08qLwk7rFUQXRlSDCtybdYJzZXZ4ABne8L0dB9fZGl/0RLTSXVNOhTRwl2LL
         S0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=a++MGOpkFiUBw21OyJxcQoGurXxkcnJ5mQgf0KfS/ZI=;
        b=HTuwexSZx+2dmoAluED2gRDVxBMVqAN68JqwWQe898iIFb2nusUWSQ81wIdY60Izn4
         V4F8pNbodRFyl2eNPJfednANOqesX62EmX8jEhwoaiebTClJhT3TzOI/gCYCoJfYk6/z
         RHlcQ36L2e/aoFSTQaRJY7H07K0pTErpIDVldgUln3TUIJuCZp2oUs3jE1E87JH5D8xz
         j4W3w3hOqZQhqe9+YXcoLvkItaNcxo3abfrPZCFuWjJZJRNuzzFOzBZ+WdmX52UrjQCv
         MS2JewV4ok76llsxO/MwfLMBHpE+otZq5CTVghZd/1f3B4Fgqyo4VjDrQqi+pD2zUPrX
         bAcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si8507419qkp.201.2018.08.21.06.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs751-0002J3-98
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:52:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hz-0005un-J2
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hx-0003iE-NU
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6hx-0003S5-GJ; Tue, 21 Aug 2018 09:28:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6ho-0004Ba-71; Tue, 21 Aug 2018 14:28:20 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:08 +0100
Message-Id: <20180821132811.17675-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/9] hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
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
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/VyYg2hIR+B

Connect the VIRQ and VFIQ lines from the GIC to the CPU;
these exist always for both CPU and GIC whether the
virtualization extensions are enabled or not, so we
can just unconditionally connect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/fsl-imx7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index d5e26855a55..7663ad68610 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -209,6 +209,10 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, i, irq);
         irq = qdev_get_gpio_in(d, ARM_CPU_FIQ);
         sysbus_connect_irq(sbd, i + smp_cpus, irq);
+        irq = qdev_get_gpio_in(d, ARM_CPU_VIRQ);
+        sysbus_connect_irq(sbd, i + 2 * smp_cpus, irq);
+        irq = qdev_get_gpio_in(d, ARM_CPU_VFIQ);
+        sysbus_connect_irq(sbd, i + 3 * smp_cpus, irq);
     }
 
     /*
-- 
2.18.0

