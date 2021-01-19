Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b7sm35206140wrv.47.2021.01.19.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 07:57:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8ABD91FF7E;
	Tue, 19 Jan 2021 15:57:19 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: peter.maydell@linaro.org, Luis Machado <luis.machado@linaro.org>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
Date: Tue, 19 Jan 2021 15:54:27 +0000
In-reply-to: <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de>
Message-ID: <871regvs0w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: D+e6xIMI+1Y4


Claudio Fontana <cfontana@suse.de> writes:

> On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> Hi Alex,
>>>
>>> after updating to latest master today, I am getting the following error=
 with
>>>
>>> make check-tcg
>>>
>>> qemu-system-aarch64: -gdb unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gdbs=
tub.socket,server: info: QEMU waiting for connection on: disconnected:unix:=
/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>> warning: while parsing target description (at line 47): Vector "svevhf"=
 references undefined type "ieee_half"
>>> warning: Could not load XML target description; ignoring
>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>
>>> Seems to indicate it is "ieee_half" -related?
>>=20
>> *sigh*
>>=20
>> yes - it is. I thought this was solved by the GDB version check in
>> 14/30. What does your gdb report?
>
>
> $ gdb --version
> GNU gdb (GDB; openSUSE Leap 15.2) 8.3.1
> Copyright (C) 2019 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>
> gdb --configuration
> This GDB was configured as follows:
>    configure --host=3Dx86_64-suse-linux --target=3Dx86_64-suse-linux
>              --with-auto-load-dir=3D$debugdir:$datadir/auto-load
>              --with-auto-load-safe-path=3D$debugdir:$datadir/auto-load
>              --with-expat
>              --with-gdb-datadir=3D/usr/share/gdb
>              --with-jit-reader-dir=3D/usr/lib64/gdb
>              --without-libunwind-ia64
>              --with-lzma
>              --without-babeltrace
>              --with-intel-pt
>              --disable-libmcheck
>              --with-mpfr
>              --with-python=3D/usr
>              --without-guile
>              --disable-source-highlight
>              --with-separate-debug-dir=3D/usr/lib/debug
>              --with-system-gdbinit=3D/etc/gdbinit
>
>
> does this help?

So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
and there is no probing possible during the gdbstub connection. I guess
I can either go back to stubbing it out (which would break gdb's SVE
understanding) or up our minimum GDB version check for running tests.
That would mean less people test GDB (or at least until the distros
catch up) but considering it was zero people not too long ago maybe
that's acceptable?

>
> Let me know if more info is needed. Thanks!
>
> Claudio
>
>
>>=20
>>>
>>> Thanks,
>>>
>>> Claudio
>>>
>>> On 1/15/21 2:08 PM, Alex Benn=C3=A9e wrote:
>>>> While GDB can work with any XML description given to it there is
>>>> special handling for SVE registers on the GDB side which makes the
>>>> users life a little better. The changes aren't that major and all the
>>>> registers save the $vg reported the same. All that changes is:
>>>>
>>>>   - report org.gnu.gdb.aarch64.sve
>>>>   - use gdb nomenclature for names and types
>>>>   - minor re-ordering of the types to match reference
>>>>   - re-enable ieee_half (as we know gdb supports it now)
>>>>   - $vg is now a 64 bit int
>>>>   - check $vN and $zN aliasing in test
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Reviewed-by: Luis Machado <luis.machado@linaro.org>
>>>> Message-Id: <20210108224256.2321-11-alex.bennee@linaro.org>
>>>>
>>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>>>> index 866595b4f1..a8fff2a3d0 100644
>>>> --- a/target/arm/gdbstub.c
>>>> +++ b/target/arm/gdbstub.c
>>>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] =3D {
>>>>      { "uint128", 128, 'q', 'u' },
>>>>      { "int128", 128, 'q', 's' },
>>>>      /* 64 bit */
>>>> +    { "ieee_double", 64, 'd', 'f' },
>>>>      { "uint64", 64, 'd', 'u' },
>>>>      { "int64", 64, 'd', 's' },
>>>> -    { "ieee_double", 64, 'd', 'f' },
>>>>      /* 32 bit */
>>>> +    { "ieee_single", 32, 's', 'f' },
>>>>      { "uint32", 32, 's', 'u' },
>>>>      { "int32", 32, 's', 's' },
>>>> -    { "ieee_single", 32, 's', 'f' },
>>>>      /* 16 bit */
>>>> +    { "ieee_half", 16, 'h', 'f' },
>>>>      { "uint16", 16, 'h', 'u' },
>>>>      { "int16", 16, 'h', 's' },
>>>> -    /*
>>>> -     * TODO: currently there is no reliable way of telling
>>>> -     * if the remote gdb actually understands ieee_half so
>>>> -     * we don't expose it in the target description for now.
>>>> -     * { "ieee_half", 16, 'h', 'f' },
>>>> -     */
>>>>      /* bytes */
>>>>      { "uint8", 8, 'b', 'u' },
>>>>      { "int8", 8, 'b', 's' },
>>>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int=
 base_reg)
