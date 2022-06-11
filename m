Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b0039c673952bfsm5693383wms.6.2022.06.11.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 00:48:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A91711FFB7;
	Sat, 11 Jun 2022 08:48:11 +0100 (BST)
References: <20220610154036.1253158-1-alex.bennee@linaro.org>
 <CAFEAcA9B1NJs4F_LVQ6FomJ0KMVZ-OFwYNjd5_=veYCNTd8tiw@mail.gmail.com>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, agorglouk@gmail.com, "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [RFC PATCH] target/arm: de-duplicate our register XML definitions
Date: Sat, 11 Jun 2022 08:05:14 +0100
In-reply-to: <CAFEAcA9B1NJs4F_LVQ6FomJ0KMVZ-OFwYNjd5_=veYCNTd8tiw@mail.gmail.com>
Message-ID: <87y1y3r684.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8+3KnOxLYS0w


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Jun 2022 at 16:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We generate the XML for each vCPU we create which for heavily threaded
>> linux-user runs can add up to a lot of memory. Unfortunately we can't
>> only do it once as we may have vCPUs with different capabilities in
>> different cores but we can at least free duplicate definitions if we
>> find them.
>
> How big actually is the XML here? 400 bytes? 4K? 40K? 400K?

For linux-user the sysreg XML is about 2k and the sve XML is about 8k
but it all adds up pretty quickly if you have lots of threads. BTW I
think the cpreg handling is also ranking quite highly in valgrinds
reporting but I haven't looked into it too deeply yet.

>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1070
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Can we defer the work until/unless gdb actually asks for it?

Yes. In fact really I'd like to remove all the XML generation details
from the various front-ends and move it to a common register API which
could do exactly that. We could then just share a uniform view of the
registers and perhaps extend it to understand per-core register sets if
we ever get to that point.

I also wonder if we can drop the individual XML segments and static GDB
register mappings in favour of one complete XML for whatever registers
QEMU wants to expose at the point? CC'ing some of our GDB colleges for
their input.

>
> I have some details-of-the-code comments below, but first:
> does gdb even support having the XML for each CPU be different?
> Our gdbstub.c seems to always ask for the XML only for the first
> CPU in the "process". If gdb does support heterogenous CPU XML,
> does it require that different XML descriptions have different
> names? We always call them system-registers.xml and sve-registers.xml
> regardless of whether different CPUs might have different contents
> for those XML blobs...
>
>> ---
>>  target/arm/gdbstub.c | 38 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index 2f806512d0..85ef6dc6db 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -318,7 +318,24 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int ba=
se_reg)
>>      g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.arm.sys.r=
egs\">");
>>      g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &pa=
ram);
>>      g_string_append_printf(s, "</feature>");
>> -    cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
>> +
>> +    /* De-duplicate system register descriptions */
>> +    if (cs !=3D first_cpu) {
>> +        CPUState *other_cs;
>> +        CPU_FOREACH(other_cs) {
>> +            ARMCPU *other_arm =3D ARM_CPU(other_cs);
>> +            if (g_strcmp0(other_arm->dyn_sysreg_xml.desc, s->str) =3D=
=3D 0) {
>
> If you check whether the dyn_sysreg_xml.num matches first, that will
> probably be a much faster way of checking in almost all cases than
> doing the strcmp on the however-long-it-is XML string: it seems unlikely
> that in a heterogenous config the CPUs will manage to have exactly the
> same number of registers.
>
> If you have a setup with, say, 4 CPUs of type X and then 4 of type Y,
> for every type Y CPU this loop will do the strcmp of Y's XML against
> the type X XML for cpu 0, then again for 1, then again for 2, then for 3,
> even though in theory we already know at that point that 0,1,2,3 all
> have the same XML and so if it didn't match for cpu 0 it won't match
> for 1,2,3...  But maybe the comparison against the number-of-registers
> saves us from having to try to optimise that away.
>
>> +                cpu->dyn_sysreg_xml.desc =3D other_arm->dyn_sysreg_xml.=
desc;
>> +                g_string_free(s, true);
>> +                s =3D NULL;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +
>> +    if (s) {
>> +        cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
>> +    }
>>      return cpu->dyn_sysreg_xml.num;
>>  }
>
> -- PMM

I'm travelling today so I'll see if I can use the time to sketch up a
common API and make this fugly approach obsolete.

--=20
Alex Benn=C3=A9e
