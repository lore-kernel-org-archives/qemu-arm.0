Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1431119wrh;
        Sun, 5 May 2019 07:01:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzW9dNdR9Clc6bl25Xb+p+XbnCbWfupv/IFf2ob9OOKueFy1b2rGZLkChjp2lkYAr2HmcIl
X-Received: by 2002:a1c:b3d7:: with SMTP id c206mr2787905wmf.77.1557064873127;
        Sun, 05 May 2019 07:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064873; cv=none;
        d=google.com; s=arc-20160816;
        b=r9tcUeKjnEbfRH+6OfpU4178UKjxIJjMtCboDlVW5m9ACALkof4bea5CiNokLkflbu
         YVg236vwzOZgIuHkVaUhROscPW78ZoilLGU3RMxtSyoDxI6cz/2nbquKSy5pie4zHSYs
         OCi1+gKGeemkrBaQRGr9Lxe976QlBUvxvmi8WQmty2aUC1AsNTK9VDiIb6XtUeEqnxmJ
         xaORaf2qR6kl/mBZ+BfHHpAa1ceHx5AovPVnnb+A+F+TbDXMYWoV7CzdpffBrMF9Ho1L
         d9nxgiAOk1joz7cZcbGwLoZJzHA/CXLQWeiq+bFh/G494OnArOlsxbakqrIZObx4BO/j
         nvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LghXIFpjRQjKAbFlYWjA9hEEt2WhY08WbmQXrSsZE40=;
        b=iE0Zf732ELytlt5CUwd6ynizxPgoUSIha8GY0lr7run/7NCQ7Fz7uTE61ssDW7FD2I
         8oKzS4byGUbp3kyEZvFLa+CfDmQWM9fsCfN6Go8nS3n1ZJ7U2gIU33VFKy9S3G2UVmjW
         bo/9QK780ySZ7l0T2iiQNYjmlb5ZUoqhQgzwBw640zgLhxg3Iee/ITkgqonudySHUUZU
         uSdb1AZFMb2jfKMTkjdeqZKyAG//i31TR2Gw3vLzJLYQ0hfHl8Vd+5JFvdbypAhMg96W
         WYOQUNmM8gazt2sRYZJRVXh1ps7gEDbRnGaDI85C2Ph/mtujJ2/FAzTfwsl8QWokI0Sy
         foFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si4987348wmb.47.2019.05.05.07.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHhY-0007Do-4n
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:01:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdy-00048u-CY
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdw-0004cy-ED
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60012)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHdw-0004cB-8V; Sun, 05 May 2019 09:57:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BDC481E09;
	Sun,  5 May 2019 13:57:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 801E560C67;
	Sun,  5 May 2019 13:57:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:52 +0200
Message-Id: <20190505135714.11277-7-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 05 May 2019 13:57:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 06/28] hw/arm: Express dependencies of the
 fsl-imx31 machine with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dXqQ1oZXH4B6

Add Kconfig dependencies for the fsl-imx31 / kzm machine.
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 4 ++++
 hw/misc/Kconfig                 | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 6195b75f48..7f94811ccb 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -10,6 +10,7 @@ CONFIG_PCI_TESTDEV=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
+CONFIG_FSL_IMX31=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -68,7 +69,6 @@ CONFIG_TSC210X=3Dy
 CONFIG_BLIZZARD=3Dy
 CONFIG_ONENAND=3Dy
 CONFIG_TUSB6010=3Dy
-CONFIG_IMX=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_MUSCA=3Dy
@@ -115,7 +115,6 @@ CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
-CONFIG_FSL_IMX31=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ad3b1f9b40..9087b7d714 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -98,6 +98,10 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select SERIAL
+    select IMX
+    select IMX_I2C
+    select LAN9118
=20
 config FSL_IMX6
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 5f67d0d6d9..385e1b0cec 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -76,6 +76,8 @@ config ECCMEMCTL
 config IMX
     bool
     select PTIMER
+    select SSI
+    select USB_EHCI_SYSBUS
=20
 config STM32F2XX_SYSCFG
     bool
--=20
2.21.0

