Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1663859wrp;
        Wed, 13 Feb 2019 00:59:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbdyZuEafuUTPCCJ7dybXwvGDsyZ0o5vTdWA7dgixsA7xCX1ivdt4+d8HA1Ef4CR02X3OTi
X-Received: by 2002:a25:d209:: with SMTP id j9mr6635698ybg.291.1550048373292;
        Wed, 13 Feb 2019 00:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048373; cv=none;
        d=google.com; s=arc-20160816;
        b=PuyQjp44Gs8TSOU53RCD2kFmgxaJY8QIx3AOGiWXYDTsi3jdUDzZEyJEXxAc8VbZGR
         NDbxzZaP0Bts6eoNUBZUSZM88ct+wHQTdI/XnYOJxckb1IKKyD+7WjW8r+UEdd/PK08h
         ZjkjffjsRoJdOgWqQeHo6fyzMGbwPF/JSzwh3Bw7gbsCLFvyxyaqEfOdR4mWJo2qXDZP
         7b0SYDhfHBtrp+fYxXBbDIoJ4fZfe/7AtZLx0m9X4ZQ6Z16hu0uw6EgKDm1lbdPmPjtu
         bUjwB7U32GLTCQEZvUn6+Zu8csztzcoPWyk5OX84Nau/ZoB5q1T5DhPfy9+t4YurwQYO
         Z3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=XE9uLuO4qf7tZhDqmY7UeiZGiZC/v55RXsbXww3me50=;
        b=gO444DXmiS0Z1N6m/Q3sMSVniG+qslDfbaZ8EA1JTqUaZ5s4HIUJb4XQTRG0AwcXtJ
         UwiGp0ap+nnSDgrXAr4DT0HLFwzFoK7U4Ro+nwCXD2PvVufWNUXb6dhwuqfFCTSyHm+X
         iPj3G151M5JlyL4borxoWOes3FW9tvwBVK6kNJLdnlmo6qAG/ss/pi/jozbCeC1ueHaU
         5BCo9mIPL8sdtHSwGvxCkx2fY+Xu09bYy4aq9cTkNbCMYrC7fTu95uxJk5QxV9i587/R
         s8lGzTZCMybwfPPfe7kK3OFXJbvzsE3NCqUsAYSzu+Z5fKRnWGhehIAO2e8n6znMw1H2
         cYMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z81si9582245ywb.302.2019.02.13.00.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:59:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqOC-00012Y-K8
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG2-00024X-Q4
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4t-0005u4-9M
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4r-0005mQ-Aw; Wed, 13 Feb 2019 03:39:34 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D476CC04B94F;
	Wed, 13 Feb 2019 08:39:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FD0110021B6;
	Wed, 13 Feb 2019 08:39:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:09 +0100
Message-Id: <1550047098-1210-17-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 13 Feb 2019 08:39:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 16/25] hw/arm: Express dependencies of the
 MPS2 boards with Kconfig
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
X-TUID: rR5RRuPdZdA3

Add Kconfig dependencies for the mps2-an* machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 19 +------------------
 hw/arm/Kconfig                  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 28bb37f..b530a06 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -26,6 +26,7 @@ CONFIG_Z2=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
+CONFIG_MPS2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
@@ -34,27 +35,9 @@ CONFIG_IMX_FEC=y
 CONFIG_FRAMEBUFFER=y
 
 CONFIG_DIGIC=y
-CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_NRF51_SOC=y
 
-CONFIG_CMSDK_APB_TIMER=y
-CONFIG_CMSDK_APB_DUALTIMER=y
-CONFIG_CMSDK_APB_UART=y
-CONFIG_CMSDK_APB_WATCHDOG=y
-
-CONFIG_MPS2_FPGAIO=y
-CONFIG_MPS2_SCC=y
-
-CONFIG_TZ_MPC=y
-CONFIG_TZ_MSC=y
-CONFIG_TZ_PPC=y
-CONFIG_ARMSSE=y
-CONFIG_IOTKIT_SECCTL=y
-CONFIG_IOTKIT_SYSCTL=y
-CONFIG_IOTKIT_SYSINFO=y
-CONFIG_ARMSSE_CPUID=y
-
 CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3d78102..d17bd2f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -314,6 +314,23 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    select ARMSSE
+    select ARMSSE_CPUID
+    select CMSDK_APB_TIMER
+    select CMSDK_APB_DUALTIMER
+    select CMSDK_APB_UART
+    select CMSDK_APB_WATCHDOG
+    select IOTKIT_SECCTL
+    select IOTKIT_SYSCTL
+    select IOTKIT_SYSINFO
+    select LAN9118
+    select MPS2_FPGAIO
+    select MPS2_SCC
+    select PL022    # Serial port
+    select PL080    # DMA controller
+    select TZ_MPC
+    select TZ_MSC
+    select TZ_PPC
 
 config IOTKIT
     bool
-- 
1.8.3.1

