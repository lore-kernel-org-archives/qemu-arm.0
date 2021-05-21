Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1117015lfm;
        Fri, 21 May 2021 05:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKSluzwTrJ3VgUF9b6JrZnoNiZqPlsQz/u5+f6YC7TDBurC3BPl1//BU2r6SFYnRNoCVeU
X-Received: by 2002:a17:906:73d7:: with SMTP id n23mr10119669ejl.135.1621600300375;
        Fri, 21 May 2021 05:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621600300; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+OcZNGZq+Qwv31byXwKl4T5eP43e6nuHzyJL17oNTxJoVonhgOpbjug4xdX2u/Q52
         ZIwmN95h7MYP47ErPHfKM20RkyHc/LrANHeSP3orXKVKL7Jqmu/3Ga/5K6SnFwrbcXzr
         fyUw0p1/kjWcGmxCOz39THDRneT5ZXZdHMU/I9CxeqXvapnNs0WBw4M1zq8vcZZFdzE8
         2xyKoMjPSLwNQc7tF+z9Z2JhyYK9DxzRDUrnGugSAS8xJi19QxFXiw5jG3dDApTf85dg
         lZGpXWtLZwuETpaSHa419KaMaHZSzWrSXhil2/OslYM8X3mw/RGpiQkTaB1FivG1jtAn
         a7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IX7o9e7g186bTgNjwSBUpRldjeF3ty6TyquUxbjqPAw=;
        b=DJ0cPIbL26yMoC/QuoaftSPpIbPmE9cwKPhbDcN3h/FQIc7jFju8GgOn0WLlMRipeT
         wGDZbYilSTSmQOtgA9xkTFUwBHENjQ2UrYnm4Hig/TStk52i33UmmGAGxSTr8AZgb0lr
         /f8wF+nYlJbYo0xpJSz6vMrZCF5eVIRWApQSw4eLkwnPl5I7ZilKVfH09d7ueSPB2sy9
         LTYXli/qmmb2CWAxtKKMNE+wstTI/45BYtej9xQej4kyaRDmZrL4peJ3XVZviiO0hLVE
         +d5PJx1mVP1SutY+3vJfHFrmT0hROdauFcUxlwjCU8RhkRGlzCaQCTn+7iBLPhRIQIrr
         qe4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ICYDwLOf;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z4si1548983ejx.728.2021.05.21.05.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 05:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ICYDwLOf;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621600299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IX7o9e7g186bTgNjwSBUpRldjeF3ty6TyquUxbjqPAw=;
	b=ICYDwLOfGMNvAT/JlJGeGwLJiMnq6mtKi+e5UYiZwyJisxBO2feD5AhvcXnMWCFpZHrZQS
	ViT6Sk++EbDv2TikJ6WKCLIbXN/BS4/1nOUa+nfxeNJURnRqH6F26SugWvTJGRQbIvkDGn
	wgG4jH6yF0xA7v4tUN0ez8H4QIfsJTo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-VoJaUX6TMM6pAUHHM9LNgg-1; Fri, 21 May 2021 08:31:36 -0400
X-MC-Unique: VoJaUX6TMM6pAUHHM9LNgg-1
Received: by mail-wr1-f71.google.com with SMTP id 2-20020adf94020000b0290110481f75ddso9408689wrq.21
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 05:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IX7o9e7g186bTgNjwSBUpRldjeF3ty6TyquUxbjqPAw=;
        b=Shyafw+Yl6pkDTju6COALjf821LwcBGqBQIWheBNW6Na06Zu7Lj/x3LmAv5TANgOYG
         Bi0Ckbn7F4Wr/dPCMW4E7eE+9zxaNPn20VVNu4vFVACKPm1o61hgv1QmS9Xk+OgmxCRs
         0u+QaR9XOLvWgdCrGc0PJEbh/1N1dXvm3MOe669IXyFlx9K6QUgMqlMYi7nlImdaq1uM
         LwtICN320WsWo7fcMpkDgRfwJChL2qQMqpH8v2wZ+hWD0WWgpzOBXnUQrQpFCRH3GxLt
         zamInDU1xpAWLXt3Gm3RQkOpiB4cSrZ/MDd0mmqN5d6s2W0XkuF2CkeH4/Ox/AFCTXCs
         xzJw==
X-Gm-Message-State: AOAM532fyy9tGhfrucHpkevk7dsjOEbh0Jsi0PpW+87fSo+KuteoalZU
	mY1EpILiH7/+aeOSJ4G4hyHK4AtjR2EODlOTFBM1RPm1oMd1dLC97Sizdt9clZCJ1dXVoA9qcci
	uzYXpVdSpGqKRATtZx0KG4JxdFy/K1m3zE0UgL3Ehv1Q/ihtVvYeh7r/ZFV7xCegekg==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr8341605wmd.20.1621600294352;
        Fri, 21 May 2021 05:31:34 -0700 (PDT)
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr8341580wmd.20.1621600294069;
        Fri, 21 May 2021 05:31:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net. [83.51.215.31])
        by smtp.gmail.com with ESMTPSA id c194sm12719556wme.46.2021.05.21.05.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 05:31:33 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com>
