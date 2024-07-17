Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp814359njk;
        Wed, 17 Jul 2024 06:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfeJNl7MbSCQymVtKAcAILrQASKLP9BlKnCoz1CVqeofgpNPjxB/mB+VvjMqRcwpzXEdDdmREd98DROQ/BX9nLpq8yQ3lf
X-Received: by 2002:adf:e3c4:0:b0:360:79d9:e475 with SMTP id ffacd0b85a97d-36831605896mr1358513f8f.17.1721223251208;
        Wed, 17 Jul 2024 06:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721223251; cv=none;
        d=google.com; s=arc-20160816;
        b=l7T9r71rBhC4OEZcXzi4iNiATOt4cHmHTHX7t9CAxotNNHWpdAb7xmtOsOuBUUovll
         KPd32FFCKHYR9zDZqZlFvZV1dSetpbvGaQsDjL8gsnZGymSJm0YeA+V1c23BNS1XibhO
         6XpwXitBLW6KXQ18fa702pQ8A2iFLLBBenUM7a2CrEVPtA4dwyVa/WDKIMBQgq71YSCc
         12cqqd950EoMbmScn3UvgCsUmoWW9FWOqiamDSnElabdA3n6KiTHNnMpbSDc6NyoYZJ6
         Eppj6NH1WFmZg9D9efQEjWzBuU1JZaInLeEWK1elIclEIy2YcgaZOYlrl1HMBwOSOWc9
         YL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AD2SS6ooVpxSZUiP4hpAIz0CKU1+jlNQrxb8VVVDooM=;
        fh=lCC1BRwcYH92BqfGENmPwlSYbDB6tYIqZ4UMDt99vvg=;
        b=f9TPlhntpg7xK7yNInZyf/fHLTglYA3GsSu81oh2XVTMe+RpJf/zykNwgitPjhXlVB
         uu02HEP1dBpX79n2HMFnbvqcEEOtz80chx8U5VUuWr8yxYYuxr17Ctdyp6VkzB9mrnrF
         IR21BMGVcE7VLy59BoqPvMuSo7Zz3y68HXI6i2OjNxMbRal0sznXwvNX1K0Z2SWWx/EC
         e37cFnuT0H+KDfXI8ughrKfV06GX5WK0ScJL5kIBwT6eaIPpNmz+5DUSiWIDVr/JyztM
         8+barl1kO8s2q1BPZlJF1HSJVlMOI9qvXGD2L7wKga42BBxkUuynbGU9gLxJd4h1Pcjf
         t/SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAQsuDRP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427a63bb9d8sor24386115e9.10.2024.07.17.06.34.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jul 2024 06:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAQsuDRP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721223251; x=1721828051; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AD2SS6ooVpxSZUiP4hpAIz0CKU1+jlNQrxb8VVVDooM=;
        b=IAQsuDRPU73CgC3ysXmBw8HzIyFp4mW9SuvguLVxvrKM+wsviNZ9luuCe54udAqm28
         WAK+FTPK+u7fF8wy+dwOof9l6PoCSH3Iiqi80GcAXNKrYiITUNP65dp5Wc7oqC5OQIkm
         +K1/Ym0CAu4xQKVAnuXlVxqBmqDRkZyCFzktvuWKsRp8rPCo8ZJNeg9b6VpsjHkipKcX
         1PG/sid/3yfunZnEHwFPcvTGVfJk32z48NcJA25FzgAw21/8dypwmV7HWJkDj4DgwXaz
         IAJ93gaHAYwW9nj82XoAbr38ll5ME7ZdHsLYtQcSpvjlKiDmYMmoxg/mPoVvVrPb+yGL
         PHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721223251; x=1721828051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AD2SS6ooVpxSZUiP4hpAIz0CKU1+jlNQrxb8VVVDooM=;
        b=wHAw2+BbSJCoroNlgmYDgEd5emsEJnSEjdTVrXPQKHzz/jV06Jpffr0WpBLjQZs4o5
         Dm3udz9g/DJFy1nTe7GbLGJlPTzXxiJ/j2lvmvgfQASsBn/TscT8E2WTtt5C6AMw5AIY
         yORheCxo/eCAdqNP9yhM+S9vv92hy9NLnYaXl2Xb+NDwJvKa58emdZolKSX31Lt9WzPN
         cYpzT2WF6izsFB/U1GOsXZNmQCVEuIJW3yUzXmugThzLcN8HnK+9AMze7UzgGXP11/cc
         KRI37uO/pa+GLA87ArTaKLglhXxHUmGUcXk039h1VCmI0crUNbLo7uhLSNNHuQfWkK5z
         TuNg==
X-Forwarded-Encrypted: i=1; AJvYcCX+rpsVzBhrOkv2HgcAni9Jslr5E4YWYcdz/fu+45/pJUJFVGugjOUfMUNCukX8E1Jl5UEVk4kQni2Epzf2cj8L8xryKltU
X-Gm-Message-State: AOJu0YzKFlAoiMgG2jmJR+UTUYNU+jSzDbIRpFutvtXre8N4ra6Zom2Z
	16P5XjLBRLMAjs5PoIQJXtjEa/k4zZoX72I47ZHhdFLrhfrNbUaSyej0iGAoEUa1IblUnHJJmuH
	/m7mMLzDQ
X-Google-Smtp-Source: AGHT+IGWqibKjsHS7epSYSdSi/RACr7tnfu9dfgokQTwN3GMW/GUWZVhbcVpeF4Vc6HIXTBsBUaKcQ==
X-Received: by 2002:a05:600c:474c:b0:426:59aa:e2fe with SMTP id 5b1f17b1804b1-427c2cc9686mr13096475e9.19.1721223250668;
        Wed, 17 Jul 2024 06:34:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.208.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a0fa55afsm200595695e9.16.2024.07.17.06.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 06:34:09 -0700 (PDT)
Message-ID: <d34473a1-5a79-472b-897f-99098edd49c4@linaro.org>
Date: Wed, 17 Jul 2024 15:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 09/10] hw/char/pl011: Add transmit FIFO to
 PL011State
To: quintela@redhat.com, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-10-philmd@linaro.org>
 <45ef60fe-dcb6-461d-97e1-d19e5174075d@linaro.org>
 <87o7fthf6x.fsf@secure.mitica>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87o7fthf6x.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wfLiYinTtWBJ

On 16/11/23 16:48, Juan Quintela wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
>> On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
>>> @@ -436,6 +438,24 @@ static const VMStateDescription vmstate_pl011_clock = {
>>>        }
>>>    };
>>>    +static bool pl011_xmit_fifo_state_needed(void *opaque)
>>> +{
>>> +    PL011State* s = opaque;
>>> +
>>> +    return !fifo8_is_empty(&s->xmit_fifo);
>>> +}
>>> +
>>> +static const VMStateDescription vmstate_pl011_xmit_fifo = {
>>> +    .name = "pl011/xmit_fifo",
>>> +    .version_id = 1,
>>> +    .minimum_version_id = 1,
>>> +    .needed = pl011_xmit_fifo_state_needed,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_FIFO8(xmit_fifo, PL011State),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>>    static int pl011_post_load(void *opaque, int version_id)
>>>    {
>>>        PL011State* s = opaque;
>>> @@ -487,7 +507,11 @@ static const VMStateDescription vmstate_pl011 = {
>>>        .subsections = (const VMStateDescription * []) {
>>>            &vmstate_pl011_clock,
>>>            NULL
>>> -    }
>>> +    },
>>> +    .subsections = (const VMStateDescription * []) {
>>> +        &vmstate_pl011_xmit_fifo,
>>> +        NULL
>>> +    },
>>>    };
>>
>> It just occurred to me that you may need a vmstate_pl011 pre_load() to
>> empty the FIFO, which will then be filled if and only if the saved
>> vmstate_pl011_xmit_fifo subsection is present.
>>
>> Juan, have I got this correct about how migration would or should handle a missing subsection?
> 
> I hav'nt looked about how the device is created. But if it is created
> with the fifo empty you don't need the pre_load().

This is indeed the case. Thank you Juan!
