Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3808909wrg;
        Tue, 14 May 2019 03:02:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVP7bX9gBr6FvT0kvbWRaBbl3ObHeEuBfVOCBPppdqCvSzNa3JsFAqjbo020nK17kGkipp
X-Received: by 2002:a17:906:82cf:: with SMTP id a15mr2358315ejy.176.1557828167161;
        Tue, 14 May 2019 03:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828167; cv=none;
        d=google.com; s=arc-20160816;
        b=v8qVEaXOiyKw2NUGx5c1oCswLTxx7UK51ufZe6TssH4jFKMPEK26kkil4VG28wwwPX
         /vAk/yVJJmtG05exDaKzz9Oh6dZFYKuJfjlg2m4wyOrkbMFw3jP0gqrWtwPsw5o8PK9B
         uWR0zCsG/zpSk1ka8rgWFQ/+WU+6UG8nrBd6ozY+CriyK53S5eLosI86L4ptkjisJOCw
         udYh+Sc+UX1SW1yP3YTiTDxeH8e0Wy7Cp7jMh0GeZ2G1Bijdr6HngARSvVra2u1JRSyO
         DWtckqnpbxV5ioS2CI/doY5dqUpxomV4U5BsJ9H4a9G6eRq22LCixEEOFft3lrgLdyhU
         9giQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CuatFbCLXJ2Zgwar8dGyxQx6WacPwANqDCxVr/QqNXY=;
        b=Er3SPw6e3i3mGxbFRV50vw/u3c/uJIguQvuu7hOcKnuKPWZPxAmWG0dYCaHrLihO4R
         2G/Rj+p7TA+14H2Z+tR1pcjE0JyVpS6N60loVN+dWbIHxT0mTT7kK/yI8PzwntcL5K7w
         ESNsMUDu12/BHHGNDwP4KgIQxJNf6HtgoVCW4/uzf9jU/bb/FBmfOskkNShLma5HqV0f
         tgZgBFldV0Pe6f2Jk3bqQ0eXXr8i2rfs30nRE+ZlZxRIII8zbJWfLGmbdc5KtkQsppXo
         whkB6cGb4xyh+7hslq5JpOwjaGNguZSRet08q4KHZmhQHWQeW8CH5GcCurPecI26JtEb
         l5MA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si11916849eda.16.2019.05.14.03.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUGk-00084j-5d
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:02:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEv-0006iC-KN
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEu-0004BR-EN
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQUEu-00045I-1H; Tue, 14 May 2019 06:00:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0957981F0C;
	Tue, 14 May 2019 10:00:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E49695C207;
	Tue, 14 May 2019 10:00:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:00:19 +0200
Message-Id: <20190514100019.13263-5-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
References: <20190514100019.13263-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 10:00:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/4] hw/misc: Add a config switch for the
 "unimplemented" device
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpc4HAzkLs9C

The device is only used by certain Arm boards. Now that we have
fine-grained Kconfig for these machines, too, we can enable the
"unimplemented" devices only for the machines that really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 9 +++++++++
 hw/microblaze/Kconfig | 1 +
 hw/misc/Kconfig       | 3 +++
 hw/misc/Makefile.objs | 2 +-
 hw/sparc64/Kconfig    | 1 +
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ac1e94f63a..7e261f5d73 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -201,6 +201,7 @@ config STELLARIS
     select SSI_SD
     select STELLARIS_INPUT
     select STELLARIS_ENET # ethernet
+    select UNIMP
=20
 config STRONGARM
     bool
@@ -267,6 +268,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_PIC
     select ALLWINNER_EMAC
     select SERIAL
+    select UNIMP
=20
 config RASPI
     bool
@@ -304,6 +306,7 @@ config XLNX_VERSAL
     select PL011
     select CADENCE
     select VIRTIO_MMIO
+    select UNIMP
=20
 config FSL_IMX25
     bool
@@ -339,6 +342,7 @@ config ASPEED_SOC
     select SSI_M25P80
     select TMP105
     select TMP421
+    select UNIMP
=20
 config MPS2
     bool
@@ -360,6 +364,7 @@ config FSL_IMX7
     select IMX_I2C
     select PCI_EXPRESS_DESIGNWARE
     select SDHCI
+    select UNIMP
=20
 config ARM_SMMUV3
     bool
@@ -371,6 +376,7 @@ config FSL_IMX6UL
     select IMX_FEC
     select IMX_I2C
     select SDHCI
+    select UNIMP
=20
 config MICROBIT
     bool
@@ -380,6 +386,7 @@ config NRF51_SOC
     bool
     select I2C
     select ARM_V7M
+    select UNIMP
=20
 config EMCRAFT_SF2
     bool
@@ -392,6 +399,7 @@ config MSF2
     select PTIMER
     select SERIAL
     select SSI
+    select UNIMP
=20
 config ZAURUS
     bool
@@ -430,6 +438,7 @@ config ARMSSE
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
+    select UNIMP
=20
 config ARMSSE_CPUID
     bool
diff --git a/hw/microblaze/Kconfig b/hw/microblaze/Kconfig
index c4dc120973..e2697ced9c 100644
--- a/hw/microblaze/Kconfig
+++ b/hw/microblaze/Kconfig
@@ -4,6 +4,7 @@ config PETALOGIX_S3ADSP1800
     select XILINX
     select XILINX_AXI
     select XILINX_ETHLITE
+    select UNIMP
=20
 config PETALOGIX_ML605
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 385e1b0cec..51754bb47c 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -117,4 +117,7 @@ config AUX
     bool
     select I2C
=20
+config UNIMP
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index c71e07ae35..7a0902c76f 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-$(CONFIG_PCI_TESTDEV) +=3D pci-testdev.o
 common-obj-$(CONFIG_EDU) +=3D edu.o
 common-obj-$(CONFIG_PCA9552) +=3D pca9552.o
=20
-common-obj-y +=3D unimp.o
+common-obj-$(CONFIG_UNIMP) +=3D unimp.o
 common-obj-$(CONFIG_FW_CFG_DMA) +=3D vmcoreinfo.o
=20
 # ARM devices
diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
index d4d76a89be..f9f8b0f73a 100644
--- a/hw/sparc64/Kconfig
+++ b/hw/sparc64/Kconfig
@@ -17,3 +17,4 @@ config NIAGARA
     bool
     select EMPTY_SLOT
     select SUN4V_RTC
+    select UNIMP
--=20
2.21.0

