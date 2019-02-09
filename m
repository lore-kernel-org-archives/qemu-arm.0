Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp297643wrq;
        Fri, 8 Feb 2019 22:50:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbRN2sH2mxgqL8+uGxsllu+1Opko5+cbXzpPAVE2qAlJwRZaJJH2heizENMsANY0bq9Cmzt
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr1654494wmh.86.1549695011259;
        Fri, 08 Feb 2019 22:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695011; cv=none;
        d=google.com; s=arc-20160816;
        b=NWG7JmyOPeuUw6IlGaJA3gl8CmPaRWao5R8nIv6JCbsTgdyOTGjXM5HACEwHyHD+rr
         SgCnfBfoSOMfxlPnrawy8lL84R9QTeG9ysLHLZI5oYujKolUPWtVP0Oztuqb3IudL2by
         0Wy7XIRfI62URrCYtszz4JIronIX1BFHZoHgfqd0GsB3DgM3sheqRXlWw2QxEnwelSQD
         66JhF1oAWuddC5AK8GMR7ksanNsBXlcy5UEGCEW8It1PfzCf0vHj1+PAJhAGbNuoTDIZ
         8lAMxUqDqwR38mFTEOCv7sSFyQp9WfuYAiAZ3yqQQtNRiLONuyyz2mlmAlNSAZhwSbXR
         sP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=j5LvuFftslqHGyxZ78+C/i7lob+KyzprfzMF3M86nvA=;
        b=BdJca8bbjqM4xglaq0OLe7oXK9lPaeSMnAyGCAugdJWtY7vG4MueTGiDPPApjM7d7E
         3MTe41cKBboV1yQPHbI1QDwtg+gXU19ld/PQ43Vz9eezk+UlalycjgGMiAF9xzlawAd3
         a7hEp95JzbZb6y++pOwvLiA7rcPd3JGsNZfF1LJOIHbcAZhCq1dH7tVOmSEFl/BtzcAK
         Ki/68OcIX/yvpwsAhG9PEKL9EnZc7PSMdGHJ+rCweGMv4tGahEr0jHpmW9grqBXV2g2Y
         PX9HnMvEF5XHmlfIGfMjuEyiQ+SHSFFjAivLw5GOD3NOCfQY8PPjP0GvvBoQMNDEKo40
         Cccg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si723509wrq.207.2019.02.08.22.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:50:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMSo-0003XY-9N
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ1-0003cu-RC
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ1-0003Zg-1h
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJ0-0003Yr-Sa; Sat, 09 Feb 2019 01:40:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B4CA13CF2;
	Sat,  9 Feb 2019 06:40:02 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA0054505;
	Sat,  9 Feb 2019 06:40:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:15 +0100
Message-Id: <1549694366-1284-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 09 Feb 2019 06:40:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 14/25] hw/arm: Express dependencies of netduino /
 stm32f2xx with Kconfig
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
X-TUID: W158U2e4Jhuq

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

