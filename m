Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3408501lfq;
        Tue, 19 Jan 2021 07:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyULrJzDn0RF2AzxqG3SaDuOq4OkWJwPpOzW99CDrvTZG6+tkHDwAoIH8CCfpFSwLbi6dgr
X-Received: by 2002:a05:600c:19cc:: with SMTP id u12mr108251wmq.26.1611069102308;
        Tue, 19 Jan 2021 07:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611069102; cv=none;
        d=google.com; s=arc-20160816;
        b=WA3/M1Qeg2WiEvHZB6vhhdGmDqYcV7BLFed4a3jnneLutWttFcdpMUO7IVX6xI1g1p
         A6U+VSHQ8eIzAxOCyvbYd0dvPP0eHOOZ81NTryAQdVOAobuLaCIWAjmS86bs4ov7sukC
         0BZg/nFYa5dkdYT1OwhYE7KN2rAbsSppEf9zjaijThjB91m1YJE4nG+J0TVYD0shdn1Z
         xOp69zxXX22LS8tIneJpr/zgZWjFUr6PDNq20Q/A4Xgzl3lrKV2RZN7pockoO/5fIiRT
         iGCQaAB6CTZ86cNfyh0cp8shwx4Zh6PEhkGBZcHf2Iq8E5TDH8ZZR/8YESFrhvgpkHlN
         AzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=MC6q4tjOGRguKWbN/UMtw9SoNA+Dv6bchIpIqR1Ux6o=;
        b=BAxMiyIt8fDU4CKD0NJ6yhJmCOBZfFYht0DJunciiMFKIym0HRj5OHo1JszIwod4eU
         6BAhg7IWvggXqSFnjDZ2to4uUYgfZ2lVQ5Sgc3wY1AwNwkk5OS1FjZGx1PtiRK76J+Eh
         0qen/o2RQJ8S3A+Bges2QVmUZ8iWNMdYjYaj1fZe+7oyckqiInSXT3uWk7ySqvMtKyFe
         xX5RtudVgDn2ORSM8F1jPD9BoB/imS3F8ChS/7v4pcJnUPkRPfKakxc4hbL/OaXVgsNr
         ip7YfM5uLIavDALJA0ps1zXtZ3nwFK5EeOrR3ixwmvop1hRcF0QYD0488qlbsJsa82Ro
         bPtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id o63si2554220wma.2.2021.01.19.07.11.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 07:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D212EB28A;
	Tue, 19 Jan 2021 15:11:41 +0000 (UTC)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, Luis Machado <luis.machado@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de>
Date: Tue, 19 Jan 2021 16:11:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <874kjdugip.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3Jwoc/eYj/dx

On 1/19/21 3:50 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi Alex,
>>
>> after updating to latest master today, I am getting the following error with
>>
>> make check-tcg
>>
>> qemu-system-aarch64: -gdb unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: info: QEMU waiting for connection on: disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>> warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
>> warning: Could not load XML target description; ignoring
>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>
>> Seems to indicate it is "ieee_half" -related?
> 
> *sigh*
> 
> yes - it is. I thought this was solved by the GDB version check in
> 14/30. What does your gdb report?


$ gdb --version
GNU gdb (GDB; openSUSE Leap 15.2) 8.3.1
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gdb --configuration
This GDB was configured as follows:
   configure --host=x86_64-suse-linux --target=x86_64-suse-linux
             --with-auto-load-dir=$debugdir:$datadir/auto-load
             --with-auto-load-safe-path=$debugdir:$datadir/auto-load
             --with-expat
             --with-gdb-datadir=/usr/share/gdb
             --with-jit-reader-dir=/usr/lib64/gdb
             --without-libunwind-ia64
             --with-lzma
             --without-babeltrace
             --with-intel-pt
             --disable-libmcheck
             --with-mpfr
             --with-python=/usr
             --without-guile
             --disable-source-highlight
             --with-separate-debug-dir=/usr/lib/debug
             --with-system-gdbinit=/etc/gdbinit


does this help?

Let me know if more info is needed. Thanks!

Claudio


