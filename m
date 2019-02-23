Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7791324wrx;
        Sat, 23 Feb 2019 00:05:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZGg4tcIdKpBwVYBjRIoDm7+WF3C332OuyDnTrJe1+oIy83+4w4lFuXexJA2bYPO0PeyNSX
X-Received: by 2002:a25:5f49:: with SMTP id h9mr6442628ybm.232.1550909133293;
        Sat, 23 Feb 2019 00:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909133; cv=none;
        d=google.com; s=arc-20160816;
        b=H3i8WTd+AY9I1SgiAWuo/sBZuIEr/GHl/RE8DusixZsJ/Lgd2l3WzpYP9qLO2c/oFe
         jkMgO7MYmRWyv3xdfEzA2KNUu+mSY12gBT+unb8CY7M65K3x/feVzBwsK7fnZ+jDBn/9
         0QuYQcXEKK8zcmhWjB37YHTCXmPEUbDLqZd2gX6IAiCEnr4EUSKSAB4PmXIRXobKrogz
         bkM4IYADGPQN32txfvpsutsGP8Ru4ugMainryxRdmOL+iDyf+3eDsDhtKYcAgojhyb00
         NhPbHezKgqgKZe37gSAntTwcbQJTCcK2SrVtIg0UpbiAE+F4/6XSb0JjVNj19Oacu9ge
         Phew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=4MfQh09m3FULHIJoY+68kxpdbpZEZMJsoUYZlXzpcVQ=;
        b=qn4tRQ/k8W1LUggm1oRIISjGt3ltm46mMXplJmXMHuD//2+5SGEPTdVP6c1tFhX8U7
         1DO5XHDLf/Aux5sQllyj5teUw4GbmjbQBtek2XGh4Bg9ORdB3Ogw1B2wimc7RR/gpHw3
         qnSxDqPzDfzmXDgh7/OJAcQA6SXI2P8Q0JOzBqOTmyQvxcmKDs6UyWi9gESvjXj8RAXp
         75H1BQro1zwsqICMXI8FrMqQ+cQoU3XO4ve1CMEQy/ubjnW40p0iNVTpCHqxyR5tV6jr
         J7ddOer1I0Wp7+zNK8xY03anrpXqvIh1yqa9+3iC/TORLUVcMRSTOPh2cyMG3pXcjpzt
         4tRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k71si1789246ywe.256.2019.02.23.00.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:05:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSJQ-0007t8-OR
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4w-0005Az-QI
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4s-0002iP-Bf
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4e-0002UV-Ln; Sat, 23 Feb 2019 02:50:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF6E33082B52;
	Sat, 23 Feb 2019 07:50:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 933725D9CA;
	Sat, 23 Feb 2019 07:50:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:15 +0100
Message-Id: <1550908162-22644-24-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sat, 23 Feb 2019 07:50:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 23/30] hw/arm: Express dependencies of
 sabrelite with Kconfig
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XUHvNhzLZUWc

Add Kconfig dependencies for the Sabrelite / iMX6 machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 7 +++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 53609ea..9150858 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -30,6 +30,7 @@ CONFIG_NETDUINO2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
+CONFIG_SABRELITE=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
@@ -37,13 +38,10 @@ CONFIG_IMX_FEC=y
 
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
index dbdc02c..8418047 100644
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
@@ -302,6 +306,9 @@ config FSL_IMX31
 
 config FSL_IMX6
     bool
+    select A9MPCORE
+    select IMX
+    select IMX_I2C
 
 config ASPEED_SOC
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4f591ca..fadd698 100644
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

