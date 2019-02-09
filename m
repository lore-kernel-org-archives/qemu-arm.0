Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp297147wrq;
        Fri, 8 Feb 2019 22:49:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbPwmPffMel/G0VaZ5ek3py8Tcyw4K7qkKOHMaZP0qm8vLnWJ2OJmRuxSUhXdxoJuagSf4p
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr1646174wmh.56.1549694957752;
        Fri, 08 Feb 2019 22:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694957; cv=none;
        d=google.com; s=arc-20160816;
        b=hzrnZQ7eJQKygqpQ+qun/MjgAmUdAlddrO/RJGg445zxkfMiZS3j0C8WSvdJKDaC/M
         sqfuLFH3lMdHQ48Bgyo5DkEVKpVYp9P3Y1f5sufxmCF1SL+NV3dA4DRfgjLjSZ2w6yCP
         7aZBYfs67yI992yr3caep8xaZEa8Fei4wTQMnJAYw7M+7ekfhan9uDIkdi5jZqSdAnJf
         hcqm0tyyiAoaJUaFALGzSypb+9AVFK1WQp3OXp+4sblFBe9CUuJOTWLE7F+PgG58VoKg
         OnZcounqoCYrqdzPlYwh9GvXjNu2pXtU0RLgYRDPWnhJdVmdYpiz3gs+s3UKGH2wZlHf
         RB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=uDufwt9Dz4teyJGIhmrW/j1uQMVaLmrnnrII/yGEKMY=;
        b=kED2gKeetnA4f17o0NMCJdNxHKRzZyXDB334Wqn5GEHH6U3c5/A+PO1qBINwrzLCmT
         wqF+0GjXReKzpivxyLQs29VH5rL0XEuPS2lon5R3Cn1xR2wDr/dQFOVQ30v0HqjxtoIF
         AdSXH0rqicEbjfwyX58MhvnOZCYr0oNpI+5EkajMNZVNJsuB0GK62IaKrutNo28cp8rT
         3CczzvQViCeuA/evIYt9xHPjeGTE/uqS6yxdTjUziYw8fcIax1U23lZmOWp11gOTXVGx
         tkAXvYIqdMjD3noHeNYJgWMFmyI1A4nF80OrehZcSGSx1KzZaEZ+Rbj+PBb/rkX1QbqC
         i8JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c126si2921817wma.194.2019.02.08.22.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMRw-0002oP-P5
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:49:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJn-0004SO-Q8
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJl-0004Rb-MZ
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJl-0003sH-Av; Sat, 09 Feb 2019 01:40:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6F587F3F4;
	Sat,  9 Feb 2019 06:40:22 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 766D762662;
	Sat,  9 Feb 2019 06:40:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:20 +0100
Message-Id: <1549694366-1284-20-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 09 Feb 2019 06:40:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 19/25] hw/arm: Express dependencies of sabrelite
 with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uicEkBfPe0ri

Add Kconfig dependencies for the Sabrelite / iMX6 machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 7 +++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 20fcbcb..f6193b1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -29,6 +29,7 @@ CONFIG_NETDUINO2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
+CONFIG_SABRELITE=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
@@ -36,13 +37,10 @@ CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
 
-CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 
-CONFIG_IMX_I2C=y
-
 CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 617a460..d98d39e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -184,6 +184,10 @@ config REALVIEW
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
 
+config SABRELITE
+    bool
+    select FSL_IMX6
+
 config STELLARIS
     bool
     select ARM_V7M
@@ -304,6 +308,9 @@ config FSL_IMX31
 
 config FSL_IMX6
     bool
+    select A9MPCORE
+    select IMX
+    select IMX_I2C
 
 config ASPEED_SOC
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index f17187f..ee9f5c6 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -22,6 +22,7 @@ obj-$(CONFIG_COLLIE) += collie.o
 obj-$(CONFIG_VERSATILE) += versatilepb.o
 obj-$(CONFIG_VEXPRESS) += vexpress.o
 obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
+obj-$(CONFIG_SABRELITE) += sabrelite.o
 
 obj-$(CONFIG_ARM_V7M) += armv7m.o
 obj-$(CONFIG_EXYNOS4) += exynos4210.o
@@ -36,7 +37,7 @@ obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
-obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
+obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MPS2) += mps2-tz.o
-- 
1.8.3.1

