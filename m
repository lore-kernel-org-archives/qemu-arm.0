Received: by 10.25.44.15 with SMTP id s15csp1819128lfs;
        Thu, 13 Jul 2017 00:38:16 -0700 (PDT)
X-Received: by 10.237.32.70 with SMTP id 64mr3124302qta.218.1499931496537;
        Thu, 13 Jul 2017 00:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499931496; cv=none;
        d=google.com; s=arc-20160816;
        b=y4iynQmZNk39i48BfLUlI/ETcuX+dRjsS7DaY9AQz89PrE4cCZiBfZhoRgMc/dpib4
         Werzcgd0Gu/5PIbE4k0Eh8a0l8Ee3Y+R2QHOyJpnkB5shOu3mTkIPB2Y+n8JrCxa/ndh
         LH8RCVhJdlb1c2y6v9aJtO4Q/SFVsnv9FsSlqbjVZEELzKpsSpAYeL/wP+N8Iy6i8+r0
         s7/GQcMcy750PJlRlpVNHf2Eii1oh1fLbFHMxeR78y5oHRwFLykDU8izH0RnQ4Xr7YHc
         CpOn36/z0DJBcCPOg0nrkh2BUzbadyJ5BmO283Q//qRribzcC8s7f9ChcXmdTR/k0gMj
         cmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aaTPGWeHipuORiPMErdwp/8Psg6cWxCMOvW4pcguXvU=;
        b=lPwzhFNJ5o4US3vUU1+KU/MVHRIb6x4IBQcnCzK+s8C3GS6ZIN0ZbWF7fdDhCAZZao
         uwS2mAQda3MtBTGfKWHYzoJ9G2r36ieeWPQAoQRuYHN5nEHjtyQ/va4p576qJoXL6A/F
         fA58WUzkb4uvPTxhrT09lVbSBVqv9AINqI0wDHs4Dk6K7aAuT+XETBcZYnbQDIzQZLmc
         MGhpvQOFp6hG+bD+SSam2EurQ4FnfKOkald7ASU6oosRNReVI+CEk1jraeKJ6J+VXbNW
         JD3KsMfQyVqvzlJLGQjNGilKlK0R311yMzGKrcGPSO92I5vRzojVO2ZdV6wChOdL1O25
         AleA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=vO5RTGDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v123si4487325qkc.115.2017.07.13.00.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 00:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=vO5RTGDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVYhR-0004ii-Ti
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 03:38:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dVYhL-0004ib-9c
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 03:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dVYhK-0007sh-8L
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 03:38:07 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dVYhJ-0007sS-Ts; Thu, 13 Jul 2017 03:38:06 -0400
Received: by mail-wm0-x242.google.com with SMTP id u23so3289380wma.2;
	Thu, 13 Jul 2017 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aaTPGWeHipuORiPMErdwp/8Psg6cWxCMOvW4pcguXvU=;
	b=vO5RTGDiTAf1G9Rwl6Vl4oZdEtv12o3hJcfuzqpuwRRwL027SoteomH7HT0tcl10N+
	bxmGfwX623Zrr8cOqT5FLFV0kULk52hl7lE0Eyla8UQ9vxOnzOakGvxhq2FGqqSIrpl3
	Xq9v/wm36dX5IoWZDVQgNHgB+z0ZoXrwTHJkV5EMjJbTnPhPxRqp19Yn3OQcSdPnjTn0
	pJBSIcVstv/G0c1dR+gUVLMvNmOKa8Cc33a6WYNmmXg3jzg/gYQ4NnBRWeXfMhXXg4ZF
	m7kuH7ruO8BzAR/S6VwJAuDt1YyQwi+cc685xEjlGz38BoKqtAk09u1UMIQjfZ9y1hIE
	qXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aaTPGWeHipuORiPMErdwp/8Psg6cWxCMOvW4pcguXvU=;
	b=p7amx+z6grLVfWQoVeNuGXRlL3aM9n1KowZh/BuvO6lzHYwJ+ITIB2ESdzVkS10uhp
	3AJ4hkMG+WBTr/8bSFGWSUzd6NAKkhWsPXCIZyqaEdxax5JCzwg24gp4xTOEruUkAT7t
	EoahidbGwEtv3x9CNhT7kl5mH1SyQAatyapZCdMw5ap1Be88XckosUnodXohPzEjobaK
	ZcwSKT9QP2KuItx5K06ZzROKrNuIk+hmnlvEqw4p11Es8URSYKYmwEEBqhWxIe9mvAiD
	hHuXzjfdLyGbh8jtv1FtLf+H/uTX++dqlPvrCzKEFXOQu9SL3Bp4/sydNoXUq4c+VnKf
	HboQ==
X-Gm-Message-State: AIVw113JZAULoXLT2MNlb6Gl9iACBILOhXrGAiqSyAAnhcKWZx4njMyp
	uL3V5Q1glmVQmcJD3iuIrnKnQcTmnw==
X-Received: by 10.28.51.11 with SMTP id z11mr967741wmz.115.1499931484718; Thu,
	13 Jul 2017 00:38:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Thu, 13 Jul 2017 00:37:34 -0700 (PDT)
