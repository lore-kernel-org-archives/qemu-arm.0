Received: by 10.103.86.15 with SMTP id k15csp1572296vsb;
        Fri, 16 Dec 2016 13:04:24 -0800 (PST)
X-Received: by 10.200.43.245 with SMTP id n50mr4642019qtn.224.1481922264742;
        Fri, 16 Dec 2016 13:04:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si4135503qte.286.2016.12.16.13.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 13:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHzfy-0005FW-9W
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 16:04:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cHzfo-00050u-AW
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 16:04:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cHzfn-0006re-5e
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 16:04:12 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cHzfk-0006ow-E6; Fri, 16 Dec 2016 16:04:08 -0500
Received: by mail-oi0-x242.google.com with SMTP id m75so11720626oig.1;
	Fri, 16 Dec 2016 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=DKjXktOJb5xHS/miJiwK/CThun9A7IvGxaVV9vOUQA0=;
	b=WM02k67D5DJvwbkI/GbuZ3VEP15mCkge71CUEMt9mGUmahADL5IlYS3omAdks6lrYW
	7LsYMheYVAZbvZbYuQOE0TgYjhlX8M0n8AVVLaWIM2CvEAIbnELuFF9cW1TPrJRPl/qn
	1GDQuynbTtWGW7SQdKUi7DtCczmForn2o0n12UEASY5VRVypfhJ2/OLTopDNMZmD2dsH
	E9geV+TlU6zJQRIBKUb8IO127LK0KfLcLXD62Dg9cR34Myh59iaMvzXXIhOyJuvdpjGa
	eDG6GldqeZG/G5caqyqOFN9w+Gsf1Gkw/g5OdDg4QXOBXijHDdKaCAl3Ll2qGAVtCma/
	OrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=DKjXktOJb5xHS/miJiwK/CThun9A7IvGxaVV9vOUQA0=;
	b=GcL5aSsYlXVrXbmlMfGvRZx88LygQjXEnGsfTbbKzDXKzVliq3oVhfoujTA0ZPx8o3
	pm6qU+s6KYm4U59+vXvp+Z2gPRzx17pK5wUaXq/NXO1nO25RmfPHZnMThNsX21+LPn2r
	h6XodFKOnHXk2ZlJGdaMpATctvans6Ihw0BTz5JaeXuIXs8ZszEoTJWOpG1YbPpo+/tQ
	FbSjVDmiLg8q+TrAK0qDF57p7c+BaW/UH9MLYKrFyUBi1Osc78qOPgB3UlGeJjBQDUYs
	ui1HwXrZBLs5Uh+SJnH+05X2Yn3Tk1CeR2L56apyeL64PuywgXvj2qiWeT/LnmAW4BUH
	1nvA==
X-Gm-Message-State: AKaTC03AUpPy1QxOOBUX94SCTL7WDagxxB5+bA4QZClPEdXjSsA4GdazuyEo0b4bRfUHfzZ5cYNiY3MZnG3e0A==
X-Received: by 10.157.27.218 with SMTP id v26mr3525108otv.218.1481922246139;
	Fri, 16 Dec 2016 13:04:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Fri, 16 Dec 2016 13:03:35 -0800 (PST)
In-Reply-To: <CAFEAcA9vrhPyHbpWqxjS167f_aG-NRf7EVms=dg6ULah_fwmgw@mail.gmail.com>
References: <cover.1478566669.git.alistair.francis@xilinx.com>
	<71bc12badf4f3125765146c21b4976b1d07dce46.1478566669.git.alistair.francis@xilinx.com>
	<CAFEAcA9vrhPyHbpWqxjS167f_aG-NRf7EVms=dg6ULah_fwmgw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 16 Dec 2016 13:03:35 -0800
X-Google-Sender-Auth: sroMNWO5pdYpfNgTYxJENaqj36A
Message-ID: <CAKmqyKOY4ZZrRDcp29QWszAJw-pTrasFUq94Xbm5YqrxFgfCaw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
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
Cc: =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BlY/O0i4eTvJ

On Tue, Dec 13, 2016 at 5:11 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 8 November 2016 at 00:58, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> Add the ARM generic timer. This allows the guest to poll the timer for
>> values and also supports secure writes only.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>> V2:
>>  - Fix couter/counter typo
>>
>>  hw/timer/Makefile.objs               |   1 +
>>  hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
>>  include/hw/timer/arm_generic_timer.h |  60 ++++++++++
>>  3 files changed, 277 insertions(+)
>>  create mode 100644 hw/timer/arm_generic_timer.c
>>  create mode 100644 include/hw/timer/arm_generic_timer.h
>
> I can't quite seem to make this line up with the spec in the v8
> ARM ARM (chapter 11 "System Level Implementation of the Generic
> Timer"). The generic timer documented there looks quite like this,
> but has extra ID registers at 0xFD0..0xFFC which this code doesn't
> implement, and also has the "CNTReadBase" memory map (which
> exposes just the count value and ID registers) as well as the
> "CNTControlBase" map that looks like what you have here.
> (The register names here differ from the conventions in the
> ARM ARM too.)

Of course they don't line up :(

I wrote it based off the Xilinx documentation, I (wrongly) assumed
that we would follow the normal convention but apparently not.

>
> Is this code trying to implement that Generic Timer, or something
> else with a similar name?

I'm not sure now which one it is.

I will dig into this and hopefully can respin this based on what is in
the ARM ARM.

>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index 7ba8c23..f88c468 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
>>  common-obj-$(CONFIG_IMX) += imx_gpt.o
>>  common-obj-$(CONFIG_LM32) += lm32_timer.o
>>  common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
>> +common-obj-$(CONFIG_XLNX_ZYNQMP) += arm_generic_timer.o
>
> If this is really generic I think it ought to have its own
> CONFIG_foo rather than using the XLNX_ZYNQMP symbol.

Yes, Fred pointed that out as well. I will fix that up in the next version.

>
>>
>>  obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
>>  obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
>
>> +static uint64_t counter_low_value_postr(RegisterInfo *reg, uint64_t val64)
>> +{
>> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
>> +    uint64_t current_ticks, total_ticks;
>> +    uint32_t low_ticks;
>> +
>> +    if (s->enabled) {
>> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
>> +                                 NANOSECONDS_PER_SECOND, 1000000);
>> +        total_ticks = current_ticks - s->tick_offset;
>> +        low_ticks = (uint32_t) total_ticks;
>> +    } else {
>> +        /* Timer is disabled, return the time when it was disabled */
>> +        low_ticks = (uint32_t) s->tick_offset;
>> +    }
>> +
>> +    return low_ticks;
>> +}
>> +
>> +static uint64_t counter_high_value_postr(RegisterInfo *reg, uint64_t val64)
>> +{
>> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
>> +    uint64_t current_ticks, total_ticks;
>> +    uint32_t high_ticks;
>> +
>> +    if (s->enabled) {
>> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
>> +                                 NANOSECONDS_PER_SECOND, 1000000);
>> +        total_ticks = current_ticks - s->tick_offset;
>> +        high_ticks = (uint32_t) (total_ticks >> 32);
>> +    } else {
>> +        /* Timer is disabled, return the time when it was disabled */
>> +        high_ticks = (uint32_t) (s->tick_offset >> 32);
>> +    }
>> +
>> +    return high_ticks;
>
> These two functions are very similar and would benefit from
> being refactored to call a utility function that just returned
> the 64-bit count.

Good point.

Thanks,

Alistair

>
> thanks
> -- PMM
