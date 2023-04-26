Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593707ejm;
        Wed, 26 Apr 2023 11:00:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4q1dvEbcEbXoQHb/0CGPyhhZTUAd7HUpBAgReSX9LiGhPP9k1MZAcnCYNnanBODVieFnQG
X-Received: by 2002:a5d:628f:0:b0:2f2:7e53:db65 with SMTP id k15-20020a5d628f000000b002f27e53db65mr2428636wru.7.1682532059523;
        Wed, 26 Apr 2023 11:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532059; cv=none;
        d=google.com; s=arc-20160816;
        b=bQDqKmVyhqkmc6uJBXVZ8rZwPHt5bGlkdS+BVACIn/NWT0fH+XV5dBo+cUUmTNS8Ev
         wTdOaG5xOyukSk2tRu+uu/XGzUxx8JGxRovmCstcE4gcbTh1mVMTWTuMd623n8GXpMAN
         E3YhUsRs1l7CppjmIdqGyWVer/S2d+irL0dAuIs405X/KA4JctgHzvmtO+kpVlNG5ZIn
         UM4tjKL0f+dOEWHHIDprVmGcHx0bpyejgLYn4A51//RSio9O2+6HLWBUg+SURNb9pKBy
         ojsdgUMSOU0dPFAkos3r+5lXsXkxs/w9RmrsRlDbv5lW+K6wd0dGEVm3bMgjAYv/NooI
         p8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=HD2ecx5yyka4Z1D4uVx+9EG3enJm/kXtm9b86/tTU1g=;
        b=zGV+GN20RexfGWz44Qdb2VWoLg1HLn01OGZHmBGw2hYWHUqvsnw7JKDHOOIfeTNZJw
         yp9HwxVSosGsNuFHwTfo3YEXOzOLJtgLfyHnPdZOivhjanEBgzfQmEGhYCtDqja4HaVD
         j7JsSBGmM/YT60dIPkfSif2M0DqiUahcImUq43VnrfeufU8HTUUROMW/GTd0JexZ/9f1
         tzjMPGx9JQwMQ3ErexFIjMe+Gg6cWb53wDdq5oTDjwmQuU6LKRHGfJbi4SPo8FRVxgYR
         IWpFw4dXi9CQ8qoVqIekfMESHIU5yqtWbSXyvBiDTJ9R0SqFvjAhQ7X22UCp5YC91vw1
         6yzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JXHnuaYH;
       dkim=neutral (no key) header.i=@suse.de header.b="ORFmOg/S";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id j2-20020a5d5642000000b0030475caf04fsi5103952wrw.913.2023.04.26.11.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JXHnuaYH;
       dkim=neutral (no key) header.i=@suse.de header.b="ORFmOg/S";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D33D21A19;
	Wed, 26 Apr 2023 18:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HD2ecx5yyka4Z1D4uVx+9EG3enJm/kXtm9b86/tTU1g=;
	b=JXHnuaYHZyrEv4RwJSVctRLQ++Ioc1odJx0dwbEo0PyBJWBhmheWAohut38eA7M6KGUqNE
	oxkqeNLKDTJYADM6Dxs/YMkyNNggvbrIESVu7KEsrQmcVM2K9gptoN/u4840s5wYAZeuYZ
	VHDI9vkWYWDu14a0X7QG/2rgDKAPPUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HD2ecx5yyka4Z1D4uVx+9EG3enJm/kXtm9b86/tTU1g=;
	b=ORFmOg/SOBfr51wnuc8hpaK07MLIj1nU47uXSleYGsTu4VshpcZHiNpB4Q6/zSLzmAi2Yl
	FSynB2oz/+FvD6Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4F79138F0;
	Wed, 26 Apr 2023 18:00:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EDUsG9dmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v11 11/13] arm/Kconfig: Do not build TCG-only boards on a KVM-only build
Date: Wed, 26 Apr 2023 15:00:11 -0300
Message-Id: <20230426180013.14814-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HfBk3VAsP+LZ

Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
statements in Kconfig. That way they won't be selected when
CONFIG_TCG=n.

I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
keep the two default.mak files not empty and keep aarch64-default.mak
including arm-default.mak. That way we don't surprise anyone that's
used to altering these files.

With this change we can start building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/aarch64-softmmu/default.mak |  4 --
 configs/devices/arm-softmmu/default.mak     | 37 ------------------
 hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
 3 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da1..70e05a197d 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -2,7 +2,3 @@
 
 # We support all the 32 bit boards so need all their config
 include ../arm-softmmu/default.mak
