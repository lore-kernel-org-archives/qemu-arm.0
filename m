Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3430206njb;
        Tue, 9 Jul 2024 10:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkVrRirX1ztJih31WnwIFT4roDf7nyuw+47XVL7fMx8rZL+cN0JuekS9rcPzA7WCdZP7ykteWPF1kCPs2J/f19VS3GNjew
X-Google-Smtp-Source: AGHT+IEPvUaGiuM32f/NBfHRX9kmeqNTa/C1ybDsYu3rCN7ljxZU/e/1QIDZUP1GM3WclbAraxWB
X-Received: by 2002:ac8:5843:0:b0:446:61c0:a55c with SMTP id d75a77b69052e-447fa8ade08mr45527871cf.5.1720545508158;
        Tue, 09 Jul 2024 10:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720545508; cv=none;
        d=google.com; s=arc-20160816;
        b=nX8b4DdaWvDR0IcuungCfZmgRlM7AdbaIxaXWP3x7A8gYE0Au3wMP/Ezi58NDk9SLG
         vLdbselWRsdA4720bzH9UMVDlu4Zy3ASo5eNtwwhaRFlCXGvxc+vqfAY4EEcKVO9lcOW
         0mHa7i/3NlgOiZbs7zL1iOkWSeRtmNHCP091my9auuA6XvAJZgHhoCHnHAFc6t3ZqTy0
         p1AeZFS+u6skNrDA46sRWH9DF8wjEXV5YUW5LmnkCHQrUzz+ePjt6dghC8Bzz6MZVJTc
         CQiSKjfl4xc8uGquuJ0Z7xl+/AZYTRW6jxv+sOu660sEfT23MweJxOWOt5+iqn0FwVCl
         DFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=txWFpwGnvOu9QFzJiCC8zu5uRGQCIBjC/kvWz1kKaQA=;
        fh=XenqkMzY/InLzETkvNpaop0vY80hF9YZV5UZlXjSoao=;
        b=llQHdpsRlDmokM8hLBl1tUmOPRPwgc5QNTia8BDrrK/xMGdyTgigv9KjpQ2gcIMH8O
         BD3jztJTQw0Sc/RAkyAd7889GPlPVoHPjT/4cL2KlGStNKl5zBUPp6fgv7bW1nvtiPjq
         5VX+JD6Rw8+cjwiIy9joP9okORiipEv+WB96jbnb0kb/riy6+D5DswjBGrBfg8eiPgo8
         dx5fa60A28f72HpaI+LhqVaAFe6nYInc5KDSQbgb/tg1RU9bS5TdsmkM0Wd9Fb4MgF8s
         S2FgdWktkQyKSV2dZafnW2N0rnPynp/+Yb/YOACq7H7hZxktegp5ocKw4u7EGu4g+Wya
         vuCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bzGYXzu3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bdaccbsi25590651cf.532.2024.07.09.10.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bzGYXzu3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720545507;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txWFpwGnvOu9QFzJiCC8zu5uRGQCIBjC/kvWz1kKaQA=;
	b=bzGYXzu37bT0sr5xQXnMzPttdQbpQewsvmv9f0YTQVT0Pa3W8HJzUeMMM0eiuFsUsSSRfg
	9MgLNnrJVBLu1POR525uL7hfLtwMi71bOO0uA382UxY6R2+apn3+tpBWoRnP/DqXz5jRZp
	uJkZTO6ua7NO59oyR/HPEIrwHemgaHI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-IXFdIrxAOxqH3SuwmZ5ABw-1; Tue, 09 Jul 2024 13:18:26 -0400
