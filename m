Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2738460lfq;
        Mon, 11 Jan 2021 06:50:25 -0800 (PST)
X-Received: by 2002:a37:67cc:: with SMTP id b195mr16473019qkc.406.1610376624894;
        Mon, 11 Jan 2021 06:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610376624; cv=none;
        d=google.com; s=arc-20160816;
        b=NOBdsf3e4SzVOrKSnxz3aJS2ia4/sH6UXIStiWowRjio6VpWzSbywP1VSdcRY3sVK3
         PX9DR4xTy1Py9EJoiK2SF97K4TscgNaLTMMVaTjRQNyS0/yOanZH1GhojGVpSUAcZA0g
         YVTttwIotY2gkCXGE+R86uJHzG9r0tT4yQcKKjdcB7CXkgqeMnUPm6VPNMFyDBgfVDOA
         n2NjP4ikSOTCig9eQOee4qoLMZhTKAUG7DxGY5XmRN/Bt7jnNnPuSeEsaD733/in3Qzx
         OEZcH0AJlyEbaLLYMwzljcvHTIVrwRXP+hFvD3kIt4zI3JT1Re9I7MVnBVm2PVPiLDnK
         oB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SQhJjiT30eyMG2iIN9BvDrzibRA2vr/Sy8VxkTsg2pg=;
        b=xcGYPUap8GedPlQj0PhIInrdiNLPxPF1xD+oFr3vf8fGh5ElgEC1Vib2SslKiXuvLc
         zyJDaf7Q+V3/5w1X0aUpFXaVXNODYQgtukpUI8bJHARYVYofZCFuwzfxFaZuru2ays44
         BBHQJZ4EpZzdrCvOEynR6qPVbWN8IBUBLTN4zv6GE0V1yFM/PG8JgEhBumwdq4+M8h6R
         ZnBgCYcVxkBY4fzyCduk1Rwa2gOg/8joIyon8TQCN+z4gBtudcpqrEFiQ2323a8Q3EHx
         RU7/n8/pFNJurCWo8Z+S1cv4zgpW0G0ZsWS1bZydQlkyXsg3u9zV6jwF5b8TvqbmYP7c
         tDaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DTu01/Qn";
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h12sor8068964qka.149.2021.01.11.06.50.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Jan 2021 06:50:24 -0800 (PST)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DTu01/Qn";
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SQhJjiT30eyMG2iIN9BvDrzibRA2vr/Sy8VxkTsg2pg=;
        b=DTu01/QnQlCC1jLeJdymYmtLykHi/w8A9FD1Kioojq4K/uH+2Q3jYTaOQaSEQGfBy9
         B/ap7cGLuOuqWqU/JrUVkeUd7yqKGodWOjcuwCP6wLFVslJ9ko2yuBPBezY/7fgQ+zI3
         5UlFiHd9MHFb9uI8ZS/j9cI8+D1kotVwllQH7sAk3UZbcnfCa5FM8onIFZITyrvfRMQd
         8JKbIpqIzwBKuGtSFx4v/+9HQ+a0eIeq5ghAlmWp/ORThZGBf7O3dkJ+l7engzRuFE0i
         s0J6zGPwbx0e7lmNasE/0NAM1kxYfRL4G1fMwjYjlOHgz7B6oqZ6n1z1uCbvMqtJ6O9O
         qb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SQhJjiT30eyMG2iIN9BvDrzibRA2vr/Sy8VxkTsg2pg=;
        b=Xc/q4YWnJDgI7IbVL7aNaGgT+dpzoF+eoSV+HDS07I0SVvFZ9VIEf6g6ZmOzS3gUAM
         EqRxknceqT9ppKZB5jpXImzhdnzr91hM6nVOd/ldKyCHKOeHj6XgykKs3+sLydAjPXvx
         agZZrDBspDt5Vdhb4e43fjvgUnPxONmqB3tF+P80F+I4cWKrqpOQeK1LuTdXRonk+R+O
         ZeA6EcKT4UZiDoHp7qChyB/1ZNhPHJcRN4FA+GvI08NKbR2MwZ63a38FkSnUEdqn4i6F
         Bc9d1bBU+ga3fZrM6XOSkbwkGMjGRoqgPastECFZ0yS32tBo0LOyQryYM454nhLLDfva
         9Qag==
X-Gm-Message-State: AOAM533Afl8lrdwrhO3TBrQFONYFSK3utPp0d1Yu5YXoW0ZWHm/bydTU
	zPCMUakCnQ629YZzorVE5ADKbu7W3D817+vS
