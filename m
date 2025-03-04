Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97842njm;
        Tue, 4 Mar 2025 04:51:46 -0800 (PST)
X-Received: by 2002:a05:690c:7086:b0:6f2:9704:405c with SMTP id 00721157ae682-6fd4a0865afmr232814187b3.15.1741092706337;
        Tue, 04 Mar 2025 04:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092706; cv=none;
        d=google.com; s=arc-20240605;
        b=Px/oZKQ6SyWmtngADPGEbE//AqZii9EFZkHcbEfDPzMF/eCMeyEtl9sstioOo3OnmS
         tCzGEo0VvBNSCx9KgzJ0rsnISDYjMwFfjEUBASb2S0Ad5cbW78SssE1rse91/w2cmdaz
         0i07/otmEg5G3G4DARywSlkrpr311sJJj7xsvLjXNAg7tFMey+GhlI1tMOloeK2mSveI
         wYI142SD4izCpMICI4kQ1SN5GSope70PQv7Az2VmuGXpjvEGtJoNdny17xC/KkfhJnHh
         hOVwwFeDUWCpmry4s9GVYBYXXqN9qYHj2C78Lx0j5Q5O9GTdJ5+rtLDgNTkiFkPQEEnu
         hPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxGGuaI68JKtynFFjWwLnLjsUcyuO6IkGZ9JrNoj9Hk=;
        fh=qVWCfp5cAbBY0ANV+bV9qYxhaQkocC3pw4wxQ8eVl4A=;
        b=jxt6wUd73u1A5svKFG1oDr35sGT714Vyg5Enb8kkhdv+WGZv7CmlxfpFJcULdVzK4j
         ArTNBoxhomrl0qIry+yRdhJTc6FTA7E6FV5fV14HELNUYHQ6PdU26jah5s9fwaMNuGCk
         h7Vv8gAOCOgbDyj3CFsQVc03tt0AFcYgq/SRJP3PTaxG4a2Jh94d+I/gyTorNW2Sw9w0
         my4sZJVi8qK3mLaza7FMhIuFF8UdZKcngX60o66cPTKH81sEqhOLo2FFr4l9fQB36FVL
         FarghJNw3D4yWypO3ci1HqZ0lOkF14kC31sGQu3OuakJPE9UET6wG5Rf/xDrXliPLowl
         kZDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf1PsSaq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fd3cb958dbsor71713457b3.13.2025.03.04.04.51.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Mar 2025 04:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf1PsSaq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741092706; x=1741697506; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxGGuaI68JKtynFFjWwLnLjsUcyuO6IkGZ9JrNoj9Hk=;
        b=cf1PsSaqE5CKzWSez6dVNEh7H4ItQGL6wqr+Pq2hTReveKPdpdqAQNoFs+VdG23NWU
         GTXV53KkM1d47nlzIMxATm9+Urf043eSW1zpd0ZTEndaWpHHoNf8AMbPUz6fQ4mJZaYh
         n7nymfb6g4382/+840LRAEEqubnspE3jbNq5473qoDCH4UuqeDsYeUjdnt570e3dPPcG
         4HHknuWU+fXoCOTP0nnDVggUfVc2NPWIk8QylcV6lDbTbsC8xYcbGjnYDlQ1E6StcgCn
         t1nTQqZjmBPLYvEBloQI9iXYlaGKRZeCxD9nl7ph7+/Yrs1o86cBrGSvh8tQObfpH8ss
         EMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741092706; x=1741697506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxGGuaI68JKtynFFjWwLnLjsUcyuO6IkGZ9JrNoj9Hk=;
        b=pIgcAe/DSn3E+WbOJ5yrgiz1URTfDxKwjVMmueL0Z3li8J58r3ymhXOVdLGuPQ3Xvb
         VhDgaXsb3DxLGpR/fU4x74njL7hOEGgd/X/hqSdoNB6BPnD6+CAwFZRzZZRsEyJ1DNIy
         K++xYqeb0vVeTzVfX0I8uQuOk0MvbM3OEkivMhq7fOAskcD7J90ZlvLEb7xq73c+zVmT
         gEwWvxcpTkM1opMJCctRyLRYhWUygh0EXg5sn4Ot7ER5Nz9GHaAqXBVqyG+EzbtLtlvb
         Io5pxdjWUkH0nSQoWD+AoIO7IFWwe06vO5WUrfXJJ8Kb5Naad2WCIwJDEhix5AyuEOiM
         Gn4A==
X-Gm-Message-State: AOJu0YzEWSzbKdUJwK+qqUgJPO3L27GZ6NqCYCLYkbASwZoBllDAaHmV
	Or8OjYHJXwwQQpYuDl4oT+1E9fqIF8P32j1BkcWpxoh8cWZn8RsrfrGQQt/RMK5cy332nPieWvL
	c+ehNhYlHdSPB3uG4fPwI+2CHMys7Pak5sVTg9rkEHGdy+2nYmGk=
