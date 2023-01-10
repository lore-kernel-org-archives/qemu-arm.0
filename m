Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316508ejc;
        Tue, 10 Jan 2023 08:44:16 -0800 (PST)
X-Received: by 2002:a05:600c:250:b0:3d2:2830:b8bb with SMTP id 16-20020a05600c025000b003d22830b8bbmr53496671wmj.34.1673369056028;
        Tue, 10 Jan 2023 08:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369056; cv=none;
        d=google.com; s=arc-20160816;
        b=MT7poqnIUAz74aVEgJzMEgO0PYJZNceBLTsmgPnrnVEEiIyCwNRyqvbZE2xwVBOtFB
         V2O35bee2+oaEzmJaRGCevrgkUf8XeAbpOlTRgx8vtpv4xlUDkgQdYu9FvbnAJX0vsi1
         1r2zqlj0QzIOVQOv8mJo53T1ItqyoQxCMkute0mRnFebI4bzobCd0dTjNi4T0vXFjBuV
         EjbxqAljS0JAcXXOwsd74hpYQd0KNlWU8+21MtKaJlbFVPgjyjI6ecxEU7DBHzEqrirE
         snwSlGC8szNnBDTcpEo++8YLHmtLk6RezaJ4Q0UIQReQ21Du5b1NvuLxLIwS77iTYbr2
         C1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u1UvOGw1kKWk2oCncOSRw+9G4LoKd5mu7gj6ezPK4v8=;
        b=GA7XUQwYWh7+av7Gr0w//rwoDOtT2A2opkLwy9Gm60TZXC5StF0tqMFffmpi/ERfze
         dqsMEbsIUAfyX/UzpZGWQIEi7+phb1xBRDGnOEkL3WjnIZz0NxMA2uej9mZZHSmKaEwQ
         7TXutHVlpMyEsnf4O2zynFF8p9h0QXLzVHeGMV0YRUqQUeakt2uchtbHPx1X/X/SEUmE
         EOGkYrDiPDU9QUR7c8o6oWrbOwW0I5KYTO/eCPvcybsKaiRE0kRT3yLO9TwRZzcj2McV
         3j9O7NNdClhwYoGkVfw0jUUK+usC6Bvz74AFcIIMlyBVM4VJr6XJT5MN1eF5sPVIOF1p
         jnzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KP7J3iaA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 24-20020a05600c025800b003d58a803c14sor4843030wmj.16.2023.01.10.08.44.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KP7J3iaA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1UvOGw1kKWk2oCncOSRw+9G4LoKd5mu7gj6ezPK4v8=;
        b=KP7J3iaAZ3p0trPjScaTftxGfKhSe3lCN9IT9MhIY8TwBgmm0j3PkUVDpDYA83Az9C
         ZVMWvpyOxZ5JA+qZFXie+kpd6fdZAGLr9QBoG7oOwZculXwRIiidGh9dVLE8imGtpE1y
         c0ch2FBpHvUgS+RrHwg18uABHPD3jDbkz2Unve3EG+J+rpAB/dLThXazNSQYM/deX4sb
         IMvJpqhxkK3739pRbnj1vUk1GhPIHYeXcQsRmtb61gYUR9E5/DT88Zk7e50STVMpMClu
         DqgDUQSwn0BaMsYjsUPAoyylAN2861l9tl2cG3FliPIk5KRiCcNMcPkCvJniFXFcH7Nq
         +PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1UvOGw1kKWk2oCncOSRw+9G4LoKd5mu7gj6ezPK4v8=;
        b=yB9ThkbUERpqtu8ETFVrIHjtH1S5sOLQaaMlt3QaMbWNVJ5FWKYKoiQ7WhauSGbjrX
         +eDG4jrxKmCTTFVY+Ye29l6kbhhelM585IsuRPgbTxKnsgGPfUPzxQvxMgVMA4NMtWku
         cMcgMp1FwDlb5BRTJix30HnKpZIurcaeD4UnT7FWtO8L+dS83wBtUK72mC4a5hsmTs9K
         mdIdx5rOFjkrM2MUYMdEcq+6JBnoQ5aG2ewvIqbzFmnaEO3eGmg9/6Mj9+elvE7mQy02
         Yj+3k5KKSJWz0VT8/KwOAaAJR3m8RG+wbLlRfOP4mq9uMhdqXWfNPQlQ96emtbMQAG/z
         Iv8A==
X-Gm-Message-State: AFqh2kqbXrTMhLTC6xT0gvi5sO7ajkHDp1++DykBkmi2Fxi2PbHnkuTj
	LqVzdJGj1PzwIXAbhIt2YADsBRnM
X-Google-Smtp-Source: AMrXdXvlBoUOdr5EfS8TQt3sesEyVfOB/xKMY7//PfxQmHhSph4uj7MyrMBbC0klpR7YULE5lbpzRg==
X-Received: by 2002:a1c:7c14:0:b0:3d1:f74d:4f60 with SMTP id x20-20020a1c7c14000000b003d1f74d4f60mr53524556wmc.22.1673369055791;
        Tue, 10 Jan 2023 08:44:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c6b70a4d69sm17665984wmq.42.2023.01.10.08.44.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:15 -0800 (PST)
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
Subject: [PATCH 01/18] hw/arm: Move various units to softmmu_ss[]
Date: Tue, 10 Jan 2023 17:43:49 +0100
Message-Id: <20230110164406.94366-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fQt7fjeGvYwi

arm_ss[] units are built twice: once for 32-bit word size and
once for 64-bit. The following units don't require any word
size knowledge and can be moved to softmmu_ss[] (where they
are built once):

 - smmu-common.c
 - exynos4_boards.c
 - bcm2835_peripherals.c
 - tosa.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 92f9f6e000..4babaa8dfc 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
@@ -18,7 +17,6 @@ arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
-arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
@@ -38,7 +36,7 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
-arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
@@ -59,8 +57,13 @@ arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
 arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
+arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
+softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+
 hw_arch += {'arm': arm_ss}
-- 
2.38.1
