Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF48CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 13:21:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKyeY-00084z-0r; Thu, 07 May 2026 09:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKyeW-00084V-Vu
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:20:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKyeV-00063w-5C
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:20:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so12541135e9.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778160029; x=1778764829; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ro0E0Z3Il8gZJFwT0ciaEyWTgxOzYZknb0RooRGDaBo=;
 b=ATFY3kHbhi39pKVjZZUw1KL4F9wedfuGggjTXA+63bE7w00CoWltyZTdvCxslgBIcr
 YX67NwNVE4/+7mXjwMzelFLg2APD75+H2PEB2bTihoYH+bbZpI7rzFPoYzvL4AWlxHgS
 la0Myu9iaJp5Uvn+RD40wdTtGoZotiEvjkxsP3fY+wCN3lDtyzocJJpQl9UwN289LDGq
 6oJF6Eg0/SMTCKYlZGz8BOzwX9/ulvOEwUzFLL4+vjZaQylRM1CdBeES6tHyhu3mtBgs
 +BWXnCfP2ITbI3KJysBZV1aWwHn6oo5UODoVjCSObtxXbSdwUvsE+55mXTBQynxXP9Cr
 oEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778160029; x=1778764829;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ro0E0Z3Il8gZJFwT0ciaEyWTgxOzYZknb0RooRGDaBo=;
 b=SgcRQpx+2OowiQgI8eoqYHuDoCNALEiY+KCfQ1B0ycenlFHwaaVmxI2waobPdJq+ke
 ZZSHnZipSfuip9BKquPp+bCZZI86TdawrrnOYV/8UNM7YBi7FWsLt87F589DS8hWPfP0
 DfhFcsiXUdvBRuIinyz3U3+TBGRl2E1fBEYbRdo2l0U+EZj+L2/A0+6+WvWYBq5HOTRL
 sMtla4OQMngRN6YCf31Z5EVlpTp6effF+Bc22FNJURkr2JR5YCUqbtXs3lbr1KSFfSUL
 sxnN84G5rXt/N8r6dF7OUxkZZ83G1HjYYX576GU8+ytl6KyDnCao7X8xBiP0myJ78UK+
 QurQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8sD/haAF1BJuwqHPp3iEMdxWq7RSxM3Rr/vATG4FaZt/boPFQXRN3YOjbGMr4w0krPAlSjUen3/g==@nongnu.org
X-Gm-Message-State: AOJu0Yx328Yq89aQaNPlZYN/HMwJPoLAbWnV/J7SfhpUMrGWr2T8nrU4
 NkcU3dccmx3eaW+VtB1FvtqGLh2kT1dQnQ/9wFufT0GA6CryrfhfQAteS1MHnEH7ODI=
X-Gm-Gg: AeBDieuzKsWs9bsrH9bW54CWTUPNvfDlfytK+tS2548i/OJ/8fG4DGhQ7fsHENiGFIp
 4c5HJ9c1WgPK1yIPvj9rv2l+XO/VQSjpJqbpTqa9GsbrKQJm9K0u4tlBlfbid18D3ou213YBafm
 FjtFRu/W8WikghLwSIPl7gXwioZyX7X8NuUMcz5nxpKQbv/Q9VKTFc+MJ1ddJBGC5lFODOXJOWR
 tD/uvrFxPNdigKMXCv/S77IcFP02vRJ8FK3vATGt5e7Yi1efigI2SUg2X1qDc7+07DG+HaZuRlc
 xVHbgNxj1d5O3SaptiRmy7punBRUEO0ElKAyhs86v5/GkbFt+83+a6UCF3+Byh1qyIohGn/NiqV
 KvyzBTgoR7NUTfZlgqwR/G3udM7qCnnSDMsl32y9Dyr9Dw/qpIytn+TbmMQEbkzwu+1k49aI3S9
 lpOZpTUn52vZQaA+3PUmZNDLQQ+7SJgWy2ZAs2leN+FpLG1bQ7VZiSFYe0Pw2DPLEh48qmCW3JP
 Qve/b21BcfY3Kc=
X-Received: by 2002:a05:600c:4ba6:b0:488:a882:c7 with SMTP id
 5b1f17b1804b1-48e51f4bab4mr72271165e9.25.1778160029139; 
 Thu, 07 May 2026 06:20:29 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45054b03e04sm19984325f8f.21.2026.05.07.06.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 06:20:28 -0700 (PDT)
Message-ID: <eb9b9aa4-c590-41ad-80c6-170f0b83ed92@linaro.org>
Date: Thu, 7 May 2026 15:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future of target/arm "max" CPU type
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Gustavo Bueno Romero <gustavo.romero@linaro.org>
References: <CAFEAcA-WB+vfiHZpPut=AdEOCXacsTfrvxiGAmhaGH1abHD8ag@mail.gmail.com>
 <4a46393d-08be-40e9-8f52-788d46ab36cf@oss.qualcomm.com>
 <f72abfd1-bef7-407f-a62d-465d9aea0aca@linaro.org>
 <afxpc_5OvkiEyXxu@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <afxpc_5OvkiEyXxu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/5/26 12:29, Daniel P. Berrangé wrote:
