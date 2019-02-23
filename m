Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7790950wrx;
        Sat, 23 Feb 2019 00:05:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbVrWokfqwTYkRAdHh8hvHTLuUdaPQLHK8e5yyyuuVQwVTGoD811sK/I2TMD2t0SNS0fErk
X-Received: by 2002:a81:110d:: with SMTP id 13mr6546962ywr.343.1550909101878;
        Sat, 23 Feb 2019 00:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909101; cv=none;
        d=google.com; s=arc-20160816;
        b=BRriH8XhiOa4a41TZQgL4fdoWEkoEhPwQnVqBDfGmn7R+CosX8us8qYtf7jSU2+Lrd
         uInZEGixfSrR4Bc34ham1zVNLMoZWGRxNA3LYj7VveWKf/qop8TWRKcyCm9v5HzKXbAY
         3LE7VLOrX71u8X/qmmgJQ4X/zSI7iyFHVBUm3TWydVLVzyF6IUS7c5C64qc6gUW3o32p
         dULyRMPvpNn7eiBSxPH2V9s/USYe/NuDCgfr1+y4avGt0RGDZnlEFerdIDH3U/IS6ZWu
         451NBVcLjIlW3lQLbBuD4PfTvKInPPJCEIOuavWPIWAn+Vh9R509doIWOldm/27AFHAa
         hp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=nBRKu1x1iql6NEpdGiBak0EAGWvyzsiakBUJQJbDAHU=;
        b=lF8ZsNo2f3AH0iZ2PJq16yszjcWXLGXG9h6UNVr9Lxt6kuoWfYGXO+obIctq6eO56G
         DpeferrJX4U0+gAAPzK1O9XU5jnIcnJxoOX8Nmpjq9bSD2B02mzXK/+NiRvXrpGcA7nT
         4iYFn0z54l/U3waB78LnYNWZJGRA+pV4wNBLpC4LuW0gtYohf+vyJjv2rXpGhYfcG82a
         MjjzIAyKVCC4xTRaGaa4MBRdHRqcj92a6h+D9J47Y9azRrVQRNeFfBTJ8CAWCuRqpJY2
         mWqtJwhhu+HAak23rrSvlrzjMMM8mqCwkZXgxmRo1I8wM9pP7L400VxWfKsCxCADeH4j
         dS8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si2116067ybb.412.2019.02.23.00.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:05:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSIv-0007e3-AC
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:05:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4c-0004rB-83
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4b-0002SD-G7
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4b-0002RA-9Q; Sat, 23 Feb 2019 02:50:13 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97F8E81129;
	Sat, 23 Feb 2019 07:50:12 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37D3C5D9CA;
	Sat, 23 Feb 2019 07:50:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:13 +0100
Message-Id: <1550908162-22644-22-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 23 Feb 2019 07:50:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 21/30] hw/arm: Express dependencies of the
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: REBGh0qH9o+y

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b8509fd..290023c 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -28,15 +28,13 @@ CONFIG_COLLIE=y
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
index fa69f1b..32495e6 100644
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
-- 
1.8.3.1

