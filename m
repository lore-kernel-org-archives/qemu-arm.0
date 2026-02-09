Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D79EF06E5
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 05:53:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpKCt-0004tW-Ul; Mon, 09 Feb 2026 00:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpKCi-0004sX-4s
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 00:53:01 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpKCg-0001A7-H8
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 00:52:59 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-81e8b1bdf0cso2958251b3a.3
 for <qemu-arm@nongnu.org>; Sun, 08 Feb 2026 21:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770616376; x=1771221176; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aX1sQxtYdIMYAlVOMRcTE5905DWAYEmviChFaYJJ7N8=;
 b=m43UpfQtpYNNkqJha1KrAxtf18ffloI0p+gMoiMW0knD3Qu8xsN6ZrPEkDCidXg1+H
 cuvLmlSrmS1j0pM/1D6ZhNzbU3rYTjLyVryXMR8UcrVoCQOvgF+qy8c7ttHFOtPeBosv
 rzjs/gPtpom1H1UnkI+6obxDKziKcCkE7KldRZ/QK9leS5ZPnFbOPAVEMUxruwctv47P
 Goz31rX9lwFvP4vYidTnmwmF1jjBfsK5t0JBlh6QO4foyEVWSsgPUOxREfpjp003HXAr
 x35ZdLL099WQMUdLmjCKaNZEFDjhiONeNnwgWrqKe+kPrDXwF5T7b1G7uq9FoglSAS7n
 7P7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770616376; x=1771221176;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aX1sQxtYdIMYAlVOMRcTE5905DWAYEmviChFaYJJ7N8=;
 b=pIO9Q5j7AazUssrxgYR/bIoLUWOrYYHfP5wAQ16bQh4wR/NhqWLIfbIMmA4c8rPIjZ
 v9Jbob7NrEWphxEGhqbV3FFsvdS7YIt+lyyxIgaSboDvGBl2LPZ7f/BK+L+nWBWFPcFW
 6Ij5vkx2pynz5X/ER5BKQt4nUUX7MEeQqMsP4b4bYHovXLKIrS1z5gJajgBYfL8IbZIs
 hGquv5D37NOjB+nk6f9z0eJpVZKFM4xnyJZevptmFhevTavPbmZcby4dx5OV9AmJw/68
 uvF9+aQMHdgVlMF4aZbIL8rfX2R1GEgYWiSOCCp6oHnrkXRVWBw9SMvQn91o0NGPSWB1
 pnjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsxUUNyCFdkYV04tObnit/mklgJqidYEqcyQ+//x0NmPPRISSmeyF7dRJPn+uGlLG7nGzQS/VujQ==@nongnu.org
X-Gm-Message-State: AOJu0YxgZJiD/eWIOkz/eF6hJkhbn6s0zNC0rYAHYJJWlJUREggGbSW2
 /YTXJZTdVkmWMLMOu80ySEVNqqO3AGZVsId817lLsrnsDC+5oyxHvdkR5jrB4eGFkHI=
X-Gm-Gg: AZuq6aLcStaVA615Yte7PXURvvm3UOZiL4eSMQhW1ImXVgZ1XT6PK1Cbii7/yBFwCOd
 4WEdbhJCmnYaOvzOroHqp29jPkgTnJejmzrT8ePcjbvA0MJd/KI3we7wZ24pC2OZahTLdiLndTu
 s3x/0rx+mGsGJcLRf63C5my1n1vTSWraKqgGZ8upC79GXUPl8EsRXFeQTZDlgonnwi6m8VproV1
 wPEsk1nIKsrCuBfkM0w/DDEkXf1s3a8UCOxirGwqA7+YXdD8UKsL95I8o28SJEDUewprdmG1Qh/
 ZqUD+pNCFgauuFrJz35tBzQFVoLxz9nL0FiI3ucfUGzWcqPOgZ2oh+PzDiWCpcmm8vDuFA3XKFi
 YNJjzfwqHMpuNt/g6O9rF2mBZ2KowBM+g6pgaHsuiaLg0iblYQgIjB+N1EpHjufX4aomlOkBubq
 MXbAfGaDhbZ+cRZ7MKxbJqsP4oAdRlI6D9Cxhn1BMyN2QZKvHsZP7mINAx
X-Received: by 2002:a05:6a00:3989:b0:823:f04:e89b with SMTP id
 d2e1a72fcca58-824417242admr8351763b3a.48.1770616376277; 
 Sun, 08 Feb 2026 21:52:56 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244152456asm9451125b3a.0.2026.02.08.21.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 21:52:55 -0800 (PST)
Message-ID: <e291f290-a188-4106-8648-48d4c464dfed@linaro.org>
Date: Sun, 8 Feb 2026 21:52:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] target/arm/tcg: duplicate tcg/arith_helper.c and
 tcg/crypto_helper.c between user/system
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-7-pierrick.bouvier@linaro.org>
 <6c5eb308-56e6-487a-ad7b-8f0da70ab7cd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <6c5eb308-56e6-487a-ad7b-8f0da70ab7cd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

On 2/8/26 9:00 PM, Richard Henderson wrote:
> On 2/6/26 14:21, Pierrick Bouvier wrote:
>> In next commit, we'll apply same helper pattern for base helpers
>> remaining.
>>
>> Our new helper pattern always include helper-*-common.h, which ends up
>> including include/tcg/tcg.h, which contains one occurrence of
>> CONFIG_USER_ONLY.
>> Thus, common files not being duplicated between system and target
>> relying on helpers will fail to compile. Existing occurrences are:
>> - target/arm/tcg/arith_helper.c
>> - target/arm/tcg/crypto_helper.c
>>
>> There is a single occurrence of CONFIG_USER_ONLY, for defining variable
>> tcg_use_softmmu. The fix seemed simple, always define it.
>> However, it prevents some dead code elimination which ends up triggering:
>> include/qemu/osdep.h:283:35: error: call to 'qemu_build_not_reached_always' declared with attribute error: code path is reachable
>>     283 | #define qemu_build_not_reached()  qemu_build_not_reached_always()
>>         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tcg/x86_64/tcg-target.c.inc:1907:45: note: in expansion of macro 'qemu_build_not_reached'
>>    1907 | # define x86_guest_base (*(HostAddress *)({ qemu_build_not_reached(); NULL; }))
>>         |                                             ^~~~~~~~~~~~~~~~~~~~~~
>> tcg/x86_64/tcg-target.c.inc:1934:14: note: in expansion of macro 'x86_guest_base'
>>    1934 |         *h = x86_guest_base;
>>         |              ^~~~~~~~~~~~~~
>>
>> So, roll your eyes, then rollback code, and simply duplicate the two
>> files concerned. We could also do a "special include trick" to prevent
>> pulling helper-*-common.h but it would be sad since the whole point of
>> the series up to here is to have something coherent using the exact same
>> pattern.
> 
> tcg_use_softmmu is a stub, waiting for softmmu to be enabled for user-only.
> Which is a long way away.
> 
> It's also not used outside of tcg/, which means we should move it to tcg/tcg-internal.h.
>

Thanks, I didn't think about moving it somewhere else.
This does the trick indeed.

> 
> r~

Regards,
Pierrick

