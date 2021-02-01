Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l1sm27127413wrp.40.2021.02.01.09.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 09:23:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2C6931FF7E;
	Mon,  1 Feb 2021 17:23:29 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-6-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Richard Henderson
 <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Claudio Fontana <cfontana@suse.de>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 05/11] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Mon, 01 Feb 2021 17:18:59 +0000
In-reply-to: <20210131115022.242570-6-f4bug@amsat.org>
Message-ID: <87a6snvh0u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zB3AMbDt+aFv


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> Only enable the following ARMv6 CPUs when TCG is available:
>
>   - ARM1136
>   - ARM1176
>   - ARM11MPCore
>   - Cortex-M0
>
> The following machines are no more built when TCG is disabled:
>
>   - kzm                  ARM KZM Emulation Baseboard (ARM1136)
>   - microbit             BBC micro:bit (Cortex-M0)
>   - n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
>   - n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
>   - realview-eb-mpcore   ARM RealView Emulation Baseboard (ARM11MPCore)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 2 --
>  hw/arm/realview.c                       | 2 +-
>  tests/qtest/cdrom-test.c                | 2 +-
>  hw/arm/Kconfig                          | 6 ++++++
>  target/arm/Kconfig                      | 4 ++++
>  5 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 0aad35da0c4..175530595ce 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -10,9 +10,7 @@ CONFIG_ARM_VIRT=3Dy
>  CONFIG_CUBIEBOARD=3Dy
>  CONFIG_EXYNOS4=3Dy
>  CONFIG_HIGHBANK=3Dy
> -CONFIG_FSL_IMX31=3Dy
>  CONFIG_MUSCA=3Dy
> -CONFIG_NSERIES=3Dy
>  CONFIG_STELLARIS=3Dy
>  CONFIG_REALVIEW=3Dy
>  CONFIG_VEXPRESS=3Dy
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 2dcf0a4c23e..0606d22da14 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -463,8 +463,8 @@ static void realview_machine_init(void)
>  {
>      if (tcg_builtin()) {
>          type_register_static(&realview_eb_type);
> +        type_register_static(&realview_eb_mpcore_type);
>      }
> -    type_register_static(&realview_eb_mpcore_type);
>      type_register_static(&realview_pb_a8_type);
>      type_register_static(&realview_pbx_a9_type);
>  }

This confuses me - are we even able to run a realview image under KVM?
Surely the whole of realview should be TCG only?

The rest looks fine to me though:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
