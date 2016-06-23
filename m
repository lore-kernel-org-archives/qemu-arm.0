Received: by 10.25.21.96 with SMTP id l93csp641355lfi;
        Thu, 23 Jun 2016 10:37:58 -0700 (PDT)
X-Received: by 10.55.107.6 with SMTP id g6mr44555673qkc.166.1466703478340;
        Thu, 23 Jun 2016 10:37:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o83si1083971qki.138.2016.06.23.10.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 10:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG8Zh-0005fD-MH
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 13:37:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8Zb-0005c6-Sc
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:37:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8ZZ-0001br-3b
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:37:50 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8ZX-0001bb-RO
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:37:49 -0400
Received: by mail-vk0-x236.google.com with SMTP id j2so116647715vkg.2
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=otB3g35QHSQ+mdC4isi3ffZfXdM6dIWERFpMkUw4HdU=;
	b=U5QBYKxNkpfmiL5lAbl7x480tqg7UcB1M821ZmWr4h77GXIGzZWSJDNF4SO1xzsvul
	F7Ibws1tK1GJK3qeVHKYhDuHIN6ZPrb7WrcJloB1iI/nNox+QUxZEWtCnbgURb51q4F/
	CJvVBNHkFJvUSzs5AaVVJnejv9nG4GFshH1W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=otB3g35QHSQ+mdC4isi3ffZfXdM6dIWERFpMkUw4HdU=;
	b=Q6XLyxqLfNVrcSDP9GOkqEh2Fwq53yvjROz7Ab34MvvAwqfsYTBRXPI5h6TaxASRcU
	UUZ3NbszeROVkTqkBanFWjYFqLcw+AHu612AGdrerjGBai3shoYPiqrxYSBjQYxmzhOa
	dPpIHwtnlAPwlVM0QChiZXrCz/FwJ6AZ60+u1APDS8i4xqyfbFizdvz3rp97qbG2Fryt
	lViU54NoUrp06705qAJAsQdU6dgy70XbETCa2ZGJ4XDvKp9Cw+dE7F57rFhibBs9S/ME
	aKnWAb4h4Edyabt7si2o5xvIPCHzB+GSy+UrRhpUTwgzLFzMIV6Zl1rsNbs8wbyItn8o
	+oOw==
X-Gm-Message-State: ALyK8tJIvr0/Yh8PSpBlN+tk/EZo9YyvP2yarX34GEQfGWBxFGd93ee9UG/AoX9F775NSEnN1aE0uImUgbDrmeHD
X-Received: by 10.31.188.80 with SMTP id m77mr16404095vkf.30.1466703467183;
	Thu, 23 Jun 2016 10:37:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 10:37:27 -0700 (PDT)
In-Reply-To: <1466648115-17015-2-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-2-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 18:37:27 +0100
Message-ID: <CAFEAcA_7om42C_orttocvVcrEv_sWbqMwTp5+j4o4E5wVzwoDA@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WChvLOleQoRV

On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> The SCU is a collection of chip-level control registers that manage the
> various functions supported by ASPEED SoCs. Typically the bits control
> interactions with clocks, external hardware or reset behaviour, and we
> can largly take a hands-off approach to reads and writes.
>
> Firmware makes heavy use of the state to determine how to boot, but the
> reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
> property is exposed so that the integrating SoC model can configure the
> silicon revision, which in-turn selects the appropriate reset values.
> Further qdev properties are exposed so the board model can configure the
> board-dependent hardware strapping.
>
> Almost all provided AST2400 reset values are specified by the datasheet.
> The notable exception is SOC_SCRATCH1, where we mark the DRAM as
> successfully initialised to avoid unnecessary dark corners in the SoC's
> u-boot support.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks -- I think the interface to the board is much nicer now.
I have a couple of comments below.

