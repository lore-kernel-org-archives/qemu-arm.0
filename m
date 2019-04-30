Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4408882wrh;
        Tue, 30 Apr 2019 00:26:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKcgom0EbVaFs8T/JsIHoZOqUcjfkrHi7NXf+Wub/Ex++4xZXU3RYDzG+9HzjUFaIv6JFY
X-Received: by 2002:a1c:5fc2:: with SMTP id t185mr2053452wmb.95.1556609207441;
        Tue, 30 Apr 2019 00:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609207; cv=none;
        d=google.com; s=arc-20160816;
        b=VAxc+YkqlkTkbPxt9k7+L5s450UX66fObzvgRrAFC1Vky5Px0hPtptqV4K2wUvPcYP
         DyvHvuEpt+j+lABHaoSF9kmPC9de8d9QiNnr3bcV2+MIloWGFSh8ElMvpneaA4MGbW/7
         cpLZzytqTvUAHfdLUGq+bZXl+M61/LV+64gwJi/P9bbikNCIr7UnXLCKYo95Y1eP0UM8
         XLAeyPVvo35Pt+uqCwORmIZSEM3W4BJ8d2YVD+9Jg9ArdOQBiuVyWMzQ7Ox4SuzSNWXH
         fiL9CpEWs586HgJ2bSJQJlVJWIy/3Ls8/UPd+AmSWZ6UKPGNOryCvYQLPXFxciiUTp2k
         vR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SteDNrWoVAGWNeVLxiPiyRKGO2Y8L0fTluD7Nf0P1fM=;
        b=OcVQMrq49WmZuF82zeHQ2+cMwbrmt/DMPh1qO4BX/YyGu+ZNT1uTrmAJVtScAIwBkU
         SrQyhhtK5wLn/IsnQSXQfu5jOtNu11v7aXz9jC3HlzQuyNgmvqSg/ZLy0l9XhYeM4U2B
         Qw9e+o6Vp1fiQaFXWxQOJg8QqKRbrR06SI8yUMpGtj8fivDPHCZjDzOh+3osWTcjTXsY
         q0OFfrVkUg9AiJysKrq5IzGhA+wxKW5x2Ha26OQHlOSUOTINAE+p65Yu5ipB4S5YfV4e
         qU5rIisnqUZQkxlwZcx2vFaS58Me9rKt3B4WD4s4ySie1K3rMjAhQelxwRxXFatmLy6V
         HTfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 91si933823wrc.76.2019.04.30.00.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNA6-0007ix-Aj
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:26:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN0Y-0007gI-Nv
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN0X-0004yi-Mc
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:16:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN0X-0004yU-F7; Tue, 30 Apr 2019 03:16:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 842D33086201;
	Tue, 30 Apr 2019 07:16:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C4F100200A;
	Tue, 30 Apr 2019 07:16:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:49 +0200
Message-Id: <20190430071405.16714-15-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 30 Apr 2019 07:16:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 14/30] hw/arm: Express dependencies of
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h7fc2SqAeEye

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

