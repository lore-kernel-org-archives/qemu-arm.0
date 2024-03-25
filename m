Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp755605ejj;
        Mon, 25 Mar 2024 08:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjtpn5MtHUlyAqq2RIV8eI47RxvnyTvdgBNXmL3CkabFNcllXF7VgckCmyeFRZGlrlMZyJH7k/Zh83GffQxMIEnl5up3gi
X-Google-Smtp-Source: AGHT+IEWOTWyXDeSv5aN2XArkmAixV/r9n6GQd0Qch2OCY3ZO9aEGP8Op40rE/4cRc4GUiq6Wlzu
X-Received: by 2002:ad4:5d6f:0:b0:696:73f2:88c3 with SMTP id fn15-20020ad45d6f000000b0069673f288c3mr10848699qvb.43.1711378884026;
        Mon, 25 Mar 2024 08:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711378884; cv=none;
        d=google.com; s=arc-20160816;
        b=gtzgUK/MTUgQj9wmdyQmy0VNpNp9ra+BGeQyp+xQEsqRDjNHIK98wFwaFugptT8Ccn
         VuoTbyLfduzkeCR1qxEoZypFsRu4qwIOtWnBH724yIIOZMvFcXX+uqFgbQ1R43M/gtSF
         So4kknB7gvMgDgMflYdl4a4KIPIVVaeXLeEoJW5utQF0+gmglwbiLn7P2iyPQyqUinJo
         hLbhEdSzXRLFS4BtMBsWqD8Gcvm3wF+1ybyx8bRiAzgQ6Up24McqHbZOlvJ+regL+Svw
         DEFbP26WFmn0skga8V8MS4WE0IfTgVKcEg/peltFFlgwQ0JsznYVOXGBj1fXHpLQ3kx2
         stOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Uns4qRLM+EtfDyudRgUkK0bRRrqHa1Jc/kPFwBrqj4=;
        fh=VYuVJd+y/flxCRDIthUCbVn/6Tkn5nmhIrYMs/S6BBU=;
        b=N3CR7HQpwmH+VV/dGEbWCQO3TbizP2L4C0qDBTRYd2unKJxsmP9Z1Qy6y19JAC0pYA
         NzVXTWkHrat3fJjcD/F0+ohyeY1FmB1X3lTqe4k+dyWOPtox+kLKlnZz8AQ8ZKfCCUUI
         VBiv2xD3rY7Hiy68U3wo0z7ODvfj55ddOGC1MugqOhpTli4sSDvB4WnIPB0VAz6gfR1H
         YgH+m66YjyGnSCbYI7CXMBAD7figdwKu0A5obVZlJCsOJr9mx7HfIvrJE3X4PEzLnvBE
         V6bkx0clB6YgqO52Xpruyh9yEjxSwgiIt0+2s3qEFHGokyKM9Pn3jY1/CJodFDgncPyO
         N99Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qhyOoNfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15-20020a05621419ef00b0069687e15086si3205015qvc.380.2024.03.25.08.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 08:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qhyOoNfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rolp0-0002VY-KR; Mon, 25 Mar 2024 11:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1roloz-0002Sc-2S
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:01:09 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rolou-0004t1-Jh
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:01:08 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d49f7e5c2cso60141651fa.2
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711378863; x=1711983663; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Uns4qRLM+EtfDyudRgUkK0bRRrqHa1Jc/kPFwBrqj4=;
 b=qhyOoNfn0GcvtORehpVy9DAMqRYl1Aax2lvHvzLkX54GJtnr1ucNzGpodRR4AYrH+o
 4+NpoxH5zCmRSWAQXgei49NzIOh1FX68fIM2pRbzjuv31RT6xJ3R7eki/RWi/XkFj9qq
 QQQPvztw+0hNBdaqulDaKEqcuC7TajfqloX3qktrOK+/IlRGcRhF6saBqzoxe9wnBhLr
 iERnYA+TcOZMb5VpVfo6EyPYZAwpDBL0kVRIe1wW1FAQ05uOnZ74Q5RqG1aqFoApfqXR
 AA+M2r7GGBByhbY25g/VLmCII+YAAZccrmIrWNwOFWJdO0+Ji+Y8IFkIwRDOQ/LAeYsX
 3tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711378863; x=1711983663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Uns4qRLM+EtfDyudRgUkK0bRRrqHa1Jc/kPFwBrqj4=;
 b=S16rxEitaMS9hPsMJ8bxbTqyWjWTFPlgSvvWAnR00jzdlJJrESsiLr/0ceLyvr/EQX
 a8yMJ2uVPm+xDeIBBgvpbG/P4akq7ekMklxl3f6012P0dhqvGd2Xx0XKLWwgiGSUUKFI
 +0K7H7QtCj//8Zj9LeI819LtAWCNo10/HMiJxs5Nj8jbjcdk/PFrYzsFUmc4ctFu2fc+
 G0NjjLqDUAFJDyLo9fVl0fqqC7g2+fUbwi0WJs/gHrapV3kJ/Lq4pFo18U7PXtqWvyQ3
 5rJvMYHScvIekREoqCGBTi5c8LG4kt8vkpISA7m5YQ+fyYNL2po/Q/In6eYMbkwQZnmH
 TLRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU74jkStTp1z2tN+f91GYgki61FiZBIaPoyp54JOfD0w3VjALt5E/2a2t1gHJrYfa7X6mAqvjmeiSNcMnHE069zLQof
