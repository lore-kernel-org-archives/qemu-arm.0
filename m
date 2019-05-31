Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp454386pjq;
        Fri, 31 May 2019 03:44:35 -0700 (PDT)
X-Received: by 2002:a67:6f87:: with SMTP id k129mr4869811vsc.225.1559299475775;
        Fri, 31 May 2019 03:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559299475; cv=none;
        d=google.com; s=arc-20160816;
        b=HCDLDgzwSOuEJBTaTH6dwKuTmNr8f2O8qw8UwPzmjnY1wQvSy9zR9YohNdAyRQssXi
         fz2Pc7ePps+RYkUh0txwddn+d2xNW1uMEwDKaaiQIMo8anN4jXbqeCFIf5OVIvlJahz/
         p89MtnMx1YBnUnaO22jlK3sX6uIVJVj713aA0r+WipGFhb2MmvJiqHyNwxyXYVW+Ix7T
         HZVXdlW/bu96vvpUARnMoN25a6B/aTDdDY+jFY9iCaCAyAx8QS8wy1yHoMPSDADU1Yyu
         IkM4ZcQsAwNgkMCaw2py+osRYzncSr1vayqln4oyt666eRfN+941RzowCtF0VaLo1qDF
         OUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=EdhB9JH3Hwhf79ZfXwKSc7iAncNQo6k0AQsUx2P2i0A=;
        b=r5QgIW3CxYZRi67xFmvtml6E4ag1Ypvx8RvPTQzdKIRdJRIxPKuwfM/wVZBRHpWq5p
         hnLOruUT/bVYTr3HfEj/ZljBr7vAbJMF//kx1qOl2lloywWpRh0FTTI8PsDEasl+H9Pe
         cD5jRN4UeyN1uCwabZntaE+c0mnb5vq78IPn7NFvHLcCjIsScAUc+QiGHphP/gTjVbbW
         hYrpOTrqSbH3gaMfiEyta43C2jyvWSOs02YsCS+QtDV+mnF1MtISRYYvNCO/8HsNcyBR
         xECqI9L9w89TrKzbcE60MF1Gm0v44s2dllEqWCQacnAY/gu/TvDdQApHmtqwmym2Dc7a
         DIuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pmathieu@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pmathieu@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pmathieu@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o1sor2737171ual.4.2019.05.31.03.44.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 03:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pmathieu@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pmathieu@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pmathieu@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EdhB9JH3Hwhf79ZfXwKSc7iAncNQo6k0AQsUx2P2i0A=;
        b=Hip4Eyzg0DgCm425nGQudxY1JUf2HXuPi+ZGJB+g9jRbpoe2ITeFxU9c8B1ekSEEgP
         DuYZPObGOZZD52mQhIUzIHJyKUnw+XpukkmeF1vRaZWIRrYQVNYf66160Ud11xm0sPT2
         5rSRQb7jSjr7qaPtyEtqKf2qRRbQVJlPMnywWUXvc/Ma4j7DwfnUn6FFXbDXzSDXj6O1
         TnWxO1fTvPtxYAEwj9zOeSkdhnPWrIBzjMVESloTShpIhjrc1+Vc9+FXQivuaWVjDs7U
         9X0rTLUko8Lb5llGemRKByXiedH9lAihhtulyHieg6ufkLDgYKDF3jD5KmAX/dgijFZe
         UzOQ==
X-Gm-Message-State: APjAAAWfu5UdleyXdck/GrcnHbPgeQDIjXxss70tAE4F163FhgdJMBq4
	oiue8tHk0ZxXVi0rvaQQhbNONqT92GiaeNCktglQn2B/5sI=
X-Google-Smtp-Source: APXvYqzR2Onq3HkFNqNS1n0k3XRe4xn2VvgKtnTXWnExfgb1pn8jFrluOvZyro1zqAdEkRgLFm41NsC2H/f7+IJgigM=
X-Received: by 2002:ab0:698f:: with SMTP id t15mr4914986uaq.34.1559299475418;
 Fri, 31 May 2019 03:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-7-alex.bennee@linaro.org> <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
 <891973f7-2f2b-ad59-70bf-6069382fd977@redhat.com>
In-Reply-To: <891973f7-2f2b-ad59-70bf-6069382fd977@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 31 May 2019 12:44:24 +0200
Message-ID: <CAP+75-UfBN0SKrtcDDhp+anbbFz7u0AjmM=7robpeEPQC6fhKw@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
To: Miroslav Rezanina <mrezanin@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>, Aleksandar Markovic <amarkovic@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DYTAWWR84GY8

