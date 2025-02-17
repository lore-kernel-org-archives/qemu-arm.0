Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp198599njb;
        Mon, 17 Feb 2025 09:44:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmXJ5tYoTpjrYP1XrymVOIePgYP30s3IIpA6WzsN0BCvD9HrdgE99PfERh8y1rwGLJRQG7I62RaLLiEw==@linaro.org
X-Google-Smtp-Source: AGHT+IHQKbKDUw5wUVh03TJ3v3Ch0tQl//HXMXz/dxpGENgyyQmdUSbJoA1M9/YR46bZ1pw4MpsK
X-Received: by 2002:a05:6300:8005:b0:1ee:b8bc:3d2e with SMTP id adf61e73a8af0-1eeb8be5abdmr4269790637.8.1739814298448;
        Mon, 17 Feb 2025 09:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739814298; cv=none;
        d=google.com; s=arc-20240605;
        b=fIGnaVYgZofS2C5B68x5rr06LU9hww0/d5x4k5OkDmZV/LSMrDElZlgWTVBclNlhx1
         NpZYqSm153YhYTHia5BnTPELq7Bsi/+A4ZaotunV6eH4HeZb5LxQvq62ti9oI3+HUT1Y
         nx9yCFmbi4BdgEfp5t4LWummoO2TYz+m7+biD/dIcQKK6UdyZoRykWkGtGDJsD95cxCF
         QN4zrpPxW5IC3zxSHqktQIEUkqs6uDboWXYFfaU2An0KtR1GZV9WSXQt0VHBooj+ExBY
         AiewLA/WDOHUIBFNiUT3n6+HAJwJrEt3SYLWc9KHhOOCFAfOYeBDOMx04qbnyzaMEZlW
         KFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jlkmcJXNJRvJqOWRHdosUhgNr6JY3gF+XMAN4UhX3OE=;
        fh=hJxCSQ+CQWcFseBW+bzPBfdVRHR3XfGXs1boYcp4qEc=;
        b=du0qTEVveIUmlPij9ibpeohF/HPML2KRWEhQ/5oTyenZRuMvvJN++QmdaTD39EoUG6
         tqFOGjXO71hu7VA4e7Ofkan1AQHEtX3rpm7NDCcOLLS1lmKBIfwfxKhe8e6mlLs/ipqM
         p/mjO9nfF/uO/wLmT1c1Df/a+b6SW1Zlb8hu1TkDJu0jQqgoJSXyE+z11MMCRDxz7JzF
         RFSQaE8JYIZeK8nmOvijqVZUpLEidxJ323qxJ39sXgbC800hoMBLiOMXnelfyA/kHqNI
         A4tgQdwXN528ON2mTetdTBJEZwdV/OAOmA1p5+rcAwTLUTSAay+2HgTswPH/nMWe4SXr
         wntw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b6wYolHB;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-ae06c5fbda3si2786370a12.689.2025.02.17.09.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b6wYolHB;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739814297;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlkmcJXNJRvJqOWRHdosUhgNr6JY3gF+XMAN4UhX3OE=;
	b=b6wYolHBLA+PkgHPOEprelo9DR7/KmC3fjl3J2cvTtS9Cnen2ldEsw+7wnLEYrmBN0xCQC
	qWdAdSXNwMMW8V5SYt7rlD3MdS3pdskpSbGvrZqHu2a7jGjkxgVpyHjd3BjCETYxHdfRxF
	pf/+I4H9h5z1OFjr6ongy2iPO8y+/dc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-0TAqFdepPgmts23bY9wJKA-1; Mon, 17 Feb 2025 12:44:55 -0500
