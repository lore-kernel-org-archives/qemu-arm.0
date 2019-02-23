Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7796807wrx;
        Sat, 23 Feb 2019 00:13:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYKt0YO+FceMn+fwcih6fgqRm9Yp56HKWMvSH8350k2AU5HEgT6EoZOlOdbNxeDHe901FTN
X-Received: by 2002:a25:b9c5:: with SMTP id y5mr6504227ybj.176.1550909634316;
        Sat, 23 Feb 2019 00:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909634; cv=none;
        d=google.com; s=arc-20160816;
        b=W22ezfulHqdhKQOFi+gZLNmyHdByKKL6wIBFVCIFDQksXmwhx/FRixGxn7xgG7rK3T
         nOM8SoC/P8WX56vuh8rluPufjI0rgKnkb1pZIhMGDoC6Hb2yZtt1Rn+hP0Qnct1fdoky
         6U0P2dqjNdxzKujN5j1jsXQUkizum3dd97SkIPcvdK8oATi+uBQjD1VjbPdOcStAilG9
         L5OZdGlHaumYbbXA7TBHmAn6pjJaXkD5+pezjOGmC0wrAadnoFlDlSFoL+Jd3srIbr2/
         uoNMzCpARTynry+xQfc+y54gCzgjKFDGIYtqI/2Ps/zp7+VG+MHydVMtk5EYKxoYaQVl
         1+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ds1GtSOP4bh7gLA7ixnH3DNBwyn9OBpl/Hu90TMW0oo=;
        b=qgV1+tg5D8Vn/Fh2a+MJakLWl60yG+pFeQ+IcTJP7phI4POtdsVRIEoowElhX4uOFj
         XKuP9y9Tckp67VKLazSFzNIDtFUsTXzv0O9g/WtF4ZUwoAJ9dvS5pBNOw92OgJXVPkDl
         /43mUvsKHlcK2QnOP6sgEbP0G67Rrpk1bsN6toqQKBd7h6Rdhrls7zDUJFjk0c+dnK81
         EmJ7SyjDYyTAnsjZRnueT8X+aFg2rXSARX/ITVWhH1DxQAcs/bI+WyWY4KA/lS+DV34h
         fm41OxRlnl1qHAy7+p1Wm0dSRQV7qL+q3DUa51JgN9ClPTuX8ZPb/n7r+486zCBqgFXg
         d4pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c145si2129691ybf.266.2019.02.23.00.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSRV-00069o-NE
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS55-0005K5-Sa
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS54-0002sr-Hw
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS51-0002Wo-Ub; Sat, 23 Feb 2019 02:50:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DFF381E17;
	Sat, 23 Feb 2019 07:50:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4550F5D9CA;
	Sat, 23 Feb 2019 07:50:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:16 +0100
Message-Id: <1550908162-22644-25-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 23 Feb 2019 07:50:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 24/30] hw/arm: Express dependencies of the
 MSF2 / EMCRAFT_SF2 machine with Kconfig
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
X-TUID: zcj/RqmAN60K

Add Kconfig dependencies for the emcraft-sf2 machine - we also
distinguish between the machine (CONFIG_EMCRAFT_SF2) and the SoC
(CONFIG_MSF2) now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  3 +--
 hw/arm/Kconfig                  | 12 ++++++++++--
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 9150858..a01e407 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,9 +31,9 @@ CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
+CONFIG_EMCRAFT_SF2=y
 
 CONFIG_VGA=y
-CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
@@ -46,5 +46,4 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_MSF2=y
 CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8418047..9495e7f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -331,7 +331,6 @@ config MPS2
     select MPS2_SCC
     select PL022    # Serial port
     select PL080    # DMA controller
-    select TZ_MPC
 
 config IOTKIT
     bool
@@ -348,9 +347,17 @@ config FSL_IMX6UL
 config NRF51_SOC
     bool
 
+config EMCRAFT_SF2
+    bool
+    select MSF2
+    select SSI_M25P80
+
 config MSF2
     bool
+    select ARM_V7M
     select PTIMER
+    select SERIAL
+    select SSI
 
 config ZAURUS
     bool
@@ -375,13 +382,14 @@ config ARM11MPCORE
 config ARMSSE
     bool
     select ARMSSE_CPUID
-    select CMSDK_APB_TIMER
     select CMSDK_APB_DUALTIMER
+    select CMSDK_APB_TIMER
     select CMSDK_APB_UART
     select CMSDK_APB_WATCHDOG
     select IOTKIT_SECCTL
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
+    select TZ_MPC
     select TZ_MSC
     select TZ_PPC
 
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fadd698..eae9f6c 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARM_VIRT) += virt.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-$(CONFIG_DIGIC) += digic_boards.o
 obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
+obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
 obj-$(CONFIG_HIGHBANK) += highbank.o
 obj-$(CONFIG_INTEGRATOR) += integratorcp.o
 obj-$(CONFIG_MAINSTONE) += mainstone.o
@@ -41,7 +42,7 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MPS2) += mps2-tz.o
-obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
+obj-$(CONFIG_MSF2) += msf2-soc.o
 obj-$(CONFIG_MUSCA) += musca.o
 obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
-- 
1.8.3.1

