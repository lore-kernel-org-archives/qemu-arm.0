Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp501968pjq;
        Fri, 31 May 2019 04:28:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4VtFJ/cmRPsKgjUO6YwfJuPaBcUKxm2iXxyLfs+yLOvGMmtIaOzOFjVxcbZPFxMZ2/y1L
X-Received: by 2002:aca:5751:: with SMTP id l78mr5466435oib.55.1559302107486;
        Fri, 31 May 2019 04:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559302107; cv=none;
        d=google.com; s=arc-20160816;
        b=SpdyX71L/yUK2aghGkSREVKCwj2Nkez7T5Bq7baQSEKr+mm0Udzg19RzgnL7KOWCX5
         rYUSy3fzu8/NES7WEYrAnk8bDrDSWeVl+zwoZUIbkfvNekvbj2/0sOFhddp4or3NfHxD
         u+CzRZbStt8yvm5vZHliEOvNEpUfQdtZqJmHnZ17Hv4gDWaH1nQT27QiN0XbGypz8mAC
         MDzdnU/WgE9BWuwtwigfpw3LQp+aG47DxvokmNCStmjyfus2D881jl9F48duMuXO0qfb
         XLJzfNt4ZCOp+/7GAHdBlWBPFzXBSYL+RJ5A7oJgoWCMyaNwoFJL3J0QeXBpiYa0t2Sm
         r0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date;
        bh=y4L/9ZeOELkDRc321uoHguryRYoEX1GN2BGc2Bv2qDk=;
        b=ukXqIbw2NszV8WBUTdaljQilszgXtzmu3WeRBSh5I3bwQ2R52jVTW1j66Rf2fzFLPS
         IQS6rdaPG5yAktgvrVSfdhxWdrTeai4KWUdwstYuvad0lmxjKE2DphHFTgOL4GTSKbUZ
         0okMm1Ka38GxX2a04sdljVnJsPWcbj58Pm7Z+OTppG/anEFXimfP7U/O4HkyNHMqvyyn
         adhPPVrKQz+UBDZYKs8wN/t3yb1pkGqDICFad9zNE+q0LTbBFxyR/r7dVbzVT1agQGcf
         Z30MXSjY9tsH3KlE9rTBklwmGcG8oW+YsIv2cbW2RL2Zn8U1lsy0I3x2sejBx8+Dyz8f
         5/6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mrezanin@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y3si3136449otj.93.2019.05.31.04.28.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 04:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57CDF3082E10;
	Fri, 31 May 2019 11:28:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31BB54EE0D;
	Fri, 31 May 2019 11:28:14 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CA051833001;
	Fri, 31 May 2019 11:28:13 +0000 (UTC)
Date: Fri, 31 May 2019 07:28:09 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, 
	Laurent Vivier <laurent@vivier.eu>
Message-ID: <833530119.25503992.1559302089822.JavaMail.zimbra@redhat.com>
In-Reply-To: <87sgsu51bd.fsf@zen.linaroharston>
References: <20190514155301.16123-1-alex.bennee@linaro.org> <20190514155301.16123-7-alex.bennee@linaro.org> <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com> <87sgsu51bd.fsf@zen.linaroharston>
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.40.204.19, 10.4.195.2]
Thread-Topic: target/arm: use the common interface for WRITE0/WRITEC in arm-semi
Thread-Index: xTt/YjrPnnl2GhGx0+HqPIz9t1252A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 31 May 2019 11:28:20 +0000 (UTC)
X-TUID: ZV1aUGrRR0RH



----- Original Message -----
> From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> To: "Miroslav Rezanina" <mrezanin@redhat.com>
> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>, "R=
iku Voipio" <riku.voipio@iki.fi>,
> qemu-arm@nongnu.org, "Laurent Vivier" <laurent@vivier.eu>
> Sent: Friday, May 31, 2019 1:08:06 PM
> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common in=
terface for WRITE0/WRITEC in arm-semi
>=20
>=20
> Miroslav Rezanina <mrezanin@redhat.com> writes:
>=20
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
> >
> > Hi Alex,
> >
> > this patch breaks build for softmmu target when CONFIG_SEMIHOSTING is n=
ot
> > enabled as qemu_semihosting_console_out
> > is not defined in such case - neither linux-user/arm/semihost.c nor
> > hw/semihosting/console.c compiled and function
> > is not in stubs/semihost.c
>=20
> How do you do that? I tried ../../configure --without-default-devices
> and that still builds for me.

It's usual RHEL way - use --without-default-devices and use specific
list of enabled devices (this mean disable CONFIG_SEMIHOSTING in
default_config/* file).

>=20
> But I suspect what's needed is to change:
>=20
> #ifndef CONFIG_USER_ONLY
>=20
> to
>=20
> #ifdef CONFIG_SEMIHOSTING
>=20
> to the relevant headers and helper bits.

Yeah, have to find out what are relevant pieces.

Mirek

>=20
> >
> > Mirek
>=20
>=20
> --
> Alex Benn=C3=A9e
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer
