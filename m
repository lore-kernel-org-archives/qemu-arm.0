Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp619766wrs;
        Fri, 23 Aug 2019 07:05:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycMYIKXltB7rmA0F/aCCHCkEfQiEVeAvBZ2e2h5i/hB1HyR3zu/ALra7CJw0Q5zqYPqDPt
X-Received: by 2002:a50:8981:: with SMTP id g1mr4751617edg.53.1566569148449;
        Fri, 23 Aug 2019 07:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566569148; cv=none;
        d=google.com; s=arc-20160816;
        b=gQtfq27wbxMn7GXeR/GQjyIHqc8hfHuS0CCipMnDpNBoULGSoHKFWiGLQri5hOIBSa
         w+ShHh0WG2s+VYeknBhHt0sDJAWi4lSCnN/xG1wjSXkXLQAPmu9cTSprkWI5nf0QocAU
         B26daqqc7zMU/H7WbTbYaB5xPWHHwrmM5GEscsBOZ39Nq0CJMSvK759gv1hbxOlZlutf
         rL+D/YoE4xtSdWoXsgNMj77+Ob23yech0u6ej+kL4usWFYm1mWqQeIFoefnnPaTN2jRH
         /ALvRWAK+4iW3aX4n2BwUbUtIbaxEqQek5pZ9hQQydD2MvUGoNUnz0mjt6GG/vHmwzVN
         k7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0458cFGGj+YP3EgSF0ybtk1RwFlRBgY5QRKw905cO9Y=;
        b=uehjzz+TxM8okXhxgIbSyIfwBBfU3i4yJbb7rKTWBKPhRe+KMrGhxPcZ4aES+4H8GD
         4wAal69fHRduhCXz/j/pIkcKoNSXPhyGyvUsilJEquXnAeK+EyUNeJt+R+5ExropKYJy
         XVsfDbbkL6f+pBq9wiDqpvaBzcsweI0q6Q0LQKBYldYrYyIbomAoVSFl2qEBz4YI5B0l
         +tuxVgM/lTUE/qBeQgVz9Tw+uULaYGleI+ERybYlnwtEW7Q7JzdCIskEyvMhHV+3IgyQ
         sVeR9w6yTq82pKSjcr65NiPiroNG9wcJflFA4mhGDisE4NdIOQ5WMFV5uoDtVxRL42sj
         oksA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k29si1811637eda.408.2019.08.23.07.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1ACJ-0007Z7-CY
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1A5M-0001bY-5O
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1A5K-0007NC-WD
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:58:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1A5I-0007KZ-Jt; Fri, 23 Aug 2019 09:58:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2D39300BEB4;
 Fri, 23 Aug 2019 13:58:28 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF59F19C77;
 Fri, 23 Aug 2019 13:58:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 15:58:11 +0200
Message-Id: <20190823135811.13883-5-philmd@redhat.com>
In-Reply-To: <20190823135811.13883-1-philmd@redhat.com>
References: <20190823135811.13883-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 23 Aug 2019 13:58:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/4] RFC target/arm: Do not build A/M-profile
 cpus when using KVM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/VutgBLgDaB

A KVM-only build won't be able to run A or M-profile cpus,
disable them.

If KVM is not enabled, they are enabled by default.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Sadly this does not work with --enable-tcg --enable-kvm dual config.
---
 default-configs/arm-softmmu.mak | 14 ++++++--------
 hw/arm/Kconfig                  | 16 +++++++++++++---
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 081d507c87..3995c4bb65 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,25 +1,18 @@
 # Default configuration for arm-softmmu
=20
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=3Dy
-
 # CONFIG_PCI_DEVICES=3Dn
 # CONFIG_TEST_DEVICES=3Dn
+CONFIG_ARM_V7M=3Dn
=20
 CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_FSL_IMX31=3Dy
-CONFIG_MUSCA=3Dy
-CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VEXPRESS=3Dy
 CONFIG_ZYNQ=3Dy
-CONFIG_NETDUINO2=3Dy
-CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_SABRELITE=3Dy
-CONFIG_EMCRAFT_SF2=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_SEMIHOSTING=3Dy
@@ -38,4 +31,9 @@ CONFIG_SEMIHOSTING=3Dy
 #CONFIG_ASPEED_SOC=3Dy
 #CONFIG_NSERIES=3Dy
 #CONFIG_HIGHBANK=3Dn
+#CONFIG_MUSCA=3Dn
+#CONFIG_STELLARIS=3Dn
+#CONFIG_NETDUINO2=3Dn
+#CONFIG_MPS2=3Dn
+#CONFIG_EMCRAFT_SF2=3Dn
 #CONFIG_MICROBIT=3Dn
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 902cceca7e..9b16dfaa5f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -13,6 +13,18 @@ config ARM_V6
     depends on !KVM
     bool
=20
+# ARM Microcontroller profile
+config ARM_V7M
+    default y
+    depends on !KVM
+    bool
+
+# ARM Realtime profile
+config ARM_V7R
+    default y
+    depends on !KVM
+    bool
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -298,9 +310,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
=20
-config ARM_V7M
-    bool
-
 config ALLWINNER_A10
     bool
     select AHCI
@@ -328,6 +337,7 @@ config STM32F205_SOC
=20
 config XLNX_ZYNQMP_ARM
     bool
+    select ARM_V7R
     select AHCI
     select ARM_GIC
     select CADENCE
--=20
2.20.1

