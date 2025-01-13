Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2010160njn;
        Mon, 13 Jan 2025 12:15:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+eurr63LFXSuMv7Iy99BIMt3q5AVCci17tCH05YlqR5wTPcN4BwLGEJJYhra+XXhzpanZweSB30IgJA==@linaro.org
X-Received: by 2002:a05:6a20:258b:b0:1ea:e8a2:57d6 with SMTP id adf61e73a8af0-1eae8a25a82mr6970565637.14.1736799327231;
        Mon, 13 Jan 2025 12:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736799327; cv=none;
        d=google.com; s=arc-20240605;
        b=XZ7vGH+GqI+1qN7u3Y1R1WU0OF6KshzX+sornEK6N98JK8WN1WbiREb8LrQ2cT3NbC
         lv4HpyOnBGZyfkC3/o7/tpd7CzDAWET7UX6Kiy+UwwF8G7s/7z1wXPOz71GmJcZxg1rS
         8KoQyqx13M+vPT3beFcwWoIb0R0ZTgElmpvbSoycO/IzbiidUs0InsyO4yrTbe8PfTgK
         S54KYR8qplzCVBEEEC2E2LtbbEnfNqB3gXfpdTwwYyC+VgRrXVMJ0maTeZPuhqVFcp40
         EpcuaBoZCoFjUYNHhtm2q2HUA8D8I2XWPVPuZ8N2++eT00lbu9IS9MXgqe+o5vKOUeio
         1mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Jok5TFWkxjvFxrhDzJJepVefflGzTmcAaNlIEo8m5xA=;
        fh=bYDa9252Tq3tRHOYW6y/ngwvSfIGrzfTTP2G4VpRESs=;
        b=daWbSPFdyU/z1rdh1iKKGdvYRkli5rDWqM2/mhb+W2/JptXxm24D7guTN20Up+wX/M
         5nfFD2ZjpxQAcFL99nqr+yL/jMd5Hir5UhlqisEM7N7jKojhfPtWmJX4fJnK5v9mJRfr
         BVXWlSxfUaDyr6LtinHQOi0O8e8cPjyEa6E8mGOHYHE5z2d1LQfdINPb/R93HhTHCllw
         NZjANFQEpJ2d/hyarxZPWz1bz+e6uxoRmWG3i1jLyR5pvWjPQo/K2EXrDl8TijXdRpCP
         VED2VcQ++U9DGCmj7N/E9kQdueTxFgQUYfSYPph8tWmEUxmY0hKaaJ6pDPwciSo3Qwng
         PEkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FTmVAjJv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-a31ed5d5293sor5719591a12.7.2025.01.13.12.15.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Jan 2025 12:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FTmVAjJv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736799327; x=1737404127; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jok5TFWkxjvFxrhDzJJepVefflGzTmcAaNlIEo8m5xA=;
        b=FTmVAjJvC2YsKA2U0fsrZrCverWA0Z9kQ4v4gsu1U/vbP5sNU0PeaA3F9FMZoKMWaq
         mpHdBHSCKjCTe9OYUPL0ROPApVCQyRWIMVRa4EAH/p1w8kWUHHZl/rF/snNUGXyYCK5v
         WfmO/Weiy1DLg9werXaTj1eVMiS9841vssGZpCR11so2xPp2ioXDGClhXVW2e5tL4enR
         mRxncSL00DzbAGtCbkaCh9zQ6StMzzr0EdHnSiixLXg+e2J5q+Zk+DuqW87LVnjfG9q6
         oD9jfKx8qJq59LBTUbWh6h9ddaM2dD7wFIUXrmdRP831pfFOpFQguy/HQyS0d+MYtZU/
         2rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736799327; x=1737404127;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jok5TFWkxjvFxrhDzJJepVefflGzTmcAaNlIEo8m5xA=;
        b=lTo9/dodBWDNgBMSjoHO+KRY8yoKmxL1+yx+nApzojuzYEMFuY8j3gf8eOZTfGyqrT
         0LFw8I3DSPHyMCniGRZItFJ4C2Ief+8M30QoIvcyPVr3BZ5SBphxj5/nkHmwRO4FcdK1
         Mq3dYbNWfOpskArozC0Y6ovxLjPRtOkvi4Y9eM9Q+HG8ddlydCkpaxJC4jxn4Z9sHhyg
         cJonFxlm7+UbaDzsJImN7G5uchrAHa4hFbIgJZ1AJtIbQlsXEtD/oxuP6lrzBH4f+Rio
         jkE3315LSde6fSP8I9jsYTNSlEcdzJL5EI7NtFmpOvT/oU68o0okIbShMat5HoLDH8Qf
         9fQw==
X-Forwarded-Encrypted: i=1; AJvYcCWaTmQBtLSEdTlQgtff5Kt4F+hAh6PNYdoNFms49OgUNFC5V4/tID3fx660ct8vnP27ABq/MTnfFOSDBg==@linaro.org
X-Gm-Message-State: AOJu0Yxes/cxXir/a4S0gB2S10Ab8rOiTjzLIhKTiyQyiig28zGXPz6b
	CRtuwLsiQUT5TqnqfJ3c/rRriNJ2pRrjgiqHS+E+M1e/rp/94IPJHnBVuYoESo0GPw==
