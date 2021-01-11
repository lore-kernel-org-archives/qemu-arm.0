Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q143sm22065334wme.28.2021.01.11.06.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:37:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2E85A1FF7E;
	Mon, 11 Jan 2021 14:37:46 +0000 (GMT)
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-11-alex.bennee@linaro.org>
 <9ee1443e-821d-9cec-c29a-6111385937ad@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Machado <luis.machado@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 10/20] target/arm: use official
 org.gnu.gdb.aarch64.sve layout for registers
Date: Mon, 11 Jan 2021 14:36:36 +0000
In-reply-to: <9ee1443e-821d-9cec-c29a-6111385937ad@linaro.org>
Message-ID: <87zh1fo7yd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: m3P6TLfCKNT+


Luis Machado <luis.machado@linaro.org> writes:

> For the record, the layout looks OK to me.

So a Reviewed-by?

> Just a reminder that GDB will soon support bfloat16 types. A patch may=20
> be pushed this month.

Will we be able to probe for the support - or will an older GDB silently
accept and drop any bfloat16 fields?

>
> On 1/8/21 7:42 PM, Alex Benn=C3=A9e wrote:
>> While GDB can work with any XML description given to it there is
>> special handling for SVE registers on the GDB side which makes the
>> users life a little better. The changes aren't that major and all the
>> registers save the $vg reported the same. All that changes is:
>>=20
>>    - report org.gnu.gdb.aarch64.sve
>>    - use gdb nomenclature for names and types
>>    - minor re-ordering of the types to match reference
>>    - re-enable ieee_half (as we know gdb supports it now)
>>    - $vg is now a 64 bit int
>>    - check $vN and $zN aliasing in test
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Luis Machado <luis.machado@linaro.org>
>> Message-Id: <20201218112707.28348-10-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/arm/gdbstub.c                        | 75 ++++++++-------------
>>   target/arm/helper.c                         |  2 +-
>>   tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 11 +++
>>   3 files changed, 41 insertions(+), 47 deletions(-)
>>=20
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index 866595b4f1..a8fff2a3d0 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] =3D {
>>       { "uint128", 128, 'q', 'u' },
>>       { "int128", 128, 'q', 's' },
>>       /* 64 bit */
>> +    { "ieee_double", 64, 'd', 'f' },
>>       { "uint64", 64, 'd', 'u' },
>>       { "int64", 64, 'd', 's' },
>> -    { "ieee_double", 64, 'd', 'f' },
>>       /* 32 bit */
>> +    { "ieee_single", 32, 's', 'f' },
>>       { "uint32", 32, 's', 'u' },
>>       { "int32", 32, 's', 's' },
>> -    { "ieee_single", 32, 's', 'f' },
>>       /* 16 bit */
>> +    { "ieee_half", 16, 'h', 'f' },
>>       { "uint16", 16, 'h', 'u' },
>>       { "int16", 16, 'h', 's' },
>> -    /*
>> -     * TODO: currently there is no reliable way of telling
>> -     * if the remote gdb actually understands ieee_half so
>> -     * we don't expose it in the target description for now.
>> -     * { "ieee_half", 16, 'h', 'f' },
>> -     */
>>       /* bytes */
>>       { "uint8", 8, 'b', 'u' },
>>       { "int8", 8, 'b', 's' },
>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int b=
ase_reg)
>>       GString *s =3D g_string_new(NULL);
>>       DynamicGDBXMLInfo *info =3D &cpu->dyn_svereg_xml;
>>       g_autoptr(GString) ts =3D g_string_new("");
>> -    int i, bits, reg_width =3D (cpu->sve_max_vq * 128);
>> +    int i, j, bits, reg_width =3D (cpu->sve_max_vq * 128);
>>       info->num =3D 0;
>>       g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>>       g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dt=
d\">");
>> -    g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.aarch64.s=
ve\">");
>> +    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.aarch64.sv=
e\">");
>>=20=20=20
>>       /* First define types and totals in a whole VL */
>>       for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>           int count =3D reg_width / vec_lanes[i].size;
>> -        g_string_printf(ts, "vq%d%c%c", count,
>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].s=
uffix);
>>           g_string_append_printf(s,
>>                                  "<vector id=3D\"%s\" type=3D\"%s\" coun=
t=3D\"%d\"/>",
>>                                  ts->str, vec_lanes[i].gdb_type, count);
>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int b=
ase_reg)
>>        * signed and potentially float versions of each size from 128 to
>>        * 8 bits.
>>        */
>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
>> -        int count =3D reg_width / bits;
>> -        g_string_append_printf(s, "<union id=3D\"vq%dn\">", count);
>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>> -            if (vec_lanes[i].size =3D=3D bits) {
>> -                g_string_append_printf(s, "<field name=3D\"%c\" type=3D=
\"vq%d%c%c\"/>",
>> -                                       vec_lanes[i].suffix,
>> -                                       count,
>> -                                       vec_lanes[i].sz, vec_lanes[i].su=
ffix);
>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
>> +        g_string_append_printf(s, "<union id=3D\"svevn%c\">", suf[i]);
>> +        for (j =3D 0; j < ARRAY_SIZE(vec_lanes); j++) {
>> +            if (vec_lanes[j].size =3D=3D bits) {
>> +                g_string_append_printf(s, "<field name=3D\"%c\" type=3D=
\"svev%c%c\"/>",
>> +                                       vec_lanes[j].suffix,
>> +                                       vec_lanes[j].sz, vec_lanes[j].su=
ffix);
>>               }
>>           }
>>           g_string_append(s, "</union>");
>>       }
>>       /* And now the final union of unions */
>> -    g_string_append(s, "<union id=3D\"vq\">");
>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
>> -        int count =3D reg_width / bits;
>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>> -            if (vec_lanes[i].size =3D=3D bits) {
>> -                g_string_append_printf(s, "<field name=3D\"%c\" type=3D=
\"vq%dn\"/>",
>> -                                       vec_lanes[i].sz, count);
>> -                break;
>> -            }
>> -        }
>> +    g_string_append(s, "<union id=3D\"svev\">");
>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
>> +        g_string_append_printf(s, "<field name=3D\"%c\" type=3D\"svevn%=
c\"/>",
>> +                               suf[i], suf[i]);
>>       }
>>       g_string_append(s, "</union>");
>>=20=20=20
>> +    /* Finally the sve prefix type */
>> +    g_string_append_printf(s,
>> +                           "<vector id=3D\"svep\" type=3D\"uint8\" coun=
t=3D\"%d\"/>",
>> +                           reg_width / 8);
>> +
>>       /* Then define each register in parts for each vq */
>>       for (i =3D 0; i < 32; i++) {
>>           g_string_append_printf(s,
>>                                  "<reg name=3D\"z%d\" bitsize=3D\"%d\""
>> -                               " regnum=3D\"%d\" group=3D\"vector\""
>> -                               " type=3D\"vq\"/>",
>> +                               " regnum=3D\"%d\" type=3D\"svev\"/>",
>>                                  i, reg_width, base_reg++);
>>           info->num++;
>>       }
>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int b=
ase_reg)
>>                              " regnum=3D\"%d\" group=3D\"float\""
>>                              " type=3D\"int\"/>", base_reg++);
>>       info->num +=3D 2;
>> -    /*
>> -     * Predicate registers aren't so big they are worth splitting up
>> -     * but we do need to define a type to hold the array of quad
>> -     * references.
>> -     */
>> -    g_string_append_printf(s,
>> -                           "<vector id=3D\"vqp\" type=3D\"uint16\" coun=
t=3D\"%d\"/>",
>> -                           cpu->sve_max_vq);
>> +
>>       for (i =3D 0; i < 16; i++) {
>>           g_string_append_printf(s,
>>                                  "<reg name=3D\"p%d\" bitsize=3D\"%d\""
>> -                               " regnum=3D\"%d\" group=3D\"vector\""
>> -                               " type=3D\"vqp\"/>",
>> +                               " regnum=3D\"%d\" type=3D\"svep\"/>",
>>                                  i, cpu->sve_max_vq * 16, base_reg++);
>>           info->num++;
>>       }
>>       g_string_append_printf(s,
>>                              "<reg name=3D\"ffr\" bitsize=3D\"%d\""
>>                              " regnum=3D\"%d\" group=3D\"vector\""
>> -                           " type=3D\"vqp\"/>",
>> +                           " type=3D\"svep\"/>",
>>                              cpu->sve_max_vq * 16, base_reg++);
>>       g_string_append_printf(s,
>>                              "<reg name=3D\"vg\" bitsize=3D\"64\""
>> -                           " regnum=3D\"%d\" group=3D\"vector\""
>> -                           " type=3D\"uint32\"/>",
>> +                           " regnum=3D\"%d\" type=3D\"int\"/>",
>>                              base_reg++);
>>       info->num +=3D 2;
>>       g_string_append_printf(s, "</feature>");
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index d077dd9ef5..d434044f07 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByt=
eArray *buf, int reg)
>>            * while the ZCR works in Vector Quads (VQ) which is 128bit ch=
unks.
>>            */
>>           int vq =3D sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
>> -        return gdb_get_reg32(buf, vq * 2);
>> +        return gdb_get_reg64(buf, vq * 2);
>>       }
>>       default:
>>           /* gdbstub asked for something out our range */
>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aar=
ch64/gdbstub/test-sve-ioctl.py
>> index 972cf73c31..b9ef169c1a 100644
>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>>           except gdb.error:
>>               report(False, "checking zregs (out of range)")
>>=20=20=20
>> +        # Check the aliased V registers are set and GDB has correctly
>> +        # created them for us having recognised and handled SVE.
>> +        try:
>> +            for i in range(0, 16):
>> +                val_z =3D gdb.parse_and_eval("$z0.b.u[%d]" % i)
>> +                val_v =3D gdb.parse_and_eval("$v0.b.u[%d]" % i)
>> +                report(int(val_z) =3D=3D int(val_v),
>> +                       "v0.b.u[%d] =3D=3D z0.b.u[%d]" % (i, i))
>> +        except gdb.error:
>> +            report(False, "checking vregs (out of range)")
>> +
>>=20=20=20
>>   def run_test():
>>       "Run through the tests one by one"
>>=20


--=20
Alex Benn=C3=A9e
