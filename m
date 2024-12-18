Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1166238njk;
        Wed, 18 Dec 2024 11:20:30 -0800 (PST)
X-Received: by 2002:ad4:4ee8:0:b0:6d8:a148:9ac9 with SMTP id 6a1803df08f44-6dd0923c96cmr64057836d6.30.1734549630192;
        Wed, 18 Dec 2024 11:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734549630; cv=none;
        d=google.com; s=arc-20240605;
        b=YvAts3J5nt2eMf7FpIrN/ywzfEuG9ThJsO/djyxqxHO+BeeAMzd2Y9yY73gRoU0klb
         TkORj0CNNyD/P4NWx7CfX9F9YcAGiBLi3jCwGap33GNNspRJ+oKlfhMLnHqwmTyLG41b
         DLG6HqMpRt/OppHEc9dvbGKxjEdEKvfjbDodC4G+7Lpbu6L5t4M0yOi2SdMYNu+qMSN5
         B8qIbGyGtlxWkbevDJx58f3JY94gU/2Bwu6Z4QnbaN1pSugVhNmW7JqdifHq34WInxXR
         gpp/sCgZFGbUUEKYwH9E/Yl0j6WsmRVyRy1Ptm6RmCwx6aLlZR+6dzWTIjnEoyPCDqdy
         XALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nTUiuF3k2d2jxVfM6MZEHkcGik4j8tVWuN7Zhk3p8T0=;
        fh=o2x9A8WecghZj3VREkvcOHwr91ek3yecRbHEpHGp/40=;
        b=Il/5lIIDQFsQAOj79GGoSPuw030G5AoTsbaNTuYVH7/Uj2fLPlKdfb4uyyy4YUGv4f
         1R0gmEFPI//dhGba763sqUsec7wnPBSytZkLq/0qkB/SlNY4YZRzyMSoMgHHiEexaFmP
         /LmDQ5lLkpkrZ8aR4Qx6suKLT89qRhoTMN2MzO9bZVWzc+B0spVMg8Uk+irL4dRyZVlY
         DBXiHZAJpDGCv0X8PYI1toanSzxTSAwb3e2Oq/KiN86VCwvHQYUcDEdQxNsgVRqNLWBI
         bHZFs8AgQyYl9mywI5Gb9BvpZ0AB3zxUFOXuq9xuscCCmdORTbORc43DfNLMMPvIBE41
         mY2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Crjw114h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-6dccd30e544sor85012416d6.6.2024.12.18.11.20.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2024 11:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Crjw114h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734549630; x=1735154430; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTUiuF3k2d2jxVfM6MZEHkcGik4j8tVWuN7Zhk3p8T0=;
        b=Crjw114hb9iOVPTTQp4fP0q5UrUtTFjJCTNzyVXuvM6/nQTh3mRaZkdW2WsKPfDp98
         grjDMhhvHxwGlxNuYPRn+xkRbNsD1Lr4H/PDRvT/bVuLPF5QoCSgwQWfKr6Yi+MLLZ6D
         YVDjIWcSRik2Ca9hFA1o4tjUYiKh0/f5VWKFPuMsGQblspFsznwed3vQz2XAxcfFTUGm
         HlBF95mK+pVr5JJ56nRGv41UDpm/aRzsZflrlQEXBWONiQQDk9UTzN/dLV7byJo9NS53
         J5zjuimrTtsGqgwD956GqW5W6xm+ipprKUQHT94rEu2lSytm/CECmwqGFUaF9IJZsxI/
         Rs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734549630; x=1735154430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTUiuF3k2d2jxVfM6MZEHkcGik4j8tVWuN7Zhk3p8T0=;
        b=QiHmrwXRJaIlTk7BisJ/cDxZ6KqFIbLiP/x+zsGAqtzA74fXKxFlAgX6NHfkAorFKq
         zgaRVWBDlodROPOtRAbsV4vRFwbAvClZhCb+ctiMTOrrQwb0xvDa1Mm7fdYDnlLXOjxZ
         CGxTZ9iNLwus84phcZpCt4roly0D1WlZSDzozmcH1n78Bv+xTL5Jnhhe2fSBO9MpWNSA
         vAjcEYWvcFAAub3IraHGA9jqTN1lNiDebnEPD6tJWbWBKNjUYpj1C0KMB9lBM8pJ1OX9
         SOW7otV0ONibBCkdPzDz/MiIQIA2dT33HpFKeQ1rdZdCavfgSAUxBT2MuxqF6kY2dBos
         PxdQ==
X-Gm-Message-State: AOJu0YyMMY2MRgDVwdhrOoGC6TTTTJK5c6YKigZLO6haKw0dcrlNfHc7
	u5UICOUC86itvj1EHzCR0+/4Noya/tVS2kmFEtOAcmJxjIW4yNxXd2Un7t7RG74bgQ==
X-Gm-Gg: ASbGnctPLJ+rfqsaQda7/TZwOSiYX1RkYELiGalN8tOBg9nt81Oi5T6OEZQesk7f0U4
	fmHoBySaXndCpBMARVn0RjDZ2AU54rgFVgfOgSO7A1RP0y+rRZz8wXNXRbhxnPyMRM7cRJT8qsC
	NkYB/ThVud83JaxyOm84vefbCemU6NSci/vxMAJMQBMDREvSuiUwnJ4zOVsxPReYjaTvcCF0tbd
	f+iWHuIwXeMSkk9xN+2YbSYkD7UygQ5b9yY8wvVlvGmv+F4n9hgx9eHK+1ThElfw2QmPy6wiw==
