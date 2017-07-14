Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j190sm3387585wmd.22.2017.07.14.09.18.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 09:18:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 9953C3E00CD;
	Fri, 14 Jul 2017 17:18:14 +0100 (BST)
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org> <1500029487-14822-10-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Alistair Francis
 <alistair.francis@xilinx.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 9/9] MAINTAINERS: Add entries for MPS2 board
In-reply-to: <1500029487-14822-10-git-send-email-peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 17:18:14 +0100
Message-ID: <87h8yfuh4p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: L9Wj7hx2PMob


Peter Maydell <peter.maydell@linaro.org> writes:

> Add entries to the MAINTAINERS file for the new MPS2
> board and devices.
>
> Since the CMSDK devices are not specific to the MPS2 board,
> extend the existing 'PrimeCell' section to cover CMSDK
> devices as well; in both cases these are devices implemented
> by ARM and provided as RTL that may be used in multiple
> SoCs and boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  MAINTAINERS | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9529c94..10f5cd6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -380,7 +380,7 @@ F: hw/*/allwinner*
>  F: include/hw/*/allwinner*
>  F: hw/arm/cubieboard.c
>
> -ARM PrimeCell
> +ARM PrimeCell and CMSDK devices
>  M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
> @@ -394,6 +394,10 @@ F: hw/intc/pl190.c
>  F: hw/sd/pl181.c
>  F: hw/timer/pl031.c
>  F: include/hw/arm/primecell.h
> +F: hw/timer/cmsdk-apb-timer.c
> +F: include/hw/timer/cmsdk-apb-timer.h
> +F: hw/char/cmsdk-apb-uart.c
> +F: include/hw/char/cmsdk-apb-uart.h
>
>  ARM cores
>  M: Peter Maydell <peter.maydell@linaro.org>
> @@ -455,6 +459,14 @@ S: Maintained
>  F: hw/arm/integratorcp.c
>  F: hw/misc/arm_integrator_debug.c
>
> +MPS2
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/mps2.c
> +F: hw/misc/mps2-scc.c
> +F: include/hw/misc/mps2-scc.h
> +
>  Musicpal
>  M: Jan Kiszka <jan.kiszka@web.de>
>  L: qemu-arm@nongnu.org


--
Alex Bennée
