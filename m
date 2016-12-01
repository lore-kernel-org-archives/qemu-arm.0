Received: by 10.25.159.131 with SMTP id i125csp660129lfe;
        Wed, 30 Nov 2016 21:54:44 -0800 (PST)
X-Received: by 10.55.165.129 with SMTP id o123mr32295359qke.32.1480571684009;
        Wed, 30 Nov 2016 21:54:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q13si32199561qta.232.2016.11.30.21.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 21:54:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ozlabs-ru.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCKKQ-0006vJ-K0
	for alex.bennee@linaro.org; Thu, 01 Dec 2016 00:54:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCKJU-0006bm-1P
	for qemu-devel@nongnu.org; Thu, 01 Dec 2016 00:53:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCKJP-0008LQ-G6
	for qemu-devel@nongnu.org; Thu, 01 Dec 2016 00:53:44 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:33396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1cCKJO-0008Ki-QA
	for qemu-devel@nongnu.org; Thu, 01 Dec 2016 00:53:39 -0500
Received: by mail-pg0-x243.google.com with SMTP id 3so3537594pgd.0
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 21:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AHQYdx5oIgc6aMF73ekhv4OowGYBLTo0Q/4A0ZVONJ4=;
	b=Ifwup+Fy14zAc4FMS1lv8JIEmdB2UdagX9s5rkO3II25ehHMCocza+Z5ISccwDc1NB
	AGeJkrguVTvpVHG6VTpNi4iRqvdkXbrAoHjLCOAQhNXAH30R6oXu8cDY+V9NoXVkR52c
	Hy6VCauWTR0j13oOFsGBvnJ+kjwU6WihqKmxCuxk0ihOeXHy5K1uDoTH65dkCK5+Klj3
	us5vSimxQ3eqgbsC+IxYumJvuIhir+SRRaZPqoyo5HKkzEE2D+jgbJDjz0ASkg10Fsf9
	TkPF5WSRTt2Rk1pHTrWy6YhHMZ4Ynp0UVXYSEjrm1y6yx5p/e6jHeySERkAxmzCuuBNJ
	6t5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AHQYdx5oIgc6aMF73ekhv4OowGYBLTo0Q/4A0ZVONJ4=;
	b=IRV/1ZeZJnbh93QiFbDpV21QM5/vbliwXW5kbsOhk2xSU0P2aaYCBkFdtoJI6SQH0E
	9qxCZUcDTHrl+Z75zSwe/ANsL+KMmoM9HRJoP4S3zpMD5EFBrvdiofzneeO7WCNJ+efL
	WIFWPJcQAHj7evDsGKqydrwNA5GFqqAoYhMlcqQkWFyO7BqRroFlTMYIT5DqQaY8APsw
	Qiu/yFjCbf4QReAhcLbB5OdmAd+IagvEKAQh9vF/7zfToeQuSk3F2BoeXU2bRknSL945
	65tW4mTjpbiiDTYimH8h4WjNsJzsTir+WEg6gLiqlr2O9ME/iFyhuMUX3tyqoqPxbBfl
	lYNQ==
X-Gm-Message-State: AKaTC01/W8+3DTyfjKVLmbTTeFNwIlITGuClWUILI/mt5w5QjKItzHrerHX0LJFKYcZB3A==
X-Received: by 10.99.94.194 with SMTP id s185mr66014523pgb.35.1480571616408;
	Wed, 30 Nov 2016 21:53:36 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	13sm107012753pfz.30.2016.11.30.21.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 21:53:35 -0800 (PST)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-5-alastair@au1.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <6c328f0d-af92-4732-b1e2-5255c91536fc@ozlabs.ru>
Date: Thu, 1 Dec 2016 16:53:28 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161130053629.23340-5-alastair@au1.ibm.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-devel] [PATCH v2 4/6] hw/timer: Add Epson RX8900 RTC
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Chris Smart <chris@distroguy.com>,
	Joel Stanley <joel@jms.id.au>, Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cP4VwJG2iMrn

On 30/11/16 16:36, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch adds support for the Epson RX8900 I2C RTC.
> 
> The following chip features are implemented:
>  - RTC (wallclock based, ptimer 10x oversampling to pick up
> 	wallclock transitions)
>  - Time update interrupt (per second/minute, wallclock based)
>  - Alarms (wallclock based)
>  - Temperature (set via a property)
>  - Countdown timer (emulated clock via ptimer)
>  - FOUT via GPIO (emulated clock via ptimer)
> 
> The following chip features are unimplemented:
>  - Low voltage detection
>  - i2c timeout
> 
> The implementation exports the following named GPIOs:
> rx8900-interrupt-out
> rx8900-fout-enable
> rx8900-fout
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Signed-off-by: Chris Smart <chris@distroguy.com>
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/timer/Makefile.objs          |   2 +
>  hw/timer/rx8900.c               | 890 ++++++++++++++++++++++++++++++++++++++++
>  hw/timer/rx8900_regs.h          | 139 +++++++
>  hw/timer/trace-events           |  31 ++
>  5 files changed, 1063 insertions(+)
>  create mode 100644 hw/timer/rx8900.c
>  create mode 100644 hw/timer/rx8900_regs.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 6de3e16..adb600e 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -29,6 +29,7 @@ CONFIG_SMC91C111=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
>  CONFIG_DS1338=y
> +CONFIG_RX8900=y
>  CONFIG_PFLASH_CFI01=y
>  CONFIG_PFLASH_CFI02=y
>  CONFIG_MICRODRIVE=y
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 7ba8c23..fa028ac 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -3,6 +3,7 @@ common-obj-$(CONFIG_ARM_MPTIMER) += arm_mptimer.o
>  common-obj-$(CONFIG_A9_GTIMER) += a9gtimer.o
>  common-obj-$(CONFIG_CADENCE) += cadence_ttc.o
>  common-obj-$(CONFIG_DS1338) += ds1338.o
> +common-obj-$(CONFIG_RX8900) += rx8900.o
>  common-obj-$(CONFIG_HPET) += hpet.o
>  common-obj-$(CONFIG_I8254) += i8254_common.o i8254.o
>  common-obj-$(CONFIG_M48T59) += m48t59.o
> @@ -17,6 +18,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
>  common-obj-$(CONFIG_IMX) += imx_gpt.o
>  common-obj-$(CONFIG_LM32) += lm32_timer.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
> +common-obj-$(CONFIG_RX8900) += rx8900.o
>  
>  obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
> diff --git a/hw/timer/rx8900.c b/hw/timer/rx8900.c
> new file mode 100644
> index 0000000..e634819
> --- /dev/null
> +++ b/hw/timer/rx8900.c
> @@ -0,0 +1,890 @@
> +/*
> + * Epson RX8900SA/CE Realtime Clock Module
> + *
> + * Copyright (c) 2016 IBM Corporation
> + * Authors:
> + *  Alastair D'Silva <alastair@d-silva.org>
> + *  Chris Smart <chris@distroguy.com>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Datasheet available at:
> + *  https://support.epson.biz/td/api/doc_check.php?dl=app_RX8900CE&lang=en
> + *
> + * Not implemented:
> + *  Implement i2c timeout
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/timer/rx8900_regs.h"
> +#include "hw/ptimer.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/bcd.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "trace.h"
> +
> + #include <sys/time.h>
> +
> + #include <execinfo.h>

Not needed empty lines and spaces before "#include".


> +
> +#define TYPE_RX8900 "rx8900"
> +#define RX8900(obj) OBJECT_CHECK(RX8900State, (obj), TYPE_RX8900)
> +
> +typedef struct RX8900State {
> +    I2CSlave parent_obj;
> +
> +    ptimer_state *sec_timer; /* triggered once per second */
> +    ptimer_state *fout_timer;
> +    ptimer_state *countdown_timer;
> +    bool fout;

