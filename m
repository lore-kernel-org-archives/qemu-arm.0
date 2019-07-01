Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2654158wru;
        Mon, 1 Jul 2019 06:27:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzc36fl+t3TiPHkUe5vMXg+cUR5mexYa8RFacS0kJOGhRv2kib53pe/YiRctCUnyT2PfdRQ
X-Received: by 2002:a0c:f78d:: with SMTP id s13mr20690914qvn.156.1561987624568;
        Mon, 01 Jul 2019 06:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987624; cv=none;
        d=google.com; s=arc-20160816;
        b=cBu2IEHZKbhGoK24VC8xAApH6uJB64MbsFReX2oUwMxqx+PRM28SJEtYrM6DUPb7NL
         SyMiT+PYYRVxeu9VUdUlWWJXjnOOdwfDrzfA23GGZolWHlSALMzXNUIMBSTkjUc8KNsK
         yShTPW+lY1uWCFq4TUADbPb1aoFe/hcLAUCDebB6M7m8l88LLcoja1RUvQ/Nwm7olITf
         Y9wPGpci/D37o6VJRX/4XPac9VF9xkxTFCoMtot1+PnFFxYn6EYIvzSMx+IIwXQmJ4l1
         7G5veEmuAMhgU7pkO+zhjKAvX+pkCGA5qz2v46YpGW0i2RRVDgvmwwbh0eXTbU6NChC/
         5w5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=okkuM4U7aU9vHuWM9YtJmkYOa0HC6+amBm5uULUJAKE=;
        b=ew2S3D1uZkX1FJ1WiQz4yoimStnzQGMwnxhC/32NhlN+uTj8TX/186Gj3X74KUC6WV
         aKLmJR+lctuTaAYU9PVaAUId24W5s8dAy9hLk6MnQcpw9/BiApoi7TUSYvIELMHuzEME
         ZzVs8//EXjcMMZUNeG5zt3vbmvHch7MOoK3s3V2zKZPWgw0cLY09VXwgoO7ekTzwliBt
         WJMXbsJjaegIDSdJGX/5gk3IaNDpASYlHTTV+am911EBOZudjoWluov26iPUBf2dVawI
         RaIgKTjiuDvvhc7eP8dkxKK279d9stuti3J1F3A7YkrznTn1TwaAldrYOcCmz/OavoI1
         1AMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l12si7597052qtl.231.2019.07.01.06.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC31D2F8BC6;
	Mon,  1 Jul 2019 13:27:03 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F33EE6085B;
	Mon,  1 Jul 2019 13:27:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v3 24/27] target/arm: Do not build pre-ARMv7 cpus when using KVM
Date: Mon,  1 Jul 2019 15:25:13 +0200
Message-Id: <20190701132516.26392-25-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 01 Jul 2019 13:27:03 +0000 (UTC)
X-TUID: ItM2Zd3zXvFW

A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.

If KVM is not enabled, they are enabled by default.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Sadly this does not work with --enable-tcg --enable-kvm dual config.
---
 default-configs/arm-softmmu.mak | 33 ++++++++++++++++-----------------
 hw/arm/Kconfig                  | 26 ++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 1f2e0e7fde..081d507c87 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -9,34 +9,33 @@ CONFIG_ARM_V7M=y
 CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
-CONFIG_HIGHBANK=y
-CONFIG_INTEGRATOR=y
 CONFIG_FSL_IMX31=y
-CONFIG_MUSICPAL=y
 CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
-CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
-CONFIG_VERSATILE=y
 CONFIG_VEXPRESS=y
 CONFIG_ZYNQ=y
-CONFIG_MAINSTONE=y
-CONFIG_GUMSTIX=y
-CONFIG_SPITZ=y
-CONFIG_TOSA=y
-CONFIG_Z2=y
-CONFIG_COLLIE=y
-CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
-CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
-CONFIG_MICROBIT=y
-CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
+#CONFIG_CHEETAH=y
+#CONFIG_SX1=y
+#CONFIG_DIGIC=y
+#CONFIG_INTEGRATOR=y
+#CONFIG_MUSICPAL=y
+#CONFIG_MAINSTONE=y
+#CONFIG_GUMSTIX=y
+#CONFIG_SPITZ=y
+#CONFIG_TOSA=y
+#CONFIG_COLLIE=y
+#CONFIG_VERSATILE=y
+#CONFIG_FSL_IMX25=y
+#CONFIG_ASPEED_SOC=y
+#CONFIG_NSERIES=y
+#CONFIG_HIGHBANK=n
+#CONFIG_MICROBIT=n
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9aced9d54d..9320509979 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,3 +1,18 @@
+config ARM_V4
+    default y
+    depends on !KVM
+    bool
+
+config ARM_V5
+    default y
+    depends on !KVM
+    bool
+
+config ARM_V6
+    default y
+    depends on !KVM
+    bool
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -23,6 +38,7 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    select ARM_V4
     select OMAP
     select TSC210X
 
@@ -32,6 +48,7 @@ config CUBIEBOARD
 
 config DIGIC
     bool
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
 
@@ -61,6 +78,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -84,6 +102,7 @@ config MUSCA
 
 config MUSICPAL
     bool
+    select ARM_V5
     select BITBANG_I2C
     select MARVELL_88W8618
     select PTIMER
@@ -97,6 +116,7 @@ config NETDUINO2
 
 config NSERIES
     bool
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -119,6 +139,7 @@ config OMAP
 
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -215,10 +236,12 @@ config COLLIE
 
 config SX1
     bool
+    select ARM_V4
     select OMAP
 
 config VERSATILE
     bool
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -307,6 +330,7 @@ config XLNX_VERSAL
 
 config FSL_IMX25
     bool
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -314,6 +338,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -329,6 +354,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
-- 
2.20.1
