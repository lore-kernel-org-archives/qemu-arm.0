Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1550176wrd;
        Sat, 18 Aug 2018 12:55:24 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwt2Ur4l2Ill2oSMsoe4q6Afe/vLbhE4WP9yxLAP5fcDkVV5rpVdWCmUMhzxdbq9j3vSAxr
X-Received: by 2002:a0c:87e5:: with SMTP id 34-v6mr34769980qvk.30.1534622124157;
        Sat, 18 Aug 2018 12:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534622124; cv=none;
        d=google.com; s=arc-20160816;
        b=lXe83CPDrOooDn6Jg+NXPyqbSt6+xIOuw2wDXWGQrFhqx8zx+jE0+4KfXkSOu2WMq7
         dy7jo7l7Q0JMraGJLDI829SkIJuFU7+I+308048X+WsFYicVy7cPBuzyqLqlmoSvUevX
         GM6W/jtHqD2pxPySOpszLdMbJilen+kznniVjGi5ndymO8X3Z8moroMNYjvR331gmETW
         fP4BuOwJTnzT8D8+wq4yveznQAgpsHPZdC9RPcjw7KM1THPiVnP1BUp72AMjXzFJNNM1
         Q2iCRguqZdjlqwfCbMkaPjtZo3EeX2+++GpB+9LcxCddfdg5TVVkTXpgjEEnhdkvvBfV
         O8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=jIaq9zPs6GKVA5JokaDksrglE4cDhhvmcDqqfMs+We4=;
        b=fzHK3IHxPzLLKr+dx675OfpzxXjrlvlUeif89Bnine3cqxWqIz/M00xpYg/g/ZI81+
         SufdGkEFmk6B5MVXVKJA4SqqCdjtvJFJM6TadoLjDn+8H6orCivfUOJi9M4Gq5b1fVP7
         O8ivcS3Trc9gMb4F/LdFuUatKKs7Jgc/fgTFonX+U2gGZINLFV+giodbCbxN0jD+0az2
         7s5lgeXFTtLZBhTakQglaBYwsK78+unL8m45SJMMzmDNB0XbI3WXppnLcZ+Qq1OIBY73
         bZNzfBWGg1sJfF2cdarhdJiR6ig4UQORCURFGaeKjcCtjw/fKHwIARtB4rFBySAUUkN8
         HS7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FFo8aX2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g25-v6si3352322qkm.263.2018.08.18.12.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 12:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FFo8aX2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fr7Jj-00040w-K4
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 15:55:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr7JU-0003xk-IL
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 15:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr7JT-0005J6-B6
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 15:55:08 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:35769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr7JO-0005Hw-RO; Sat, 18 Aug 2018 15:55:02 -0400
Received: by mail-vk0-x243.google.com with SMTP id w193-v6so1013511vke.2;
	Sat, 18 Aug 2018 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jIaq9zPs6GKVA5JokaDksrglE4cDhhvmcDqqfMs+We4=;
	b=FFo8aX2GVl0zYyvAhrDMiLeOwjwOSvrryXcTKDjReV8w5R5Bal6gqeq1DlXlMd1npU
	ixeDn1zi/ylCIesjARyOCX2bcOba8dEVLZpotsi0ZlQ93dyYh3AggWLXFF0JwZuZSyra
	WQHwPkKuOPQ3TuOlOjOGDzxXY2FeGox+5KaEtY0tskq0Sj6AiRVE/VDUHQi0FphwTEIp
	atxTjOb+rZJsTYD3zVH/xfqY+bZFVNQo2FtuIYOgy3qQuUaGbWSWZpkur6mpnfvJJkYZ
	ml6wZx05lCjNW+D7hKQ7Sjuv6clRqZPae/y+GNG/tczO4hi+7ZUkIUwUh02MAexa4bn6
	gIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jIaq9zPs6GKVA5JokaDksrglE4cDhhvmcDqqfMs+We4=;
	b=gtGqbXgV1ufVW6LDibnEhxI8q9x/l0RV+lcON9vUINSdtoed6EAG0tLoErWkz8vVuI
	OHEeKG471NkwKO+INtdl9KuDxzT1KbSY/klYNv+jX7F0XqbtOgM1xuc3UVm1Exp61HNZ
	wgcmBarI4xExQzu74H2D5FCQ+cZ5Qt16Vx8OzEjv1Aj3wOe3wv415X1OG4DlCz/BMGm8
	xXpHIEmcKYNBJpyAqhHDxbsiq4UshhkX96CPpDpl2MeoeVg/dSiFu6wvRJ6AnyOO+agN
	PtgaP6LN4z3PTWybvDTiI1vLRu6qOpFSn/Omqe60lj0U9t5sIZb0zMCWQBv0SHiV+58j
	A9Vw==
X-Gm-Message-State: AOUpUlHNiUpTR3eyclb14nWRpmD14QEPyQfbMIiqNaWwkd0CBdiLWIPN
	AAQle7JDabyLTm42WTun42DtMQ2K