X-Gm-Message-State: AOJu0Yy1zPV80RQ6w1WP+ike1aHGgH8WT1mVT0t6PkQ8jOqzUroD1XwR
 s1o4bj7wn+aBCV7cJCWin+KELomjZW/QshXiexGvP5Vjpkmt0TxYuSRmhnQrZkM=
X-Received: by 2002:a2e:98c2:0:b0:2d6:9481:b38 with SMTP id
 s2-20020a2e98c2000000b002d694810b38mr5000140ljj.20.1711378862716; 
 Mon, 25 Mar 2024 08:01:02 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b00414112a6159sm8603607wmo.44.2024.03.25.08.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:01:02 -0700 (PDT)
Message-ID: <c951c51c-3811-4997-b27d-deb8515b1539@linaro.org>
Date: Mon, 25 Mar 2024 16:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0? v2 2/8] hw/clock: Pass optional &bool argument to
 clock_set()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?In=C3=A8s_Varhol?=
 <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20240325133259.57235-1-philmd@linaro.org>
 <20240325133259.57235-3-philmd@linaro.org>
 <CAFEAcA9aM8J+0RjYnvr8Xr8Q2j3w_TgxHO-gPDn8MaAcAUDynw@mail.gmail.com>
 <e3806179-47ed-4952-a7b6-c256a2aad197@linaro.org>
 <CAFEAcA_yyWKo7E1Vz2zQXnjetYWEXtt6mUyg+t4mJXt+nsKBgA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_yyWKo7E1Vz2zQXnjetYWEXtt6mUyg+t4mJXt+nsKBgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yREh1EmoCesZ

On 25/3/24 15:44, Peter Maydell wrote:
> On Mon, 25 Mar 2024 at 14:39, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 25/3/24 14:47, Peter Maydell wrote:
>>> On Mon, 25 Mar 2024 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> Currently clock_set() returns whether the clock has
>>>> been changed or not. In order to combine this information
>>>> with other clock calls, pass an optional boolean and do
>>>> not return anything.  The single caller ignores the return
>>>> value, have it use NULL.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    include/hw/clock.h       | 22 ++++++++++++++++------
>>>>    hw/core/clock.c          |  8 +++++---
>>>>    hw/misc/bcm2835_cprman.c |  2 +-
>>>>    hw/misc/zynq_slcr.c      |  4 ++--
>>>>    4 files changed, 24 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/include/hw/clock.h b/include/hw/clock.h
>>>> index bb12117f67..474bbc07fe 100644
>>>> --- a/include/hw/clock.h
>>>> +++ b/include/hw/clock.h
>>>> @@ -180,21 +180,28 @@ static inline bool clock_has_source(const Clock *clk)
>>>>     * clock_set:
>>>>     * @clk: the clock to initialize.
>>>>     * @value: the clock's value, 0 means unclocked
>>>> + * @changed: set to true if the clock is changed, ignored if set to NULL.
>>>>     *
>>>>     * Set the local cached period value of @clk to @value.
>>>> - *
>>>> - * @return: true if the clock is changed.
>>>>     */
>>>> -bool clock_set(Clock *clk, uint64_t value);
>>>> +void clock_set(Clock *clk, uint64_t period, bool *changed);
>>>
>>> What's wrong with using the return value? Generally
>>> returning a value via passing in a pointer is much
>>> clunkier in C than using the return value, so we only
>>> do it if we have to (e.g. the return value is already
>>> being used for something else, or we need to return
>>> more than one thing at once).
>>
>> Then I'd rather remove (by inlining) the clock_update*() methods,
>> to have explicit calls to clock_propagate(), after multiple
>> clock_set*() calls.
> 
> You mean, so that we handle "set the clock period" and
> "set the mul/div" the same way, by just setting them and making
> it always the caller's responsibility to call clock_propagate() ?

Yes, for consistency, to have the clock_set* family behaving
the same way.

> Would you keep the bool return for clock_set and clock_set_mul_div
> to tell the caller whether a clock_propagate() call is needed ?

Yes (sorry for not being clearer). The API change would be
less invasive, possibly acceptable during the freeze.

> 
> thanks
> -- PMM

