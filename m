Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2652822ejx;
        Wed, 13 Sep 2023 02:53:35 -0700 (PDT)
X-Received: by 2002:a05:600c:1e1d:b0:401:cdc1:ac82 with SMTP id ay29-20020a05600c1e1d00b00401cdc1ac82mr1575195wmb.9.1694598815790;
        Wed, 13 Sep 2023 02:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694598815; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKqmJkYsvozau3/NYJqmVUxXwq+EMK2nQePkN8nbqdFFE8T7MYdSmguI5O2INWifm7
         8wUQTr9dxwC9wOf6lvPJ0QBF1wfWFpSKLK5V2WFcoJkR16pUg1iyex6Z31J5/wBI21pD
         QQW7R84pXLkjQ+7HbjCKVjFAjr+EDxXhRIpVFXsYcfvHTTRDxREsbkobZvpBwiDnSPXA
         3QzxnDcVYAGFdbDWyA82K87ztmz00TPwEaMLzsQmpwzjfyUGUJK4SRGI5xT43gmCHmBo
         IlFFOl2zo/HG8hna/H+QO0UK76SoPK8XOXi2t0rkacMfccNH9LgCMLVMZe0Vv5wRe3hn
         QppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qaJgnI2fNP+ifpLovg9oTPWy/V4ht/mQlruyfCQW8jQ=;
        fh=/vn1dzHM2t1x/14wCGHa+9s7hcSK9Rx5kdngFItU+sw=;
        b=Xn6VUhTyDVrqIG0q2gGJ3lT68SLl4rwNH+S9XxJnN+KooPsvwHEMxwgHM70UlBX4Jz
         FrkgPFoJ50v7wUoqgZA6gXkYBpLvf0z47qFozeqM4mzZL8mOQimKxoiKVM8fRqnJiuUf
         a4fb0ETGUIi6vpWB0/nYW/kLHreQ7HKi6un+x3W6GMTEwatVu1Opje4NftCRbF6hXo+s
         wKSmzK4YlLuU85ucRyiQTPBtg4GavB1WKnYG8BuR9N0IuCwWgtBzTgzNVRf5KbW8cPGX
         5+u+rRoooiV8suQ5mF0XF48+rTDHdsyJTnyefBeSKMWrdgcNSpXjwJJUxYCgHr/bsMsw
         d9iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJbbCN4U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l21-20020a1c7915000000b003fc055c4420sor5091721wme.5.2023.09.13.02.53.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Sep 2023 02:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJbbCN4U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694598815; x=1695203615; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaJgnI2fNP+ifpLovg9oTPWy/V4ht/mQlruyfCQW8jQ=;
        b=nJbbCN4UIeKZAg7ynyAH5jKEc70mOijB3QGwHLNOjP+cmCwERc26lrtGmeIaacIfz3
         8ImWM/Ey5VCxYfODcmzJa4hhBgj18itnJEllLKOzTtqvdw5IcNdib/yiA1FSAC8VLXHX
         1hQmEN3zFYf3izv4Jyz7zAI5tL7KuBa0IFqo+4HMBFOxPyja3ZxtdZYsuHL0zf8B285f
         1gZRBOlfsa8QwITmjvHwTnSQktp+RfwTDHVDaZoxHjxDemLo2m2cea4WrcG+lstNzauM
         aRJiWSac4pcWVKI1uYO4ueyE0CTGr5G77JQOGT8gsyRFz+Kq+SGiZuXrqQMcGa0XpTdg
         JQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694598815; x=1695203615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaJgnI2fNP+ifpLovg9oTPWy/V4ht/mQlruyfCQW8jQ=;
        b=l5ymXM9TrxLEinBXxqcGMNSI5LERfRJeQ0qjyVORmmzhekjKxbIFzx9LpmFDa08LmH
         4R17jEvvAVtLtwm6rrgCQ627Za5cMyjBZgH5EL8yuKUrziFIbJ4cFiM79c2aMfBeyqzS
         5P7jbR321WUplvbacivADpdlrGNTpnhbm6cynnxR/XF3ECWACL2uRYCEDbwC9qP9EJjU
         DZYGkaR6hcq5P+fFBPnn/3Fk0QLEGp9lufJj2oAjkZqIsr90Ps4DT/FTZylumYKhgrqs
         EAzTtxeTHfslkkCjJ1tYmTFez0sGSWviZUlrSdLAdntZ+5qZxr+GzU1FIuHpukCcltJF
         Long==
X-Gm-Message-State: AOJu0YxsfP5zBuWjhUJ7TeANQ94L0zwQtJPLAmTEoCYA6MdSp7g0+M1w
	DWPbh6J1yqXJRHWNdMbJORbbVAD9
X-Google-Smtp-Source: AGHT+IE0VrgeqFKP/GROgRbuk+yrrpX48cV0/vEWXSFFnUk4hFGLqO0uMoWiQf5EUo7r1K9xMQLy0A==
X-Received: by 2002:a1c:7703:0:b0:401:cf0d:25ca with SMTP id t3-20020a1c7703000000b00401cf0d25camr1628026wmi.40.1694598815340;
        Wed, 13 Sep 2023 02:53:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-241.abo.bbox.fr. [176.131.211.241])
        by smtp.gmail.com with ESMTPSA id v9-20020a1cf709000000b003feeb082a9fsm1551011wmh.3.2023.09.13.02.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 02:53:34 -0700 (PDT)
Message-ID: <038e675f-7075-8dee-1d2d-584b410081d1@linaro.org>
Date: Wed, 13 Sep 2023 11:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
 <5cbb92ab-f8b5-4d03-5698-06d0a0b7cfda@redhat.com> <87ledatq3s.fsf@linaro.org>
 <2a8bc661-5fb0-f514-3ae5-4c6c9acb935f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2a8bc661-5fb0-f514-3ae5-4c6c9acb935f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T0RRfx4/mgc/

On 13/9/23 11:02, Thomas Huth wrote:
> On 13/09/2023 10.48, Alex Bennée wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 12/09/2023 20.41, Daniel P. Berrangé wrote:
>>>> This addresses
>>>>     https://gitlab.com/qemu-project/qemu/-/issues/1882
>>>> Which turned out to be a genuine flaw which we missed during merge
>>>> as the patch hitting master co-incided with the FreeBSD CI job
>>>> having an temporary outage due to changed release image version.
>>>> Daniel P. Berrangé (4):
>>>>     microbit: add missing qtest_quit() call
>>>>     qtest: kill orphaned qtest QEMU processes on FreeBSD
>>>>     gitlab: make Cirrus CI timeout explicit
>>>>     gitlab: make Cirrus CI jobs gating
>>>>    .gitlab-ci.d/cirrus.yml       | 4 +++-
>>>>    .gitlab-ci.d/cirrus/build.yml | 2 ++
>>>>    tests/qtest/libqtest.c        | 7 +++++++
>>>>    tests/qtest/microbit-test.c   | 2 ++
>>>>    4 files changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>
>>> Series
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> Alex, will you pick these up or shall I take them for my next PR?
>>
>> Queued to testing/next, thanks.
>>
>> Do you have a patch to disable the borked avacado tests? Or maybe I
>> should just include Philippe's fix?

As we discussed with Richard yesterday, the fix is not correct.

> I thought that Philippe mentioned that he wanted to provide a patch that 
> disables the broken tests?

Yes, I'm still discussing a bit more on the other thread:
https://lore.kernel.org/all/4e335f86-d075-4cc0-af5a-9dca9b3bf261@linaro.org/