In-Reply-To: <1499771839-32518-4-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-4-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Jul 2017 09:37:34 +0200
Message-ID: <CAKmqyKMAuB9KbogvjzZtxWeFcHpb2O1T6dH1v4MrDtbm41CtiQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/7] hw/arm/mps2: Add UARTs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFmoNJIp0TTQ

On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Add the UARTs to the MPS2 board models.
>
> Unfortunately the details of the wiring of the interrupts through
> various OR gates differ between AN511 and AN385 so this can't
> be purely a data-driven difference.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Woo! I'm glad the OR IRQ stuff is useful.

Thanks,
Alistair

> ---
>  hw/arm/mps2.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 28838bc..1b60b12 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -27,9 +27,12 @@
>  #include "qemu/error-report.h"
>  #include "hw/arm/arm.h"
>  #include "hw/arm/armv7m.h"
> +#include "hw/or-irq.h"
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/char/cmsdk-apb-uart.h"
>
>  typedef enum MPS2FPGAType {
>      FPGA_AN385,
> @@ -208,6 +211,89 @@ static void mps2_common_init(MachineState *machine)
>      create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>      create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>
> +    switch (mmc->fpga_type) {
> +    case FPGA_AN385:
> +    {
> +        /* The overflow IRQs for UARTs 0, 1 and 2 are ORed together.
> +         * Overflow for UARTs 4 and 5 doesn't trigger any interrupt.
> +         */
> +        Object *orgate;
> +        DeviceState *orgate_dev;
> +        int i;
> +
> +        orgate = object_new(TYPE_OR_IRQ);
> +        object_property_set_int(orgate, 6, "num-lines", &error_fatal);
> +        object_property_set_bool(orgate, true, "realized", &error_fatal);
> +        orgate_dev = DEVICE(orgate);
> +        qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
> +
> +        for (i = 0; i < 5; i++) {
> +            hwaddr uartbase[] = {0x40004000, 0x40005000, 0x40006000,
> +                                 0x40007000, 0x40009000};
> +            Chardev *uartchr = i < MAX_SERIAL_PORTS ? serial_hds[i] : NULL;
> +            /* RX irq number; TX irq is always one greater */
> +            int uartirq[] = {0, 2, 4, 18, 20};
> +            qemu_irq txovrint = NULL, rxovrint = NULL;
> +
> +            if (i < 3) {
> +                txovrint = qdev_get_gpio_in(orgate_dev, i * 2);
> +                rxovrint = qdev_get_gpio_in(orgate_dev, i * 2 + 1);
> +            }
> +
> +            cmsdk_apb_uart_create(uartbase[i],
> +                                  qdev_get_gpio_in(armv7m, uartirq[i] + 1),
> +                                  qdev_get_gpio_in(armv7m, uartirq[i]),
> +                                  txovrint, rxovrint,
> +                                  NULL,
> +                                  uartchr, SYSCLK_FRQ);
> +        }
> +        break;
> +    }
> +    case FPGA_AN511:
> +    {
> +        /* The overflow IRQs for all UARTs are ORed together.
> +         * Tx and Rx IRQs for each UART are ORed together.
> +         */
> +        Object *orgate;
> +        DeviceState *orgate_dev;
> +        int i;
> +
> +        orgate = object_new(TYPE_OR_IRQ);
> +        object_property_set_int(orgate, 10, "num-lines", &error_fatal);
> +        object_property_set_bool(orgate, true, "realized", &error_fatal);
> +        orgate_dev = DEVICE(orgate);
> +        qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
> +
> +        for (i = 0; i < 5; i++) {
> +            /* system irq numbers for the combined tx/rx for each UART */
> +            const int uart_txrx_irqno[] = {0, 2, 45, 46, 56};
> +            hwaddr uartbase[] = {0x40004000, 0x40005000, 0x4002c000,
> +                                 0x4002d000, 0x4002e000};
> +            Chardev *uartchr = i < MAX_SERIAL_PORTS ? serial_hds[i] : NULL;
> +            Object *txrx_orgate;
> +            DeviceState *txrx_orgate_dev;
> +
> +            txrx_orgate = object_new(TYPE_OR_IRQ);
> +            object_property_set_int(txrx_orgate, 2, "num-lines", &error_fatal);
> +            object_property_set_bool(txrx_orgate, true, "realized",
> +                                     &error_fatal);
> +            txrx_orgate_dev = DEVICE(txrx_orgate);
> +            qdev_connect_gpio_out(txrx_orgate_dev, 0,
> +                                  qdev_get_gpio_in(armv7m, uart_txrx_irqno[i]));
> +            cmsdk_apb_uart_create(uartbase[i],
> +                                  qdev_get_gpio_in(txrx_orgate_dev, 0),
> +                                  qdev_get_gpio_in(txrx_orgate_dev, 1),
> +                                  qdev_get_gpio_in(orgate_dev, 0),
> +                                  qdev_get_gpio_in(orgate_dev, 1),
> +                                  NULL,
> +                                  uartchr, SYSCLK_FRQ);
> +        }
> +        break;
> +    }
> +    default:
> +        g_assert_not_reached();
> +    }
> +
>      system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> --
> 2.7.4
>
>
