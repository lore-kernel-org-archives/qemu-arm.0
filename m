Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1355993wrt;
        Thu, 13 Dec 2018 14:25:28 -0800 (PST)
X-Received: by 2002:a9d:172e:: with SMTP id i46mr443299ota.322.1544739928001;
        Thu, 13 Dec 2018 14:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544739927; cv=none;
        d=google.com; s=arc-20160816;
        b=BSUb+/aw6XTmFhr6PSmQs3JLxBuGOzy5wSKau4ber4W005v13XwSnEHihVvEVRKvXQ
         4PxIvw3nGmZh2/4WN1eVDuTPqL+bltGAQsh+0BjXAfD5fPuj7A0PDNIs2GFEYilbzNyq
         N057MpleK636aKUbY1vmPiYrg76ambxwCdgBivQEki1FQccPRWV0BZiSY2biscUCcAhE
         /zX6tI23l7nIn+rezWlM/qLfwnNcFu0/WKzbFxPNichRPKfviEouSuPxH6ZmqCwI6kH5
         2nmOxEDX+FXBltzmvvhndVYaivMoyXDyYRf9imgKQ7l34g+r07hfEIhrBad0closDa3W
         lXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=tTNwmPiA4zbXuQesyKs8ZWibJMbLaaCDVzQ0zvIJhXw=;
        b=qKD1f9dS7wxKgh1pUi0sryHmxM9VKmXB6lfFloSvS7Bah9nqIwXJvQnaFyP07oBj6l
         ijLKULV4bheBvscl9f1XJPQmR+DS/7LkWglqwWLQkn1+jT3+y+7N3h7+v+QHUf0n+VWU
         ihUXm11uqaSIwL7ttjeDS28g6FBR7GGfbhC9b/CAufpam79n3mmwQDz77hZoREzeg1Gt
         m9XWdSgQ09YCW/iU0UtSZMknmP9u7DT1C+7DF6BGMw8w3/3OUvjQI9LwR5e39Q5VdlZm
         4dnot1jAjWjVfad+0XYotpPmQWDoOn4nVTuNj9N7QK4tPQEEb/p8EDicisE/1jw4f5TW
         AF5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K0wSRcyW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s1sor1967437otk.168.2018.12.13.14.25.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Dec 2018 14:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K0wSRcyW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tTNwmPiA4zbXuQesyKs8ZWibJMbLaaCDVzQ0zvIJhXw=;
        b=K0wSRcyWjOSY6+PGNYPqmmH6Z7Idn1y6ykY6epmUHN+Vo2OXxUil0m+63dTqcmTE+O
         gWySQVNQR/Xw1MZrrRDDoOYNzVw5ILMvvrw9Q2Dd1JfDL3yCWdslwSKPGoDZgMy+YQ56
         COpHfpNXnphan9LAF3cIewU2zta+Icx2dCG9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tTNwmPiA4zbXuQesyKs8ZWibJMbLaaCDVzQ0zvIJhXw=;
        b=KKUijOuZ1vMYMgU1eC5u5ftBq35VP/EKx0DFhEfA0OcB4RkPhPDFtFivPjiwpOerXH
         L+e9U82BBw2j7/oBnjwkcyVcO3leJE18ovkWDObnq3iX3GIs1LAQowWk22aaw/1Ruijh
         j/hC5jAIaGE1k53HusVusUTscFaQZiwzOkbybu8gv23HcmCaJ/BNwNFTBUMlsErFUcLd
         rnXxDmdwRVTKlQI3Vp+iC8OidgEtW9LUBN1/ANBLVT8QQA9iRV5h4yDRMLSlg0Ylt+jU
         gZjuWVq6QKGDqhfHSIvi+jBbDryy94YwSCeZN8l8jjMOjwo5o3JhX7wDFCGodzfUz73u
         SN/w==
X-Gm-Message-State: AA+aEWZ6RIy4wfCSyLxpMVkBBP7C8PkLsS634jzihJcWyXcIGXyUmSGR
	AmggYIou14HZ35+NA89ySIQUNkMN
X-Google-Smtp-Source: AFSGD/VmrzaMQFC05waNY2tmoex4qFFDBOfquujSTjpDu2+VSk0kHtZRh6rq5CoHzKg2UoAkq+hr+A==
X-Received: by 2002:a9d:a83:: with SMTP id 3mr494390otq.88.1544739927608;
        Thu, 13 Dec 2018 14:25:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([187.217.227.243])
        by smtp.gmail.com with ESMTPSA id h25sm1509355otj.27.2018.12.13.14.25.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 14:25:26 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target/arm: kvm64 make guest debug
 AA32 break point aware
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, omair.javaid@linaro.org
References: <20181213115503.24188-1-alex.bennee@linaro.org>
 <20181213115503.24188-2-alex.bennee@linaro.org>
 <CAKv+Gu_C78f-a1MdsdXHi6u_gyhRh3djbzM3_vZ3K=AtWzqXGg@mail.gmail.com>
 <87mup91nox.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a78b697f-4bb8-f54e-28a9-34ecf6a40f29@linaro.org>
Date: Thu, 13 Dec 2018 16:25:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <87mup91nox.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bFJHxS34N2ef

On 12/13/18 8:55 AM, Alex Bennée wrote:
> 
> Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:
> 
>> Hi Alex,
>>
>> Thanks again for looking into this.
>>
>> On Thu, 13 Dec 2018 at 12:55, Alex Bennée <alex.bennee@linaro.org> wrote:
> <snip>
>>
>>>
>>>  int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>>>  {
>>> +    CPUARMState *env = &ARM_CPU(cs)->env;
>>> +    int el = arm_current_el(env);
>>> +    bool is_aa64 = arm_el_is_aa64(env, el);
>>> +    const uint32_t *bpi = is_aa64 ? &brk_insn : &bkpt_insn;
>>> +
>>>      if (have_guest_debug) {
>>>          if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
>>> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
>>> +            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)bpi, 4, 1)) {
>>
>> Should we be dealing with endianness here?
>>
> <snip>
> 
> I don't think so - everything eventually ends up (ld|st)n_p which deals
> with the endianness details.

I think Ard is right.  You need to consider dynamic endianness with

    bswap_code(arm_sctlr_b(env))


r~
r~
