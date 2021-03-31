Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp911497lfg;
        Wed, 31 Mar 2021 16:31:17 -0700 (PDT)
X-Received: by 2002:a17:90a:8083:: with SMTP id c3mr5576663pjn.134.1617233477712;
        Wed, 31 Mar 2021 16:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617233477; cv=none;
        d=google.com; s=arc-20160816;
        b=PyHW2NgXzcLJU79eBAq/kwgGBUR0sswe+rw3iQ3hRBAihTcHNQRxm14n+d8HADDXMC
         ZeBkHo/jU9ZAfF4KOUQUStlVtkO61jMUOs5byjOamrDKBgMtSOfNAkOyndoai+iHkWAB
         rQBlDr9Bj28EiUcdATPTzek8lgdLqL0X4Yr7+DzxoHKNMXHjT/DRbg3Gz3tvKSVxpDY8
         sXMnib1Dxha8F8+p5ZOIY51KxIgicKS59ea6Ny2faunj3Op9QYAuhRBsQT0TNAGiwqOf
         J7MwCLYkI8E25WE0HONL/mi5X74TW3L5s8M9XC9PIXxzoQ2c1zd81Zz3YerX635RNJ83
         M8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=fMUpHOmngwEAfZTi8DwkePtRcr7LlAPVoQFzyF5UeQs=;
        b=kZQABkwyA5mAfp6SbgMNJZe6aIrie/sBWp0jDSAU7OWqc0lQTe1SQwCq0Jlmt2gOSi
         IMYo/N+Q4ZkgslSLHXBqi32jZy0XgYaG4ff35JxEAkcPzpQRDHl7KdgdVSI3mD4/tBlf
         b5ybPNIlrlfK5/i7ikbobuDKyC0odW6cnMtV34Em7PiazYeIu9x7FGnIUK1AxfcSh57v
         Q95ixC8EXNavKgFK+vr1hXIfQDmZhpKLqbeIlp7BJ54IPo91OLsGdE/Wt3eYXJ36If/0
         hpXQRoWC/lcWg05inIEB3oC8PjsAaLLOYTPYmQSqDO2akv9wCVx8RG4hsan7YfDAdX8k
         YsHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKbShca1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i14sor1481374pgl.53.2021.03.31.16.31.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Mar 2021 16:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKbShca1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fMUpHOmngwEAfZTi8DwkePtRcr7LlAPVoQFzyF5UeQs=;
        b=zKbShca1mOBUce4XxMY7lKIA/bX+PX7Z3bAhpFmE9EZo4iOTJJ7W3ahlulTUlRQe+O
         e7X+Ji/W1eDRmoQbxk1cfwFajsENYjXOHfzEVDnbYQfPflUfeMveRINI3OVDvZNPxp2A
         6kzm56aDbnUamBcv9reKZ4/mHqW+X4iNP8GG2pyOOCev47vo9XPE6cqFhQfmSj1UkeXF
         /wu4fpLPCcJAo5ayNQXCrSnDkL2T9sp0O7fkkzgCQEUXiH5gNJ6qYdoVOP7PuMG6UQIn
         J5uRW+udNae2m5xdCuE8shBMdWfE0qAVsQvjzh3+r+ni/Sn1UE4/0DNHvAFKG4hwYdr7
         pZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fMUpHOmngwEAfZTi8DwkePtRcr7LlAPVoQFzyF5UeQs=;
        b=Oc3VlAMV+vbauOhPxJsot0CvSukHan90YpHmawP/7ob/lW7gxbQcdYe+Vhwr/miK4M
         0mLCIe0S3bp9WRV/0wtl/qjH7GZWYtQgE9JcqHc6dGPhKy5kPiBHUh59CLklM/OEexuE
         sy4qh+r3C4ukQODmLDAgX06QDrixu4RYsBcE/xq2fzpmUlieZeBCKDEI41vpk/NWov+6
         nDefw0c0qfXNp0iDDz2gwPA3XMsnI1rKn/77gFmLPjSVLfn0fIJWuJf6haBS3nmcC//9
         81kPO4Lq67gYLRCkJh0m2stnQ8j+7l0oorZnyZB9TDeK2r0AQ4RbHaw0aUcYgh2B1DNn
         Fczg==
X-Gm-Message-State: AOAM533BgJfdQ9y+nlpOP5S8n+wfFistF6khJ8yRZsYU3x8ZabGnphqb
	Zh2zO+eOl+vJ2HYwoRPsOFhtOCoD
X-Google-Smtp-Source: ABdhPJzqd0vDNtQyR/gy6GV6Rhs6VpO56Z1tlRuV1P5gYqIb9/0Kgm5Yqx0XGdjLSexI4avmrOAgmg==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr5149140pgh.192.1617233477207;
        Wed, 31 Mar 2021 16:31:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.174] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id gf20sm3221673pjb.39.2021.03.31.16.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 16:31:16 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] hw/intc: GICv3 ITS register definitions added
To: shashi.mallela@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-3-shashi.mallela@linaro.org>
 <87mtur10mu.fsf@linaro.org>
 <35e6e1b000a4aae059b95ff24e83e66995e2917b.camel@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ad7829c-4098-74e3-c8fe-f4722faa19a7@linaro.org>
Date: Wed, 31 Mar 2021 16:31:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35e6e1b000a4aae059b95ff24e83e66995e2917b.camel@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: MuUXfpQEg3mA

On 3/31/21 9:48 AM, shashi.mallela@linaro.org wrote:
>>> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
>>> +            s->cbaser = value;
>>> +            if (!extract_cmdq_params(s)) {
>>> +                qemu_log_mask(LOG_GUEST_ERROR,
>>> +                       "%s: error extracting GITS_CBASER
>>> parameters "
>>> +                       TARGET_FMT_plx "\n", __func__, offset);
>>
>> So are these all LOG_UNIMP or are they a programming failure on our
>> part?
> they are not LOG_UNIMP but error indications during processing which
> could be due to invalid parameters passed from the driver

Then we should re-word the message so that it does not read as if it is a qemu 
problem, but a guest problem.

It is difficult to do this with the code structure you've written, but you 
could use an Error** parameter (include/qabi/error.h) to extract_cmdq_params so 
that you can diagnose exactly what is wrong.


r~
