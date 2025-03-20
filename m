Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279163njc;
        Thu, 20 Mar 2025 15:30:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7X79V/FRxs5mfrNkTlFXkwA5cZH2xKhwReWZHdzz+gQao8yuL92NsPln5wv4PtsPJB7ztuNhUJwPcrQ==@linaro.org
X-Received: by 2002:a17:902:fc4b:b0:224:6a7:a5b0 with SMTP id d9443c01a7336-22780c67af3mr17509125ad.2.1742509841132;
        Thu, 20 Mar 2025 15:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509841; cv=none;
        d=google.com; s=arc-20240605;
        b=N6kjDeWXhdGjsV0evkZvRm+EooifyeQbsuuJR9eBeGhevpmKOxiiRoxFfPyLZh20dR
         Ssxxu0iDojx67aTYoDSUWt04f+weHzEnjR8hDqHOIYxR4hO1Oi48qZ2snj8IwFEzcocu
         JNkkBek7CxNuFa5NiRrqR2Oncg39xutdmxp5qdUBh47DJtEPKDCR2E7B1m2Ed9bF8qeA
         z0SG5biN3hN/Ulcv2TZNTTw71rut6JbFvfKH/fXutoH6umeFClRIMN6ifxr6k41AN3s3
         BDw24oD4c1K/BIaSQXxj3T+7RyDAKz9C3iRwzlqPZkt1C5ltsjGJiAM5U56lnYPz6NvD
         fgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yn2Xz9RB0NXRkBKqvuaaiEm9yg8jr17YbtEabY7lMZc=;
        fh=DovJjns68yzEzqwb2QKgbM8U6RbAn9sbfh3yKVZGADM=;
        b=AxVCRomk2ON75M8DN9fmD8BxBNwSfF0DLJSU3lqMNkl1c1Up/mhPynaD8FqTS8fi7c
         cAXvt5I6iY0C36msPfP3vPv85k3Udy5OOZ4jIGdbNw4mDkaIgFWhkWnbISs58dTsklv6
         ncSEXwq7SBCms9uY3o0b/yJfQbgTUpVtpARd2P7sYbPZoilFGgOdTe6+TdN1+HEGfrYg
         j6fv4Ic1DYkTZAMFZmGyuOeewe6jjimbN6jzr6wRht8GLkrqt2n+NawlXHYmL6wNGd85
         o+M5ZIWwJ20rg3JAeiIdl3/IQk0bnwdoKe4lqdfBKmn/PMvxGEfcr8BdMKmnmYSq8OAw
         UHeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y+ANrboh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f655e0sor4002635ad.9.2025.03.20.15.30.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y+ANrboh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509841; x=1743114641; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn2Xz9RB0NXRkBKqvuaaiEm9yg8jr17YbtEabY7lMZc=;
        b=Y+ANrboh9R7pyNTMIagRr41EPvgpNufq4p7hjSKvMsHN+1w5HoZddm0qNdq3YoNK5O
         qmbDrezDFqzfTT0S+IaxM+PAi0ialdTUwC3GFTWKJa9HI39uoAv+TeEGmpGFvKe2maQe
         tLikWZB9lWlAER/vh2uYdk6Z9H9JwPtp3I1E216EcS6+VliTnWC3zHpPtaDu2EvWdBvs
         ZERoA6cPLaRtflJUCkFdJzqcjERAA6jvcjiXwMXu0h0HAS9C9wwT6uTH2QlIG6XkWIC1
         j5/xBrlk/x2+fwTNLJ4UePUWxBSs61GijmApIxaBjXEeAYkHWRlW9NLTFmuMWPFB/XXI
         RZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509841; x=1743114641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn2Xz9RB0NXRkBKqvuaaiEm9yg8jr17YbtEabY7lMZc=;
        b=AwMmoGdnq1oHbxh1DKjVGW/nRXJZ1vQnZRzT4qaBM1UL89QNCSgDM482q9Nb4OGmWu
         3NgzvOWZiQ26LTj4VV+hCqEmv4E6gwwGcyynvjM2YVii4Udi+IR0GhS7glocSwe/vcaZ
         yXtRtHjfNjzCc3uNfRfO4MaaGi4/ovZjdv04nvCU0TEC5JnyiRwytMxZgF1JCOWcsOoq
         rJsg9XxnH1av7KUq49akiluqgZ93L3KQJVuTDZIaYQHwG3STw1wEZresGjE9kYs5eHaZ
         DnzFp8OkNkwHqqT+OiJ00YhhZ4cVSKuQmzTzj1MQbdXRbxPUabCwAXkPm0R1al5GJHUf
         qGog==
X-Forwarded-Encrypted: i=1; AJvYcCWaI5DLNfizH560xhWl2ljak4QngVOL68tyxHNbc+AyBZV/SFvPQYuZA/2b4Aek8SiaqzpLhViNDtjoFQ==@linaro.org
X-Gm-Message-State: AOJu0YwK1eys7G3l+3rf5XISLpPvhgVrihrsRLWG8kvQaq5N9jlHA8PU
	iO4s8XLSbY121vcT3AZbq+KdHX6SvCWhy9F/nnqRYU0lkJzsWku9z1bCceC+kidySQ==
X-Gm-Gg: ASbGncsp6cNSCMTrj76WJBx7ybuR7jSkrU/mj6TerM1TEn9AhDQHbVa5qin20PLiEid
	KrMpS4bDsQe/vOlP/hGHscrru7xZKR53E0wgFL1zVQ1e+8JC3cx6qvGWm9ju2vaL0WJdxRZEDuK
	r2h+JVeE19FnHBp8Ic8yW73k5006rjVGA8gDVgS64xqTV6WWIwnYAU+joedskXMZ41jiYJMgwAQ
	umWk0nHYyJ94KCu/nQIfgc0JvMwjk8Vt8/qW+N+9WZrZcwC90Qgrc6AOAcpii62BTnjEhEpbjbz
	Vz3BJ5QODWZ/GElq6ibkSSAaytrwoyuzvAcEZaBRcm3l
X-Google-Smtp-Source: AGHT+IEzJbf92WCs5cdn48gdTqOAmHjHUL79CRGln7SjLlFgI+95i4LaCr+ImDqPmlnxNCrWkwC3Xw==
X-Received: by 2002:a17:902:fc4b:b0:226:38ff:1d6a with SMTP id d9443c01a7336-22780c68a1amr17471675ad.7.1742509840610;
        Thu, 20 Mar 2025 15:30:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 30/30] hw/arm: make most of the compilation units common
Date: Thu, 20 Mar 2025 15:30:02 -0700
Message-Id: <20250320223002.2915728-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z1e4DFY5Glfb

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