X-Google-Smtp-Source: ABdhPJzP9bsY5iTjF7UMC44syih9U8GSMoE/3BVnBK/GCDk2tSocPfx4Gta2iwRzFeopuebzjJz+eA==
X-Received: by 2002:a37:a8a:: with SMTP id 132mr16382414qkk.327.1610376624245;
        Mon, 11 Jan 2021 06:50:24 -0800 (PST)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:8284:874d:20e9:a3d4:1db5:c30a? ([2804:7f0:8284:874d:20e9:a3d4:1db5:c30a])
        by smtp.gmail.com with ESMTPSA id i129sm8265616qkd.114.2021.01.11.06.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 06:50:23 -0800 (PST)
Subject: Re: [PATCH v1 10/20] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-11-alex.bennee@linaro.org>
 <9ee1443e-821d-9cec-c29a-6111385937ad@linaro.org> <87zh1fo7yd.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <50da05ee-f7fb-1a18-391d-a707b5df2dba@linaro.org>
Date: Mon, 11 Jan 2021 11:50:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87zh1fo7yd.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jIswII2dMZwO

Hi,

On 1/11/21 11:36 AM, Alex Bennée wrote:
> 
> Luis Machado <luis.machado@linaro.org> writes:
> 
>> For the record, the layout looks OK to me.
> 
> So a Reviewed-by?
> 

Yes.

>> Just a reminder that GDB will soon support bfloat16 types. A patch may
>> be pushed this month.
> 
> Will we be able to probe for the support - or will an older GDB silently
> accept and drop any bfloat16 fields?
> 

No probing unfortunately. I think GDB wouldn't handle it nicely. Older 
GDB's not supporting bfloat16 may throw an internal error when they see 
an unknown type.

That may need to be corrected to make it more robust.