Is this "FOE" on the chip?


> +    int64_t offset;
> +    uint8_t weekday; /* Saved for deferred offset calculation, 0-6 */
> +    uint8_t wday_offset;
> +    uint8_t nvram[RX8900_NVRAM_SIZE];
> +    int32_t ptr; /* Wrapped to stay within RX8900_NVRAM_SIZE */

It is rather "nvram_offset" than some pointer.


> +    bool addr_byte;
> +    uint8_t last_interrupt_seconds;

s/last_interrupt_seconds/last_update_interrupt_seconds/


> +    uint8_t last_update_interrupt_minutes;
> +    double supply_voltage;
> +    qemu_irq interrupt_pin;

Is this "INT" on the chip?

> +    qemu_irq fout_pin;

Is this "FOUT" on the chip?


> +} RX8900State;
> +
> +static const VMStateDescription vmstate_rx8900 = {
> +    .name = "rx8900",
> +    .version_id = 2,


vmstate version is 2 for a brand new device means that there is another
device which can migrate to it? I think you want version_id=1 and get rid
of _V below.



> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_I2C_SLAVE(parent_obj, RX8900State),
> +        VMSTATE_PTIMER(sec_timer, RX8900State),
> +        VMSTATE_PTIMER(fout_timer, RX8900State),
> +        VMSTATE_PTIMER(countdown_timer, RX8900State),
> +        VMSTATE_BOOL(fout, RX8900State),
> +        VMSTATE_INT64(offset, RX8900State),
> +        VMSTATE_UINT8_V(weekday, RX8900State, 2),
> +        VMSTATE_UINT8_V(wday_offset, RX8900State, 2),
> +        VMSTATE_UINT8_ARRAY(nvram, RX8900State, RX8900_NVRAM_SIZE),
> +        VMSTATE_INT32(ptr, RX8900State),
> +        VMSTATE_BOOL(addr_byte, RX8900State),
> +        VMSTATE_UINT8_V(last_interrupt_seconds, RX8900State, 2),
> +        VMSTATE_UINT8_V(last_update_interrupt_minutes, RX8900State, 2),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void rx8900_reset(DeviceState *dev);
> +static void disable_countdown_timer(RX8900State *s);

This one not needed.


> +static void enable_countdown_timer(RX8900State *s);
> +static void disable_timer(RX8900State *s);
> +static void enable_timer(RX8900State *s);

From a quick look, all these functions could be moved right here, cannot they?


> +
> +static void capture_current_time(RX8900State *s)
> +{
> +    /* Capture the current time into the secondary registers
> +     * which will be actually read by the data transfer operation.
> +     */
> +    struct tm now;
> +    qemu_get_timedate(&now, s->offset);
> +    s->nvram[SECONDS] = to_bcd(now.tm_sec);
> +    s->nvram[MINUTES] = to_bcd(now.tm_min);
> +    s->nvram[HOURS] = to_bcd(now.tm_hour);
> +
> +    s->nvram[WEEKDAY] = 0x01 << ((now.tm_wday + s->wday_offset) % 7);

s/0x01/1/ ?


> +    s->nvram[DAY] = to_bcd(now.tm_mday);
> +    s->nvram[MONTH] = to_bcd(now.tm_mon + 1);
> +    s->nvram[YEAR] = to_bcd(now.tm_year % 100);
> +
> +    s->nvram[EXT_SECONDS] = s->nvram[SECONDS];
> +    s->nvram[EXT_MINUTES] = s->nvram[MINUTES];
> +    s->nvram[EXT_HOURS] = s->nvram[HOURS];
> +    s->nvram[EXT_WEEKDAY] = s->nvram[WEEKDAY];
> +    s->nvram[EXT_DAY] = s->nvram[DAY];
> +    s->nvram[EXT_MONTH] = s->nvram[MONTH];
> +    s->nvram[EXT_YEAR] = s->nvram[YEAR];
> +
> +    trace_rx8900_capture_current_time(now.tm_hour, now.tm_min, now.tm_sec,
> +            (now.tm_wday + s->wday_offset) % 7,
> +            now.tm_mday, now.tm_mon, now.tm_year + 1900,
> +            s->nvram[HOURS], s->nvram[MINUTES], s->nvram[SECONDS],
> +            s->nvram[WEEKDAY], s->nvram[DAY], s->nvram[MONTH], s->nvram[YEAR]);
> +}
> +
> +/**
> + * Increment the internal register pointer, dealing with wrapping
> + * @param s the RTC to operate on
> + */
> +static void inc_regptr(RX8900State *s)
> +{
> +    /* The register pointer wraps around after 0x1F
> +     */
> +    s->ptr = (s->ptr + 1) & (RX8900_NVRAM_SIZE - 1);
> +    trace_rx8900_regptr_update(s->ptr);
> +
> +    if (s->ptr == 0x00) {


Magic constant 0x00. Is this offset in nvram? Then make it just 0,
otherwise it looks like a mask.


> +        trace_rx8900_regptr_overflow();
> +        capture_current_time(s);
> +    }
> +}
> +
> +/**
> + * Receive an I2C Event
> + * @param i2c the i2c device instance
> + * @param event the event to handle
> + */
> +static void rx8900_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    RX8900State *s = RX8900(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        /* In h/w, time capture happens on any START condition, not just a
> +         * START_RECV. For the emulation, it doesn't actually matter,
> +         * since a START_RECV has to occur before the data can be read.
> +         */
> +        capture_current_time(s);
> +        break;
> +    case I2C_START_SEND:
> +        s->addr_byte = true;
> +        break;
> +    case I2C_FINISH:
> +        if (s->weekday < 7) {
> +            /* We defer the weekday calculation as it is handed to us before
> +             * the date has been updated. If we calculate the weekday offset
> +             * when it is passed to us, we will incorrectly determine it
> +             * based on the current emulated date, rather than the date that
> +             * has been written.
> +             */

The RX8900 spec does not use word "offset" at all so I cannot make sense
from the paragraph above - why exactly do you need 2 offsets ("offset" and
"wday_offset") and why weekday cannot be calculated when it is needed from
the current time + "offset"?


> +            struct tm now;
> +            qemu_get_timedate(&now, s->offset);
> +
> +            s->wday_offset = (s->weekday - now.tm_wday + 7) % 7;
> +
> +            trace_rx8900_event_weekday(s->weekday, BIT(s->weekday),
> +                    s->wday_offset);
> +
> +            s->weekday = 7;

I'd rather use 0xff (defined in a macro) as an invalid weekday.


> +        }
> +        break;
> +
> +    default:
> +        break;


Not needed "default" case.

> +    }
> +}
> +
> +/**
> + * Perform an i2c receive action
> + * @param i2c the i2c device instance
> + * @return the value of the current register
> + * @post the internal register pointer is incremented
> + */
> +static int rx8900_recv(I2CSlave *i2c)
> +{
> +    RX8900State *s = RX8900(i2c);
> +    uint8_t res = s->nvram[s->ptr];
> +    trace_rx8900_read_register(s->ptr, res);
> +    inc_regptr(s);
> +    return res;
> +}
> +
> +/**
> + * Validate the extension register and perform actions based on the bits
> + * @param s the RTC to operate on
> + * @param data the new data for the extension register
> + */
> +static void update_extension_register(RX8900State *s, uint8_t data)
> +{
> +    if (data & EXT_MASK_TEST) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Test bit is enabled but is forbidden by the manufacturer");

QEMU uses indents under opening bracket.

In general, I use vim with
set expandtab
set tabstop=4
set shiftwidth=4
set cino=:0,(0


The coding style also says about 80 characters limit (and some of your
patched failed this) and makes no exception, however people often follow
the kernel rule not to split strings even if they do not fit 80 characters
limit.


And please run ./scripts/checkpatch.pl on patches before posting, 3/6 and
5/6 failed because of too long lines.


> +    }
> +
> +    if ((data ^ s->nvram[EXTENSION_REGISTER]) &
> +            (EXT_MASK_FSEL0 | EXT_MASK_FSEL1)) {
> +        uint8_t fsel = (data & (EXT_MASK_FSEL0 | EXT_MASK_FSEL1))
> +                >> EXT_REG_FSEL0;
> +        /* FSELx has changed */
> +        switch (fsel) {
> +        case 0x01:

Magic value of 0x01, 0x02 here and below.


> +            trace_rx8900_set_fout(1024);
> +            ptimer_set_limit(s->fout_timer, 32, 1);
> +            break;
> +        case 0x02:
> +            trace_rx8900_set_fout(1);
> +            ptimer_set_limit(s->fout_timer, 32768, 1);
> +            break;
> +        default:
> +            trace_rx8900_set_fout(32768);
> +            ptimer_set_limit(s->fout_timer, 1, 1);
> +            break;
> +        }
> +    }
> +
> +    if ((data ^ s->nvram[EXTENSION_REGISTER]) &
> +            (EXT_MASK_TSEL0 | EXT_MASK_TSEL1)) {
> +        uint8_t tsel = (data & (EXT_MASK_TSEL0 | EXT_MASK_TSEL1))
> +                >> EXT_REG_TSEL0;
> +        /* TSELx has changed */
> +        switch (tsel) {
> +        case 0x00:
> +            trace_rx8900_set_countdown_timer(64);
> +            ptimer_set_limit(s->countdown_timer, 4096 / 64, 1);
> +            break;
> +        case 0x01:
> +            trace_rx8900_set_countdown_timer(1);
> +            ptimer_set_limit(s->countdown_timer, 4096, 1);
> +            break;
> +        case 0x02:
> +            trace_rx8900_set_countdown_timer_per_minute();
> +            ptimer_set_limit(s->countdown_timer, 4069 * 60, 1);

s/4069/4096/ ?
And why 4096? Please define it in a macro.


> +            break;
> +        case 0x03:
> +            trace_rx8900_set_countdown_timer(4096);
> +            ptimer_set_limit(s->countdown_timer, 1, 1);
> +            break;
> +        }
> +    }
> +
> +    if (data & EXT_MASK_TE) {
> +        enable_countdown_timer(s);
> +    }
> +
> +    s->nvram[EXTENSION_REGISTER] = data;
> +    s->nvram[EXT_EXTENSION_REGISTER] = data;
> +
> +}
> +/**
> + * Validate the control register and perform actions based on the bits
> + * @param s the RTC to operate on
> + * @param data the new value for the control register
> + */
> +
> +static void update_control_register(RX8900State *s, uint8_t data)
> +{
> +    uint8_t diffmask = ~s->nvram[CONTROL_REGISTER] & data;
> +
> +    if (diffmask & CTRL_MASK_WP0) {
> +        data &= ~CTRL_MASK_WP0;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Attempt to write to write protected bit %d in control register",
> +            CTRL_REG_WP0);
> +    }
> +
> +    if (diffmask & CTRL_MASK_WP1) {
> +        data &= ~CTRL_MASK_WP1;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Attempt to write to write protected bit %d in control register",
> +            CTRL_REG_WP1);
> +    }
> +
> +    if (data & CTRL_MASK_RESET) {
> +        data &= ~CTRL_MASK_RESET;
> +        rx8900_reset(DEVICE(s));
> +    }
> +
> +    if (diffmask & CTRL_MASK_UIE) {
> +        /* Update interrupts were off and are now on */
> +        struct tm now;
> +
> +        trace_rx8900_enable_update_timer();
> +
> +        qemu_get_timedate(&now, s->offset);
> +
> +        s->last_update_interrupt_minutes = now.tm_min;
> +        s->last_interrupt_seconds = now.tm_sec;
> +        enable_timer(s);
> +    }
> +
> +    if (diffmask & CTRL_MASK_AIE) {
> +        /* Alarm interrupts were off and are now on */
> +        struct tm now;
> +
> +        trace_rx8900_enable_alarm();
> +
> +        qemu_get_timedate(&now, s->offset);
> +
> +        s->last_interrupt_seconds = now.tm_sec;


s->last_update_interrupt_minutes is skipped here for a reason?


> +        enable_timer(s);
> +    }
> +
> +    if (!(data & (CTRL_MASK_UIE | CTRL_MASK_AIE))) {
> +        disable_timer(s);
> +    }


