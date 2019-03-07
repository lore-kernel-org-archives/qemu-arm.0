Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7219365wrx;
        Thu, 7 Mar 2019 06:40:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqweJbjFtQkv5Vq/2aDFYQOhlpOq8uIANKEcw0LC+zTtLu8CQFFARoPthOPwYhMzXuSkyAlf
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr10592918ybe.487.1551969644628;
        Thu, 07 Mar 2019 06:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969644; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9bLmZSPqPftzFBz2Eow31GeC98oajjnWuBtTYDl1D0yKNtoLo1b+5RvEmx47IyKYp
         n5dhLJnKAToanTb+f7krK2jQk4LVnWQyKkTd1JSzTw9DZAvD4Iamq2YQkyocaSwM2vZu
         A071pkBR2K3rJSTbdWR6hgtnm6IjNN5Dm357rUU3vQWabl1PzwzLmFdnOndTmhOyLKzM
         ivsvqOiy+bHnNtGu0k5vNfrZN5IjE0LncY6/cDFtFSb2skRtXUc0i+XyuY5pR/DWQKwL
         PpXyXK4uCiHyjvotp+PQC8iIdvjVprq4Kgnit1CyJj/2u5hLf6FDPCV2p5Pseq9c9ydn
         zPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=yXAUvnhPNwtPUPDaapzgTZKi3/+LeyD+hB+XC9pzHPo=;
        b=JzSUReBrWpVwEBUVU11R5MLFbiI8RJ5b/SVJFI2wNZcjmipsRhOQPjjB3w+KPRLAlz
         zQslZxN0qxgtCWF/xO+DSYb26uNBQEQzNQR6fBNy7pq6W0odY+E41Op7eQ2uPKMTr0XM
         ZDLhVPGUZamQSyQSSv7ehCI1PxMEOFcRQLKVpbnBez2q+GpQw5xonattYoFGpUcR8PRf
         /nZICKnCKQmqYC2/BFZsz4i92A5yVRLZoYhD5idP8kQaRAgoPRQ03uhAPHTwnbEV74gR
         lVCzygg1uKL9pIWfu+OG9T017HM9UIWg53oZgidGLc3r0fiV5THqJi8VK/Ue9GjTmOHQ
         saAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j72si2754268ywa.81.2019.03.07.06.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:40:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uCS-0005nf-2j
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:40:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuX-0006xS-NP
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuW-00023z-Ru
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tuW-0001o4-Id; Thu, 07 Mar 2019 09:22:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C661307CB20;
	Thu,  7 Mar 2019 14:22:00 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE64B5C1B5;
	Thu,  7 Mar 2019 14:21:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:47 +0100
Message-Id: <1551968334-18982-23-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 07 Mar 2019 14:22:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 22/29] hw/arm: Express dependencies of
 sabrelite with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g4aaycLwqM1x

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
index ed42e60..cff2925 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -181,6 +181,10 @@ config REALVIEW
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
 
+config SABRELITE
+    bool
+    select FSL_IMX6
+
 config STELLARIS
     bool
     select ARM_V7M
@@ -296,6 +300,9 @@ config FSL_IMX31
 
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

