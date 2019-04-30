Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4408991wrh;
        Tue, 30 Apr 2019 00:26:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMa88T61oWkAPL7G7VC4v7AIuglvB9BF3YBI/7IEhcoY6VvB1q62L6y+oj+QOABy0noPwY
X-Received: by 2002:a1c:3507:: with SMTP id c7mr1921444wma.20.1556609218509;
        Tue, 30 Apr 2019 00:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609218; cv=none;
        d=google.com; s=arc-20160816;
        b=zENvmA6VhNpqY2Gzx2dd9KxBrYmHs3VZfq7vHgyKtFJe9TSnRa4LfOSokznblrpe1K
         dV/ChUcamgCcM1Ab4AyvF3SBUAVFpcMuC6xKKVDS5QHezWayylk1H+kCjnKUWZvoDOi0
         VphNR8gf9CYo7h63/1+b4vKrdFV708D8s3RNnhspKQzBbFabrrcEHYM/ea6ea9yBQiCc
         nmmQjMCQ4QasKraIhSWC3yHl265zWm/1vYXBhiDayhzYoGy/Ex/TWQmzUj5qm3ygieRI
         6pdh/kWTJjVHcMn1Dg7tBE72c4TB5Ls/qoKfOl6ZwFPfMGzHthZeE/H2PeNmLYdyeB8+
         bHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mj26zBl6ClvK0VEh6wI6AOTqnZ4caftrsD3I8ZESunA=;
        b=iTem6N939v3/RfwAPDB7ijYfpk6uB+2bc/SY5QJlO6+Am/FToP/VnqNzeHNu13d2xK
         hH8Ktb+BwTjoENWnux8oMjFefE98th2zSliG7a8xUSZ9HB9fYDFo1W14+gljoktgR1f6
         4ZIs6JyRXaIxc2+Z3zPl49iOc657Ls2BZVfjOmxbmsSoDNLNF1buQ0ovT2JYbr7myqaQ
         7i43Di05Z7FN98TVn3D4y+6cdru3pk878uyiFQWsuxyjQxLSb1R2LokblCl9L9Kd9okq
         LXi94k1CtCIi+tia1e9Qk6xt7gebplx78m4ITZYtFXGq+rsZmlz2XFgRrh0CnkNqZauv
         raYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si19471359wrv.161.2019.04.30.00.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNAH-0007sv-Ir
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:26:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN1F-0008DX-N0
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN1E-0005CB-Qa
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:17:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN1E-0005C3-Lf; Tue, 30 Apr 2019 03:17:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B87BD859FB;
	Tue, 30 Apr 2019 07:17:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7EAF1001E85;
	Tue, 30 Apr 2019 07:17:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:53 +0200
Message-Id: <20190430071405.16714-19-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 30 Apr 2019 07:17:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 18/30] hw/arm: Express dependencies of
 netduino / stm32f2xx with Kconfig
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
X-TUID: chQrT6slgDHj

Netduino only depends on the stm32f205 SoC which in turn depends on
its components.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 9 +--------
 hw/arm/Kconfig                  | 7 +++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index f440a2b1cd..c86a9f5427 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -28,25 +28,18 @@ CONFIG_TOSA=3Dy
 CONFIG_Z2=3Dy
 CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
+CONFIG_NETDUINO2=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
=20
-CONFIG_NETDUINO2=3Dy
-
 CONFIG_FRAMEBUFFER=3Dy
=20
 CONFIG_DIGIC=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_STM32F2XX_TIMER=3Dy
-CONFIG_STM32F2XX_USART=3Dy
-CONFIG_STM32F2XX_SYSCFG=3Dy
-CONFIG_STM32F2XX_ADC=3Dy
-CONFIG_STM32F2XX_SPI=3Dy
-CONFIG_STM32F205_SOC=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
 CONFIG_CMSDK_APB_TIMER=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2b63adb667..25ba109773 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -81,6 +81,7 @@ config MUSICPAL
=20
 config NETDUINO2
     bool
+    select STM32F205_SOC
=20
 config NSERIES
     bool
@@ -251,6 +252,12 @@ config RASPI
=20
 config STM32F205_SOC
     bool
+    select ARM_V7M
+    select STM32F2XX_TIMER
+    select STM32F2XX_USART
+    select STM32F2XX_SYSCFG
+    select STM32F2XX_ADC
+    select STM32F2XX_SPI
=20
 config XLNX_ZYNQMP_ARM
     bool
--=20
2.21.0