>>>>      GString *s =3D g_string_new(NULL);
>>>>      DynamicGDBXMLInfo *info =3D &cpu->dyn_svereg_xml;
>>>>      g_autoptr(GString) ts =3D g_string_new("");
>>>> -    int i, bits, reg_width =3D (cpu->sve_max_vq * 128);
>>>> +    int i, j, bits, reg_width =3D (cpu->sve_max_vq * 128);
>>>>      info->num =3D 0;
>>>>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>>>>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.d=
td\">");
>>>> -    g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.aarch64=
.sve\">");
>>>> +    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.aarch64.=
sve\">");
>>>>=20=20
>>>>      /* First define types and totals in a whole VL */
>>>>      for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>>>          int count =3D reg_width / vec_lanes[i].size;
>>>> -        g_string_printf(ts, "vq%d%c%c", count,
>>>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
>>>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i]=
.suffix);
>>>>          g_string_append_printf(s,
>>>>                                 "<vector id=3D\"%s\" type=3D\"%s\" cou=
nt=3D\"%d\"/>",
>>>>                                 ts->str, vec_lanes[i].gdb_type, count);
>>>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int=
 base_reg)
>>>>       * signed and potentially float versions of each size from 128 to
>>>>       * 8 bits.
>>>>       */
>>>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
>>>> -        int count =3D reg_width / bits;
>>>> -        g_string_append_printf(s, "<union id=3D\"vq%dn\">", count);
>>>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>>> -            if (vec_lanes[i].size =3D=3D bits) {
>>>> -                g_string_append_printf(s, "<field name=3D\"%c\" type=
=3D\"vq%d%c%c\"/>",
>>>> -                                       vec_lanes[i].suffix,
>>>> -                                       count,
>>>> -                                       vec_lanes[i].sz, vec_lanes[i].=
suffix);
>>>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
>>>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
>>>> +        g_string_append_printf(s, "<union id=3D\"svevn%c\">", suf[i]);
>>>> +        for (j =3D 0; j < ARRAY_SIZE(vec_lanes); j++) {
>>>> +            if (vec_lanes[j].size =3D=3D bits) {
>>>> +                g_string_append_printf(s, "<field name=3D\"%c\" type=
=3D\"svev%c%c\"/>",
>>>> +                                       vec_lanes[j].suffix,
>>>> +                                       vec_lanes[j].sz, vec_lanes[j].=
suffix);
>>>>              }
>>>>          }
>>>>          g_string_append(s, "</union>");
>>>>      }
>>>>      /* And now the final union of unions */
>>>> -    g_string_append(s, "<union id=3D\"vq\">");
>>>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
>>>> -        int count =3D reg_width / bits;
>>>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>>> -            if (vec_lanes[i].size =3D=3D bits) {
>>>> -                g_string_append_printf(s, "<field name=3D\"%c\" type=
=3D\"vq%dn\"/>",
>>>> -                                       vec_lanes[i].sz, count);
>>>> -                break;
>>>> -            }
>>>> -        }
>>>> +    g_string_append(s, "<union id=3D\"svev\">");
>>>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
>>>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
>>>> +        g_string_append_printf(s, "<field name=3D\"%c\" type=3D\"svev=
n%c\"/>",
>>>> +                               suf[i], suf[i]);
>>>>      }
>>>>      g_string_append(s, "</union>");
>>>>=20=20
>>>> +    /* Finally the sve prefix type */
>>>> +    g_string_append_printf(s,
>>>> +                           "<vector id=3D\"svep\" type=3D\"uint8\" co=
unt=3D\"%d\"/>",
>>>> +                           reg_width / 8);
>>>> +
>>>>      /* Then define each register in parts for each vq */
>>>>      for (i =3D 0; i < 32; i++) {
>>>>          g_string_append_printf(s,
>>>>                                 "<reg name=3D\"z%d\" bitsize=3D\"%d\""
>>>> -                               " regnum=3D\"%d\" group=3D\"vector\""
>>>> -                               " type=3D\"vq\"/>",
>>>> +                               " regnum=3D\"%d\" type=3D\"svev\"/>",
>>>>                                 i, reg_width, base_reg++);
>>>>          info->num++;
>>>>      }
>>>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int=
 base_reg)
