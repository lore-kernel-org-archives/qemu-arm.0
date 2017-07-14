Received: by 10.25.44.15 with SMTP id s15csp1228571lfs;
        Fri, 14 Jul 2017 10:42:47 -0700 (PDT)
X-Received: by 10.55.142.67 with SMTP id q64mr11960135qkd.99.1500054167644;
        Fri, 14 Jul 2017 10:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500054167; cv=none;
        d=google.com; s=arc-20160816;
        b=ImhWQjsR30+mWZE3fkfIu6vfXKq3E+pbxCVdZA58/fcLgc9TUjP6sUSgd6ggKcLT4J
         SeMOAJu9ynu1opsRcZER4ALfEXkYWEn5CXJjQUzqs0R3ORPjotjLzabI7U+xz7DUs9js
         DmG7p3llEJ8jNQ9q7mO2C50ar43z+d0KNb2Rtf1tqlHMHaRFkoWEJForfC527gOxOMQb
         iUYSh+lio7+Xw4+bQGMA1cRbn3zbIJFeKYtstFGsocB+K+kHDZOum0bg6wvrA6DIDMB0
         Qmm59jpus3vSptzc+yEtnYQ10qQv82Lqc65KG9nSIOYgYoy0GWq/Ef5xXakRcEnovx5D
         H8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=qn84dH4j1hCKb+NypvDvmuXrlzKnyAvO0wYVzlDkA44=;
        b=XAVC6gVgD1vRm748H3Qb3H9+BUlcWdec2drVGnSna+32WJ1mcyZfGfdCWs2ewPfP+6
         scxyIw0g0jZPl8Y0JY6Qk+VuEv8bUjeM41jOvFpiCaRQ2kjNmuwIa8JVvNouqJ7r+V4j
         TJ4tK8sxgzD+YZVJF2igH0QzIrY/Ikzzkb2RskebzEkObM3ZQcV4+q3cNxyCi1UQxOsb
         qy2mKTMLSEClMYIrnT3D3MJooBKvERRLHqJWulVvrfPmYnFUuN/yxuu//rDr0wJCSiM2
         lTW7jAtmx7IvHrKSjCHV177VXxylBF6OmRpuJpTL+RaMddC4SCsVXIKrXbFdbWXJF3Ly
         Y/AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Cb7mbv93;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id z24si8477842qth.247.2017.07.14.10.42.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 10:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Cb7mbv93;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id a66so11947918qkb.0;
        Fri, 14 Jul 2017 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qn84dH4j1hCKb+NypvDvmuXrlzKnyAvO0wYVzlDkA44=;
        b=Cb7mbv93VeWZLMsVstqwM76kSX9T5Z6a1RbApYVwLLykxA5rsB4NRUTiZfpzjxSCzc
         eAwWBhMD74zCKtLsLoxzOoHOmHFffcnb6oVQ20hQdu+OehnrZbcoT4zG4cj5Ki5jYBcy
         p4FfuNwET4aqsrTfDw8rhyZMpq+qiv+qX0cSfFZ9LXw6rgCFIhgG5yfOcSZCN9Mft14u
         sxYonFXeXXHh2BzxYxRP1rhBuXzmoGIe2V/cke8Kpx7Wc/XnnvyvKe9NQTuqo/tzDdB9
         dZceDvhqDllvo6/nktn6KeWZt0BM6CTWoXC8um7307+QTT3Pl5VvttQdXkyzJBxbnj1E
         HQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qn84dH4j1hCKb+NypvDvmuXrlzKnyAvO0wYVzlDkA44=;
        b=D5oZIR/xkM5oue4bLgv/UMXhXjNZ0nssPVQZ/bUITBaaLykqIhaY5rXdVi2hvj6qOw
         lS+iA+4WP7WdvJs3EWwu+3Oo6vg1cE/m/U7Vdvt430udHOtORPU200v3pEzBNZXspvOz
         /a+UdIDOQ4YgqRsPKm7Qc/uqGk6FtL6oOAtAZKoY6htl8nqIh4QF3YffLkJ47dEMSPe0
         HFg+f8AX3Fw3Ov2vYdLzcRt5CL5cvEVb3GGzNpsXp73krsYCJMgVhmlJ3JwWOXWBSw9F
         GXaq/KyRhGEWuQZjNwIk/qILfkdneiw310FYPXac9by3GU61ZIIDSnvKblUd7ovVU04k
         +i4Q==
