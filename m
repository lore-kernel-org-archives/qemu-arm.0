Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1207704lfm;
        Fri, 21 May 2021 07:18:56 -0700 (PDT)
X-Received: by 2002:adf:f907:: with SMTP id b7mr9737691wrr.357.1621606736488;
        Fri, 21 May 2021 07:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621606736; cv=none;
        d=google.com; s=arc-20160816;
        b=K6ynyNdun/NzGTQ4d55Agzr8u7e+yur29/J8X98Zb4LAuXHbBUedbdutvbA5qjsInL
         gwh24u8jhTSWXw1rnHClQC66D2j+IFeFniO6mfozs5LJ9Qqf8CvA/L7cmTZMzYG9Pqjh
         C06X0qohbVbTk0yA+dso+C7kYc0ESuajrNpMf6nb+sktYUsPTxc8Q1Xldnf05n7fHSkS
         TCcXPjzna+8mYeas8oCV1gINE+Q4OQXy/QdjE0oq0+yIJ2vakAvTEV5FweeCC38sW1zC
         aud/BPebY5n2PqVSEVdmWu7ceGh+NqV7iNeP63Nyqmij82lH47h3RL3DsZZxAlvtCDQr
         Zt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=qBE1vxre3jYJiNov21DSebxkYu9szsjnQiy5QjABJT4=;
        b=L/S0aHy+qtNzUMRDmLfXQlAOsOg1t8fB4xtyokPf0G/t142QpMjl/a430B7lAblHFG
         flJ6S2YZZU/FC1W7ty2vGfDoy2tEHzpscPNvmIfZI6ra1gbWMy0wffj5yh25mG+e7Drc
         owd7gbiVJt4sq7XqeaZ3IYOSkX0uOBYDgw5ZfF9ZkEapsIaZ2STWUlfaaO/OzFF0gV6d
         xpiYKm/eCZAolUwR06t9puafeLPgsaXFyqlY4bRHARyQ34dhEcCPtm66hAx13kxjEyEM
         MWoNRxiTnr3hYJIZEGiBdeSktaJlLFxJ1T+58o+4gluvGqTFMohYknbx7olwUy6GRx5t
         N0kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qteOA93L;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c2sor3501293wml.1.2021.05.21.07.18.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 May 2021 07:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qteOA93L;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qBE1vxre3jYJiNov21DSebxkYu9szsjnQiy5QjABJT4=;
        b=qteOA93L6bbpDuUL2+dpOwtJYcEDIh0efXJiIBeX0YvJ6xVbK1hn8KWbI+gCgfhKd/
         4edXjQXSaqVX+DQoDv2maYXxp12ytkeWtSOrED5JoVHNmWRhc+1SIyl/wx70cTD/FGte
         ZJPmn5KMWxEgMSQxmdUyhlqIK5DXop50+1/ss3LnGaTylpmDu+bfhjJ3imuqM6PTZmLK
         zNzXf9mJA1kC1JW7nppxHlUNZy0eJTDRlexvDVvWwQqgH0nzyOn+NAduTnqxxuFE5WDp
         BjQa0N+ucB39e1kLKCuppWJfZ9+BxvnaKebnNb+1AHOPk9ScVNdN+5Xtzbd2LK9Zkx7I
         omLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qBE1vxre3jYJiNov21DSebxkYu9szsjnQiy5QjABJT4=;
        b=rpZ1uDZI/qmYN8G0MprXIDXLrFj9lrD7UjANjtBTrh9YmcA/pRrB+qyign2xNBzpm7
         UhTx5UrfsPZYWDaly+1goo4RqfNKcIvWI7QSRkhZrDuqrmEPGvFvEjIfAZ4QpO881Euh
         1SsupeXQ2gQl9M9Z0d6hmzThzqoVjLnDZn9LRr9YVSGUPOiPtw/pKR32ztNZC+xlIFnS
         5UnZh6+O9izyqvGNYR+JWd/+YQstXT3YY+ULonU4UBHT01fClMVkiegtXWtegzIzr/gG
         cGDXEtN+B/eiLV6bkmi3KPF8Wk58KJsU97dYafcj7OYTvtkTQDa7nOE1OUKInVK7NilF
         xpXA==
