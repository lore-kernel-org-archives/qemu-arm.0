Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp454671wrs;
        Sat, 17 Aug 2019 03:23:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywVD/MKNvDYkDnvGRdW7LGzjZUX82sidnRAd2ayU6CuiMcxbqQIEjDoUGyvpGDwfw8KgO+
X-Received: by 2002:a50:ccd4:: with SMTP id b20mr15661987edj.241.1566037382606;
        Sat, 17 Aug 2019 03:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037382; cv=none;
        d=google.com; s=arc-20160816;
        b=Qoakkzc74sKyKr1TMf6b+iEM04JQL5DVcl+YTXQVJb3g7Y7G/9dhNZDpzWRvJ9TMhn
         O3IEk6Y4ZFQ8DF7kFCIo669az3VZmlZD/Jlx4hQHP0UfXcLuATzVTH6XrcOiH3p3bLrv
         reEVIpWDm1dYjV1gzyKno4lcM5p9qXbWb3uWvNPKwTpBHfYfNh2JoQ7N1GOxVNnwd31b
         MV8dY0kd5DfQfGB5LUYD5ypDnYBzsSXzP4dYTd7k8Y677wxy6udV9eQ4oKwDBwuoys5a
         89p/jcZ72fjHAD+jYYl2es3yzUHtEkMjGLsun03+zTKy2+Bnk19FZq/SADlEDNTHxryE
         X7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=5no29F4ou4K/CTv3y2GdKpflS2zf9XgryLOrhUgtV5k=;
        b=cto6dqKm00ibkYWPZ/1XtVoTQ2nlJwY8SA9LI15A8yGk4vYI4CYWlulkMRzOqXmwg+
         UGypBvZPElcEBhQPEeC9G40uz8yNRNceyNl9bgszudYkZpO7jdxjs0f5Cp74y84wGA9l
         5wfE/2NXtyDPmZuENKqJvZBgYS9N0fgKA9Ef7QrsbTQXZucMxVN81QAX17s8Pmm77ZYx
         Ib/63LnL0npdYVnB71OcftEgWE6slfPjUtNMSY4yNngt3QIR+pGKgude4MASq6o2ezRF
         ierWg/GFY1+D1Zm0TQDsPid6CyBNfhyCdGV10wFkPSSDrxElLtwA4KVka5UWmXaUVDMw
         ay5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si5111568ede.393.2019.08.17.03.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvrR-0005G4-E6
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoa-00011O-5v
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:20:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoY-0004gT-Vx
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:20:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46964)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoY-0004fP-Mz; Sat, 17 Aug 2019 06:20:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E53A3301E13E;
 Sat, 17 Aug 2019 10:20:01 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD6BD1E5;
 Sat, 17 Aug 2019 10:19:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:30 +0200
Message-Id: <20190817101931.28386-8-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sat, 17 Aug 2019 10:20:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 7/8] hw/misc: Add a config switch for the
 "unimplemented" device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Ku0zwZYNKHw

The device is only used by some few boards. Let's use a proper Kconfig
switch so that we only compile this code if we really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 11 +++++++++++
 hw/microblaze/Kconfig |  1 +
 hw/misc/Kconfig       |  3 +++
 hw/misc/Makefile.objs |  2 +-
 hw/sparc64/Kconfig    |  1 +
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6e24c73b54..76a2a6bcbf 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -82,6 +82,7 @@ config MUSCA
     select PL011
     select PL031
     select SPLIT_IRQ
+    select UNIMP
 
 config MUSICPAL
     bool
@@ -217,6 +218,7 @@ config STELLARIS
     select SSI_SD
     select STELLARIS_INPUT
     select STELLARIS_ENET # ethernet
+    select UNIMP
 
 config STRONGARM
     bool
@@ -283,6 +285,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_PIC
     select ALLWINNER_EMAC
     select SERIAL
+    select UNIMP
 
 config RASPI
     bool
@@ -320,6 +323,7 @@ config XLNX_VERSAL
     select PL011
     select CADENCE
     select VIRTIO_MMIO
+    select UNIMP
 
 config FSL_IMX25
     bool
@@ -355,6 +359,7 @@ config ASPEED_SOC
     select SSI_M25P80
     select TMP105
     select TMP421
+    select UNIMP
 
 config MPS2
     bool
@@ -366,6 +371,7 @@ config MPS2
     select PL022    # Serial port
     select PL080    # DMA controller
     select SPLIT_IRQ
+    select UNIMP
 
 config FSL_IMX7
     bool
@@ -378,6 +384,7 @@ config FSL_IMX7
     select IMX_I2C
     select PCI_EXPRESS_DESIGNWARE
     select SDHCI
+    select UNIMP
 
 config ARM_SMMUV3
     bool
@@ -389,6 +396,7 @@ config FSL_IMX6UL
     select IMX_FEC
     select IMX_I2C
     select SDHCI
+    select UNIMP
 
 config MICROBIT
     bool
@@ -398,6 +406,7 @@ config NRF51_SOC
     bool
     select I2C
     select ARM_V7M
+    select UNIMP
 
 config EMCRAFT_SF2
     bool
@@ -410,6 +419,7 @@ config MSF2
     select PTIMER
     select SERIAL
     select SSI
+    select UNIMP
 
 config ZAURUS
     bool
@@ -448,6 +458,7 @@ config ARMSSE
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
+    select UNIMP
 
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
 
 config PETALOGIX_ML605
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 385e1b0cec..51754bb47c 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -117,4 +117,7 @@ config AUX
     bool
     select I2C
 
+config UNIMP
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index e9aab519a1..e4aad707fb 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-$(CONFIG_PCI_TESTDEV) += pci-testdev.o
 common-obj-$(CONFIG_EDU) += edu.o
 common-obj-$(CONFIG_PCA9552) += pca9552.o
 
-common-obj-y += unimp.o
+common-obj-$(CONFIG_UNIMP) += unimp.o
 common-obj-$(CONFIG_FW_CFG_DMA) += vmcoreinfo.o
 
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
-- 
2.18.1

