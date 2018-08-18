Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1119654wrd;
        Sat, 18 Aug 2018 03:09:13 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwOjLNtnwzU00oHFJ1mCh2h3Q4kOhmZrpqNXqbSj7VPCCM06vWN2Z1XPK3Yuh/w7xxS/ahD
X-Received: by 2002:aed:3e14:: with SMTP id l20-v6mr37175463qtf.62.1534586953729;
        Sat, 18 Aug 2018 03:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534586953; cv=none;
        d=google.com; s=arc-20160816;
        b=a998o1DSGNswE691/n5LhZNixMwHWBrO55dAyFOZ7WCwV05TO7fhwPcI8HGiIGkART
         H0/QJMXK8nMYWQ5Zr816/q04iicwvrQ/7j9SHGUIKb/qqUFGjIKJn6KHOKyKL+ZeCyS7
         ZBFiHBMA+SUSH4X1OpkqTCRcblxadDIXW+h7m/EXQ8I6MiC78IFydxiOaG8F2T3dRFt6
         n/jzDG45yQHVw8DEV/GzhWQESfBav3HIoF4oTNA7Zp8rv+Zgt+eN7EANQtAYWRNsWjyP
         OAWx5ymsZVX+J25KIjSNQToEWv8XW+EFKmsQ6ovEByJzKA8bA8CuBkY+QF7Dv7u2g/t2
         MJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=zDITG42+hUEvQgX4iOGu3k5DVrVibUNh+ttrOzQ9OCM=;
        b=nmT8p/cbe+9b+EB4dYcN5atr8PIgTKVUWyjGwbJd3pJXUgzv9SivNcREQuj0JGCy5L
         YOGGRcZf9XZMamNLUc8TwqlbLAMgTozaSFMmkiFBtJTD7j2Xgpu6+op7dAVq5tLgAukK
         92XX9LWdgt5s6vhlOFZFEJpOrssUzRj11qrfLNXeUr8yQa+bIzFodfhKly8ETsp3hPOu
         Vmwd+e5gCJoQKRg5PMPFOk+bweoQsPf/BSvFqNYwKccHh4cZPRBlknkt/JuXkinekpkV
         GPtMtMpo/vOxldITp6Nk8fX6nO03Yp6QXpGwk3cGFE10mipr3rS17QX8zfXUOw4WRQ1i
         +uAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/z14Gt3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j15-v6si302745qkk.361.2018.08.18.03.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 03:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/z14Gt3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqyAT-0007Zj-4P
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 06:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqyAB-0007H0-3f
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqy6F-0005ul-SZ
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:04:53 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqy6F-0005r6-E0
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:04:51 -0400
Received: by mail-oi0-x243.google.com with SMTP id m11-v6so18195735oic.2
	for <qemu-arm@nongnu.org>; Sat, 18 Aug 2018 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zDITG42+hUEvQgX4iOGu3k5DVrVibUNh+ttrOzQ9OCM=;
	b=T/z14Gt3BG1NDZ3/Nat01p1tcE/jUgVlkN/lBIAOqlMrRxfIo8YVetD+ylrlj+CHNV
	yGe7tfprefnncPzs30NHk/cI+wiigx1n2lZTS+NvV2z3ioMGap2F1QR/su6/AaEmHSyv
	7MuK+UNN5L7Y0YRKChuQg9j0kJ9eYeh7gepWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zDITG42+hUEvQgX4iOGu3k5DVrVibUNh+ttrOzQ9OCM=;
	b=Jbd4Peiv3M9xorHmoL9adDzsIojTEM5sLU7hXjNBOcXiprgBFGzgKg35VvWSR/wMYL
	NV58VM32pMQP8z05/EF28bweoPDHLxYYmdwigzIsknRQBnNO41JkwEE/3hBwXu2FYSiO
	CCp9rD/J6rsGDhiacF5BNlIHLbR6EqAOrp2NnX/huCv/wOvkExM+maW44K/SrbLgkK+5
	ED/ZSEtpef9ipe1Ase+hsjycc5af3eybETnHFzcgMI40tTESQxjpr/CdiZX2lyjBdBZl
	hwXMwWf0hSFVO5xjXMWGT9UTDTQE0B2l4lF1/LwK8x7ckPLiGbqQkK3RTJWPgGVsA4bi
	h69Q==