X-Received: by 2002:a1f:9f87:: with SMTP id
	i129-v6mr25830494vke.64.1534622102143; 
	Sat, 18 Aug 2018 12:55:02 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	j2-v6sm3582875uag.48.2018.08.18.12.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:55:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-6-peter.maydell@linaro.org>
	<34fd5e4b-4b39-65be-d1e9-a655f656dbc9@amsat.org>
	<CAFEAcA-NEBa3cyHAMsSJ6o45-KO1oHewRc9QEApFCt0SX+8AkA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <3a1800ea-8430-6296-7746-87ec89a4ef9c@amsat.org>
Date: Sat, 18 Aug 2018 16:54:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NEBa3cyHAMsSJ6o45-KO1oHewRc9QEApFCt0SX+8AkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
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
X-TUID: Sz4PDzbLGl61

On 08/18/2018 07:04 AM, Peter Maydell wrote:
> On 18 August 2018 at 01:23, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>>> The Arm IoTKit includes a system control element which
>>> provides a block of read-only ID registers and a block
>>> of read-write control registers. Implement a minimal
>>> version of this.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  hw/misc/Makefile.objs           |   1 +
>>>  include/hw/misc/iotkit-sysctl.h |  50 +++++
>>>  hw/misc/iotkit-sysctl.c         | 324 ++++++++++++++++++++++++++++++++
>>>  MAINTAINERS                     |   2 +
>>>  default-configs/arm-softmmu.mak |   1 +
>>>  hw/misc/trace-events            |   7 +
>>>  6 files changed, 385 insertions(+)
>>>  create mode 100644 include/hw/misc/iotkit-sysctl.h
>>>  create mode 100644 hw/misc/iotkit-sysctl.c
>>>
>>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>> index 93509008451..dbadb41d57a 100644
>>> --- a/hw/misc/Makefile.objs
>>> +++ b/hw/misc/Makefile.objs
>>> @@ -65,6 +65,7 @@ obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
>>>  obj-$(CONFIG_TZ_MPC) += tz-mpc.o
>>>  obj-$(CONFIG_TZ_PPC) += tz-ppc.o
>>>  obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
>>> +obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
>>>
>>>  obj-$(CONFIG_PVPANIC) += pvpanic.o
>>>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>>> diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
>>> new file mode 100644
>>> index 00000000000..c3b14ccee4c
>>> --- /dev/null
>>> +++ b/include/hw/misc/iotkit-sysctl.h
>>> @@ -0,0 +1,50 @@
>>> +/*
>>> + * ARM IoTKit system control element
>>> + *
>>> + * Copyright (c) 2018 Linaro Limited
>>> + * Written by Peter Maydell
>>> + *
>>> + *  This program is free software; you can redistribute it and/or modify
>>> + *  it under the terms of the GNU General Public License version 2 or
>>> + *  (at your option) any later version.
>>> + */
>>> +
>>> +/*
>>> + * This is a model of the "system control element" which is part of the
>>> + * Arm IoTKit and documented in
>>> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
>>> + * Specifically, it implements the "system information block" and
>>> + * "system control register" blocks.
>>> + *
>>> + * QEMU interface:
>>> + *  + sysbus MMIO region 0: the system information register bank
>>> + *  + sysbus MMIO region 1: the system control register bank
>>> + */
>>> +
>>> +#ifndef HW_MISC_IOTKIT_SYSCTL_H
>>> +#define HW_MISC_IOTKIT_SYSCTL_H
>>> +
>>> +#include "hw/sysbus.h"
>>> +
>>> +#define TYPE_IOTKIT_SYSCTL "iotkit-sysctl"
>>> +#define IOTKIT_SYSCTL(obj) OBJECT_CHECK(IoTKitSysCtl, (obj), \
>>> +                                        TYPE_IOTKIT_SYSCTL)
>>> +
>>> +typedef struct IoTKitSysCtl {
>>> +    /*< private >*/
>>> +    SysBusDevice parent_obj;
>>> +
>>> +    /*< public >*/
>>> +    MemoryRegion sysinfo_iomem;
>>> +    MemoryRegion sysctl_iomem;
>>> +
>>> +    uint32_t secure_debug;
>>> +    uint32_t reset_syndrome;
>>> +    uint32_t reset_mask;
>>> +    uint32_t gretreg;
>>> +    uint32_t initsvrtor0;
>>> +    uint32_t cpuwait;
>>> +    uint32_t wicctrl;
>>> +} IoTKitSysCtl;
>>> +
>>> +#endif
>>> diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
>>> new file mode 100644
>>> index 00000000000..9445500be76
>>> --- /dev/null
>>> +++ b/hw/misc/iotkit-sysctl.c
>>> @@ -0,0 +1,324 @@
>>> +/*
>>> + * ARM IoTKit system control element
>>> + *
>>> + * Copyright (c) 2018 Linaro Limited
>>> + * Written by Peter Maydell
>>> + *
>>> + *  This program is free software; you can redistribute it and/or modify
>>> + *  it under the terms of the GNU General Public License version 2 or
>>> + *  (at your option) any later version.
>>> + */
>>> +
>>> +/*
>>> + * This is a model of the "system control element" which is part of the
>>> + * Arm IoTKit and documented in
>>> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
>>> + * Specifically, it implements the "system information block" and
>>> + * "system control register" blocks.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/log.h"
>>> +#include "trace.h"
>>> +#include "qapi/error.h"
>>> +#include "sysemu/sysemu.h"
>>> +#include "hw/sysbus.h"
>>> +#include "hw/registerfields.h"
>>> +#include "hw/misc/iotkit-sysctl.h"
>>> +
>>> +/* sysinfo block registers */
>>> +REG32(SYS_VERSION, 0x0)
>>> +REG32(SYS_CONFIG, 0x4)
>>
>> I find it a bit confuse to have the both SYSINFO/SYSCONTROL in the same
>> "iotkit-sysctl" device. They share the same state but there is no
>> particular need for it, then you need connect them as 2 different
>> devices in iotkit_realize but they have the same name "iotkit-sysctl".
>>
>> Why not declare 2 different TypeInfo? I am probably missing what state
>> they need to share.
> 
> You're right, they don't share anything internally. It just
> seemed a bit unnecessary to have a device that implements
> 2 read-only registers and nothing else. It probably is better
> to split them up, though.

