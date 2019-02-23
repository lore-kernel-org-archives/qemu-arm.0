Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7783860wrx;
        Fri, 22 Feb 2019 23:54:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYkmlsxOPBIGRp1wy/siyVlhVZKNizW+C1tz841Z//bW+4jZ6xpO4Iecs851dFbPX/tVVV9
X-Received: by 2002:a25:bece:: with SMTP id k14mr6234800ybm.493.1550908472917;
        Fri, 22 Feb 2019 23:54:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908472; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7jA/pea9ooh2LNQ4lhGuOW7K6GcOgj+2T9oUC/J41CepFhfaGG8yI6uckpAxXbDZZ
         +/fodhZ4brscLcbDjzh/mQrCLybsk4F/PnNCuGiFdMzfE4oOpVsSaPyVGwNdpY1vWH0j
         a5hRAZDlIwlT9Gs/qVlA1D+ToY5YdMJHG8yFHdWBeh1YUPAL0yzlYIWPXRZvl6syeuO7
         qKUvP6/86OEiMDXrCwTb0dByaH+XS5RVmZhh/Px/jMsVrAAr07lG7K5vAjq/tjqCt8zg
         mffc+pXYUtopMrKYTAbdrKyVDXHGTxsXhq3gxJZQ+hp0AerBNh5H1sD06hR9o6/myXfM
         bmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=H882azxT8TKByq8XfPMaZEPD7kIlVYt3EJudDy1BedM=;
        b=uXHg8HyJ1EnMozjPdsuIKzBxumNuDIt7Gmz6fqdqw7KjKweTuGmh2mIFkWBjqIAD6R
         L1u5YZd1gezL1GUabJrIAk7Eee3u17saSc8He+4HK42pfVL9MzNwBD+xNsh71c4yoKCU
         7YOQflnpnkCm3u7ve3tNjdjEI2IOrAHh+7JNTIZak2OMkX+kiw8fpf3CgLMdFGfVzrU+
         oRtX1uL37HaVRK3R7Lf1ksKd8NWipQVV7qVCEiqXIfsPj99skXI0tU4tNJo09I2ARHTw
         NRxKfdsFU0Ls1YRs/wZdfGcL4FbyYaBqzzYD1j5rhQW5eAKYwZncJ4Uu3TqU23nC+pPa
         Vcsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si2100262ywg.348.2019.02.22.23.54.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:54:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS8m-0007LS-5O
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:54:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4B-0004Wa-HQ
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4A-0001vB-LC
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59550)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS48-0001s3-ID; Sat, 23 Feb 2019 02:49:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C6C74E92B;
	Sat, 23 Feb 2019 07:49:43 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3A745D9CA;
	Sat, 23 Feb 2019 07:49:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:00 +0100
Message-Id: <1550908162-22644-9-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 23 Feb 2019 07:49:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 08/30] hw/arm: Express dependencies of the
 fsl-imx31 machine with Kconfig
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
X-TUID: ISRzxuO4n1tL

Add Kconfig dependencies for the fsl-imx31 / kzm machine.
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 5 +++++
 hw/misc/Kconfig                 | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 74382cc..388a2ba 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
+CONFIG_FSL_IMX31=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -66,7 +67,6 @@ CONFIG_TSC210X=3Dy
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
index 6a34ce1..df10a4d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -106,6 +106,11 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select SERIAL
+    select IMX
+    select IMX_I2C
+    select LAN9118
+    select PCI
=20
 config FSL_IMX6
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 11d4b30..54ff9a8 100644
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
1.8.3.1

