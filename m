Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1664598wrp;
        Wed, 13 Feb 2019 01:00:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY29cw8NCKsVF7BNd6zBWiJDgVxyAYTqDbprYvWCTmf4HZZn7YiHV08vBTYS8sX81ryRX35
X-Received: by 2002:a25:d945:: with SMTP id q66mr6402325ybg.237.1550048425305;
        Wed, 13 Feb 2019 01:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048425; cv=none;
        d=google.com; s=arc-20160816;
        b=yavH9S06dW3IuSs9JEI2vUa03H7xf1nuOXOZHa0rENSXSnPnptlQ6Sq389gzy5LhTz
         Gbh87POlFkleALWqn/g35Xa/d9Z7sT/gbcAMy/rUw00OQ6SX5AoYk4FU1HFc+a7Ok30s
         jRtFQh5oM30PtRHh4cbHZAw2zXiNfozNpSKEDWkyxfyDTCcxWn13z5Bp0KtQKkYg5uWH
         T2ZpGapleJBQ555oTh3xzVQ9RTcSuhAiLhme04n5MF3nS92hiOTKvGN7WIoJBYU2Qg0r
         lbkt0xEguc3+eZbZ7Q1/7YAoIoUaEF12pX4pMdsn3zj8cWYjRbtgBMSbIvhxwmHGXX83
         i7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=mUbLKcYa4/n9tEl1W3NBNPxHbRaNjktP16XOFGWDSfs=;
        b=ZPkm1R4WevVh4o5aLuRjoJubrVmNMGH8qpMwg5krLG9sxW/Ot/mAB2kLgxef6E0G68
         TiBxQDYQ97ZAdso5STyjdLh3zc/tQhzdXfFljPLBlF5jETe/Sr6ze6wMCFRnI9twBZEb
         t2xTn3+7EdJOvI+8DLMS94uIuG57yv902YxeZggO4kWjEvGxTjn40Jkqko1otLhoGuhv
         DvmLOW6P4LrBX8BEZOO5maOCrCMYmzMFKR4OMMpugkg0EzXd3xnRLgHki9Tn+98qgO56
         +k9QsdtPYRWKNEfvDdXMQq9Pat1TDgMM/iKArzTqBy3eNaBQ2QRxzPLdcra8w2BvZnKW
         41ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si8931281ybp.263.2019.02.13.01.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqP2-00023q-NU
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:00:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG0-00023s-0i
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq50-00061v-92
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq50-00061H-1a; Wed, 13 Feb 2019 03:39:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E6B086675;
	Wed, 13 Feb 2019 08:39:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D72CE10021B6;
	Wed, 13 Feb 2019 08:39:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:13 +0100
Message-Id: <1550047098-1210-21-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 13 Feb 2019 08:39:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 20/25] hw/arm: Express dependencies of the
 MSF2 machine with Kconfig
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
X-TUID: 7tkT++R5N7vn

Add Kconfig dependencies for the emcraft-sf2 machine - we also
distinguis between the machine (CONFIG_EMCRAFT_SF2) and the SoC
(CONFIG_MSF2) now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 8 ++++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index f6193b1..5eceeba 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -30,9 +30,9 @@ CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
+CONFIG_EMCRAFT_SF2=y
 
 CONFIG_VGA=y
-CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
@@ -45,5 +45,4 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_MSF2=y
 CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 70fc73f..cebb410 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -358,9 +358,17 @@ config FSL_IMX6UL
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
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index ee9f5c6..29dc7d9 100644
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
 obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
-- 
1.8.3.1

