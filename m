Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004254wru;
        Mon, 1 Jul 2019 12:50:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzR5EDZKDEH0vPHZCaQ40EGlrJ1vraToWOOsfNulsnKj2hdyexNgr0YbIXYHOUfky5qVGJ3
X-Received: by 2002:ac8:17f7:: with SMTP id r52mr22044472qtk.235.1562010618570;
        Mon, 01 Jul 2019 12:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010618; cv=none;
        d=google.com; s=arc-20160816;
        b=xbkCtQhH52hZaYw6Ay7X1GIiqrFsoZWEAlKmMyQJkiu9BZoL2cHQOx2xQAo2HKdgQ0
         JIKwbV5Gj+etVAuCkS86mcBtKV/CdNshu8ZwHH4nbTFXsxid3is1kkgSfq9I0UEMH4W0
         uerZKZ0snwA+mWcNXv3GrqitoE52fU5t2emnC7KWtiKhrKTDwpkbG29xB3NzB0M1AwiR
         mk//KU/V4VUVSmWZHbVDPqWrHzOETLtWZyKdjEQxWHtG0/FKRi7iohjKUqRySVcgiWAZ
         ehx79VL3rhZR5mx25Y6qAlTG/iJqiwnUqeLFfMgEJLC4PHnGnxc6dOeTuBywY3JpnWoT
         f8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=CyBe+uc73ts0aSnPB2fGL1N1P7Zgi99m8szdYAdMC+A=;
        b=I5y448Js/XqJURmBBmj1zryCyK0dG/PINEMG1W5IxuxQtEAb3jjH4pGS4GaG5cAvJC
         fO7ui47Lr0DKP4b6MjxSW/EKl9m2hH5Itpse59Rq+kzTEXWamj53BhxSdbh5LnLV/3ua
         ba4qMiaZhmn6iTiuUlff4F0PHXBu36gOVcgiGXfVlCB96hblxwYQZQnaEAP9uBuBYRMo
         ReswhbVH7zq9SNpW1Atr0DvxnQA7regy5A4BP0X9YfdKDScDN8wRjRzG7wJSfv36VGLw
         NZDGajodl8yAIJ2wzCwAG7GtoYyYzV1sFeGqZFckYw6LzzE0bfpq94Cc+DtOT+PGw+Yu
         d9lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a7si8545507qva.0.2019.07.01.12.50.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7BFE3082E72;
	Mon,  1 Jul 2019 19:50:17 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E0D379F;
	Mon,  1 Jul 2019 19:50:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	qemu-arm@nongnu.org,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 5/8] RFC target/arm: Do not build pre-ARMv7 cpus when using KVM
Date: Mon,  1 Jul 2019 21:49:39 +0200
Message-Id: <20190701194942.10092-6-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 01 Jul 2019 19:50:17 +0000 (UTC)
X-TUID: J953nbf0yUas

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
index ab65ecd216..b4d31c6026 100644
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
@@ -229,10 +250,12 @@ config COLLIE
 
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
@@ -321,6 +344,7 @@ config XLNX_VERSAL
 
 config FSL_IMX25
     bool
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -328,6 +352,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -343,6 +368,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
-- 
2.20.1
