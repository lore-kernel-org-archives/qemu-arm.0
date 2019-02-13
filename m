Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1663502wrp;
        Wed, 13 Feb 2019 00:59:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYoMboixgJ9yQpFJchYBHQiJzaPG8jrdKR/A4iszB+ij1snqCQH8GZK80Wcm2zoFgiByRe5
X-Received: by 2002:a81:4ccf:: with SMTP id z198mr3771399ywa.457.1550048345980;
        Wed, 13 Feb 2019 00:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048345; cv=none;
        d=google.com; s=arc-20160816;
        b=bDPZF8Y17fi75jeNa0qHF3fKJimgW7UmdXCNXjpHKxIW6bcveD2yhGvTltJoQN+kBe
         HhvErvbWS5ZlPzjTORtl2NXct6ppKWZgd1hCNbYD6+92bnMVhz1p4tD4u6wAhdiFi6ce
         ammSg1yFGEAcSz3MYr6PGOSLeu8ehBUSGUZ9zd60YRCwsoQ+L4d7wN8uJGhtzDNg7Sdu
         j+JDWRyJsk18H67VztpTl1uS36p57R1M3H8UFpe/1/NuX8AkpnnZM6UdDV+3TKjCSv53
         dlvzmXjqLF+NZiuh83/1JFXO1NvAcvizcfw1uMcXwSr8Y5v9As1iaVFgkTwMgrYuzsTZ
         Oa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HI7DN8psMYI5/eXX0ZMx9EA+Xqcz9j79gC6FMCBkYrA=;
        b=b2nmMqXpg6J92E6GWp0uE+FAMMnZkY3NunsF+po6ifLk1C6daxMVaOb/LZcZHKxDKP
         Y8SPRPnV1TAPdgbW8CJtZVT66ko0hMefl8h/RCE8IBg06sfZwIDt/jAXZLU2RbGGRnxN
         VQC16j7JF4xVnt3cyTCcwbMIYukJ129deLg2QDJPVVloLGJLtN+TyBUb4Ym4iy8KEpXQ
         CKE/Gg24rmCdeNwCKaQ1R2RTHAn+hj8nb2WsLdZN5cNtqXbq2ZFoTZP3v0sAWQkEzADq
         9tFrWNbsFFqoW2lPP6/Tb61ECtzdxcl1o3FCx4lAgYJl1l/kleuqic9ppmR4J05NUKq1
         Sp2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g189si9235268ywg.331.2019.02.13.00.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqNl-0000Y2-Br
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG5-00023s-Lg
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4G-0005Sz-Tm
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:38:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4F-0005K5-3y; Wed, 13 Feb 2019 03:38:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DF495D61D;
	Wed, 13 Feb 2019 08:38:50 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D86B8101E841;
	Wed, 13 Feb 2019 08:38:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:37:59 +0100
Message-Id: <1550047098-1210-7-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 13 Feb 2019 08:38:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 06/25] hw/arm: Express dependencies of the
 OMAP machines with Kconfig
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
X-TUID: gttgNAISVSNs

Add Kconfig dependencies for the OMAP machines (cheetah, n800, n810,
sx1 and sx1-v1).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 15 +++------------
 hw/arm/Kconfig                  | 26 ++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index fe7e306..492db53 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -10,16 +10,15 @@ CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
 CONFIG_MUSICPAL=3Dy
+CONFIG_CHEETAH=3Dy
+CONFIG_SX1=3Dy
+CONFIG_NSERIES=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
 CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
-CONFIG_TWL92230=3Dy
-CONFIG_TSC2005=3Dy
-CONFIG_LM832X=3Dy
-CONFIG_TMP105=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
 CONFIG_STELLARIS=3Dy
@@ -37,9 +36,7 @@ CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
-CONFIG_PFLASH_CFI01=3Dy
 CONFIG_MICRODRIVE=3Dy
-CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
@@ -61,14 +58,8 @@ CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
 CONFIG_DIGIC=3Dy
-CONFIG_OMAP=3Dy
-CONFIG_TSC210X=3Dy
-CONFIG_BLIZZARD=3Dy
-CONFIG_ONENAND=3Dy
-CONFIG_TUSB6010=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
-CONFIG_NSERIES=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_ZAURUS=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index aeb0cf0..fe1505e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,6 +1,11 @@
 config ARM_VIRT
     bool
=20
+config CHEETAH
+    bool
+    select OMAP
+    select TSC210X
+
 config DIGIC
     bool
     select PTIMER
@@ -61,9 +66,26 @@ config NETDUINO2
=20
 config NSERIES
     bool
+    select OMAP
+    select TMP105   # tempature sensor
+    select BLIZZARD # LCD/TV controller
+    select ONENAND
+    select TSC210X  # touchscreen/sensors/audio
+    select TSC2005  # touchscreen/sensors/keypad
+    select LM832X   # GPIO keyboard chip
+    select TWL92230 # energy-management
+    select TUSB6010
=20
 config OMAP
     bool
+    select FRAMEBUFFER
+    select I2C
+    select ECC
+    select NAND
+    select PFLASH_CFI01
+    select PCI
+    select SD
+    select SERIAL
=20
 config PXA2XX
     bool
@@ -77,6 +99,10 @@ config STELLARIS
 config STRONGARM
     bool
=20
+config SX1
+    bool
+    select OMAP
+
 config VERSATILE
     bool
=20
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fa40e8d..b0fd556 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -9,7 +9,8 @@ obj-$(CONFIG_MAINSTONE) +=3D mainstone.o
 obj-$(CONFIG_MUSICPAL) +=3D musicpal.o
 obj-$(CONFIG_NETDUINO2) +=3D netduino2.o
 obj-$(CONFIG_NSERIES) +=3D nseries.o
-obj-$(CONFIG_OMAP) +=3D omap_sx1.o palm.o
+obj-$(CONFIG_SX1) +=3D omap_sx1.o
+obj-$(CONFIG_CHEETAH) +=3D palm.o
 obj-$(CONFIG_PXA2XX) +=3D gumstix.o spitz.o tosa.o z2.o
 obj-$(CONFIG_REALVIEW) +=3D realview.o
 obj-$(CONFIG_STELLARIS) +=3D stellaris.o
--=20
1.8.3.1

