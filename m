Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2249819ejb;
        Fri, 8 Dec 2023 03:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBgJRypm4nho/c7ffZ6eZudwWzVuEvP2M0H1yKgDGXDgA16ZUW05QnjaF3P3LUlb2hwbtu
X-Received: by 2002:a05:6808:331a:b0:3b8:b063:a1ce with SMTP id ca26-20020a056808331a00b003b8b063a1cemr4790586oib.88.1702034657293;
        Fri, 08 Dec 2023 03:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702034657; cv=none;
        d=google.com; s=arc-20160816;
        b=L3KHszetG0sNvvQyS7HKHAtrmhjfcDYpnUVCePHD7igCZIFlS49KsruitHqx8c0bSz
         6pVUEvxqMQu6M+9sC6Fb5yr2FCIO4BnK4a8EWJLgJxbxT3OayoyeHCVAAuSvp1oX1+C0
         lx7EApGVFF1+W+29VrU28GPFfyWR3IiWEaIXWuVdOATGwUl9q4VEmvEn/rNjv8LXoDqQ
         JTSAWOf/NHvwaS82C35cjN9dwKdaYaZcJFQOA1ZJ4SuBKxidbBNzsnZDRqlnOpDmmJ2p
         xp5uu1h2B81w8s4FTWjSXWRbispNaFFSuvKDS+sKyPmjcBszcjWIFrvKQ07FqNffrQir
         gkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qNVGWd8M2aCkU3dGvUkbMxYSa3kvH5ZoIFVWrcrU9X4=;
        fh=ca4p6yFRkPQsVyu5SIX/DQkWvVGZGavZxXh702tPLHI=;
        b=GO1ANPgm0pEGDjaJVshibtYN7nATW3BGtl1c2xzeJMjuE77F1IOuzw3AE3S68X5fDI
         MVaIAQGcQR/+2t9Dk6ohD/8Q7g/xPZtuRI/OJY1se9YLir0nglBczJJyFVWXXqdEBBmy
         d38wEG1TEJVBC0f3BApaUplZyihWOOVcbggU/IV7tEiymRF3iuYm32hkrnn1nYr55tyT
         nGmi93y7PB1FY3f6axiqwnxzR525Vv1g6Cz3KtUFI4rB5xijnPhXcoykesIGVPVuZtej
         rsgzVvQpcOxfoH/HMP+fVjb7eFSildRQ5oa3V80QFO1cRWuoSUbRo/90EYElBSESq5eg
         KFnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjtDRNQN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ov11-20020a05620a628b00b0077dc5361975si1980471qkn.671.2023.12.08.03.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjtDRNQN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBYxT-0000YK-Qj; Fri, 08 Dec 2023 06:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBYxR-0000XG-2h
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:23:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBYxP-0004SA-Gv
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:23:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c05ce04a8so22565835e9.0
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702034625; x=1702639425; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qNVGWd8M2aCkU3dGvUkbMxYSa3kvH5ZoIFVWrcrU9X4=;
 b=EjtDRNQNzyEgzEdUi5iAU5rTnwMDAO8ybu448lQsQNOSxZdFusp520pXmmIJj91tmN
 iyPCh2XUxMpD0Rt9QK54J4IXttds2EYXAjBrxck3nB9HvKDUk8m5Ib/wZ70UgrhohPV3
 cUnVPtKrFcRvSPz7rBOyoQkwwBr3XlQcB+9rBXr2+rvutdLzn7CoTDMAl+3vIyQ2YIDd
 GxXgbaJPcOzycDqejHhdCFWX8dnGJdU9XxunDX8Kv+yiH++q7RY+/b6xf0pTgkPG1e8A
 0nSERdRkYiGVA4ZGnvfzKMQeT43TEXcv19Bb+j0Xn/PWB93OfmQPWnJingdxQ8xdIO9t
 N9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034625; x=1702639425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNVGWd8M2aCkU3dGvUkbMxYSa3kvH5ZoIFVWrcrU9X4=;
 b=T8lpeqByw0qdeHK+zOksbQNmPnGZVDO+Ud46P4DuNsLdYLjLgy0SvYvXmxReSj88Uj
 Bsjl3Ry7kS9i181SYm1cWHo3tQEpAPQgZ2iua/5a4uO8Q7Fdl0rCSwRfrZPQAoW7XPIr
 w7XC2HatWbX3tbU6MmrakUJUxsB8fhPY25zFnUBYQxDp2zEjiAU7KM5sFy1KTM9//m3H
 GCDvRf198nQsKsbpfd101ieQRT8IgN8tzOovtW+pHo9YccCJ/N+DSaHO96Uv82mAR8FZ
 i81oWjnIowSPT+SZejjNlvAGB7cJU4xT3vCKiC9ldMk0ESP3u0XFbvY1JGJelIH3gKd0
 +z4w==