>  hw/misc/Makefile.objs        |   1 +
>  hw/misc/aspeed_scu.c         | 258 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/aspeed_scu.h |  34 ++++++
>  trace-events                 |   3 +
>  4 files changed, 296 insertions(+)
>  create mode 100644 hw/misc/aspeed_scu.c
>  create mode 100644 include/hw/misc/aspeed_scu.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ffb49c11aca6..54020aa06c00 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -52,3 +52,4 @@ obj-$(CONFIG_PVPANIC) += pvpanic.o
>  obj-$(CONFIG_EDU) += edu.o
>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>  obj-$(CONFIG_AUX) += aux.o
> +obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> new file mode 100644
> index 000000000000..a714431c45c5
> --- /dev/null
> +++ b/hw/misc/aspeed_scu.c
> @@ -0,0 +1,258 @@
> +/*
> + * ASPEED System Control Unit
> + *
> + * Andrew Jeffery <andrew@aj.id.au>
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <inttypes.h>
> +#include "hw/misc/aspeed_scu.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/bitops.h"
> +#include "trace.h"
> +
> +#define TO_REG(offset) ((offset) >> 2)
> +
> +#define PROT_KEY             TO_REG(0x00)
> +#define SYS_RST_CTRL         TO_REG(0x04)
> +#define CLK_SEL              TO_REG(0x08)
> +#define CLK_STOP_CTRL        TO_REG(0x0C)
> +#define FREQ_CNTR_CTRL       TO_REG(0x10)
> +#define FREQ_CNTR_EVAL       TO_REG(0x14)
> +#define IRQ_CTRL             TO_REG(0x18)
> +#define D2PLL_PARAM          TO_REG(0x1C)
> +#define MPLL_PARAM           TO_REG(0x20)
> +#define HPLL_PARAM           TO_REG(0x24)
> +#define FREQ_CNTR_RANGE      TO_REG(0x28)
> +#define MISC_CTRL1           TO_REG(0x2C)
> +#define PCI_CTRL1            TO_REG(0x30)
> +#define PCI_CTRL2            TO_REG(0x34)
> +#define PCI_CTRL3            TO_REG(0x38)
> +#define SYS_RST_STATUS       TO_REG(0x3C)
> +#define SOC_SCRATCH1         TO_REG(0x40)
> +#define SOC_SCRATCH2         TO_REG(0x44)
> +#define MAC_CLK_DELAY        TO_REG(0x48)
> +#define MISC_CTRL2           TO_REG(0x4C)
> +#define VGA_SCRATCH1         TO_REG(0x50)
> +#define VGA_SCRATCH2         TO_REG(0x54)
> +#define VGA_SCRATCH3         TO_REG(0x58)
> +#define VGA_SCRATCH4         TO_REG(0x5C)
> +#define VGA_SCRATCH5         TO_REG(0x60)
> +#define VGA_SCRATCH6         TO_REG(0x64)
> +#define VGA_SCRATCH7         TO_REG(0x68)
> +#define VGA_SCRATCH8         TO_REG(0x6C)
> +#define HW_STRAP1            TO_REG(0x70)
> +#define RNG_CTRL             TO_REG(0x74)
> +#define RNG_DATA             TO_REG(0x78)
> +#define SILICON_REV          TO_REG(0x7C)
> +#define PINMUX_CTRL1         TO_REG(0x80)
> +#define PINMUX_CTRL2         TO_REG(0x84)
> +#define PINMUX_CTRL3         TO_REG(0x88)
> +#define PINMUX_CTRL4         TO_REG(0x8C)
> +#define PINMUX_CTRL5         TO_REG(0x90)
> +#define PINMUX_CTRL6         TO_REG(0x94)
> +#define WDT_RST_CTRL         TO_REG(0x9C)
> +#define PINMUX_CTRL7         TO_REG(0xA0)
> +#define PINMUX_CTRL8         TO_REG(0xA4)
> +#define PINMUX_CTRL9         TO_REG(0xA8)
> +#define WAKEUP_EN            TO_REG(0xC0)
> +#define WAKEUP_CTRL          TO_REG(0xC4)
> +#define HW_STRAP2            TO_REG(0xD0)
> +#define FREE_CNTR4           TO_REG(0xE0)
> +#define FREE_CNTR4_EXT       TO_REG(0xE4)
> +#define CPU2_CTRL            TO_REG(0x100)
> +#define CPU2_BASE_SEG1       TO_REG(0x104)
> +#define CPU2_BASE_SEG2       TO_REG(0x108)
> +#define CPU2_BASE_SEG3       TO_REG(0x10C)
> +#define CPU2_BASE_SEG4       TO_REG(0x110)
> +#define CPU2_BASE_SEG5       TO_REG(0x114)
> +#define CPU2_CACHE_CTRL      TO_REG(0x118)
> +#define UART_HPLL_CLK        TO_REG(0x160)
> +#define PCIE_CTRL            TO_REG(0x180)
> +#define BMC_MMIO_CTRL        TO_REG(0x184)
> +#define RELOC_DECODE_BASE1   TO_REG(0x188)
> +#define RELOC_DECODE_BASE2   TO_REG(0x18C)
> +#define MAILBOX_DECODE_BASE  TO_REG(0x190)
> +#define SRAM_DECODE_BASE1    TO_REG(0x194)
> +#define SRAM_DECODE_BASE2    TO_REG(0x198)
> +#define BMC_REV              TO_REG(0x19C)
> +#define BMC_DEV_ID           TO_REG(0x1A4)
> +
> +#define SCU_KEY 0x1688A8A8
> +#define SCU_IO_REGION_SIZE 0x20000

> +
> +static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    AspeedSCUState *s = ASPEED_SCU(opaque);
> +
> +    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +    switch (offset) {
> +    case WAKEUP_EN:

WAKEUP_EN is defined as TO_REG(something) so you can't use it in
a case statement switching on an offset.

> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +
> +    return s->regs[TO_REG(offset)];
> +}
> +
> +static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size)
> +{
> +    AspeedSCUState *s = ASPEED_SCU(opaque);
> +
> +    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    if (offset > PROT_KEY && offset < CPU2_BASE_SEG1 &&
> +            s->regs[TO_REG(PROT_KEY)] != SCU_KEY) {

PROT_KEY is defined above as TO_REG(0x00), so it's not
an offset and using it in comparisons against offset and
applying TO_REG() to it again doesn't seem right.
Similarly with CPU2_BASE_SEG1, which is more important since
it's not zero...

> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
> +        return;
> +    }
> +
> +    trace_aspeed_scu_write(offset, size, data);
> +
> +    switch (offset) {
> +    case FREQ_CNTR_EVAL:
> +    case VGA_SCRATCH1 ... VGA_SCRATCH8:
> +    case RNG_DATA:
> +    case SILICON_REV:
> +    case FREE_CNTR4:
> +    case FREE_CNTR4_EXT:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    s->regs[TO_REG(offset)] = (uint32_t) data;

This cast is unnecessary.

> +}
> +
> +static const MemoryRegionOps aspeed_scu_ops = {
> +    .read = aspeed_scu_read,
> +    .write = aspeed_scu_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .valid.unaligned = false,
> +};
> +
> +static void aspeed_scu_reset(DeviceState *dev)
> +{
> +    AspeedSCUState *s = ASPEED_SCU(dev);
> +    const uint32_t *reset;
> +
> +    switch (s->silicon_rev) {
> +    case 0x02000303U:
> +        reset = ast2400_resets;
> +        break;

default:
    g_assert_not_reached();

or the compiler will probably complain that you might
be using reset uninitialized.

> +    }
> +
> +    memcpy(s->regs, reset, sizeof(s->regs));
> +    s->regs[SILICON_REV] = s->silicon_rev;
> +    s->regs[HW_STRAP1] = s->hw_strap1;
> +    s->regs[HW_STRAP2] = s->hw_strap2;
> +}
> +
> +static void aspeed_scu_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedSCUState *s = ASPEED_SCU(dev);

You should sanity check your properties here, and
fail the realize if they aren't valid values.

> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_scu_ops, s,
> +                          TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
> +
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}

> diff --git a/trace-events b/trace-events
> index 9d76de85749d..1b5fd602903c 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -156,3 +156,6 @@ memory_region_tb_write(int cpu_index, uint64_t addr, uint64_t value, unsigned si
>  #
>  # Targets: TCG(all)
>  disable vcpu tcg guest_mem_before(TCGv vaddr, uint8_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
> +
> +# hw/misc/aspeed_scu.c
> +aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
> --

This should be in hw/misc/trace-events now -- we've split the
big trace-events file into pieces.

thanks
-- PMM
