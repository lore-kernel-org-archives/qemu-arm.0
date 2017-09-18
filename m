Received: by 10.223.172.38 with SMTP id v35csp3602013wrc;
        Mon, 18 Sep 2017 03:35:42 -0700 (PDT)
X-Received: by 10.200.54.3 with SMTP id m3mr19895975qtb.195.1505730942197;
        Mon, 18 Sep 2017 03:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505730942; cv=none;
        d=google.com; s=arc-20160816;
        b=mPRik6LldN2p2SQqt+KhhU1dnVUHQtpV0Hmc7eFDalHwHEQFlC5rpovizI8KHF8tXO
         u3oH92VqLWsw2emgeJCYqXWnEmiL3mvHNDc0N5Vy/PkASUtxrtFF7027ipoHMGFNLAbQ
         YUacO3gG8h4/mD+CmUBM9gVY8DC5GcVWqsefgc0JUiqSzDf9RcJ0JMupks2T39y+i2OA
         L3uGMIp6yTVS1xJkAsmQvLUTKFE9YDmIyapgoFN3IHRcq8jFySM9mc86OB1SqPnbhjdi
         vnVRfBUdtK+BXEmxgtDYoIrgjWxX0hjibizVpk9/viKZUHrrsPoA2W+52APFgByEdHia
         gxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=RMrTCaCAq2ZbQt7zuGuCU7OEbnjS/6n6+b0AkXAysn0=;
        b=r3Gmlaf5TlKUV0bR7vfbh6Rs4UuYO7RCHCA5/7D5ApJSvzCtpeiefkc2ZzDCfVE2vo
         JPFw7+0jqVVWrIP3sloykAjDEs3yQhKjc5nR1Wl8LJr+nc2gRLYKQ6SvZXMShmvdpYa+
         8EcbQB82PjLyo3BqyfmJdI6XktkRYFyGnB9d2FRCNpX1toWLbJZwUxRSg+LydR+yUJuI
         BekKqNpTr23nJIwdMuHXZ5Khx38fkPC+wlxpTLqIhMurqf18S2T2TR9L7yzjAU6Uv/TM
         eS9m9RSKqzp9dbjIwt0rp5e9QkQQHn6NTMgBrURri7IJNJOvBWbsmfOjhC4XLPkBfxOG
         B4PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JACVHmFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s51si6713495qtc.233.2017.09.18.03.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 03:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JACVHmFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dttOt-0002Ia-TC
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 06:35:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dttOh-0002Ft-ET
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 06:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dttOg-0003jw-7b
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 06:35:27 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:47913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dttOg-0003jf-0y
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 06:35:26 -0400
Received: by mail-wr0-x22a.google.com with SMTP id k20so75096wre.4
	for <qemu-arm@nongnu.org>; Mon, 18 Sep 2017 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RMrTCaCAq2ZbQt7zuGuCU7OEbnjS/6n6+b0AkXAysn0=;
	b=JACVHmFnuP36HLXz2vlioPY2G2xeSVfkNuaYVuofJvOlFtb9veWPE46nJg1kKLHRgb
	aaS986qurmFRUiqJ0tEJwm/vhjcuuec+byWcQFc9TMhOK2JNdanRlK1nbfDLCzqeMKv0
	H+h9gDvBMao2iuiKKEwgvviLC7+IA3P7upO70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RMrTCaCAq2ZbQt7zuGuCU7OEbnjS/6n6+b0AkXAysn0=;
	b=WBsCYsIQscLPWYL/6bOzB0fKw2E8ZyCboyAX6IABnZDZqeLehlF2MhqYx9oUFtAxPE
	EXBCmBL2R8Y3NmJDu4S7WyruKs4u17rpfmTTGdzSMMCkkTj0xiD9fC1se4qXEJ2QKoxA
	5FbBfubXXaH451cmKcqPW5GOl93HhYSeABoU+TpnLF/wyqP6zEdC6xlNIDLx1oucAAGI
	kuKAF8U6JhzezRYfsaKOJ4PmX7KU37BF/+maimFp+X2SHW8cd7FV6X+R1XtKSzLXi8ZK
	K+nl2gfdDfwT+s0i83xZJQv7eeT+6cF5JnGEOSIR0vvLXeThcODGlbP7rmGIzmbcz2m+
	khgg==
