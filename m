Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317121ejc;
        Tue, 10 Jan 2023 08:45:05 -0800 (PST)
X-Received: by 2002:a05:600c:18a3:b0:3d1:fcac:3c95 with SMTP id x35-20020a05600c18a300b003d1fcac3c95mr50312335wmp.34.1673369105348;
        Tue, 10 Jan 2023 08:45:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369105; cv=none;
        d=google.com; s=arc-20160816;
        b=KCa76l5RowEitAjWy5iaIYOxm5F7W2bYL+emnbCp7kL2vMb5kRl1Xcm7FmiTIE4ZdZ
         tfFDkMNJWyoxLb3LV2JwihCzF+T06oLdqbRChFkAHMD5VqO+CXQ7TpHFvtB+kp5BYG14
         0fcjiFGtyCAdTaDnqV8DOYn0mpuEu4b/ilOFVu7f/0Kk8uMiRGQMLRDgK9xVq0KpLYy7
         lnIzZ21auru9ZUEZM0o2FYfNtydd1lZhF4wbl7kF6lNh0eX2UaqOsBUCX2pLRw79oo7w
         epfv6IStFOTPR/jTn5fl+/jYObgdiGNSArStbE125Dk2owwnDM+6G1nnLOGCjnfKq7N+
         /wiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Fiw9Fg+p/b/j5dB2Y7ot3w6ih2sYibESUE4ugSZG2HU=;
        b=AR+Hs+G7n1rU3zBp3ZMZIlSKDfrmaf7x/oD1G7yrd4flrPx4AvnKbzbqe7YDaTyqY7
         ye2afBNVAYxXFlCRCI5UfjpRCrIkOmgZjG8SvjgmFkvn6gtKDdiPulxh7vnRNv/JBCNR
         XEHesQaAquaETAps2iR+aR4Uv0DId1X2KQstzG0KbXU4hPaZUa6fXU5xCC4EbU2pEHgI
         mudsUg4tl4BKxgQejr9NbcMc8R93pxkTjUOVMSv3TjzIDapjnFwH3EUPP2Pdz851Ceu2
         QzYEGLiGf1no1/4+0y0ApATfxybRRm77T3xtBx/suZFaj5EkeONonp3XVgEe/t7SW99/
         D0lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lvZKso0O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y23-20020a7bcd97000000b003d9e80e6b8bsor2694581wmj.9.2023.01.10.08.45.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lvZKso0O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fiw9Fg+p/b/j5dB2Y7ot3w6ih2sYibESUE4ugSZG2HU=;
        b=lvZKso0OLD7UZt4Kw7hqdjQaaufZBzyBplHVmkt+ENOOdpiKkwLSjVIrZlRRUPTZF6
         bVX3qVsWXkf0WwVDDTpu/vmk0+Hij015K8suDYMuUNoX96QrUiUh91DCqrhW7gzG9k0f
         9XA2JkWzVt3m0tVD2Sd5jiw7/5F5536EoR7Q+lvIFfLMT82eJCOsFXI0fcBGNOsxkm2c
         1P77PtWvcml6hphMeTJ+P+prMGYBLwu64ayohuY8IMWqQ7CmGnVtjx5rPteoiyRXIz+N
         ze0b9gldvJBSBwZT2ejGnsJ5JZbvneywEOco7/e8TCh3LmawC+5n6Kzl1tUR1G/70dtx
         I7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fiw9Fg+p/b/j5dB2Y7ot3w6ih2sYibESUE4ugSZG2HU=;
        b=12jgyELbh3gNePpbvzMgJlwKYgYjSX8CO1SqCOL+sOcJGz2ie0EhHxiHUz50/yt9qV
         JTZH3pRMSnRre6pbCXK0equWZWkpoeOgShF94zRIjy0qhjDfWDGYlR78/Jie2DYKFpj+
         LZJSwKsXIM0whrWFCcnBZ5P89Tb7vCuLzrb9KZ4dHMy1eShAwoY7iG4+as/AWfASaqC5
         ON5ITy/O3fov8Y4W1ti6woWeJsCLF71e6/pPnTPXy5Gwos4KqdV/PXcJRyfso4ZqGWvS
         eWgaUWCwFBLXzzYZvXJBpkCueY2ZkH2b1pryxlLQYosydhVjvat4sWqGkwwaCJppgbsw
         Hz3A==
X-Gm-Message-State: AFqh2kp2NZC2hLatnkoQ41GteXbIK3Vl9oA9XjHOlBeqwERpd6u+PtJ5
	4VTSiLRaoXqU4W3LAxyzTPNbaQaP
X-Google-Smtp-Source: AMrXdXv4D9QWe1vkSRV3vbBOYq0Xr/Hb+KwQ050qlpMvVl9ekaO9o+6aVPmoVHLS+R93ZzPoVNmCRA==
X-Received: by 2002:a05:600c:5006:b0:3d2:3eda:dd1 with SMTP id n6-20020a05600c500600b003d23eda0dd1mr50317185wmr.17.1673369105106;
        Tue, 10 Jan 2023 08:45:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b003c21ba7d7d6sm16729392wmn.44.2023.01.10.08.45.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 10/18] hw/arm: Move various armv7m-related units to softmmu_ss[]
Date: Tue, 10 Jan 2023 17:43:58 +0100
Message-Id: <20230110164406.94366-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hXNrQFRXkVRj

In the previous commit we remove the indirect dependency on
"target/arm/cpu.h" from all these ARMv7-M units:

 - armsse.c
 - msf2-som.c
 - microbit.c
 - mps2-tz.c
 - mps2.c
 - msf2-soc.c
 - musca.c
 - netduino2.c
 - netduinoplus2.c
 - nrf51_soc.c
 - stellaris.c
 - stm32f100_soc.c
 - stm32f205_soc.c
 - stm32f405_soc.c
 - stm32vldiscovery.c

We can now move them to meson's softmmu_ss[] source set to
buid them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/meson.build | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index f742107847..f7e1d4add6 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
@@ -11,8 +10,6 @@ arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
-arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
-arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
@@ -26,9 +23,6 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
-arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
-arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
-arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
@@ -40,27 +34,36 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
   'fby35.c'))
-arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
-arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
-arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
-arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
-arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 softmmu_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
+softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
 softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
+softmmu_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
+softmmu_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
+softmmu_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
+softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
+softmmu_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
+softmmu_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
+softmmu_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
+softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
 softmmu_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
+softmmu_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
+softmmu_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 softmmu_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 softmmu_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
-- 
2.38.1