Date: Fri, 21 May 2021 14:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Eh77g0AVIO1M

On 5/21/21 2:28 PM, Willian Rampazzo wrote:
> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 20/05/2021 22.28, Philippe Mathieu-Daudé wrote:
>>> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>>>> Conceptually speaking, acceptance tests "are a series of specific tests
>>>> conducted by the customer in an attempt to uncover product errors before
>>>> accepting the software from the developer. Conducted by the end-user rather
>>>> than software engineers, acceptance testing can range from an informal
>>>> “test drive” to a planned and systematically executed series of scripted
>>>> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
>>>> also refers to user's agreement in the final state of an implemented feature.
>>>> Today, QEMU is not implementing user acceptance tests as described by Pressman.
>>>>
>>>> There are other three possible terms we could use to describe what is currently
>>>> QEMU "acceptance" tests:
>>>>
>>>>    1 - Integration tests:
>>>>        - "Integration testing is a systematic technique for constructing the
>>>>           software architecture while at the same time conducting tests to
>>>>           uncover errors associated with interfacing. The objective is to take
>>>>           unit-tested components and build a program structure that has been
>>>>           dictated by design." [2]
>>>>        * Note: Sommerville does not have a clear definition of integration
>>>>          testing. He refers to incremental integration of components inside
>>>>          the system testing (see [3]).
>>
>> After thinking about this for a while, I agree with you that renaming the
>> "acceptance" tests to "integration" tests is also not a good idea. When I
>> hear "integration" test in the context of the virt stack, I'd rather expect
>> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
>> virt-manager on top and tests them all together. So we should look for a
>> different name indeed.
>>
>>>>    2 - Validation tests:
>>>>        - "Validation testing begins at the culmination of integration testing,
>>>>           when individual components have been exercised, the software is
>>>>           completely assembled as a package, and interfacing errors have been
>>>>           uncovered and corrected. At the validation or system level, the
>>>>           distinction between different software categories disappears. Testing
>>>>           focuses on user-visible actions and user-recognizable output from the
>>>>           system." [4]
>>>>        - "where you expect the system to perform correctly using a set of test
>>>>           cases that reflect the system’s expected use." [5]
>>>>        * Note: the definition of "validation testing" from Sommerville reflects
>>>>          the same definition found around the Internet, as one of the processes
>>>>          inside the "Verification & Validation (V&V)." In this concept,
>>>>          validation testing is a high-level definition that covers unit testing,
>>>>          functional testing, integration testing, system testing, and acceptance
>>>>          testing.
>>>>
>>>>    3 - System tests:
>>>>        - "verifies that all elements mesh properly and that overall system
>>>>           function and performance is achieved." [6]
>>>>        - "involves integrating components to create a version of the system and
>>>>           then testing the integrated system. System testing checks that
>>>>           components are compatible, interact correctly, and transfer the right
>>>>           data at the right time across their interfaces." [7]
>>>>
>>>> The tests implemented inside the QEMU "acceptance" directory depend on the
>>>> software completely assembled and, sometimes, on other elements, like operating
>>>> system images. In this case, the proposal here is to rename the current
>>>> "acceptance" directory to "system."
>>>
>>> Are user-mode tests using Avocado also system tests?
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>>
>> We've indeed got the problem that the word "system" is a little bit
>> overloaded in the context of QEMU. We often talk about "system" when
>> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-user
>> emulator binaries). For example, the "--disable-system" switch of the
>> configure script, or the "build-system" and "check-system" jobs in the
>> .gitlab-ci.yml file ... thus this could get quite confusing in the
>> .gitlab-ci.yml file afterwards.
> 
> I agree with you here. After I made the changes to the code, I noticed
> QEMU has the "system" word spread all over the place. That may confuse
> people looking at the "system tests" without much interaction with
> software testing terminology.
> 
>>
>> So I think renaming "acceptance" to "system" is especially ok if we only
>> keep the "softmmu"-related tests in that folder... would it maybe make sense
>> to add the linux-user related tests in a separate folder called tests/user/
>> instead, Philippe? And we should likely rename the current build-system and
>> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or so?
>>
> 
> As I mentioned in Philippe's reply, those tests are still considered
> system tests because system testing is the software built and
> interacting with external test artifacts in software engineering.
> 
>> Alternatively, what about renaming the "acceptance" tests to "validation"
>> instead? That word does not have a duplicated definition in the context of
>> QEMU yet, so I think it would be less confusing.
> 
> While at the beginning of your reply, I started thinking if
> "validation" would cause less confusion for the QEMU project. Although
> validation testing is a broader concept inside the Verification &
> Validation process, encompassing unit testing, functional testing,
> integration testing, system testing, and acceptance testing, it may be
> an option for the QEMU project.
> 
> While system testing would be the correct terminology to use, if it
> causes more confusion, using a less strict terminology, like
> validation testing, is valid, in my opinion.

This works for me:

- tests/system/softmmu
- tests/system/user

Or validation, as you prefer.

Thanks for sharing the background references,

Phil.
