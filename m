Received: by 10.25.15.197 with SMTP id 66csp590831lfp;
        Sat, 24 Jun 2017 05:25:24 -0700 (PDT)
X-Received: by 10.237.37.193 with SMTP id y1mr14362244qtc.140.1498307124352;
        Sat, 24 Jun 2017 05:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498307124; cv=none;
        d=google.com; s=arc-20160816;
        b=KF8Dc4jdoj0tLvNL9JwFSUc8P6/x460xbsVmNj25sJeXNIZ1qpfQReizwjY11AxSZE
         bW2mlWe70l33VFoY5Q93RVeVe+670xWdm5GCXGs2WGb9yFwWljJLdHCvv4pyIjnw55AV
         37jXHVvhz+JbJNfCxPFKqnit1EcWQ6jdXT1bkcO97eE0MlsIIa61IbOS/CBLExcdUDz8
         PordqpvBuXogZPkJg9T+5fF0uWu2cDxSXv6DLs8CXb4svGPudEqU11yeb5Z6ETnWqANN
         nYaxl08NF4zOHdhN1P0euEmq6eQqQWEx9dpytS3+jCuouNlEusmNaMSicnyr0fGr0Wtu
         zMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4lHiKLqjahBq8cxeBOjYQFQQk4n+A1HNyf0ITFdgjS8=;
        b=HfnpA5BmQL9AQOY718FNPVQccaeYTIiWtgTolKLarTdKuxXxMDd+tz42pwOYsdRzCU
         /CnbpwqIVz3CR0eeOxM/fPYotc+5VNMMpDHv5o1m1hg648+58rM0akeIUENuJLxdGBgZ
         tNZnXbMOstBeq29YOJmQ+c99VaHcYSkAj/sA/5KPGQBpcnp7e1IJ76++18OeyjlhOcEM
         JR5pN4nD7tYuKKcZE2nm291oXJyXb/75J6UbD7tneNMYHz22iierVZ9s9axKDlV5Gw6z
         h19yMaj2sb5mbUZO92Qp9harNdHFdwdg4sAro3ZM1OEDZ9KP2U/s3RXT3MnMxVE6d1JE
         TmwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lu8ICn+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p43si8515qtg.361.2017.06.24.05.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Jun 2017 05:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lu8ICn+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dOk7t-0002KL-AM
	for alex.bennee@linaro.org; Sat, 24 Jun 2017 08:25:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dOk7k-0002Hz-FC
	for qemu-arm@nongnu.org; Sat, 24 Jun 2017 08:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dOk7h-0003NM-JY
	for qemu-arm@nongnu.org; Sat, 24 Jun 2017 08:25:12 -0400
Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241]:35136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dOk7b-0003J2-1f; Sat, 24 Jun 2017 08:25:03 -0400
Received: by mail-yb0-x241.google.com with SMTP id g206so3151510yba.2;
	Sat, 24 Jun 2017 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4lHiKLqjahBq8cxeBOjYQFQQk4n+A1HNyf0ITFdgjS8=;
	b=lu8ICn+pRsIiqtTBxWd7v/03o/qvByFSTEds7W2mxUOhv89hnBLvz7iQIFOzxOUBcg
	2++VyvzJYJvKAwf2RALBKC9yUeGuDhWP+qqi2s0pzA8FjrHGAFLjFyLY+07bGrADng+c
	NC9UiVG2cYosUcPfYMdZW132tM5W9SnQfdvgxFK1gsRAV6YLeha7X54O3ICT4pRuEfJJ
	G1M3x5giB/3ESS0Ew86DDbHVytSNTaOhOCijX9bZa9gP/R4Uk3yjFFPYDtI78XKDRHeR
	6s0lGTvs2rivErLhzJdARo4CfGeGZo2XYpKGj8HEyLcFejjfF/npE/4+KJh9Sd4EFgjn
	6/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4lHiKLqjahBq8cxeBOjYQFQQk4n+A1HNyf0ITFdgjS8=;
	b=RPPGeUAEH4QgbqDd2IflZtRxbRLJSXemiWHzJCjKmxKJHoNvrXV+dargN3OlYINLAU
	FWbbrnNUrcFuvuaz/RdQpmRAdPnqX0WyjfdnR/0cuxACJJRWmrkLy2L0v7YsLZ/XXsFe
	ihVAs2yCfJazAXbefmzu6MpbsyY+k9R1Xx9OBNbu5phh3HC+xrje7WgQhnckqKZ2tDoI
	t/KCsvFa1BDiSvWChI6NSYkmQTkf294tC+QpYlag+XhyoiULcR405cEjTCa55aAG6kuL
	FKRsl7EXugEIiZxKna7r3OOxNzvDv9cyzMdXvpFAzCsUXzDaOnYZWItSMS6RAIGrRgtk
	EkHA==