> 
>>
>> Thanks,
>>
>> Claudio
>>
>> On 1/15/21 2:08 PM, Alex Bennée wrote:
>>> While GDB can work with any XML description given to it there is
>>> special handling for SVE registers on the GDB side which makes the
>>> users life a little better. The changes aren't that major and all the
>>> registers save the $vg reported the same. All that changes is:
>>>
>>>   - report org.gnu.gdb.aarch64.sve
>>>   - use gdb nomenclature for names and types
>>>   - minor re-ordering of the types to match reference
>>>   - re-enable ieee_half (as we know gdb supports it now)
>>>   - $vg is now a 64 bit int
>>>   - check $vN and $zN aliasing in test
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Luis Machado <luis.machado@linaro.org>
>>> Message-Id: <20210108224256.2321-11-alex.bennee@linaro.org>
>>>
>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>>> index 866595b4f1..a8fff2a3d0 100644
>>> --- a/target/arm/gdbstub.c
>>> +++ b/target/arm/gdbstub.c
>>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] = {
>>>      { "uint128", 128, 'q', 'u' },
>>>      { "int128", 128, 'q', 's' },
>>>      /* 64 bit */
>>> +    { "ieee_double", 64, 'd', 'f' },
>>>      { "uint64", 64, 'd', 'u' },
>>>      { "int64", 64, 'd', 's' },
>>> -    { "ieee_double", 64, 'd', 'f' },
>>>      /* 32 bit */
>>> +    { "ieee_single", 32, 's', 'f' },
>>>      { "uint32", 32, 's', 'u' },
>>>      { "int32", 32, 's', 's' },
>>> -    { "ieee_single", 32, 's', 'f' },
>>>      /* 16 bit */
>>> +    { "ieee_half", 16, 'h', 'f' },
>>>      { "uint16", 16, 'h', 'u' },
>>>      { "int16", 16, 'h', 's' },
>>> -    /*
>>> -     * TODO: currently there is no reliable way of telling
>>> -     * if the remote gdb actually understands ieee_half so
>>> -     * we don't expose it in the target description for now.
>>> -     * { "ieee_half", 16, 'h', 'f' },
>>> -     */
>>>      /* bytes */
>>>      { "uint8", 8, 'b', 'u' },
>>>      { "int8", 8, 'b', 's' },
>>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>>      GString *s = g_string_new(NULL);
>>>      DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
>>>      g_autoptr(GString) ts = g_string_new("");
>>> -    int i, bits, reg_width = (cpu->sve_max_vq * 128);
>>> +    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
>>>      info->num = 0;
>>>      g_string_printf(s, "<?xml version=\"1.0\"?>");
>>>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>>> -    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
>>> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
>>>  
>>>      /* First define types and totals in a whole VL */
>>>      for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>>          int count = reg_width / vec_lanes[i].size;
>>> -        g_string_printf(ts, "vq%d%c%c", count,
>>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
>>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
>>>          g_string_append_printf(s,
>>>                                 "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
>>>                                 ts->str, vec_lanes[i].gdb_type, count);
>>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>>       * signed and potentially float versions of each size from 128 to
>>>       * 8 bits.
>>>       */
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
>>>              }
>>>          }
>>>          g_string_append(s, "</union>");
>>>      }
>>>      /* And now the final union of unions */
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
>>>      }
>>>      g_string_append(s, "</union>");
>>>  
>>> +    /* Finally the sve prefix type */
>>> +    g_string_append_printf(s,
>>> +                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
>>> +                           reg_width / 8);
>>> +
>>>      /* Then define each register in parts for each vq */
>>>      for (i = 0; i < 32; i++) {
>>>          g_string_append_printf(s,
>>>                                 "<reg name=\"z%d\" bitsize=\"%d\""
>>> -                               " regnum=\"%d\" group=\"vector\""
>>> -                               " type=\"vq\"/>",
>>> +                               " regnum=\"%d\" type=\"svev\"/>",
>>>                                 i, reg_width, base_reg++);
>>>          info->num++;
>>>      }
>>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>>                             " regnum=\"%d\" group=\"float\""
>>>                             " type=\"int\"/>", base_reg++);
>>>      info->num += 2;
>>> -    /*
>>> -     * Predicate registers aren't so big they are worth splitting up
>>> -     * but we do need to define a type to hold the array of quad
>>> -     * references.
>>> -     */
>>> -    g_string_append_printf(s,
>>> -                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
>>> -                           cpu->sve_max_vq);
>>> +
>>>      for (i = 0; i < 16; i++) {
>>>          g_string_append_printf(s,
>>>                                 "<reg name=\"p%d\" bitsize=\"%d\""
>>> -                               " regnum=\"%d\" group=\"vector\""
>>> -                               " type=\"vqp\"/>",
>>> +                               " regnum=\"%d\" type=\"svep\"/>",
>>>                                 i, cpu->sve_max_vq * 16, base_reg++);
>>>          info->num++;
>>>      }
>>>      g_string_append_printf(s,
>>>                             "<reg name=\"ffr\" bitsize=\"%d\""
>>>                             " regnum=\"%d\" group=\"vector\""
>>> -                           " type=\"vqp\"/>",
>>> +                           " type=\"svep\"/>",
>>>                             cpu->sve_max_vq * 16, base_reg++);
>>>      g_string_append_printf(s,
>>>                             "<reg name=\"vg\" bitsize=\"64\""
>>> -                           " regnum=\"%d\" group=\"vector\""
>>> -                           " type=\"uint32\"/>",
>>> +                           " regnum=\"%d\" type=\"int\"/>",
>>>                             base_reg++);
>>>      info->num += 2;
>>>      g_string_append_printf(s, "</feature>");
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 5ab3f5ace3..8a492465d6 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
>>>           * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
>>>           */
>>>          int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
>>> -        return gdb_get_reg32(buf, vq * 2);
>>> +        return gdb_get_reg64(buf, vq * 2);
>>>      }
>>>      default:
>>>          /* gdbstub asked for something out our range */
>>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>> index 972cf73c31..b9ef169c1a 100644
>>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>>>          except gdb.error:
>>>              report(False, "checking zregs (out of range)")
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
>>>  def run_test():
>>>      "Run through the tests one by one"
>>>
> 
> 
