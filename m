Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp292924wrq;
        Fri, 8 Feb 2019 22:41:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iaiup5T+zOFp7wAhQiVuy2nxZxi2uyjhHx26FtQypwIEHsPOQXLYBJ7XesoA7oJ4Nc1RUzq
X-Received: by 2002:a5d:6244:: with SMTP id m4mr18872278wrv.314.1549694508863;
        Fri, 08 Feb 2019 22:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694508; cv=none;
        d=google.com; s=arc-20160816;
        b=e0sEZCLql5bXSgWlEIc8tMfj6qVSQdKPAIpbqhe2TKaJR4HjT6mJqA9wW1VKF7LjTI
         XrtVDrqkYPg9fEe16K7FdMPMXFjY6MNtGPgGNm04+sFopkXsG0spCyMYe2QSv8yPqEoM
         gcwBOmFPggdHi1IvcbHI9Db922IlRd9SjyjttcQhBLlUs8YZ5F8uFdPjlaNBhSvBm2tN
         +RaUD1Q+OINk0f91CsCKzsIoTd3v+xRQOcNUSCjuZbM9c6KBLfqOHRy3fTzZx+o7hcS5
         7RETUo+vMY1Vw9z1WFVrYhldKpg5G0kKrwNqiqwavD5NoqzHyx5PxS4uPzvC7hK3FPCh
         g+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9TSLO6slJVWOE3ZJPDOBGsEiRM9IVHfKQJlhrFhRJnI=;
        b=EcHNDlTOvGtPiN9NlNWEyDeu3RG3fYFV1P6LkZEaw34sNVPqNLg06+8oTtMcUQbozu
         F3VdSssgHg9IreZ6mpy2oaZ5jhvmxoT50aT/8XvY9Jy9CgqpOBuzKJSzQ6Zx3BHIWf4z
         ctsLVBWXyGiX6xJRmQmZrhoKtdcAzfWQEaX80KISHHcSGGj4SFw9ywQiR/oo8RpgEkGA
         aaHFjwtS1Wh5nN6JLExFCGikWN2y9iMV2TdpkU8TP1Gw2cS/zJkFwYWZn3ymYIetTKaN
         TF3ySo+Rae7iMDLRR4HiSb8O488XBbwoWcnj0E+oGo63K2194oKGy+PoYnsZgkREcSy9
         jwHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si2950129wrp.224.2019.02.08.22.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMKh-00051r-Ss
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:41:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIx-0003XM-Lv
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003Rv-Rw
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIv-0003O7-9A; Sat, 09 Feb 2019 01:39:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9704DA909;
	Sat,  9 Feb 2019 06:39:54 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2194A62662;
	Sat,  9 Feb 2019 06:39:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:11 +0100
Message-Id: <1549694366-1284-11-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 09 Feb 2019 06:39:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 10/25] hw/arm: Express dependencies of
 xilinx-zynq with Kconfig
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
X-TUID: DaCSfSMI1tgk

Add Kconfig dependencies for the xilinx-zynq-a9 board.
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 1db76f6..5c43bb3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -15,6 +15,7 @@ CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
+CONFIG_ZYNQ=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
@@ -34,16 +35,11 @@ CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_PL330=3Dy
-CONFIG_CADENCE=3Dy
 CONFIG_FRAMEBUFFER=3Dy
-CONFIG_XILINX_SPIPS=3Dy
-CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_DIGIC=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_ZYNQ=3Dy
 CONFIG_STM32F2XX_TIMER=3Dy
 CONFIG_STM32F2XX_USART=3Dy
 CONFIG_STM32F2XX_SYSCFG=3Dy
@@ -98,7 +94,6 @@ CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
-CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 95f2713..67f1228 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -208,6 +208,20 @@ config VEXPRESS
=20
 config ZYNQ
     bool
+    select A9MPCORE
+    select CADENCE # UART
+    select PCI
+    select PFLASH_CFI02
+    select PL330
+    select SDHCI
+    select SSI_M25P80
+    select USB_EHCI
+    select USB_EHCI_SYSBUS
+    select XILINX # UART
+    select XILINX_AXI
+    select XILINX_SPI
+    select XILINX_SPIPS
+    select ZYNQ_DEVCFG
=20
 config ARM_V7M
     bool
--=20
1.8.3.1