Whichever you prefer is fine by me.

>>> +    /*
>>> +     * Most of the state here has to do with control of reset and
>>> +     * similar kinds of power up -- for instance the guest can ask
>>> +     * what the reason for the last reset was, or forbid reset for
>>> +     * some causes (like the non-secure watchdog). Most of this is
>>> +     * not relevant to QEMU, which doesn't really model anything other
>>> +     * than a full power-on reset.
>>> +     * We just model the registers as reads-as-written.
>>> +     */
>>> +
>>> +    switch (offset) {
>>> +    case A_RESET_SYNDROME:
>>> +        qemu_log_mask(LOG_UNIMP,
>>> +                      "IoTKit SysCtl RESET_SYNDROME unimplemented\n");
>>
>> Maybe warn_report() or warn_once() is more appropriate than UNIMP?
> 
> LOG_UNIMP is what we generally use for warning about accesses
> to unimplemented registers.

Hmm yes, but I understand the warn* API as intended for generic user who
could report to the list if this code is hit, and the LOG_UNIMP for QEMU
developer. Often UNIMP logged registers can be ignored in normal flow,
but for this particular case I wonder if it is safe to silently continue
for generic user not using "-d unimp".

>>> +    case A_SWRESET:
>>> +        /* One w/o bit to request a reset; all other bits reserved */
>>> +        if (value & R_SWRESET_SWRESETREQ_MASK) {
>>> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>>> +        }
>>
>> Shouldn't this be:
>>
>>            } else {
>>                cpu_reset(...);
>>            }
> 
> Why? The register function is "write 1 to request a system reset".
> Writing a zero does nothing.

Hmm OK, I misinterpreted the datasheet:

"Software Reset Request. Set to HIGH to request a system reset."
I understood as implicit "Set to LOW to request a software reset."

>>> +        break;
>>> +    case A_BUSWAIT:        /* In IoTKit BUSWAIT is reserved, R/O, zero */
>>> +    case A_SECDBGSTAT:
>>> +    case A_PID4 ... A_CID3:
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "IoTKit SysCtl write: write of RO offset %x\n",
>>> +                      (int)offset);
>>> +        break;
>>> +    default:
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                      "IoTKit SysCtl write: bad offset %x\n", (int)offset);
>>> +        break;
>>> +    }
>>> +}
>>> +
>>> +static const MemoryRegionOps iotkit_sysctl_ops = {
>>> +    .read = iotkit_sysctl_read,
>>> +    .write = iotkit_sysctl_write,
>>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>> +    /* byte/halfword accesses are just zero-padded on reads and writes */
>>> +    .impl.min_access_size = 4,
>>> +    .impl.max_access_size = 4,
>>> +    .valid.min_access_size = 1,
>>> +    .valid.max_access_size = 4,
>>> +};
>>> +
>>> +static void iotkit_sysctl_reset(DeviceState *dev)
>>> +{
>>> +    IoTKitSysCtl *s = IOTKIT_SYSCTL(dev);
>>> +
>>> +    trace_iotkit_sysctl_reset();
>>> +    s->secure_debug = 0;
>>> +    s->reset_syndrome = 1;
>>> +    s->reset_mask = 0;
>>> +    s->gretreg = 0;
>>> +    s->initsvrtor0 = 0x10000000;
>>
>> This one could be a property (now now ;) ).
> 
> It could be, but given that we don't actually support letting
> the guest change the SVRTOR reset value on the CPU for the
> next reset I think that would be overkill.

Sure, not now.

>>> +    s->cpuwait = 0;
>>> +    s->wicctrl = 0;
>>> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
