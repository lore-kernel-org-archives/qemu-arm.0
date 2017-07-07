Received: by 10.25.44.15 with SMTP id s15csp303162lfs;
        Fri, 7 Jul 2017 09:34:18 -0700 (PDT)
X-Received: by 10.55.65.22 with SMTP id o22mr68970350qka.213.1499445258244;
        Fri, 07 Jul 2017 09:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499445258; cv=none;
        d=google.com; s=arc-20160816;
        b=BiG1i2TN3/qfmhrDoCls0DgrTLtg56iHb/X8rOQB7CMcWoZXT0kAWHkIHjdqqIOqZ4
         TDEMbdVk0uPyU2LtTng1nbHbIjO6Zy9q9t27wm+bgOGDu7c1ncJeQtmbRiomf12trmih
         NxnZHZSQlVxYshTbdYA68ok5uWc8lbweSVwfirrzh2iPJ5UpE3ujj+d512t7/9z0pxK6
         jUzpNvWiYLLs/ZfNhVykWXMQZ0BNSIYHmNeSPuzy3NIhxA5esQGoURvcSkPD+jVRsj9U
         oemBscpgGv4MThk6oSDkooc0CQN8GdCd8ryWsSkoNmgUS4ijLQ5vTQzElOuT+TJxkN8j
         iFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XdgK9W28K6VVAPD8n8jnJzw9YcqqPyv8G+d3gt302iY=;
        b=gTc0OJhQW9WF46KfrzIuMJ83n39WlApPcpT/s+n3MWh0RBM/wfTyXUKALakqQgb90G
         xjEz3cPVq6PsW4bY2PXdg8puUsXIwiid4joAPK5wrseK3l5DRwMNp1SfnBbgRnm1WY6+
         1CyuSKTUrP6aPKY3ZHBi7AH/pO7AQUVtv4xz/ImNW8BY2H63AxyBPWwd8BfZ+PA6omdz
         2wZ5MbeOSQnLyvBsRbOLW6a3hQ9Gx9gX2XjSyQreKAPGe8MXVTan/3/gNej4Enmixqo2
         5ONWM7gLfSsxhwl94lhGOUViyhmSNg+OWhZq31mTjClCQnrI7F26iifXhX2kIfYj3kjX
         U4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=MJrVubuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si3652583qti.143.2017.07.07.09.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 09:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=MJrVubuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTWCt-0002FZ-Ef
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 12:34:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dTWCn-0002Dh-VV
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 12:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dTWCm-0007jv-Kr
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 12:34:10 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dTWCj-0007is-80; Fri, 07 Jul 2017 12:34:05 -0400
Received: by mail-wr0-x244.google.com with SMTP id 77so8709147wrb.3;
	Fri, 07 Jul 2017 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XdgK9W28K6VVAPD8n8jnJzw9YcqqPyv8G+d3gt302iY=;
	b=MJrVubuv18lX1S5Cnih1Dw8f1HS8dgnadvtxXtLIokhVMsknrYHqgob/RNELR6SUOZ
	YYEOBlrHjHsEGu6wbWD+kBxHVL8XoJCX+Vzr/RCQh0cvZ4Y/Ko1cagYxE2bEhJW+jJDy
	mGC5jJE49CgGNPCaRTVgM31mFk2AjhZkzeJlWN51Cp/2fq7oVa9H9xj3h8YDvGWhmKSg
	Hhdg/aKhvRLviVBZDgkKGgOoUbERtW6PoE3Tu+UG5MysktLT+B5kt4x9CWf2VffmVUhO
	kwyGS1n5Uu2+2iLBF9S0A3Sn0yOqC2Xm34LXhG8FU1bg3A/f70d5cWfoOsF7VsqbbBq0
	xdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XdgK9W28K6VVAPD8n8jnJzw9YcqqPyv8G+d3gt302iY=;
	b=alqnyLL1NqJnxRKqmbVkwh4qaGBUacaZvHzQzl6qa+/3rlizJG2+ckgW52l32Emnmf
	Zm3d7ZfM5zMOVjWADTf2lz5qwGbypIesqabp2l3r1nJ/hvHubshqmmXs7ln3q2/ud8Sc
	D0JhibWS0QKQ7Qzs1ZHEQV3y/VhII8VDaHTDnzTC7J3EXTax9X4/wMcoeynwwdtESQOF
	X7Y9j9071jjDAnw0b9A5tj+Mw38Tv3YfZ5wpUOV9YKJpxPWYZ7f5Yip9SGecjGY2yV0B
	Nls3bVMdFXZuQK4Qtft0ng8r6ZmQxrmkB4Ial2KbfI+1WWpYWLj5UYpS+UVkszzfZ64y
	ZoVg==