X-Gm-Gg: ASbGncs31IwE78FVeS5FYBB7JRL+Zr950ZLav+5+sLDf7++fQDszDl06ojhbm4+d7Fk
	LbNBEPkRv3nUS4k9ZxJJmzTnHz2CNcvniT+1eKJ072LivbSWf9AGmGguZcu9GmOhvAuD4WshZ72
	nEo6cpBSOR8jgOcbjYT7VxB+ydBQY=
X-Google-Smtp-Source: AGHT+IFrMaw5WXbhjojnTuWjafeg9jqYR5kLnuDJEsEs2jRm4DP5ngCjEjC1wDmiwD29KO9B96YcLpmxsqAClMk3SoA=
X-Received: by 2002:a05:690c:600a:b0:6ef:761e:cfc with SMTP id
 00721157ae682-6fd4a1405a8mr223122747b3.25.1741092705838; Tue, 04 Mar 2025
 04:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20250227141343.1675415-1-peter.maydell@linaro.org> <87o6yh57r2.fsf@draig.linaro.org>
In-Reply-To: <87o6yh57r2.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Mar 2025 12:51:34 +0000
X-Gm-Features: AQ5f1JqdU7-x-zWWBzJjlhTFs9_xhTkqxqg-1afm2BT6H0-52lc3IttwZY4Klew
Message-ID: <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on sha1.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0hJnipoqwGBD

On Tue, 4 Mar 2025 at 11:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > +# GCC versions 12/13/14/15 at least incorrectly complain about
> > +# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the =
gcc bug
> > +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106709
> > +# Since this is just a standard piece of library code we've borrowed f=
or a
> > +# TCG test case, suppress the warning rather than trying to modify the
> > +# code to work around the compiler.
> > +sha1: CFLAGS+=3D-Wno-stringop-overread
> > +
>
> Sadly this breaks the hexagon compiler:
>
>   error: unknown warning option '-Wno-stringop-overread' [-Werror,-Wunkno=
wn-warning-option]
>   Traceback (most recent call last):
>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 683, in =
<module>
>       sys.exit(main())
>                ^^^^^^
>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 679, in =
main
>       return args.cmdobj.run(args, argv)
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 657, in =
run
>       return Docker().run(cmd, False, quiet=3Dargs.quiet,
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 370, in =
run
>       ret =3D self._do_check(["run", "--rm", "--label",
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 247, in =
_do_check
>       return subprocess.check_call(self._command + cmd, **kwargs)
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
>       raise CalledProcessError(retcode, cmd)
>   subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--la=
bel', 'com.qemu.instance.uuid=3D5bbb7b6ed2ea4377b9b6d646859ec4ea', '--usern=
s=3Dkeep-id', '-u', '1000', '-w', '/home/alex/lsrc/qemu.git/builds/all/test=
s/tcg/hexagon-linux-user', '-v', '/home/alex/lsrc/qemu.git/builds/all/tests=
/tcg/hexagon-linux-user:/home/alex/lsrc/qemu.git/builds/all/tests/tcg/hexag=
on-linux-user:rw', '-v', '/home/alex/lsrc/qemu.git:/home/alex/lsrc/qemu.git=
:ro,z', 'qemu/debian-hexagon-cross', 'hexagon-unknown-linux-musl-clang', '-=
Wno-incompatible-pointer-types', '-Wno-undefined-internal', '-fno-unroll-lo=
ops', '-fno-stack-protector', '-Wall', '-Werror', '-O0', '-g', '-fno-strict=
-aliasing', '-Wno-stringop-overread', '-mv73', '-O2', '-static', '/home/ale=
x/lsrc/qemu.git/tests/tcg/multiarch/sha1.c', '-o', 'sha1', '-static']' retu=
rned non-zero exit status 1.
>   filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D5bbb7b6ed2ea4377b9=
b6d646859ec4ea
>   make[1]: *** [Makefile:122: sha1] Error 1
>   make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build-tc=
g-tests-hexagon-linux-user] Error 2
>
> Is it that new an option?

I think it's new-ish (gcc 11?). On the other hand
-Wno-unknown-warning-option is quite old, and would suppress
this error. If we do
 CFLAGS+=3D-Wno-unknown-warning-option -Wno-stringop-overread

does that work?

(Meson has cc.get_supported_arguments() that we can use to
filter out -Wfoo/-Wno-foo options that the compiler doesn't
support, but since this is built via a makefile rather than
by meson that's not conveniently accessible.)

-- PMM