X-MC-Unique: IXFdIrxAOxqH3SuwmZ5ABw-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3d923b2fe51so3634211b6e.2
        for <alex.bennee@linaro.org>; Tue, 09 Jul 2024 10:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720545504; x=1721150304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txWFpwGnvOu9QFzJiCC8zu5uRGQCIBjC/kvWz1kKaQA=;
        b=fnDvhP/a7alATulw/h8XjLF1ylLXkivxuITG6kQkblcuUSDUhPwqJw4GePyWihJpHO
         QFFz0dhfWnjDHr4pjfJItl2FSI6QGl4PCiiVdcAl4h1Rs5n5f2XUa+jdGiKtXkZCIjLi
         dso3rSEn+q8mzQObueVO7rkJDPiLZuji5AM59YOj7n5f1EP4d6XUlE87Yy78my9UFJq4
         qfJOqfmSk0zhNHpKIpbzUQygmWzR8XqWEhpOyuS/Bx4jz5wt3J5PV9WwMdyAxouLBeMr
         dbyK7H1JwgUUxpOOukI5nf2crg2ZuwBG8tmU+PYta+fSthnE6tsdlMRtzYFNdae5zee/
         ipbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtWhVrmBApal0b235RZhRUXMxW6G+iW7K675n98SkOCHDXYwCL2z9KScKrthbXcYkKo7gG6UIV3Qkb7aJ81lBT5hMYPXj/
X-Gm-Message-State: AOJu0YxeFUVep7tRmIlXoffjunpi4NLCdYvF9JrA4EK0YueST9eRxefV
	WCmf26lJ/FL8sV3gZd7QewNFGMlkd9k/rBE4kC+vfP3Cw0BR6D3+64y1XIDTJpE78P0AkHTlHuk
	UweGViBy2qrzOPti6W5lTIg9pz7wAqlqtWWwFTX8z7CYOe/xBLCSTATh1mcU0MQ==
X-Received: by 2002:a05:6808:140c:b0:3d9:2d9c:8aff with SMTP id 5614622812f47-3d93c085d8cmr3345135b6e.45.1720545504676;
        Tue, 09 Jul 2024 10:18:24 -0700 (PDT)
X-Received: by 2002:a05:6808:140c:b0:3d9:2d9c:8aff with SMTP id 5614622812f47-3d93c085d8cmr3345103b6e.45.1720545504247;
        Tue, 09 Jul 2024 10:18:24 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f1902909asm114532285a.58.2024.07.09.10.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 10:18:23 -0700 (PDT)
Message-ID: <f36223a9-3db4-41be-81ef-b472cd34b607@redhat.com>
Date: Tue, 9 Jul 2024 19:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU introspection
 test if missing
To: Alexandru Elisei <alexandru.elisei@arm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, pbonzini@redhat.com,
 drjones@redhat.com, thuth@redhat.com, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com, maz@kernel.org,
 Anders Roxell <anders.roxell@linaro.org>,
 Andrew Jones <andrew.jones@linux.dev>, "open list:ARM"
 <kvmarm@lists.linux.dev>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-2-alex.bennee@linaro.org> <Zoz7sQNoC9ePXH7w@arm.com>
 <CAFEAcA-LFtAi0DkFGc0Q3TYR_+X3TUWQru8crhbKun4EHctcdQ@mail.gmail.com>
 <87ed82slt8.fsf@draig.linaro.org> <Zo1RvCdNDhaZHKMb@arm.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zo1RvCdNDhaZHKMb@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: O/nKNni8bGrC

Hi,

