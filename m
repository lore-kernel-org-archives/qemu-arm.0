Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q6sm8325699wrx.72.2020.01.09.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 04:08:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 31C531FF87;
	Thu,  9 Jan 2020 12:08:24 +0000 (GMT)
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
 <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org>
 <87k16sdt4d.fsf@linaro.org>
 <5c6dd0a9-23ba-63ff-5738-8bac11aad810@linaro.org>
 <87eewzdtqg.fsf@linaro.org>
 <81e43d43-29f8-ec56-5270-bb90dd1bc077@linaro.org>
 <889CE29C-C705-4EB4-B52A-62F88A6121A2@arm.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alan Hayward <Alan.Hayward@arm.com>
Cc: Luis Machado <luis.machado@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "damien.hedde@greensocs.com"
 <damien.hedde@greensocs.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>, nd <nd@arm.com>
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our
 SVE registers
In-reply-to: <889CE29C-C705-4EB4-B52A-62F88A6121A2@arm.com>
Date: Thu, 09 Jan 2020 12:08:24 +0000
Message-ID: <87muawj0hz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fz2Qx3pzz+Lt


Alan Hayward <Alan.Hayward@arm.com> writes:

>> On 20 Dec 2019, at 13:18, Luis Machado <luis.machado@linaro.org> wrote:
>>=20
>> On 12/20/19 10:14 AM, Alex Benn=C3=A9e wrote:
>>> Luis Machado <luis.machado@linaro.org> writes:
>>>> On 12/19/19 4:15 PM, Alex Benn=C3=A9e wrote:
>>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>>=20
>>>>>> On 12/11/19 9:05 AM, Alex Benn=C3=A9e wrote:
>>>>>>> +static struct TypeSize vec_lanes[] =3D {
>>>>>>=20
>>>>>> const.
>>>>>>=20
>>>>>>> +    case 51:
>>>>>>> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) +=
 1);
>>>>>>=20
>>>>>> You need to use sve_zcr_len_for_el to get the effective vq.
>>>>>> Also, I thought vg =3D=3D 2 * vq.
>>>>>>   > +    case 51:
>>>>>>> +    {
>>>>>>> +        uint64_t val =3D *(uint64_t *) buf;
>>>>>>> +        cpu->env.vfp.zcr_el[1] =3D (val - 1) & 0xf;
>>>>>>=20
>>>>>> You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the eff=
ective vq
>>>>>> decreases, you must call aarch64_sve_narrow_vq.  You must call arm_r=
ebuild_hflags.
>>>>> I'm just going to drop vg (and therefor the ability to set it) from
>>>>> the
>>>>> regset. It was only meant to be an indicator and gdb doesn't actually
>>>>> look to it to size it's output. The likely dynamic extension will just
>>>>> re-transmit the whole XML when a change occurs.
>>>>>=20
>
> [...rebooting self after festive break]
>
> Yes, when using a gdb stub, changes to the VG value should be silently ig=
nored by the
> stub.
> In addition, if the vector length on the system does magically change whi=
lst the program
> is running, then the stub should continue to use the register sizes for t=
he originally
> transmitted XML, truncating/extending the register values as required.
>
> Why? Because once the stub has sent the XML description to GDB on program=
 start, then GDB
> assumes the XML description will never change. GDB will error if sent pac=
kets with different
> register lengths.

Ack. The test "test-sve-ioctl.py" covers this and works as expected.

<snip>
>
> When using GDB a real SVE Linux box without a stub/gdbserver, then:
>
<snip>
>
> Blindly enabling the above when using a stub results in in GDB *constantl=
y* asking the
> stub for a new XML description, spamming the pipe, so this needs somethin=
g more nuanced.=20
>
> I plan on sending Luis my ideas I had for VG changing when using a
> stub.

Is this going to be a more general solution because I'm sure there are
other cases where the XML description is out of date. A big one is
execution modes (thumb/32/64 bit) and I think x86 runs into similar
problems with it's various mode changes in early boot-up.

For now I'll just let qemu provide it's own xml without vg shenanigans.

>>> But this is all special casing for feature
>>> name=3D"org.gnu.gdb.aarch64.sve" right?
>>=20
>> Yes, vg is only available if feature org.gnu.gdb.aarch64.sve is availabl=
e.
>
> Nod.

Thanks and hi ;-)

--=20
Alex Benn=C3=A9e
