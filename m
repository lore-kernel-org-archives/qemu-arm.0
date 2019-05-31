Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp462253pjq;
        Fri, 31 May 2019 03:53:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwn1A4vgaaYKdhltG4xVp1QpQbyGMAr8QMS+hrQuYw+A/dKghPXU+aMj9NLiwduzlpmhLoD
X-Received: by 2002:a9d:6499:: with SMTP id g25mr1272988otl.184.1559299988039;
        Fri, 31 May 2019 03:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559299988; cv=none;
        d=google.com; s=arc-20160816;
        b=MLCk7+K/jH1oDyiP8ja1tT+iqJFHQa8h+WF0xvn8REsw9EJYwBjgqUjIn2pezUG8Us
         b/mQ6SFoMwtlF4oR4K/NWdLPPJfi5JsCP7eqUjB6KLQ4hEer5uSkoDyDg9OVVx07ysoP
         pEDqATVzIigdJHwQDIjOYTTme+7plYrjI/GRlgzDBbfdb7ZGLhlpmdKbWkT/FdXm3rPa
         Yly6vMgoISR49VKoh4dU83Q6jI125vVWHWDbnhqidiblVnhPDaj/F92Cc6UEYa4vxLHL
         e2IteTH+l1qrW3by3R3OwJMW74PMSJlA7sgIOimY/vbqfhmYUAEWK+dRARSkGgWV6Rvq
         ZBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date;
        bh=kEOjmzahp2Epeo+ADfrR4MR/mLordC7teYG9IdyRtSE=;
        b=viEgc9+1ArLi5q37MdbW7pNMYBNMMlEhH1HimXFhBR6hMtpvsERP+UAfpcro9MSkTf
         OMrCShURrG1mx1ARWXYcl2J19x+JVVNuqVCK91soZm2dGlFV6OU5NADCJnI/Yc7+Wkaz
         Z2H8k19upCW8PA4NTR4VONGvZE90OhSskhMYR3xrqPW9s3g1HyfI3S03T3vWEd42lZhP
         AjxK4/YCbvXLIng7YRk1t0+uDywW4Nd2c/T4pJ8AV8UMMOLRhox9x5CatvcaBbbRJzy+
         DL0/f6UliTYgqTE7aJaQ27FrbGI1g2iKgrhzkDtAkTWGDMZmoawRIXi19wCp/KgAWd4+
         Jzhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mrezanin@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q12si2890193otn.260.2019.05.31.03.53.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 03:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40A509FFDC;
	Fri, 31 May 2019 10:53:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3183E5C231;
	Fri, 31 May 2019 10:53:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3BE61833001;
	Fri, 31 May 2019 10:53:06 +0000 (UTC)
Date: Fri, 31 May 2019 06:53:06 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>
Message-ID: <1114171465.25499225.1559299986641.JavaMail.zimbra@redhat.com>
In-Reply-To: <891973f7-2f2b-ad59-70bf-6069382fd977@redhat.com>
References: <20190514155301.16123-1-alex.bennee@linaro.org> <20190514155301.16123-7-alex.bennee@linaro.org> <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com> <891973f7-2f2b-ad59-70bf-6069382fd977@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.40.204.19, 10.4.195.20]
Thread-Topic: target/arm: use the common interface for WRITE0/WRITEC in arm-semi
Thread-Index: FMkgSbddiIEaW1q7rvUruGFdTIErjw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 31 May 2019 10:53:07 +0000 (UTC)
X-TUID: 9gX9/s8oTe8l


----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: "Miroslav Rezanina" <mrezanin@redhat.com>, "Alex Benn=C3=A9e" <alex.b=
ennee@linaro.org>
> Cc: "Peter Maydell" <peter.maydell@linaro.org>, "Riku Voipio" <riku.voipi=
o@iki.fi>, qemu-devel@nongnu.org,
> qemu-arm@nongnu.org, "Laurent Vivier" <laurent@vivier.eu>, "Aleksandar Ma=
rkovic" <amarkovic@wavecomp.com>
> Sent: Friday, May 31, 2019 12:42:46 PM
> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common in=
terface for WRITE0/WRITEC in arm-semi
>=20
> Hi Miroslav,
>=20
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
,
> >> int len)
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
> >> =20
> >>  #include "cpu.h"
> >>  #include "hw/semihosting/semihost.h"
> >> +#include "hw/semihosting/console.h"
> >>  #ifdef CONFIG_USER_ONLY
> >>  #include "qemu.h"
> >> =20
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
1",
> >> args);
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
> >=20
> > Hi Alex,
> >=20
> > this patch breaks build for softmmu target when CONFIG_SEMIHOSTING is n=
ot
> > enabled as qemu_semihosting_console_out
> > is not defined in such case - neither linux-user/arm/semihost.c nor
> > hw/semihosting/console.c compiled and function
> > is not in stubs/semihost.c
>=20
> Kinda funny, I noticed the same issue at the same time, and was chatting
> with Alex about it.
>=20
> I prepared a patch expliciting we can not disable CONFIG_SEMIHOSTING on
> the MIPS arch. Would that work for you?
>=20
> Regards,
>=20
> Phil.
>=20

Hi Phil,

we've got problem with build for AArch64 where SEMIHOSTING cannot be disabl=
ed too:

target/arm/helper.c use do_arm_semihosting=20

Mirek



--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer
