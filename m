Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3269833wru;
        Fri, 5 Jul 2019 08:09:32 -0700 (PDT)
X-Received: by 2002:adf:f792:: with SMTP id q18mr4164226wrp.161.1562339372584;
        Fri, 05 Jul 2019 08:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562339372; cv=none;
        d=google.com; s=arc-20160816;
        b=LILUUqWLSethY9wdZSMv8SNiGcDMO3jIxwHM7XUiZBBUm5ez5raCZmaz6BEFtrxJ7Z
         TN1B8AQNMUOGq3EtGL2xYTZRp57CMLhTCfR8gxlDAUfvZwO/I7Axoc7M2DmspKWT4qMU
         Bf86uca0E1etZMB/nbPIxnQGV9ZNS+ty2rauA+Nck05bRDogbWjaZEAqwb9bKK3ejRB4
         WEZ1ffOafHezo0nTvC44CXesA3U0HjMKELBpU5MM+BZ6t1+jD8OJJTV1iu8R/af+gZhd
         WavnFNFzZYNnsDZE2h3GElpjcwU/1YBmY/+QFeZKjZC4Cdcq2+TA9Pt7hlVX2t54OPAa
         eNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=q1aEPuqPPejoFOCRSaaYleUZYO2DAIq52Qc9x7onAlw=;
        b=f5+J39L87azgvV5YGfXmIW5lMxHvhpa/Em/zJoTMd9kGu3MwG29GEwSOR1EOeU9iMH
         smLDOThdXq6TAPgEk2uLVpBc6H8mbcAp44Cr9TB09x5t4xq8+ZyJobePo5duZyENplnG
         gdVMwSgXLdh5CfZw1vi/cTLaMbbxZ4D6VcIWjhYDD6q2DKwIn7sVr7dwOAxAV2XEDdy9
         uQtxKcobVrO+T9sPFMbY5VsPjD3wK1Vi+qQSonbOwv2sagPTgZ5MyINbyydlMY84P7ur
         I13We0lofEfCr77xm26g2RyrJO0ccr8HACSZwmH0N5RYxwb3tLWXAfjVBKIPVYCdFWuX
         6swA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PT15IhLg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a3sor5296423wmb.7.2019.07.05.08.09.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2019 08:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PT15IhLg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q1aEPuqPPejoFOCRSaaYleUZYO2DAIq52Qc9x7onAlw=;
        b=PT15IhLg7KfIslfOI2RfmmzLc/GIGvsk05Q+0MoLPgmc3/KVr5vu10CPLdvgZqJKj3
         F5jY6AAe3k5rt5UvZSRbHBAf942MMZNXIuh6dT+IfES8K6HhXKuLTDmvZoXpTh7mtn2m
         QiszJ7kvD9aUJFEEzqkfEILTz6o/2c1QzjsOVnP6YR/fzJ5Jy/w5DiXtsV3MU8BhHTqM
         5FZ6tFeDWgiIZCgeNDhiacLK5+E34fR0ximqezzRY7tSCSZohZvi6r43omrkd2HWl68+
         fG2Jok+A2EjBgwJO4EdhKTf6XrLyyslMePYvGyA9HpQ/ZATqzs5gDDg/EH1QYrEspC1A
         5zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q1aEPuqPPejoFOCRSaaYleUZYO2DAIq52Qc9x7onAlw=;
        b=t+XSXvWqsgSGoiwaUz5QTB5bQBiV+kxW9Ou21aj1xj61MFHcWfI+EUTeQ0PhvgfeRD
         5nEOnQExF9FNTiexDh6qfCxQzKSU6zDO2m7bEybAxyb0mCmIF27U3RuoF5qjS/Wwj7AT
         2pttQzWfhq64/k+DEqRmx6178NrngfFw6gH1H+0xefV+Gx+SylokDlOoM24KkgOa4i6W
         Esbc0Nj4DGlqv3jJ19IXhWKdq92K5q59y9DiAuyt4xTL/MOJEvGEtyMIcSAdTKKEeNe0
         U80cPlGzUFV4qpt9SLZHPGxQ4V5/Tn4qiWbjwcCbIbd+6jFUwa7FBvCnIIQ428KeTCng
         72BQ==
X-Gm-Message-State: APjAAAXoWrJwYPOjPuPTD0DKpH6965Cr0l6GHd0sMWVZpI4oJs2OBG7q
	419++wXQheLTigMVxNmNQHVv/eAq0ZUptujD
X-Google-Smtp-Source: APXvYqyfcgEo8qNPzdgoW5dW17I45lvAhBzs+f9ZeziSI56Qqib4qhglypEIfJsmXakJ57RRx8gaVA==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr3938218wmi.142.1562339372193;
        Fri, 05 Jul 2019 08:09:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.21.14.234] (host218-183-static.63-88-b.business.telecomitalia.it. [88.63.183.218])
        by smtp.gmail.com with ESMTPSA id z6sm6922508wrw.2.2019.07.05.08.09.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 08:09:31 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 1/4] target/arm: handle M-profile
 semihosting at translate time
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-2-alex.bennee@linaro.org>
 <927219a5-a56d-bbbe-26ed-ffb8be12f006@linaro.org>
 <87ef36w14t.fsf@zen.linaroharston>
 <e7dcd75f-8897-1939-caf6-c879371a2f84@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <42b9274b-e389-4e2f-2ab5-e5601180f3b1@linaro.org>
Date: Fri, 5 Jul 2019 17:09:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <e7dcd75f-8897-1939-caf6-c879371a2f84@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: n3loYpUuN8eN

On 7/4/19 12:25 PM, Philippe Mathieu-Daudé wrote:
> 
> 
> On 7/4/19 12:21 PM, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 7/3/19 5:52 PM, Alex Bennée wrote:
>>>> +static inline void gen_thumb_bkpt(DisasContext *s, int imm8)
>>>> +{
>>>> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
>>>> +        semihosting_enabled() &&
>>>> +#ifndef CONFIG_USER_ONLY
>>>> +        s->current_el != 0 &&
>>>> +#endif
>>>> +        (imm8 == 0xab)) {
>>>
>>> Extra parenthesis.
>>
>> The wrapping on imm8 == 0xab? Do you want that cleaned up on the other
>> patches as well?
> 
> I understood this comment for "(s->current_el != 0) &&"
> 

No, I meant imm8 == 0xab.  And, sure, cleaning the other patches would be good.


r~
