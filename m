Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1661047wrp;
        Wed, 13 Feb 2019 00:55:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ+l8JNbQZs0EQ/1vzm+RACXp+wWGMuJpvMVwN9/TD4BWEqLVlDbVqRYspCpy9WDGEvYl5w
X-Received: by 2002:a81:8a45:: with SMTP id a66mr3533693ywg.325.1550048124611;
        Wed, 13 Feb 2019 00:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048124; cv=none;
        d=google.com; s=arc-20160816;
        b=iAyiVM4BCmJIx7t/Ih5D4KkULXbrszPvRAzWWK9gn3LXCZmiSTO4tQAis2KunI92YW
         IA1wFsJOHYdMAxPWVxKGFd8cBQbueaXpBL2gi9I6Hp9KVTx3BgJlpJxClokhNOS9BKyY
         gtGfFjac9Sm+Svo5Y7r2sAyLgAShOnjOOBUU9wfBwaXXm0QO1drj67fzyk4i/Wzl4lEG
         qEu5B0fcC5TPyTf5qJSul5zm7dd+Hry42mAJ5NktWT+NwoO8OxfmWEvF46p5OC99h31h
         3LW2cnNHOjgccrxRoHQ8NDQMuPgFcwcE8HzM0/efKuPIp0ZEAaP5uTtSZbEnPP1bYKFu
         p1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ANSuOjLWDyhSvcIoXT+uS8PYK6ijkQySV8SHOCymeCo=;
        b=b2IeG/EXh756oDsBM9cE98oUohQacRSOCDy+2rsgaKKWX06Uy/YuBtqS3L+Mps5cIV
         ZePEK2aTsKbmp7Zuclhvv/voPuNnPaAAlXx/VA69Kd8OPZ7bfNTzCCtYHvozWbYYaPgS
         9QKpXz576D9xkl8OA/0WwIvKOAxu4YiwInl4k0w+/7fuFKWaN+kXrhY7EHdKRG6C3zas
         97u0wkY4YSk5aergTxQm/+bZBIviwK35c6yfPcTjmGutsVBvXWTaLOepOXkklOypHu9O
         ik6onteYww8Q/qMc0NKgM38NKINzwqA2OJkNHe4aSEpaoH5ICSuOKpzu9ojDgWNhty0B
         lwqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r130si9285910ywb.399.2019.02.13.00.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:55:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqKB-0005vm-UA
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG0-00025D-Q4
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4x-0005zz-8q
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4x-0005ys-2s; Wed, 13 Feb 2019 03:39:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A86EC058CB7;
	Wed, 13 Feb 2019 08:39:38 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF17010021B6;
	Wed, 13 Feb 2019 08:39:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:12 +0100
Message-Id: <1550047098-1210-20-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Feb 2019 08:39:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 19/25] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOmRZ5JyrMSY

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
index 80a3b1f..70fc73f 100644
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

