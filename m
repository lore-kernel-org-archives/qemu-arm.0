Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7200212wrx;
        Thu, 7 Mar 2019 06:22:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrfULj7KOpIfQnHjxB+VMCTJ6bul4rI7QVFvv4Zoi3+cYsBjk34SR7pEnarPbFPbrM0XXA
X-Received: by 2002:a25:4981:: with SMTP id w123mr11942716yba.46.1551968566017;
        Thu, 07 Mar 2019 06:22:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968566; cv=none;
        d=google.com; s=arc-20160816;
        b=jSv+cGJ+vwJ9WGFdn6utkQuzIAXHbMPlDAErmDV3rzB/5dEtGqT2pqEuo+zWFhOh6L
         qjo3UN46UmS6JGznk1Y1qWtit6+aRi93KeWGQ8tlQyDAu0Eu0Fm5Ik4wWzDRoK1EYf6v
         j9LbI2YLZj/mAZZ9voWS9Fq/wNez8thgryaoZ8MduFNxBvihcv/AzpiJ7YBQF2eJaf4t
         xQygk8wq0MXNKS+BdjIzTKPF5th+iWB9YlN+yQjFOdIyF5uN6FtM9QfFTrlCDa+lD1PX
         TFyQ9Hu6TPMeFjFOjgCAvkoPAF3aTof+SEtFqOpXh3tU6Zyvu6OAw4JTiRNPgBaEJCFs
         A95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iD1tl/ZrZTkRwPlXdaoLW5VoWtemDCX9HVCed6Vvqog=;
        b=E0xV23TyWEsFZXCiDyYNSXWIlqPCAt7BUP4PYNL3gxx758OEyOpR3+OxJ7pAYvJq3k
         nkDElWuzvBbIrxGdDLnHJAHE1iyZtzSUTxFyOFWuFbedpT5qWXiIhif6ISQkAwANPqoK
         8wTfh/lvPvSmKd5wd0HV2TX92Ti1EtrmLzgyZzRkEVyTKMJ3WOzcozrqDv3pZT2xFz19
         9+mEPhQQ/HAYjejPrD0MTRnjRJshGPoaPQDuWiTstpSROJX3mWIJviIK9R/iUKBM/a6+
         DyNdrvsY0UesePCzy4wnI++bDyjQxgX0HgBPBf13m4AoLChwOx4BdU7cTQlmWHVef2uc
         uP4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si2876549ywh.6.2019.03.07.06.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:22:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tv2-0006aJ-Lg
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsj-0005Fq-TL
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:20:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsi-0000Hp-T2
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:20:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tsc-0008TG-1f; Thu, 07 Mar 2019 09:20:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA2A881104;
	Thu,  7 Mar 2019 14:20:01 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEEE5C1B5;
	Thu,  7 Mar 2019 14:19:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:33 +0100
Message-Id: <1551968334-18982-9-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 07 Mar 2019 14:20:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 08/29] hw/arm: Express dependencies of
 musicpal with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hD/PBBlx5twv

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index a2e74cd..a058bcb 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -9,13 +9,13 @@ CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
+CONFIG_MUSICPAL=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
 CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
-CONFIG_WM8750=3Dy
 CONFIG_TWL92230=3Dy
 CONFIG_TSC2005=3Dy
 CONFIG_LM832X=3Dy
@@ -38,7 +38,6 @@ CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
 CONFIG_PFLASH_CFI01=3Dy
-CONFIG_PFLASH_CFI02=3Dy
 CONFIG_MICRODRIVE=3Dy
 CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
@@ -54,14 +53,12 @@ CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
 CONFIG_PXA2XX=3Dy
-CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
 CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
 CONFIG_DIGIC=3Dy
-CONFIG_MARVELL_88W8618=3Dy
 CONFIG_OMAP=3Dy
 CONFIG_TSC210X=3Dy
 CONFIG_BLIZZARD=3Dy
@@ -135,7 +132,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
 CONFIG_LSI_SCSI_PCI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 40c79d2..08c213d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -49,7 +49,13 @@ config MAINSTONE
=20
 config MUSICPAL
     bool
+    select BITBANG_I2C
+    select MARVELL_88W8618
     select PTIMER
+    select PFLASH_CFI02
+    select PCI
+    select SERIAL
+    select WM8750
=20
 config NETDUINO2
     bool
--=20
1.8.3.1

