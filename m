Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp18118njb;
        Tue, 7 Jan 2025 00:53:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkBCdBEdlJI7gz47nIdi9BxAmww596beZBa05UZgXlXLsMtiMUctQ8hFxnmeaMuDnNLuCCjqOrjpYW0g==@linaro.org
X-Received: by 2002:a5d:6d84:0:b0:382:46ea:113f with SMTP id ffacd0b85a97d-38a221e2799mr62847713f8f.10.1736239980942;
        Tue, 07 Jan 2025 00:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736239980; cv=none;
        d=google.com; s=arc-20240605;
        b=BK50f100iwk5FNLmTwCYbxJkCr/R8jXdyATZBl/BDmp+rXJ0MvTWGOuqENAx1qrSj9
         jDaVgon6scuv2axXvl82IHu0l+9eXtut1U5mvtO3D84tUlKcCwxdjlrlygMXbFFrKNor
         6P19c+ccWx0DUdIuKvK4+PwXQPAj6RmBj9rcidmAdddIuhHR9U5hUGIn+J5GcgDwMCBx
         Wm3QiToq2hEiPRMCeKon8TQvVaexIWFKRmuyfPoiww2inhE4J5+jI6TStDg4h3iQYCGo
         Gz+nMG/JxYE4QAoV2Dn2D/wow0FmDCNuJs78EAijtFzO9KXeJzVq7ruqT3+10AvhBjkM
         ltEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NB+uT1ZGTxOF5kMHAIvom8Vcx46Zc94qv30ZNIEEzFg=;
        fh=e25EGlWUbySdZyE0zdOEeFsq1YAei52uSVYRyZseZvo=;
        b=T1rdBnL5NbF8y/7S9DrS6Z+WL301OPX+yQJ2ggioLzSChUsJVVCWU4ut8RM5nt+VS2
         ESlavEp+3Gv5J01y6V/iv2vf+HBfIRnEpF10oN5dq3aszcau7FwtrfOwGWfHub199oUT
         s/4VwO/sB98FmoJCtRFNXJV8gXjq+CYiK731zlp64IzpF0LpJDRLYXkeXEqaY4UtjLJs
         sIKOq4r7AWBb6f4L9f2TmLmzQsKtujrzNXkQTNbRxAzBAPeej94AuVFM73knqJwp+XXC
         K15h3j/yyZvz4MiRAWphmEdlNhcz4XIHQJAcfZyc+dZR5XLn00KpWV+wLocpoLxw/U7+
         UOfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EdI8crSv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c7c6da7sor13525016f8f.0.2025.01.07.00.53.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Jan 2025 00:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EdI8crSv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736239980; x=1736844780; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NB+uT1ZGTxOF5kMHAIvom8Vcx46Zc94qv30ZNIEEzFg=;
        b=EdI8crSvru8KBZlWncuAwXGUCKLrO7a6QM+kfqNyxfLnv4WBqczmt4R//cIMUsYyMY
         Iqy+5QXlECHR1xdtegW9eGfEjoAx43s7RKHWt2xy5toxfufjX7L20RW5A9TAVevEvgSw
         qzxVNZyHspmKoJNg6zr1qr4P/zN+P/cDbu5rNHkNWCEoDzvskB0yJuqiPT07JMeKgnQt
         c7giP985myMCXWk5E4tow4AzqrTwK3sXqXXP7DdsWFZhoS0yCAvCWD3SLx0wOM8EOtuP
         0Hgi85rnk9ZAEpvE+VSNRotoG0iqlWYN4LK3NJq11425pI9eH5GXMYuZL+FlceZupWHm
         0m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239980; x=1736844780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NB+uT1ZGTxOF5kMHAIvom8Vcx46Zc94qv30ZNIEEzFg=;
        b=ZXl5wcj72JgVUHjQtzaEF1xIJ9FFyaD4sY9yIkfF9LcipwohCkOmP38gB7h/zUt14l
         g2EPl5kDK8kojiri36vMZhtQmydMaalLqnz19gNryK0NX+6mnCqhoASwCGxsI+sILE2q
         hHrrLAcVkAn73QGTgARPYOOvkesH4m8Ca5pk6yzqXAlpZMUgJ/kjtdAJfu5KeKnRbJZu
         aBsRqGe7fa17wMveU5JDlmryMgSfCxrrr7c6dILobGo+1MDe51Sv7ihnUfQq4TdRbhVq
         JP8aC1BQ5sGIpz1VFmjiSyI6BoMvUOJriCUa3SEyIXhQOeodc7B/N/BMlSNtD7qj0Tht
         u62Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCVnhKl0uRg5BJr+0Q85OoxjbdmLHmTUpNdLCV+NSD6IsPEuh3XtHaqoWQFQ7jpd1u03Ioc0q42CpT3g==@linaro.org
X-Gm-Message-State: AOJu0YwZ9Ke6rAbjBbKKUNsNvORDw019Wth/M95BwWIVbY6yvvV2jqxD
	vhxz2lKRfd3Nhbb8dql54r+rA53I2TxueFfj11xRrQNeDNaNH2rUf75iWznSn84bHA==
