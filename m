Received: by 10.28.91.67 with SMTP id p64csp1456561wmb;
        Wed, 28 Feb 2018 21:46:28 -0800 (PST)
X-Google-Smtp-Source: AG47ELuoilJ/JjkDn8jnGn4sS4i1lHqxYs1aKnn/GGegXt8ZnlF4NX6sTQcrwzm/SKav1DQiVogo
X-Received: by 2002:a25:4a43:: with SMTP id x64-v6mr346808yba.325.1519883188157;
        Wed, 28 Feb 2018 21:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519883188; cv=none;
        d=google.com; s=arc-20160816;
        b=Zi9tcIa0UjFFEH7Nx4wtOIMqeYU5occhtGEwe9Do7BdxGgoIHS+PFXFm1s56hI1E8Q
         Q5S2jyeVBmxGAEGxscWIWK9QSC3NVmEUEepRaNNrk+oZDCSFvoxiba+PZWh9+70pnHtB
         pIMpuC9MLwwujIMIG+2go8QBeBqArevn4M+5t/Nr1quZ6EIr39TTjLPcaqFIisGdUUrW
         5myuYu7vFtgoJYBq9dBPd0hp7rhkiDr6PRNxUsbWaQaXoLpTXiMuoSsKJNSECVa/YtZG
         kGA2XIOlrY8XSVts/F+UjbZVj2LaWPwL2KzJQA4aH9Uk589prYsrebbVIVMHSagtPu7x
         If8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=D+2lUgPTWyFsUgxFqM649AIqgRMAZ3vq26Go1A/8ZEE=;
        b=faBNjTh7swvPB269hRwBtby2CT+g0RaCKhmKyMm/SOmu2ogOdKgZ4+pJ6XntnW0DHy
         W3iuU8fy4pd/O+mo2qPoCYHH30OQN9Xyap6T+xKjqfv0TEaUCHIlfsBOU0klqyqq8Y73
         oNCbUWA3VyDyA8ywrceCiJL7j27fzGg8WzMn822ANQkNk1i3arbKyvod1hUHAwP1k7lc
         YSpEi3C6OUjns2Kn5jXYo1vilW7ncKJebR73ktvUmRQLgJYHF5AwgqGJPFafsOWeMc6/
         ElmFDrSR6QT3tGJl7nAVV+u33yVYU0RZSmntXYYAG28Eg7MBLNJiMU2TtEs6AZi+bhfo
         rypw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5-v6si408208ybm.313.2018.02.28.21.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 21:46:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erH2x-0007e2-Mf
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 00:46:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1erH2r-0007dl-RS
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 00:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1erH2m-0004E9-Us
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 00:46:21 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32970 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1erH2m-0004Dz-QQ; Thu, 01 Mar 2018 00:46:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E0F4402291E;
	Thu,  1 Mar 2018 05:46:13 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0690213AEF5;
	Thu,  1 Mar 2018 05:46:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  1 Mar 2018 06:46:08 +0100
Message-Id: <1519883168-22092-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 05:46:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 05:46:13 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm: Use more CONFIG switches to decide which
 object files should be linked
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7te98jsqpItY

A lot of ARM object files are linked into the executable unconditionally,
even though we have corresponding CONFIG switches like CONFIG_PXA2XX or
CONFIG_OMAP. We should make sure to use these switches in the Makefile so
that the users can disable certain unwanted boards and devices more easily.
Also introduce the new switch CONFIG_STRONGARM to be able to disable the
"Collie" machine if it is not wanted.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 ++
 hw/arm/Makefile.objs            | 26 +++++++++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ca34cf4..43f382a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -133,3 +133,5 @@ CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
 CONFIG_FW_CFG_DMA=y
 CONFIG_XILINX_AXI=y
+
+CONFIG_STRONGARM=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 1c896ba..5e1e0a9 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,15 +1,23 @@
-obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
-obj-$(CONFIG_DIGIC) += digic_boards.o
-obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
-obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
-obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
+obj-y += boot.o virt.o sysbus-fdt.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
-obj-y += netduino2.o
-obj-y += sysbus-fdt.o
+obj-$(CONFIG_ARM_V7M) += highbank.o netduino2.o vexpress.o
+obj-$(CONFIG_ASPEED_SOC) += integratorcp.o musicpal.o versatilepb.o
+obj-$(CONFIG_DIGIC) += digic_boards.o
+obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
+obj-$(CONFIG_NSERIES) += nseries.o
+obj-$(CONFIG_OMAP) += omap_sx1.o palm.o
+obj-$(CONFIG_PXA2XX) += gumstix.o spitz.o mainstone.o tosa.o z2.o
+obj-$(CONFIG_REALVIEW) += realview.o
+obj-$(CONFIG_STELLARIS) += stellaris.o
+obj-$(CONFIG_STRONGARM) += collie.o
+obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
 
-obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
+obj-$(CONFIG_ARM_V7M) += armv7m.o
+obj-$(CONFIG_EXYNOS4) += exynos4210.o
+obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
-obj-y += omap1.o omap2.o strongarm.o
+obj-$(CONFIG_OMAP) += omap1.o omap2.o
+obj-$(CONFIG_STRONGARM) += strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
-- 
1.8.3.1

