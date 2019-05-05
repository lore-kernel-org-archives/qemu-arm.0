Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1428330wrh;
        Sun, 5 May 2019 06:57:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkAPCGYokF/anZohqK2qvYS4D8j/Paxw3h/kfPJL9r/Qs4PtgBLrgwB0EdoTZgg9ZcCxUI
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr13025211wmf.87.1557064667770;
        Sun, 05 May 2019 06:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064667; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMAvljegrR6WKDNvMVg0CX/ZEb9wtRqmZPEmOuJqtgzDhyTIPUfvf1Y9ufNaIxkhhs
         7h4KtNy0pcysnTJ1PSX9rptgXDMDF4d60Bg4Pa2VZ32IJ7fuH5FyvX74nTD7vLN3ZA7h
         VlPwKyJGAUuOPgSGYFwFMZp6axEEgIGEt6dE9crVOZB4kL3E2EYp6gaZ2XzJ1y2RerLH
         NEXTuQH049JYTWHCtuKJxmlvVPQu2iVohpF2XAu/YFmi0QHr/9XdMVu2F+bb9MM07kbg
         wcn9oEpLFd5w0ixOKy22JB9jOB//ncpCl1fgwPj1lve1CLcJ7xlbR2YWsZR5aM2/UiwN
         bSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Ib+QgDF9UFzx6yYhshD21WP+BFyo2CKcigd/j5hDGVU=;
        b=yStNajDgjh4Q3H45Q5ucBLDlDYSycbBd+0eyJ8WvAdxkVQCFTuYdcJf732ycw9Suwq
         IpDIyN9/6jqF6KPWzIqqi+qrrRGM6ZM9k1A8+KWkpKE2eBOrYrgyX4RJ+7J48vTecKbL
         sbC8qXKd09uI3Oh24M6vVyKwbfck2UKvWlepjMUlE9nXkE59Sc3bwsZbkOShuwil8tH/
         ajpC1JHdNog2OSrjYKxVJn4tDYTxyt7WHPuzBJ0CdY54sMwqeHRrkbMglgvy/3uyVVAv
         0J8qcUObAq9b3Ei24NINmM1ToSzqqo4IJm0tGn/pfwQoffcUwk20ExTC2HQ6aE93CTyW
         ugLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si5550038wrm.158.2019.05.05.06.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 06:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHeE-00045N-Le
	for alex.bennee@linaro.org; Sun, 05 May 2019 09:57:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdt-00042s-7D
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHds-0004Z1-8K
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHds-0004YN-0l; Sun, 05 May 2019 09:57:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43482C051684;
	Sun,  5 May 2019 13:57:23 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 352A460C5F;
	Sun,  5 May 2019 13:57:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:49 +0200
Message-Id: <20190505135714.11277-4-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 05 May 2019 13:57:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 03/28] hw/arm: Express dependencies of the exynos
 machines with Kconfig
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
X-TUID: LNMVSAESPkvM

Add Kconfig dependencies for the Exynos-related boards (nuri and
smdkc210).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 17 ++++++-----------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 613d19a06d..2a11e76cc7 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,8 +1,14 @@
 # Default configuration for arm-softmmu
=20
+# TODO: ARM_V7M is currently always required - make this more flexible!
+CONFIG_ARM_V7M=3Dy
+
 CONFIG_PCI=3Dy
 CONFIG_PCI_DEVICES=3Dy
 CONFIG_PCI_TESTDEV=3Dy
+
+CONFIG_EXYNOS4=3Dy
+
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
@@ -26,7 +32,6 @@ CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_LAN9118=3Dy
 CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
@@ -36,21 +41,15 @@ CONFIG_PFLASH_CFI01=3Dy
 CONFIG_PFLASH_CFI02=3Dy
 CONFIG_MICRODRIVE=3Dy
 CONFIG_USB_MUSB=3Dy
-CONFIG_USB_EHCI_SYSBUS=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_ARM11MPCORE=3Dy
-CONFIG_A9MPCORE=3Dy
 CONFIG_A15MPCORE=3Dy
=20
-CONFIG_ARM_V7M=3Dy
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_ARM_GIC=3Dy
 CONFIG_ARM_TIMER=3Dy
-CONFIG_ARM_MPTIMER=3Dy
-CONFIG_A9_GTIMER=3Dy
 CONFIG_PL011=3Dy
 CONFIG_PL022=3Dy
 CONFIG_PL031=3Dy
@@ -61,11 +60,9 @@ CONFIG_PL080=3Dy
 CONFIG_PL110=3Dy
 CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
-CONFIG_PL310=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
 CONFIG_XGMAC=3Dy
-CONFIG_EXYNOS4=3Dy
 CONFIG_PXA2XX=3Dy
 CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
@@ -73,7 +70,6 @@ CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
-CONFIG_A9SCU=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_MARVELL_88W8618=3Dy
 CONFIG_OMAP=3Dy
@@ -123,7 +119,6 @@ CONFIG_VERSATILE_I2C=3Dy
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
=20
-CONFIG_SDHCI=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_INTEGRATOR_DEBUG=3Dy
=20
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d298fbdc89..acd07b2add 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -8,7 +8,13 @@ config DIGIC
=20
 config EXYNOS4
     bool
+    select A9MPCORE
+    select I2C
+    select LAN9118
+    select PL310 # cache controller
     select PTIMER
+    select SDHCI
+    select USB_EHCI_SYSBUS
=20
 config HIGHBANK
     bool
@@ -104,6 +110,10 @@ config ZAURUS
=20
 config A9MPCORE
     bool
+    select A9_GTIMER
+    select A9SCU       # snoop control unit
+    select ARM_GIC
+    select ARM_MPTIMER
=20
 config A15MPCORE
     bool
--=20
2.21.0