X-Gm-Message-State: AIVw110vyf/uf2N3Iwsrrd/lujEjOz0GPgl6D47MzCYcoe/ak6DZjWCg
	d8CaE5915wvk9+GKl1aO3t+Sjv/pkA==
X-Received: by 10.223.168.82 with SMTP id l76mr1376069wrc.37.1499445244007;
	Fri, 07 Jul 2017 09:34:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Fri, 7 Jul 2017 09:33:33 -0700 (PDT)
In-Reply-To: <CALHRZuo7Y2RpS3EWnd55_Te_p2YSo03JcdTYB31MDz7p07bSGA@mail.gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-3-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKORKWWOUSAQ8_GtF6rOspE0mtJOEhJTvfuJ6h7JAru74A@mail.gmail.com>
	<CALHRZuo7Y2RpS3EWnd55_Te_p2YSo03JcdTYB31MDz7p07bSGA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Jul 2017 09:33:33 -0700
Message-ID: <CAKmqyKM7WGg30=TNtPotC-Vr7uYFxZmAuYXWRDjXHDxMM1vhbA@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tX0uhql4ao0i

On Fri, Jul 7, 2017 at 12:08 AM, sundeep subbaraya
<sundeep.lkml@gmail.com> wrote:
> Hi Alistair,
>
> On Wed, Jul 5, 2017 at 11:36 PM, Alistair Francis <alistair23@gmail.com>
> wrote:
>>
>> On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
>> <sundeep.lkml@gmail.com> wrote:
>> > Added Sytem register block of Smartfusion2.
>> > This block has PLL registers which are accessed by guest.
>> >
>> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> > ---
>> >  hw/misc/Makefile.objs         |   1 +
>> >  hw/misc/msf2-sysreg.c         | 200
>> > ++++++++++++++++++++++++++++++++++++++++++
>> >  include/hw/misc/msf2-sysreg.h |  82 +++++++++++++++++
>> >  3 files changed, 283 insertions(+)
>> >  create mode 100644 hw/misc/msf2-sysreg.c
>> >  create mode 100644 include/hw/misc/msf2-sysreg.h
>> >
>> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> > index c8b4893..0f52354 100644
>> > --- a/hw/misc/Makefile.objs
>> > +++ b/hw/misc/Makefile.objs
>> > @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) += edu.o
>> >  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>> >  obj-$(CONFIG_AUX) += auxbus.o
>> >  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>> > +obj-$(CONFIG_MSF2) += msf2-sysreg.o
>> > diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>> > new file mode 100644
>> > index 0000000..64ee141
>> > --- /dev/null
>> > +++ b/hw/misc/msf2-sysreg.c
>> > @@ -0,0 +1,200 @@
>> > +/*
>> > + * System Register block model of Microsemi SmartFusion2.
>> > + *
>> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> > + *
>> > + * This program is free software; you can redistribute it and/or
>> > + * modify it under the terms of the GNU General Public License
>> > + * as published by the Free Software Foundation; either version
>> > + * 2 of the License, or (at your option) any later version.
>> > + *
>> > + * You should have received a copy of the GNU General Public License
>> > along
>> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> > + */
>> > +
>> > +#include "hw/misc/msf2-sysreg.h"
>>
>> Same #include comment from patch 1.
>
>
> Ok will change.
>>
>>
>> > +
>> > +#ifndef MSF2_SYSREG_ERR_DEBUG
>> > +#define MSF2_SYSREG_ERR_DEBUG  0
>> > +#endif
>> > +
>> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> > +    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
>> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
>> > +    } \
>> > +} while (0);
>> > +
>> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> > +
>> > +static inline int msf2_divbits(uint32_t div)
>> > +{
>> > +    int ret = 0;
>> > +
>> > +    switch (div) {
>> > +    case 1:
>> > +        ret = 0;
>> > +        break;
>> > +    case 2:
>> > +        ret = 1;
>> > +        break;
>> > +    case 4:
>> > +        ret = 2;
>> > +        break;
>> > +    case 8:
>> > +        ret = 4;
>> > +        break;
>> > +    case 16:
>> > +        ret = 5;
>> > +        break;
>> > +    case 32:
>> > +        ret = 6;
>> > +        break;
>> > +    default:
>> > +        break;
>> > +    }
>> > +
>> > +    return ret;
>> > +}
>> > +
>> > +static void msf2_sysreg_reset(DeviceState *d)
>> > +{
>> > +    MSF2SysregState *s = MSF2_SYSREG(d);
>> > +
>> > +    DB_PRINT("RESET");
>> > +
>> > +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
>> > +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
>> > +    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |
>> > +                               msf2_divbits(s->apb1div) << 2;
>> > +}
>> > +
>> > +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>> > +    unsigned size)
>> > +{
>> > +    MSF2SysregState *s = opaque;
>> > +    offset /= 4;
>>
>> Probably best to use a bitshift.
>
>
> Ok will change.
>>
>>
>> > +    uint32_t ret = 0;
>> > +
>> > +    if (offset < ARRAY_SIZE(s->regs)) {
>> > +        ret = s->regs[offset];
>> > +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
>> > +                    offset * 4, ret);
>>
>> Bitshift here as well.
>
>
> Ok will change.
>>
>>
>> > +    } else {
>> > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>> > +                    offset * 4);
>> > +    }
>> > +
>> > +    return ret;
>> > +}
>> > +
>> > +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>> > +                          uint64_t val, unsigned size)
>> > +{
>> > +    MSF2SysregState *s = (MSF2SysregState *)opaque;
>> > +    uint32_t newval = val;
>> > +    uint32_t oldval;
>> > +
>> > +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
>> > +            offset, val);
>> > +
>> > +    offset /= 4;
>>
>> Same here
>
>
> Ok will change
>>
>>
>> > +
>> > +    switch (offset) {
>> > +    case MSSDDR_PLL_STATUS:
>> > +        break;
>> > +
>> > +    case ESRAM_CR:
>> > +        oldval = s->regs[ESRAM_CR];
>> > +        if (oldval ^ newval) {
>> > +            qemu_log_mask(LOG_GUEST_ERROR,
>> > +                       TYPE_MSF2_SYSREG": eSRAM remapping not
>> > supported\n");
>> > +            abort();
>>
>> The guest should not be able to kill QEMU, a guest error should never
>> result in an abort.
>
>
> Philippe suggested to abort because:
> If guest tries to remap since firmware do a remap, the code flow will be
> completely wrong.
> Reporting a GUEST_ERROR here is not enough since code flow continuing would
> be
> pretty hard to understand/debug.

I don't see how it will be that hard to debug as QEMU will tell you
that the guest is doing something wrong.

You can't allow the guest to abort or exit QEMU. It's a security
liability issue and specifically mentioned as not allowed:
https://github.com/qemu/qemu/blob/master/HACKING#L230

Thanks,
Alistair

> We decided to abort for now.
