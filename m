Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1658646wrp;
        Wed, 13 Feb 2019 00:51:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYwdKrxzBrivLiubuc6P+QRpjrTwgrMTJqq4s5bBZ1HFKkGJg7IfzH5JkfvS3OXcXjiEnmL
X-Received: by 2002:a81:4b11:: with SMTP id y17mr3532958ywa.426.1550047908510;
        Wed, 13 Feb 2019 00:51:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550047908; cv=none;
        d=google.com; s=arc-20160816;
        b=cAhfIU9Cz6EbJ//RWnMh3xTepJTGrk1QHxeazNTZ594QMcq+ppgV8MdE8uHIEkYIQs
         jBM0uHbSx79RtqQmxvs9qIUZEbJvM/GkgbCv8D835qK+HuEOvsgYX6Z9xxKp4EBCrjzm
         Ep1qNLuSisl7BBubQURYbo1KQldIF/dghIBU5zCwwAsRxkTc0Ho5RBNEUcVGvln/XDsf
         iWxZi2sZldLHqTk1BpcryNCfz0vBSK3ofOuQfmnRubSsdnSw7wm59y/CaALraWWIbsaz
         o5TYwhKgxABbNAAIVfivBl0bY80kNiVLfwJq+t5jAnD1Y4cYWrAfCsF31qCvJJZj4p7T
         p/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=iOpH8RYb2Tg+JmYyHxWjhm6zbEk+ggB4FuHtrOS5zlY=;
        b=gIwlrJ/5EM/Qx8uW5gwlmVN8L5KhGNpLJ6pYqQS/EOOvi67ejUrSKaG41e3+BOzCQ5
         tugn1lpa1Zn4RxGQB3HtyySPVboeAD+3Um38BXrlYgg2x3mOI0F5KQQDkmFKw4qSwETT
         /AAZRwdTwYosG7GpKsOLMFvrzHh6vd3Jl/4AhBKIoaaerfEsd3awdXeNfcZlqLeOAYC/
         fzYczdkx3bLVkk/u6YPFJXjFWTwPV4nVgc6WukbPbn91b3oUhENxdsz3bQy0UaDhiWIn
         +DGT5mJYFV845qMnMvR5moYbm+f0FE4JlXx8qFp9rh8eQMxqarFsBAAozP8Ntb5UwV0e
         X+uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 78si9047781ywp.219.2019.02.13.00.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqGh-0002vd-QZ
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:51:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG1-00025D-Td
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4v-0005xY-Dj
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4t-0005nx-AH; Wed, 13 Feb 2019 03:39:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ECC881F18;
	Wed, 13 Feb 2019 08:39:30 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4830710021B6;
	Wed, 13 Feb 2019 08:39:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:10 +0100
Message-Id: <1550047098-1210-18-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 13 Feb 2019 08:39:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 17/25] hw/arm: Express dependencies of the
 raspi machines with Kconfig
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
X-TUID: YPjZT8bfg6PA

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Note that CONFIG_SDHCI currently has a hard requirement for PCI, so
we select that switch now always there instead of depending on it.
We should split up sdhci.c into sysbus and pci parts later to get
rid of this hard requirement.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 3 +++
 hw/sd/Kconfig                   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b530a06..6605786 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,15 +27,13 @@ CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_MPS2=y
+CONFIG_RASPI=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
-CONFIG_FRAMEBUFFER=y
-
 CONFIG_DIGIC=y
-CONFIG_RASPI=y
 CONFIG_NRF51_SOC=y
 
 CONFIG_FSL_IMX6=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d17bd2f..bb385a5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -269,6 +269,9 @@ config ALLWINNER_A10
 
 config RASPI
     bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
 
 config STM32F205_SOC
     bool
diff --git a/hw/sd/Kconfig b/hw/sd/Kconfig
index 864f535..29e359b 100644
--- a/hw/sd/Kconfig
+++ b/hw/sd/Kconfig
@@ -13,5 +13,5 @@ config SD
 config SDHCI
     bool
     default y if PCI_DEVICES
-    depends on PCI
+    select PCI               # TODO: Split up sdhci.c into sysbus and pci parts
     select SD
-- 
1.8.3.1

