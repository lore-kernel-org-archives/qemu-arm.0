Received: by 10.25.44.15 with SMTP id s15csp4488288lfs;
        Mon, 31 Jul 2017 23:08:31 -0700 (PDT)
X-Received: by 10.237.45.69 with SMTP id h63mr18938769qtd.230.1501567711113;
        Mon, 31 Jul 2017 23:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501567711; cv=none;
        d=google.com; s=arc-20160816;
        b=FSI+73Wl+BOKwiUGc32dOH43C4FO2YBuDf288wWo1wS9ZQ0jC9jxzASrCQr8KR99n1
         5MZ4VNknkMaHAImlVZ8udNgNLFGgUKel9hmqTOu6PBLDnusfSCeRNsgB4B46v6qQUn2R
         wuby+qRzbz+DueHzPiHhrDc6FVYn4AhivrCoS/PhMy6Mc8OUfxUqq49Ix+IoB04jm3qN
         /B2XdzXYeG/zW2cJJ/8rMd3BaP+5L/gLxyq2D4IjPL1JZGnO/MpCw75unsMo/vFiJ+5Q
         F/oCbVP3FlHEB5by9s1L4ukd1qPJBUixj76bEoB74kOF94YeQJ+ONYrP6iy+7P5eitB/
         r9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yqb/tC2puwrabtt4R5PhETbZjFHfX1kYNw+PhI/zs6U=;
        b=RItIfpkdu/KACF5FLv8xRdHgD+S030SbQeWQmtzNgIem+iZHg/oIMVKmYyjTQvXfVe
         Q9n0ijtUrq6n/mUT7X4e4V/9ri1qL+XhKvbBsNTvhk/7VYTs4NCP8T+CvoVi3ezkCo72
         RCm+P4ArLbsGZn0+mPLRzGPag+fNN6G6U8HkqLlieW8iu/Uvfwea24Wru1fM3qVHDyD6
         LxnkMnF1JjX/6dVu9CsyaTl9if2AgVoWF/Nuddd1usk4VmcmVAygQsWYXX6Awst/PmcG
         4dHCFf9bFN2eZJmvoqthTlyBYhDL+6YeFw1pjruzzBjU0hBsfqfNdqGwgyDwWOzH4Fb4
         XjYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=TT8yZYfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b44si24523469qtc.47.2017.07.31.23.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 23:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=TT8yZYfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcQM0-0007KF-1M
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 02:08:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dcQLr-0007Ic-RK
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 02:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dcQLp-0005x3-SE
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 02:08:19 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:36891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dcQLg-0005vA-OU; Tue, 01 Aug 2017 02:08:08 -0400
Received: by mail-vk0-x241.google.com with SMTP id r199so298279vke.4;
	Mon, 31 Jul 2017 23:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yqb/tC2puwrabtt4R5PhETbZjFHfX1kYNw+PhI/zs6U=;
	b=TT8yZYfA5E+HlTwtZJHvEEAT3chjW2jgxI4ZIOZp8KPMwUt0wMrwyEC23etxPOpKv8
	tJ9W9z6wP3YMPwmXXze0B3vuFuo1AXPhbdyjs8mQSRa01Dr3xjdHLyOLYYf4ho4zxnwG
	+cIx+exUjaapzDXL04iyoH8Jf5oPGcYH4OeyPOmOKwU3HMCEvmjQ/CiV5h8RrU3yLXlb
	tgN6N7yjqLu97n7YjZ5PshcL21Qo3sfsvgPGqPZ5uYooD46hJ0j0toqs0w8OsPKy9BKd
	s3p5FKw5/pXyVFCIedVjAB+eRgJlUnttMGtzsEA5yyy0ogYmBgxlFN7H3ZG7O2dvDC+n
	lTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yqb/tC2puwrabtt4R5PhETbZjFHfX1kYNw+PhI/zs6U=;
	b=okYkH3OpPEKWtOaKYGsgUgpris0uSDd7HrcwLCzdzFCL//SAM4vwm0RFuuvZiKzRE0
	HX6AkhPCXbPxlnV6WG3VDDrWLmyrQDjqsA5ZLsnpwN3V5tQkppaOH3+bJa4j6wmA6rPI
	MDB+8TRAzzTHyBdxTSZiOdXNhffpDInlI7z2Tux26RnXnGt8O6fV95+bjCZnDhYvzOHO
	XJiYYMTyl6ao2dCNUdoP3lNrvohESEeloy9b/yA7v9BBJmN/9opK5kuGUxif9yl9ROfa
	2icR8N7/OvrnJhOREJ3WUHS8UyD3CEmY8WhjrFilpLw2BJcVdBvhIrgbG8Wzla4dcwj8
	Oigw==
