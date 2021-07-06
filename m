Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j1sm2860292wms.7.2021.07.06.06.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 06:55:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8D6F51FF7E;
	Tue,  6 Jul 2021 14:55:32 +0100 (BST)
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
 <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
 <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>, Max
 Filippov <jcmvbkbc@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, "open list:PowerPC TCG CPUs"
 <qemu-ppc@nongnu.org>, Artyom Tarasenko <atar4qemu@gmail.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Richard Henderson
 <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>, "open
 list:S390 general arch..." <qemu-s390x@nongnu.org>, "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, Stafford
 Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Chris Wulff <crwulff@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
Date: Tue, 06 Jul 2021 14:52:19 +0100
In-reply-to: <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
Message-ID: <87fswrtuln.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 50pgETKxnZrz


Thomas Huth <thuth@redhat.com> writes:

> On 06/07/2021 14.47, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 7/6/21 12:52 PM, Thomas Huth wrote:
>>> On 21/06/2021 17.21, Alex Benn=C3=A9e wrote:
>>>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>
>>>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>>>> the minikconf tool can verify they exit. However CONFIG_FOO is only
>>>
>>> s/exit/exist/ ?
>>>
>>>> enabled for target foo via the meson.build rules.
>>>>
>>>> Two architecture have a particularity, ARM and MIPS:
>>>> their 64-bit version include the 32-bit subset.
>>>
>>> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
>>> also have 32-bit and 64-bit variants?
>> Because we consider them as different targets, they don't include
>> (kselect) the subset.
>
> And why is that done this way? There is certainly a big difference
> between Sparc and Sparc64, but for x86 and PPC, the 64-bit variant is
> a superset of the 32-bit variant, so why is it done different here
> compared to ARM and MIPS?

Both ARM and MIPS have a somewhat separated set of translate.c functions
which means they can be built as individual units. AFAICT all the others
have a unified translate.c that handles all ISA variants so they
couldn't be built as standalone units if they wanted to.

You are right for AArch64 at least we have to include translate.c to
support AArch32 encoding. But for qemu-arm we skip all the 64 bit stuff
by compilation units:

arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
  'cpu64.c',
  'gdbstub64.c',
  'helper-a64.c',
  'mte_helper.c',
  'pauth_helper.c',
  'sve_helper.c',
  'translate-a64.c',
  'translate-sve.c',
))


>
>  Thomas
>
>
>>>
>>> The patch itself looks fine to me, so once you've clarified the commit
>>> message:
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>>
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>
>>>> ---
>>>> vajb:
>>>>  =C2=A0=C2=A0 - removed targets that no longer exist
>>>>  =C2=A0=C2=A0 - reword commit message to show why we need the Kconfigs
>>>> ---
>>=20
>>>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>>>> new file mode 100644
>>>> index 0000000000..3f3394a22b
>>>> --- /dev/null
>>>> +++ b/target/arm/Kconfig
>>>> @@ -0,0 +1,6 @@
>>>> +config ARM
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +
>>>> +config AARCH64
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +=C2=A0=C2=A0=C2=A0 select ARM
>>=20
>>>> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
>>>> new file mode 100644
>>>> index 0000000000..6adf145354
>>>> --- /dev/null
>>>> +++ b/target/mips/Kconfig
>>>> @@ -0,0 +1,6 @@
>>>> +config MIPS
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +
>>>> +config MIPS64
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +=C2=A0=C2=A0=C2=A0 select MIPS
>>=20


--=20
Alex Benn=C3=A9e