X-Gm-Gg: ASbGncsDRLDjvbiUYNIDhwyAbdARE82TsntpsgIhHmedd1z0g/yUuMG1BabGcdHh1Ig
	kBhK/pdrup51FGnF3RFMsFPaAVI3bZ94f6DvCBb2BmQXF+kcvZkBlAe+jBtnDJDy8vTUTmAEolo
	8s1Z+OH9x0IfCb/mhfyZKQvBSL5QjEUQme4cdIfabFkKr/3j5CYp97J4K4N4ZXx7bYKGChP+n0d
	kCJOiimSpaHrjhsGv1TnSxAc1+6EUbl+NqgQfy1grVHcsDjjM4Y5eL7REu/LOkv8u6Yv9zADopo
	nBgmP2fabxPlRrAH1WiZzToU
X-Google-Smtp-Source: AGHT+IGEyVyNq5a2Wnkdu+r629fI1WgamG4iU5FgbMGgqzm6gCIUrl+9MuJpOE4efcSYTyRjNLQxag==
X-Received: by 2002:a5d:5e09:0:b0:385:e4a7:df09 with SMTP id ffacd0b85a97d-38a223f75fbmr67422383f8f.44.1736239980322;
        Tue, 07 Jan 2025 00:53:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1fa2bdfbsm49094454f8f.102.2025.01.07.00.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 00:52:59 -0800 (PST)
Message-ID: <061b3eae-8ca1-43a4-ac3b-2f8b4e66538c@linaro.org>
Date: Tue, 7 Jan 2025 09:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] qtest: Remove uses of 'first_cpu'
To: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20241211233727.98923-1-philmd@linaro.org>
 <5d2a536d-9b68-4b31-8d92-6cc42ed72e5c@linaro.org> <87msg884mn.fsf@suse.de>
 <05820c9b-a683-4eb4-a836-e97aa708d5e5@linaro.org>
 <3fb8281e-23f0-44a7-904b-34b8ea8ca7f3@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3fb8281e-23f0-44a7-904b-34b8ea8ca7f3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +vFUg0pEO+gn

On 7/1/25 09:03, Thomas Huth wrote:
> On 04/01/2025 00.48, Philippe Mathieu-Daudé wrote:
>> On 3/1/25 13:26, Fabiano Rosas wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> Hi Fabiano,
>>>>
>>>> On 12/12/24 00:37, Philippe Mathieu-Daudé wrote:
>>>>> Replace first_cpu->as by address_space_memory.
>>>>>
>>>>> Philippe Mathieu-Daudé (2):
>>>>>     system/qtest: Remove uses of 'first_cpu'
>>>>>     qtest/fuzz: Remove uses of 'first_cpu'
>>
>>>> Ping :)
>>>
>>> Hi!
>>>
>>> Good that you pinged, I thought you were looking into the test failures
>>> from v1. I copied you in this other thread that mentioned them as well:
>>>
>>> https://lore.kernel.org/r/87y10jctbd.fsf@suse.de
>>>
>>> Applying this series on top of master just now:
>>>
>>> Summary of Failures:
>>>
>>>   10/519 qemu:qtest+qtest-arm / qtest-arm/stm32l4x5_usart- 
>>> test               ERROR            1.40s   exit status 1
>>> 165/519 qemu:qtest+qtest-arm / qtest-arm/sse-timer- 
>>> test                     ERROR            0.40s   killed by signal 6 
>>> SIGABRT
>>> 185/519 qemu:qtest+qtest-arm / qtest-arm/stm32l4x5_exti- 
>>> test                ERROR            0.19s   exit status 1
>>> 187/519 qemu:qtest+qtest-arm / qtest-arm/stm32l4x5_rcc- 
>>> test                 ERROR            0.19s   exit status 1
>>> 515/519 qemu:qtest+qtest-arm / qtest-arm/microbit- 
>>> test                      TIMEOUT         60.01s   killed by signal 
>>> 15 SIGTERM
>>
>> Hmm interesting, I have a "quick-before-posting-series" set
>> of tests, and a "full-before-posting-pullreq" one. The quick
>> is quite extensive, but only include Aarch64. I thought, since
>> it contains the ARM targets, they would also be tested, but
>> no...
> 
> IIRC this was a deliberate decision once in the past to avoid double 
> testing: qtests_aarch64 in tests/qtest/meson.build does not include 
> qtest_arm, it's a separate set of tests indeed.
> 
> IMHO it's a little bit unfortunate, since in a couple of spots in the 
> CI, we are taking the shortcut of only adding aarch64-softmmu to the 
> target list, but not arm-softmmu.
> 
> Maybe we should add some logic to tests/qtest/meson.build so that if 
> arm-softmmu is not in target_dirs, we add the tests to qtests_aarch64 ?

I'm working in unifying both targets. With that in mind, optimizing
CI coverage doesn't seem a good use of our time IMHO, because once
I get there the CI will also be unified.
