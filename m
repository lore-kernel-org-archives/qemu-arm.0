Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1940862wrd;
        Tue, 21 Aug 2018 06:52:36 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxNbTDs7ouZyNwnPRLZ/n/vZxAfUFnozKsyiGNV93wtjrkTIl3CmGHydcZUwSG3khW4UILW
X-Received: by 2002:a37:4bc8:: with SMTP id y191-v6mr43313181qka.98.1534859556911;
        Tue, 21 Aug 2018 06:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859556; cv=none;
        d=google.com; s=arc-20160816;
        b=K4jzXgcyAntTKvtpba6nM5hYKZhaapE6OJgNcwfenS7V95saEb0NyHX1XcM62XuHoB
         zLPbPstyyWBs1YQe1n17REKK+JM7HxJVfG0YDeXbc4LSrvyvRN4BnXhOkfg1FfFWfh1z
         ijmlZVgHVuNh12mY4YtZkVD4lvsH+WUGDo6nPLay9CsrVtO59/5ucUYtOviOi9t+TVRw
         9Wa28fKdHBPnTxG9+eEz6AEg2mMJNOxDKZXqoF+LfeKYYVvLgRzTGYUWmeWkBe3KzZp5
         qXG17w1Z378nXK9C1fqLlLqBDvUhWF8VPO3AcOyk9hyGzx11RIPjT5CEQBJ9oy/YvvHM
         whXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5aEvFf0qGObe9Oz2nD+FC9j40MBPHG4/dKZb//2Sdt4=;
        b=d63+pjZ7bnkmeUDdyB5G+K49cGurZluw3POCSyxkpqZmd1uKPqGhPP+em5KWBbJ0Hm
         b9SeeHk+PwxeZVL2ezfN+cTu7YAUTupBLwpChgQjKy5YqBg7EkhG1KaJLTBUDGXewBfd
         mfddjVOine7rwniMUZWlHKbb9yqGgEYG9SsJc6xyyykYqa0djUNpypDR81Z4S8pTvc35
         uMwfRCt+MnkaVDXjBR5DsTCoHVfq1xWB795GHAbNQLKopomHSPECZ/cJaqUti1SwY1Uy
         tu7HlrKTJZF2Ke74pSUtd6RPRvLnog+LEAzkllPFr4OwPbkaYaZ2OQQbnheOI1P5gOjq
         bj2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5-v6si68935qkl.2.2018.08.21.06.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs75I-0002X4-AN
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:52:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i0-0005wD-NX
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hz-0003kN-Op
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6hz-0003S5-Ex; Tue, 21 Aug 2018 09:28:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hn-0004B6-9j; Tue, 21 Aug 2018 14:28:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:07 +0100
Message-Id: <20180821132811.17675-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/9] hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
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
X-TUID: TLiL6H/2s3x9

Connect the VIRQ and VFIQ lines from the GIC to the CPU;
these exist always for both CPU and GIC whether the
virtualization extensions are enabled or not, so we
can just unconditionally connect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/fsl-imx6ul.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 258f4706234..4b56bfa8d16 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -207,6 +207,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
         sysbus_connect_irq(sbd, i + smp_cpus, qdev_get_gpio_in(d, ARM_CPU_FIQ));
+        sysbus_connect_irq(sbd, i + 2 * smp_cpus,
+                           qdev_get_gpio_in(d, ARM_CPU_VIRQ));
+        sysbus_connect_irq(sbd, i + 3 * smp_cpus,
+                           qdev_get_gpio_in(d, ARM_CPU_VFIQ));
     }
 
     /*
-- 
2.18.0

