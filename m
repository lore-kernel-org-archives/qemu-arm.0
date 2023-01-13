Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp415259ejc;
        Fri, 13 Jan 2023 06:07:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvmmdt/bsZm2RYkXMGPsu3M7ta6/+eQJzSwc/WeYHXK4e9pk4BKAmyuN1RNMZQsgQEnAl3r
X-Received: by 2002:a05:600c:3d0e:b0:3d3:4aa6:4fd0 with SMTP id bh14-20020a05600c3d0e00b003d34aa64fd0mr58844839wmb.6.1673618875983;
        Fri, 13 Jan 2023 06:07:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618875; cv=none;
        d=google.com; s=arc-20160816;
        b=xnKN7HQOcsMvJSkTuPX71QnGWosonoHNVQKq5fpqp9RLK+EAwlALK0am4DHoPOvyTv
         vye4hdwIj0rkw4WVN2yQEOtnUWe6a02WzWsbQU36u57Eshn/PhpffA4QG4q8a41B6Ui/
         SGnXD2jiYn7V7a8WISPfo5gLbnrjV30wCy/FbFuvb0i3x7BpNggT/VXSF4FVaZkwlnZn
         ZATJID55ai9/oxvz5pPBZu2h4UMwlFYlI03oypra6h9NnOxgnjYlMH9TfWMwF7vA/BsS
         t0yQj71m7VetXHt7fIfVazXR2gekwAilU4Q0LU/smorf8bvxRZ9x4oPNnJMcKT0duWx2
         A4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Eo80WvwpSpGkoKAycNySu1m8cyx1tHfNz4apPXAreDk=;
        b=iULKEZbm3VHGYhxKkxGQqCFd02jUd5vpunxaHjpZZtQJg2BGT0ZJ41w23si+RRM5CA
         WNL+uQZ/9udBOkkvOAJzZKDjblMkW1k8SkngBVkPOPwifp0QxhC2IAFGgPbVvAj69M2k
         zSBfSzzKnCCHaxc5sPXW0ckZYC/1nmMsYiLE4Zglt/2FQ0LjgwyXcxXXDd5kA+XK45At
         wSbv94GQNyON11TltA5FLHPI/o65I1ULskI5qFCrCpqQCkEf0v7xEWYQwcxwYgXNsh6r
         FYvEe8jF8/ELw7HwDo0W2lxzoq/ExbN/ZidMpu6x2Cx+9uaUTavL1xHR2HbZu/KdaFNl
         DSGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="aX3/ODBs";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=eNCQ7HNX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id p11-20020a05600c468b00b003d09b0f7d6dsi21461894wmo.121.2023.01.13.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="aX3/ODBs";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=eNCQ7HNX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 904C36069B;
	Fri, 13 Jan 2023 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo80WvwpSpGkoKAycNySu1m8cyx1tHfNz4apPXAreDk=;
	b=aX3/ODBsKvp5lOjaaBPd4BBeVl9acyoCnywICgT6EsGFktQwa3WjaRIPB5FQxlysKpVVo+
	UiWB1LGTlMYd+9u/k+McTRYElFRJ6qsH0c3nk+t7iowJiOJE3wYoAkvMJBEavFIoKh/RW7
	qpBbhYcbPG5Au+qb9Fy2y6lEI/2piwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo80WvwpSpGkoKAycNySu1m8cyx1tHfNz4apPXAreDk=;
	b=eNCQ7HNXYXf8Liip2eiB9vayy4KWDFl2USoCmkCYQHwS0TnYlAlNbuCR0f/kmdAcWW2d40
	49LxD7gnMhlZNJDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 013FD1358A;
	Fri, 13 Jan 2023 14:07:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SJMEL7hlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:52 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v3 28/28] arm/Kconfig: Do not build TCG-only boards on a KVM-only build
Date: Fri, 13 Jan 2023 11:04:19 -0300
Message-Id: <20230113140419.4013-29-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3A/qwk0QS6G/

Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
statements in Kconfig. That way they won't be selected when
CONFIG_TCG=n.

I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
keep the two default.mak files not empty and keep aarch64-default.mak
including arm-default.mak. That way we don't surprise anyone that's
used to altering these files.

With this change we can start building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
sbsa-ref has an explicit check to avoid running with KVM
xlnx-versal-virt has avocado tests tagged with tcg
---
 configs/devices/aarch64-softmmu/default.mak |  4 ---
 configs/devices/arm-softmmu/default.mak     | 36 -------------------
 hw/arm/Kconfig                              | 39 +++++++++++++++++++++
 3 files changed, 39 insertions(+), 40 deletions(-)

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
index 24fb5f0366..647fbce88d 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -4,39 +4,3 @@
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
index e6f984fea8..05b11f53dc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,20 +34,24 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG && (ARM || AARCH64)
     select OMAP
     select TSC210X
 
 config CUBIEBOARD
     bool