>>
>> On 1/8/21 7:42 PM, Alex Bennée wrote:
>>> While GDB can work with any XML description given to it there is
>>> special handling for SVE registers on the GDB side which makes the
>>> users life a little better. The changes aren't that major and all the
>>> registers save the $vg reported the same. All that changes is:
>>>
>>>     - report org.gnu.gdb.aarch64.sve
>>>     - use gdb nomenclature for names and types
>>>     - minor re-ordering of the types to match reference
>>>     - re-enable ieee_half (as we know gdb supports it now)
>>>     - $vg is now a 64 bit int
>>>     - check $vN and $zN aliasing in test
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Luis Machado <luis.machado@linaro.org>
>>> Message-Id: <20201218112707.28348-10-alex.bennee@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    target/arm/gdbstub.c                        | 75 ++++++++-------------
>>>    target/arm/helper.c                         |  2 +-
>>>    tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 11 +++
>>>    3 files changed, 41 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>>> index 866595b4f1..a8fff2a3d0 100644
>>> --- a/target/arm/gdbstub.c
>>> +++ b/target/arm/gdbstub.c
>>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] = {
>>>        { "uint128", 128, 'q', 'u' },
>>>        { "int128", 128, 'q', 's' },
>>>        /* 64 bit */
>>> +    { "ieee_double", 64, 'd', 'f' },
>>>        { "uint64", 64, 'd', 'u' },
>>>        { "int64", 64, 'd', 's' },
>>> -    { "ieee_double", 64, 'd', 'f' },
>>>        /* 32 bit */
>>> +    { "ieee_single", 32, 's', 'f' },
>>>        { "uint32", 32, 's', 'u' },
>>>        { "int32", 32, 's', 's' },
>>> -    { "ieee_single", 32, 's', 'f' },
>>>        /* 16 bit */
>>> +    { "ieee_half", 16, 'h', 'f' },
>>>        { "uint16", 16, 'h', 'u' },
>>>        { "int16", 16, 'h', 's' },
>>> -    /*
>>> -     * TODO: currently there is no reliable way of telling
>>> -     * if the remote gdb actually understands ieee_half so
>>> -     * we don't expose it in the target description for now.
>>> -     * { "ieee_half", 16, 'h', 'f' },
>>> -     */
>>>        /* bytes */
>>>        { "uint8", 8, 'b', 'u' },
>>>        { "int8", 8, 'b', 's' },
>>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>>        GString *s = g_string_new(NULL);
>>>        DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
>>>        g_autoptr(GString) ts = g_string_new("");
>>> -    int i, bits, reg_width = (cpu->sve_max_vq * 128);
>>> +    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
>>>        info->num = 0;
>>>        g_string_printf(s, "<?xml version=\"1.0\"?>");
>>>        g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>>> -    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
>>> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
>>>    
>>>        /* First define types and totals in a whole VL */
>>>        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>>            int count = reg_width / vec_lanes[i].size;
>>> -        g_string_printf(ts, "vq%d%c%c", count,
>>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
>>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
>>>            g_string_append_printf(s,
>>>                                   "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
>>>                                   ts->str, vec_lanes[i].gdb_type, count);
>>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>>         * signed and potentially float versions of each size from 128 to
>>>         * 8 bits.
>>>         */
>>> -    for (bits = 128; bits >= 8; bits /= 2) {
>>> -        int count = reg_width / bits;
>>> -        g_string_append_printf(s, "<union id=\"vq%dn\">", count);
>>> -        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>> -            if (vec_lanes[i].size == bits) {
>>> -                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%d%c%c\"/>",
>>> -                                       vec_lanes[i].suffix,
>>> -                                       count,
>>> -                                       vec_lanes[i].sz, vec_lanes[i].suffix);
>>> +    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
>>> +        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
>>> +        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
>>> +        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
>>> +            if (vec_lanes[j].size == bits) {
>>> +                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
>>> +                                       vec_lanes[j].suffix,
>>> +                                       vec_lanes[j].sz, vec_lanes[j].suffix);
>>>                }
>>>            }
>>>            g_string_append(s, "</union>");
>>>        }
>>>        /* And now the final union of unions */
>>> -    g_string_append(s, "<union id=\"vq\">");
>>> -    for (bits = 128; bits >= 8; bits /= 2) {
>>> -        int count = reg_width / bits;
>>> -        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>> -            if (vec_lanes[i].size == bits) {
>>> -                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%dn\"/>",
>>> -                                       vec_lanes[i].sz, count);
>>> -                break;
>>> -            }
>>> -        }
>>> +    g_string_append(s, "<union id=\"svev\">");
>>> +    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
>>> +        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
>>> +        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
>>> +                               suf[i], suf[i]);
>>>        }
>>>        g_string_append(s, "</union>");
>>>    
>>> +    /* Finally the sve prefix type */
>>> +    g_string_append_printf(s,
>>> +                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
>>> +                           reg_width / 8);
>>> +
>>>        /* Then define each register in parts for each vq */
>>>        for (i = 0; i < 32; i++) {
>>>            g_string_append_printf(s,
>>>                                   "<reg name=\"z%d\" bitsize=\"%d\""
>>> -                               " regnum=\"%d\" group=\"vector\""
>>> -                               " type=\"vq\"/>",
>>> +                               " regnum=\"%d\" type=\"svev\"/>",
>>>                                   i, reg_width, base_reg++);
>>>            info->num++;
>>>        }
>>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>>                               " regnum=\"%d\" group=\"float\""
>>>                               " type=\"int\"/>", base_reg++);
>>>        info->num += 2;
>>> -    /*
>>> -     * Predicate registers aren't so big they are worth splitting up
>>> -     * but we do need to define a type to hold the array of quad
>>> -     * references.
>>> -     */
>>> -    g_string_append_printf(s,
>>> -                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
>>> -                           cpu->sve_max_vq);
>>> +
>>>        for (i = 0; i < 16; i++) {
>>>            g_string_append_printf(s,
>>>                                   "<reg name=\"p%d\" bitsize=\"%d\""
>>> -                               " regnum=\"%d\" group=\"vector\""
>>> -                               " type=\"vqp\"/>",
>>> +                               " regnum=\"%d\" type=\"svep\"/>",
>>>                                   i, cpu->sve_max_vq * 16, base_reg++);
>>>            info->num++;
>>>        }
>>>        g_string_append_printf(s,
>>>                               "<reg name=\"ffr\" bitsize=\"%d\""
>>>                               " regnum=\"%d\" group=\"vector\""
>>> -                           " type=\"vqp\"/>",
>>> +                           " type=\"svep\"/>",
>>>                               cpu->sve_max_vq * 16, base_reg++);
>>>        g_string_append_printf(s,
>>>                               "<reg name=\"vg\" bitsize=\"64\""
>>> -                           " regnum=\"%d\" group=\"vector\""
>>> -                           " type=\"uint32\"/>",
>>> +                           " regnum=\"%d\" type=\"int\"/>",
>>>                               base_reg++);
>>>        info->num += 2;
>>>        g_string_append_printf(s, "</feature>");
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index d077dd9ef5..d434044f07 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
>>>             * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
>>>             */
>>>            int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
>>> -        return gdb_get_reg32(buf, vq * 2);
>>> +        return gdb_get_reg64(buf, vq * 2);
>>>        }
>>>        default:
>>>            /* gdbstub asked for something out our range */
>>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>> index 972cf73c31..b9ef169c1a 100644
>>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>>>            except gdb.error:
>>>                report(False, "checking zregs (out of range)")
>>>    
>>> +        # Check the aliased V registers are set and GDB has correctly
>>> +        # created them for us having recognised and handled SVE.
>>> +        try:
>>> +            for i in range(0, 16):
>>> +                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
>>> +                val_v = gdb.parse_and_eval("$v0.b.u[%d]" % i)
>>> +                report(int(val_z) == int(val_v),
>>> +                       "v0.b.u[%d] == z0.b.u[%d]" % (i, i))
>>> +        except gdb.error:
>>> +            report(False, "checking vregs (out of range)")
>>> +
>>>    
>>>    def run_test():
>>>        "Run through the tests one by one"
>>>
> 
> 
