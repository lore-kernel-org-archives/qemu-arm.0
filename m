Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1373327lfe;
        Tue, 17 Mar 2020 03:45:38 -0700 (PDT)
X-Received: by 2002:adf:ce12:: with SMTP id p18mr5167874wrn.88.1584441938645;
        Tue, 17 Mar 2020 03:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584441938; cv=none;
        d=google.com; s=arc-20160816;
        b=PnhgHas/YZKuYRxjiBfyghUO/Ybya6olDIDdjsUK7cUsJ+KnlP1is9r0Fwz58FYOq4
         edVWSYBjmk/FBhR9EKrllRKhzZA/BqJOyM7IewDb4+anD3+1AwWoUgs7sIAWnLS9TgEk
         DbMkDUqWAWx+UhMq0h/YFM/0yYdsDiQllAJD5XjAss5frEUlvUFFLvYOXkPvoibyYDWV
         lieB9ihQo0yGQVItKyCLnI1nHexaTz/MNOYCoP/nYJ452qEHlMUyB9e0rF+31i2YeakB
         d5DTG7DgMTBB9V6+pkIg0K6CzRxxrZMsoJ33ePaqQzv2pYP1Fln41HY7qk1WPBInpx0E
         uXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cG0+Tw2MoGN7C/riLxUa3AlBIsSXCDnmaYVircrkrMU=;
        b=DzvOwEnUZWQrwsPA0uEFVvbxIMdFcHrUG2TJYJjAM5VZSDDwadRI7VQYWoR74zVHS0
         Cvuobo4OJvKKYZrYFv7yzHvxUf9IcpMlD5VB+ZLvdG72ftFyzAbhTu/kXHDL9ZDgI1cd
         34yyV3gI37Fg/1X9Eyel38T28H8byUrS0phaLsMy1j4UARAxsaAGcY6uXrQGFaHTf2lc
         gd0+UKoIF3mAHOKrcS3NOWI7cU016pgeI8ALpCCz2BEmObbYzjGWplvXYFYzFZJ90uO3
         tESempxfiBmnGMC2Kr+fh2ifOwUsMiTKkB31O82lPLJ7WGYljfO4U6LclRK6dfsB+a+x
         tsfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uZdEQioM;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.qemu.devel@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s5sor1675166wrb.50.2020.03.17.03.45.38
        (Google Transport Security);
        Tue, 17 Mar 2020 03:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uZdEQioM;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cG0+Tw2MoGN7C/riLxUa3AlBIsSXCDnmaYVircrkrMU=;
        b=uZdEQioMM6iN6B38QrPgpSlli5TIfy0zHxLi0SwiqWxbOtacS0+pnEqZVWx5lLmMX1
         J31kXbhKNoVn0Zc2Enc66vae9ogLrAFSAu9mWmG2H0dmw3umDxBWldj8rPs+o5MS0o5j
         Wo9vBiUNsMwczMqhYhQNWZ+TB3VWJ2l4tvr1ZlxBgKJFgJ0gmAIs00QpzauSSkhOk9m9
         UoWzQ/4UBKPQcBgO3DK8vjb5LcG+Jx4nObVRvkYpROG7RiAuqI1Kwv32o0Cx9xFOJPI1
         iHXYTIyGXy1J7BifuYYM07JHDPwcSLSnRcimEXkWgS/rLA1Uqnaa36jAU3Ztw79x6Pva
         IFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cG0+Tw2MoGN7C/riLxUa3AlBIsSXCDnmaYVircrkrMU=;
        b=U+QsEbHO5uQH6U1ua6VKr6PDiQqnqbjLHDh7k4Ytk8JmOw5Dpp6K2ag8FcRJhpXn2Q
         nkN8YggGDBX9QFyRpUjJjudNj8DCip/NQB7M6Rd8hRrIQpC75z//IITj5N0K5yz79AxT
         sto/2RB32QnFtxcIkM/K279zhkZLmZQTYjUcP2xOOsdZxfplRYrRct27kAsfo5V87wjf
         n1AB0oDCaAbLp5UAOsEJZVE6cgIl885NDIHkqzX9o+u/BNd3//shdL5zd0ReQs25EDz0
         u0xLifDapadFahdecea1baMUXKsT6eJe/ajWyOzit5ZXVqh27vJ0MGQlFyA23cgjj3TE
         LCiw==
X-Gm-Message-State: ANhLgQ1IC/GliWnWpebvmvBBUbbEssTp8JKaQStaudoc8NJoo4tyMLMA
	cVgkEyBc+9otjG3OZZp69IrJIo4a1Pz4iSBnMQk=
X-Google-Smtp-Source: ADFU+vt7Js4pgcgRflHF4Vhqrrj5CVi/f0Dws12kKSEqnKA5TR7tJGh4TrVzyF97okdHJTa0+2QOf9f/lKarM05sYXw=
X-Received: by 2002:adf:e9cc:: with SMTP id l12mr5317024wrn.420.1584441938187;
 Tue, 17 Mar 2020 03:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200316172155.971-1-alex.bennee@linaro.org> <20200316172155.971-25-alex.bennee@linaro.org>
 <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com>
