Received: by 10.223.172.38 with SMTP id v35csp5896754wrc;
        Mon, 11 Sep 2017 11:09:58 -0700 (PDT)
X-Received: by 10.98.166.137 with SMTP id r9mr12650657pfl.86.1505153398247;
        Mon, 11 Sep 2017 11:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505153398; cv=none;
        d=google.com; s=arc-20160816;
        b=CiGhRx6zN5IJ/DYbWWe+iDferPRh4iEFdw4Dft301fhrV4+6COGp+ivVohk5ciN0GH
         SD+NGTOcs/pkXC3YQ/Q3wqfP+EcIA77nmfQDTEt5uZJKGhUi3UrEmrE9wXJ8eUshohr/
         ZLgdQt4YDVsAAeObVcGyJTEVJOHSncGoHgI9UhmEMMpUVwmli99naG6ccPUlqA/vk3Li
         cFhCzoftT3Q3FsgvZWKWbUxrJzpXIXn1ZlDPUr1Ax15ASIXSjSMH6IqgMw5/moi9Vx+P
         Ct6bjkXyjp5VllDrzqpcR1z0YzD57MC3BwHQD7JWg164vfyNoI1BjSY5trTZzJNS1Dwx
         H3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=cZAm4ukSaFeubMedDtCI2IgxkI7upiExwYOsQb7NNjc=;
        b=oQgruSfRqXU3u4JELeSLUmxjlytSw6QfIKQghm3d8UWdw7bvCl6n3CqfstWGcwWgOe
         l/LFLa9vsgpYlWmE7xV4fNZtCPmWTy+mSmEsYdVxovWJcqfSrOUnN2J1H+9HCzXrXcGA
         ksT9t8WdCU5Ua6Z2fIIO3lT7Cf2ToyYnlkDjvsGmmYlPvwop7yLYe9P1Ts5wubhCbCpr
         Ol3cJ0+3f7C+/ugI81wMm5h1eKPZjHlOjd5NWYY2rB1MR3QliZAyaMOOrHaynpQnjZ+o
         qYAM4fcRcDCFWmXEdVtPQA94n1uiIhpEKmsv430KI3wYh/P6YMAChx4RrWyH07NLI2HU
         dEzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hSF+ltfI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r9sor4202734pgd.420.2017.09.11.11.09.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Sep 2017 11:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hSF+ltfI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cZAm4ukSaFeubMedDtCI2IgxkI7upiExwYOsQb7NNjc=;
        b=hSF+ltfI4CMIsvUOkTP8fYjcBihazG2WnWUA5SIAj3jpswM3CifZ2Q4fUzN4rPaak0
         sAa6VqUPMnp1xQUuF/3dzb7qnwHXAfCEzKPZXtysAQmknTRULldZIR74ovUmoy74E0m9
         5b0Ew8JTGHB2ESLSID8Nx+KbofmF+bsINekXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cZAm4ukSaFeubMedDtCI2IgxkI7upiExwYOsQb7NNjc=;
        b=KaJJgkKewxK1yW+XYPI89bv1jHncy5Hxl3siaiZ8ddKUssVQAS47fkuqygxd3r+MQe
         IfquEmQ8Gu8o/QeqBtJdTasL1hwIzI6bPBEDAt8hd4Lih5SFVAmlYQiIBExfh76Xw5pa
         EdU7/atDGA2HAWOxTDIgagXTftPF0UvmZkMuV/NLEKRUrPMTe29Jbc3LXMvwPpG4Ql3f
         378i+xOczb792wuQI7eGvFn29HUrrePLdPgrdXvorMWIku+/8sJd7NxICZU7NwoMTyqy
         lF+QavnOf4r0bDK51Zf9oaiECj2dT6GA+Nsq0XeK05uwigRnH/eSHTjCgx6+apThcm4s
         CreA==
X-Gm-Message-State: AHPjjUg1UK8i/cyPiKgA/wHZTI/XVtRQZB8drNfSYJEbDlk7b9b5wODY
	XBQgua9n82kSZAJvykYlQZmE
X-Google-Smtp-Source: ADKCNb6/XXMHShtM/8y5Atzoz5YlSXdIbsyhEy0V+uJiuUVAc7je5jtc0LAVKswmWfm+vi+9vWZWHg==
X-Received: by 10.101.77.137 with SMTP id p9mr12268697pgq.88.1505153397696;
        Mon, 11 Sep 2017 11:09:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net. [97.126.103.167])
        by smtp.gmail.com with ESMTPSA id p88sm15104825pfi.174.2017.09.11.11.09.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Sep 2017 11:09:56 -0700 (PDT)
Subject: Re: [PATCH 2/8] target/arm: Use generic vector infrastructure for
 aa64 add/sub/logic
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-3-richard.henderson@linaro.org>
 <877examon2.fsf@linaro.org> <05363152-8a66-af3f-7c66-9627cbdc290b@linaro.org>
 <8760cpbnul.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7ea7bc2-29f0-e941-838e-b915f1cc1a5a@linaro.org>
Date: Mon, 11 Sep 2017 11:09:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <8760cpbnul.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Z0mIYvbrsdB/

On 09/11/2017 02:12 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 09/07/2017 09:58 AM, Alex Bennée wrote:
>>>> +    switch (size + 4 * is_u) {
>>>
>>> Hmm I find this switch a little too magical. I mean I can see that the
>>> encoding abuses size for the final opcode when I look at the manual but
>>> it reads badly.
>>>
>>>> +    case 0: /* AND */
>>>> +        gvec_op = tcg_gen_gvec_and8;
>>>> +        goto do_gvec;
>>>> +    case 1: /* BIC */
>>>> +        gvec_op = tcg_gen_gvec_andc8;
>>>> +        goto do_gvec;
>>>> +    case 2: /* ORR */
>>>> +        gvec_op = tcg_gen_gvec_or8;
>>>> +        goto do_gvec;
>>>> +    case 3: /* ORN */
>>>> +        gvec_op = tcg_gen_gvec_orc8;
>>>> +        goto do_gvec;
>>>> +    case 4: /* EOR */
>>>> +        gvec_op = tcg_gen_gvec_xor8;
>>>> +        goto do_gvec;
>>>> +    do_gvec:
>>>> +        gvec_op(vec_full_reg_offset(s, rd),
>>>> +                vec_full_reg_offset(s, rn),
>>>> +                vec_full_reg_offset(s, rm),
>>>> +                is_q ? 16 : 8, vec_full_reg_size(s));
>>>> +        return;
>>>
>>> No default case (although I guess we just fall through). What's wrong
>>> with just having a !is_u test with gvec_op = tbl[size] and skipping all
>>> the goto stuff?
>>
>> Because that would still leave EOR out in the woods.
>> I do think this is the cleanest way to filter out these 5 operations.
> 
> Is this going to look better if the other operations in this branch of
> the decode are converted as well?

It might do.  I'll have to think about those some more.

Indeed, perhaps that's exactly what I ought to do.  Those are complex logical
operations which certainly will not get their own opcodes, but are "simple" in
that they can be implemented in terms of vector xor+and, so there's no reason
we couldn't expand those inline for all vector supporting hosts.


r~
