Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp248798wrv;
        Fri, 26 Jul 2019 11:34:06 -0700 (PDT)
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr92230174pgd.13.1564166046297;
        Fri, 26 Jul 2019 11:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564166046; cv=none;
        d=google.com; s=arc-20160816;
        b=LoBHg0KYCyI3vEYf2hePGAwf7DwPE+d4kkJW101KvT3uKIY/M7ISU7ymGEnULqWK81
         zvv1eZTe1qFf8UrDE4FK5nLZkXPz14Xvw46OCQU3c+zkFQHLjAlkiVMi676kZIsWYG7O
         wt9U4/Q1wFUtwnhax8zO/HVxkkNOG+wyoaH4MpVKEppVwpb6Lsf7Cf40nbp+WSTAvEnT
         qXsLsqgHoYK4qqtAqYgigOGk9tYYY/stNCTZc3FmnA+RIH0RfmEaEvED3FBqIcORxYnc
         cRvhMtK/JplGqeKxxrOZ+DvUc5oL92lkvjuG/PcHsdR8eHihBa/9wckL5lSwubwUKyz/
         hDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=wkSx0OalOfQUYo0gvwfAvDMu6TklzMt4esDAb6i7vsM=;
        b=hjq0mjMsb1AWFrHK1dUF3SawUNhHv4QT2e/v4skJK3oJCQ1JdTiIMZKDwzKtGNjPpZ
         0djNg1YALw0elAYQw+RhC67fmSAf1Xn1rNwPmW1mklZRP1/H4aM3oyAS5K8gjM1HNPzP
         aSOzEwb+M5lRHLMQRAf7ibXavPCIGVFJDuLCCc4wtkQWkbqauKW2Z5WGpDnUSi5WRLgi
         NlF+1VzY+862Yn2iAnW/W0K2qNIfwVa+fN1WW0u2eg3Ai3G8Mf08Z8AsTxIFtFL2SlXr
         Ue1F+BRvqNHY6WNmbAIyIK3HCsE1yuXmXbu8SKWbNJU0ZCBAYIdBmW7Ljs2MB1Tz8FIn
         xIWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zGucbvKM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a6sor13082182pgt.14.2019.07.26.11.34.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 11:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zGucbvKM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wkSx0OalOfQUYo0gvwfAvDMu6TklzMt4esDAb6i7vsM=;
        b=zGucbvKMTMdz8tPJMPMB8Q6aR8acVZMipNc8MMaMUKnm7UNZSqetfMY+w1jR5xDMqq
         fdE8g5LXfnRXbyDbCnlXC4M2ab15qXC7DDJyJCDtCO7DdvzAvLXNa6qH86h/WC75En8N
         f7OIiPjGoBDE9l0hDDtibf//APVG6XQGEi04CY53nV0Jse+opsDCjCvXp++Nv456+MfN
         oE8tUEOHh5xUVofTixr6pU8O+bt2NHKzXS7AT4xx7R/2QHaLTfsYjgXO58ag2P8U09cU
         DtjG6Cx0OIPeXoxC5ei5h0KBbQp+FRU1doVhKmaxbX1HbFeyBmzZ0SXC2WbH+Rx7t7ra
         9T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wkSx0OalOfQUYo0gvwfAvDMu6TklzMt4esDAb6i7vsM=;
        b=lq8b++ItM/19NAr/dipob6ysyRBtb5gUL7JhsTpS3QorqDo8/AAxJM/JCcIFAHSa8E
         yuVtqmqkdF/TY5S38YzRkv3BSnD2Zn5d1qXV0ij2z+blp9F3LcqmbLDj1vsctar7XgMo
         yIiHp3Vnb1gOZgYV50MXn+wK+VfMB6vbsvbtW0ZZT0Itr5mh0A97w9F+dA7d+gTJ+0fL
         3W7LBmtwR7dtTgKaDzvXYJf73+DdjfgqzZMU+uWP26Pl2fm5KNf4XKycN6pmtqmAsX3N
         0uPQOeL7hJcIdvDpGdf6JT2TAPb1PbIoxftZY/8XeDcteHCy/tPouboVxSpjBXjD/oRB
         brpQ==
