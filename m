Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp933653wrx;
        Thu, 18 Apr 2019 11:14:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydG+8zs7PIu5mQwGqIc6TbQk0G/NiaAp4rfEC9L9B0jLK95t18DnAyNWViiUsSJv4hE9ON
X-Received: by 2002:a1c:2087:: with SMTP id g129mr4412456wmg.114.1555611250880;
        Thu, 18 Apr 2019 11:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611250; cv=none;
        d=google.com; s=arc-20160816;
        b=fqCJH5ntpKnKyXlywtPduacgvGZFY3KmSsFtoJ00R3DQ6sGH6KhqBnC2iURvxwAfWq
         hhyDm6UvdrCkG/Q1X7k+5xPhWXP8C593H7Pw+1ne7SDfnwK9j8bkBrRULF0pUUXY9MLd
         mL5jCLMqeVaH1XFPiTc2NuaMfSACvPGorrrTUAePUgEGTdTTMw4LV1GiphBGdnFgX9uQ
         jqScZ0l51ZueRLr32i+di6J/TH88oQTxL3/Yw157Z5oYKcA5ohUpOaDLfOqnyns5TUK7
         US8SD6Lb95GVspeXmZ7wtZfuzokDQoi6aJf7CVfdI3+FObvGAeWstjEr0fAhVkjjmWzI
         B1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4QveAJ75IV99Wo72EXjH0UigEuuLOua+GCdTNHtaGT0=;
        b=E51hNuCxUQeI/No8uwzqvwdqiCR4lZFLVs9uoTnVCpI9ZFwtugqWUv9hW8p9qsJ1Is
         4RRfK0UpFTstjvMTk3jaBzqoJaaZWuOv2E5JUFZXyAMdFk2z6i1rrhQITXv3GKOR59yB
         hmNAC03CGi7/NRd/vg3MqNjdziVmv42vWirUnaiZh4qZtUo6HmnLhftuQvki67tJ+1zw
         e45y0iiXaEkgqVu5Tkskv/7mYjgrkoBRL8YbZQW9t6q3OQsrTHZ4Wo628qeshFDWC7OQ
         pYnSfr0omIw2JJbbdpRjBlqxfG2PPmA0kfw8yuX2WfViZTrLTNsRG/p70PzuzEP56eHF
         Pe+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si2222362wrn.82.2019.04.18.11.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:14:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBY1-0003nd-QQ
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:14:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMr-0003La-K5
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMq-00025u-E1
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:02:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBMi-0001ya-JU; Thu, 18 Apr 2019 14:02:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B38C6307B965;
	Thu, 18 Apr 2019 18:02:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDB4F1001E98;
	Thu, 18 Apr 2019 18:02:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:37 +0200
Message-Id: <20190418180057.3593-10-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Apr 2019 18:02:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-QEMU-4.1 v5 09/29] hw/arm: Express
 dependencies of the OMAP machines with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oj507mdJpdw2

Add Kconfig dependencies for the OMAP machines (cheetah, n800, n810,
sx1 and sx1-v1).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 17 ++++-------------
 hw/arm/Kconfig                  | 25 +++++++++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 0a4d293f8a..b7ed3c530b 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -12,16 +12,16 @@ CONFIG_HIGHBANK=3Dy
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
@@ -39,9 +39,7 @@ CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
-CONFIG_PFLASH_CFI01=3Dy
 CONFIG_MICRODRIVE=3Dy
-CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
@@ -61,15 +59,8 @@ CONFIG_ZYNQ_DEVCFG=3Dy
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
index b9f3c3c232..71126254ff 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -2,6 +2,11 @@ config ARM_VIRT
     bool
     imply VFIO_PLATFORM
=20
+config CHEETAH
+    bool
+    select OMAP
+    select TSC210X
+
 config DIGIC
     bool
     select PTIMER
@@ -58,9 +63,25 @@ config NETDUINO2
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
+    select SD
+    select SERIAL
=20
 config PXA2XX
     bool
@@ -74,6 +95,10 @@ config STELLARIS
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
index fa57c7c770..8302b8df1d 100644
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
2.21.0

