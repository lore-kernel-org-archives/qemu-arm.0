Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7197350wrx;
        Thu, 7 Mar 2019 06:20:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmu4JwRShlLy3/mqxKuvnlZ2hngusKevhvIHxNEM3hvZd8TlIE7RQHYU+AbskpF0Lwe9Nb
X-Received: by 2002:a0d:db08:: with SMTP id d8mr9725497ywe.319.1551968412317;
        Thu, 07 Mar 2019 06:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968412; cv=none;
        d=google.com; s=arc-20160816;
        b=V7FULKU4J7PKabZ4ZQfQPAutMe9dUT6TaAg6XA4n5GxqgfXjLeSvl3b0d7aB3g3m/s
         ej22GcHr4N6kOTQZ1FxQwReQh4AZxzIJ9kSxYHwo3IvDMXRP/q/rKyWWSVx+V9tmRdn1
         RTgJH9lgbbiQjUGcpdwMY/3M6BFex7BKEL8r8p9XyyqiyawzE1giHciu+e8FA3qyVm8C
         iRvTeupPd4eOqXMfX/9iWKlgFEtyQ5vuCLg2M9dyAbyM6aMN5lj8zJw8PFSSgJlyyDZy
         B8IbUHNns8Qw0pacBo8dyZ6LnOta5O19v/gqGyZQ2NKsm1XFTLCEnn3dcv+l4KxUqSti
         FyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Ciw7ra4XdRbCYOu4ij1UZ7WR05yDwVHvpS483cYHZEg=;
        b=02vb226le+R2ZiSl5tulsdEqxQnuGEY8fUccY8JnCCq/drAtWDjdM8I/e3UyQgDQVs
         BPF1IfyBMVpSWeyBJiv4u8oXnUkVRICs8qbVT6I/pFCdkHF8zIJRUB2QzqiOHh91+M6z
         57E2YtTvi2QIMoXY/hKAaCyw0hjjBZ4mG4u5W4aBglyawdpOA4PWGRrO9YJxMRL4gJau
         D0K/I/LIsnC9L8/77OoC+fue8hMGSnKgha0Jasdynkk4LdaIfy75LWIHeydr8A3A6uEN
         PZ3sYPns0Oztwz4Z+TfttmqzH8mLYvvJaGoJ3ROSSYVas/9C32qDzdgQW3pToS/3fyKD
         g9vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si2712771ywo.154.2019.03.07.06.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tsZ-0004qh-Fj
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:20:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1trz-0004YN-SA
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1try-0008DW-2r
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1trw-0008AR-6n; Thu, 07 Mar 2019 09:19:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E13E3089E68;
	Thu,  7 Mar 2019 14:19:31 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09BFD5C1B5;
	Thu,  7 Mar 2019 14:19:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:29 +0100
Message-Id: <1551968334-18982-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 07 Mar 2019 14:19:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 04/29] hw/arm: Express dependencies of the
 exynos machines with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Isdy7+Xk4HOQ

Add Kconfig dependencies for the Exynos-related boards (nuri and
smdkc210).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 18 ++++++------------
 hw/arm/Kconfig                  | 11 +++++++++++
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2a7efc1..3475d50 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,7 +1,12 @@
 # Default configuration for arm-softmmu
=20
-CONFIG_PCI=3Dy
+# TODO: ARM_V7M is currently always required - make this more flexible!
+CONFIG_ARM_V7M=3Dy
+
 CONFIG_PCI_DEVICES=3Dy
+
+CONFIG_EXYNOS4=3Dy
+
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
@@ -25,7 +30,6 @@ CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_LAN9118=3Dy
 CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
@@ -35,21 +39,15 @@ CONFIG_PFLASH_CFI01=3Dy
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
@@ -60,11 +58,9 @@ CONFIG_PL080=3Dy
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
@@ -72,7 +68,6 @@ CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
-CONFIG_A9SCU=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_MARVELL_88W8618=3Dy
 CONFIG_OMAP=3Dy
@@ -122,7 +117,6 @@ CONFIG_VERSATILE_I2C=3Dy
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
=20
-CONFIG_SDHCI=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_INTEGRATOR_DEBUG=3Dy
=20
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d298fbd..74436cc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -8,7 +8,14 @@ config DIGIC
=20
 config EXYNOS4
     bool
+    select A9MPCORE
+    select I2C
+    select LAN9118
+    select PCI
+    select PL310 # cache controller
     select PTIMER
+    select SDHCI
+    select USB_EHCI_SYSBUS
=20
 config HIGHBANK
     bool
@@ -104,6 +111,10 @@ config ZAURUS
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
1.8.3.1