X-Gm-Message-State: APjAAAXx5iDaWE9OU5aRmHlXH39cBZ29YLdoaPCp12amYyQeGwKsnt/d
	4T3mkhT1TMjKD3tUYmQgl42YeZTnfSqxDA==
X-Google-Smtp-Source: APXvYqxW+DkdA1INys4b3oTci2eLSXQ6MqdQ9ho0zZVcXIAi92r45eN3JmJe7+Pxb352rqS09J7OUw==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr17677684pgb.441.1564166045241;
        Fri, 26 Jul 2019 11:34:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id v7sm10908081pff.87.2019.07.26.11.34.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 11:34:04 -0700 (PDT)
Subject: Re: [PATCH 66/67] target/arm: Move singlestep check from gen_jmp to
 gen_goto_tb
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-67-richard.henderson@linaro.org>
 <CAFEAcA9s44Lc58X=C1DzPRRCyi_KOpx0CiMfhKWEzAdDoU326A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <77302caf-9111-8341-c05a-aff996437c2b@linaro.org>
Date: Fri, 26 Jul 2019 11:34:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9s44Lc58X=C1DzPRRCyi_KOpx0CiMfhKWEzAdDoU326A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: spFL0MYAl0jO

On 7/26/19 11:13 AM, Peter Maydell wrote:
> On Fri, 26 Jul 2019 at 18:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We miss quite a number of single-step events by having
>> the check in the wrong place.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index c2b8b86fd2..9ae9b23823 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -2740,7 +2740,10 @@ static void gen_goto_ptr(void)
>>   */
>>  static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>>  {
>> -    if (use_goto_tb(s, dest)) {
>> +    if (unlikely(is_singlestepping(s))) {
>> +        gen_set_pc_im(s, dest);
>> +        gen_singlestep_exception(s);
>> +    } else if (use_goto_tb(s, dest)) {
>>          tcg_gen_goto_tb(n);
>>          gen_set_pc_im(s, dest);
>>          tcg_gen_exit_tb(s->base.tb, n);
>> @@ -2751,16 +2754,9 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>>      s->base.is_jmp = DISAS_NORETURN;
>>  }
>>
>> -static inline void gen_jmp (DisasContext *s, uint32_t dest)
>> +static inline void gen_jmp(DisasContext *s, uint32_t dest)
>>  {
>> -    if (unlikely(is_singlestepping(s))) {
>> -        /* An indirect jump so that we still trigger the debug exception.  */
>> -        if (s->thumb)
>> -            dest |= 1;
>> -        gen_bx_im(s, dest);
>> -    } else {
>> -        gen_goto_tb(s, 0, dest);
>> -    }
>> +    gen_goto_tb(s, 0, dest);
>>  }
>>
>>  static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
> 
> I haven't tested but I'm not sure this change is right.
> The idea of the current code is that we handle generating
> the actual singlestep exception in arm_tr_tb_stop() at the
> end, rather than in the process of generating code for the
> insn. This change means we now do a gen_singlestep_exception()
> in the gen_jmp()/gen_goto_tb() part of the code, but we haven't
> removed the handling of it in arm_tr_tb_stop(), so we're now
> doing this in two places. Why doesn't the current design work?

Note that the existing gen_goto_tb does not test for single-step, and always
emits NORETURN code, either via tcg_gen_goto_tb() or
tcg_gen_lookup_and_goto_ptr().  The singlestep exception is neither generated
nor would it be reachable.

Another way to do handle this would be to test single-step but set DISAS_JUMP
instead of actually generate the singlestep exception in gen_goto_tb.  Do you
prefer that method?

> And if we need to do something different for the route to
> "change the PC via gen_jmp()" why don't we need to do it
> also when we change the PC via eg gen_bx_im() ?

See patch 67.

>  * four places for barrier insns where we use a
>    gen_goto_tb to end the TB -- this isn't consistent
>    with how we end the TB for other situations...)

Fixing this sounds like a good cleanup.


r~