X-Gm-Message-State: AHPjjUhkXYLZw9IiObypVZ24WEWNQpbmdNkk3AtdESC/iCRQOGiXdIJa
	RDEvHDFSqpIKka2FQH5WiviWsEA2OGeJtThnfI7dtw==
X-Google-Smtp-Source: ADKCNb7x6xY6qe8iYZMPRxphtQENDY1EEAMY7Qfne0+UQ/qStEdfUJMANx2i6lC/Nv1qq3ooOu2b/2my6t6DG5bgwIc=
X-Received: by 10.223.142.82 with SMTP id n76mr31055674wrb.272.1505730924909; 
	Mon, 18 Sep 2017 03:35:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 18 Sep 2017 03:35:04 -0700 (PDT)
In-Reply-To: <CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2017 11:35:04 +0100
Message-ID: <CAFEAcA9vydmYr81oMazziyi409S+DpQf+RGaCTHfRxXhPj-aYw@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QLVgA6/KEzE0

On 18 September 2017 at 11:17, sundeep subbaraya <sundeep.lkml@gmail.com> w=
rote:
> Hi Philippe,
>
> On Mon, Sep 18, 2017 at 6:31 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
> wrote:
>>
>> Hi Sundeep, Peter,
>>
>>
>> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>>>
>>> Added Sytem register block of Smartfusion2.
>>> This block has PLL registers which are accessed by guest.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>   hw/misc/Makefile.objs         |   1 +
>>>   hw/misc/msf2-sysreg.c         | 168
>>> ++++++++++++++++++++++++++++++++++++++++++
>>>   hw/misc/trace-events          |   5 ++
>>>   include/hw/misc/msf2-sysreg.h |  77 +++++++++++++++++++
>>>   4 files changed, 251 insertions(+)
>>>   create mode 100644 hw/misc/msf2-sysreg.c
>>>   create mode 100644 include/hw/misc/msf2-sysreg.h
>>>
>>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>> index 29fb922..e8f0a02 100644
>>> --- a/hw/misc/Makefile.objs
>>> +++ b/hw/misc/Makefile.objs
>>> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>>   obj-$(CONFIG_AUX) +=3D auxbus.o
>>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>>>   obj-y +=3D mmio_interface.o
>>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
>>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>>> new file mode 100644
>>> index 0000000..dc3597b
>>> --- /dev/null
>>> +++ b/hw/misc/msf2-sysreg.c
>>> @@ -0,0 +1,168 @@
>>> +/*
>>> + * System Register block model of Microsemi SmartFusion2.
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version
>>> + * 2 of the License, or (at your option) any later version.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> along
>>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/log.h"
>>> +#include "hw/misc/msf2-sysreg.h"
>>> +#include "trace.h"
>>> +
>>> +static inline int msf2_divbits(uint32_t div)
>>> +{
>>> +    int ret =3D 0;
>>> +
>>> +    switch (div) {
>>> +    case 1:
>>> +        ret =3D 0;
>>> +        break;
>>> +    case 2:
>>> +        ret =3D 1;
>>> +        break;
>>> +    case 4:
>>> +        ret =3D 2;
>>> +        break;
>>> +    case 8:
>>> +        ret =3D 4;
>>> +        break;
>>> +    case 16:
>>> +        ret =3D 5;
>>> +        break;
>>> +    case 32:
>>> +        ret =3D 6;
>>> +        break;
>>> +    default:
>>> +        break;
>>
>>
>> eh?
>>
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void msf2_sysreg_reset(DeviceState *d)
>>> +{
>>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
>>> +
>>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x021A2358;
>>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
>>> +    s->regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s->apb0div) << 5 |
>>
>>
>> ctz32(s->apb0div) << 5 ...
>
>
> I will modify like below:
> div0 =3D s->apb0div < 8 ? ctz32(s->apb0div) : ctz32(s->apb0div) + 1;
> div1 =3D s->apb1div < 8 ? ctz32(s->apb1div) : ctz32(s->apb1div) + 1;

I think you should keep an msf2_divbits() function for that,
even if it's only

static inline int msf2_divbits(uint32_t div)
{
    int r =3D ctz32(div);

    return (div < 8) ? r : r + 1;
}

thanks
-- PMM
