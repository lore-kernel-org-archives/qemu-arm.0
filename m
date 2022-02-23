Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 7sm256524edw.37.2022.02.23.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 10:55:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 92D551FFB7;
	Wed, 23 Feb 2022 18:55:03 +0000 (GMT)
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
 <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <cleber@redhat.com>, Oleg Vasilev
 <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>, Emilio
 Cota <cota@braap.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Date: Wed, 23 Feb 2022 18:51:57 +0000
In-reply-to: <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
Message-ID: <87v8x5l8fs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: F4EmvQRi9iS7


Laszlo Ersek <lersek@redhat.com> writes:

> On 02/23/22 14:34, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 23/2/22 12:07, Daniel P. Berrang=C3=A9 wrote:
>>> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
>>>> +Igor/MST for UEFI tests.
>>>>
>>>> On 22/2/22 17:38, Daniel P. Berrang=C3=A9 wrote:
>>>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Benn=C3=A9e wrote:
>>>>>>
>>>>>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> TL;DR:
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0 - pc-bios/edk2-aarch64-code.fd should be rebuilt=
 without debug
>>>>>>
>>>>>> Laszlo,
>>>>>>
>>>>>> Would it be possible to do a less debug enabled version of EDK2 on t=
he
>>>>>> next update to pc-bios/edk2-*?
>>>>>
>>>>> NB, Laszlo is no longer=C2=A0 maintaining EDK2 in QEMU, it was handed
>>>>> over to Philippe.=C2=A0 I'm CC'ing Gerd too since he's a reviewer and
>>>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>>>
>>>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>>
>>> Can you elaborate on what bios-tables-tests needs this for, and
>>> what coverage we would loose by disabling DEBUG.
>>=20
>> Maybe it was only required when the tests were developed...
>> I'll defer that question to Igor.
>
> I've briefly rechecked commits 77db55fc8155 ("tests/uefi-test-tools: add
> build scripts", 2019-02-21) and 536d2173b2b3 ("roms: build edk2 firmware
> binaries and variable store templates", 2019-04-17). I think my only
> reason for picking the DEBUG build target was that other build targets
> are generally useless for debugging -- they produce no logs (or fewer log=
s).
>
>>=20
>>> It may well be a better tradeoff to sacrifice part of bios-tables-tests
>>> in favour of shipping more broadly usable images without DEBUG.
>>=20
>> Why not, if users are aware/happy to use a unsafe image with various
>> unfixed CVEs.
>>=20
>> Removing the debug profile is as simple as this one-line patch:
>>=20
>> -- >8 --
>> diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
>> index d5391c7637..ea79dc27a2 100755
>> --- a/roms/edk2-build.sh
>> +++ b/roms/edk2-build.sh
>> @@ -50,6 +50,6 @@ qemu_edk2_set_cross_env "$emulation_target"
>> =C2=A0build \
>> =C2=A0=C2=A0 --cmd-len=3D65536 \
>> =C2=A0=C2=A0 -n "$edk2_thread_count" \
>> -=C2=A0 --buildtarget=3DDEBUG \
>> +=C2=A0 --buildtarget=3DRELEASE \
>> =C2=A0=C2=A0 --tagname=3D"$edk2_toolchain" \
>> =C2=A0=C2=A0 "${args[@]}"
>> ---
>>=20
>
> The patch would be larger; the DEBUG build target is included in a bunch
> of pathnames (see those original two commits).
>
> BTW I still don't understand the problem with the DEBUG firmware builds;
> in the test suite, as many debug messages should be printed as possible,
> for helping with the analysis of any new issue that pops up. I've
> re-read Alex's message that I got first CC'd on, and I can't connect the
> dots, sorry.

I think having DEBUG turned on results in more EDK2 code executed which
means a bunch of TBs have to be invalidated by the TCG JIT when the
kernel clears the pages for its use. I can only assume this is code EDK2
is done with because otherwise the kernel shouldn't be overwriting it.

It makes a difference but not super large amount. For that we need to
re-think about translate-all.c's approach to physical page invalidation.

--=20
Alex Benn=C3=A9e