In-Reply-To: <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Tue, 17 Mar 2020 11:45:27 +0100
Message-ID: <CAHiYmc5CtAH-zs38YmyLkrrp2DnxzLUWNKBTcL+oyFNEiCsV8A@mail.gmail.com>
Subject: Re: [PATCH v1 24/28] tests/tcg/aarch64: add SVE iotcl test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: C6NKuknIs4EF

=D1=83=D1=82=D0=BE, 17. =D0=BC=D0=B0=D1=80 2020. =D1=83 11:33 Philippe Math=
ieu-Daud=C3=A9 <philmd@redhat.com>
=D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> > This is a fairly bare-bones test of setting the various vector sizes
> > for SVE which will only fail if the PR_SVE_SET_VL can't reduce the
> > user-space vector length by powers of 2.
> >
> > However we will also be able to use it in a future test which
> > exercises the GDB stub.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

I think it would be clearer and better if you used used the
word "prctl" rather than "ioctl" in both title/commit message
and code (including comments).

I think it is also a little problematic that tests like this reside
and belong in tests/tcg - since they deal more with elements
of kernel interface (system call prctl()), rather than TCG.
Still, I see there are many other similar cases in tests/tcg,
so probably (at this moment) one should't bother about it in
the context of this patch. However, in general, the location
/tests/tcg for all these cases seems wrong to me.

Sincerely,
Aleksandar

> >
> > ---
> > v3
> >    - use index to fill zreg
> >    - CROSS_CC_HAS_SVE
> > v5
> >    - merge conflicts
> > v6
> >    - drop id check
> > ---
> >   tests/tcg/aarch64/sve-ioctls.c    | 70 ++++++++++++++++++++++++++++++=
+
> >   tests/tcg/aarch64/Makefile.target |  4 ++
> >   2 files changed, 74 insertions(+)
> >   create mode 100644 tests/tcg/aarch64/sve-ioctls.c
> >
> > diff --git a/tests/tcg/aarch64/sve-ioctls.c b/tests/tcg/aarch64/sve-ioc=
tls.c
> > new file mode 100644
> > index 00000000000..9544dffa0ee
> > --- /dev/null
> > +++ b/tests/tcg/aarch64/sve-ioctls.c
> > @@ -0,0 +1,70 @@
> > +/*
> > + * SVE ioctls tests
> > + *
> > + * Test the SVE width setting ioctls work and provide a base for
> > + * testing the gdbstub.
> > + *
> > + * Copyright (c) 2019 Linaro Ltd
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#include <sys/prctl.h>
> > +#include <asm/hwcap.h>
> > +#include <stdio.h>
> > +#include <sys/auxv.h>
> > +#include <stdint.h>
> > +#include <stdlib.h>
> > +
> > +#ifndef HWCAP_CPUID
> > +#define HWCAP_CPUID (1 << 11)
> > +#endif
> > +
> > +#define SVE_MAX_QUADS  (2048 / 128)
> > +#define BYTES_PER_QUAD (128 / 8)
> > +
> > +#define get_cpu_reg(id) ({                                      \
> > +            unsigned long __val;                                \
> > +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
> > +            __val;                                              \
> > +        })
> > +
> > +static int do_sve_ioctl_test(void)
> > +{
> > +    int i, res, init_vq;
> > +
> > +    res =3D prctl(PR_SVE_GET_VL, 0, 0, 0, 0);
> > +    if (res < 0) {
> > +        printf("FAILED to PR_SVE_GET_VL (%d)", res);
> > +        return -1;
> > +    }
> > +    init_vq =3D res & PR_SVE_VL_LEN_MASK;
> > +
> > +    for (i =3D init_vq; i > 15; i /=3D 2) {
> > +        printf("Checking PR_SVE_SET_VL=3D%d\n", i);
> > +        res =3D prctl(PR_SVE_SET_VL, i, 0, 0, 0, 0);
> > +        if (res < 0) {
> > +            printf("FAILED to PR_SVE_SET_VL (%d)", res);
> > +            return -1;
> > +        }
> > +        asm("index z0.b, #0, #1\n"
> > +            ".global __sve_ld_done\n"
> > +            "__sve_ld_done:\n"
> > +            "mov z0.b, #0\n"
> > +            : /* no outputs kept */
> > +            : /* no inputs */
> > +            : "memory", "z0");
> > +    }
> > +    printf("PASS\n");
> > +    return 0;
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    /* we also need to probe for the ioctl support */
> > +    if (getauxval(AT_HWCAP) & HWCAP_SVE) {
> > +        return do_sve_ioctl_test();
> > +    } else {
> > +        printf("SKIP: no HWCAP_SVE on this system\n");
> > +        return 0;
> > +    }
> > +}
> > diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Make=
file.target
> > index b61b53e4dd1..c879932ff6c 100644
> > --- a/tests/tcg/aarch64/Makefile.target
> > +++ b/tests/tcg/aarch64/Makefile.target
> > @@ -47,6 +47,10 @@ ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
> >   AARCH64_TESTS +=3D sysregs
> >   sysregs: CFLAGS+=3D-march=3Darmv8.1-a+sve
> >
> > +# SVE ioctl test
> > +AARCH64_TESTS +=3D sve-ioctls
> > +sve-ioctls: CFLAGS+=3D-march=3Darmv8.1-a+sve
> > +
> >   ifneq ($(HAVE_GDB_BIN),)
> >   GDB_SCRIPT=3D$(SRC_PATH)/tests/guest-debug/run-test.py
> >
> >
>
>