X-Gm-Message-State: AOAM532R0GsOSVJ4lBy423flQFZwY7K4HuaKzcYSlZpa+G00Qj2kw6xu
	aQPpnUL7YqAy7ShRI273v6g=
X-Google-Smtp-Source: ABdhPJwOI1OOX5PK/xtsmjYPNnhCxP8fCCf8eeXnB44dRS/KGN6bzHtNd4qUrAXl/lXEkguToKxRZA==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id n15mr1628996wmq.107.1621606736132;
        Fri, 21 May 2021 07:18:56 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net. [83.51.215.31])
        by smtp.gmail.com with ESMTPSA id z5sm2356516wrn.69.2021.05.21.07.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 07:18:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
Date: Fri, 21 May 2021 16:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg2gb5lf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Wloi1GtJUPZX

On 5/21/21 3:03 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>> On 5/21/21 2:28 PM, Willian Rampazzo wrote:
>>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 20/05/2021 22.28, Philippe Mathieu-Daudé wrote:
>>>>> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>>>>>> Conceptually speaking, acceptance tests "are a series of specific tests
>>>>>> conducted by the customer in an attempt to uncover product errors before
>>>>>> accepting the software from the developer. Conducted by the end-user rather
>>>>>> than software engineers, acceptance testing can range from an informal
>>>>>> “test drive” to a planned and systematically executed series of scripted
>>>>>> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
>>>>>> also refers to user's agreement in the final state of an implemented feature.
>>>>>> Today, QEMU is not implementing user acceptance tests as described by Pressman.
>>>>>>
>>>>>> There are other three possible terms we could use to describe what is currently
>>>>>> QEMU "acceptance" tests:
>>>>>>
>>>>>>    1 - Integration tests:
>>>>>>        - "Integration testing is a systematic technique for constructing the
>>>>>>           software architecture while at the same time conducting tests to
>>>>>>           uncover errors associated with interfacing. The objective is to take
>>>>>>           unit-tested components and build a program structure that has been
>>>>>>           dictated by design." [2]
>>>>>>        * Note: Sommerville does not have a clear definition of integration
>>>>>>          testing. He refers to incremental integration of components inside
>>>>>>          the system testing (see [3]).
>>>>
>>>> After thinking about this for a while, I agree with you that renaming the
>>>> "acceptance" tests to "integration" tests is also not a good idea. When I
>>>> hear "integration" test in the context of the virt stack, I'd rather expect
>>>> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
>>>> virt-manager on top and tests them all together. So we should look for a
>>>> different name indeed.
>>>>
>>>>>>    2 - Validation tests:
>>>>>>        - "Validation testing begins at the culmination of integration testing,
>>>>>>           when individual components have been exercised, the software is
>>>>>>           completely assembled as a package, and interfacing errors have been
>>>>>>           uncovered and corrected. At the validation or system level, the
>>>>>>           distinction between different software categories disappears. Testing
>>>>>>           focuses on user-visible actions and user-recognizable output from the
>>>>>>           system." [4]
>>>>>>        - "where you expect the system to perform correctly using a set of test
>>>>>>           cases that reflect the system’s expected use." [5]
>>>>>>        * Note: the definition of "validation testing" from Sommerville reflects
>>>>>>          the same definition found around the Internet, as one of the processes
>>>>>>          inside the "Verification & Validation (V&V)." In this concept,
>>>>>>          validation testing is a high-level definition that covers unit testing,
>>>>>>          functional testing, integration testing, system testing, and acceptance
>>>>>>          testing.
>>>>>>
>>>>>>    3 - System tests:
>>>>>>        - "verifies that all elements mesh properly and that overall system
>>>>>>           function and performance is achieved." [6]
>>>>>>        - "involves integrating components to create a version of the system and
>>>>>>           then testing the integrated system. System testing checks that
>>>>>>           components are compatible, interact correctly, and transfer the right
>>>>>>           data at the right time across their interfaces." [7]
>>>>>>
>>>>>> The tests implemented inside the QEMU "acceptance" directory depend on the
>>>>>> software completely assembled and, sometimes, on other elements, like operating
>>>>>> system images. In this case, the proposal here is to rename the current
>>>>>> "acceptance" directory to "system."
>>>>>
>>>>> Are user-mode tests using Avocado also system tests?
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>>>>
>>>> We've indeed got the problem that the word "system" is a little bit
>>>> overloaded in the context of QEMU. We often talk about "system" when
>>>> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-user
>>>> emulator binaries). For example, the "--disable-system" switch of the
>>>> configure script, or the "build-system" and "check-system" jobs in the
>>>> .gitlab-ci.yml file ... thus this could get quite confusing in the
>>>> .gitlab-ci.yml file afterwards.
>>>
>>> I agree with you here. After I made the changes to the code, I noticed
>>> QEMU has the "system" word spread all over the place. That may confuse
>>> people looking at the "system tests" without much interaction with
>>> software testing terminology.
>>>
>>>>
>>>> So I think renaming "acceptance" to "system" is especially ok if we only
>>>> keep the "softmmu"-related tests in that folder... would it maybe make sense
>>>> to add the linux-user related tests in a separate folder called tests/user/
>>>> instead, Philippe? And we should likely rename the current build-system and
>>>> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or so?
>>>>
>>>
>>> As I mentioned in Philippe's reply, those tests are still considered
>>> system tests because system testing is the software built and
>>> interacting with external test artifacts in software engineering.
>>>
>>>> Alternatively, what about renaming the "acceptance" tests to "validation"
>>>> instead? That word does not have a duplicated definition in the context of
>>>> QEMU yet, so I think it would be less confusing.
>>>
>>> While at the beginning of your reply, I started thinking if
>>> "validation" would cause less confusion for the QEMU project. Although
>>> validation testing is a broader concept inside the Verification &
>>> Validation process, encompassing unit testing, functional testing,
>>> integration testing, system testing, and acceptance testing, it may be
>>> an option for the QEMU project.
>>>
>>> While system testing would be the correct terminology to use, if it
>>> causes more confusion, using a less strict terminology, like
>>> validation testing, is valid, in my opinion.
>>
>> This works for me:
>>
>> - tests/system/softmmu
>> - tests/system/user
>>
>> Or validation, as you prefer.
> 
> So what are tests/tcg if not user tests? They *mostly* test
> linux-user emulation but of course we have softmmu tests in there as
> well. 

I expect a tests/tcg/ to check a specific TCG feature, which doesn't
have to be user-mode specific (IIRC Xtensa does some sysemu checks).
Also, you control the compiler toolchain, flags, etc... so you can
adapt for a specific feature bit to test, use kludges and so on.

I expect tests in tests/system/ (user/softmmu) to user real-world
binaries, which we aren't modifying. Sometime non-public/released
compiler toolchain has been used.

See for example the test referred tests the bFLT loader (beside
testing userland Linux binary for Cortex-M).

Another example is the Sony PlayStation2 binary testing the
O32 ABI and multiple opcodes from the TX79 SIMD core:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782493.html

Personally I'm not interested in writing a test for a loader or
multiple opcodes when we have pre-built binaries. For the opcodes
coverage I'd use a TCG plugin to confirm the opcodes have been
used.

If you think these tests belong to tests/tcg/, I am OK to put
them they, but I don't think adding the Avocado buildsys
machinery to the already-complex tests/tcg/ Makefiles is going
to help us...

Regards,

Phil.
