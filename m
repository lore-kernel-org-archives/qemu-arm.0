Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1366511eji;
        Tue, 2 Jan 2024 06:55:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmg5ZMYz/aalP2DEj/Qd21hz7I/KWIzM44C3R050fO4yvilUDyAE4TYncIaKiHr7wQJ1dX
X-Received: by 2002:aa7:8a08:0:b0:6d9:b36f:21e8 with SMTP id m8-20020aa78a08000000b006d9b36f21e8mr16791563pfa.31.1704207323154;
        Tue, 02 Jan 2024 06:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704207323; cv=none;
        d=google.com; s=arc-20160816;
        b=lF7YS23DNbVCZ/b7CRe0STX6H1Ro34rc/I7/MJ4NQ5fz5WpgXgJBWOfoO1Sqfvq7wp
         lqb4l/pg94nNahGohYjGARdEkdUpQnIWjut8FY1sF9rli588Rqjx+Y8A4jmkcaqLiIdP
         vdMkni2sPaHIYQcQITpige0QjwOM5y7XpKlhBNCS/7oadKEfe6XFIUw80CKrlrIuO2FF
         oOZTWm+PS+kzcYH3y9PqBJOlRq40DRTQBtwazzOT1oIsm3EM7NQ+5Uf+zLaXU0zm20tX
         ijA6Xd9n4czj2/7jOgD+qd6sGMM9mYSgLxOa14a70qHrLaV/+7ToAvvhYu3/zhKx8KJN
         P3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=YMtCTSX5Eb5JphTF3hOUnvd+S481yMIlDJZwgFGqv0o=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=ISwR6NW7Pcf7F5sdGnT6ZvH4Pl728AYi9fnmQ0w5HSbPnbdTRr6VmTRwuCsk76zoDz
         4j+pyAEU2/71T7dlaetIKfa4Ly4MKqj5UIThLYFKqlwtV/lT3t9O7SBgKJ/gkIYhlRuM
         0D/a0UKaZNmi88UnUVgQEVcr07ZpsFw8Ji+KZjzRpuHSuyi8ghGdM40Dnt7msNZxAdja
         zKUzUkvsT80FJHOUXIGl64G85JFO2r7eqjTvkuhSe1BipyW7Gnk0TImvs4U5+H6kp+Ki
         FGT7SvduYZrIECJgh9YN6G8rdX/NkWEpsmTeH9SMCGMzm19HsF5xrA6L/wCrl6/kpiC2
         3H0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id e12-20020a65688c000000b005b95ccd1b4dsi17285881pgt.82.2024.01.02.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4G9g6t02z4x1P;
	Wed,  3 Jan 2024 01:55:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4G9X4wtBz4wcc;
	Wed,  3 Jan 2024 01:55:12 +1100 (AEDT)
Message-ID: <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
Date: Tue, 2 Jan 2024 15:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Anton Johansson <anjo@rev.ng>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231212162935.42910-1-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zSgXYqAZIfbx

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> When a MPCore cluster is used, the Cortex-A cores belong the the
> cluster container, not to the board/soc layer. This series move
> the creation of vCPUs to the MPCore private container.
> 
> Doing so we consolidate the QOM model, moving common code in a
> central place (abstract MPCore parent).

Changing the QOM hierarchy has an impact on the state of the machine
and some fixups are then required to maintain migration compatibility.
This can become a real headache for KVM machines like virt for which
migration compatibility is a feature, less for emulated ones.

I don't have a good solution to propose to overcome this problem :/

C.
  

