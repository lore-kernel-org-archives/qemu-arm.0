Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d187sm3803083wmd.8.2020.12.08.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:14:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 880471FF7E;
	Tue,  8 Dec 2020 14:14:13 +0000 (GMT)
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <2747838.e9J7NaK4W3@basile.remlab.net>
 <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
 <2120950.iZASKD2KPV@basile.remlab.net>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?R=C3=A9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Tue, 08 Dec 2020 14:11:15 +0000
In-reply-to: <2120950.iZASKD2KPV@basile.remlab.net>
Message-ID: <874kkwgzbe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SrZJ2l+pIMah


R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com> writes:

> 	Hi,
>
> Le tiistaina 1. joulukuuta 2020, 20.23.46 EET Peter Maydell a =C3=A9crit :
>> > The base tests fail without the patchset seem to assume an US American
>> > locale, which is frankly infuriatingly culturally insensitive.
>>=20
>> I run them with en_GB.UTF-8, which works fine for me, but it's a bug
>> in the test suite if something's locale dependent and not ensuring
>> it is set correctly.
>
> For a start, it seems to be barfing on strsignal() localisation by the sh=
ell,=20
> printing French instead of "Killed" on SIGKILL.
>
> % locale
> LANG=3Dfr_FR.UTF-8
> LANGUAGE=3Dfr:en_GB:fi
> LC_CTYPE=3D"fi_FI.UTF-8"
> ...
>
>> > As for the acceptance tests fail equally early without the patchset wi=
th a
>> > completely helpless diagnostic about unresolved references. Wiki does =
not
>> > help either.
>>=20
>> I just run "make -C my-build-dir check-acceptance"; I don't know anything
>> about the internals. It would help if you quoted the error messages
>> you see.
>
>  AVOCADO tests/acceptance
> Unable to resolve reference(s) 'tests/acceptance' with plugins(s) 'file',=
=20
> 'tap', 'external', try running 'avocado list -V tests/acceptance' to see =
the=20
> details.
> make: *** [/home/remi/dev/qemu/tests/Makefile.include:125 : check-accepta=
nce]=20
> Erreur 2
>
> % avocado list -V tests/acceptance
> bash: avocado : commande introuvable
>
> % tests/venv/bin/avocado list -V tests/acceptance
> usage: avocado list [-h] [--loaders [LIST.LOADERS ...]]
>
> Wiki implies that dependencies are automatically installed, but I
> guess not?

They should be in the venv that is built when you run the test the first
time. Running the above command without the -V which it doesn't
recognise gives me a list:

  14:12:25 [alex@zen:~/l/q/b/all] xen/guest-loader-and-arm-build-cleanups-v=
2|=E2=9C=9A3=E2=80=A6(+5/-5) + ./tests/venv/bin/avocado list tests/acceptan=
ce/ | head -n 10
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx=
_tcg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx=
_kvm
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kv=
m_gicv2
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kv=
m_gicv3
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_t=
cg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_=
virtio_tcg
  INSTRUMENTED tests/acceptance/boot_linux_console.py:BootLinuxConsole.test=
_x86_64_pc
  Exception ignored in: <_io.TextIOWrapper name=3D'<stdout>' mode=3D'w' enc=
oding=3D'UTF-8'>
  BrokenPipeError: [Errno 32] Broken pipe

I wonder are you running an in-tree build?

>
> Br,


--=20
Alex Benn=C3=A9e
