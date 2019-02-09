Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp293130wrq;
        Fri, 8 Feb 2019 22:42:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYK9e3SNGi8OwaNkj0EaUOtwSf66760jDWTgHDiyb1RHP2Vo8i+5JkrkVXx75Zg3992IkHP
X-Received: by 2002:adf:f30f:: with SMTP id i15mr20597106wro.39.1549694527838;
        Fri, 08 Feb 2019 22:42:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694527; cv=none;
        d=google.com; s=arc-20160816;
        b=FY7nQF0l95VzaggeRyjnYiDCk7LuvLtg7vQuVQYcecuKN0JUZz1N95nQ1bDHh4hdTJ
         PhvBw7cLLHfydxzuwUtk3Vgn4kpkKSf9TZ33B5Ypb6Qkd/uVl2EV4I9+Ca6i8HNlWGwL
         Cm+QCyEbzsqHOaC8Uy/KiAUaxWiwPTmgIV1ft7q20wUvtelN8KLcpJzVmNMU6wjRNjXx
         TNs7L+lxv8nkIKcAeVFZIgaLIMWmCM13Wv4/XOKHQ1adPwVMwzji/nyUvjzXErHOkXZo
         Pup+YBXo3dk7OoSzGID5M+X6bviseTj+4Wpbma3JWp0J9lYlz/B56oWQj7N/QFhfg5Uw
         oOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=z72OHb8Q7leMf6iWy4Fj0v9mbVnpfZWU6pcluleyxbk=;
        b=C4yc74caSNsWvyqaHyKlxEQ2tPHoz2sfZEenIi+KdiUe6yHnz8bEsmiQCfNdxSPCLU
         6gG3J3Y3wthabos0nJ8sgagvvPF9718C8DVqppIZ7HZwH3lLQY3K/bXb58ZNsoUQ3X0O
         6wcavWyakDeBIvOGobF0EXIQ4mGA2JurgbXXdagAS4sVpW1Avz4BZRfB2uQR9syFpfyJ
         Gd1+4/uv7fikiRZ+CYCXkejvnFkZnGI/xr64BitjIllmVGJEJjndhBniOcG+0eOC701e
         Tcf2ILH9MbUr//OKNR2NkJSOUUlLMKqs3kEoJ8HM3/VJdjfJcJ3kLJ2xLihws0AbZpMb
         69Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si2957035wrt.130.2019.02.08.22.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:42:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsML0-0005IR-S2
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:42:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIy-0003YC-HO
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIx-0003Ub-EK
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:5533)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIx-0003TN-4y; Sat, 09 Feb 2019 01:39:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F88985A03;
	Sat,  9 Feb 2019 06:39:58 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9A1B5B6A4;
	Sat,  9 Feb 2019 06:39:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:13 +0100
Message-Id: <1549694366-1284-13-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 09 Feb 2019 06:39:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 12/25] hw/arm: Express dependencies of the aspeed
 boards with Kconfig
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
X-TUID: 2Zf9CVZtqNGK

Dependencies have been determined by looking at hw/arm/aspeed.c

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 9851068..b2e31b3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -22,15 +22,12 @@ CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
 CONFIG_COLLIE=y
+CONFIG_ASPEED_SOC=y
 
 CONFIG_VGA=y
-CONFIG_TMP421=y
-CONFIG_PCA9552=y
 CONFIG_SSI_M25P80=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
-CONFIG_FTGMAC100=y
-CONFIG_DS1338=y
 CONFIG_PLATFORM_BUS=y
 CONFIG_VIRTIO_MMIO=y
 
@@ -90,8 +87,6 @@ CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_ARM_VIRT=y
 CONFIG_SMBIOS=y
-CONFIG_ASPEED_SOC=y
-CONFIG_SMBUS_EEPROM=y
 CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
 CONFIG_FW_CFG_DMA=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 39cbda9..a4fe2c8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -267,6 +267,16 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    select DS1338
+    select FTGMAC100
+    select I2C
+    select PCA9552
+    select SERIAL
+    select SMBUS_EEPROM
+    select SSI
+    select SSI_M25P80
+    select TMP105
+    select TMP421
 
 config MPS2
     bool
-- 
1.8.3.1

