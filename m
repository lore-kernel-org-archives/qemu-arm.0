Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1659904wrp;
        Wed, 13 Feb 2019 00:53:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ/IKH0ytA06kvciRDA+PFjk0D19bNTmKrSxrV3vh2VJpiy6f3+WThmK26lX12A/aTas1Mt
X-Received: by 2002:a5b:5c1:: with SMTP id w1mr6428557ybp.264.1550048017085;
        Wed, 13 Feb 2019 00:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048017; cv=none;
        d=google.com; s=arc-20160816;
        b=PdhHeRQ5UUhdg1wYFbcDJxvYm5DmF8whrIMFKmdMwV36eVeQzGjPrFu/HFIe7m2OfK
         qoqNXR15uylE1hYhcyOXF/GHcVkYgulf9jgI8+mESxy4xV5JWesE6v+4hkfb4RqCPF4Z
         PXS565ObyfAo3mDpVmpM1EaZiCxzL1vnaI3mbmE+xk3+IQnzwrKRO1TvMgek+xBIMR8g
         pjILTc9Y5VCtw7gLzKjWx7jBJ2FZvTl6CCGAd2mfJsuIy86spQ68Nut3mSg0VTRLq5sD
         JqCCdelNJedocsg6hz45zA9Ebmmzzui19mvN4wC+14Drb3uZfv/GmbWkQkljt/f2G0h8
         KC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Y4ENlnHffeIxGN4zNxEBH9o3qSWsTW43AO9Xsr4N5dA=;
        b=P1AuaNuW9eYLqKWf/0T1MJec9CXQcGMeQzl3Vv8Odh97PabiMiWMaaKMxuwxQZ9jwP
         wuXHkBLjZRi9SfUBvMZFsTvBov2x5QrKlG/bnc1wY2RipC3v80BpoIatBr3vXlb06u/v
         tRlXVM9El7JNsnMQybyi3C5fRFLTNaXEN/4umqbsIUYZ9JAA20cB9gVbIULP5L8VzqTu
         oU5L/KdiSi5M0m5noqxhN6/ZLg9bkEYWmg2zteF42GNVxBbUrGt95Jpt+rMEBxHXQClw
         bzZ74AhvdvAH2C0HUhBPjMUXrJjbyc3IQmqAiqr2H1Wg8U3GS675wl/bDuA/fxBFFM7z
         GOcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g72si4115601ybf.271.2019.02.13.00.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqIS-0004K4-Ci
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:53:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqFy-00023s-Qy
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq59-00068q-Jw
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq58-00066F-TQ; Wed, 13 Feb 2019 03:39:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430F8C06A814;
	Wed, 13 Feb 2019 08:39:49 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1DB71024904;
	Wed, 13 Feb 2019 08:39:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:15 +0100
Message-Id: <1550047098-1210-23-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Feb 2019 08:39:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 22/25] hw/arm: Express dependencies of the
 microbit / nrf51 machine with Kconfig
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
X-TUID: k2ruY6b2ETUW

Add Kconfig dependencies for the NRF51 / microbit machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 6 ++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ebe5de6..c1bc6ac 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,11 +31,10 @@ CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
+CONFIG_MICROBIT=y
 
 CONFIG_VGA=y
 
-CONFIG_NRF51_SOC=y
-
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c2fba8e..3d96d1b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,8 +373,14 @@ config FSL_IMX6UL
     select IMX_I2C
     select SDHCI
 
+config MICROBIT
+    bool
+    select NRF51_SOC
+
 config NRF51_SOC
     bool
+    select I2C
+    select ARM_V7M
 
 config EMCRAFT_SF2
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 29dc7d9..88b90ca 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
 obj-$(CONFIG_HIGHBANK) += highbank.o
 obj-$(CONFIG_INTEGRATOR) += integratorcp.o
 obj-$(CONFIG_MAINSTONE) += mainstone.o
+obj-$(CONFIG_MICROBIT) += microbit.o
 obj-$(CONFIG_MUSICPAL) += musicpal.o
 obj-$(CONFIG_NETDUINO2) += netduino2.o
 obj-$(CONFIG_NSERIES) += nseries.o
@@ -47,4 +48,4 @@ obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
-- 
1.8.3.1

