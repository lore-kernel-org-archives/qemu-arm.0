Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7790221wrx;
        Sat, 23 Feb 2019 00:04:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZQq4maVnkYzWYKzv+2R/8l4TjJhHoDjibQIVizZ78qTiTgWGjmNwGTEbgv8rz+wlIpAFu2
X-Received: by 2002:a0d:dd0d:: with SMTP id g13mr6736312ywe.173.1550909045673;
        Sat, 23 Feb 2019 00:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909045; cv=none;
        d=google.com; s=arc-20160816;
        b=yAJ9MFnT0uKyYtcrehvCZHT/CdLOM0xK2yQFiR5DtFde6+bAXTYtmI4nzJSSiQ0hsG
         EWTaU7qdPcRdlBuPDIzp7t61ZtJVzjJlw3uMst7h01s2wWAX1Rtnyp050JFyKtH8Wb0f
         KNQ6ANfV9CO8Sn+BVpNb/vZSR5OnJhyAfm5w9VN2OGx750jgCjoyfL1tN/FMzKeawxCz
         uKIaZW7DfToO/jfETb7x//U1OLNhW0hZeEwt40UnP/4GPoiJyxGR0cer9nCRYMLjkL1C
         bmQFoXXq3YePiVHs4QSvQr7oMndKzMB9PEahjZ/99uxjvTSibUNHW/ZkjEMG1JmibDG0
         J4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=q0TgeWJNvr0I5c/bl7kRejpmRzssvGP/swW7wHx4XNc=;
        b=Vn4srPO2hQ8Nq6CQTz/QJZKLF88j/gnsVxKaXxcyQ6TIgZ0dwM7qAweKXKV14hZAQJ
         yAH9dAR12/KWYMDpjYi9FUvb7XT2XpVMEy3qXi81xExhqLFldlclRCfXfa51z09eZUZ/
         y13reB7T1ESDDqpxxyh6Tr+8jk2VE6O1k+0Qxmaha45wPdQc/EXIXcLbwgQf/y5Rc9dW
         XxEtcmPjlqOeqUtvwxBzErFQLnfm+EKnMsDQPWxM2yfyoRwGSvncuNTFqx5ZZtlQzX2j
         eVhbXwjyvWmMbwP4E8yHHXUghP4BNKu6iYex7pp7DHsbp+hwcuKw6HfXOpxNuI1IQPXg
         DTGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c65si2129442ybf.428.2019.02.23.00.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:04:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSI1-0006Mt-3u
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4c-0004r9-7q
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4b-0002S7-En
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4Z-0002PI-KX; Sat, 23 Feb 2019 02:50:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E269E3016F62;
	Sat, 23 Feb 2019 07:50:10 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AB745D9CA;
	Sat, 23 Feb 2019 07:50:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:12 +0100
Message-Id: <1550908162-22644-21-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 23 Feb 2019 07:50:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 20/30] hw/arm: Express dependencies of the
 MPS2 boards with Kconfig
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHH51MkCZeQp

Add Kconfig dependencies for the mps2-an* machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 19 +------------------
 hw/arm/Kconfig                  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index badb190..b8509fd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,6 +27,7 @@ CONFIG_Z2=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
+CONFIG_MPS2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
@@ -35,27 +36,9 @@ CONFIG_IMX_FEC=y
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
index 73382b6..fa69f1b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -314,6 +314,13 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    select ARMSSE
+    select LAN9118
+    select MPS2_FPGAIO
+    select MPS2_SCC
+    select PL022    # Serial port
+    select PL080    # DMA controller
+    select TZ_MPC
 
 config IOTKIT
     bool
@@ -356,6 +363,16 @@ config ARM11MPCORE
 
 config ARMSSE
     bool
+    select ARMSSE_CPUID
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