X-MC-Unique: 0TAqFdepPgmts23bY9wJKA-1
X-Mimecast-MFC-AGG-ID: 0TAqFdepPgmts23bY9wJKA_1739814295
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43947979ce8so24932145e9.0
        for <alex.bennee@linaro.org>; Mon, 17 Feb 2025 09:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814294; x=1740419094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlkmcJXNJRvJqOWRHdosUhgNr6JY3gF+XMAN4UhX3OE=;
        b=RJZ2x1PMAmMdkNlL1CiB5yIOrTSMoLYikWmGBO1tWdpr+r9vQq/omo/vJQ2AQ64CZj
         0vGKRFHZVNsxZWU8HT28e+dCW0pe+oZJN5WsUk/XwPNxGwANjUHHoCDsYQ+HGgIJcRPu
         utirWT/Q+AFusoA+9HySkbCcH5iUsMa0OgZXZxfft/FAqg/XOztc4H3QZwYAY4Gc4iC2
         oqrDhU3EuxlIBFq+9cGoN1Y4KSCt3SoI6+zV/dUgexaOBmrHfdRrQn/13QEKhkHBsnUd
         joHphpi8AuGBAg7oQQpoIJ19ASxnMAJ+pTFgW/oVj54ku2nDrkkpEg3a2v00ZcmuLoTh
         D0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXdcGhOaciwJKIAOQj86SZOrJqOvlJXOoQGR/NMS5J48UbhxvvvECN9JnAOczzmZvZVI4q8xTbhSVooTw==@linaro.org
X-Gm-Message-State: AOJu0YxEw49KNQ0IdgM1iRldlno71w30v30VTsSgEaqBfHJfmpW9ytNs
	Gfaa3eW7/UNNVYVuvRIe0I5puInJGKv+udNexXJkOxXxi5zobg3YL43+0DexrCsUlGGcjoaSYsB
	vOLFblUAuiXlx01B6GyLq1s6mhGrxFmmvM65syGfj6nwtSKRW97jMQg==
X-Gm-Gg: ASbGncuwFeRTqSArSjb4C40DITdm7UZULZdYr1ZftpVgWa5L81q/AfnvWQXgcmNrJJT
	DBGiBakLhGzJvliI7R+wKolibIIlYz2ygrKFgoyN37VvrKwotXOq0P2IRofRDvvHj/aUmJMpV5j
	BRTmt0liYl3MPipSVj9MJ98AH26m5+Lmmr5sxcwXC+Ok4wF65Ksbt8Px85yBQhM63EUIuluw2Xt
	qL7wP6NXR2ohnL64jSXZMWXceFxYCI5ftMN0OjYjtOdxp+BOD97vsM7+dM8T1HJkdtrIt9+nx42
	UUtwqbsPYE5yMHtvcTeyARKNT4KospFRvrPKADtwCdMtZVYexs6Z
X-Received: by 2002:a05:600c:468d:b0:439:91dd:cfa3 with SMTP id 5b1f17b1804b1-43991ddd1f7mr6997725e9.29.1739814294371;
        Mon, 17 Feb 2025 09:44:54 -0800 (PST)
X-Received: by 2002:a05:600c:468d:b0:439:91dd:cfa3 with SMTP id 5b1f17b1804b1-43991ddd1f7mr6997405e9.29.1739814293815;
        Mon, 17 Feb 2025 09:44:53 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b824dsm158071415e9.34.2025.02.17.09.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 09:44:53 -0800 (PST)
Message-ID: <279a277d-428c-4769-ac6a-25968b40c6a7@redhat.com>
Date: Mon, 17 Feb 2025 18:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 3/3] docs: Fix "Arm" capitalization
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com, maz@kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
References: <20250217163732.3718617-1-kchamart@redhat.com>
 <20250217163732.3718617-4-kchamart@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250217163732.3718617-4-kchamart@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R35bo1HBvIp4qaGk2XObyYukPJa8ZH7jwTbpvxgg1Lg_1739814295
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ITh4xbaQ5Hmp


Hi,