> On Thu, May 07, 2026 at 12:17:32PM +0200, Philippe Mathieu-Daudé wrote:
>> On 7/5/26 00:17, Pierrick Bouvier wrote:
>>> Hi Peter,
>>>
>>> On 5/1/2026 6:26 AM, Peter Maydell wrote:
>>>> This is something we've discussed before. I don't think I have a very
>>>> solid grip on it and I suspect I may be missing some parts of the
>>>> "problem description" (i.e. what are we trying to achieve) and perhaps
>>>> some implications of the choice. Overall it feels to me like a "no
>>>> obviously correct answer, make a tradeoff" question. I've written this
>>>> up to try to clarify my thinking and canvass for opinions and for
>>>> people to point out what I'm missing.
>>>>
>>>> For a long time now the arm targets have defined a "max" CPU type
>>>> whose definition is roughly "all the features that QEMU
>>>> implements". This is helpful for:
>>>>
>>>>    - giving us a way to provide newly emulated CPU features to users
>>>>      without having to define a specific named CPU type matching some
>>>>      hardware that implements the feature (which might not exist at the
>>>>      point we add the emulation, or which might also need some other
>>>>      features we don't yet support)
>>>>    - giving users a way to say "I just want everything"
>>>>
>>>> Mostly this has worked pretty well, I think. (It can cause problems
>>>> for some workloads that break when a new feature is added; TF-A
>>>> firmware seems particularly prone to this.)
>>>>
>>>> However, it doesn't work so well if the architecture decides to drop a
>>>> feature and mandate that newer implementations may not implement
>>>> it. Up til now that hasn't been a big deal, as only a few very niche
>>>> items (like FEAT_DoubleLock, an old mechanism for quiescing external
>>>> debug before a CPU power-down) have ever been removed.
>>>>
>>>> With the Armv9.0 architecture, a big feature gets removed: support for
>>>> running in 32-bit mode at anything above userspace (EL1, EL2, EL3) is
>>>> not allowed to be implemented.  We've got away so far with ignoring
>>>> that requirement, but as new v9.x features are added, they are
>>>> designed under the assumption that there is no 32-bit system mode
>>>> code. For instance, the GICv5 CPU interface defines only 64-bit system
>>>> registers, and our non-compliant "32-bit is actually there"
>>>> implementation would give you a 32-bit OS that couldn't handle
>>>> interrupts. Other similar (or harder to spot) issues are likely to
>>>> also turn up.
>>>>
>>>> So my suggestion is that we should have two new CPU types:
>>>>
>>>>    v8-max : "all the features we implement that are valid
>>>>      for the v8.x architecture"
>>>>    v9-max : "all the features we implement that are valid
>>>>      for the v9.x architecture"
>>>>
>>>> v9-max would not implement AArch32 EL1/2/3; v8-max wouldn't implement
>>>> any feature the architecture says is v9-or-later.
>>
>> Certainly clearer than what we currently have.
>>
>>>> For the existing 'max' CPU:
>>>>    - on qemu-system-arm this would be a synonym for v8-max
>>>>      (since it must be 32-bit)
>>>>    - on qemu-aarch64 and qemu-system-aarch64 this would be a synonym
>>>>      for v9-max
>>>>    - on qemu-arm it can also be v9-max, since v9 doesn't drop 32-bit
>>>>      usermode support. (Though we don't currently implement qemu-arm
>>>>      max this way, so it might end up being effectively v8-max until
>>>>      we get round to implementing support for selecting AArch64 CPUs in
>>>>      qemu-arm.)
>>>>
>>>
>>> This seems like a good approach. A side effect is to solve the
>>> duplication we encounter for the single-binary also, by correctly
>>> deduplicating QOM types associated.
>>>
>>> The concept of having a "max" alias that maps to a specific type (in
>>> this case, distinct depending on the binary) could be used for other
>>> arch if needed also.
>>>
>>>> I don't think it's worth claiming 'max' as deprecated and dropping it:
>>>> as an alias it's trivial to support, and there are a lot of workloads
>>>> that won't ever notice this change.
>>
>> We could display a note though.
>>
>>    "Using 'v9-max' for requested 'max' CPU".
> 
> Please don't make use of "-cpu max" print warnings.
> 
> IMHO "max" should remain a first class citizen across all targets,
> because it provides a consistent approach for users.
> 
> What Peter describes with resolving "max" to either "v9-max" or
> "v8-max" depending on arm vs aarch64  makes sense to me.

Effectively postponing the problem until ARMv10 gets released
with v10-max diverging from v9-max.

Nevermind, we'll keep handling "max" alias at the machine level.

Regards,

Phil.