Can UIE and AIE be both set? If not, "else" could be used in two "if" above
to document this.



> +
> +    s->nvram[CONTROL_REGISTER] = data;
> +    s->nvram[EXT_CONTROL_REGISTER] = data;
> +}
> +
> +/**
> + * Validate the flag register
> + * @param s the RTC to operate on
> + * @param data the new value for the flag register
> + */
> +static void validate_flag_register(RX8900State *s, uint8_t *data)
> +{
> +    uint8_t diffmask = ~s->nvram[FLAG_REGISTER] & *data;
> +
> +    if (diffmask & FLAG_MASK_VDET) {
> +        *data &= ~FLAG_MASK_VDET;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Only 0 can be written to VDET bit %d in the flag register",
> +            FLAG_REG_VDET);
> +    }
> +
> +    if (diffmask & FLAG_MASK_VLF) {
> +        *data &= ~FLAG_MASK_VLF;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Only 0 can be written to VLF bit %d in the flag register",
> +            FLAG_REG_VLF);
> +    }
> +
> +    if (diffmask & FLAG_MASK_UNUSED_2) {
> +        *data &= ~FLAG_MASK_UNUSED_2;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Only 0 can be written to unused bit %d in the flag register",
> +            FLAG_REG_UNUSED_2);
> +    }
> +
> +    if (diffmask & FLAG_MASK_UNUSED_6) {
> +        *data &= ~FLAG_MASK_UNUSED_6;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Only 0 can be written to unused bit %d in the flag register",
> +            FLAG_REG_UNUSED_6);
> +    }
> +
> +    if (diffmask & FLAG_MASK_UNUSED_7) {
> +        *data &= ~FLAG_MASK_UNUSED_7;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "Only 0 can be written to unused bit %d in the flag register",
> +            FLAG_REG_UNUSED_7);
> +    }
> +}
> +
> +/**
> + * Tick the per second timer (can be called more frequently as it early exits
> + * if the wall clock has not progressed)
> + * @param opaque the RTC to tick
> + */
> +static void rx8900_timer_tick(void *opaque)
> +{
> +    RX8900State *s = (RX8900State *)opaque;
> +    struct tm now;
> +    bool fire_interrupt = false;
> +    bool alarm_week_day_matches;
> +
> +    qemu_get_timedate(&now, s->offset);
> +
> +    if (now.tm_sec == s->last_interrupt_seconds) {
> +        return;
> +    }
> +
> +    s->last_interrupt_seconds = now.tm_sec;
> +
> +    trace_rx8900_tick();
> +
> +    /* Update timer interrupt */
> +    if (s->nvram[CONTROL_REGISTER] & CTRL_MASK_UIE) {
> +        if ((s->nvram[EXTENSION_REGISTER] & EXT_MASK_USEL) &&
> +                now.tm_min != s->last_update_interrupt_minutes) {
> +            s->last_update_interrupt_minutes = now.tm_min;
> +            s->nvram[FLAG_REGISTER] |= FLAG_MASK_UF;
> +            fire_interrupt = true;
> +        } else if (!(s->nvram[EXTENSION_REGISTER] & EXT_MASK_USEL)) {
> +            /* per second update interrupt */
> +            s->nvram[FLAG_REGISTER] |= FLAG_MASK_UF;
> +            fire_interrupt = true;
> +        }
> +    }
> +
> +    /* Alarm interrupt */
> +    alarm_week_day_matches = s->nvram[ALARM_WEEK_DAY] ==
> +            ((s->nvram[EXTENSION_REGISTER] & EXT_MASK_WADA) ?
> +                    to_bcd(now.tm_mday) :
> +                    0x01 << ((now.tm_wday + s->wday_offset) % 7));


0x01 is a mask or enum or just "1" which needs to be shifted?

Also, it is hard to read an expression with "=", "==" and "?", "if" would
be better here imho.


> +
> +    if ((s->nvram[CONTROL_REGISTER] & CTRL_MASK_AIE) && now.tm_sec == 0) {
> +        if (s->nvram[ALARM_MINUTE] == to_bcd(now.tm_min) &&
> +                s->nvram[ALARM_HOUR] == to_bcd(now.tm_hour) &&
> +                alarm_week_day_matches) {

It should be one "if", not two.


> +            trace_rx8900_trigger_alarm();
> +            s->nvram[FLAG_REGISTER] |= FLAG_MASK_AF;
> +            fire_interrupt = true;
> +        }
> +    }
> +
> +    if (fire_interrupt) {
> +        trace_rx8900_fire_interrupt();
> +        qemu_irq_pulse(s->interrupt_pin);
> +    }
> +}
> +
> +/**
> + * Disable the per second timer
> + * @param s the RTC to operate on
> + */
> +static void disable_timer(RX8900State *s)
> +{
> +    trace_rx8900_disable_timer();
> +    ptimer_stop(s->sec_timer);
> +}
> +
> +/**
> + * Enable the per second timer
> + * @param s the RTC to operate on
> + */
> +static void enable_timer(RX8900State *s)
> +{
> +    trace_rx8900_enable_timer();
> +    ptimer_run(s->sec_timer, 0);
> +}
> +
> +/**
> + * Handle FOUT_ENABLE (FOE) line
> + * Enables/disables the FOUT line
> + * @param opaque the device instance
> + * @param n the IRQ number
> + * @param level true if the line has been raised
> + */
> +static void rx8900_fout_enable_handler(void *opaque, int n, int level)
> +{
> +    RX8900State *s = RX8900(opaque);
> +
> +    if (level) {
> +        trace_rx8900_enable_fout();
> +        ptimer_run(s->fout_timer, 0);
> +    } else {
> +        /* disable fout */
> +        trace_rx8900_disable_fout();
> +        ptimer_stop(s->fout_timer);
> +    }
> +}
> +
> +/**
> + * Tick the FOUT timer
> + * @param opaque the device instance
> + */
> +static void rx8900_fout_tick(void *opaque)
> +{
> +    RX8900State *s = (RX8900State *)opaque;
> +
> +    trace_rx8900_fout_toggle();
> +    s->fout = !s->fout;
> +
> +    if (s->fout) {
> +        qemu_irq_raise(s->fout_pin);
> +    } else {
> +        qemu_irq_lower(s->fout_pin);
> +    }
> +}
> +
> +
> +/**
> + * Disable the countdown timer
> + * @param s the RTC to operate on
> + */
> +static void disable_countdown_timer(RX8900State *s)
> +{
> +    trace_rx8900_disable_countdown();
> +    ptimer_stop(s->countdown_timer);
> +}
> +
> +/**
> + * Enable the countdown timer
> + * @param s the RTC to operate on
> + */
> +static void enable_countdown_timer(RX8900State *s)
> +{
> +    trace_rx8900_enable_countdown();
> +    ptimer_run(s->countdown_timer, 0);
> +}
> +
> +/**
> + * Tick the countdown timer
> + * @param opaque the device instance
> + */
> +static void rx8900_countdown_tick(void *opaque)
> +{
> +    RX8900State *s = (RX8900State *)opaque;
> +
> +    uint16_t count = s->nvram[TIMER_COUNTER_0] +

Nit: in cases like this it is usually "|", not "+".


> +            ((s->nvram[TIMER_COUNTER_1] & 0x0F) << 8);
> +    trace_rx8900_countdown_tick(count);
> +    count--;
> +
> +    s->nvram[TIMER_COUNTER_0] = (uint8_t)(count & 0x00ff);
> +    s->nvram[TIMER_COUNTER_1] = (uint8_t)((count & 0x0f00) >> 8);
> +
> +    if (count == 0) {
> +        trace_rx8900_countdown_elapsed();
> +
> +        disable_countdown_timer(s);
> +
> +        s->nvram[FLAG_REGISTER] |= FLAG_MASK_TF;
> +
> +        if (s->nvram[CONTROL_REGISTER] & CTRL_MASK_TIE) {
> +            trace_rx8900_fire_interrupt();
> +            qemu_irq_pulse(s->interrupt_pin);
> +        }
> +    }
> +}
> +
> +/**
> + * Verify the current voltage and raise flags if it is low
> + * @param s the RTC to operate on
> + */
> +static void check_voltage(RX8900State *s)
> +{
> +    if (!(s->nvram[BACKUP_FUNCTION] & BACKUP_MASK_VDETOFF)) {
> +        if (s->supply_voltage < 2.0f) {
> +            s->nvram[FLAG_REGISTER] |= FLAG_MASK_VDET;
> +        }
> +
> +        if (s->supply_voltage < 1.6f) {
> +            s->nvram[FLAG_REGISTER] |= FLAG_MASK_VLF;
> +        }
> +    }
> +}
> +
> +/**
> + * Receive a byte of data from i2c
> + * @param i2c the i2c device that is receiving data
> + * @param data the data that was received
> + */
> +static int rx8900_send(I2CSlave *i2c, uint8_t data)
> +{
> +    RX8900State *s = RX8900(i2c);
> +    struct tm now;
> +
> +    trace_rx8900_i2c_data_receive(data);
> +
> +    if (s->addr_byte) {
> +        s->ptr = data & (RX8900_NVRAM_SIZE - 1);
> +        trace_rx8900_regptr_update(s->ptr);
> +        s->addr_byte = false;
> +        return 0;
> +    }
> +
> +    trace_rx8900_set_register(s->ptr, data);
> +
> +    qemu_get_timedate(&now, s->offset);
> +    switch (s->ptr) {
> +    case SECONDS:
> +    case EXT_SECONDS:
> +        now.tm_sec = from_bcd(data & 0x7f);
> +        s->offset = qemu_timedate_diff(&now);
> +        break;
> +
> +    case MINUTES:
> +    case EXT_MINUTES:
> +        now.tm_min = from_bcd(data & 0x7f);
> +        s->offset = qemu_timedate_diff(&now);
> +        break;
> +
> +    case HOURS:
> +    case EXT_HOURS:
> +        now.tm_hour = from_bcd(data & 0x3f);
> +        s->offset = qemu_timedate_diff(&now);
> +        break;
> +
> +    case WEEKDAY:
> +    case EXT_WEEKDAY: {
> +        int user_wday = ctz32(data);
> +        /* The day field is supposed to contain a value in
> +         * the range 0-6. Otherwise behavior is undefined.
> +         */

> +        switch (data) {
> +        case 0x01:
> +        case 0x02:
> +        case 0x04:
> +        case 0x08:
> +        case 0x10:
> +        case 0x20:
> +        case 0x40:
> +            break;
> +        default:

Instead of the switch:

if (data & 0x80) {

> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "RX8900 - weekday data '%x' is out of range, "
> +                        "undefined behavior will result", data);


btw other cases of switch (s->ptr) do not do such a check, just "&0x7f" or
"&0x3f", why is the weekday case so special?



> +            break;
> +        }
> +        s->weekday = user_wday;
> +        break;
> +    }
> +
> +    case DAY:
> +    case EXT_DAY:
> +        now.tm_mday = from_bcd(data & 0x3f);
> +        s->offset = qemu_timedate_diff(&now);
> +        break;
> +
> +    case MONTH:
> +    case EXT_MONTH:
> +        now.tm_mon = from_bcd(data & 0x1f) - 1;
> +        s->offset = qemu_timedate_diff(&now);
> +        break;
> +
> +    case YEAR:
> +    case EXT_YEAR:
> +        now.tm_year = from_bcd(data) + 100;
> +        s->offset = qemu_timedate_diff(&now);
> +        break;
> +
> +    case EXTENSION_REGISTER:
> +    case EXT_EXTENSION_REGISTER:
> +        update_extension_register(s, data);
> +        break;
> +
> +    case FLAG_REGISTER:
> +    case EXT_FLAG_REGISTER:
> +        validate_flag_register(s, &data);
> +
> +        s->nvram[FLAG_REGISTER] = data;
> +        s->nvram[EXT_FLAG_REGISTER] = data;
> +
> +        check_voltage(s);
> +        break;
> +
> +    case CONTROL_REGISTER:
> +    case EXT_CONTROL_REGISTER:
> +        update_control_register(s, data);
> +        break;
> +
> +    default:
> +        s->nvram[s->ptr] = data;
> +    }
> +
> +    inc_regptr(s);
> +    return 0;
> +}
> +
> +/**
> + * Get the device temperature in Celcius as a property
> + * @param obj the device
> + * @param v
> + * @param name the property name
> + * @param opaque
> + * @param errp an error object to populate on failure
> + */
> +static void rx8900_get_temperature(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    RX8900State *s = RX8900(obj);
> +    double value = (s->nvram[TEMPERATURE] * 2.0f - 187.1f) / 3.218f;
> +
> +    trace_rx8900_read_temperature(s->nvram[TEMPERATURE], value);

Nit: s/read/get/


> +
> +    visit_type_number(v, name, &value, errp);
> +}
> +
> +/**
> + * Set the device temperature in Celcius as a property
> + * @param obj the device
> + * @param v
> + * @param name the property name
> + * @param opaque
> + * @param errp an error object to populate on failure
> + */
> +static void rx8900_set_temperature(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    RX8900State *s = RX8900(obj);
> +    Error *local_err = NULL;
> +    double temp; /* degrees Celcius */
> +    visit_type_number(v, name, &temp, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    if (temp >= 100 || temp < -58) {
> +        error_setg(errp, "value %fœC is out of range", temp);
> +        return;
> +    }
> +
> +    s->nvram[TEMPERATURE] = (uint8_t) ((temp * 3.218f + 187.19f) / 2);
> +
> +    trace_rx8900_set_temperature(s->nvram[TEMPERATURE], temp);
> +}
> +
> +/**
> + * Get the device supply voltage as a property
> + * @param obj the device
> + * @param v
> + * @param name the property name
> + * @param opaque
> + * @param errp an error object to populate on failure
> + */
> +static void rx8900_get_voltage(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    RX8900State *s = RX8900(obj);
> +
> +    visit_type_number(v, name, &s->supply_voltage, errp);


rx8900_get_temperature() got a trace point, this one did not ;)

> +}
> +
> +/**
> + * Set the device supply voltage as a property
> + * @param obj the device
> + * @param v
> + * @param name the property name
> + * @param opaque
> + * @param errp an error object to populate on failure
> + */
> +static void rx8900_set_voltage(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    RX8900State *s = RX8900(obj);
> +    Error *local_err = NULL;
> +    double temp;
> +    visit_type_number(v, name, &temp, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    s->supply_voltage = temp;
> +    trace_rx8900_set_voltage(s->supply_voltage);
> +
> +    check_voltage(s);
> +}
> +
> +
> +/**
> + * Configure device properties
> + * @param obj the device
> + */
> +static void rx8900_initfn(Object *obj)
> +{
> +    object_property_add(obj, "temperature", "number",
> +                        rx8900_get_temperature,
> +                        rx8900_set_temperature, NULL, NULL, NULL);
> +
> +    object_property_add(obj, "supply voltage", "number",

s/supply voltage/voltage/
As having spaces in a property name makes it harder to use in the QEMU cli
and there is just one voltage so "supply" is not really needed.



> +                        rx8900_get_voltage,
> +                        rx8900_set_voltage, NULL, NULL, NULL);
> +}
> +
> +/**
> + * Reset the device
> + * @param dev the RX8900 device to reset
> + */
> +static void rx8900_reset(DeviceState *dev)
> +{
> +    RX8900State *s = RX8900(dev);
> +
> +    trace_rx8900_reset();
> +
> +    /* The clock is running and synchronized with the host */
> +    s->offset = 0;
> +    s->weekday = 7; /* Set to an invalid value */
> +
> +    s->nvram[EXTENSION_REGISTER] = EXT_MASK_TSEL1;
> +    s->nvram[CONTROL_REGISTER] = CTRL_MASK_CSEL0;
> +    s->nvram[FLAG_REGISTER] &= FLAG_MASK_VDET | FLAG_MASK_VLF;
> +
> +    s->ptr = 0;
> +
> +    trace_rx8900_regptr_update(s->ptr);
> +
> +    s->addr_byte = false;
> +}
> +
> +/**
> + * Realize an RX8900 device instance
> + * Set up timers
> + * Configure GPIO lines
> + * @param dev the device instance to realize
> + * @param errp an error object to populate on error
> + */
> +static void rx8900_realize(DeviceState *dev, Error **errp)
> +{
> +    RX8900State *s = RX8900(dev);
> +    I2CSlave *i2c = I2C_SLAVE(dev);
> +    QEMUBH *bh;
> +    char name[64];
> +
> +    s->fout = false;
> +
> +    memset(s->nvram, 0, RX8900_NVRAM_SIZE);
> +    /* Temperature formulation from the datasheet
> +     * ( TEMP[ 7:0 ] * 2 - 187.19) / 3.218
> +     *
> +     * Set the initial state to 25 degrees Celcius
> +     */
> +    s->nvram[TEMPERATURE] = 135; /* (25 * 3.218 + 187.19) / 2 */


May be
#define RX8900_C_TO_TEMP(c)	(((c) * 3.218 + 187.19) / 2)
?

You do this math in few places.


> +
> +    bh = qemu_bh_new(rx8900_timer_tick, s);
> +    s->sec_timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
> +    /* we trigger the timer at 10Hz and check for rollover, as the qemu
> +     * clock does not advance in realtime in the test environment,
> +     * leading to unstable test results
> +     */
> +    ptimer_set_freq(s->sec_timer, 10);
> +    ptimer_set_limit(s->sec_timer, 1, 1);
> +
> +    bh = qemu_bh_new(rx8900_fout_tick, s);
> +    s->fout_timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
> +    /* frequency doubled to generate 50% duty cycle square wave */
> +    ptimer_set_freq(s->fout_timer, 32768 * 2);
> +    ptimer_set_limit(s->fout_timer, 1, 1);
> +
> +    bh = qemu_bh_new(rx8900_countdown_tick, s);
> +    s->countdown_timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
> +    ptimer_set_freq(s->countdown_timer, 4096);
> +    ptimer_set_limit(s->countdown_timer, 4096, 1);
> +
> +


An extra empty line.

> +    snprintf(name, sizeof(name), "rx8900-interrupt-out");
> +    qdev_init_gpio_out_named(&i2c->qdev, &s->interrupt_pin, name, 1);
> +    trace_rx8900_pin_name("Interrupt", name);

I would just pass a string to qdev_init_gpio_out_named() and ditch @name
from tracepoints as they use unique strings anyway. And I'd also ditch
trace_rx8900_pin_name tracepoints as they do not seem very useful - they do
not report an error or a success.

> +
> +    snprintf(name, sizeof(name), "rx8900-fout-enable");
> +    qdev_init_gpio_in_named(&i2c->qdev, rx8900_fout_enable_handler, name, 1);
> +    trace_rx8900_pin_name("Fout-enable", name);
> +
> +    snprintf(name, sizeof(name), "rx8900-fout");
> +    qdev_init_gpio_out_named(&i2c->qdev, &s->fout_pin, name, 1);
> +    trace_rx8900_pin_name("Fout", name);
> +
> +    s->supply_voltage = 3.3f;
> +    trace_rx8900_set_voltage(s->supply_voltage);
> +}
> +
> +/**
> + * Set up the device callbacks
> + * @param klass the device class
> + * @param data
> + */
> +static void rx8900_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    k->event = rx8900_event;
> +    k->recv = rx8900_recv;
> +    k->send = rx8900_send;
> +    dc->realize = rx8900_realize;
> +    dc->reset = rx8900_reset;
> +    dc->vmsd = &vmstate_rx8900;
> +}
> +
> +static const TypeInfo rx8900_info = {
> +    .name = TYPE_RX8900,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(RX8900State),
> +    .instance_init = rx8900_initfn,
> +    .class_init = rx8900_class_init,
> +};
> +
> +/**
> + * Register the device with QEMU
> + */
> +static void rx8900_register_types(void)
> +{
> +    type_register_static(&rx8900_info);
> +}
> +
> +type_init(rx8900_register_types)
> diff --git a/hw/timer/rx8900_regs.h b/hw/timer/rx8900_regs.h
> new file mode 100644
> index 0000000..cfec535
> --- /dev/null
> +++ b/hw/timer/rx8900_regs.h