-
-CONFIG_XLNX_ZYNQMP_ARM=y
-CONFIG_XLNX_VERSAL=y
-CONFIG_SBSA_REF=y
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index cb3e5aea65..647fbce88d 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -4,40 +4,3 @@
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
-CONFIG_CUBIEBOARD=y
-CONFIG_EXYNOS4=y
-CONFIG_HIGHBANK=y
-CONFIG_INTEGRATOR=y
-CONFIG_FSL_IMX31=y
-CONFIG_MUSICPAL=y
-CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
-CONFIG_NSERIES=y
-CONFIG_STELLARIS=y
-CONFIG_STM32VLDISCOVERY=y
-CONFIG_REALVIEW=y
-CONFIG_VERSATILE=y
-CONFIG_VEXPRESS=y
-CONFIG_ZYNQ=y
-CONFIG_MAINSTONE=y
-CONFIG_GUMSTIX=y
-CONFIG_SPITZ=y
-CONFIG_TOSA=y
-CONFIG_Z2=y
-CONFIG_NPCM7XX=y
-CONFIG_COLLIE=y
-CONFIG_ASPEED_SOC=y
-CONFIG_NETDUINO2=y
-CONFIG_NETDUINOPLUS2=y
-CONFIG_OLIMEX_STM32_H405=y
-CONFIG_MPS2=y
-CONFIG_RASPI=y
-CONFIG_DIGIC=y
-CONFIG_SABRELITE=y
-CONFIG_EMCRAFT_SF2=y
-CONFIG_MICROBIT=y
-CONFIG_FSL_IMX25=y
-CONFIG_FSL_IMX7=y
-CONFIG_FSL_IMX6UL=y
-CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 87c1a29c91..2d7c457955 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -35,20 +35,24 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG && ARM
     select OMAP
     select TSC210X
 
 config CUBIEBOARD
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10
 
 config DIGIC
     bool
+    default y if TCG && ARM
     select PTIMER
     select PFLASH_CFI02
 
 config EXYNOS4
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select A9MPCORE
     select I2C
@@ -61,6 +65,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -75,6 +80,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG && ARM
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -87,12 +93,14 @@ config INTEGRATOR
 
 config MAINSTONE
     bool
+    default y if TCG && ARM
     select PXA2XX
     select PFLASH_CFI01
     select SMC91C111
 
 config MUSCA
     bool
+    default y if TCG && ARM
     select ARMSSE
     select PL011
     select PL031
@@ -104,6 +112,7 @@ config MARVELL_88W8618
 
 config MUSICPAL
     bool
+    default y if TCG && ARM
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -114,18 +123,22 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    default y if TCG && ARM
     select STM32F205_SOC
 
 config NETDUINOPLUS2
     bool
+    default y if TCG && ARM
     select STM32F405_SOC
 
 config OLIMEX_STM32_H405
     bool
+    default y if TCG && ARM
     select STM32F405_SOC
 
 config NSERIES
     bool
+    default y if TCG && ARM
     select OMAP
     select TMP105   # temperature sensor
     select BLIZZARD # LCD/TV controller
@@ -158,12 +171,14 @@ config PXA2XX
 
 config GUMSTIX
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select SMC91C111
     select PXA2XX
 
 config TOSA
     bool
+    default y if TCG && ARM
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
@@ -171,6 +186,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG && ARM
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -183,6 +199,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -190,6 +207,7 @@ config Z2
 
 config REALVIEW
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply PCI_TESTDEV
     imply I2C_DEVICES
@@ -218,6 +236,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    default y if TCG && AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -233,11 +252,13 @@ config SBSA_REF
 
 config SABRELITE
     bool
+    default y if TCG && ARM
     select FSL_IMX6
     select SSI_M25P80
 
 config STELLARIS
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
@@ -255,6 +276,7 @@ config STELLARIS
 
 config STM32VLDISCOVERY
     bool
+    default y if TCG && ARM
     select STM32F100_SOC
 
 config STRONGARM
@@ -263,16 +285,19 @@ config STRONGARM
 
 config COLLIE
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select ZAURUS  # scoop
     select STRONGARM
 
 config SX1
     bool
+    default y if TCG && ARM
     select OMAP
 
 config VERSATILE
     bool
+    default y if TCG && ARM
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -284,6 +309,7 @@ config VERSATILE
 
 config VEXPRESS
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select ARM_MPTIMER
@@ -299,6 +325,7 @@ config VEXPRESS
 
 config ZYNQ
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
@@ -315,7 +342,7 @@ config ZYNQ
 config ARM_V7M
     bool
     # currently v7M must be included in a TCG build due to translate.c
-    default y if TCG && (ARM || AARCH64)
+    default y if TCG && ARM
     select PTIMER
 
 config ALLWINNER_A10
@@ -334,6 +361,7 @@ config ALLWINNER_A10
 
 config ALLWINNER_H3
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select ALLWINNER_I2C
@@ -348,6 +376,7 @@ config ALLWINNER_H3
 
 config RASPI
     bool
+    default y if TCG && ARM
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
@@ -378,6 +407,7 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && AARCH64
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -395,6 +425,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    default y if TCG && AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
@@ -408,6 +439,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select ADM1272
     select ARM_GIC
@@ -424,6 +456,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select IMX
     select IMX_FEC
@@ -433,6 +466,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select SERIAL
     select IMX
@@ -453,6 +487,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG && ARM
     select DS1338
     select FTGMAC100
     select I2C
@@ -473,6 +508,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select ARMSSE
     select LAN9118
@@ -488,6 +524,7 @@ config MPS2
 
 config FSL_IMX7
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply I2C_DEVICES
@@ -506,6 +543,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select A15MPCORE
     select IMX
@@ -517,6 +555,7 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG && ARM
     select NRF51_SOC
 
 config NRF51_SOC
@@ -528,6 +567,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG && ARM
     select MSF2
     select SSI_M25P80
 
-- 
2.35.3
