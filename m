Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1433214wrh;
        Sun, 5 May 2019 07:03:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz56HI/UklSgzIii1K7tLd2Zhei/MiWQf+3D2gUKy/zFTog20OweBagNeXZPpBBew1n2Vaa
X-Received: by 2002:a1c:b189:: with SMTP id a131mr13182866wmf.107.1557064991266;
        Sun, 05 May 2019 07:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064991; cv=none;
        d=google.com; s=arc-20160816;
        b=kEXxemSPUfsH9tDOUCNRqotLxQWvr+Jaz5jX+L18Q4Kj4NGcCVVLmBb3jSCX4hh3rt
         fuQPV/CquKMQzHQz2uiQutTuLWIBPPHUhXOobAzapJZP3IcXJvKxKwspkQJ0pq5PM6W0
         CpByVKcAAqnEXEN+5skMLSAfnsGbSou5ptYhP/bctXxZiHNMYfdvB1G38FLVmnBw+IlZ
         BQ1mwk/ehBfqpePhOxJijhN4Zxrcn+jweuixkSgOhe+ys/ywa0wxQT8Qw5sS3ADhNrFl
         6ScQWKUjpD7mxS4O0OGkYhVPNdw/Fyz2uMCDhy4q073fCemElvMAI/4K+gOKX3eJTThE
         0iAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SteDNrWoVAGWNeVLxiPiyRKGO2Y8L0fTluD7Nf0P1fM=;
        b=EutcV8Hwus5LAmhq8+MODplb3kTmCO1MAwquO1I+HISpjY+VoQEfclh4wlTrCsLZfG
         lIuP/LGBv+J3v3+cBAryIRhZuG+mv2uE+o0/RvD9imA5mZTwNt12YIABxcC+N0ZSwC2e
         m4S65MAzakqmBHofu2tbhl4IBHco3U2S8b+yy4m67uBk0zxUY7ixaGCiWZJLRWhuqI+I
         8SNE434huKV8dOfCGJPB9NpVhhFh/1aAnAlW1AUp7D7SszXcS4xAZGl97Eu/goLppZXV
         udlG6Aj2cV3heJSEnwQ/+U33jo8bEHNW6O7fm+nKHrI1OUKZ5Wh6K8EpIJoNW000joOL
         AaRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si5266818wma.63.2019.05.05.07.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHjS-000060-77
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:03:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe8-0004H1-EL
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe7-0004nE-ED
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHe4-0004kS-Em; Sun, 05 May 2019 09:57:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6262307D93E;
	Sun,  5 May 2019 13:57:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0FA160C18;
	Sun,  5 May 2019 13:57:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:58 +0200
Message-Id: <20190505135714.11277-13-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 05 May 2019 13:57:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 12/28] hw/arm: Express dependencies of
 xilinx-zynq with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7BwCk5dlaQg

Add Kconfig dependencies for the xilinx-zynq-a9 board.
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index f39a854f2e..af78e7c892 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -19,6 +19,7 @@ CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
+CONFIG_ZYNQ=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
@@ -38,16 +39,11 @@ CONFIG_VIRTIO_MMIO=3Dy
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
@@ -100,7 +96,6 @@ CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
-CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 79706ed0ce..dfdc1b1fd6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -202,6 +202,18 @@ config VEXPRESS
=20
 config ZYNQ
     bool
+    select A9MPCORE
+    select CADENCE # UART
+    select PFLASH_CFI02
+    select PL330
+    select SDHCI
+    select SSI_M25P80
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
2.21.0