X-Gm-Message-State: AKS2vOx1JoHwP3cGIpAGbGmcHIhQMWQlAN8jFuPqadpm7z2no7J/cJXG
	F5fEGktSKaBjytvFq1/w/3DFpZZ0tQ==
X-Received: by 10.37.83.66 with SMTP id h63mr8909550ybb.169.1498307102369;
	Sat, 24 Jun 2017 05:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.65 with HTTP; Sat, 24 Jun 2017 05:25:01 -0700 (PDT)
In-Reply-To: <791b5dbc-4a5d-71c7-cd4b-1609b164e648@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-2-git-send-email-sundeep.lkml@gmail.com>
	<791b5dbc-4a5d-71c7-cd4b-1609b164e648@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Sat, 24 Jun 2017 17:55:01 +0530
Message-ID: <CALHRZuqdmhxOeMvN=y46t19c+muY18cN=s4-+L2uiWWBvUh=PA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a113e688e99f2a00552b3ced6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::241
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 1/5] msf2: Add Smartfusion2
 System timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiuIeim49UnF

--001a113e688e99f2a00552b3ced6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Tue, May 30, 2017 at 6:13 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
> I have some comments, see inlined.
>
>
> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>> Modelled System Timer in Microsemi's Smartfusion2 Soc.
>> Timer has two 32bit down counters and two interrupts.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/timer/Makefile.objs       |   1 +
>>  hw/timer/mss-timer.c         | 249 ++++++++++++++++++++++++++++++
>> +++++++++++++
>>  include/hw/timer/mss-timer.h |  80 ++++++++++++++
>>  3 files changed, 330 insertions(+)
>>  create mode 100644 hw/timer/mss-timer.c
>>  create mode 100644 include/hw/timer/mss-timer.h
>>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index dd6f27e..fc4d2da 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D
>> stm32f2xx_timer.o
>>  common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
>>
>>  common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
>> +common-obj-$(CONFIG_MSF2) +=3D mss-timer.o
>> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
>> new file mode 100644
>> index 0000000..7041965
>> --- /dev/null
>> +++ b/hw/timer/mss-timer.c
>> @@ -0,0 +1,249 @@
>> +/*
>> + * Block model of System timer present in
>> + * Microsemi's SmartFusion2 and SmartFusion SoCs.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "hw/timer/mss-timer.h"
>> +
>> +#ifndef MSS_TIMER_ERR_DEBUG
>> +#define MSS_TIMER_ERR_DEBUG  0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSS_TIMER_ERR_DEBUG >=3D lvl) { \
>> +        qemu_log("%s: " fmt, __func__, ## args); \
>> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +static void timer_update_irq(struct Msf2Timer *st)
>> +{
>> +    bool isr, ier;
>> +
>> +    isr =3D !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> +    ier =3D !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> +
>> +    qemu_set_irq(st->irq, (ier && isr));
>> +}
>> +
>> +static void timer_update(struct Msf2Timer *st)
>> +{
>> +    uint64_t count;
>> +
>> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
>> +        ptimer_stop(st->ptimer);
>> +        return;
>> +    }
>> +
>> +    count =3D st->regs[R_TIM_LOADVAL];
>> +    ptimer_set_limit(st->ptimer, count, 1);
>> +    ptimer_run(st->ptimer, 1);
>> +}
>> +
>> +static uint64_t
>> +timer_read(void *opaque, hwaddr offset, unsigned int size)
>> +{
>> +    MSSTimerState *t =3D opaque;
>> +    hwaddr addr;
>> +    struct Msf2Timer *st;
>> +    uint32_t ret =3D 0;
>> +    int timer =3D 0;
>> +    int isr;
>> +    int ier;
>> +
>> +    addr =3D offset >> 2;
>> +    /*
>> +     * Two independent timers has same base address.
>> +     * Based on address passed figure out which timer is being used.
>> +     */
>> +    if ((addr >=3D R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
>> +        timer =3D 1;
>> +        addr -=3D R_TIM1_MAX;
>> +    }
>> +
>> +    st =3D &t->timers[timer];
>> +
>> +    switch (addr) {
>> +    case R_TIM_VAL:
>> +        ret =3D ptimer_get_count(st->ptimer);
>> +        break;
>> +
>> +    case R_TIM_MIS:
>> +        isr =3D !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> +        ier =3D !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> +        ret =3D ier & isr;
>> +        break;
>> +
>> +    default:
>> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
>> +            ret =3D st->regs[addr];
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>> +        }
>> +        break;
>> +    }
>> +
>> +    DB_PRINT("timer=3D%d 0x%" HWADDR_PRIx "=3D0x%" PRIx32 "\n", timer,
>> offset,
>> +            ret);
>> +    return ret;
>> +}
>> +
>> +static void
>> +timer_write(void *opaque, hwaddr offset,
>> +            uint64_t val64, unsigned int size)
>> +{
>> +    MSSTimerState *t =3D opaque;
>> +    hwaddr addr;
>> +    struct Msf2Timer *st;
>> +    int timer =3D 0;
>> +    uint32_t value =3D val64;
>> +
>> +    addr =3D offset >> 2;
>> +    /*
>> +     * Two independent timers has same base address.
>> +     * Based on addr passed figure out which timer is being used.
>> +     */
>> +    if ((addr >=3D R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
>> +        timer =3D 1;
>> +        addr -=3D R_TIM1_MAX;
>> +    }
>> +
>> +    st =3D &t->timers[timer];
>> +
>> +    DB_PRINT("addr=3D0x%" HWADDR_PRIx " val=3D0x%" PRIx32 " (timer=3D%d=
)\n",
>> offset,
>> +            value, timer);
>> +
>> +    switch (addr) {
>> +    case R_TIM_CTRL:
>> +        st->regs[R_TIM_CTRL] =3D value;
>> +        timer_update(st);
>> +        break;
>> +
>> +    case R_TIM_RIS:
>> +        if (value & TIMER_RIS_ACK) {
>> +            st->regs[R_TIM_RIS] &=3D ~TIMER_RIS_ACK;
>> +        }
>> +        break;
>> +
>> +    case R_TIM_LOADVAL:
>> +        st->regs[R_TIM_LOADVAL] =3D value;
>> +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
>> +            timer_update(st);
>> +        }
>> +        break;
>> +
>> +    case R_TIM_BGLOADVAL:
>> +        st->regs[R_TIM_BGLOADVAL] =3D value;
>> +        st->regs[R_TIM_LOADVAL] =3D value;
>> +        break;
>> +
>> +    case R_TIM_VAL:
>> +    case R_TIM_MIS:
>> +        break;
>> +
>> +    default:
>> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
>> +            st->regs[addr] =3D value;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>> +            return;
>> +        }
>> +        break;
>> +    }
>> +    timer_update_irq(st);
>> +}
>> +
>> +static const MemoryRegionOps timer_ops =3D {
>> +    .read =3D timer_read,
>> +    .write =3D timer_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 1,
>> +        .max_access_size =3D 4
>> +    }
>> +};
>> +
>> +static void timer_hit(void *opaque)
>> +{
>> +    struct Msf2Timer *st =3D opaque;
>> +
>> +    st->regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;
>> +
>> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
>> +        timer_update(st);
>> +    }
>> +    timer_update_irq(st);
>> +}
>> +
>> +static void mss_timer_init(Object *obj)
>> +{
>> +    MSSTimerState *t =3D MSS_TIMER(obj);
>> +    int i;
>> +
>> +    /* Init all the ptimers.  */
>> +    t->timers =3D g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
>> +    for (i =3D 0; i < NUM_TIMERS; i++) {
>> +        struct Msf2Timer *st =3D &t->timers[i];
>> +
>> +        st->bh =3D qemu_bh_new(timer_hit, st);
>> +        st->ptimer =3D ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
>> +        ptimer_set_freq(st->ptimer, t->freq_hz);
>> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
>> +    }
>> +
>> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>> TYPE_MSS_TIMER,
>> +                          NUM_TIMERS * R_TIM1_MAX * 4);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
>> +}
>> +
>> +static Property mss_timer_properties[] =3D {
>> +    /* Libero GUI shows 100Mhz as default for clocks */
>> +    DEFINE_PROP_UINT32("clock-frequency", MSSTimerState, freq_hz,
>> +                      100 * 1000000),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void mss_timer_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->props =3D mss_timer_properties;
>> +}
>> +
>> +static const TypeInfo mss_timer_info =3D {
>> +    .name          =3D TYPE_MSS_TIMER,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(MSSTimerState),
>> +    .instance_init =3D mss_timer_init,
>> +    .class_init    =3D mss_timer_class_init,
>> +};
>> +
>> +static void mss_timer_register_types(void)
>> +{
>> +    type_register_static(&mss_timer_info);
>> +}
>> +
>> +type_init(mss_timer_register_types)
>> diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
>> new file mode 100644
>> index 0000000..4caacfd
>> --- /dev/null
>> +++ b/include/hw/timer/mss-timer.h
>> @@ -0,0 +1,80 @@
>> +/*
>> + * Microsemi SmartFusion2 Timer.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef HW_MSS_TIMER_H
>> +#define HW_MSS_TIMER_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/ptimer.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +
>> +#define TYPE_MSS_TIMER     "mss-timer"
>> +#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
>> +                              (obj), TYPE_MSS_TIMER)
>> +
>> +/*
>> + * There are two 32-bit down counting timers.
>> + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
>> + * that operates either in Periodic mode or in One-shot mode.
>> + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit
>> mode.
>> + * In 64-bit mode, writing to the 32-bit registers has no effect.
>> + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
>> + * has no effect. Only two 32-bit timers are supported currently.
>> + */
>> +#define NUM_TIMERS        2
>> +
>> +#define R_TIM_VAL         0
>> +#define R_TIM_LOADVAL     1
>> +#define R_TIM_BGLOADVAL   2
>> +#define R_TIM_CTRL        3
>> +#define R_TIM_RIS         4
>> +#define R_TIM_MIS         5
>> +#define R_TIM1_MAX        6
>> +
>>
>
> From here ...
>
> +#define TIMER_CTRL_ENBL     (1 << 0)
>> +#define TIMER_CTRL_ONESHOT  (1 << 1)
>> +#define TIMER_CTRL_INTR     (1 << 2)
>> +#define TIMER_RIS_ACK       (1 << 0)
>> +#define TIMER_RST_CLR       (1 << 6)
>> +#define TIMER_MODE          (1 << 0)
>>
>
> .. to here, can go in the .c source file.
>
> I'd also move R_TIM_* to the source, only keeping R_TIM_MAX in this
> header, or also moving it and exposing some TIMER_IO_SIZE of 0x30 instead=
.
>

