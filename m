Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC9ECA0EED
	for <qemu-arm@archiver.kernel.org>; Thu, 28 Aug 2025 14:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1urdxX-0004uK-31; Thu, 28 Aug 2025 10:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1urdpo-0001qj-L7
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 10:42:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1urdpk-0000xJ-Ax
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 10:42:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso774111f8f.3
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756392152; x=1756996952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XlIA4USyAQE65RJp1YZjEvdIlB4v9w1UDqYnJWiMLo0=;
 b=wM4/FdnmJvNSsnYCZhu5yrMc59cw7bP0GDsjJOJPpavFeXOy2cX5mCl6NKqFY7bJxA
 CzcsnUdCHukUT/QglfWBt6G+p43UP+AxzEMxOaQJLqfVpFgK+yA4t1JLI/MQ8HVVTyMz
 n2b8G/q3XwUh/PkPVmIEPkfO8rImmd+OuRJIi1sedBplIZNMx2D43AgC18LRJOEx7UaK
 1qR1m2beJRlpFW2hwzY6a4/4+b162GALjHJyM36XAB8XhAwD5DVMnFscoIWAx4ycogfO
 jtxaOLP0UdSeyXw4dd/j+J7sPazoNxVYCbSnybSkuK32TlZPkf01eCUxyQHmU4MQj0VV
 Hi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756392152; x=1756996952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XlIA4USyAQE65RJp1YZjEvdIlB4v9w1UDqYnJWiMLo0=;
 b=JmISW+E8ky1OZvc0xp0d5cuY2njAZo7hXLH/XZLpmLFsWfOObi7zKp4RhiT8gmel1t
 R6bblpZJqmLntcv69CBDj/P49DRrR8suuiikXb/R3okWCgiBFRwDUxQStmjdwWyfrO8x
 g8KafHIoeLX/L7K/cO15F0SKr7Bj2XSU0d4RAJOimuIHastVKXLN4sOXFgvsVlz6GvAl
 Lo9aNbacRyoJPfB930KHY5PC2OeaLvFTa93SDrd64G9E2f8DHnhk+0MFKnJvqbUoBRN6
 ZObd6zbB/hRdC1ojW9J7xV4yiktTKPIp1jrheYnq5yqaFQdyk81bIfQZ3dx54Bgi+bth
 dYxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCFRzGS6SFPGanbbFZ1sXBgKfHlf7X4TJ/UY7b5mKcfoYP7L3GL+gbHBjPYFutuiD1mkBKPpUyqQ==@nongnu.org
X-Gm-Message-State: AOJu0YwAyyriGSsVwInHXXyXO+XdLg/VSmUXArZ02M7hNFfDQIWzfTL+
 YcDx6HVKv5HUXsdDwCXDdL7u5H02koeaFby9Q9N0PsOJkd5I5QG5u06ULWlNh9mRZfg=
X-Gm-Gg: ASbGncsP8yJuZ6cRX+9O5Cv5dJzhukYq8mgEdZyoyJY7EKpojxsgRvUa3pda3bzCNRp
 zAtZQBeaKowBIV90preQrq4FCFKKicIQ0aswyKh2MkFcD4l/VES+rPmwi9STJnDfMr2+N8WPkQU
 oEAWA+J/iq6Nw+y7Vsx3D41P2C2/sXJ9dSZy0NnZfQNHEdfeDep15pHvZziO85DWFIqGHQlCTSL
 u5noKZwE49/xPIOAwJ2tlakiiy4ryd4L2yYCoSAYHY6zMtgUE6u6rIWpFuuXf+fpTo3siWh5JoC
 +Z7QIGUb2nFP3So7wf3OLPBr+RmCLdiO6lUQIYt0wfKOobmudN2n9oz90OwPJMev41Fkw/50Qj3
 GjEOW1oeKNWIapRclyvzZgQRt4VjQ2sn9dmdW1B4BXvzJxFFJsE7pByjvDmxPfRJDJQDC3SXe5H
 a8l45Mt4yu4e4bFzq97mgqieQQBcZOtB9nyjtXA4Hs0pYVVYmnRD0Y3P0b98r8axyqDXC2pUk14
 tgasmlBXBNvlXg=
X-Google-Smtp-Source: AGHT+IFhU0RjfxzQX4gyiUiU2u/z7+mj3ER82ZBafxLsUk5C+WMMU7+rsozf/bDZtt8oBKi1jUBBUQ==
X-Received: by 2002:a05:6000:188e:b0:3cd:9794:cbcf with SMTP id
 ffacd0b85a97d-3cd9794cc94mr3646605f8f.60.1756392152425; 
 Thu, 28 Aug 2025 07:42:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb09:d021:8fd6:94b3:f1b:6ece:2fef?
 (2a01cb09d0218fd694b30f1b6ece2fef.ipv6.abo.wanadoo.fr.
 [2a01:cb09:d021:8fd6:94b3:f1b:6ece:2fef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cbf1f5fc1bsm10014291f8f.54.2025.08.28.07.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 07:42:32 -0700 (PDT)
Message-ID: <c0acee85-eabc-4093-a74d-f54ecd6e4335@linaro.org>
Date: Thu, 28 Aug 2025 16:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] tests/functional/test_aarch64_rme: update image
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250727074202.83141-1-richard.henderson@linaro.org>
 <20250727074202.83141-3-richard.henderson@linaro.org>
 <CAFEAcA_ZQ13qMRUQsieJiEPV=ULrDbz8=EJaW4_kw=yEysob0w@mail.gmail.com>
 <87349s4kfz.fsf@draig.linaro.org>
 <3d59d45f-79f1-4701-ad3b-402513ce4e72@linaro.org>
 <CAFEAcA9ryysJQK8hxNxpF=00yC=t3==aFqt2pubD3CjM9T+WLg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9ryysJQK8hxNxpF=00yC=t3==aFqt2pubD3CjM9T+WLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2025-08-28 10:27, Peter Maydell wrote:
> On Sat, 16 Aug 2025 at 01:09, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 8/15/25 9:29 AM, Alex Bennée wrote:
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Sun, 27 Jul 2025 at 08:42, Richard Henderson
>>>> <richard.henderson@linaro.org> wrote:
>>>>>
>>>>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>
>>>>> TF-A needs to be patched to enable support for FEAT_TCR2 and
>>>>> FEAT_SCTLR2. This new image contains updated firmware.
>>>>>
>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Message-ID: <20250719035838.2284029-3-pierrick.bouvier@linaro.org>
>>>>
>>>> I see this test failing in local runs of 'make check-functional'
>>>> sometimes, complaining that it can't create the scratch/out/EFI
>>>> directory because it already exists:
>>>>
>>>> stderr:
>>>> Traceback (most recent call last):
>>>>     File "/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/functional/test_aarch64_rme_sbsaref.py",
>>>> line 49, in test_aarch64_rme_sbsaref
>>>>       os.mkdir(efi)
>>>
>>>     os.makedirs(efi, exist_ok=True)
>>>
>>> would solve that.
>>>
>>
>> Yes, probably safer to add that if we can't guarantee correctly that
>> scratch folder gets deleted everytime. I wrote the test assuming this
>> behaviour.
> 
> I folded the os.makedirs() fix into my copy of this patch in
> target-arm.next.
>

Thanks Peter, you did well.

Pierrick

> -- PMM