>>>>                             " regnum=3D\"%d\" group=3D\"float\""
>>>>                             " type=3D\"int\"/>", base_reg++);
>>>>      info->num +=3D 2;
>>>> -    /*
>>>> -     * Predicate registers aren't so big they are worth splitting up
>>>> -     * but we do need to define a type to hold the array of quad
>>>> -     * references.
>>>> -     */
>>>> -    g_string_append_printf(s,
>>>> -                           "<vector id=3D\"vqp\" type=3D\"uint16\" co=
unt=3D\"%d\"/>",
>>>> -                           cpu->sve_max_vq);
>>>> +
>>>>      for (i =3D 0; i < 16; i++) {
>>>>          g_string_append_printf(s,
>>>>                                 "<reg name=3D\"p%d\" bitsize=3D\"%d\""
>>>> -                               " regnum=3D\"%d\" group=3D\"vector\""
>>>> -                               " type=3D\"vqp\"/>",
>>>> +                               " regnum=3D\"%d\" type=3D\"svep\"/>",
>>>>                                 i, cpu->sve_max_vq * 16, base_reg++);
>>>>          info->num++;
>>>>      }
>>>>      g_string_append_printf(s,
>>>>                             "<reg name=3D\"ffr\" bitsize=3D\"%d\""
>>>>                             " regnum=3D\"%d\" group=3D\"vector\""
>>>> -                           " type=3D\"vqp\"/>",
>>>> +                           " type=3D\"svep\"/>",
>>>>                             cpu->sve_max_vq * 16, base_reg++);
>>>>      g_string_append_printf(s,
>>>>                             "<reg name=3D\"vg\" bitsize=3D\"64\""
>>>> -                           " regnum=3D\"%d\" group=3D\"vector\""
>>>> -                           " type=3D\"uint32\"/>",
>>>> +                           " regnum=3D\"%d\" type=3D\"int\"/>",
>>>>                             base_reg++);
>>>>      info->num +=3D 2;
>>>>      g_string_append_printf(s, "</feature>");
>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>> index 5ab3f5ace3..8a492465d6 100644
>>>> --- a/target/arm/helper.c
>>>> +++ b/target/arm/helper.c
>>>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GB=
yteArray *buf, int reg)
>>>>           * while the ZCR works in Vector Quads (VQ) which is 128bit c=
hunks.
>>>>           */
>>>>          int vq =3D sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
>>>> -        return gdb_get_reg32(buf, vq * 2);
>>>> +        return gdb_get_reg64(buf, vq * 2);
>>>>      }
>>>>      default:
>>>>          /* gdbstub asked for something out our range */
>>>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/a=
arch64/gdbstub/test-sve-ioctl.py
>>>> index 972cf73c31..b9ef169c1a 100644
>>>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>>>>          except gdb.error:
>>>>              report(False, "checking zregs (out of range)")
>>>>=20=20
>>>> +        # Check the aliased V registers are set and GDB has correctly
>>>> +        # created them for us having recognised and handled SVE.
>>>> +        try:
>>>> +            for i in range(0, 16):
>>>> +                val_z =3D gdb.parse_and_eval("$z0.b.u[%d]" % i)
>>>> +                val_v =3D gdb.parse_and_eval("$v0.b.u[%d]" % i)
>>>> +                report(int(val_z) =3D=3D int(val_v),
>>>> +                       "v0.b.u[%d] =3D=3D z0.b.u[%d]" % (i, i))
>>>> +        except gdb.error:
>>>> +            report(False, "checking vregs (out of range)")
>>>> +
>>>>=20=20
>>>>  def run_test():
>>>>      "Run through the tests one by one"
>>>>
>>=20
>>=20


--=20
Alex Benn=C3=A9e
