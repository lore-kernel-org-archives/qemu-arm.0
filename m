Received: by 10.28.91.67 with SMTP id p64csp2723888wmb;
        Mon, 5 Mar 2018 08:22:54 -0800 (PST)
X-Google-Smtp-Source: AG47ELvrQXCn3cLnDnO/CyusHFp3pDkB926S4IEhVW5pJRW7yIhfL/nwSzm2+uYsximCFgGKiMNT
X-Received: by 10.129.124.134 with SMTP id x128mr9491736ywc.332.1520266974271;
        Mon, 05 Mar 2018 08:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520266974; cv=none;
        d=google.com; s=arc-20160816;
        b=0qKeRfbL5uTIzK2fNGMtrT4uz3JXsLkiyNK4eYKeS8A9b3mreWey3kxCrvDUZ2lxMq
         +QSJQZve74M+6jjK0GfVR4P6k4Xp++u7YLEQAxZ7Ne0kVTTg27G622U8M6sUNrlS6odf
         tWe0tMfVlWjTV6ak6J4/mDeGEjDZ/b844OddsvxXuBzADTL95wK2Nhlaa5RNK5JR84bD
         y4JFR2nvB1Ayx47NsRAYJsR96nTUsW+UxoZq4gP2wQ0eyu8oG4WUD69qceF/gW9a1DTK
         KFoMRjscJwoCuqUKyuQJHRZqnvxfMBJB9w9cOk71r+kokOgG43HdQcsn70iNlTMeDyAp
         d2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=lqdbHwTdzRBy1L5R4+U7BHHnh2DggiPEsXgMhdy3LrI=;
        b=V4HCylb93688C4UmONNajayNjW/CRKz8iMqidONBzSV8hRXa3cCUjC0uQe91D3oVkv
         9upTISUqGWV85Rn/SRedOVz9qmDo7d0LmKedFwxpGHYKcFUQJw6Q3yRVGpHoVZpft2my
         YEjZ/YfnYaKQFI4Xx8lBFUyXwxXKxl69m1PrHEZxLP7zjP+hD+VA6KNTQYPqDi6NCi2F
         9dKO8gVQkLBEcXqfLz3BTENJUsWzmn+gtEdWeVNrw2dknXSb3Gttd8S5/Ed/dWXfSiNr
         kgnEHZKibQkUltSQdSgoHnYJ5xe+qlqqjhNv+Nr2PFahgQfYqKVGssMZ4lmpi/q2h9+y
         qMXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i187si2211428ywb.52.2018.03.05.08.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 08:22:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esst3-0002D1-Nn
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 11:22:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1essss-0002CI-Lz
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 11:22:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1esssp-0003kg-SA
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 11:22:42 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34260 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1esssp-0003kS-Mx; Mon, 05 Mar 2018 11:22:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A065D1448;
	Mon,  5 Mar 2018 16:22:36 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-103.ams2.redhat.com
	[10.36.116.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E340F2144B21;
	Mon,  5 Mar 2018 16:22:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Mar 2018 17:22:29 +0100
Message-Id: <1520266949-29817-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 05 Mar 2018 16:22:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 05 Mar 2018 16:22:36 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2] hw/arm: Use more CONFIG switches for the
 object files
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
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnLIm9rIEB+E

A lot of ARM object files are linked into the executable unconditionally,
even though we have corresponding CONFIG switches like CONFIG_PXA2XX or
CONFIG_OMAP. We should make sure to use these switches in the Makefile so
that the users can disable certain unwanted boards and devices more easily.
While we're at it, also add some new switches for the boards that do not
have a CONFIG option yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Fixed the miscategorization of the boards in v1
 - Add separate config switches for the boards that did not have a
   config switch yet.

 default-configs/arm-softmmu.mak |  7 +++++++
 hw/arm/Makefile.objs            | 30 +++++++++++++++++++++---------
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index d724106..96071c8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -47,6 +47,7 @@ CONFIG_A9MPCORE=y
 CONFIG_A15MPCORE=y
 
 CONFIG_ARM_V7M=y
+CONFIG_NETDUINO2=y
 
 CONFIG_ARM_GIC=y
 CONFIG_ARM_GIC_KVM=$(CONFIG_KVM)
@@ -109,6 +110,7 @@ CONFIG_TZ_PPC=y
 CONFIG_IOTKIT=y
 CONFIG_IOTKIT_SECCTL=y
 
+CONFIG_VERSATILE=y
 CONFIG_VERSATILE_PCI=y
 CONFIG_VERSATILE_I2C=y
 
@@ -117,6 +119,7 @@ CONFIG_VFIO_XGMAC=y
 CONFIG_VFIO_AMD_XGBE=y
 
 CONFIG_SDHCI=y
+CONFIG_INTEGRATOR=y
 CONFIG_INTEGRATOR_DEBUG=y
 
 CONFIG_ALLWINNER_A10_PIT=y
@@ -140,3 +143,7 @@ CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
 CONFIG_FW_CFG_DMA=y
 CONFIG_XILINX_AXI=y
+
+CONFIG_STRONGARM=y
+CONFIG_HIGHBANK=y
+CONFIG_MUSICPAL=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2322581..53611a7 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,15 +1,27 @@
-obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
-obj-$(CONFIG_DIGIC) += digic_boards.o
-obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
-obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
-obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
+obj-y += boot.o virt.o sysbus-fdt.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
-obj-y += netduino2.o
-obj-y += sysbus-fdt.o
+obj-$(CONFIG_DIGIC) += digic_boards.o
+obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
+obj-$(CONFIG_HIGHBANK) += highbank.o
+obj-$(CONFIG_INTEGRATOR) += integratorcp.o
+obj-$(CONFIG_MAINSTONE) += mainstone.o
+obj-$(CONFIG_MUSICPAL) += musicpal.o
+obj-$(CONFIG_NETDUINO2) += netduino2.o
+obj-$(CONFIG_NSERIES) += nseries.o
+obj-$(CONFIG_OMAP) += omap_sx1.o palm.o
+obj-$(CONFIG_PXA2XX) += gumstix.o spitz.o tosa.o z2.o
+obj-$(CONFIG_REALVIEW) += realview.o
+obj-$(CONFIG_STELLARIS) += stellaris.o
+obj-$(CONFIG_STRONGARM) += collie.o
+obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
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

