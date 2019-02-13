Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1664283wrp;
        Wed, 13 Feb 2019 01:00:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbNabrBJ5F04QsHcjf2eUvoxFwSUczXXtsoefpKRhg2ngwh4legP43aJqg+wdH0ggFBADXy
X-Received: by 2002:a81:5e86:: with SMTP id s128mr3884987ywb.134.1550048407763;
        Wed, 13 Feb 2019 01:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048407; cv=none;
        d=google.com; s=arc-20160816;
        b=JuRvQFE66WNjrLFgs6LueUJbBfbtrHKW+U+kJxd+c0jP/69DZbXKiaNhCzwYDmR4oE
         GnGarYe55xCGctU5zhByOELdH7W3XAB/4CpOkw0FBHkfOd8hsfzEORczUD8VT3XiBKVQ
         3g3Red4chH21NYiYSu1rLrqsPk2x7WYaLzn+uXYq4zkORv+menNCeeHRSrxiAZz5CpV1
         rOTJZRiQJMV0q6PMhvpooOXPCe6MYzqDAOAz5tfAk5/YcT+HO89f0QKV1xzO3qA6PRKN
         v+eRhSFXf2psFmV/IMKGLhsQNAxVIMMtylzDJNaR6kzDBxcDNvJ+YZ+NeWYZY5VGEr6Z
         n1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=j5LvuFftslqHGyxZ78+C/i7lob+KyzprfzMF3M86nvA=;
        b=McPRtEc1xQeiivf+kApfvVAYzB429asun0PfbKpZdjlC281ho7VDurUp9ADXmrIi+i
         h5n5qskCtmxCoF55F0e4/CoBEj/l87oAhRR4kZ+poD+ED4gD07eMK138+18lhrEbWYZV
         IZq2UZydXb98xBm9bLwLdFCXPwCS07EitgVIG58tDcubozixx8uT5KEs7934c352qAga
         foshLRg12fFcJeqv6n8qlx/EPgzf6+/6G0/ZljXR/Q0sETYkkqyjx/sufyJM5x5T6sMq
         FJ7kpG/UjR6AS6XqBzAvFFl/xV5cuWjbnhymNgQGJ1nT+iHMvklwfIK9skdB7c1Ou5gA
         fCsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f68si5250382ywe.211.2019.02.13.01.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqOl-0001fe-41
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:00:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG3-000256-4t
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4r-0005qs-7G
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4l-0005iL-KH; Wed, 13 Feb 2019 03:39:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D9DD89AE0;
	Wed, 13 Feb 2019 08:39:19 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8792710021B6;
	Wed, 13 Feb 2019 08:39:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:07 +0100
Message-Id: <1550047098-1210-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 13 Feb 2019 08:39:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 14/25] hw/arm: Express dependencies of
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
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: igP3QAbTele0

Netduino only depends on the stm32f205 SoC which in turn depends on
its components.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 9 +--------
 hw/arm/Kconfig                  | 7 +++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 9db6808..3279fb5 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -24,25 +24,18 @@ CONFIG_TOSA=y
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
index 3d580fa..5d7dafb 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -81,6 +81,7 @@ config MUSICPAL
 
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

