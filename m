Received: by 10.25.205.13 with SMTP id d13csp2191680lfg;
        Tue, 13 Dec 2016 05:13:26 -0800 (PST)
X-Received: by 10.200.38.177 with SMTP id 46mr66888394qto.107.1481634806647;
        Tue, 13 Dec 2016 05:13:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l12si28161370qtf.46.2016.12.13.05.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 05:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGmtX-0004b6-Sf
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 08:13:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmtQ-0004a8-AX
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 08:13:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmtN-00079c-4j
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 08:13:16 -0500
Received: from mail-vk0-f54.google.com ([209.85.213.54]:33254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGmtM-00079U-VA
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 08:13:13 -0500
Received: by mail-vk0-f54.google.com with SMTP id 137so60368306vkl.0
	for <qemu-arm@nongnu.org>; Tue, 13 Dec 2016 05:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CHnA2us5haThWPu4X6N3mH/oLgOFcH2I6Vy/VuJDkgY=;
	b=allgBNNBCPLhc/ITY0L2Owd3uNGkJM8SZsmfdNXEXQlwhvKu7f5V0xQo4ypgz729qe
	xfe1ZC5B7AQ+iNZ0B9yNJ7HKTz59aWkO+XzYyYqu3GQ4BkkxC2o1USv7qKZw+tz8PcnB
	8qcuymDc1+QZC9Yb7rPOmGydREojJoVuQmv2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CHnA2us5haThWPu4X6N3mH/oLgOFcH2I6Vy/VuJDkgY=;
	b=NG6hVS2jdcrnNbhFM+/dyHKU2TXufwQZjaxjo6E0RVp32zkW3c9NBxwudvHitKyfW7
	5dZS08mrTksUPl9vR2jk/4kPihzCnD9FiqxrwsZj6x78csxT7deoTyYfdOcc8lMpOfxn
	OTy6oSvQb/uVOcWd6FCqD39SbaQWrdrg2KAID3iRNSxNiq+8YfQY5VHfa7slQf8d0gb4
	h09b0dFfjLztJeHcV1NLxZi/910ZUvr1bO7ld5Nj4odJL6y6su8C5iWCuC/CLY7dGCsj
	s5z8qOUr7ssVo0M0AWWFwULNDR91nVqBac6PKksm8b0x2DcR4Sde55iueHP2exFSjSNF
	Js2A==
X-Gm-Message-State: AKaTC01vXMnmkiB2WsmrHhw+EQHQKOq6bMKBE9UNvTGWRabpJjbxrIg8zgij1IyzamkFWM8gSLrh9fAUqHs4LqX7
X-Received: by 10.159.48.215 with SMTP id k23mr78010566uab.42.1481634732031;
	Tue, 13 Dec 2016 05:12:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 13 Dec 2016 05:11:51 -0800 (PST)
In-Reply-To: <71bc12badf4f3125765146c21b4976b1d07dce46.1478566669.git.alistair.francis@xilinx.com>
References: <cover.1478566669.git.alistair.francis@xilinx.com>
	<71bc12badf4f3125765146c21b4976b1d07dce46.1478566669.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2016 13:11:51 +0000
Message-ID: <CAFEAcA9vrhPyHbpWqxjS167f_aG-NRf7EVms=dg6ULah_fwmgw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.54
Subject: Re: [Qemu-arm] [PATCH v2 1/2] arm_generic_timer: Add the ARM
 Generic Timer
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Di+77wIfaGGo

On 8 November 2016 at 00:58, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Add the ARM generic timer. This allows the guest to poll the timer for
> values and also supports secure writes only.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> V2:
>  - Fix couter/counter typo
>
>  hw/timer/Makefile.objs               |   1 +
>  hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
>  include/hw/timer/arm_generic_timer.h |  60 ++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 hw/timer/arm_generic_timer.c
>  create mode 100644 include/hw/timer/arm_generic_timer.h

I can't quite seem to make this line up with the spec in the v8
ARM ARM (chapter 11 "System Level Implementation of the Generic
Timer"). The generic timer documented there looks quite like this,
but has extra ID registers at 0xFD0..0xFFC which this code doesn't
implement, and also has the "CNTReadBase" memory map (which
exposes just the count value and ID registers) as well as the
"CNTControlBase" map that looks like what you have here.
(The register names here differ from the conventions in the
ARM ARM too.)

Is this code trying to implement that Generic Timer, or something
else with a similar name?

> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 7ba8c23..f88c468 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
>  common-obj-$(CONFIG_IMX) += imx_gpt.o
>  common-obj-$(CONFIG_LM32) += lm32_timer.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
> +common-obj-$(CONFIG_XLNX_ZYNQMP) += arm_generic_timer.o

If this is really generic I think it ought to have its own
CONFIG_foo rather than using the XLNX_ZYNQMP symbol.

>
>  obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o

> +static uint64_t counter_low_value_postr(RegisterInfo *reg, uint64_t val64)
> +{
> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
> +    uint64_t current_ticks, total_ticks;
> +    uint32_t low_ticks;
> +
> +    if (s->enabled) {
> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> +                                 NANOSECONDS_PER_SECOND, 1000000);
> +        total_ticks = current_ticks - s->tick_offset;
> +        low_ticks = (uint32_t) total_ticks;
> +    } else {
> +        /* Timer is disabled, return the time when it was disabled */
> +        low_ticks = (uint32_t) s->tick_offset;
> +    }
> +
> +    return low_ticks;
> +}
> +
> +static uint64_t counter_high_value_postr(RegisterInfo *reg, uint64_t val64)
> +{
> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
> +    uint64_t current_ticks, total_ticks;
> +    uint32_t high_ticks;
> +
> +    if (s->enabled) {
> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> +                                 NANOSECONDS_PER_SECOND, 1000000);
> +        total_ticks = current_ticks - s->tick_offset;
> +        high_ticks = (uint32_t) (total_ticks >> 32);
> +    } else {
> +        /* Timer is disabled, return the time when it was disabled */
> +        high_ticks = (uint32_t) (s->tick_offset >> 32);
> +    }
> +
> +    return high_ticks;

These two functions are very similar and would benefit from
being refactored to call a utility function that just returned
the 64-bit count.

thanks
-- PMM
