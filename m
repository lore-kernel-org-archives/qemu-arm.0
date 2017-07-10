Received: by 10.25.44.15 with SMTP id s15csp3096405lfs;
        Mon, 10 Jul 2017 01:28:15 -0700 (PDT)
X-Received: by 10.223.129.6 with SMTP id 6mr6220357wrm.23.1499675295903;
        Mon, 10 Jul 2017 01:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499675295; cv=none;
        d=google.com; s=arc-20160816;
        b=X+xC1+5jMf0flDX8AVeNku4LQGQcYEFJ5q8oeeiKdNmrrG4lZDtoJGbs2VHVzn81qK
         BklWaC+pnZLSfO6HnGNDScAs3v5f3JEZN/vacBejZUPdDCXdmf7LA9Pr2MFZs01P2T4N
         EiWndThRp4ROVxGFOmrLySQ4KxukhZr+rHWtvkdHofecC8CX8ZZfAtSjZ+nK6dj7FO4e
         usMhkjaZzOls7YjIeVCbU7V5xnRR176V2GnXQoGfNeoilU/ag5QGK3aSGNt1k7jmuJIk
         v8eNuibeR4BcQQEqKD/NnbiPoXGHsmepJT9Z7kklSHK4wfBemVCdLxlef480BSUkrKJx
         IEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=AW6Er+8yd0Pm8UDE4hJDpksmpRCnKR/83AGw4xnRTEU=;
        b=owjfsGnGZU2GQercXT3p2hZ6ZpA4MRSoV+RiSk1qiTg4er5IooAVq79tsWbdlTb3Pg
         BgnvJ/QYIFUIakIJLl6//VouTX9OsqDlyjTrqpiZ+T3/Nwh0fEzi+O4Ev0ovmN1GQ2Bw
         YXtPlci53AL44HJA99OFlqPO0ku8VR29Ry6Wql2pW4Dwn8naRAuxD9CxEJXn2za9h0DM
         FF5ECxYfkbSHkojVvWqcexzFCq7nKKgBQUx6FpIYEdjbCuIOI4QFZSx5vgvlhZuda90u
         QVrnz0eZNCxGvK1Zaf9JIVWVdNSDfXOlc4NOwPM8nGuO2aMBBJMmYCG/5L06UJ8h2cwv
         DbFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=tTxdJWJS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s8si5830762wmf.75.2017.07.10.01.28.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 01:28:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=tTxdJWJS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUU3C-0001EP-MF
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 04:28:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dUU1z-0000e0-Qn
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 04:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dUU1w-0007pg-KL
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 04:26:59 -0400
Received: from mail-yb0-f193.google.com ([209.85.213.193]:33049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dUU1w-0007Jt-Dg; Mon, 10 Jul 2017 04:26:56 -0400
Received: by mail-yb0-f193.google.com with SMTP id 84so3859192ybe.0;
	Mon, 10 Jul 2017 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rhYDs9zhVtkT/UzftWFXad41kF++RVIKhN+zPR+KozY=;
	b=tTxdJWJSCcu1u4ze+/Gg0ZCFJOoGE6hETx1rVLriGA+ET0dFyWJzO50qnE4XtqTXbG
	+lbL6l0qe9uHxoa/conBKi1PPoCyx/EqKEKjQ0VQ5zKBfDw4BDT/BY6yBG9oQWN1neiB
	cQIdj1hWHQ1Q3kl2KXWIgz3peYb+hfulj5ikGsZb46ZsVLlO5V2Rx6J7kfqsOY+L+8kB
	w3tIvS+OXgUE0ZnAkBdVDq55WJPqxuFOi4g/ZxuiGqxrgbCALyaDFGQdCCqe81EKMuJq
	9OMsD+AmeVQ0CPt4VXe+0EHaXQAb+o2sKOErf0UfZi3keuUj+xYz1qhF9KJu9vdmEoMU
	Iriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rhYDs9zhVtkT/UzftWFXad41kF++RVIKhN+zPR+KozY=;
	b=GCD6ioht3zHObgh0nQOTKXUob/ilwMixXyNJuCxT2P8wK2VYKVskyWQ7MB4/BC00iY
	bEqIvxQMsMzhJNNnZgF+kfTp+2lHKKC7MfdfmM5pvkGIgUkirWl+29eQemTYo/lpSSgf
	4S9fytfuljUVpQSInixFlRIRJlwsaptEo7UuIB9sdRsdaxvN7/3TQP81qRkXMlGsLmbm
	ZhF8LP6HjBeApDNBU73Djnznzo/0CPPpqW57XDYx1I8dSzoMLMPl+lbCKetC2krvjrXt
	Em8l3cLF7dD26Cjcbb69Bsfp8qniX6k7VlrhBNBsw9LXti4+POC//TfZhKyNNDhn9eUL
	PRdA==
X-Gm-Message-State: AIVw110+wA6pnaXhmDXZyj/35f2dTLlUtvYIIMUF8a/vhyZqX4SbtIsL
	3eWU7lFAFObPaumn8/yiYMEb0692eQ==
X-Received: by 10.37.75.198 with SMTP id y189mr7204564yba.47.1499675132112;
	Mon, 10 Jul 2017 01:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.233.5 with HTTP; Mon, 10 Jul 2017 01:25:31 -0700 (PDT)
In-Reply-To: <CAKmqyKM7WGg30=TNtPotC-Vr7uYFxZmAuYXWRDjXHDxMM1vhbA@mail.gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-3-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKORKWWOUSAQ8_GtF6rOspE0mtJOEhJTvfuJ6h7JAru74A@mail.gmail.com>
	<CALHRZuo7Y2RpS3EWnd55_Te_p2YSo03JcdTYB31MDz7p07bSGA@mail.gmail.com>
	<CAKmqyKM7WGg30=TNtPotC-Vr7uYFxZmAuYXWRDjXHDxMM1vhbA@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 10 Jul 2017 13:55:31 +0530
Message-ID: <CALHRZurJgf3r8_pA=vx0=N8L6oo_ZnaQO==yRxtCHhoFZ-pG7w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.193
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v6 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DtGRkytqyZqC

Hi Alistair,

On Fri, Jul 7, 2017 at 10:03 PM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Jul 7, 2017 at 12:08 AM, sundeep subbaraya
> <sundeep.lkml@gmail.com> wrote:
> > Hi Alistair,
> >
> > On Wed, Jul 5, 2017 at 11:36 PM, Alistair Francis <alistair23@gmail.com>
> > wrote:
> >>
> >> On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
> >> <sundeep.lkml@gmail.com> wrote:
> >> > Added Sytem register block of Smartfusion2.
> >> > This block has PLL registers which are accessed by guest.
> >> >
> >> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> > ---
> >> >  hw/misc/Makefile.objs         |   1 +
> >> >  hw/misc/msf2-sysreg.c         | 200
> >> > ++++++++++++++++++++++++++++++++++++++++++
> >> >  include/hw/misc/msf2-sysreg.h |  82 +++++++++++++++++
> >> >  3 files changed, 283 insertions(+)
> >> >  create mode 100644 hw/misc/msf2-sysreg.c
> >> >  create mode 100644 include/hw/misc/msf2-sysreg.h
> >> >
> >> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> >> > index c8b4893..0f52354 100644
> >> > --- a/hw/misc/Makefile.objs
> >> > +++ b/hw/misc/Makefile.objs
> >> > @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) += edu.o
> >> >  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
> >> >  obj-$(CONFIG_AUX) += auxbus.o
> >> >  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
> >> > +obj-$(CONFIG_MSF2) += msf2-sysreg.o
> >> > diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
> >> > new file mode 100644
> >> > index 0000000..64ee141
> >> > --- /dev/null
> >> > +++ b/hw/misc/msf2-sysreg.c
> >> > @@ -0,0 +1,200 @@
> >> > +/*
> >> > + * System Register block model of Microsemi SmartFusion2.
> >> > + *
> >> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> > + *
> >> > + * This program is free software; you can redistribute it and/or
> >> > + * modify it under the terms of the GNU General Public License
> >> > + * as published by the Free Software Foundation; either version
> >> > + * 2 of the License, or (at your option) any later version.
> >> > + *
> >> > + * You should have received a copy of the GNU General Public License
> >> > along
> >> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >> > + */
> >> > +
> >> > +#include "hw/misc/msf2-sysreg.h"
> >>
> >> Same #include comment from patch 1.
> >
> >
> > Ok will change.
> >>
> >>
> >> > +
> >> > +#ifndef MSF2_SYSREG_ERR_DEBUG
> >> > +#define MSF2_SYSREG_ERR_DEBUG  0
> >> > +#endif
> >> > +
> >> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
> >> > +    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
> >> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> >> > +    } \
> >> > +} while (0);
> >> > +
> >> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> >> > +
> >> > +static inline int msf2_divbits(uint32_t div)
> >> > +{
> >> > +    int ret = 0;
> >> > +
> >> > +    switch (div) {
> >> > +    case 1:
> >> > +        ret = 0;
> >> > +        break;
> >> > +    case 2:
> >> > +        ret = 1;
> >> > +        break;
> >> > +    case 4:
> >> > +        ret = 2;
> >> > +        break;
> >> > +    case 8:
> >> > +        ret = 4;
> >> > +        break;
> >> > +    case 16:
> >> > +        ret = 5;
> >> > +        break;
> >> > +    case 32:
> >> > +        ret = 6;
> >> > +        break;
> >> > +    default:
> >> > +        break;
> >> > +    }
> >> > +
> >> > +    return ret;
> >> > +}
> >> > +
> >> > +static void msf2_sysreg_reset(DeviceState *d)
> >> > +{
> >> > +    MSF2SysregState *s = MSF2_SYSREG(d);
> >> > +
> >> > +    DB_PRINT("RESET");
> >> > +
> >> > +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
> >> > +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
> >> > +    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |
> >> > +                               msf2_divbits(s->apb1div) << 2;
> >> > +}
> >> > +
> >> > +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
> >> > +    unsigned size)
> >> > +{
> >> > +    MSF2SysregState *s = opaque;
> >> > +    offset /= 4;
> >>
> >> Probably best to use a bitshift.
> >
> >
> > Ok will change.
> >>
> >>
> >> > +    uint32_t ret = 0;
> >> > +
> >> > +    if (offset < ARRAY_SIZE(s->regs)) {
> >> > +        ret = s->regs[offset];
> >> > +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
> >> > +                    offset * 4, ret);
> >>
> >> Bitshift here as well.
> >
> >
> > Ok will change.
> >>
> >>
> >> > +    } else {
> >> > +        qemu_log_mask(LOG_GUEST_ERROR,
> >> > +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
> __func__,
> >> > +                    offset * 4);
> >> > +    }
> >> > +
> >> > +    return ret;
> >> > +}
> >> > +
> >> > +static void msf2_sysreg_write(void *opaque, hwaddr offset,
> >> > +                          uint64_t val, unsigned size)
> >> > +{
> >> > +    MSF2SysregState *s = (MSF2SysregState *)opaque;
> >> > +    uint32_t newval = val;
> >> > +    uint32_t oldval;
> >> > +
> >> > +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
> >> > +            offset, val);
> >> > +
> >> > +    offset /= 4;
> >>
> >> Same here
> >
> >
> > Ok will change
> >>
> >>
> >> > +
> >> > +    switch (offset) {
> >> > +    case MSSDDR_PLL_STATUS:
> >> > +        break;
> >> > +
> >> > +    case ESRAM_CR:
> >> > +        oldval = s->regs[ESRAM_CR];
> >> > +        if (oldval ^ newval) {
> >> > +            qemu_log_mask(LOG_GUEST_ERROR,
> >> > +                       TYPE_MSF2_SYSREG": eSRAM remapping not
> >> > supported\n");
> >> > +            abort();
> >>
> >> The guest should not be able to kill QEMU, a guest error should never
> >> result in an abort.
> >
> >
> > Philippe suggested to abort because:
> > If guest tries to remap since firmware do a remap, the code flow will be
> > completely wrong.
> > Reporting a GUEST_ERROR here is not enough since code flow continuing
> would
> > be
> > pretty hard to understand/debug.
>
> I don't see how it will be that hard to debug as QEMU will tell you
> that the guest is doing something wrong.
>
> You can't allow the guest to abort or exit QEMU. It's a security
> liability issue and specifically mentioned as not allowed:
> https://github.com/qemu/qemu/blob/master/HACKING#L230
>
> Ok. Lets hear from Philippe. Philippe?

Thanks,
Sundeep


> Thanks,
> Alistair
>
> > We decided to abort for now.
>
