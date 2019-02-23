Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7790380wrx;
        Sat, 23 Feb 2019 00:04:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib3mA3SbYkV55mXU0TAgaiT0M89A/tNsfM9m8Z15d54VkNvPPT6a3Tz8kKDe/v1eC9vYcOo
X-Received: by 2002:a0d:f344:: with SMTP id c65mr6348138ywf.77.1550909059728;
        Sat, 23 Feb 2019 00:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909059; cv=none;
        d=google.com; s=arc-20160816;
        b=wQB1IiwNUr4iNWLucpPvv7d6oMJd5OiPZNsLaPYJ/ym7x7uwMJvmAUF6EifLDK3c2p
         6U3uoabTDiILa9JI/Mlht7QgTOErMaDU3FLNbfcAxMzBai0n4D2cjXGINkNpqUBKZvZQ
         IAO3S+3Bx1teKEhg3mRwRKFS3nKulUNCZ97UmusYDQwPPKu75V5F9Kj5F1o+zXkwrcCa
         R9CZ1Mdm6pP9QXICBx0EcQXXLWtLYELiyFjxUxMA5IG6ER4QUCv5IaD21ZNkTtimr84O
         MKoskRo1C9WenRGp5Ia9wIa9kJQC60ttsDbVd/ZhRrnNGF8k2P5INwpyTCytDB5WH2XM
         a9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=195uq+wXJTJGiMLKd/jnoPCsjQmpgV1tFsvmJ0cRy3Q=;
        b=YC1Pa1SNVgcra9RqNL2+k4rLExcSmd3gf4ICc2mX8nJ873eD6H0Qwij7f/VkxSbrXc
         BSBc/VXrqNgk67O8ABxn22dCYNV6ZxNUmuzfElC++KTZpINVfkyOwB2Hay5ZVyWpRQfs
         d+oDMUKS8fdsRhOuSnc9zoFEYbpXiFY4CWf5UApGhXv7no68hEjCsTOu4LbY+pbG5EXh
         EBOWRHx9RxbKnTvqdNrO7ziReNxxVPU7L3OAorAsssF4+wWxIcDUvthM+xN2vT6SGpZT
         3MA4DDyKyc5IppEV51J5TIImeaXDyjJcb8Y5rj4r4sGjm3sXUD5I51JjfX6y05K4LK4b
         KiIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si2211991ybj.43.2019.02.23.00.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSIF-00074v-68
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4W-0004kp-Gx
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4V-0002GR-Jt
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4V-0002Bh-7u; Sat, 23 Feb 2019 02:50:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E662307DAC1;
	Sat, 23 Feb 2019 07:50:02 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 098DC5D9CA;
	Sat, 23 Feb 2019 07:50:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:10 +0100
Message-Id: <1550908162-22644-19-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 23 Feb 2019 07:50:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 18/30] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wJ6qCPyJX29B

Netduino only depends on the stm32f205 SoC which in turn depends on
its components.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 9 +--------
 hw/arm/Kconfig                  | 7 +++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 62d6b96..b0c6c99 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -25,25 +25,18 @@ CONFIG_TOSA=y
 CONFIG_Z2=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
+CONFIG_NETDUINO2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
 
-CONFIG_NETDUINO2=y
-
 CONFIG_FRAMEBUFFER=y
 
 CONFIG_DIGIC=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
-CONFIG_STM32F2XX_TIMER=y
-CONFIG_STM32F2XX_USART=y
-CONFIG_STM32F2XX_SYSCFG=y
-CONFIG_STM32F2XX_ADC=y
-CONFIG_STM32F2XX_SPI=y
-CONFIG_STM32F205_SOC=y
 CONFIG_NRF51_SOC=y
 
 CONFIG_CMSDK_APB_TIMER=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 487fb03..34243b4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -87,6 +87,7 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    select STM32F205_SOC
 
 config NSERIES
     bool
@@ -262,6 +263,12 @@ config RASPI
 
 config STM32F205_SOC
     bool
+    select ARM_V7M
+    select STM32F2XX_TIMER
+    select STM32F2XX_USART
+    select STM32F2XX_SYSCFG
+    select STM32F2XX_ADC
+    select STM32F2XX_SPI
 
 config XLNX_ZYNQMP_ARM
     bool
-- 
1.8.3.1