On Fri, May 31, 2019 at 12:42 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Miroslav,
>
> On 5/31/19 11:12 AM, Miroslav Rezanina wrote:
> > On Tue, May 14, 2019 at 04:52:56PM +0100, Alex Benn=C3=A9e wrote:
> >> Now we have a common semihosting console interface use that for our
> >> string output. However ARM is currently unique in also supporting
> >> semihosting for linux-user so we need to replicate the API in
> >> linux-user. If other architectures gain this support we can move the
> >> file later.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  linux-user/Makefile.objs  |  2 ++
> >>  linux-user/arm/semihost.c | 24 ++++++++++++++++++++++++
> >>  target/arm/arm-semi.c     | 31 ++++++-------------------------
> >>  3 files changed, 32 insertions(+), 25 deletions(-)
> >>  create mode 100644 linux-user/arm/semihost.c
> >>
> >> diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
> >> index 769b8d83362..285c5dfa17a 100644
> >> --- a/linux-user/Makefile.objs
> >> +++ b/linux-user/Makefile.objs
> >> @@ -6,4 +6,6 @@ obj-y =3D main.o syscall.o strace.o mmap.o signal.o \
> >>  obj-$(TARGET_HAS_BFLT) +=3D flatload.o
> >>  obj-$(TARGET_I386) +=3D vm86.o
> >>  obj-$(TARGET_ARM) +=3D arm/nwfpe/
> >> +obj-$(TARGET_ARM) +=3D arm/semihost.o
> >> +obj-$(TARGET_AARCH64) +=3D arm/semihost.o
> >>  obj-$(TARGET_M68K) +=3D m68k-sim.o
> >> diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
> >> new file mode 100644
> >> index 00000000000..9554102a855
> >> --- /dev/null
> >> +++ b/linux-user/arm/semihost.c
> >> @@ -0,0 +1,24 @@
> >> +/*
> >> + * ARM Semihosting Console Support
> >> + *
> >> + * Copyright (c) 2019 Linaro Ltd
> >> + *
> >> + * Currently ARM is unique in having support for semihosting support
> >> + * in linux-user. So for now we implement the common console API but
> >> + * just for arm linux-user.
> >> + *
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "cpu.h"
> >> +#include "hw/semihosting/console.h"
> >> +#include "qemu.h"
> >> +
> >> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr=
, int len)
> >> +{
> >> +    void *s =3D lock_user_string(addr);
> >> +    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
> >> +    unlock_user(s, addr, 0);
> >> +    return len;
> >> +}
> >> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> >> index 9e5a414dd89..253c66b172a 100644
> >> --- a/target/arm/arm-semi.c
> >> +++ b/target/arm/arm-semi.c
> >> @@ -27,6 +27,7 @@
> >>
> >>  #include "cpu.h"
> >>  #include "hw/semihosting/semihost.h"
> >> +#include "hw/semihosting/console.h"
> >>  #ifdef CONFIG_USER_ONLY
> >>  #include "qemu.h"
> >>
> >> @@ -314,32 +315,12 @@ target_ulong do_arm_semihosting(CPUARMState *env=
)
> >>              return set_swi_errno(ts, close(arg0));
> >>          }
> >>      case TARGET_SYS_WRITEC:
> >> -        {
> >> -          char c;
> >> -
> >> -          if (get_user_u8(c, args))
> >> -              /* FIXME - should this error code be -TARGET_EFAULT ? *=
/
> >> -              return (uint32_t)-1;
> >> -          /* Write to debug console.  stderr is near enough.  */
> >> -          if (use_gdb_syscalls()) {
> >> -                return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,=
1", args);
> >> -          } else {
> >> -                return write(STDERR_FILENO, &c, 1);
> >> -          }
> >> -        }
> >> +    {
> >> +        qemu_semihosting_console_out(env, args, 1);
> >> +        return 0xdeadbeef;
> >> +    }
> >>      case TARGET_SYS_WRITE0:
> >> -        if (!(s =3D lock_user_string(args)))
> >> -            /* FIXME - should this error code be -TARGET_EFAULT ? */
> >> -            return (uint32_t)-1;
> >> -        len =3D strlen(s);
> >> -        if (use_gdb_syscalls()) {
> >> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
> >> -                                   args, len);
> >> -        } else {
> >> -            ret =3D write(STDERR_FILENO, s, len);
> >> -        }
> >> -        unlock_user(s, args, 0);
> >> -        return ret;
> >> +        return qemu_semihosting_console_out(env, args, 0);
> >>      case TARGET_SYS_WRITE:
> >>          GET_ARG(0);
> >>          GET_ARG(1);
> >> --
> >> 2.20.1
> >>
> >>
> >
> > Hi Alex,
> >
> > this patch breaks build for softmmu target when CONFIG_SEMIHOSTING is n=
ot enabled as qemu_semihosting_console_out
> > is not defined in such case - neither linux-user/arm/semihost.c nor hw/=
semihosting/console.c compiled and function
> > is not in stubs/semihost.c

linux-user/arm/semihost.c is not built on softmmu-only build.

> Kinda funny, I noticed the same issue at the same time, and was chatting
> with Alex about it.
>
> I prepared a patch expliciting we can not disable CONFIG_SEMIHOSTING on
> the MIPS arch. Would that work for you?
>
> Regards,
>
> Phil.