> 
> This eventually allow removing one qemu_get_cpu() use, which we
> want to remove in heterogeneous machines (machines using MPCore
> are candidate for heterogeneous emulation).
> 
> Maybe these hw/cpu/arm/ files belong to hw/arm/...
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (33):
>    hw/arm/boot: Propagate vCPU to arm_load_dtb()
>    hw/arm/fsl-imx6: Add a local 'gic' variable
>    hw/arm/fsl-imx6ul: Add a local 'gic' variable
>    hw/arm/fsl-imx7: Add a local 'gic' variable
>    hw/cpu: Remove dead Kconfig
>    hw/cpu/arm: Rename 'busdev' -> 'gicsbd' in a15mp_priv_realize()
>    hw/cpu/arm: Alias 'num-cpu' property on TYPE_REALVIEW_MPCORE
>    hw/cpu/arm: Declare CPU QOM types using DEFINE_TYPES() macro
>    hw/cpu/arm: Merge {a9mpcore.h, a15mpcore.h} as cortex_mpcore.h
>    hw/cpu/arm: Introduce abstract CORTEX_MPCORE_PRIV QOM type
>    hw/cpu/arm: Have A9MPCORE/A15MPCORE inheritate common
>      CORTEX_MPCORE_PRIV
>    hw/cpu/arm: Create MPCore container in QOM parent
>    hw/cpu/arm: Handle 'num_cores' property once in MPCore parent
>    hw/cpu/arm: Handle 'has_el2/3' properties once in MPCore parent
>    hw/cpu/arm: Handle 'gic-irq' property once in MPCore parent
>    hw/cpu/arm: Handle GIC once in MPCore parent
>    hw/cpu/arm: Document more properties of CORTEX_MPCORE_PRIV QOM type
>    hw/cpu/arm: Replace A15MPPrivState by CortexMPPrivState
>    hw/cpu/arm: Introduce TYPE_A7MPCORE_PRIV for Cortex-A7 MPCore
>    hw/cpu/arm: Consolidate check on max GIC spi supported
>    hw/cpu/arm: Create CPUs once in MPCore parent
>    hw/arm/aspeed_ast2600: Let the A7MPcore create/wire the CPU cores
>    hw/arm/exynos4210: Let the A9MPcore create/wire the CPU cores
>    hw/arm/fsl-imx6: Let the A9MPcore create/wire the CPU cores
>    hw/arm/fsl-imx6ul: Let the A7MPcore create/wire the CPU cores
>    hw/arm/fsl-imx7: Let the A7MPcore create/wire the CPU cores
>    hw/arm/highbank: Let the A9/A15MPcore create/wire the CPU cores
>    hw/arm/vexpress: Let the A9/A15MPcore create/wire the CPU cores
>    hw/arm/xilinx_zynq: Let the A9MPcore create/wire the CPU cores
>    hw/arm/npcm7xx: Let the A9MPcore create/wire the CPU cores
>    hw/cpu/a9mpcore: Remove legacy code
>    hw/cpu/arm: Remove 'num-cpu' property alias
>    hw/cpu/arm: Remove use of qemu_get_cpu() in A7/A15 realize()
> 
>   MAINTAINERS                    |   3 +-
>   include/hw/arm/aspeed_soc.h    |   5 +-
>   include/hw/arm/boot.h          |   4 +-
>   include/hw/arm/exynos4210.h    |   6 +-
>   include/hw/arm/fsl-imx6.h      |   6 +-
>   include/hw/arm/fsl-imx6ul.h    |   8 +-
>   include/hw/arm/fsl-imx7.h      |   8 +-
>   include/hw/arm/npcm7xx.h       |   3 +-
>   include/hw/cpu/a15mpcore.h     |  44 -------
>   include/hw/cpu/a9mpcore.h      |  39 -------
>   include/hw/cpu/cortex_mpcore.h | 135 ++++++++++++++++++++++
>   hw/arm/aspeed_ast2600.c        |  61 ++++------
>   hw/arm/boot.c                  |  11 +-
>   hw/arm/exynos4210.c            |  60 ++++------
>   hw/arm/exynos4_boards.c        |   6 +-
>   hw/arm/fsl-imx6.c              |  84 ++++----------
>   hw/arm/fsl-imx6ul.c            |  65 ++++-------
>   hw/arm/fsl-imx7.c              | 103 +++++------------
>   hw/arm/highbank.c              |  56 ++-------
>   hw/arm/mcimx6ul-evk.c          |   3 +-
>   hw/arm/mcimx7d-sabre.c         |   3 +-
>   hw/arm/npcm7xx.c               |  48 ++------
>   hw/arm/realview.c              |   4 +-
>   hw/arm/sabrelite.c             |   4 +-
>   hw/arm/vexpress.c              |  60 +++-------
>   hw/arm/virt.c                  |   2 +-
>   hw/arm/xilinx_zynq.c           |  30 ++---
>   hw/cpu/a15mpcore.c             | 179 +++++++++++++----------------
>   hw/cpu/a9mpcore.c              | 138 +++++++++-------------
>   hw/cpu/arm11mpcore.c           |  23 ++--
>   hw/cpu/cortex_mpcore.c         | 202 +++++++++++++++++++++++++++++++++
>   hw/cpu/realview_mpcore.c       |  30 ++---
>   hw/arm/Kconfig                 |   8 +-
>   hw/cpu/Kconfig                 |   8 --
>   hw/cpu/meson.build             |   1 +
>   35 files changed, 689 insertions(+), 761 deletions(-)
>   delete mode 100644 include/hw/cpu/a15mpcore.h
>   delete mode 100644 include/hw/cpu/a9mpcore.h
>   create mode 100644 include/hw/cpu/cortex_mpcore.h
>   create mode 100644 hw/cpu/cortex_mpcore.c
>   delete mode 100644 hw/cpu/Kconfig
> 