+    default y if TCG && (ARM || AARCH64)
     select ALLWINNER_A10
 
 config DIGIC
     bool
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
     select PFLASH_CFI02
 
 config EXYNOS4
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select A9MPCORE
     select I2C
@@ -60,6 +64,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -74,6 +79,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG && (ARM || AARCH64)
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -86,12 +92,14 @@ config INTEGRATOR
 
 config MAINSTONE
     bool
+    default y if TCG && (ARM || AARCH64)
     select PXA2XX
     select PFLASH_CFI01
     select SMC91C111
 
 config MUSCA
     bool
+    default y if TCG && (ARM || AARCH64)
     select ARMSSE
     select PL011
     select PL031
@@ -103,6 +111,7 @@ config MARVELL_88W8618
 
 config MUSICPAL
     bool
+    default y if TCG && (ARM || AARCH64)
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -113,14 +122,17 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    default y if TCG && (ARM || AARCH64)
     select STM32F205_SOC
 
 config NETDUINOPLUS2
     bool
+    default y if TCG && (ARM || AARCH64)
     select STM32F405_SOC
 
 config NSERIES
     bool
+    default y if TCG && (ARM || AARCH64)
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -153,12 +165,14 @@ config PXA2XX
 
 config GUMSTIX
     bool
+    default y if TCG && (ARM || AARCH64)
     select PFLASH_CFI01
     select SMC91C111
     select PXA2XX
 
 config TOSA
     bool
+    default y if TCG && (ARM || AARCH64)
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
@@ -166,6 +180,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG && (ARM || AARCH64)
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -178,6 +193,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG && (ARM || AARCH64)
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -185,6 +201,7 @@ config Z2
 
 config REALVIEW
     bool
+    default y if TCG && (ARM || AARCH64)
     imply PCI_DEVICES
     imply PCI_TESTDEV
     imply I2C_DEVICES
@@ -213,6 +230,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    default y if TCG && AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -228,11 +246,13 @@ config SBSA_REF
 
 config SABRELITE
     bool
+    default y if TCG && (ARM || AARCH64)
     select FSL_IMX6
     select SSI_M25P80
 
 config STELLARIS
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
@@ -250,6 +270,7 @@ config STELLARIS
 
 config STM32VLDISCOVERY
     bool
+    default y if TCG && (ARM || AARCH64)
     select STM32F100_SOC
 
 config STRONGARM
@@ -258,16 +279,19 @@ config STRONGARM
 
 config COLLIE
     bool
+    default y if TCG && (ARM || AARCH64)
     select PFLASH_CFI01
     select ZAURUS  # scoop
     select STRONGARM
 
 config SX1
     bool
+    default y if TCG && (ARM || AARCH64)
     select OMAP
 
 config VERSATILE
     bool
+    default y if TCG && (ARM || AARCH64)
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -279,6 +303,7 @@ config VERSATILE
 
 config VEXPRESS
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select A15MPCORE
     select ARM_MPTIMER
@@ -294,6 +319,7 @@ config VEXPRESS
 
 config ZYNQ
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
@@ -324,6 +350,7 @@ config ALLWINNER_A10
 
 config ALLWINNER_H3
     bool
+    default y if TCG && (ARM || AARCH64)
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select SERIAL
@@ -336,6 +363,7 @@ config ALLWINNER_H3
 
 config RASPI
     bool
+    default y if TCG && (ARM || AARCH64)
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
@@ -366,6 +394,7 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && AARCH64
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -382,6 +411,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    default y if TCG && AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
@@ -395,6 +425,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select ADM1272
     select ARM_GIC
@@ -411,6 +442,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select IMX
     select IMX_FEC
@@ -420,6 +452,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select SERIAL
     select IMX
@@ -440,6 +473,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG && (ARM || AARCH64)
     select DS1338
     select FTGMAC100
     select I2C
@@ -460,6 +494,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select ARMSSE
     select LAN9118
@@ -475,6 +510,7 @@ config MPS2
 
 config FSL_IMX7
     bool
+    default y if TCG && (ARM || AARCH64)
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply I2C_DEVICES
@@ -493,6 +529,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select A15MPCORE
     select IMX
@@ -504,6 +541,7 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG && (ARM || AARCH64)
     select NRF51_SOC
 
 config NRF51_SOC
@@ -515,6 +553,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG && (ARM || AARCH64)
     select MSF2
     select SSI_M25P80
 
-- 
2.35.3