On 7/9/24 17:05, Alexandru Elisei wrote:
> Hi,
>
> On Tue, Jul 09, 2024 at 03:05:07PM +0100, Alex Bennée wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Tue, 9 Jul 2024 at 09:58, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>>>> Hi,
>>>>
>>>> On Tue, Jul 02, 2024 at 05:35:14PM +0100, Alex Bennée wrote:
>>>>> The test for number of events is not a substitute for properly
>>>>> checking the feature register. Fix the define and skip if PMUv3 is not
>>>>> available on the system. This includes emulator such as QEMU which
>>>>> don't implement PMU counters as a matter of policy.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Cc: Anders Roxell <anders.roxell@linaro.org>
>>>>> ---
>>>>>  arm/pmu.c | 7 ++++++-
>>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arm/pmu.c b/arm/pmu.c
>>>>> index 9ff7a301..66163a40 100644
>>>>> --- a/arm/pmu.c
>>>>> +++ b/arm/pmu.c
>>>>> @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_at_64bits) {}
>>>>>  #define ID_AA64DFR0_PERFMON_MASK  0xf
>>>>>
>>>>>  #define ID_DFR0_PMU_NOTIMPL  0b0000
>>>>> -#define ID_DFR0_PMU_V3               0b0001
>>>>> +#define ID_DFR0_PMU_V3               0b0011
>>>>>  #define ID_DFR0_PMU_V3_8_1   0b0100
>>>>>  #define ID_DFR0_PMU_V3_8_4   0b0101
>>>>>  #define ID_DFR0_PMU_V3_8_5   0b0110
>>>>> @@ -286,6 +286,11 @@ static void test_event_introspection(void)
>>>>>               return;
>>>>>       }
>>>>>
>>>>> +     if (pmu.version < ID_DFR0_PMU_V3) {
>>>>> +             report_skip("PMUv3 extensions not supported, skip ...");
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>> I don't get this patch - test_event_introspection() is only run on 64bit. On
>>>> arm64, if there is a PMU present, that PMU is a PMUv3.  A prerequisite to
>>>> running any PMU tests is for pmu_probe() to succeed, and pmu_probe() fails if
>>>> there is no PMU implemented (PMUVer is either 0, or 0b1111). As a result, if
>>>> test_event_introspection() is executed, then a PMUv3 is present.
>>>>
>>>> When does QEMU advertise FEAT_PMUv3*, but no event counters (other than the cycle
>>>> counter)?
>> The other option I have is this:
>>
>> --8<---------------cut here---------------start------------->8---
>> arm/pmu: event-introspection needs icount for TCG
>>
>> The TCG accelerator will report a PMU (unless explicitly disabled with
>> -cpu foo,pmu=off) however not all events are available unless you run
>> under icount. Fix this by splitting the test into a kvm and tcg
>> version.
> As far as I can tell, if test_event_introspection() fails under TCG without
> icount then there are two possible explanations for that:
>
> 1. Not all the events whose presence is checked by test_event_introspection()
> are actually required by the architecture.
>
> 2. TCG without icount is not implementing all the events required by the
> architecture.
>
> If 1, then test_event_introspection() should be fixed. I had a look and the
> function looked correct to me (except that the event name is not INST_PREC,
> it's INST_SPEC in the Arm DDI0487J.A and K.a, but that's not relevant for
> correctness).
>
> From what I can tell from what Peter and you have said, explanation 2 is the
> correct one, because TCG cannot implement all the required events when icount is
> not specified. As far as test_event_introspection() is concerned, I consider
> this to be the expected behaviour: it fails because the required events are not
> implemented. I don't think the function should be changed to work around how
> QEMU was invoked. Do you agree?
>
> If you know that the test will fail without special command line parameters when
> accel is TCG, then I think what you are suggesting looks correct to me: the
> original test is skipped if KVM is not present, and when run under TCG, the
> correct parameters are passed to QEMU.
This looks sensible to me too

Eric
>
> Thanks,
> Alex
>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> 1 file changed, 8 insertions(+)
>> arm/unittests.cfg | 8 ++++++++
>>
>> modified   arm/unittests.cfg
>> @@ -52,8 +52,16 @@ extra_params = -append 'cycle-counter 0'
>>  file = pmu.flat
>>  groups = pmu
>>  arch = arm64
>> +accel = kvm
>>  extra_params = -append 'pmu-event-introspection'
>>  
>> +[pmu-event-introspection-icount]
>> +file = pmu.flat
>> +groups = pmu
>> +arch = arm64
>> +accel = tcg
>> +extra_params = -icount shift=1 -append 'pmu-event-introspection'
>> +
>>  [pmu-event-counter-config]
>>  file = pmu.flat
>>  groups = pmu
>> --8<---------------cut here---------------end--------------->8---
>>
>> which just punts icount on TCG to its own test (note there are commented
>> out versions further down the unitests.cfg file)
>>
>> -- 
>> Alex Bennée
>> Virtualisation Tech Lead @ Linaro
