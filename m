Received: by 10.25.150.194 with SMTP id y185csp1331443lfd;
        Mon, 7 Nov 2016 16:53:24 -0800 (PST)
X-Received: by 10.202.169.81 with SMTP id s78mr5987370oie.81.1478566404463;
        Mon, 07 Nov 2016 16:53:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w60si15862198ota.14.2016.11.07.16.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Nov 2016 16:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c3ufD-0005BC-N9
	for alex.bennee@linaro.org; Mon, 07 Nov 2016 19:53:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1c3uf8-00059D-Ad
	for qemu-arm@nongnu.org; Mon, 07 Nov 2016 19:53:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1c3uf6-0007yG-N1
	for qemu-arm@nongnu.org; Mon, 07 Nov 2016 19:53:18 -0500
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:35259)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1c3uf2-0007xK-LG; Mon, 07 Nov 2016 19:53:12 -0500
Received: by mail-it0-x241.google.com with SMTP id b123so7615692itb.2;
	Mon, 07 Nov 2016 16:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SGt6/mKln7laVTgWSF0QLYKZ97jxg8W7DYCaxEEVOuk=;
	b=pt6X+K8JKwM6fUCaifaHufLGY/jpsZFtTYAHj7R5ZzEey2XJUdx6ZW/4BbBunasdTQ
	4Abz24Ph7/Wabq8RJ6liCpEwtmfYrQ9HVGQ9n6tI/K8NiK8ukgDBxoI8IAaosvKkOW3z
	54TJmokZdZUefbum8DyKaPJev7lK6Icxcp/8XX0FFIpUvevSLrxqm3s1+vpYMdqYCYjx
	DGFrFPD1M8rO2emBZXsZ2BLUkVsPaaRzaVi/jUJGolKFJKs9FhKjr47qlZ4YE+8EMvZ1
	5iqeCjWTP3qL0jNzDtnxymMe1YUPebB3A7SOmAJKcIfo32VxlRuXY/nlHabLmK6qRP+Q
	1qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=SGt6/mKln7laVTgWSF0QLYKZ97jxg8W7DYCaxEEVOuk=;
	b=Xpa2uCIasCB/+tFrQ10zMJsclNvhXktDzhTcGjz2P/fd8RbtHbqkp3h6LJRWPr3XPJ
	O3F1UPtJfG1YmMa71bDlkBCWBfyviaDigeZqrBkcBfve7uYd1X5PpSrr51HGKUEty0x5
	XR34cpUZSNkH+sawH7OOE/kXH2iA78BP6T2TOn4q6eTzl2iyMKYVC6x/WZdOA8rKcrgY
	DP3JVKV8PF0QND5DJ5pIgH5fF7voQD4M3kMrK16k92/giBM6VfpywRELtjcft4sRYjGI
	k5ZkikK4sHgnKr5/5ldLO+0x1SGl3Li6Pb0+VbDP+YjKbEvYERhE7lkKteaDJyI1AvvK
	zAHg==
X-Gm-Message-State: ABUngvcM+4RTRZEoordXiQ4cqsMHjCbZ92pxK7mm72kHf8DgQFFcwDxn//npUVUiUhosg0kgdDalj3qdFfEmbw==
X-Received: by 10.202.44.19 with SMTP id s19mr6103069ois.112.1478566391507;
	Mon, 07 Nov 2016 16:53:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Mon, 7 Nov 2016 16:52:41 -0800 (PST)
In-Reply-To: <1086430b-166e-2119-fd8b-c11a18881ceb@greensocs.com>
References: <cover.1477599721.git.alistair.francis@xilinx.com>
	<609fbf406b3c1fdd159585301568dd05bfc5f1c9.1477599721.git.alistair.francis@xilinx.com>
	<1086430b-166e-2119-fd8b-c11a18881ceb@greensocs.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 7 Nov 2016 16:52:41 -0800
