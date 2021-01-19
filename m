Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3338939lfq;
        Tue, 19 Jan 2021 05:49:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVfIARjAjO9sBD4X+W5IrAYyDoiS11FMZzCYNoRECU50Fft1jt//AVt0/VAg+Y7V6q8Z3f
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr2596544wmh.11.1611064192519;
        Tue, 19 Jan 2021 05:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611064192; cv=none;
        d=google.com; s=arc-20160816;
        b=OXrIS19L+iwGjXuPM5RCIeupMS5pb1oc6H+joOWJuYalBY7fzh2BPKlmYIwQD71Nw4
         vYLR5fs2E1Sxm+gp6asF1OEraYNeXlZLxSlvqGMqYJSILKRJx3FY4wthOPYLOK0b95zm
         nIWPjJcmMV91DULWSJi71j2UcHgeYUHd7jERyOSJTAdZtsd1ACmZ3OuJbLMsFgKXJrR3
         u85wgjpemmzjQGI4Rih6iSyBuF8Md125ewoFsivT2PAYIO2yZrqm3ZdXzyx30hKrg/K3
         FmVE5iAaoS4uh+piN7HX3GAe5Qzp5bgmlQ+yT6gmIgPbLJam1TppOGF4oj6Z5tuy7Z8k
         TrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=9iB6rum7tS0+c/vFPFGKVdP70TodfbSeXMzyaLBCTQk=;
        b=HNojUglnmfTV7ImOhRQe3pr1w7v879XxOv1m4y8RF8pOBUjmdFacOvo2HiP/TVnfmu
         J0Q+CosmY2piNsG46fOaqQWoNVH3zK//qYrooI7BfhhUYeu2WmTQGfu3MH7D63upJh/R
         RvUMYdb+6NSgpSrCA2dintRE2brTHJ46fDR1RSpmZLWdVMFxnuQVm3RGuoZ0Fg3g66wV
         yLlTx3Opb1K3mg4BMJdS/ONYvphV7M/l5/dqix969bkggOOeKuQQtb3c6D9KNzbMAJuM
         J7m/FOU7rgQ5EA8o/PUQBq9yrweX+HtrE79zPLd3aazaEkbI+u3ThttFMTo2k8mOV6ZD
         cnQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id d17si1003493wrp.431.2021.01.19.05.49.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 05:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F3696B185;
	Tue, 19 Jan 2021 13:49:51 +0000 (UTC)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Luis Machado <luis.machado@linaro.org>, qemu-devel@nongnu.org
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
Message-ID: <0a39b15c-4b34-1600-c8b6-cc73c7c89e00@suse.de>
Date: Tue, 19 Jan 2021 14:49:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: h3C5k5AgGP7t

On 1/19/21 2:38 PM, Claudio Fontana wrote:
> Hi Alex,
> 
> after updating to latest master today, I am getting the following error with
> 
> make check-tcg
> 
> qemu-system-aarch64: -gdb unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: info: QEMU waiting for connection on: disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
> warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
> warning: Could not load XML target description; ignoring
> qemu-system-aarch64: QEMU: Terminated via GDBstub
> 
> Seems to indicate it is "ieee_half" -related?
> 
> Thanks,
> 
> Claudio

also later on I get:

  TEST    basic gdbstub support
warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
warning: Could not load XML target description; ignoring
  TEST    basic gdbstub qXfer:auxv:read support
warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
warning: Could not load XML target description; ignoring
  TEST    basic gdbstub SVE support
warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
warning: Could not load XML target description; ignoring
*** stack smashing detected ***: <unknown> terminated
  TEST    basic gdbstub SVE ZLEN support
warning: while parsing target description (at line 47): Vector "svevhf" references undefined type "ieee_half"
warning: Could not load XML target description; ignoring
Python 3.6.10 (default, Jan 16 2020, 09:12:04) [GCC] on linux
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)


... and here it buzzes.

Thanks,

Claudio