X-Gm-Message-State: AIVw110Dc4TmlqXbbrV8UbCY9XVKT3RAg7U3qoAPrLgriOvspo8P/b3l
	1VFUX1VYffJrgTnXuUtib6+KgfpE5w==
X-Received: by 10.31.149.151 with SMTP id x145mr12063245vkd.139.1501567686186; 
	Mon, 31 Jul 2017 23:08:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.83.139 with HTTP; Mon, 31 Jul 2017 23:08:05 -0700 (PDT)
In-Reply-To: <CALHRZupSqy8Tu-Pb5nWPY8dz-qduwNt7exVGXBO45EEoU-mqww@mail.gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-3-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKORKWWOUSAQ8_GtF6rOspE0mtJOEhJTvfuJ6h7JAru74A@mail.gmail.com>
	<CALHRZuo7Y2RpS3EWnd55_Te_p2YSo03JcdTYB31MDz7p07bSGA@mail.gmail.com>
	<CAKmqyKM7WGg30=TNtPotC-Vr7uYFxZmAuYXWRDjXHDxMM1vhbA@mail.gmail.com>
	<CALHRZurJgf3r8_pA=vx0=N8L6oo_ZnaQO==yRxtCHhoFZ-pG7w@mail.gmail.com>
	<CALHRZuo2WuZRWgDnfoE+cyi9ypPxdKQdH7XTrDuWK_SU1b=z2w@mail.gmail.com>
	<CALHRZupSqy8Tu-Pb5nWPY8dz-qduwNt7exVGXBO45EEoU-mqww@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 1 Aug 2017 11:38:05 +0530
Message-ID: <CALHRZuovDOou9nR5U0BmEdp_qu9N_ym+UnsxmnBwF3=jWwmQEQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114259e48a9bda0555aaf89e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: Re: [Qemu-arm] [Qemu devel v6 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block.
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k7CgbtmoX6zM

--001a114259e48a9bda0555aaf89e
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

Ping again :)

Thanks,
Sundeep

