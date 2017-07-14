Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l1sm3572935wmb.18.2017.07.14.09.17.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 09:17:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DA6413E00CD;
	Fri, 14 Jul 2017 17:17:55 +0100 (BST)
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org> <1500029487-14822-9-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Alistair Francis
 <alistair.francis@xilinx.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 8/9] hw/arm/mps2: Add ethernet
In-reply-to: <1500029487-14822-9-git-send-email-peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 17:17:55 +0100
Message-ID: <87inivuh58.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: wD8VHTYtIN11


Peter Maydell <peter.maydell@linaro.org> writes:

> The MPS2 FPGA images support ethernet via a LAN9220. We use
> QEMU's LAN9118 model, which is software compatible except
> that it is missing the checksum-offload feature.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index bdc631a..6adfb22 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -35,6 +35,8 @@
>  #include "hw/char/cmsdk-apb-uart.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
>  #include "hw/misc/mps2-scc.h"
> +#include "hw/devices.h"
> +#include "net/net.h"
>
>  typedef enum MPS2FPGAType {
>      FPGA_AN385,
> @@ -210,7 +212,6 @@ static void mps2_common_init(MachineState *machine)
>      create_unimplemented_device("Extra peripheral region @0x40020000",
>                                  0x40020000, 0x00010000);
>      create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
> -    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>      create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>
>      switch (mmc->fpga_type) {
> @@ -309,6 +310,13 @@ static void mps2_common_init(MachineState *machine)
>                               &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
>
> +    /* In hardware this is a LAN9220; the LAN9118 is software compatible
> +     * except that it doesn't support the checksum-offload feature.
> +     */
> +    lan9118_init(&nd_table[0], 0x40200000,
> +                 qdev_get_gpio_in(armv7m,
> +                                  mmc->fpga_type == FPGA_AN385 ? 13 : 47));
> +

As the lan9118 model will log guest errors if the software tries to
access the csum feature I guess thats OK.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>


>      system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,


--
Alex Bennée