X-Gm-Message-State: AOJu0YwsWmtYD34mScDFn+SgZSKxk453g6q1Z7+cTfaMYYH0sNGplsqA
 nddJ8nCksfmXtlkgzZBhB7WwBg==
X-Received: by 2002:a05:600c:22c9:b0:40c:237a:3f73 with SMTP id
 9-20020a05600c22c900b0040c237a3f73mr1001152wmg.201.1702034624808; 
 Fri, 08 Dec 2023 03:23:44 -0800 (PST)
Received: from [192.168.69.100] ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5092000000b00333415503a7sm1817812wrt.22.2023.12.08.03.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 03:23:44 -0800 (PST)
Message-ID: <793e3c8f-497f-468e-b6b5-accc79e2bef0@linaro.org>
Date: Fri, 8 Dec 2023 12:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] target/arm: Ensure icount is enabled when
 emulating INST_RETIRED
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-3-philmd@linaro.org>
 <9508bf5e-a554-468f-ba94-4d6f1a5be7bf@linaro.org>
 <323be810-5f4e-4218-812a-7c0ebc858599@linaro.org>
 <CAFEAcA-HVf8vWLzmdStEo2NrSKQdZV612rBjiaj-gLW4vXyvpA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-HVf8vWLzmdStEo2NrSKQdZV612rBjiaj-gLW4vXyvpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DUL9BmGYskn3

Hi Peter,

On 8/12/23 11:59, Peter Maydell wrote:
> On Fri, 8 Dec 2023 at 10:36, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 7/12/23 23:12, Richard Henderson wrote:
>>> On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
>>>> pmu_init() register its event checking the pm_event::supported()
>>>> handler. For INST_RETIRED, the event is only registered and the
>>>> bit enabled in the PMU Common Event Identification register when
>>>> icount is enabled as ICOUNT_PRECISE.
>>>>
>>>> Assert the pm_event::get_count() and pm_event::ns_per_count()
>>>> handler will only be called under this icount mode.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    target/arm/helper.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>> index adb0960bba..333fd5f4bf 100644
>>>> --- a/target/arm/helper.c
>>>> +++ b/target/arm/helper.c
>>>> @@ -940,11 +940,13 @@ static bool instructions_supported(CPUARMState
>>>> *env)
>>>>    static uint64_t instructions_get_count(CPUARMState *env)
>>>>    {
>>>> +    assert(icount_enabled() == ICOUNT_PRECISE);
>>>>        return (uint64_t)icount_get_raw();
>>>>    }
>>>>    static int64_t instructions_ns_per(uint64_t icount)
>>>>    {
>>>> +    assert(icount_enabled() == ICOUNT_PRECISE);
>>>>        return icount_to_ns((int64_t)icount);
>>>>    }
>>>>    #endif
>>>
>>> I don't think an assert is required -- that's exactly what the
>>> .supported field is for. If you think this needs additional
>>> clarification, a comment is sufficient.
>>
>> Without this I'm getting this link failure with TCG disabled:
>>
>> ld: Undefined symbols:
>>     _icount_to_ns, referenced from:
>>         _instructions_ns_per in target_arm_helper.c.o
>> clang: error: linker command failed with exit code 1 (use -v to see
>> invocation)
> 
> I think we should fix this earlier by not trying to enable
> these TCG-only PMU event types in a non-TCG config.

I agree... but (as discussed yesterday on IRC), this is a bigger rework.

This icount cleanup blocks 60+ patches on top :/ Since I have a v3
addressing Richard's comments already done, I'll post it, mentioning the
PMU issue in the cover; then see if cleaning it isn't too invasive.
If I end in another rabbit hole, I'll suggest to accept this current
patch and clean the technical debt later, again.

Thanks,

Phil.
