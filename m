Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp928661wrx;
        Thu, 18 Apr 2019 11:09:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMMsuf/y6WyE89TjZlUX6fu2P64VY80ugy7imT7sF4imrMHrtzNKh9QJYpQ9y7iBa5QCYH
X-Received: by 2002:a5d:6184:: with SMTP id j4mr5223356wru.317.1555610956889;
        Thu, 18 Apr 2019 11:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555610956; cv=none;
        d=google.com; s=arc-20160816;
        b=PsLtanqTq10dIXzUvxzyCQcFNelWzc/RZ0dLRe2A9s04uDGjj1Fj4n6OjCqPPV7lhB
         +6iV6vvKO26X0lZmFi4iuDRv7MJlJ/JUho0u+s0s6kP9jI/tg6hS/ASiY7SW9FctmntW
         pkvfi0nV34gh7/kcUywIhm37oeSsGPHsVviPqPw3Vc/jGKfgF8ILPr9Vp13PSKq/GyWc
         BmLhSrXK/nu1ifMqiRdbnvSNsDv6pWHu5zyEoQwjsuwBrKijWowhP2SNFByUyLUyw8iB
         IW/805AhL9cEAqguZooXyvfpM01+8j9xL6xFAiXlVgdiYof3m9En9Fk7oRB+D3Eagta0
         MuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vbecLoR04RLyl2lFC3x0ylwDoxmDr6LMDVdMeHxpjTY=;
        b=I5c3R7rU9Msivpi1pYprBAbcqQgDK8QPwGvCDKjfRxRWva4v/Y2mEZBBiBzp7xFcnq
         +7TRtATkXHsQjIliJkg35nL8xPmJytPR2GlWBxNX7tYca5hS3BB06zC5Z3y31nJed7UA
         FbPGfLpHFmYJwIcRJZO5P7cWV42Ru9sncQmHDyVl5h9Wc68yRALEsp9XaReiawBly7X+
         2sR7nqewl+FCaMWOPnSOUnbJNIv20wvy3gnGiJ/Oexld7dmMqsw4qrvWzKRSM13NR76v
         Hjlzc4qUUqB/vXnZm9LecWDnqLiFQ4WkXmlpURNubXo2J0fkSj0Bv3uMuQno9LvVDZii
         7r7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24si1953911wmc.92.2019.04.18.11.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBTH-0008Tg-P6
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:09:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBO2-0004Jz-PB
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBO0-0002fL-84
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:03:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBNx-0002eB-Gf; Thu, 18 Apr 2019 14:03:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 443D2307CB3B;
	Thu, 18 Apr 2019 18:03:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6D851001E66;
	Thu, 18 Apr 2019 18:03:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:45 +0200
Message-Id: <20190418180057.3593-18-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Apr 2019 18:03:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 17/29] hw/arm: Express
 dependencies of netduino / stm32f2xx with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hkVWeR9Huz1t

Netduino only depends on the stm32f205 SoC which in turn depends on
its components.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 4d0febf644..49306d6419 100644
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
@@ -250,6 +251,12 @@ config RASPI
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