On 2/17/25 5:37 PM, Kashyap Chamarthy wrote:
> This is based on Peter's suggestion here[1].
>
> I simply addrressed the occurrences that I found with `git grep "ARM "`
adressed
> in the docs/ directory.  I didn't touch stuff like these "StrongARM",
> ARM926EJ-S, ARM1176JZS, etc.  Related commit[2].
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg05137.html
>     - docs/cpu-features: Update "PAuth" (Pointer Authentication) details
>
> [2] 6fe6d6c9a9 (docs: Be consistent about capitalization of 'Arm',
>     2020-03-09)
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  docs/devel/testing/qgraph.rst        |  8 ++++----
>  docs/devel/vfio-iommufd.rst          |  2 +-
>  docs/specs/fsi.rst                   |  2 +-
>  docs/system/arm/aspeed.rst           |  6 +++---
>  docs/system/arm/b-l475e-iot01a.rst   |  2 +-
>  docs/system/arm/nrf.rst              |  4 ++--
>  docs/system/arm/nuvoton.rst          |  4 ++--
>  docs/system/arm/stm32.rst            | 12 ++++++------
>  docs/system/arm/xlnx-versal-virt.rst | 12 ++++++------
>  docs/system/arm/xlnx-zynq.rst        |  2 +-
>  docs/system/guest-loader.rst         |  2 +-
>  11 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/docs/devel/testing/qgraph.rst b/docs/devel/testing/qgraph.rst
> index 43342d9d65..30ff055fae 100644
> --- a/docs/devel/testing/qgraph.rst
> +++ b/docs/devel/testing/qgraph.rst
> @@ -8,7 +8,7 @@ take care of booting QEMU with the right machine and devices.
>  This makes each test "hardcoded" for a specific configuration, reducing
>  the possible coverage that it can reach.
>  
> -For example, the sdhci device is supported on both x86_64 and ARM boards,
> +For example, the sdhci device is supported on both x86_64 and Arm boards,
>  therefore a generic sdhci test should test all machines and drivers that
>  support that device.
>  Using only libqos APIs, the test has to manually take care of
> @@ -195,7 +195,7 @@ there.
>  The ``arm/raspi2b`` machine node is listed as "UNAVAILABLE". Although it is
>  reachable from the root via '' -> 'arm/raspi2b' the node is unavailable because
>  the QEMU binary did not list it when queried by the framework. This is expected
> -because we used the ``qemu-system-x86_64`` binary which does not support ARM
> +because we used the ``qemu-system-x86_64`` binary which does not support Arm
>  machine types.
>  
>  If a test is unexpectedly listed as "UNAVAILABLE", first check that the "ALL
> @@ -214,9 +214,9 @@ Here we continue the ``sdhci`` use case, with the following scenario:
>  
>  - ``sdhci-test`` aims to test the ``read[q,w], writeq`` functions
>    offered by the ``sdhci`` drivers.
> -- The current ``sdhci`` device is supported by both ``x86_64/pc`` and ``ARM``
> +- The current ``sdhci`` device is supported by both ``x86_64/pc`` and ``Arm``
>    (in this example we focus on the ``arm-raspi2b``) machines.
> -- QEMU offers 2 types of drivers: ``QSDHCI_MemoryMapped`` for ``ARM`` and
> +- QEMU offers 2 types of drivers: ``QSDHCI_MemoryMapped`` for ``Arm`` and
>    ``QSDHCI_PCI`` for ``x86_64/pc``. Both implement the
>    ``read[q,w], writeq`` functions.
>  
> diff --git a/docs/devel/vfio-iommufd.rst b/docs/devel/vfio-iommufd.rst
> index 3d1c11f175..fe8a7365e3 100644
> --- a/docs/devel/vfio-iommufd.rst
> +++ b/docs/devel/vfio-iommufd.rst
> @@ -122,7 +122,7 @@ container:
>  Supported platform
>  ==================
>  
> -Supports x86, ARM and s390x currently.
> +Supports x86, Arm, and s390x currently.
>  
>  Caveats
>  =======
> diff --git a/docs/specs/fsi.rst b/docs/specs/fsi.rst
> index af87822531..f7d86d3e37 100644
> --- a/docs/specs/fsi.rst
> +++ b/docs/specs/fsi.rst
> @@ -40,7 +40,7 @@ for the implementation are: (see the `FSI specification`_ for more details)
>     MMIO-mapping of the CFAM address straight onto a sub-region of the OPB
>     address space.
>  
> -5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in the
> +5. An APB-to-OPB bridge enabling access to the OPB from the Arm core in the
>     AST2600. Hardware limitations prevent the OPB from being directly mapped
>     into APB, so all accesses are indirect through the bridge.
>  
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index fa4aa28eef..42096fb941 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -5,8 +5,8 @@ The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
>  Aspeed evaluation boards. They are based on different releases of the
>  Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
>  AST2500 with an ARM1176JZS CPU (800MHz), the AST2600
> -with dual cores ARM Cortex-A7 CPUs (1.2GHz) and more recently the AST2700
> -with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz)
> +with dual cores Arm Cortex-A7 CPUs (1.2GHz) and more recently the AST2700
> +with quad cores Arm Cortex-A35 64 bits CPUs (1.6GHz)
>  
>  The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
>  etc.
> @@ -275,7 +275,7 @@ Aspeed minibmc family boards (``ast1030-evb``)
>  
>  The QEMU Aspeed machines model mini BMCs of various Aspeed evaluation
>  boards. They are based on different releases of the
> -Aspeed SoC : the AST1030 integrating an ARM Cortex M4F CPU (200MHz).
> +Aspeed SoC : the AST1030 integrating an Arm Cortex M4F CPU (200MHz).
>  
>  The SoC comes with SRAM, SPI, I2C, etc.
>  
> diff --git a/docs/system/arm/b-l475e-iot01a.rst b/docs/system/arm/b-l475e-iot01a.rst
> index 2adcc4b4c1..7f891719d5 100644
> --- a/docs/system/arm/b-l475e-iot01a.rst
> +++ b/docs/system/arm/b-l475e-iot01a.rst
> @@ -2,7 +2,7 @@ B-L475E-IOT01A IoT Node (``b-l475e-iot01a``)
>  ============================================
>  
>  The B-L475E-IOT01A IoT Node uses the STM32L475VG SoC which is based on
> -ARM Cortex-M4F core. It is part of STMicroelectronics
> +Arm Cortex-M4F core. It is part of STMicroelectronics
>  :doc:`STM32 boards </system/arm/stm32>` and more specifically the STM32L4
>  ultra-low power series. The STM32L4x5 chip runs at up to 80 MHz and
>  integrates 128 KiB of SRAM and up to 1MiB of Flash. The B-L475E-IOT01A board
> diff --git a/docs/system/arm/nrf.rst b/docs/system/arm/nrf.rst
> index eda87bd760..e0ea6a8b7e 100644
> --- a/docs/system/arm/nrf.rst
> +++ b/docs/system/arm/nrf.rst
> @@ -1,7 +1,7 @@
>  Nordic nRF boards (``microbit``)
>  ================================
>  
> -The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that
> +The `Nordic nRF`_ chips are a family of Arm-based System-on-Chip that
>  are designed to be used for low-power and short-range wireless solutions.
>  
>  .. _Nordic nRF: https://www.nordicsemi.com/Products
> @@ -18,7 +18,7 @@ supported by QEMU.
>  Supported devices
>  -----------------
>  
> - * ARM Cortex-M0 (ARMv6-M)
> + * Arm Cortex-M0 (ARMv6-M)
>   * Serial ports (UART)
>   * Clock controller
>   * Timers
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index 05059378e5..e0da2297ff 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,9 +1,9 @@
>  Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
>  =====================================================================================================
>  
> -The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
> +The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of Arm-based SoCs that are
>  designed to be used as Baseboard Management Controllers (BMCs) in various
> -servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
> +servers. They all feature one or two Arm Cortex-A9 CPU cores, as well as an
>  assortment of peripherals targeted for either Enterprise or Data Center /
>  Hyperscale applications. The former is a superset of the latter, so NPCM750 has
>  all the peripherals of NPCM730 and more.
> diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
> index 511e3eb9ac..381d2c4386 100644
> --- a/docs/system/arm/stm32.rst
> +++ b/docs/system/arm/stm32.rst
> @@ -1,24 +1,24 @@
>  STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``olimex-stm32-h405``, ``stm32vldiscovery``)
>  ===============================================================================================================
>  
> -The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
> +The `STM32`_ chips are a family of 32-bit Arm-based microcontroller by
>  STMicroelectronics.
>  
>  .. _STM32: https://www.st.com/en/microcontrollers-microprocessors/stm32-32-bit-arm-cortex-mcus.html
>  
> -The STM32F1 series is based on ARM Cortex-M3 core. The following machines are
> +The STM32F1 series is based on Arm Cortex-M3 core. The following machines are
>  based on this chip :
>  
>  - ``stm32vldiscovery``  STM32VLDISCOVERY board with STM32F100RBT6 microcontroller
>  
> -The STM32F2 series is based on ARM Cortex-M3 core. The following machines are
> +The STM32F2 series is based on Arm Cortex-M3 core. The following machines are
>  based on this chip :
>  
>  - ``netduino2``         Netduino 2 board with STM32F205RFT6 microcontroller
>  
> -The STM32F4 series is based on ARM Cortex-M4F core, as well as the STM32L4
> +The STM32F4 series is based on Arm Cortex-M4F core, as well as the STM32L4
>  ultra-low-power series. The STM32F4 series is pin-to-pin compatible with STM32F2 series.
> -The following machines are based on this ARM Cortex-M4F chip :
> +The following machines are based on this Arm Cortex-M4F chip :
>  
>  - ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
>  - ``olimex-stm32-h405`` Olimex STM32 H405 board with STM32F405RGT6 microcontroller
> @@ -29,7 +29,7 @@ There are many other STM32 series that are currently not supported by QEMU.
>  Supported devices
>  -----------------
>  
> - * ARM Cortex-M3, Cortex M4F
> + * Arm Cortex-M3, Cortex M4F
>   * Analog to Digital Converter (ADC)
>   * EXTI interrupt
>   * Serial ports (USART)
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index c5f35f28e4..1b3a0ad6a5 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -19,12 +19,12 @@ limitations. Currently, we support the following cores and devices:
>  
>  Implemented CPU cores:
>  
> -- 2 ACPUs (ARM Cortex-A72)
> +- 2 ACPUs (Arm Cortex-A72)
>  
>  Implemented devices:
>  
> -- Interrupt controller (ARM GICv3)
> -- 2 UARTs (ARM PL011)
> +- Interrupt controller (Arm GICv3)
> +- 2 UARTs (Arm PL011)
>  - An RTC (Versal built-in)
>  - 2 GEMs (Cadence MACB Ethernet MACs)
>  - 8 ADMA (Xilinx zDMA) channels
> @@ -70,7 +70,7 @@ provides EL3 firmware to handle PSCI.
>  
>  A few examples:
>  
> -Direct Linux boot of a generic ARM64 upstream Linux kernel:
> +Direct Linux boot of a generic Arm64 upstream Linux kernel:
>  
>  .. code-block:: bash
>  
> @@ -95,7 +95,7 @@ Direct Linux boot of PetaLinux 2019.2:
>        -device virtio-rng-device,bus=virtio-mmio-bus.0,rng=rng0 \
>        -object rng-random,filename=/dev/urandom,id=rng0
>  
> -Boot PetaLinux 2019.2 via ARM Trusted Firmware (2018.3 because the 2019.2
> +Boot PetaLinux 2019.2 via Arm Trusted Firmware (2018.3 because the 2019.2
>  version of ATF tries to configure the CCI which we don't model) and U-boot:
>  
>  .. code-block:: bash
> @@ -149,7 +149,7 @@ Run the following at the U-Boot prompt:
>    fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
>    booti 30000000 - 20000000
>  
> -Boot Linux as Dom0 on Xen via ARM Trusted Firmware and U-Boot:
> +Boot Linux as Dom0 on Xen via Arm Trusted Firmware and U-Boot:
>  
>  .. code-block:: bash
>  
> diff --git a/docs/system/arm/xlnx-zynq.rst b/docs/system/arm/xlnx-zynq.rst
> index ade18a3fe1..94eedf0e81 100644
> --- a/docs/system/arm/xlnx-zynq.rst
> +++ b/docs/system/arm/xlnx-zynq.rst
> @@ -29,7 +29,7 @@ QEMU xilinx-zynq-a9 board supports following devices:
>  
>  Running
>  """""""
> -Direct Linux boot of a generic ARM upstream Linux kernel:
> +Direct Linux boot of a generic Arm upstream Linux kernel:
>  
>  .. code-block:: bash
>  
> diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
> index 304ee5d531..12436cc791 100644
> --- a/docs/system/guest-loader.rst
> +++ b/docs/system/guest-loader.rst
> @@ -32,7 +32,7 @@ size. Additional information can be passed with by using additional
>  arguments.
>  
>  Currently the only supported machines which use FDT data to boot are
> -the ARM and RiscV ``virt`` machines.
> +the Arm and RiscV ``virt`` machines.
>  
>  Arguments
>  ^^^^^^^^^