X-Google-Sender-Auth: CLF6bRQsVQCYxLfJq02yXm7DAQE
Message-ID: <CAKmqyKPf1FvuwZs4O1eLtu=XJ=gGv5ZaQ7vSwXFxqV1zNnQrGg@mail.gmail.com>
To: KONRAD Frederic <fred.konrad@greensocs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/2] arm_generic_timer: Add
 the ARM Generic Timer
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/Aqbl8TGAPG

On Thu, Nov 3, 2016 at 1:47 AM, KONRAD Frederic
<fred.konrad@greensocs.com> wrote:
>
>
> Le 02/11/2016 =C3=A0 17:41, Alistair Francis a =C3=A9crit :
>>
>> Add the ARM generic timer. This allows the guest to poll the timer for
>> values and also supports secure writes only.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>>  hw/timer/Makefile.objs               |   1 +
>>  hw/timer/arm_generic_timer.c         | 216
>> +++++++++++++++++++++++++++++++++++
>>  include/hw/timer/arm_generic_timer.h |  60 ++++++++++
>>  3 files changed, 277 insertions(+)
>>  create mode 100644 hw/timer/arm_generic_timer.c
>>  create mode 100644 include/hw/timer/arm_generic_timer.h
>>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index 7ba8c23..f88c468 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_epit.o
>>  common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
>>  common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
>>  common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
>> +common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D arm_generic_timer.o
>>
>>  obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
>>  obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
>> diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
>> new file mode 100644
>> index 0000000..8341e06
>> --- /dev/null
>> +++ b/hw/timer/arm_generic_timer.c
>> @@ -0,0 +1,216 @@
>> +/*
>> + * QEMU model of the ARM Generic Timer
>> + *
>> + * Copyright (c) 2016 Xilinx Inc.
>> + * Written by Alistair Francis <alistair.francis@xilinx.com>
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
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS
>> IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/timer/arm_generic_timer.h"
>> +#include "qemu/timer.h"
>> +#include "qemu/log.h"
>> +
>> +#ifndef ARM_GEN_TIMER_ERR_DEBUG
>> +#define ARM_GEN_TIMER_ERR_DEBUG 0
>> +#endif
>> +
>> +static void counter_control_postw(RegisterInfo *reg, uint64_t val64)
>> +{
>> +    ARMGenTimer *s =3D ARM_GEN_TIMER(reg->opaque);
>> +    bool new_status =3D extract32(s->regs[R_COUNTER_CONTROL_REGISTER],
>> +                                R_COUNTER_CONTROL_REGISTER_EN_SHIFT,
>> +                                R_COUNTER_CONTROL_REGISTER_EN_LENGTH);
>> +    uint64_t current_ticks;
>> +
>> +    current_ticks =3D muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
>> +                             NANOSECONDS_PER_SECOND, 1000000);
>> +
>> +    if ((s->enabled && !new_status) ||
>> +        (!s->enabled && new_status)) {
>> +        /* The timer is being disabled or enabled */
>> +        s->tick_offset =3D current_ticks - s->tick_offset;
>> +    }
>> +
>> +    s->enabled =3D new_status;
>> +}
>> +
>> +static uint64_t couter_low_value_postr(RegisterInfo *reg, uint64_t val6=
4)
>
>
> s/couter/counter ?
>
>> +{
>> +    ARMGenTimer *s =3D ARM_GEN_TIMER(reg->opaque);
>> +    uint64_t current_ticks, total_ticks;
>> +    uint32_t low_ticks;
>> +
>> +    if (s->enabled) {
>> +        current_ticks =3D muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL=
),
>> +                                 NANOSECONDS_PER_SECOND, 1000000);
>> +        total_ticks =3D current_ticks - s->tick_offset;
>> +        low_ticks =3D (uint32_t) total_ticks;
>> +    } else {
>> +        /* Timer is disabled, return the time when it was disabled */
>> +        low_ticks =3D (uint32_t) s->tick_offset;
>> +    }
>> +
>> +    return low_ticks;
>> +}
>> +
>> +static uint64_t couter_high_value_postr(RegisterInfo *reg, uint64_t
>> val64)
>
>
> same here?

Thanks Fred, I'm sending out a V2 with this fixed.

Thanks,

Alistair

