Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397182njc;
        Mon, 24 Mar 2025 21:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUuWtUuMNwIk0Ks01ypZFGsePO+ft/w2YDv9a6e+q23WiOhNpKzrxLSWsIF8PtG9W5LPLTfZ1soO7u/g==@linaro.org
X-Received: by 2002:a05:6a21:6e03:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-1fe434371cfmr29660851637.38.1742878789681;
        Mon, 24 Mar 2025 21:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878789; cv=none;
        d=google.com; s=arc-20240605;
        b=BY3DP7gHIMeb8b2zBZfBTKGAKQe27xQUVtPIwbLwzJxLucLwKCOJ95h/fv1e9uLXq2
         5Cv/FJd6NDN2uc7rBVsKh3WxqJ2qzcQtKe0gURNDYtDeykrAYuUG0ba6BiZHQZkjGaTV
         YScZUU5X4PQVW7ZKBRiYtD7KSnzP5Y1JoFIkRa2nCy7X76bPR3Svx6tobyo3MuroJVmz
         cZyn3CtWil6STgCVDsogb/x2ex+8GNmHOocgeBhRuAOW7p2iq8IypD+B6i+QNskyrsR4
         nbAhF8od0+JVGKUHg93A9AYg/6PEkuleCQ1MhJLtJFvSqJBZmyJDIYcH6v+/7GI00fRN
         nuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E5iaiuFfQwHaUV+YhyGFcKHMq0HGbFMqwt0CSvqtQT8=;
        fh=NTpO+8N5iIBhcHMeqNndykSqWPP6Ugpvr8mF1iOfBds=;
        b=G1kxOydaRkq0ba2uk472XxITlcHuqVMmaeS2Zw4B9gUOPbMYuOyzsF8CTz/Ls0WGVV
         ZOuDbPYDLOy4ubmc1D10OVD99OdJJvfOdzhDbUNDMa1RVdR085AUqwght+G+SuwIL0hw
         UMvSgzloVpr6y56bmDXmfy8Inky8lFRk3Ww3txnhGsaKLh2ZQcPjUtbb3X2klTFGQrz1
         /KkwAv+R6wqKdkIrsXTLo03KKEDWhPDqIUbkI2xLTeN7MYHGmCDp8hv5/Wxh5+oq0V0v
         2wp3pXQXQ+VD7Ndcg93cvPlkEtG51NqPL4J/AqoJVVz/g3alfpb48R+++OC8zjx2oUcS
         rk4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhD0bVrg;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a27dcc5bsor5201653a12.1.2025.03.24.21.59.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhD0bVrg;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878789; x=1743483589; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5iaiuFfQwHaUV+YhyGFcKHMq0HGbFMqwt0CSvqtQT8=;
        b=QhD0bVrgNFX47fCitPQhOVVBUvQPfa4cgW/eDoyNN/sjx4Od9uPTBLsJ1sYnG89LU4
         47dQPi+UvPS+Bub3ORYBAT24c/A277MyQQbSZM7clU8S1KPkyTIXsLZ20/ENhy6PyANH
         feRA+ovO1QevXGGLguRT5TcsGMvspnffw9ZyMio0vNL6N7Y0oox9h2JT1v4yIWvtiCan
         m+qbA/BlrjG8q7ZQgR/rLpTTvpoXb7XivLt4zB/PXTVlq+9ctLs7Uh6cI2nGjcp82iKn
         DRl2uDOMghjx080XM4S8mrQsuyu/QzZVvkr3FkWYu7uSjLnW0b8IBdMsuObQgYYUGiM7
         lyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878789; x=1743483589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5iaiuFfQwHaUV+YhyGFcKHMq0HGbFMqwt0CSvqtQT8=;
        b=q1ebJTYLsTrKWywoHByHtauBUMyCE2pTa3WFi7/SlnNWdq2Ts+sI9Hm3Gm61wV2lO3
         wUP1DZWfMNrDIHU21BYdZ9qHgEcWueiUhT8+begzNzjS5NQRxGlJE7m1CtVPaMUzjHfo
         SmKqAKh3BeVIFfQUBnYV36WHSACnkvRBJZNmH+Vfh2qNwHWdG4HgeeROEZ+3b2cKfuSh
         XDNpsFYNy2y2hN5WiWrsq5vFD95G3bCG0MuA+D2CIPFj9+HZV2V1zGuUhsKSI+zgxq4e
         Eu790Z4Ed32jCRw0hHhRklJ3zRhJFroIkzvxgz0poV11S3bkrKTA339VNaxkAON9vnnZ
         dXyA==