On Fri, Jul 21, 2017 at 2:50 PM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi,
>
> Ping
>
> On Thu, Jul 13, 2017 at 7:51 AM, sundeep subbaraya <sundeep.lkml@gmail.com
> > wrote:
>
>> Hi Phiiippe,
>>
>> Gentle reminder.
>>
>> Thanks,
>> Sundeep
>>
>>
>> On Mon, Jul 10, 2017 at 1:55 PM, sundeep subbaraya <
>> sundeep.lkml@gmail.com> wrote:
>>
>>> Hi Alistair,
>>>
>>> On Fri, Jul 7, 2017 at 10:03 PM, Alistair Francis <alistair23@gmail.com>
>>> wrote:
>>>
>>>> On Fri, Jul 7, 2017 at 12:08 AM, sundeep subbaraya
>>>> <sundeep.lkml@gmail.com> wrote:
>>>> > Hi Alistair,
>>>> >
>>>> > On Wed, Jul 5, 2017 at 11:36 PM, Alistair Francis <
>>>> alistair23@gmail.com>
>>>> > wrote:
>>>> >>
>>>> >> On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
>>>> >> <sundeep.lkml@gmail.com> wrote:
>>>> >> > Added Sytem register block of Smartfusion2.
>>>> >> > This block has PLL registers which are accessed by guest.
>>>> >> >
>>>> >> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>>> >> > ---
>>>> >> >  hw/misc/Makefile.objs         |   1 +
>>>> >> >  hw/misc/msf2-sysreg.c         | 200
>>>> >> > ++++++++++++++++++++++++++++++++++++++++++
>>>> >> >  include/hw/misc/msf2-sysreg.h |  82 +++++++++++++++++
>>>> >> >  3 files changed, 283 insertions(+)
>>>> >> >  create mode 100644 hw/misc/msf2-sysreg.c
>>>> >> >  create mode 100644 include/hw/misc/msf2-sysreg.h
>>>> >> >
>>>> >> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>>> >> > index c8b4893..0f52354 100644
>>>> >> > --- a/hw/misc/Makefile.objs
>>>> >> > +++ b/hw/misc/Makefile.objs
>>>> >> > @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) += edu.o
>>>> >> >  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>>>> >> >  obj-$(CONFIG_AUX) += auxbus.o
>>>> >> >  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>>>> >> > +obj-$(CONFIG_MSF2) += msf2-sysreg.o
>>>> >> > diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>>>> >> > new file mode 100644
>>>> >> > index 0000000..64ee141
>>>> >> > --- /dev/null
>>>> >> > +++ b/hw/misc/msf2-sysreg.c
>>>> >> > @@ -0,0 +1,200 @@
>>>> >> > +/*
>>>> >> > + * System Register block model of Microsemi SmartFusion2.
>>>> >> > + *
>>>> >> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>>> >> > + *
>>>> >> > + * This program is free software; you can redistribute it and/or
>>>> >> > + * modify it under the terms of the GNU General Public License
>>>> >> > + * as published by the Free Software Foundation; either version
>>>> >> > + * 2 of the License, or (at your option) any later version.
>>>> >> > + *
>>>> >> > + * You should have received a copy of the GNU General Public
>>>> License
>>>> >> > along
>>>> >> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
>>>> >> > + */
>>>> >> > +
>>>> >> > +#include "hw/misc/msf2-sysreg.h"
>>>> >>
>>>> >> Same #include comment from patch 1.
>>>> >
>>>> >
>>>> > Ok will change.
>>>> >>
>>>> >>
>>>> >> > +
>>>> >> > +#ifndef MSF2_SYSREG_ERR_DEBUG
>>>> >> > +#define MSF2_SYSREG_ERR_DEBUG  0
>>>> >> > +#endif
>>>> >> > +
>>>> >> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
>>>> >> > +    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
>>>> >> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
>>>> >> > +    } \
>>>> >> > +} while (0);
>>>> >> > +
>>>> >> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>>>> >> > +
>>>> >> > +static inline int msf2_divbits(uint32_t div)
>>>> >> > +{
>>>> >> > +    int ret = 0;
>>>> >> > +
>>>> >> > +    switch (div) {
>>>> >> > +    case 1:
>>>> >> > +        ret = 0;
>>>> >> > +        break;
>>>> >> > +    case 2:
>>>> >> > +        ret = 1;
>>>> >> > +        break;
>>>> >> > +    case 4:
>>>> >> > +        ret = 2;
>>>> >> > +        break;
>>>> >> > +    case 8:
>>>> >> > +        ret = 4;
>>>> >> > +        break;
>>>> >> > +    case 16:
>>>> >> > +        ret = 5;
>>>> >> > +        break;
>>>> >> > +    case 32:
>>>> >> > +        ret = 6;
>>>> >> > +        break;
>>>> >> > +    default:
>>>> >> > +        break;
>>>> >> > +    }
>>>> >> > +
>>>> >> > +    return ret;
>>>> >> > +}
>>>> >> > +
>>>> >> > +static void msf2_sysreg_reset(DeviceState *d)
>>>> >> > +{
>>>> >> > +    MSF2SysregState *s = MSF2_SYSREG(d);
>>>> >> > +
>>>> >> > +    DB_PRINT("RESET");
>>>> >> > +
>>>> >> > +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
>>>> >> > +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
>>>> >> > +    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |
>>>> >> > +                               msf2_divbits(s->apb1div) << 2;
>>>> >> > +}
>>>> >> > +
>>>> >> > +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>>>> >> > +    unsigned size)
>>>> >> > +{
>>>> >> > +    MSF2SysregState *s = opaque;
>>>> >> > +    offset /= 4;
>>>> >>
>>>> >> Probably best to use a bitshift.
>>>> >
>>>> >
>>>> > Ok will change.
>>>> >>
>>>> >>
>>>> >> > +    uint32_t ret = 0;
>>>> >> > +
>>>> >> > +    if (offset < ARRAY_SIZE(s->regs)) {
>>>> >> > +        ret = s->regs[offset];
>>>> >> > +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
>>>> >> > +                    offset * 4, ret);
>>>> >>
>>>> >> Bitshift here as well.
>>>> >
>>>> >
>>>> > Ok will change.
>>>> >>
>>>> >>
>>>> >> > +    } else {
>>>> >> > +        qemu_log_mask(LOG_GUEST_ERROR,
>>>> >> > +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>>>> __func__,
>>>> >> > +                    offset * 4);
>>>> >> > +    }
>>>> >> > +
>>>> >> > +    return ret;
>>>> >> > +}
>>>> >> > +
>>>> >> > +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>>> >> > +                          uint64_t val, unsigned size)
>>>> >> > +{
>>>> >> > +    MSF2SysregState *s = (MSF2SysregState *)opaque;
>>>> >> > +    uint32_t newval = val;
>>>> >> > +    uint32_t oldval;
>>>> >> > +
>>>> >> > +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
>>>> >> > +            offset, val);
>>>> >> > +
>>>> >> > +    offset /= 4;
>>>> >>
>>>> >> Same here
>>>> >
>>>> >
>>>> > Ok will change
>>>> >>
>>>> >>
>>>> >> > +
>>>> >> > +    switch (offset) {
>>>> >> > +    case MSSDDR_PLL_STATUS:
>>>> >> > +        break;
>>>> >> > +
>>>> >> > +    case ESRAM_CR:
>>>> >> > +        oldval = s->regs[ESRAM_CR];
>>>> >> > +        if (oldval ^ newval) {
>>>> >> > +            qemu_log_mask(LOG_GUEST_ERROR,
>>>> >> > +                       TYPE_MSF2_SYSREG": eSRAM remapping not
>>>> >> > supported\n");
>>>> >> > +            abort();
>>>> >>
>>>> >> The guest should not be able to kill QEMU, a guest error should never
>>>> >> result in an abort.
>>>> >
>>>> >
>>>> > Philippe suggested to abort because:
>>>> > If guest tries to remap since firmware do a remap, the code flow will
>>>> be
>>>> > completely wrong.
>>>> > Reporting a GUEST_ERROR here is not enough since code flow continuing
>>>> would
>>>> > be
>>>> > pretty hard to understand/debug.
>>>>
>>>> I don't see how it will be that hard to debug as QEMU will tell you
>>>> that the guest is doing something wrong.
>>>>
>>>> You can't allow the guest to abort or exit QEMU. It's a security
>>>> liability issue and specifically mentioned as not allowed:
>>>> https://github.com/qemu/qemu/blob/master/HACKING#L230
>>>>
>>>> Ok. Lets hear from Philippe. Philippe?
>>>
>>> Thanks,
>>> Sundeep
>>>
>>>
>>>> Thanks,
>>>> Alistair
>>>>
>>>> > We decided to abort for now.
>>>>
>>>
>>>
>>
>

--001a114259e48a9bda0555aaf89e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div><br></div><div>Ping again :)</div><div><b=
r></div><div>Thanks,</div><div>Sundeep</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Fri, Jul 21, 2017 at 2:50 PM, sundeep s=
ubbaraya <span dir=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" ta=
rget=3D"_blank">sundeep.lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>Ping</div></div=
><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Thu, Jul 13, 2017 at 7:51 AM, sundeep subbaraya =
<span dir=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_=
blank">sundeep.lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div><div><div>Hi Phiiippe,<br><br></div>Gentle=
 reminder.<br><br></div>Thanks,<br></div>Sundeep<div><div class=3D"m_-67716=
00896789195029h5"><br><div><div><div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Mon, Jul 10, 2017 at 1:55 PM, sundeep subbaraya <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blan=
k">sundeep.lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">Hi Alistair,<br><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote"><div><div class=3D"m_-6771600896789195029m_-85970889=
6791943715h5">On Fri, Jul 7, 2017 at 10:03 PM, Alistair Francis <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alis=
tair23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv class=3D"m_-6771600896789195029m_-859708896791943715m_-93359706495473616=
3HOEnZb"><div class=3D"m_-6771600896789195029m_-859708896791943715m_-933597=
064954736163h5">On Fri, Jul 7, 2017 at 12:08 AM, sundeep subbaraya<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">sundeep.lkm=
l@gmail.com</a>&gt; wrote:<br>
&gt; Hi Alistair,<br>
&gt;<br>
&gt; On Wed, Jul 5, 2017 at 11:36 PM, Alistair Francis &lt;<a href=3D"mailt=
o:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep<br>
&gt;&gt; &lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">su=
ndeep.lkml@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Added Sytem register block of Smartfusion2.<br>
&gt;&gt; &gt; This block has PLL registers which are accessed by guest.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundee=
p.lkml@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 200<br>
&gt;&gt; &gt; ++++++++++++++++++++++++++++++<wbr>++++++++++++<br>
&gt;&gt; &gt;=C2=A0 include/hw/misc/msf2-sysreg.h |=C2=A0 82 ++++++++++++++=
+++<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 283 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 hw/misc/msf2-sysreg.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 include/hw/misc/msf2-sysreg.h<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br=
>
&gt;&gt; &gt; index c8b4893..0f52354 100644<br>
&gt;&gt; &gt; --- a/hw/misc/Makefile.objs<br>
&gt;&gt; &gt; +++ b/hw/misc/Makefile.objs<br>
&gt;&gt; &gt; @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) +=3D edu.o<br>
&gt;&gt; &gt;=C2=A0 obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o<br>
&gt;&gt; &gt;=C2=A0 obj-$(CONFIG_AUX) +=3D auxbus.o<br>
&gt;&gt; &gt;=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.=
o<br>
&gt;&gt; &gt; +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
&gt;&gt; &gt; diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c<br=
>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000..64ee141<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/hw/misc/msf2-sysreg.c<br>
&gt;&gt; &gt; @@ -0,0 +1,200 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * System Register block model of Microsemi SmartFusion2.<br=
>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailt=
o:sundeep.lkml@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<=
br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * This program is free software; you can redistribute it an=
d/or<br>
&gt;&gt; &gt; + * modify it under the terms of the GNU General Public Licen=
se<br>
&gt;&gt; &gt; + * as published by the Free Software Foundation; either vers=
ion<br>
&gt;&gt; &gt; + * 2 of the License, or (at your option) any later version.<=
br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * You should have received a copy of the GNU General Public=
 License<br>
&gt;&gt; &gt; along<br>
&gt;&gt; &gt; + * with this program; if not, see &lt;<a href=3D"http://www.=
gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/=
licenses/</a>&gt;<wbr>.<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
&gt;&gt;<br>
&gt;&gt; Same #include comment from patch 1.<br>
&gt;<br>
&gt;<br>
&gt; Ok will change.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#ifndef MSF2_SYSREG_ERR_DEBUG<br>
&gt;&gt; &gt; +#define MSF2_SYSREG_ERR_DEBUG=C2=A0 0<br>
&gt;&gt; &gt; +#endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (MSF2_SYSREG_ERR_DEBUG &gt;=3D lvl) { \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &q=
uot;\n&quot;, __func__, ## args); \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 } \<br>
&gt;&gt; &gt; +} while (0);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<b=
r>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static inline int msf2_divbits(uint32_t div)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 switch (div) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 1:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 2:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 4:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 2;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 8:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 4;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 16:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 5;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 32:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 6;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void msf2_sysreg_reset(DeviceState *d)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(d);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;RESET&quot;);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS_LOW_<wbr>CR] =3D =
0x021A2358;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS] =3D 0x3;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s=
-&gt;apb0div) &lt;&lt; 5 |<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msf2_divbits(s-&gt;apb1=
div) &lt;&lt; 2;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset=
,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 unsigned size)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 offset /=3D 4;<br>
&gt;&gt;<br>
&gt;&gt; Probably best to use a bitshift.<br>
&gt;<br>
&gt;<br>
&gt; Ok will change.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot;=
 HWADDR_PRIx &quot; data: 0x%08&quot; PRIx32,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offset * 4, ret);<br>
