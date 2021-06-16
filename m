Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l16sm4857889wmq.28.2021.06.16.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 06:50:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6E7F01FF7E;
	Wed, 16 Jun 2021 14:49:59 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  laurent@vivier.eu
Subject: Re: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
	<20210616011209.1446045-5-richard.henderson@linaro.org>
	<87y2b9gbx7.fsf@linaro.org>
Date: Wed, 16 Jun 2021 14:49:59 +0100
In-Reply-To: <87y2b9gbx7.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 16
	Jun 2021 14:46:12 +0100")
Message-ID: <87tulxgbqw.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SkhA6NgRYESX

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> ARM is more complicated than the others, in that we also
>> have trampolines for using SA_RESTORER with FDPIC, and
>> we need to create trampolines for both ARM and Thumb modes.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  linux-user/arm/target_signal.h |   2 +
>>  linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>>  2 files changed, 100 insertions(+), 72 deletions(-)
>>
>> +
>> +    /* ARM sigframe */
>> +    _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xfff);
>> +    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
>> +    __put_user(0xe8998200, &tramp[i++]);
>
> Erm is this based on your c11 series?

Actually it's merged already so I'm seeing the following on hackbox:

  FAILED: libqemu-armeb-linux-user.fa.p/linux-user_arm_signal.c.o
  cc -Ilibqemu-armeb-linux-user.fa.p -I. -I../.. -Itarget/arm -I../../targe=
t/arm -I../../linux-user/host/x86_64 -Ilinux-user -I../../linux-user -Ilinu=
x-user/arm -I../../linux-
  user/arm -I../../capstone/include/capstone -Itrace -Iqapi -Iui/shader -I/=
usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnos=
tics-color=3Dauto -pipe -Wa
  ll -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -isystem /home/alex.bennee/l=
src/qemu.git/linux-headers -isystem linux-headers -iquote . -iquote /home/a=
lex.bennee/lsrc/qemu.git -i
  quote /home/alex.bennee/lsrc/qemu.git/include -iquote /home/alex.bennee/l=
src/qemu.git/disas/libvixl -iquote /home/alex.bennee/lsrc/qemu.git/tcg/i386=
 -pthread -U_FORTIFY_SOUR
  CE -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D=
64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrit=
e-strings -Wmissing-prototype
  s -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-=
style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -=
Wignored-qualifiers -Wemp
  ty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit=
-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-p=
sabi -fstack-protector-stro
  ng -isystem../../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONF=
IG_TARGET=3D"armeb-linux-user-config-target.h"' '-DCONFIG_DEVICES=3D"armeb-=
linux-user-config-devices.h"'
   -MD -MQ libqemu-armeb-linux-user.fa.p/linux-user_arm_signal.c.o -MF libq=
emu-armeb-linux-user.fa.p/linux-user_arm_signal.c.o.d -o libqemu-armeb-linu=
x-user.fa.p/linux-user_ar
  m_signal.c.o -c ../../linux-user/arm/signal.c
  ../../linux-user/arm/signal.c: In function =E2=80=98setup_sigtramp=E2=80=
=99:
  ../../linux-user/arm/signal.c:847:47: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xfff);
                                                 ^
  ../../linux-user/arm/signal.c:852:51: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
                                                     ^
  ../../linux-user/arm/signal.c:853:49: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert((SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);
                                                   ^
  ../../linux-user/arm/signal.c:858:50: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xfff);
                                                    ^
  ../../linux-user/arm/signal.c:863:54: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
                                                        ^
  ../../linux-user/arm/signal.c:864:52: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert((RT_SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);

--=20
Alex Benn=C3=A9e