>
> Fred
>
>
>> +{
>> +    ARMGenTimer *s =3D ARM_GEN_TIMER(reg->opaque);
>> +    uint64_t current_ticks, total_ticks;
>> +    uint32_t high_ticks;
>> +
>> +    if (s->enabled) {
>> +        current_ticks =3D muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL=
),
>> +                                 NANOSECONDS_PER_SECOND, 1000000);
>> +        total_ticks =3D current_ticks - s->tick_offset;
>> +        high_ticks =3D (uint32_t) (total_ticks >> 32);
>> +    } else {
>> +        /* Timer is disabled, return the time when it was disabled */
>> +        high_ticks =3D (uint32_t) (s->tick_offset >> 32);
>> +    }
>> +
>> +    return high_ticks;
>> +}
>> +
>> +
>> +static RegisterAccessInfo arm_gen_timer_regs_info[] =3D {
>> +    {   .name =3D "COUNTER_CONTROL_REGISTER",
>> +        .addr =3D A_COUNTER_CONTROL_REGISTER,
>> +        .rsvd =3D 0xfffffffc,
>> +        .post_write =3D counter_control_postw,
>> +    },{ .name =3D "COUNTER_STATUS_REGISTER",
>> +        .addr =3D A_COUNTER_STATUS_REGISTER,
>> +        .rsvd =3D 0xfffffffd, .ro =3D 0x2,
>> +    },{ .name =3D "CURRENT_COUNTER_VALUE_LOWER_REGISTER",
>> +        .addr =3D A_CURRENT_COUNTER_VALUE_LOWER_REGISTER,
>> +        .post_read =3D couter_low_value_postr,
>> +    },{ .name =3D "CURRENT_COUNTER_VALUE_UPPER_REGISTER",
>> +        .addr =3D A_CURRENT_COUNTER_VALUE_UPPER_REGISTER,
>> +        .post_read =3D couter_high_value_postr,
>> +    },{ .name =3D "BASE_FREQUENCY_ID_REGISTER",
>> +        .addr =3D A_BASE_FREQUENCY_ID_REGISTER,
>> +    }
>> +};
>> +
>> +static void arm_gen_timer_reset(DeviceState *dev)
>> +{
>> +    ARMGenTimer *s =3D ARM_GEN_TIMER(dev);
>> +    unsigned int i;
>> +
>> +    for (i =3D 0; i < ARRAY_SIZE(s->regs_info); ++i) {
>> +        register_reset(&s->regs_info[i]);
>> +    }
>> +
>> +    s->tick_offset =3D 0;
>> +    s->enabled =3D false;
>> +}
>> +
>> +static MemTxResult arm_gen_timer_read(void *opaque,  hwaddr addr,
>> +                                      uint64_t *data, unsigned size,
>> +                                      MemTxAttrs attrs)
>> +{
>> +    /* Reads are always supported, just blindly pass them through */
>> +    *data =3D register_read_memory(opaque, addr, size);
>> +
>> +    return MEMTX_OK;
>> +}
>> +
>> +static MemTxResult arm_gen_timer_write(void *opaque, hwaddr addr,
>> +                                       uint64_t data, unsigned size,
>> +                                       MemTxAttrs attrs)
>> +{
>> +    /* Block insecure writes */
>> +    if (!attrs.secure) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "Non secure writes to the system timestamp
>> generator " \
>> +                      "are invalid\n");
>> +        return MEMTX_ERROR;
>> +    }
>> +
>> +    register_write_memory(opaque, addr, data, size);
>> +
>> +    return MEMTX_OK;
>> +}
>> +
>> +static const MemoryRegionOps arm_gen_timer_ops =3D {
>> +    .read_with_attrs =3D arm_gen_timer_read,
>> +    .write_with_attrs =3D arm_gen_timer_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 4,
>> +        .max_access_size =3D 4,
>> +    },
>> +};
>> +
>> +static const VMStateDescription vmstate_arm_gen_timer =3D {
>> +    .name =3D TYPE_ARM_GEN_TIMER,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .minimum_version_id_old =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, ARMGenTimer, R_ARM_GEN_TIMER_MAX),
>> +        VMSTATE_END_OF_LIST(),
>> +    }
>> +};
>> +
>> +static void arm_gen_timer_init(Object *obj)
>> +{
>> +    ARMGenTimer *s =3D ARM_GEN_TIMER(obj);
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>> +    RegisterInfoArray *reg_array;
>> +
>> +    memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
>> +                          TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
>> +    reg_array =3D
>> +        register_init_block32(DEVICE(obj), arm_gen_timer_regs_info,
>> +                              ARRAY_SIZE(arm_gen_timer_regs_info),
>> +                              s->regs_info, s->regs,
>> +                              &arm_gen_timer_ops,
>> +                              ARM_GEN_TIMER_ERR_DEBUG,
>> +                              R_ARM_GEN_TIMER_MAX * 4);
>> +    memory_region_add_subregion(&s->iomem,
>> +                                A_COUNTER_CONTROL_REGISTER,
>> +                                &reg_array->mem);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +}
>> +
>> +static void arm_gen_timer_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->reset =3D arm_gen_timer_reset;
>> +    dc->vmsd =3D &vmstate_arm_gen_timer;
>> +}
>> +
>> +static const TypeInfo arm_gen_timer_info =3D {
>> +    .name          =3D TYPE_ARM_GEN_TIMER,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(ARMGenTimer),
>> +    .class_init    =3D arm_gen_timer_class_init,
>> +    .instance_init =3D arm_gen_timer_init,
>> +};
>> +
>> +static void arm_gen_timer_register_types(void)
>> +{
>> +    type_register_static(&arm_gen_timer_info);
>> +}
>> +
>> +type_init(arm_gen_timer_register_types)
>> diff --git a/include/hw/timer/arm_generic_timer.h
>> b/include/hw/timer/arm_generic_timer.h
>> new file mode 100644
>> index 0000000..4cc0ac9
>> --- /dev/null
>> +++ b/include/hw/timer/arm_generic_timer.h
>> @@ -0,0 +1,60 @@
>> +/*
>> + * QEMU model of the ARM Generic Timer
>> + *
>> + * Copyright (c) 2016 Xilinx Inc.
>> + * Written by Alistair Francis <alistair.francis@xilinx.com>
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
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS
>> IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef ARM_GEN_TIMER_H
>> +#define ARM_GEN_TIMER_H
>> +
>> +#include "hw/sysbus.h"
>> +#include "hw/register.h"
>> +
>> +#define TYPE_ARM_GEN_TIMER "arm.generic-timer"
>> +#define ARM_GEN_TIMER(obj) \
>> +            OBJECT_CHECK(ARMGenTimer, (obj), TYPE_ARM_GEN_TIMER)
>> +
>> +REG32(COUNTER_CONTROL_REGISTER, 0x00)
>> +    FIELD(COUNTER_CONTROL_REGISTER, EN, 1, 1)
>> +    FIELD(COUNTER_CONTROL_REGISTER, HDBG, 0, 1)
>> +REG32(COUNTER_STATUS_REGISTER, 0x04)
>> +    FIELD(COUNTER_STATUS_REGISTER, DBGH, 1, 1)
>> +REG32(CURRENT_COUNTER_VALUE_LOWER_REGISTER, 0x08)
>> +REG32(CURRENT_COUNTER_VALUE_UPPER_REGISTER, 0x0C)
>> +REG32(BASE_FREQUENCY_ID_REGISTER, 0x20)
>> +
>> +#define R_ARM_GEN_TIMER_MAX (R_BASE_FREQUENCY_ID_REGISTER + 1)
>> +
>> +typedef struct ARMGenTimer {
>> +    /* <private> */
>> +    SysBusDevice parent_obj;
>> +    MemoryRegion iomem;
>> +
>> +    /* <public> */
>> +    bool enabled;
>> +    uint64_t tick_offset;
>> +
>> +    uint32_t regs[R_ARM_GEN_TIMER_MAX];
>> +    RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX];
>> +} ARMGenTimer;
>> +
>> +#endif
>>
>
