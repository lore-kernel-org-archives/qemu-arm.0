Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB304CD4F21
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 16:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIDn-0006el-TT; Sat, 16 May 2026 12:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIDm-0006eM-Bm
 for qemu-arm@nongnu.org; Sat, 16 May 2026 12:50:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIDj-0007TY-Rd
 for qemu-arm@nongnu.org; Sat, 16 May 2026 12:50:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so544281f8f.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778950233; x=1779555033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aGI9KWuxfCdBDF342DGsOBonHHbCgtlGcJg4C9UWci0=;
 b=yT7yfU3O2NAVd0lipHEuFO0IPPLft/+18btXGzOi5x4n5t9JD9ENSN69UdwWmMRCUs
 f84uNoVfMk0M6XSzT7QNhQqbROmW6IakKD15J0rigI2DSpYqfp1RcNApp9vA3qhhsB0+
 hB9DQ4d/HO0U2fpt7tbwtnQAKX43zc6ZyYuJj5A4wqcZ44hdLa6rLOxIzV6zc1A74gnv
 nOy3exNeQwXKiP7pLrLguLGR64wYp6B7ajGV4VNC+EiAXr9ItJc2W+Fj+MRienYRUXIi
 X7iw1EIYD8QvMSpQnzHPWyJ6gQlWc1g2Nz02JB8M9eaIicROU0pZZ7h/dVPZWiiROYvi
 1h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778950233; x=1779555033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGI9KWuxfCdBDF342DGsOBonHHbCgtlGcJg4C9UWci0=;
 b=ILZf0MU7JSKc+5ZNi8fmDznQM/2pgmucqNWyXKehdzgB7z0qNR4FZZl7OynLtZRxqt
 FxEcnfo1MvzuOFZ7qTeNTRsxINCbA5UzyJDFQWF6mIwMVUs2JLkkaFHM1oaxWAVnCyi0
 KrY+9zCUAkwRZ0sxy5d3k2w1fhGx/rkPRMIvJdyqGY5bfX36F1OxiiZmUDfJHYCups/W
 YUDkUVpGtOZmM9TiJzXKO8HLYoZU532H0TxwzKBgh63IA27xXWy+OUdegnRZCure8J5M
 sa/HWmKGThhhHeFmQ9i1pAZbU3sfzEyD0DE6GCx+Vuq6z9lwrk6OOvPRAO60TvoQ8kTY
 IzXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/A4X33oGYCARtJ/aZppGsjNvONpWlI+3U7ifUWUtR2yHnkpi3qsjHAR2wb1HS03He7XezJ4ZB5Tg==@nongnu.org
X-Gm-Message-State: AOJu0YywQ6xlnQRN51BcKI61XoHjb59d0JEqwRHLR0E9XM3Yhjsdr9Gb
 0WAa1lcRbgvM+q0Jkbu4QGhvQzsT84ZeJuNLOutgu+ts/XQL0jdSSPsXSvEUAddc6+8=
X-Gm-Gg: Acq92OGZ5r32ObLbkQFI8b2YFGLku+GaTcK2+aQ7MDCrR4crwgo4l+lVwlm07/WOecH
 0Pq6edvBTcNgEMnxt62cPtbC2ixLRnvmNMdic436tH9xd4DjSSCCSA9Tt2mx2kBUF50kVj/MBTQ
 pTRLNLREZCGZvTwD9fFtsAEiQbCFeKWb6JPQtBE7GJYT+OJf4QshcNb+OeglhWnjiHfS2uGaWqg
 0X0nAT0BwquWOXqxuiZJF7XPotWL/p6IfcsWMtz7wVXmAY1a7Tegj4zAJg4jt/vE54eFogi46wW
 Gr2zDvZ5MmCUN6US+NKyuKTas5Wv3DvAWWOCqPaP8cUzBogNRH/fkDNsOE9AsCCQFKkbUqLH+rS
 niyunC0lmlOjQ2TXyMjvyertMRa8yGgjfiHK0me6086VxvRpWpKz5SzC3StfS8fxzyeehf0BSUc
 LKljGrLTj9P7rfGmuullZZQaVKfMCs6FBHk+Bfmbj23xPnasz2sUA5tmpyX0P/QUDRjQ==
X-Received: by 2002:a5d:5f49:0:b0:441:1e41:19c with SMTP id
 ffacd0b85a97d-45e5c5fd484mr12455055f8f.20.1778950233035; 
 Sat, 16 May 2026 09:50:33 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm23414506f8f.12.2026.05.16.09.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2026 09:50:32 -0700 (PDT)
Message-ID: <2590c2e5-e3f0-4906-ae3c-7d6858e75eae@linaro.org>
Date: Sat, 16 May 2026 18:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/20] hw/arm/aspeed: Initialize 64-bit CPU types
 during DeviceRealize()
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-5-philmd@linaro.org>
 <e8e1d0f8-b5b9-49a3-9478-f58f72e962e7@kaod.org>
 <99983366-9174-40cf-a158-a663daa7965f@oss.qualcomm.com>
 <3db1823e-bdb3-4801-81a0-dc901bf75655@kaod.org>
 <64a611a9-a509-412b-8ff4-5bcd85348b97@oss.qualcomm.com>
 <3c55962b-cd03-4728-8442-c895f7e8d132@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3c55962b-cd03-4728-8442-c895f7e8d132@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 15/5/26 23:17, Cédric Le Goater wrote:
> On 5/15/26 19:22, Pierrick Bouvier wrote:
>> On 5/15/2026 10:18 AM, Cédric Le Goater wrote:
>>> On 5/15/26 19:00, Pierrick Bouvier wrote:
>>>> On 5/15/2026 9:29 AM, Cédric Le Goater wrote:
>>>>> On 5/15/26 16:10, Philippe Mathieu-Daudé wrote:
>>>>>> aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
>>>>>> CPU (Cortex-A35), only available in the 64-bit binary.
>>>>>>
>>>>>> If we build this file as common object, these SoCs become
>>>>>> available in both 32 and 64-bit binaries; however when running
>>>>>> the introspection test on the 32-bit binary, the init() method
>>>>>> tries to init the Cortex-A35 type -- although not realizing it
>>>>>> -- which is not available. This can be avoided by deferring the
>>>>>> CPU type initialization to the SoC DeviceRealize step (this is
>>>>>> safe because nothing uses the CPU type before, only the GIC
>>>>>> access them, just after their realization).
>>>>>
>>>>> I understand this is a qtest workaround. Could we introduce
>>>>> instead a (qtest_enabled() && 32-bit binary) helper ?
>>>>>
>>>>
>>>> In general, it exposes a dependency issue in QOM type system.
>>>> In this case, we get a class depending on another one through
>>>> class_init. Moving this to realize seems like the best fix.
>>>
>>> My feeling is that this goes against the best modeling practices
>>> we have tried to put in place over the last decade.
>>>
>>
>> In this case, adding the workaround you suggested might be the best
>> approach indeed.

What was said is "we'll soon have a single ARM binary able to run all
all CPU types, no need to make pointless changes due to a test that
won't fail because all CPU types available in this binary". But we
are still 1 step from it -- removing the 32-bit binary -- so I'll add
Cédric's workaround.

> 
> Well, if we want to make progress, let's at least add a comment
> for better fix later.
> 
> C.


