Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp772140ejj;
        Mon, 25 Mar 2024 08:24:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWet493tbrQTpFkk2nZ0qsTi2FWbwTrPlqc0b3E85LlmqpnbJKW3FgEmGQf1xUI5EZvGlRnsM7skxJN9VeZ5VK5YtEnwRAf
X-Google-Smtp-Source: AGHT+IG5tRNJkGuywB1PjXtsqaPcI49OywSsn9faFGIxywB3fW4OdY1Lzpz1ndpT5/+qAbIT36rG
X-Received: by 2002:ac8:570f:0:b0:430:a087:ab1e with SMTP id 15-20020ac8570f000000b00430a087ab1emr8319873qtw.3.1711380244091;
        Mon, 25 Mar 2024 08:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711380244; cv=none;
        d=google.com; s=arc-20160816;
        b=KS0gXmsx+ma7vA8Pli6aMoYEBR799FXPQF2daS2RKoDIn292r3FM/fB1c+elkhaIJ2
         HLtBZpuHOJVwpNVfPmtMjW5gUJqUwpl5QkmsVLnaHmaxDPMwefB47ZBofalsW6sCWT1v
         x0yq2sjaYniOqaPDxxloIwJ0Ec2SnU9dwXPFNGA1DqiF08gzhq2Jto0eAqsvAQ/Fpg2Z
         BnTN2jVHnSNrfQMBnfsZrXOZ+VGVvHiVNRWcRsB/mNIBGjm0vJI0wWonxaZePSm7ceCP
         VicycCVlpXfnyLVNAXNwi1kvca0lfculshMG1cAFvCb/+5vTVzvV1AynU96js8OF5nKi
         npYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BoLRW9dkVxJWAYtYaL+GL9zQqo0bASk28B+CAIjaBTk=;
        fh=G9oRF8ottPddlw0wiaVIU5Sf6DWNshX540+p6fhH5rM=;
        b=wPeoPY6CoSgSVCjkhdcjEboHXoczVNSZ1Vk3lGzmMobLtx8VsE4BZLQr3WyZns9Sji
         g0J5ulJmXJKZeXKi6aLjUwa3T/zzvr9NCzYA86vVcDl2f2N8IoR69yQnTlRA+nc7vZLA
         mkD9Mj/V2eTjolVi9XmFChBiGnsvTaIGTIbNJ57dmtVLs8QAQCTQYLuS0g0QHeaYVn7G
         USagaOJGoKr64BsskcnX9SSh8+EUDKb0cLZexSGLqCiZtjZpqDS+10Kk+Y9mh5NV+5z/
         2ZotfGLGX3IkKKKenvRrEG5DTV1qH039eHKpL6l19NzyYsDcIu5lI31/BtCFkWGX/TNf
         lLFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njq92TZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05622a199600b0043162088668si915714qtc.431.2024.03.25.08.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 08:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njq92TZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1romAt-0001jN-11; Mon, 25 Mar 2024 11:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romAp-0001j7-N0
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:23:44 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romAn-000894-Jx
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:23:43 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4148c7afd25so954725e9.1
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711380219; x=1711985019; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BoLRW9dkVxJWAYtYaL+GL9zQqo0bASk28B+CAIjaBTk=;
 b=njq92TZ69vH4I1A4c39rpIzcXhUu7js861tQMgr0XIKiM2YN77TP70WVIbwM589Z6U
 fK+M6LGIn6jKrmasc8BQDjZoP3O9JUyrFGODR2I7XuIHrS3cNZRDdsbPwmfmCHl/Imqm
 hulW0S4LEsLxnTuUmx68yxPFDoHUOFHDMB0AM1181J+9adCXanHqBEfc6rOESBTBEXSa
 dhz7Iad+u3ZwLGrInY0WgsGTbmuXpAQuNVMWIBaWRUkeq/YZjBmDunLnot5GtxtPNWYH
 BEmuelrLHCse/+ly1LCWwQ5LwmZ76mZTrBzav/Cm3P9wJXbaEvh51iESNdudlrcjNsIs
 plxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711380219; x=1711985019;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BoLRW9dkVxJWAYtYaL+GL9zQqo0bASk28B+CAIjaBTk=;
 b=fbYG0xT7+0Ot2+d53MNaF5eft2nIWzx8mKfS+BkmyK/yhcBf/rfJ3/teDYHKUcfAkr
 Wu23UgXh3kMgTuTmxSd/kTA0H+K1z0AHr3zaQDEQ/KLvcfju4ul+zXXASpogIqP7uaXs
 g1CBgyVilYidOeq8j4LXBwGy32+vegyXdYKdH79nYhefbG2jn4YBFhN2d+8YV41fdpjb
 ugvCKlZvgIx76T6ohZHfUCAFGqOtwhTxt99032hZ+nfbfsndLopsg8xHTyc+mNpbNBX1
 TmuP6SxJBNjoC7XvcZuHoY12qANd7jPKCs54twa1qAcAjlppLvxCa1gw9v0BDp9d5xq5
 hgYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtEq8DN3hmWJieTcYJeIV44XVxjNT+6Yair3JVDCVqF91wc5KNt7qfQYp8Gmna+je4OZUKaMWCClgn2MYsvmXyCM4b