Why cannot the content of this header go to hw/timer/rx8900.c ? Do you
expect some future code to use these definitions? If so, please add a note
to the commit log.



> @@ -0,0 +1,139 @@
> +/*
> + * Epson RX8900SA/CE Realtime Clock Module
> + *
> + * Copyright (c) 2016 IBM Corporation
> + * Authors:
> + *  Alastair D'Silva <alastair@d-silva.org>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Datasheet available at:
> + *  https://support.epson.biz/td/api/doc_check.php?dl=app_RX8900CE&lang=en
> + *
> + */
> +
> +#ifndef RX8900_REGS_H
> +#define RX8900_REGS_H
> +
> +#include "qemu/bitops.h"
> +
> +#define RX8900_NVRAM_SIZE 0x20
> +
> +typedef enum RX8900Addresses {
> +    SECONDS = 0x00,
> +    MINUTES = 0x01,
> +    HOURS = 0x02,
> +    WEEKDAY = 0x03,
> +    DAY = 0x04,
> +    MONTH = 0x05,
> +    YEAR = 0x06,
> +    RAM = 0x07,
> +    ALARM_MINUTE = 0x08,
> +    ALARM_HOUR = 0x09,
> +    ALARM_WEEK_DAY = 0x0A,
> +    TIMER_COUNTER_0 = 0x0B,
> +    TIMER_COUNTER_1 = 0x0C,
> +    EXTENSION_REGISTER = 0x0D,
> +    FLAG_REGISTER = 0X0E,
> +    CONTROL_REGISTER = 0X0F,
> +    EXT_SECONDS = 0x010, /* Alias of SECONDS */
> +    EXT_MINUTES = 0x11, /* Alias of MINUTES */
> +    EXT_HOURS = 0x12, /* Alias of HOURS */
> +    EXT_WEEKDAY = 0x13, /* Alias of WEEKDAY */
> +    EXT_DAY = 0x14, /* Alias of DAY */
> +    EXT_MONTH = 0x15, /* Alias of MONTH */
> +    EXT_YEAR = 0x16, /* Alias of YEAR */
> +    TEMPERATURE = 0x17,
> +    BACKUP_FUNCTION = 0x18,
> +    NO_USE_1 = 0x19,
> +    NO_USE_2 = 0x1A,
> +    EXT_TIMER_COUNTER_0 = 0x1B, /* Alias of TIMER_COUNTER_0 */
> +    EXT_TIMER_COUNTER_1 = 0x1C, /* Alias of TIMER_COUNTER_1 */
> +    EXT_EXTENSION_REGISTER = 0x1D, /* Alias of EXTENSION_REGISTER */
> +    EXT_FLAG_REGISTER = 0X1E, /* Alias of FLAG_REGISTER */
> +    EXT_CONTROL_REGISTER = 0X1F /* Alias of CONTROL_REGISTER */
> +} RX8900Addresses;
> +
> +typedef enum ExtRegBits {
> +    EXT_REG_TSEL0 = 0,
> +    EXT_REG_TSEL1 = 1,
> +    EXT_REG_FSEL0 = 2,
> +    EXT_REG_FSEL1 = 3,
> +    EXT_REG_TE = 4,
> +    EXT_REG_USEL = 5,
> +    EXT_REG_WADA = 6,
> +    EXT_REG_TEST = 7
> +} ExtRegBits;
> +
> +typedef enum ExtRegMasks {
> +    EXT_MASK_TSEL0 = BIT(0),
> +    EXT_MASK_TSEL1 = BIT(1),
> +    EXT_MASK_FSEL0 = BIT(2),
> +    EXT_MASK_FSEL1 = BIT(3),
> +    EXT_MASK_TE = BIT(4),
> +    EXT_MASK_USEL = BIT(5),
> +    EXT_MASK_WADA = BIT(6),
> +    EXT_MASK_TEST = BIT(7)
> +} ExtRegMasks;
> +
> +typedef enum CtrlRegBits {
> +    CTRL_REG_RESET = 0,
> +    CTRL_REG_WP0 = 1,
> +    CTRL_REG_WP1 = 2,
> +    CTRL_REG_AIE = 3,
> +    CTRL_REG_TIE = 4,
> +    CTRL_REG_UIE = 5,
> +    CTRL_REG_CSEL0 = 6,
> +    CTRL_REG_CSEL1 = 7
> +} CtrlRegBits;
> +
> +typedef enum CtrlRegMask {
> +    CTRL_MASK_RESET = BIT(0),
> +    CTRL_MASK_WP0 = BIT(1),
> +    CTRL_MASK_WP1 = BIT(2),
> +    CTRL_MASK_AIE = BIT(3),
> +    CTRL_MASK_TIE = BIT(4),
> +    CTRL_MASK_UIE = BIT(5),
> +    CTRL_MASK_CSEL0 = BIT(6),
> +    CTRL_MASK_CSEL1 = BIT(7)
> +} CtrlRegMask;
> +
> +typedef enum FlagRegBits {
> +    FLAG_REG_VDET = 0,
> +    FLAG_REG_VLF = 1,
> +    FLAG_REG_UNUSED_2 = 2,
> +    FLAG_REG_AF = 3,
> +    FLAG_REG_TF = 4,
> +    FLAG_REG_UF = 5,
> +    FLAG_REG_UNUSED_6 = 6,
> +    FLAG_REG_UNUSED_7 = 7
> +} FlagRegBits;
> +
> +#define RX8900_INTERRUPT_SOURCES 6
> +typedef enum FlagRegMask {
> +    FLAG_MASK_VDET = BIT(0),
> +    FLAG_MASK_VLF = BIT(1),
> +    FLAG_MASK_UNUSED_2 = BIT(2),
> +    FLAG_MASK_AF = BIT(3),
> +    FLAG_MASK_TF = BIT(4),
> +    FLAG_MASK_UF = BIT(5),
> +    FLAG_MASK_UNUSED_6 = BIT(6),
> +    FLAG_MASK_UNUSED_7 = BIT(7)
> +} FlagRegMask;
> +
> +typedef enum BackupRegBits {
> +    BACKUP_REG_BKSMP0 = 0,
> +    BACKUP_REG_BKSMP1 = 1,
> +    BACKUP_REG_SWOFF = 2,
> +    BACKUP_REG_VDETOFF = 3
> +} BackupRegBits;
> +
> +typedef enum BackupRegMask {
> +    BACKUP_MASK_BKSMP0 = BIT(0),
> +    BACKUP_MASK_BKSMP1 = BIT(1),
> +    BACKUP_MASK_SWOFF = BIT(2),
> +    BACKUP_MASK_VDETOFF = BIT(3)
> +} BackupRegMask;
> +
> +#endif
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index 3495c41..057e414 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -49,3 +49,34 @@ aspeed_timer_ctrl_pulse_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
>  aspeed_timer_set_ctrl2(uint32_t value) "Value: 0x%" PRIx32
>  aspeed_timer_set_value(int timer, int reg, uint32_t value) "Timer %d register %d: 0x%" PRIx32
>  aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRIx64 ": of size %u: 0x%" PRIx64
> +
> +# hw/timer/rx8900.c
> +rx8900_capture_current_time(int hour, int minute, int second, int weekday, int mday, int month, int year, int raw_hours, int raw_minutes, int raw_seconds, int raw_weekday, int raw_day, int raw_month, int raw_year) "Update current time to %02d:%02d:%02d %d %d/%d/%d (0x%02x%02x%02x%02x%02x%02x%02x)"
> +rx8900_regptr_update(uint32_t ptr) "Operating on register 0x%02x"
> +rx8900_regptr_overflow(void) "Register pointer has overflowed, wrapping to 0"
> +rx8900_event_weekday(int weekday, int weekmask, int weekday_offset) "Set weekday to %d (0x%02x), wday_offset=%d"
> +rx8900_read_register(int address, int val) "Read register 0x%x = 0x%x"
> +rx8900_set_fout(int hz) "Setting fout to %dHz"
> +rx8900_set_countdown_timer(int hz) "Setting countdown timer to %d Hz"
> +rx8900_set_countdown_timer_per_minute(void) "Setting countdown timer to per minute updates"
> +rx8900_enable_update_timer(void) "Enabling update timer"
> +rx8900_enable_alarm(void) "Enabling alarm"
> +rx8900_trigger_alarm(void) "Triggering alarm"
> +rx8900_tick(void) "Tick"

