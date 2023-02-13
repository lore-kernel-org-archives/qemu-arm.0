Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547677ejb;
        Mon, 13 Feb 2023 12:33:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+sTw4N/RhZJ8u9OKzBWjsBv5hGuYt0yz6/qJSjMZjeZInsFg+VPSNMA7nAJ09NhB4zPsAE
X-Received: by 2002:a17:906:6dd0:b0:871:dd2:4af0 with SMTP id j16-20020a1709066dd000b008710dd24af0mr265375ejt.26.1676320394520;
        Mon, 13 Feb 2023 12:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320394; cv=none;
        d=google.com; s=arc-20160816;
        b=jhFx03QoaLojlbDsZLi4Pcz/hZBLMawrfCAFhypxzoVY7gBTG3DYa7mqCKjy6ObHJv
         rWeHDZeUyCmzJ2dnZ84LXI4LnElGEiW5HDqiv9q+AV0iGEOgT6ZaZz0rnK0iWM72oww7
         BOF9cuYdD9aA7bqotjQZHEwRa5SQ+ujChiNlq4bq6sOmdpMoSqRnrOZgeoiVMcHZ7taK
         HLNTbd1/R/yeG63w9cgZLSgi9WIYd4RDgoVw8Tz+jb+8DH81tYULDh7ZV17qa6benSJP
         z28ke7isU6621hxyHHQRenahjb/jtDI0Tn4xYBSOYpZ580GraLjoLyBLvNHDJ//JwQYa
         ouVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=YIowCmxbHxXeVAEhqVkO1q0sUJtBxgGctcKSEdh6l2I=;
        b=aePLsvP0vi3NPKziuGpHawmAGcv183YQpAoH6iyVE5scnzXZ3p5rSd9qNGu6/TA6yY
         pfGmCwbxhYLUHXLVc7jqDKczlZN9C2Dy+rNuTasyma6pgXbxAcmAMvVoOh8xWrE5hxqk
         dEY+swZLCqYa3g9blPFlf8Xn9ey3cx6oG/H+fswZzmFYs/WwP+KuVSicm0vt55FsE8lQ
         9/QdUpnFUqAgJw7+OsoCVobDHAAAtWrv4gLHmBM7CjDAocqWCv+SflJV2nw9ccGsGH2b
         lqmAboeUY4ZP5C7nEdLMrm3pvPofJolU8qruL32TgEKrua3TeG1A0lIXkXue/RJXHtUo
         7Omw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TmQcM28d;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=k8fqN6UG;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id uh38-20020a170906b3a600b00886b18c2fa5si13778182ejc.793.2023.02.13.12.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:33:14 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TmQcM28d;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=k8fqN6UG;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 272C020288;
	Mon, 13 Feb 2023 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIowCmxbHxXeVAEhqVkO1q0sUJtBxgGctcKSEdh6l2I=;
	b=TmQcM28dy//ldGp3S2D5ywvofZPH9zJJ1YlIGshIWcCUsRFpweZCG8ZBJf6aQlJ8FDWZ9x
	rs/0siN+KDo5pyVpQxA0/ae3RUDf2eLr+fcci8Z0GKo/de+CKa/qZtF3bK5OT8jImyjs6d
	c0jBGGsVDqtI/sol+rdquR1VpHMuWmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIowCmxbHxXeVAEhqVkO1q0sUJtBxgGctcKSEdh6l2I=;
	b=k8fqN6UGMxKkoqqhLuwo7Tmu8g5Til2NcezeKYPtUEoF9j1vmgL0K3+OS9DeUAoKOmoY/8
	lyQH5sk1bIIWHNBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 198611391B;
	Mon, 13 Feb 2023 20:33:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0DkNNIae6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:33:10 +0000
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
Subject: [PATCH RESEND v5 27/28] arm/Kconfig: Do not build TCG-only boards on a KVM-only build
Date: Mon, 13 Feb 2023 17:29:26 -0300
Message-Id: <20230213202927.28992-28-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KrhMhgBgTHV3

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
index ef518c1f1d..a25046848a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,20 +34,24 @@ config ARM_VIRT
 
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
@@ -60,6 +64,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -74,6 +79,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG && ARM
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -86,12 +92,14 @@ config INTEGRATOR
 
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
@@ -103,6 +111,7 @@ config MARVELL_88W8618
 
 config MUSICPAL
     bool
+    default y if TCG && ARM
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -113,18 +122,22 @@ config MUSICPAL
 
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
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -157,12 +170,14 @@ config PXA2XX
 
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
@@ -170,6 +185,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG && ARM
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -182,6 +198,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -189,6 +206,7 @@ config Z2
 
 config REALVIEW
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply PCI_TESTDEV
     imply I2C_DEVICES
@@ -217,6 +235,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    default y if TCG && AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -232,11 +251,13 @@ config SBSA_REF
 
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
@@ -254,6 +275,7 @@ config STELLARIS
 
 config STM32VLDISCOVERY
     bool
+    default y if TCG && ARM
     select STM32F100_SOC
 
 config STRONGARM
@@ -262,16 +284,19 @@ config STRONGARM
 
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
@@ -283,6 +308,7 @@ config VERSATILE
 
 config VEXPRESS
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select ARM_MPTIMER
@@ -298,6 +324,7 @@ config VEXPRESS
 
 config ZYNQ
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
@@ -314,7 +341,7 @@ config ZYNQ
 config ARM_V7M
     bool
     # currently v7M must be included in a TCG build due to translate.c
-    default y if TCG && (ARM || AARCH64)
+    default y if TCG && ARM
     select PTIMER
 
 config ALLWINNER_A10
@@ -332,6 +359,7 @@ config ALLWINNER_A10
 
 config ALLWINNER_H3
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select ALLWINNER_I2C
@@ -345,6 +373,7 @@ config ALLWINNER_H3
 
 config RASPI
     bool
+    default y if TCG && ARM
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
@@ -375,6 +404,7 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && AARCH64
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -391,6 +421,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    default y if TCG && AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
@@ -404,6 +435,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select ADM1272
     select ARM_GIC
@@ -420,6 +452,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select IMX
     select IMX_FEC
@@ -429,6 +462,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select SERIAL
     select IMX
@@ -449,6 +483,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG && ARM
     select DS1338
     select FTGMAC100
     select I2C
@@ -469,6 +504,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select ARMSSE
     select LAN9118
@@ -484,6 +520,7 @@ config MPS2
 
 config FSL_IMX7
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply I2C_DEVICES
@@ -502,6 +539,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select A15MPCORE
     select IMX
@@ -513,6 +551,7 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG && ARM
     select NRF51_SOC
 
 config NRF51_SOC
@@ -524,6 +563,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG && ARM
     select MSF2
     select SSI_M25P80
 
-- 
2.35.3