X-Gm-Message-State: AOJu0YwjAEBgxfHcxOEKRbB+ATTI0HOhkhvJZY+SnJy/FimBPzzFqjIF
 I5eiec3VFuOKTNIcR0Hi0qz5m/z03Mzek7cunRJ8SG7NzT4GIMJEBsY3WQDYck0=
X-Received: by 2002:a05:600c:a47:b0:414:a49:131a with SMTP id
 c7-20020a05600c0a4700b004140a49131amr5402744wmq.23.1711380219168; 
 Mon, 25 Mar 2024 08:23:39 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b004147b5dd6f8sm8841351wms.9.2024.03.25.08.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:23:38 -0700 (PDT)
Message-ID: <b25486c3-77b7-4d5e-afe6-9cf0ba1d645a@linaro.org>
Date: Mon, 25 Mar 2024 16:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0? v2 2/8] hw/clock: Pass optional &bool argument to
 clock_set()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <c951c51c-3811-4997-b27d-deb8515b1539@linaro.org>
 <CAFEAcA8fMVVBxhH8NoPMcNarRYMZSFN1x5GWLg=KSxg1p_FK3Q@mail.gmail.com>
 <1d42c033-333d-4fdf-b4b7-7dc19b831982@linaro.org>
In-Reply-To: <1d42c033-333d-4fdf-b4b7-7dc19b831982@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RSCwHe99UPog

On 25/3/24 16:11, Philippe Mathieu-Daudé wrote:
> On 25/3/24 16:03, Peter Maydell wrote:
>> On Mon, 25 Mar 2024 at 15:01, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> On 25/3/24 15:44, Peter Maydell wrote:
>>>> On Mon, 25 Mar 2024 at 14:39, Philippe Mathieu-Daudé 
>>>> <philmd@linaro.org> wrote:
>>>>>
>>>>> On 25/3/24 14:47, Peter Maydell wrote:
>>>>>> On Mon, 25 Mar 2024 at 13:33, Philippe Mathieu-Daudé 
>>>>>> <philmd@linaro.org> wrote:
>>>>>>>
>>>>>>> Currently clock_set() returns whether the clock has
>>>>>>> been changed or not. In order to combine this information
>>>>>>> with other clock calls, pass an optional boolean and do
>>>>>>> not return anything.  The single caller ignores the return
>>>>>>> value, have it use NULL.
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>> ---
>>>>>>>     include/hw/clock.h       | 22 ++++++++++++++++------
>>>>>>>     hw/core/clock.c          |  8 +++++---
>>>>>>>     hw/misc/bcm2835_cprman.c |  2 +-
>>>>>>>     hw/misc/zynq_slcr.c      |  4 ++--
>>>>>>>     4 files changed, 24 insertions(+), 12 deletions(-)
>>>>>>>
>>>>>>> diff --git a/include/hw/clock.h b/include/hw/clock.h
>>>>>>> index bb12117f67..474bbc07fe 100644
>>>>>>> --- a/include/hw/clock.h
>>>>>>> +++ b/include/hw/clock.h
>>>>>>> @@ -180,21 +180,28 @@ static inline bool clock_has_source(const 
>>>>>>> Clock *clk)
>>>>>>>      * clock_set:
>>>>>>>      * @clk: the clock to initialize.
>>>>>>>      * @value: the clock's value, 0 means unclocked
>>>>>>> + * @changed: set to true if the clock is changed, ignored if set 
>>>>>>> to NULL.
>>>>>>>      *
>>>>>>>      * Set the local cached period value of @clk to @value.
>>>>>>> - *
>>>>>>> - * @return: true if the clock is changed.
>>>>>>>      */
>>>>>>> -bool clock_set(Clock *clk, uint64_t value);
>>>>>>> +void clock_set(Clock *clk, uint64_t period, bool *changed);
>>>>>>
>>>>>> What's wrong with using the return value? Generally
>>>>>> returning a value via passing in a pointer is much
>>>>>> clunkier in C than using the return value, so we only
>>>>>> do it if we have to (e.g. the return value is already
>>>>>> being used for something else, or we need to return
>>>>>> more than one thing at once).
>>>>>
>>>>> Then I'd rather remove (by inlining) the clock_update*() methods,
>>>>> to have explicit calls to clock_propagate(), after multiple
>>>>> clock_set*() calls.
>>>>
>>>> You mean, so that we handle "set the clock period" and
>>>> "set the mul/div" the same way, by just setting them and making
>>>> it always the caller's responsibility to call clock_propagate() ?
>>>
>>> Yes, for consistency, to have the clock_set* family behaving
>>> the same way.
>>>
>>>> Would you keep the bool return for clock_set and clock_set_mul_div
>>>> to tell the caller whether a clock_propagate() call is needed ?
>>>
>>> Yes (sorry for not being clearer). The API change would be
>>> less invasive, possibly acceptable during the freeze.
>>
>> Sounds reasonable as an API to me. The other place we currently
>> do an implicit clock_propagate() is from clock_set_source().
>> Should we make that require explicit propagate too?
> 
> For API consistency, I'd rather do the same. Luc, any objection?

Currently changing clock in clock_set_source() is not supported,
so we can only call this method once (usually before DEVICE_REALIZED).

We might never implement such feature, but again, I'd rather modify
it for API consistency.

>> For freeze: is there a way to fix this bug without changing all the
>> clock APIs first?
> 
> Sure, I'll respin that for Arnaud.
> 
>>
>> thanks
>> -- PMM
> 