X-Forwarded-Encrypted: i=1; AJvYcCVPuDFXDUjmuppf1UzUfHqJ7Sb5dGqelPuSTvPF2GTtXqCMcCV4nfv8KTqCMqTitlP1vMcuD/ZtoMhtvQ==@linaro.org
X-Gm-Message-State: AOJu0Yy9z2cO/+E0sb6BohZyZtIOX7hFMEat2DdRqglQLBXruniDMsta
	s0pfhUb2Mmvbiy7PsTVmKpx5v/ZNorioGmprHsy8eAZ7VsE6Qq7w8Nvnq5oDdGjM1A==
X-Gm-Gg: ASbGncv3jzixZLoOo9Fjv3mcXqN5s46tQ4H8C1uKxGXbblKlt0xfmrZV682lyBOmWBd
	1+rhzs+NpE0sj2Ta2ODFVfPFtHmm/fb1ZKpE075MJwoxFsxg6p+ZNEuuj3T/UIiOje9ZsprtQJi
	DrwSS9+n6kSs+GYtFic2mYMaeZ7J/xU8s2afaGSo5fcJxK0M9nqsyhTkIGFLpA9MpffVhT6Ck+9
	lR/+vpuIfUUPvmamZKbJ1/QpxelodrVhH38GRfUEoNXWIEH4ut3BdWaVZ1I2LuPQYd0lfzH6flA
	adqs2Zi2nhC/mV+achBSKxeerg95xF7GFIhcQbE+Tz3F
X-Google-Smtp-Source: AGHT+IGQpJbiRQAVb3v453plqKLTvvPi+By/fp7ijm5/h9t46fIIypvcmFznZtBz8S0M8ZOkQc/5Dg==
X-Received: by 2002:a17:90b:28cc:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-3030fe93e6emr27765660a91.10.1742878789061;
        Mon, 24 Mar 2025 21:59:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:48 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 29/29] hw/arm: make most of the compilation units common
Date: Mon, 24 Mar 2025 21:59:14 -0700
Message-Id: <20250325045915.994760-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MiJOg6cu/vrC

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/meson.build | 112 ++++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 9e8c96059eb..09b1cfe5b57 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -2,43 +2,43 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
-arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
-arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
-arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
-arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
-arm_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
-arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
-arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
-arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
-arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
-arm_ss.add(when: 'CONFIG_NPCM8XX', if_true: files('npcm8xx.c', 'npcm8xx_boards.c'))
-arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
+arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
+arm_common_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
+arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
+arm_common_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
+arm_common_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
+arm_common_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
+arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, files('musicpal.c')])
+arm_common_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
+arm_common_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
+arm_common_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
+arm_common_ss.add(when: 'CONFIG_NPCM8XX', if_true: files('npcm8xx.c', 'npcm8xx_boards.c'))
+arm_common_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
-arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
-arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
-arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
-arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
+arm_common_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
+arm_common_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
+arm_common_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
+arm_common_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 
-arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
-arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
-arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
-arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
+arm_common_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
+arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
+arm_common_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c'))
+arm_common_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
+arm_common_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
+arm_common_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
-arm_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files('bcm2838.c', 'raspi4b.c'))
-arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
-arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
-arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-arm_ss.add(when: 'CONFIG_B_L475E_IOT01A', if_true: files('b-l475e-iot01a.c'))
-arm_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_soc.c'))
-arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
-arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
+arm_common_ss.add(when: ['CONFIG_RASPI', 'TARGET_AARCH64'], if_true: files('bcm2838.c', 'raspi4b.c'))
+arm_common_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
+arm_common_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
+arm_common_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
+arm_common_ss.add(when: 'CONFIG_B_L475E_IOT01A', if_true: files('b-l475e-iot01a.c'))
+arm_common_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_soc.c'))
+arm_common_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
+arm_common_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_soc_common.c',
@@ -47,33 +47,33 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast10x0.c',
   'aspeed_eeprom.c',
   'fby35.c'))
-arm_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true: files('aspeed_ast27x0.c'))
-arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
-arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
-arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
-arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
-arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true: files('aspeed_ast27x0.c'))
+arm_common_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
+arm_common_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
+arm_common_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
+arm_common_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
+arm_common_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
+arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
+arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
   'xen-pvh.c',
 ))
 
-system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
-system_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
-system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
-system_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
-system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
-system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_peripherals.c'))
-system_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
-system_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
-system_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
-system_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+arm_common_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
+arm_common_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+arm_common_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
+arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+arm_common_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_peripherals.c'))
+arm_common_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
+arm_common_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
+arm_common_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
+arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
 arm_common_ss.add(fdt, files('boot.c'))
 
-- 
2.39.5
