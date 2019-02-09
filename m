Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp299737wrq;
        Fri, 8 Feb 2019 22:53:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaameQK30+ctHqFpgvqHQ6mAVHyYhcpY7445djCG+IetIH1e7B3g6USBQwWbOEz+iZiaPr2
X-Received: by 2002:adf:e34e:: with SMTP id n14mr4468529wrj.195.1549695231121;
        Fri, 08 Feb 2019 22:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695231; cv=none;
        d=google.com; s=arc-20160816;
        b=HFyvv3aOxRIt1YmiBqAvkf8eAMcPuAErEP0mxL6/rg8zqUw5jLB+Fm6k1pTaVoyCgL
         bk68U69JnAZiWYpbe+bEaFvjtVCV0U3U8WUCXAGolr4fKcsrinEh4ML6Hp/plwCiAUAT
         h98HVpBvSCS4mcnTaF+Aoy3eQVbZhFbG7GVzAuO5dVq1SF2LVDXJuHHvlK358CBSRoHd
         IqtZrcBB2YiFQ7GZqKeXhu8n/+nNmEe9PaQk3QXW9zwK0qwHdEoGQQ6wYJhwKRe3wwwv
         uw2bbi5af60H3qclWU7Yl+x7Q5n9GQQMnCoq1QVhPNOpUUbtmow+p8CCgbn9oq7DEuEk
         o2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Sy7Xu09TM7B2wEbGDLae7YUpymTfTxYJy0MTuZxD87k=;
        b=cKOWL7dP5573ljt+O9fGMSjZlwZKUR4UteyJSrHJ0PfSpjmK2wWG0CvbTp7Dc06SXA
         wtGmwxlfPurVDYJGPe8Gp3qx3PfEx18OOX9vqQzONBW7DMqp/54jPFrtWU846BB+ur2Z
         bS4cciZnr/qu8mafBUMmg1c7XNfSHK8T3AAZxPKSTqRwAcgzawry00O7L/HF6ctLvCKw
         n20wvT7jc5PFvPrbTfZNU9DsiRuX4cylneonLh4PE+VwnlbyzKA4isgGOJE3tushEd70
         HpgYfBlABcieay0cONZtGF0k5YJqow0d6HiTodRdpj0ro7BXvmW2oA+AXxWT/PYn/Hgs
         XE0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q206si728413wme.63.2019.02.08.22.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMWM-0006Yo-5y
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:53:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ6-0003kA-Ls
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ5-0003f0-VH
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60248)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJ5-0003eL-Pc; Sat, 09 Feb 2019 01:40:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14D493DE0E;
	Sat,  9 Feb 2019 06:40:07 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A3CF62662;
	Sat,  9 Feb 2019 06:40:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:17 +0100
Message-Id: <1549694366-1284-17-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 09 Feb 2019 06:40:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 16/25] hw/arm: Express dependencies of the MPS2
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
X-TUID: /FTDlohpW8WU

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
index 3621d44..5765fe9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -315,6 +315,23 @@ config ASPEED_SOC
 
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