X-Gm-Message-State: AOUpUlHLIi/4I3G+f92r6L/MC7Ue6kU00S7QOwaAfdFplAT82IV9LeOU
	HSx00X8ELfSmcZTTwcoUSSiW6BAN5yTKA1SL0IfNug==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr5705840oif.212.1534586690744; 
	Sat, 18 Aug 2018 03:04:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sat, 18 Aug 2018 03:04:30
	-0700 (PDT)
In-Reply-To: <34fd5e4b-4b39-65be-d1e9-a655f656dbc9@amsat.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-6-peter.maydell@linaro.org>
	<34fd5e4b-4b39-65be-d1e9-a655f656dbc9@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Aug 2018 11:04:30 +0100
Message-ID: <CAFEAcA-NEBa3cyHAMsSJ6o45-KO1oHewRc9QEApFCt0SX+8AkA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 05/16] hw/misc/iotkit-sysctl: Implement
 IoTKit system control element
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9f68yYZk9W0Z

On 18 August 2018 at 01:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> Hi Peter,
>
> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>> The Arm IoTKit includes a system control element which
>> provides a block of read-only ID registers and a block
>> of read-write control registers. Implement a minimal
>> version of this.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/misc/Makefile.objs           |   1 +
>>  include/hw/misc/iotkit-sysctl.h |  50 +++++
>>  hw/misc/iotkit-sysctl.c         | 324 ++++++++++++++++++++++++++++++++
>>  MAINTAINERS                     |   2 +
>>  default-configs/arm-softmmu.mak |   1 +
>>  hw/misc/trace-events            |   7 +
>>  6 files changed, 385 insertions(+)
>>  create mode 100644 include/hw/misc/iotkit-sysctl.h
>>  create mode 100644 hw/misc/iotkit-sysctl.c
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 93509008451..dbadb41d57a 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -65,6 +65,7 @@ obj-$(CONFIG_MPS2_SCC) +=3D mps2-scc.o
>>  obj-$(CONFIG_TZ_MPC) +=3D tz-mpc.o
>>  obj-$(CONFIG_TZ_PPC) +=3D tz-ppc.o
>>  obj-$(CONFIG_IOTKIT_SECCTL) +=3D iotkit-secctl.o
>> +obj-$(CONFIG_IOTKIT_SYSCTL) +=3D iotkit-sysctl.o
>>
>>  obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
>>  obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>> diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sy=
sctl.h
>> new file mode 100644
>> index 00000000000..c3b14ccee4c
>> --- /dev/null
>> +++ b/include/hw/misc/iotkit-sysctl.h
>> @@ -0,0 +1,50 @@
>> +/*
>> + * ARM IoTKit system control element
>> + *
>> + * Copyright (c) 2018 Linaro Limited
>> + * Written by Peter Maydell
>> + *
>> + *  This program is free software; you can redistribute it and/or modif=
y
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +/*
>> + * This is a model of the "system control element" which is part of the
>> + * Arm IoTKit and documented in
>> + * http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ecm060=
1256/index.html
>> + * Specifically, it implements the "system information block" and
>> + * "system control register" blocks.
>> + *
>> + * QEMU interface:
>> + *  + sysbus MMIO region 0: the system information register bank
>> + *  + sysbus MMIO region 1: the system control register bank
>> + */
>> +
>> +#ifndef HW_MISC_IOTKIT_SYSCTL_H
>> +#define HW_MISC_IOTKIT_SYSCTL_H
>> +
>> +#include "hw/sysbus.h"
>> +
>> +#define TYPE_IOTKIT_SYSCTL "iotkit-sysctl"
>> +#define IOTKIT_SYSCTL(obj) OBJECT_CHECK(IoTKitSysCtl, (obj), \
>> +                                        TYPE_IOTKIT_SYSCTL)
>> +
>> +typedef struct IoTKitSysCtl {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion sysinfo_iomem;
>> +    MemoryRegion sysctl_iomem;
>> +
>> +    uint32_t secure_debug;
>> +    uint32_t reset_syndrome;
>> +    uint32_t reset_mask;
>> +    uint32_t gretreg;
>> +    uint32_t initsvrtor0;
>> +    uint32_t cpuwait;
>> +    uint32_t wicctrl;
>> +} IoTKitSysCtl;
>> +
>> +#endif
>> diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
>> new file mode 100644
>> index 00000000000..9445500be76
>> --- /dev/null
>> +++ b/hw/misc/iotkit-sysctl.c
>> @@ -0,0 +1,324 @@
>> +/*
>> + * ARM IoTKit system control element
>> + *
>> + * Copyright (c) 2018 Linaro Limited
>> + * Written by Peter Maydell
>> + *
>> + *  This program is free software; you can redistribute it and/or modif=
y
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +/*
>> + * This is a model of the "system control element" which is part of the
>> + * Arm IoTKit and documented in
>> + * http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ecm060=
1256/index.html
>> + * Specifically, it implements the "system information block" and
>> + * "system control register" blocks.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "trace.h"
>> +#include "qapi/error.h"
>> +#include "sysemu/sysemu.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/registerfields.h"
>> +#include "hw/misc/iotkit-sysctl.h"
>> +
>> +/* sysinfo block registers */
>> +REG32(SYS_VERSION, 0x0)
>> +REG32(SYS_CONFIG, 0x4)
>
> I find it a bit confuse to have the both SYSINFO/SYSCONTROL in the same
> "iotkit-sysctl" device. They share the same state but there is no
> particular need for it, then you need connect them as 2 different
> devices in iotkit_realize but they have the same name "iotkit-sysctl".
>
> Why not declare 2 different TypeInfo? I am probably missing what state
> they need to share.

