Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7795340wrx;
        Sat, 23 Feb 2019 00:11:29 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaWjAjp3DWXMth4TiC091VN3HMfIemCIT/VN0M8BaNo98cocubEEfeMkG/S4mAmj+8qWqpW
X-Received: by 2002:a25:4d8b:: with SMTP id a133mr6550540ybb.165.1550909489894;
        Sat, 23 Feb 2019 00:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909489; cv=none;
        d=google.com; s=arc-20160816;
        b=C1K/oXCFU01kw4RUuTUmiDbNokkOYJdu+FPfD8Vdy5SZCgWraY+WMEAHY1q5ic7Naq
         /7WrOZI894mtpX6qbXIi99dZQ9cq6G7DrbbZFLrnNWWbfDV4UWNeLdx6QQmuEnSEILrX
         pUwNg8xnJg4mP4xm2KVvfUsOFC5NXPBd2eKbQgqzFMLWU5yMHJu6dTwaUn7Mx23TKgvx
         24Aqch1tQW+ryqCNh3xocpbxcfdBSgh50e23SBKVvI7SqshUIBfESnLbO5h2RN4+id1w
         nv7a2vFVDbaJ5GaOHesckybDbIhuQQBAw7J/c/+OpF7xUAR7zPt4PswflG0ayNKo6qza
         GePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=rRkza6hC//YS2ObB6Zm53gzTH1car4IamJfYOwrj5gY=;
        b=m3wdZOqwC6VozzCwqNjyoPoPZR4EqX5358ktbHl0r+BW29k7N4v+Rrc1QhdgnJ9Rki
         G1Tjb2fJ13sdqH2T/y2C/XIFMvVLEZLEQCLjz4NAQbhmKGwYpAybGvu3eV/I3SzSF51c
         f/Pi2vF6gHtHG4HDqbrjqSQIV6maT3Uwu/bZYtU+xHVkMBSk+O9XGAGoHLxmJ56Tn7jj
         pvLsMqesuDTzSDeIeovc7UPkCfBPmJm6/2Rj5smUnfhM8CkmoUWdRX+5FPq/ixsPowQD
         8Wt2lS0zMzWznCfJFdnk4F/ZG5HPwnDLkQbtYs5PcOFlLPdjS+SevrDQQr2qv8aRvSOT
         TKAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si2154735ybl.245.2019.02.23.00.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSPB-0004KP-99
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:11:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5B-0005Nv-Vp
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5B-0002x1-6e
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS5A-0002aJ-VQ; Sat, 23 Feb 2019 02:50:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BE0A308624A;
	Sat, 23 Feb 2019 07:50:21 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A58345D9CA;
	Sat, 23 Feb 2019 07:50:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:18 +0100
Message-Id: <1550908162-22644-27-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sat, 23 Feb 2019 07:50:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 26/30] hw/arm: Express dependencies of the
 microbit / nrf51 machine with Kconfig
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
X-TUID: F+a6F87jDkbe

Add Kconfig dependencies for the NRF51 / microbit machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 6 ++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 88e4e8e..ee95cc0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -32,11 +32,10 @@ CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
+CONFIG_MICROBIT=y
 
 CONFIG_VGA=y
 
-CONFIG_NRF51_SOC=y
-
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3eee2bd..5ce6245 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -362,8 +362,14 @@ config FSL_IMX6UL
     select IMX_I2C
     select SDHCI
 
+config MICROBIT
+    bool
+    select NRF51_SOC
+
 config NRF51_SOC
     bool
+    select I2C
+    select ARM_V7M
 
 config EMCRAFT_SF2
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index eae9f6c..994e67d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
 obj-$(CONFIG_HIGHBANK) += highbank.o
 obj-$(CONFIG_INTEGRATOR) += integratorcp.o
 obj-$(CONFIG_MAINSTONE) += mainstone.o
+obj-$(CONFIG_MICROBIT) += microbit.o
 obj-$(CONFIG_MUSICPAL) += musicpal.o
 obj-$(CONFIG_NETDUINO2) += netduino2.o
 obj-$(CONFIG_NSERIES) += nseries.o
@@ -48,4 +49,4 @@ obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
-- 
1.8.3.1