When traces are printed, the whole name is printed as well so you can
easily drop "Tick" and just make it an empty string:

+rx8900_tick(void) ""

This can be done to more than a half of traces.


> +rx8900_fire_interrupt(void) "Pulsing interrupt"
> +rx8900_disable_timer(void) "Disabling timer"
> +rx8900_enable_timer(void) "Enabling timer"
> +rx8900_disable_fout(void) "Disabling fout"
> +rx8900_enable_fout(void) "Enabling fout"
> +rx8900_fout_toggle(void) "Toggling fout"
> +rx8900_disable_countdown(void) "Disabling countdown timer"
> +rx8900_enable_countdown(void) "Enabling countdown timer"
> +rx8900_countdown_tick(int count) "Countdown tick, count=%d"
> +rx8900_countdown_elapsed(void) "Countdown elapsed"
> +rx8900_i2c_data_receive(uint8_t data) "Received I2C data 0x%02x"
> +rx8900_set_register(uint32_t addr, uint8_t data) "Set data 0x%02x=0x%02x"
> +rx8900_read_temperature(uint8_t raw, double val) "Read temperature property, 0x%x = %fœC"

Can be just "0x%x %fœC"



> +rx8900_set_temperature(uint8_t raw, double val) "Set temperature property, 0x%x = %fœC"
> +rx8900_reset(void) "Reset"
> +rx8900_pin_name(const char *type, const char *name) "'%s' pin is '%s'"
> +rx8900_set_voltage(double voltage) "Device voltage set to %f"
> 


-- 
Alexey