&gt;&gt;<br>
&gt;&gt; Bitshift here as well.<br>
&gt;<br>
&gt;<br>
&gt; Ok will change.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __f=
unc__,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offset * 4);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void msf2_sysreg_write(void *opaque, hwaddr offset,<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val, unsigned size)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D (MSF2SysregState *)opaq=
ue;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 uint32_t newval =3D val;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 uint32_t oldval;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_PRIx &=
quot; data: 0x%08&quot; PRIx64,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset, val);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 offset /=3D 4;<br>
&gt;&gt;<br>
&gt;&gt; Same here<br>
&gt;<br>
&gt;<br>
&gt; Ok will change<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case MSSDDR_PLL_STATUS:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case ESRAM_CR:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[ESRAM_CR];=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eSRAM remapping not<br>
&gt;&gt; &gt; supported\n&quot;);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;&gt;<br>
&gt;&gt; The guest should not be able to kill QEMU, a guest error should ne=
ver<br>
&gt;&gt; result in an abort.<br>
&gt;<br>
&gt;<br>
&gt; Philippe suggested to abort because:<br>
&gt; If guest tries to remap since firmware do a remap, the code flow will =
be<br>
&gt; completely wrong.<br>
&gt; Reporting a GUEST_ERROR here is not enough since code flow continuing =
would<br>
&gt; be<br>
&gt; pretty hard to understand/debug.<br>
<br>
</div></div>I don&#39;t see how it will be that hard to debug as QEMU will =
tell you<br>
that the guest is doing something wrong.<br>
<br>
You can&#39;t allow the guest to abort or exit QEMU. It&#39;s a security<br=
>
liability issue and specifically mentioned as not allowed:<br>
<a href=3D"https://github.com/qemu/qemu/blob/master/HACKING#L230" rel=3D"no=
referrer" target=3D"_blank">https://github.com/qemu/qemu/b<wbr>lob/master/H=
ACKING#L230</a><br>
<br></blockquote></div></div><div>Ok. Lets hear from Philippe. Philippe?<br=
><br></div><div>Thanks,<br></div><div>Sundeep<br>=C2=A0<br></div><span><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
Thanks,<br>
Alistair<br>
<div class=3D"m_-6771600896789195029m_-859708896791943715m_-933597064954736=
163HOEnZb"><div class=3D"m_-6771600896789195029m_-859708896791943715m_-9335=
97064954736163h5"><br>
&gt; We decided to abort for now.<br>
</div></div></blockquote></span></div><br></div></div>
</blockquote></div><br></div></div></div></div></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114259e48a9bda0555aaf89e--
