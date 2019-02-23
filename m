Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7784706wrx;
        Fri, 22 Feb 2019 23:56:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYwwl3CZh533Ht7MhQ/zHR19kW3SaM6Z258oZH4chugAIus5ECSrU84TQ7a5wqPdxbuuZzO
X-Received: by 2002:a81:c808:: with SMTP id n8mr6198964ywi.20.1550908562912;
        Fri, 22 Feb 2019 23:56:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908562; cv=none;
        d=google.com; s=arc-20160816;
        b=H0/Q1AVYL0y/xoQ8qdao/rvx8FaJEuZlLeXfIfR8pLdkSoI+olGQP09ayvfpVVE7g5
         bazdsx2wZY478TxTbJ99qc7QmvBgVAm90aq9LC6eZWPK315gZYuBk+SJ0DBUvZFpbfsY
         W2Wx22Ipyl6xtuAgPb9bxqfmM4dPTcJJeiJAhG9ipMEQUhLfu2MbwQmjVbamOcvJI1mC
         NUIHee5uzjCB5KBiSYnrHNrnI4zLwVCnb3q7vuLbZ9TrtdecTtahuPEISlBuB5AiTFfe
         Zch4lFJCGrWoEjUhRZItIc2io/8Tk2pWvBcvoFm8V5Vjq+7k1eo8K8I1Q5vYJ/hAK/B+
         ORSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5UQa154eQUjoxafcLsuCLPWHVXOoq/g4ZvW0/GGunac=;
        b=o1dg0L5aZfQt92I4IoyqV/C3uJ1NBKdY6bhdQskOvvLRGqdDQuA2FfhvmXgyKtmAE1
         H/QSkk1Tp40hyL837mV0aZs0K1wdwrnDkxgn7jWGdhIpt0nBP++1X19goMaWfK38ZPZj
         6fLgcwwawad6ML96C/fRBP7PqkJnAnKLLZyN96azcKX3zOVaGUgQJAqx9sooAPDuNzMM
         Q/8RPmxEiOJC7s3+NuclQbCSbbuGs11hLObslNMQXO8+rassqsVo0npwor0MwGRciMWF
         En1CJ1AplusU6xa6LqunIidE3/mByyqkNp8DsbY2Uefy/SO4SJ1xoA7/NijAeWwukiQF
         dUjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si2093665ywb.345.2019.02.22.23.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:56:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSAE-000058-9n
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4H-0004cH-Ec
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4F-00020D-IV
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:49:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4D-0001y9-7u; Sat, 23 Feb 2019 02:49:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8853D3065452;
	Sat, 23 Feb 2019 07:49:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 192345D9CA;
	Sat, 23 Feb 2019 07:49:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:02 +0100
Message-Id: <1550908162-22644-11-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Sat, 23 Feb 2019 07:49:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 10/30] hw/arm: Express dependencies of the
 OMAP machines with Kconfig
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
X-TUID: PyM0Dpfm9PmE

Add Kconfig dependencies for the OMAP machines (cheetah, n800, n810,
sx1 and sx1-v1).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 17 ++++-------------
 hw/arm/Kconfig                  | 26 ++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index c8eafb1..e0818f1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -10,16 +10,16 @@ CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
 CONFIG_MUSICPAL=3Dy
+CONFIG_MUSCA=3Dy
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
@@ -37,9 +37,7 @@ CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
-CONFIG_PFLASH_CFI01=3Dy
 CONFIG_MICRODRIVE=3Dy
-CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
@@ -59,15 +57,8 @@ CONFIG_ZYNQ_DEVCFG=3Dy
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
-CONFIG_MUSCA=3Dy
-CONFIG_NSERIES=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_ZAURUS=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ece2962..af559be 100644
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
@@ -64,9 +69,26 @@ config NETDUINO2
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
@@ -80,6 +102,10 @@ config STELLARIS
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
index fa57c7c..8302b8d 100644
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