X-Google-Smtp-Source: AGHT+IFA02C79hInfKdrhXEk7KDC+KY+dUmLdo3XjPpyExppEQldcQ7ppDmxT5TO0bQQ2xEIY/VBYw==
X-Received: by 2002:a05:6214:1308:b0:6d8:9124:878d with SMTP id 6a1803df08f44-6dd0918de68mr81083506d6.2.1734549629705;
        Wed, 18 Dec 2024 11:20:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.0.130] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd363121sm53399886d6.89.2024.12.18.11.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 11:20:29 -0800 (PST)
Message-ID: <f2bdc8f2-5735-400c-b15f-06289b467826@linaro.org>
Date: Wed, 18 Dec 2024 13:20:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
 <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
 <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
 <19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
 <87pllq69l6.fsf@draig.linaro.org>
 <CAFEAcA_xe5QEPsrByM8ems_rxt-KsVRAgkKhGk24X-1J0vcCDA@mail.gmail.com>
 <75ff92e0-7384-4af4-bc9f-64a6b0febc9f@linaro.org>
 <CAFEAcA8YNcft8KU8mytHv+H71L7L8d=QBgQmSAmq9J7Ny23=tA@mail.gmail.com>
 <48dd3afc-d78d-4bd9-9392-873d5a8ac26a@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <48dd3afc-d78d-4bd9-9392-873d5a8ac26a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +ET/zT5sf8d7

On 12/18/24 13:08, Pierrick Bouvier wrote:
> On 12/18/24 05:51, Peter Maydell wrote:
>> On Tue, 17 Dec 2024 at 21:08, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> On 12/17/24 02:38, Peter Maydell wrote:
>>>> On Tue, 17 Dec 2024 at 07:40, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>>
>>>>> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>>>>>> I think this is still a change worth to do, because people can get a
>>>>>> 100% speedup with this simple change, and it's a better default than
>>>>>> the previous value.
>>>>>> In more, in case of this migration scenario, QEMU will immediately
>>>>>> abort upon accessing memory through a pointer.
>>>>>>
>>>>>> I'm not sure about what would be the best way to make this change as
>>>>>> smooth as possible for QEMU users.
>>>>>
>>>>> Surely we can only honour and apply the new default to -cpu max?
>>>>
>>>
>>> With all my respect, I think the current default is wrong, and it would
>>> be sad to keep it when people don't precise cpu max, or for other cpus
>>> enabling pointer authentication.
>>>
>>> In all our conversations, there seems to be a focus on choosing the
>>> "fastest" emulation solution that satisfies the guest (behaviour wise).
>>> And, for a reason I ignore, pointer authentication escaped this rule.
>>
>> I think the reason is just that we didn't understand how much
>> of a performance hit the architected algorithm for pointer auth
>> is in emulation. So we took our default approach of "implement
>> what the architecture says". Then later when we realised how
>> bad the effect was we added in a faster impdef authentication
>> algorithm, but we put it in as not-the-default because of our
>> usual bias towards "don't change existing behaviour".
>>
> 
> I understand the reason behind the current choice.
> For my personal knowledge, is there a QEMU policy for "breaking changes"?
> 
>>> I understand the concern regarding retro compatibility, but it would be
>>> better to ask politely (with an error message) to people to restart
>>> their virtual machines when they try to migrate, instead of being stuck
>>> with a slow default forever.
>>> In more, we are talking of a tcg scenario, for which I'm not sure people
>>> use migration feature (save/restore) heavily, but I may be wrong on this.
>>>
>>> Between the risk of breaking migration (with a polite error message),
>>> and having a default that is 100% faster, I think it would be better to
>>> favor the second one. If it would be a 5% speedup, I would not argue,
>>> but slowing down execution with a factor of 2 is really a lot.
>>
>> The point here about "breaking migration" is that we have a strong
>> set of rules:
>>   * if you say "-machine virt-8.2" you get "exactly the behaviour
>>     that the 'virt' machine type had in QEMU 8.2, and it is
>>     migration compatible
>>   * we can make changes that are not migration compatible only if we
>>     ensure that they are not applied to older versioned machine types
>>     (or if they're to devices that are only used in machines which
>>     do not have versioned machine types at all)
>>   * TCG '-cpu max' is a special case: it is not a fixed thing, and so
>>     it may acquire new non-migration-compatible changes between versions
>>     (and so if you care about VM migration compat you don't use it);
>>     but this is not true of the named CPU types that match real
>>     hardware implementations
>>
>> This patch as it stands will not preserve the migration
>> guarantees that we make. So we need to fix it by either:
>>   * only making the default change on -cpu max
>>   * making the default change be bound to versioned types
>>
> 
> I'm not sure to follow you on this second approach. The cpu is not versioned, and if 
> someone use -machine virt (non versioned), is there a guarantee it should stay possible to 
> migrate?
> 
> In other words, can we break the migration with "-machine virt -cpu model"?

Yes, because "virt" is an alias for "virt-<current>".
Folks who rely on migration compatibility must use "virt-9.2" etc.

Thus having a global property set by version 9.2 compat which says "use qarma5 as default 
pac" will work.  It's a little backward having the version on the board, not the cpu, but 
we've done it before, as Peter mentioned re cpu clock time base.


r~