Ok will move to .c source file.

>
> +
>> +struct Msf2Timer {
>> +    QEMUBH *bh;
>> +    ptimer_state *ptimer;
>> +
>> +    uint32_t regs[NUM_TIMERS * R_TIM1_MAX];
>>
>
> Beware, you are declaring 2 sets of register for each timer. I think it'd
> be safer to declare these registers once in MSSTimerState, the code would
> get easier.
>

Thanks for catching this. I will use regs[R_TIM1_MAX] so that Msf2Timer
represents
one timer block.

>
> +    qemu_irq irq;
>> +};
>> +
>> +typedef struct MSSTimerState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +    uint32_t freq_hz;
>> +    struct Msf2Timer *timers;
>>
>
> The number of timers is fixed (NUM_TIMERS), so you can declare it here an=
d
> avoid to use g_malloc0() in mss_timer_init(), this will get allocated
> before mss_timer_init() using mss_timer_info.instance_size.
>
> This should simplify a bit.


Yes will remove g_malloc and declare here in MSSTimerState.

Thanks,
Sundeep

>
>
> +} MSSTimerState;
>> +
>> +#endif /* HW_MSS_TIMER_H */
>>
>>

--001a113e688e99f2a00552b3ced6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, May 30, 2017 at 6:13 PM, Philippe Mathieu-Daud=C3=
=A9 <span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_bla=
nk">f4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hi Subbaraya,<br>
<br>
I have some comments, see inlined.<div><div class=3D"h5"><br>
<br>
On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Modelled System Timer in Microsemi&#39;s Smartfusion2 Soc.<br>
Timer has two 32bit down counters and two interrupts.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
=C2=A0hw/timer/mss-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 249 +++++++++=
+++++++++++++++++++++<wbr>+++++++++++++<br>
=C2=A0include/hw/timer/mss-timer.h |=C2=A0 80 ++++++++++++++<br>
=C2=A03 files changed, 330 insertions(+)<br>
=C2=A0create mode 100644 hw/timer/mss-timer.c<br>
=C2=A0create mode 100644 include/hw/timer/mss-timer.h<br>
<br>
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs<br>
index dd6f27e..fc4d2da 100644<br>
--- a/hw/timer/Makefile.objs<br>
+++ b/hw/timer/Makefile.objs<br>
@@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_<wbr>TIMER) +=3D stm32f2xx_=
timer.o<br>
=C2=A0common-obj-$(CONFIG_ASPEED_SO<wbr>C) +=3D aspeed_timer.o<br>
<br>
=C2=A0common-obj-$(CONFIG_SUN4V_<wbr>RTC) +=3D sun4v-rtc.o<br>
+common-obj-$(CONFIG_MSF2) +=3D mss-timer.o<br>
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c<br>
new file mode 100644<br>
index 0000000..7041965<br>
--- /dev/null<br>
+++ b/hw/timer/mss-timer.c<br>
@@ -0,0 +1,249 @@<br>
+/*<br>
+ * Block model of System timer present in<br>
+ * Microsemi&#39;s SmartFusion2 and SmartFusion SoCs.<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;.<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;hw/timer/mss-timer.h&quot;<br>
+<br>
+#ifndef MSS_TIMER_ERR_DEBUG<br>
+#define MSS_TIMER_ERR_DEBUG=C2=A0 0<br>
+#endif<br>
+<br>
+#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
+=C2=A0 =C2=A0 if (MSS_TIMER_ERR_DEBUG &gt;=3D lvl) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt, __func__, ## ar=
gs); \<br>
+=C2=A0 =C2=A0 } \<br>
+} while (0);<br>
+<br>
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
+<br>
+static void timer_update_irq(struct Msf2Timer *st)<br>
+{<br>
+=C2=A0 =C2=A0 bool isr, ier;<br>
+<br>
+=C2=A0 =C2=A0 isr =3D !!(st-&gt;regs[R_TIM_RIS] &amp; TIMER_RIS_ACK);<br>
+=C2=A0 =C2=A0 ier =3D !!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_INTR);<b=
r>
+<br>
+=C2=A0 =C2=A0 qemu_set_irq(st-&gt;irq, (ier &amp;&amp; isr));<br>
+}<br>
+<br>
+static void timer_update(struct Msf2Timer *st)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t count;<br>
+<br>
+=C2=A0 =C2=A0 if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ENBL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_stop(st-&gt;ptimer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 count =3D st-&gt;regs[R_TIM_LOADVAL];<br>
+=C2=A0 =C2=A0 ptimer_set_limit(st-&gt;ptimer, count, 1);<br>
+=C2=A0 =C2=A0 ptimer_run(st-&gt;ptimer, 1);<br>
+}<br>
+<br>
+static uint64_t<br>
+timer_read(void *opaque, hwaddr offset, unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 MSSTimerState *t =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr addr;<br>
+=C2=A0 =C2=A0 struct Msf2Timer *st;<br>
+=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
+=C2=A0 =C2=A0 int timer =3D 0;<br>
+=C2=A0 =C2=A0 int isr;<br>
+=C2=A0 =C2=A0 int ier;<br>
+<br>
+=C2=A0 =C2=A0 addr =3D offset &gt;&gt; 2;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Two independent timers has same base address.<br>
+=C2=A0 =C2=A0 =C2=A0* Based on address passed figure out which timer is be=
ing used.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if ((addr &gt;=3D R_TIM1_MAX) &amp;&amp; (addr &lt; NUM_TIME=
RS * R_TIM1_MAX)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D R_TIM1_MAX;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 st =3D &amp;t-&gt;timers[timer];<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_TIM_VAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptimer_get_count(st-&gt;ptimer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_TIM_MIS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isr =3D !!(st-&gt;regs[R_TIM_RIS] &amp; TIMER_=
RIS_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ier =3D !!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER=
_CTRL_INTR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ier &amp; isr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; NUM_TIMERS * R_TIM1_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D st-&gt;regs[addr];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TYPE_MSS_TIMER&quot;: 64-bit mode not supported\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;timer=3D%d 0x%&quot; HWADDR_PRIx &quot;=3D0x%=
&quot; PRIx32 &quot;\n&quot;, timer, offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void<br>
+timer_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigned int siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 MSSTimerState *t =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr addr;<br>
+=C2=A0 =C2=A0 struct Msf2Timer *st;<br>
+=C2=A0 =C2=A0 int timer =3D 0;<br>
+=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
+<br>
+=C2=A0 =C2=A0 addr =3D offset &gt;&gt; 2;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Two independent timers has same base address.<br>
+=C2=A0 =C2=A0 =C2=A0* Based on addr passed figure out which timer is being=
 used.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if ((addr &gt;=3D R_TIM1_MAX) &amp;&amp; (addr &lt; NUM_TIME=
RS * R_TIM1_MAX)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D R_TIM1_MAX;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 st =3D &amp;t-&gt;timers[timer];<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; val=3D0x%=
&quot; PRIx32 &quot; (timer=3D%d)\n&quot;, offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value, timer);<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_TIM_CTRL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_CTRL] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_TIM_RIS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; TIMER_RIS_ACK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_RIS] &amp;=3D =
~TIMER_RIS_ACK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_TIM_LOADVAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_LOADVAL] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_E=
NBL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_TIM_BGLOADVAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_BGLOADVAL] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_LOADVAL] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_TIM_VAL:<br>
+=C2=A0 =C2=A0 case R_TIM_MIS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; NUM_TIMERS * R_TIM1_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[addr] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TYPE_MSS_TIMER&quot;: 64-bit mode not supported\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 timer_update_irq(st);<br>
+}<br>
+<br>
+static const MemoryRegionOps timer_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D timer_read,<br>
+=C2=A0 =C2=A0 .write =3D timer_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void timer_hit(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 struct Msf2Timer *st =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 st-&gt;regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;<br>
+<br>
+=C2=A0 =C2=A0 if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ONESHOT)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 timer_update_irq(st);<br>
+}<br>
+<br>
+static void mss_timer_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 MSSTimerState *t =3D MSS_TIMER(obj);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 /* Init all the ptimers.=C2=A0 */<br>
+=C2=A0 =C2=A0 t-&gt;timers =3D g_malloc0((sizeof t-&gt;timers[0]) * NUM_TI=
MERS);<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NUM_TIMERS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct Msf2Timer *st =3D &amp;t-&gt;timers[i];=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;bh =3D qemu_bh_new(timer_hit, st);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;ptimer =3D ptimer_init(st-&gt;bh, PTIME=
R_POLICY_DEFAULT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_set_freq(st-&gt;ptimer, t-&gt;freq_hz);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_DEVICE<wbr>(obj), &amp=
;st-&gt;irq);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;t-&gt;mmio<wbr>, OBJECT(t), &amp;=
timer_ops, t, TYPE_MSS_TIMER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NUM_TIMERS * R_TIM1_MAX * 4);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVIC<wbr>E(obj), &amp;t-&gt;mmio);=
<br>
+}<br>
+<br>
+static Property mss_timer_properties[] =3D {<br>
+=C2=A0 =C2=A0 /* Libero GUI shows 100Mhz as default for clocks */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;clock-freq<wbr>uency&quot;, MSSTime=
rState, freq_hz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 100 * 1000000),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void mss_timer_class_init(ObjectCla<wbr>ss *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;props =3D mss_timer_properties;<br>
+}<br>
+<br>
+static const TypeInfo mss_timer_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_MSS_TIMER,<=
br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(MSSTimerState),<br>
+=C2=A0 =C2=A0 .instance_init =3D mss_timer_init,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D mss_timer_class_init,<br>
+};<br>
+<br>
+static void mss_timer_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;mss_time<wbr>r_info);<br>
+}<br>
+<br>
+type_init(mss_timer_register_<wbr>types)<br>
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h<br=
>
new file mode 100644<br>
index 0000000..4caacfd<br>
--- /dev/null<br>
+++ b/include/hw/timer/mss-timer.h<br>
@@ -0,0 +1,80 @@<br>
+/*<br>
+ * Microsemi SmartFusion2 Timer.<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef HW_MSS_TIMER_H<br>
+#define HW_MSS_TIMER_H<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/ptimer.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+<br>
+#define TYPE_MSS_TIMER=C2=A0 =C2=A0 =C2=A0&quot;mss-timer&quot;<br>
+#define MSS_TIMER(obj)=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(MSSTimerState, \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (obj), TYPE_MSS_TIMER)<br>
+<br>
+/*<br>
+ * There are two 32-bit down counting timers.<br>
+ * Timers 1 and 2 can be concatenated into a single 64-bit Timer<br>
+ * that operates either in Periodic mode or in One-shot mode.<br>
+ * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit mo=
de.<br>
+ * In 64-bit mode, writing to the 32-bit registers has no effect.<br>
+ * Similarly, in 32-bit mode, writing to the 64-bit mode registers<br>
+ * has no effect. Only two 32-bit timers are supported currently.<br>
+ */<br>
+#define NUM_TIMERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+<br>
+#define R_TIM_VAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+#define R_TIM_LOADVAL=C2=A0 =C2=A0 =C2=A01<br>
+#define R_TIM_BGLOADVAL=C2=A0 =C2=A02<br>
+#define R_TIM_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
+#define R_TIM_RIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
+#define R_TIM_MIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
+#define R_TIM1_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
+<br>
</blockquote>
<br></div></div>
From here ...<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+#define TIMER_CTRL_ENBL=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
+#define TIMER_CTRL_ONESHOT=C2=A0 (1 &lt;&lt; 1)<br>
+#define TIMER_CTRL_INTR=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
+#define TIMER_RIS_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
+#define TIMER_RST_CLR=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br>
+#define TIMER_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
</blockquote>
<br></span>
.. to here, can go in the .c source file.<br>
<br>
I&#39;d also move R_TIM_* to the source, only keeping R_TIM_MAX in this hea=
der, or also moving it and exposing some TIMER_IO_SIZE of 0x30 instead.<spa=
n class=3D""><br></span></blockquote><div><br></div><div>Ok will move to .c=
 source file. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+struct Msf2Timer {<br>
+=C2=A0 =C2=A0 QEMUBH *bh;<br>
+=C2=A0 =C2=A0 ptimer_state *ptimer;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t regs[NUM_TIMERS * R_TIM1_MAX];<br>
</blockquote>
<br></span>
Beware, you are declaring 2 sets of register for each timer. I think it&#39=
;d be safer to declare these registers once in MSSTimerState, the code woul=
d get easier.<span class=3D""><br></span></blockquote><div><br></div><div>T=
hanks for catching this. I will use regs[R_TIM1_MAX] so that Msf2Timer repr=
esents<br></div><div>one timer block.<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 qemu_irq irq;<br>
+};<br>
+<br>
+typedef struct MSSTimerState {<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+=C2=A0 =C2=A0 uint32_t freq_hz;<br>
+=C2=A0 =C2=A0 struct Msf2Timer *timers;<br>
</blockquote>
<br></span>
The number of timers is fixed (NUM_TIMERS), so you can declare it here and =
avoid to use g_malloc0() in mss_timer_init(), this will get allocated befor=
e mss_timer_init() using mss_timer_info.instance_size.<br>
<br>
This should simplify a bit.</blockquote><div><br></div><div>Yes will remove=
 g_malloc and declare here in MSSTimerState.<br><br></div><div>Thanks,<br><=
/div><div>Sundeep <br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HO=
EnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+} MSSTimerState;<br>
+<br>
+#endif /* HW_MSS_TIMER_H */<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--001a113e688e99f2a00552b3ced6--
