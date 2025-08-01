Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD3CC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 21:06:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhwwz-0002jQ-NK; Fri, 01 Aug 2025 17:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhw55-0004G3-0d
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 16:10:19 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhw52-0000Pb-Qa
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 16:10:18 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24022261323so40313945ad.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754079015; x=1754683815; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LAW+KjLMxuovELpknzitcIQLW6jGverTBxr5p6lwhAQ=;
 b=b5i8Y3+PlZYJoLWV9OaDFjm2hgZI0L4O8BmALj1aEn80GRGrzOynbN7VXgtOiSAKrK
 xH7FBpyVA/EhW3X4eqsrt3LAUVOEOEfPaUfI2amC2NvfuyrzsXAoEFdsK507y15VMA97
 bGHAehjEuzOVcwbtpid8IVzEG0zPkPfyOwdtkybV8iC5kuuZbJov4VEkJKi/+a9FQyBV
 BtR7JsErIWu/v2zsgke6wf3bdX7PmXnXrc9n1KTxXqT/FLiJFQVZcDV5FkA3y05ePwmW
 lA7USVCdYRdrfFx6PXBzLNS6H5x7oYhQdU0lyBVjt8YCEyX6slJY+TsL/COprg+V9wYr
 srJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754079015; x=1754683815;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LAW+KjLMxuovELpknzitcIQLW6jGverTBxr5p6lwhAQ=;
 b=wE8cuaKz6rlHb5BIaXKmLeTaohZC9kgze3x6MBsp/g0uJm4FXHSg5JeNJLop2i8lta
 S+S9pAMH4jn29lThNzDTZ6jS5bFuMiQEPl1Z1oKiKiPINJ7xIWlvLfCFvMcjf18/Y874
 ogoMxs8jmybhDT3s6ES0TLZajZLoxTiUyUsYx6v+cyCrG695Y3SUDOJtRW9SKixbN2D3
 PlugzUBwBev2nGwTrW0yvX/iOpL5plL3V/fjNcq0jvHHwOiJSaBIvpgy7G9HC2ZTFHC5
 gTtVhoPIDfImxJNrik6TL/RZFNf1zRdKiYSyY73Q9jJqWxaXa4j6m3NphADH2SFUxy7U
 7qtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmkqogRyvpw1lVxJsico1IJtK47wyygmp2Zw6NOjS4bx/zC/JXFHtdkaT4QFr85Y49EfyekZ48Uw==@nongnu.org
X-Gm-Message-State: AOJu0YyFiJhVi4AbUmhOo3UHFnF0Nb2k9mw/woHlfmMngjBxbC25tylR
 zQ6Rjfafy52g7uyO85YixjbI+1M9v3dnFTQ9FXvFm4+3TT7ZDZs5lwSGN5Lq9FLQIRE=
X-Gm-Gg: ASbGncu13bzkc5wyPAzt77KFJ4GbL5N+kIYVZOud471FqB0rEy8/FmximFO20epnE7l
 bNKSDfzffV751wm3BvO1FWXFcRhi4zvAK+vM4TQDyZvyWISQP022S7Sfjt6ggkQvWdvGIPDsyN2
 s7IEJZI8+BseoL08C2+zKQ94heSK5SM3qhX7SD8kYmLs+PrE50VnLWsPYrC5bbCwfERucrmdzWw
 3Wk6gBNh686nD2DhFV9k2mIEIp7zLLFclLfi9y2GKviA496MfPzdixvI0N77Z57b7sibhOyTQAM
 chuD2Zzc7gFReAAkvWVSvZ6FFKx71n0WikfeJm+PoGKfKjuJuHfWqRYnQrZ8wC4ZOI9yDU/HBd3
 nMeN7sHQF5vQQOK/l2Cjgrk69+3/rVasvOo4=
X-Google-Smtp-Source: AGHT+IEqTO/wfj4p0UwrRfjFlp+QhXV2GT8qDs6e1zrzObKXrwu9FYK7FFtTWW1jEZ81KCSGLk/+hg==
X-Received: by 2002:a17:902:dac2:b0:240:b3b3:872a with SMTP id
 d9443c01a7336-242461c2aecmr12383505ad.6.1754079015022; 
 Fri, 01 Aug 2025 13:10:15 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaaf1bsm51000465ad.159.2025.08.01.13.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 13:10:14 -0700 (PDT)
Message-ID: <25a6dd9c-a435-4f2e-9c7c-b92daf5128c1@linaro.org>
Date: Fri, 1 Aug 2025 13:10:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/9] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250731052753.93255-1-mohamed@unpredictable.fr>
 <8af5e691-da19-4141-8874-51ca685288ac@linaro.org>
 <864AC97D-2C45-402A-92AF-D0FDDB72C40E@unpredictable.fr>
 <21266cf2-887d-4bf3-8c9a-7633bffd8cd2@linaro.org>
 <17413DE3-C53B-4DA6-9777-3E772D2C2C2D@unpredictable.fr>
 <d495bae3-d252-4b79-883a-3f5f815c5feb@linaro.org>
 <5A71E199-4C6E-467D-9E9B-04DE9EF1A9CC@unpredictable.fr>
 <b613245f-dfba-4f9b-8914-7c1e73c9dba5@linaro.org>
 <5133CBA1-A4FA-4789-AA7D-2FDBBFDF2470@unpredictable.fr>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <5133CBA1-A4FA-4789-AA7D-2FDBBFDF2470@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 8/1/25 12:57 PM, Mohamed Mediouni wrote:
> 
> 
>> On 1. Aug 2025, at 21:42, Pierrick Bouvier <pierrick.bouvier@linaro.org> wrote:
>>
>> On 8/1/25 12:31 PM, Mohamed Mediouni wrote:
>>>>> I didn’t test anything on the stable branch for now but only on Canary so far.
>>>>> Just cursorily tested (EDK2 only) an X Elite device on prod (26100.4652) and this issue doesn’t appear.
>>>>> I have 8cx Gen 3 and 8cx Gen 1 (SQ1) devices around, will test on those older SoCs later and see.
>>>>> Random idea for testing: what if you put -M highmem=off, does that change anything?
>>>>>
>>>>
>>>> Good guess, it solves the problem with edk2, and direct boots linux kernel successfully now.
>>>>
>>> If you don’t mind, could you please test the latest commit I just put on the Git repo (whpx branch)? It should address this properly.
>>
>> Sure.
>> Without highmem=off, I get a new error:
>> Physical address width: 36
>> C:\msys64\home\tcwg\qemu\build\qemu-system-aarch64.exe: VCPU supports less PA bits (36) than requested by the memory map (40)
>>
> Oh this confirms what I thought, just pushed a new commit which should be a complete fix. :)
>

It works fine now, on top of c6e3d4d.
Excellent work!

> And accessorily is also a good thing for Snapdragon X too, as 40 VA bits were used there despite the hardware having 39.
>

Yes.

> Thank you,
> -Mohamed

This seems like a good time for cleaning up, address the few comments 
that have been made, and send a v2.
Feel free to add the gic related patches in it, so we have a "complete" 
series to review.

Thanks,
Pierrick