X-Gm-Message-State: AIVw111Jrfwako2+fF4AAo4C7H3rbe0W6A/WD8ZLFkz7RKlaZuA4O+PC
	zS7jZz2j612xQ9XKJXc=
X-Received: by 10.55.129.199 with SMTP id c190mr11876272qkd.68.1500054166847;
        Fri, 14 Jul 2017 10:42:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id b201sm7050522qkg.5.2017.07.14.10.42.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 10:42:46 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v13 18/26] target/arm: [tcg] Port to
 breakpoint_check
From: Richard Henderson <rth@twiddle.net>
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
 <150002437386.22386.7745855254236101855.stgit@frigg.lan>
 <584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net>
Message-ID: <a831e072-2a10-d6c5-5d04-f00772b85b5b@twiddle.net>
Date: Fri, 14 Jul 2017 07:42:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +ERv03zAm2tB

On 07/14/2017 07:26 AM, Richard Henderson wrote:
> On 07/13/2017 11:26 PM, Lluís Vilanova wrote:
>> Incrementally paves the way towards using the generic instruction translation
>> loop.
>>
>> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
>>   target/arm/translate.c |   53 +++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 34 insertions(+), 19 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index b9183fc511..55bef09739 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -11917,6 +11917,33 @@ static void arm_tr_insn_start(DisasContextBase 
>> *dcbase, CPUState *cpu)
>>   #endif
>>   }
>> +static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>> +                                    const CPUBreakpoint *bp)
>> +{
>> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
>> +
>> +    if (bp->flags & BP_CPU) {
>> +        gen_set_condexec(dc);
>> +        gen_set_pc_im(dc, dc->pc);
>> +        gen_helper_check_breakpoints(cpu_env);
>> +        /* End the TB early; it's likely not going to be executed */
>> +        dc->base.is_jmp = DISAS_UPDATE;
>> +    } else {
>> +        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
>> +        /* The address covered by the breakpoint must be
>> +           included in [tb->pc, tb->pc + tb->size) in order
>> +           to for it to be properly cleared -- thus we
>> +           increment the PC here so that the logic setting
>> +           tb->size below does the right thing.  */
>> +        /* TODO: Advance PC by correct instruction length to
>> +         * avoid disassembler error messages */
>> +        dc->pc += 2;
>> +        dc->base.is_jmp = DISAS_NORETURN;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /* generate intermediate code for basic block 'tb'.  */
>>   void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>>   {
>> @@ -11965,28 +11992,16 @@ void gen_intermediate_code(CPUState *cs, 
>> TranslationBlock *tb)
>>           if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>>               CPUBreakpoint *bp;
>>               QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
>> -                if (bp->pc == dc->pc) {
>> -                    if (bp->flags & BP_CPU) {
>> -                        gen_set_condexec(dc);
>> -                        gen_set_pc_im(dc, dc->pc);
>> -                        gen_helper_check_breakpoints(cpu_env);
>> -                        /* End the TB early; it's likely not going to be 
>> executed */
>> -                        dc->base.is_jmp = DISAS_UPDATE;
> 
> Oh I see what you're doing there in the main loop.
> And I see that you're copying existing behaviour.
> 
> That said, I do wonder if there's a better way.
> 
> Looking back at the original patch (5d98bf8f), there do not
> seem to have been any other side effects intended; simply
> "single step" any insn for which this bp condition is met.
> 
> Another way to handle this would be if we could adjust max_insns = num_insns.
> That would cause the loop to exit after the current insn, with DISAS_TOO_MANY 
> if nothing else.

Another possibility is is_jmp = DISAS_TOO_MANY, and exit the translation loop 
after the breakpoint check only for is_jmp > DISAS_TOO_MANY.  That allows all 
of the DISAS_TARGET_N values to exit as well.


r~