X-Gm-Gg: ASbGncve1iVbxPZsL0B0q5mvh1vPpXCxbmdfMkk1ssgwm72d0p1M1WGHY2/GL/MhSPT
	e/g+ouibiz6NKW1aQN1MIsv/Q1FPzCBG+SLkzeFDZgrUEYJD9BmI7bPuKzNjCXUVUlnpZrbZJ76
	M+8FR6ESIpV54Xm2bw+kgcM3znfj1yrfeT04y0ld/+Ja/h4MguROTB66Q87je+0jD3ecDFPCvVt
	WDd5W0cAZRbko5H3w9BQV/2gEt9/s7leGMhlV/rnzNXIvCeznCGIjnlE73JPVpeul72Ig==
X-Google-Smtp-Source: AGHT+IEYTN8ffsSwmjrHeZH3LsJjgfWnN96miImNiwji//eL24qr8ccl+q5r/Hs4nifik+zwzXAG3A==
X-Received: by 2002:a17:90a:da8e:b0:2ee:b0b0:8e02 with SMTP id 98e67ed59e1d1-2f5490ac09cmr31280515a91.28.1736799326695;
        Mon, 13 Jan 2025 12:15:26 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593fead5sm8185401a91.11.2025.01.13.12.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 12:15:26 -0800 (PST)
Message-ID: <a9b0cec7-2d2d-4f3c-8c07-588aed491920@linaro.org>
Date: Mon, 13 Jan 2025 12:15:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Change default pointer authentication algorithm on
 aarch64 to impdef
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
 <CAFEAcA_SHz2a0ZU=3e9AmZyJ_qn3e7nNhNm-hR9MdiTRjOyqWg@mail.gmail.com>
 <359e6921-fe3d-4f53-8ba9-5cf2b7ab6a6d@linaro.org>
In-Reply-To: <359e6921-fe3d-4f53-8ba9-5cf2b7ab6a6d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XUH9a9+z9N6C

On 1/13/25 11:32, Pierrick Bouvier wrote:
> On 1/13/25 04:34, Peter Maydell wrote:
>> On Fri, 10 Jan 2025 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
>>> <pierrick.bouvier@linaro.org> wrote:
>>>>
>>>> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
>>>> spent up to 50% of the emulation time running it (when using TCG).
>>>>
>>>> Switching to pauth-impdef=on is often given as a solution to speed up execution.
>>>> Thus we talked about making it the new default.
>>>>
>>>> The first patch introduce a new property (pauth-qarma5) to allow to select
>>>> current default algorithm.
>>>> The second one change the default.
>>>> The third one updates documentation.
>>>>
>>>> v2:
>>>> - ensure we don't break migration compatibility, by using a specific backward
>>>>     compatible property.
>>>> - added some documentation about migration for arm virt machine model.
>>>
>>> Other than a minor change to the 3rd docs patch which I'll note there:
>>> applied to target-arm.next, thanks.
>>
>> I just noticed that this series breaks 'make check-tcg', because
>> the pauth-3 test is explicitly checking the output of the
>> pointer-auth operation. I'm going to add in this patch, which
>> goes between patches 1 and 2 of this series:
>>
>> Author: Peter Maydell <peter.maydell@linaro.org>
>> Date:   Mon Jan 13 11:42:57 2025 +0000
>>
>>       tests/tcg/aarch64: force qarma5 for pauth-3 test
>>
>>       The pauth-3 test explicitly tests that a computation of the
>>       pointer-authentication produces the expected result.  This means that
>>       it must be run with the QARMA5 algorithm.
>>
>>       Explicitly set the pauth algorithm when running this test, so that it
>>       doesn't break when we change the default algorithm the 'max' CPU
>>       uses.
>>
>>       Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target
>> b/tests/tcg/aarch64/Makefile.softmmu-target
>> index d08d9b01ded..9c52475b7ae 100644
>> --- a/tests/tcg/aarch64/Makefile.softmmu-target
>> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
>> @@ -91,6 +91,9 @@ EXTRA_RUNS+=run-memory-replay
>>
>>    ifneq ($(CROSS_CC_HAS_ARMV8_3),)
>>    pauth-3: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
>> +# This test explicitly checks the output of the pauth operation so we
>> +# must force the use of the QARMA5 algorithm for it.
>> +run-pauth-3: QEMU_BASE_MACHINE=-M virt -cpu max,pauth-qarma5=on -display none
>>    else
>>    pauth-3:
>>           $(call skip-test, "BUILD of $@", "missing compiler support")
>>
>>
>> thanks
>> -- PMM
> 
> Thanks Peter.
> 
> I'm a bit surprised because I ran all tests , and didn't find any failure.
> 
> I use container 'debian-all-test-cross' and ran 'make check-tcg'. Is the
> container missing something that doesn't trigger this test?

I found that the build step I was using:
- ./configure $QEMU_CONFIGURE_OPTS
only builds user targets in this container.
But failing test is related to a system target.

I updated this on my side, to make sure I won't miss that next time.

Thanks again for the fix.

Regards,
Pierrick
