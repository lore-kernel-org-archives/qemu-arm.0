Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7215809wrx;
        Thu, 7 Mar 2019 06:37:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfUeELGUVGTOtKMPYbcbcN9hU6rK3KkZk9sq/ibb9JoPZ7MB0JG4xPE+6Vgyhij67w8T2H
X-Received: by 2002:a25:db08:: with SMTP id g8mr563389ybf.233.1551969440673;
        Thu, 07 Mar 2019 06:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969440; cv=none;
        d=google.com; s=arc-20160816;
        b=BZMq3nxBXUDgyN0hwALpi9cKA51Orz99QTvCrJfT5x8DiCbaBvgB9gYEwHs94UnJ2D
         fUL4kdjamQDXI/lA2Q5QPGniWnpMMgoK0roac0Ywl+l10Uo52WOO4iybmsWFWQkUtUEz
         WAWJqtRnx4vgMTdTzduw5NL+oczz7oaGMDh3ELF4l8+jc/5jH1ebIyXXTW+/M+JA+iDB
         d53Cg2AAtQH0ubwBZqBsxh8285bgDSwIwVN+07/rD+xVrYTxFmSK3B1KGBGFMYycVlS/
         GyWRPlKxh2xEYAsYq2IGDBUnOjNO+wy2YI9Ii8NpprfkVyr3UETgHAySJ7wiVmNDuq/j
         4Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=dMZ21zwgdoficbTYE6J6v9VEKCaHdlCCqMmv3ZSlivM=;
        b=rFHJ3emGt3E9p3P7f/PrbyqphZVbtMCab0zC2n5tqw0/nbisrIuzNDUz56+UHUKqcL
         k76Qj/bCzTWZhyI/yUtUjI8Nfa8/mKM4N1XanekiOlis0P0wwkOx14yMlC349BrO5W/5
         DQSb7Zd+h3ugS6if6HLtG824T5hOtahTAvjcay3mx4TXQWGJne8JT9Kf/gTij7P2BEd7
         302Q6F3DAwHjiPWcnTc0PxGCWdBe8BtATUgeyi+6Ls5Y7V6l70ozw8Pz5nilLhfc+L2T
         tbVd1jC512I7TxfMcCjSUWUF1Dg1W8vv/zfeym34t7SS597tnvb942yLdehWumPDW+UF
         1yOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si2621659ybw.250.2019.03.07.06.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u9A-00032K-4Z
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:37:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tu1-0006SP-EY
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tu0-0001YU-Lz
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tu0-0001Y2-GH; Thu, 07 Mar 2019 09:21:40 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B54713B7F;
	Thu,  7 Mar 2019 14:21:39 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F354C5C28C;
	Thu,  7 Mar 2019 14:21:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:44 +0100
Message-Id: <1551968334-18982-20-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 07 Mar 2019 14:21:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 19/29] hw/arm: Express dependencies of the
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: whI8j8B7NCsk

Add Kconfig dependencies for the mps2-an* machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 20 +-------------------
 hw/arm/Kconfig                  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b6f3d60..b8509fd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,6 +27,7 @@ CONFIG_Z2=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
+CONFIG_MPS2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
@@ -35,28 +36,9 @@ CONFIG_IMX_FEC=y
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
-CONFIG_ARMSSE_MHU=y
-
 CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 743c78b..32c8663 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -308,6 +308,13 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    select ARMSSE
+    select LAN9118
+    select MPS2_FPGAIO
+    select MPS2_SCC
+    select PL022    # Serial port
+    select PL080    # DMA controller
+    select TZ_MPC
 
 config FSL_IMX7
     bool
@@ -347,6 +354,17 @@ config ARM11MPCORE
 
 config ARMSSE
     bool
+    select ARMSSE_CPUID
+    select ARMSSE_MHU
+    select CMSDK_APB_TIMER
+    select CMSDK_APB_DUALTIMER
+    select CMSDK_APB_UART
+    select CMSDK_APB_WATCHDOG
+    select IOTKIT_SECCTL
+    select IOTKIT_SYSCTL
+    select IOTKIT_SYSINFO
+    select TZ_MSC
+    select TZ_PPC
 
 config ARMSSE_CPUID
     bool
-- 
1.8.3.1

