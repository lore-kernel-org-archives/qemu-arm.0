Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7212480wrx;
        Thu, 7 Mar 2019 06:34:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxj2tZItDo5qWR4aRz9JlvdO+Rx0NSuMOdJHioD/t3Yr6Zc0k3zYu0vclCtfE2NWEPwRDK
X-Received: by 2002:a25:1454:: with SMTP id 81mr11734769ybu.421.1551969249466;
        Thu, 07 Mar 2019 06:34:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969249; cv=none;
        d=google.com; s=arc-20160816;
        b=ME8b+JKZtb3mMIy+nfNOm514y1mjPINMY2ysDlX6HBC4vkD8p9f6ngRdN2nrJiYHCG
         Yya08TPK5gWcwnfSnxAvalPqvUaWPaB4rZ4slZU8NCuMZPu9yRy55uajWztI9f6mngjE
         ovF4X9YyMnkF/nCSTvQhY5JBW+hHe7WjoS/x2pwgHZ8PvpzjK/RJd7QqWLHHiKhQMGTg
         GQg3lXVuwnRRegp4cdH/v0DPsrzeh0Kk+0sA3Z0XG3yybILqVg4VFD4r1ntgDh1BQn1I
         PNxPay/mL9YCxogWY+frdQdNdMSDojmFhPIu/dE+INEUc910HzMg/OnDmdRNMmvpWb8D
         nKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Jkv5M68w5sRdKE3OxmwTPdlzUGPew4STbM6JNPjvrWw=;
        b=b1NK/iSZd6dCEGXw9q3GOEW3hlVxiPHLZLobE1W4aaYHhI+tkqorTwZi+ebZHdhOOh
         4xyqymAIyB6d8/NlMLYWy9Co0f1CaPoDg5OgnNbX4exYNOUAnKSdk2gCXvCZ9E87tE7g
         NLBwVeUvDF6YQWJ5s02teWFEj023eJj3Ft/Agz7sHMuKJsAG05qiUzIDLMprSlBmGZS+
         E1vLWs2IZTt9vmWP64GEvGzeq+RzfegxZUtIUCEc/Lj50Av3VhfGD51ocwkWpu+5s6uk
         fZ5zsXqkdjoJ2qEAbEBvECFgXqp2ZSEqF995GCdBlZkWdlUh1YhLfnfTPXfF72vluCY3
         X6Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2783881ybg.275.2019.03.07.06.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:34:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u64-0000We-Sz
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tti-0006AP-MY
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tti-0001LX-1L
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tth-0001JU-R7; Thu, 07 Mar 2019 09:21:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CD89C058CB0;
	Thu,  7 Mar 2019 14:21:20 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D48BD5C648;
	Thu,  7 Mar 2019 14:21:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:42 +0100
Message-Id: <1551968334-18982-18-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 07 Mar 2019 14:21:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 17/29] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3r4tgPC6OaE

Netduino only depends on the stm32f205 SoC which in turn depends on
its components.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 9 +--------
 hw/arm/Kconfig                  | 7 +++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 79996a3..beb94d9 100644
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
index 76cf754..68eccbf 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -84,6 +84,7 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    select STM32F205_SOC
 
 config NSERIES
     bool
@@ -256,6 +257,12 @@ config RASPI
 
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