> 
> On 1/15/21 2:08 PM, Alex Bennée wrote:
>> While GDB can work with any XML description given to it there is
>> special handling for SVE registers on the GDB side which makes the
>> users life a little better. The changes aren't that major and all the
>> registers save the $vg reported the same. All that changes is:
>>
>>   - report org.gnu.gdb.aarch64.sve
>>   - use gdb nomenclature for names and types
>>   - minor re-ordering of the types to match reference
>>   - re-enable ieee_half (as we know gdb supports it now)
>>   - $vg is now a 64 bit int
>>   - check $vN and $zN aliasing in test
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Luis Machado <luis.machado@linaro.org>
>> Message-Id: <20210108224256.2321-11-alex.bennee@linaro.org>
>>
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index 866595b4f1..a8fff2a3d0 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] = {
>>      { "uint128", 128, 'q', 'u' },
>>      { "int128", 128, 'q', 's' },
>>      /* 64 bit */
>> +    { "ieee_double", 64, 'd', 'f' },
>>      { "uint64", 64, 'd', 'u' },
>>      { "int64", 64, 'd', 's' },
>> -    { "ieee_double", 64, 'd', 'f' },
>>      /* 32 bit */
>> +    { "ieee_single", 32, 's', 'f' },
>>      { "uint32", 32, 's', 'u' },
>>      { "int32", 32, 's', 's' },
>> -    { "ieee_single", 32, 's', 'f' },
>>      /* 16 bit */
>> +    { "ieee_half", 16, 'h', 'f' },
>>      { "uint16", 16, 'h', 'u' },
>>      { "int16", 16, 'h', 's' },
>> -    /*
>> -     * TODO: currently there is no reliable way of telling
>> -     * if the remote gdb actually understands ieee_half so
>> -     * we don't expose it in the target description for now.
>> -     * { "ieee_half", 16, 'h', 'f' },
>> -     */
>>      /* bytes */
>>      { "uint8", 8, 'b', 'u' },
>>      { "int8", 8, 'b', 's' },
>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>      GString *s = g_string_new(NULL);
>>      DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
>>      g_autoptr(GString) ts = g_string_new("");
>> -    int i, bits, reg_width = (cpu->sve_max_vq * 128);
>> +    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
>>      info->num = 0;
>>      g_string_printf(s, "<?xml version=\"1.0\"?>");
>>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>> -    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
>> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
>>  
>>      /* First define types and totals in a whole VL */
>>      for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>          int count = reg_width / vec_lanes[i].size;
>> -        g_string_printf(ts, "vq%d%c%c", count,
>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
>>          g_string_append_printf(s,
>>                                 "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
>>                                 ts->str, vec_lanes[i].gdb_type, count);
>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>       * signed and potentially float versions of each size from 128 to
>>       * 8 bits.
>>       */
>> -    for (bits = 128; bits >= 8; bits /= 2) {
>> -        int count = reg_width / bits;
>> -        g_string_append_printf(s, "<union id=\"vq%dn\">", count);
>> -        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>> -            if (vec_lanes[i].size == bits) {
>> -                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%d%c%c\"/>",
>> -                                       vec_lanes[i].suffix,
>> -                                       count,
>> -                                       vec_lanes[i].sz, vec_lanes[i].suffix);
>> +    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
>> +        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
>> +        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
>> +        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
>> +            if (vec_lanes[j].size == bits) {
>> +                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
>> +                                       vec_lanes[j].suffix,
>> +                                       vec_lanes[j].sz, vec_lanes[j].suffix);
>>              }
>>          }
>>          g_string_append(s, "</union>");
>>      }
>>      /* And now the final union of unions */
>> -    g_string_append(s, "<union id=\"vq\">");
>> -    for (bits = 128; bits >= 8; bits /= 2) {
>> -        int count = reg_width / bits;
>> -        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>> -            if (vec_lanes[i].size == bits) {
>> -                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%dn\"/>",
>> -                                       vec_lanes[i].sz, count);
>> -                break;
>> -            }
>> -        }
>> +    g_string_append(s, "<union id=\"svev\">");
>> +    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
>> +        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
>> +        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
>> +                               suf[i], suf[i]);
>>      }
>>      g_string_append(s, "</union>");
>>  
>> +    /* Finally the sve prefix type */
>> +    g_string_append_printf(s,
>> +                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
>> +                           reg_width / 8);
>> +
>>      /* Then define each register in parts for each vq */
>>      for (i = 0; i < 32; i++) {
>>          g_string_append_printf(s,
>>                                 "<reg name=\"z%d\" bitsize=\"%d\""
>> -                               " regnum=\"%d\" group=\"vector\""
>> -                               " type=\"vq\"/>",
>> +                               " regnum=\"%d\" type=\"svev\"/>",
>>                                 i, reg_width, base_reg++);
>>          info->num++;
>>      }
>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>>                             " regnum=\"%d\" group=\"float\""
>>                             " type=\"int\"/>", base_reg++);
>>      info->num += 2;
>> -    /*
>> -     * Predicate registers aren't so big they are worth splitting up
>> -     * but we do need to define a type to hold the array of quad
>> -     * references.
>> -     */
>> -    g_string_append_printf(s,
>> -                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
>> -                           cpu->sve_max_vq);
>> +
>>      for (i = 0; i < 16; i++) {
>>          g_string_append_printf(s,
>>                                 "<reg name=\"p%d\" bitsize=\"%d\""
>> -                               " regnum=\"%d\" group=\"vector\""
>> -                               " type=\"vqp\"/>",
>> +                               " regnum=\"%d\" type=\"svep\"/>",
>>                                 i, cpu->sve_max_vq * 16, base_reg++);
>>          info->num++;
>>      }
>>      g_string_append_printf(s,
>>                             "<reg name=\"ffr\" bitsize=\"%d\""
>>                             " regnum=\"%d\" group=\"vector\""
>> -                           " type=\"vqp\"/>",
>> +                           " type=\"svep\"/>",
>>                             cpu->sve_max_vq * 16, base_reg++);
>>      g_string_append_printf(s,
>>                             "<reg name=\"vg\" bitsize=\"64\""
>> -                           " regnum=\"%d\" group=\"vector\""
>> -                           " type=\"uint32\"/>",
>> +                           " regnum=\"%d\" type=\"int\"/>",
>>                             base_reg++);
>>      info->num += 2;
>>      g_string_append_printf(s, "</feature>");
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 5ab3f5ace3..8a492465d6 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
>>           * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
>>           */
>>          int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
>> -        return gdb_get_reg32(buf, vq * 2);
>> +        return gdb_get_reg64(buf, vq * 2);
>>      }
>>      default:
>>          /* gdbstub asked for something out our range */
>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> index 972cf73c31..b9ef169c1a 100644
>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>>          except gdb.error:
>>              report(False, "checking zregs (out of range)")
>>  
>> +        # Check the aliased V registers are set and GDB has correctly
>> +        # created them for us having recognised and handled SVE.
>> +        try:
>> +            for i in range(0, 16):
>> +                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
>> +                val_v = gdb.parse_and_eval("$v0.b.u[%d]" % i)
>> +                report(int(val_z) == int(val_v),
>> +                       "v0.b.u[%d] == z0.b.u[%d]" % (i, i))
>> +        except gdb.error:
>> +            report(False, "checking vregs (out of range)")
>> +
>>  
>>  def run_test():
>>      "Run through the tests one by one"
>>
> 
> 