You're right, they don't share anything internally. It just
seemed a bit unnecessary to have a device that implements
2 read-only registers and nothing else. It probably is better
to split them up, though.

>> +    /*
>> +     * Most of the state here has to do with control of reset and
>> +     * similar kinds of power up -- for instance the guest can ask
>> +     * what the reason for the last reset was, or forbid reset for
>> +     * some causes (like the non-secure watchdog). Most of this is
>> +     * not relevant to QEMU, which doesn't really model anything other
>> +     * than a full power-on reset.
>> +     * We just model the registers as reads-as-written.
>> +     */
>> +
>> +    switch (offset) {
>> +    case A_RESET_SYNDROME:
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      "IoTKit SysCtl RESET_SYNDROME unimplemented\n");
>
> Maybe warn_report() or warn_once() is more appropriate than UNIMP?

LOG_UNIMP is what we generally use for warning about accesses
to unimplemented registers.


>> +    case A_SWRESET:
>> +        /* One w/o bit to request a reset; all other bits reserved */
>> +        if (value & R_SWRESET_SWRESETREQ_MASK) {
>> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> +        }
>
> Shouldn't this be:
>
>            } else {
>                cpu_reset(...);
>            }

Why? The register function is "write 1 to request a system reset".
Writing a zero does nothing.


>> +        break;
>> +    case A_BUSWAIT:        /* In IoTKit BUSWAIT is reserved, R/O, zero =
*/
>> +    case A_SECDBGSTAT:
>> +    case A_PID4 ... A_CID3:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "IoTKit SysCtl write: write of RO offset %x\n",
>> +                      (int)offset);
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "IoTKit SysCtl write: bad offset %x\n", (int)offs=
et);
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps iotkit_sysctl_ops =3D {
>> +    .read =3D iotkit_sysctl_read,
>> +    .write =3D iotkit_sysctl_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    /* byte/halfword accesses are just zero-padded on reads and writes =
*/
>> +    .impl.min_access_size =3D 4,
>> +    .impl.max_access_size =3D 4,
>> +    .valid.min_access_size =3D 1,
>> +    .valid.max_access_size =3D 4,
>> +};
>> +
>> +static void iotkit_sysctl_reset(DeviceState *dev)
>> +{
>> +    IoTKitSysCtl *s =3D IOTKIT_SYSCTL(dev);
>> +
>> +    trace_iotkit_sysctl_reset();
>> +    s->secure_debug =3D 0;
>> +    s->reset_syndrome =3D 1;
>> +    s->reset_mask =3D 0;
>> +    s->gretreg =3D 0;
>> +    s->initsvrtor0 =3D 0x10000000;
>
> This one could be a property (now now ;) ).

It could be, but given that we don't actually support letting
the guest change the SVRTOR reset value on the CPU for the
next reset I think that would be overkill.

>> +    s->cpuwait =3D 0;
>> +    s->wicctrl =3D 0;
>> +}

thanks
-- PMM
