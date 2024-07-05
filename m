Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1469390njb;
        Fri, 5 Jul 2024 14:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhDnvfTy77BzNavPyd00zRYcqMWBQkE7IEyMphjX6CIB7G/lQBNEf3/zlWg1w9fdMPEReHRW+ajmbhAY9kjYUuhzpUfD0W
X-Received: by 2002:a05:600c:3509:b0:425:7ac6:970d with SMTP id 5b1f17b1804b1-4264a3f3ddfmr39251795e9.28.1720215880583;
        Fri, 05 Jul 2024 14:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720215880; cv=none;
        d=google.com; s=arc-20160816;
        b=e3AJ+gGcqvlbTt74qLZ87riqNh1sp5X99AK1hs+SFv3Xkn4U8oEy8meFUNkOcZKxty
         R5+6wAqvYnYIG+MQR/SPJJHXOSLat325eGJYZ6N9o80crWITuMkwGiilSXdan8u1r0gW
         LoE1d40r7b+DYaNl2NOdZZ5vc5lV4sAOId0Wh7zGdhZYXzFa+qNfraF0mQll6ST7SGSJ
         o7TdTh536+ZJlonaQefZbINxO7g4XPmnFBoQwQmQLHBvrwzUBeRPHipoTOpw+VzzMH0J
         VCVay54U0BfP7WWcAOqp62lYk1ddTIrh39XqWRwSjned9DT4xb05AOfRwWp5O5YtnSLC
         QKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YmMguUuvinPCPU7WQXG5jWn/+aZ22Fyg2tEU+UTesOs=;
        fh=6T2IEchkQps5Jp4tLbSA4nYf46rBDwQp7FStl5zwxYs=;
        b=TRL9+i8lGYvQoEOsGUxYzVG7FqNNvmOnpgixD8aeC1+FemeC8Uqr7EsqTfvIp+cd7z
         iNYBYJC9qPgzKwcCww9sJccxmDneUZRZ//5k7zE9TB8jvmdyNyIcO6kbJeBztTegsSwf
         r5Pc849/+IEan00XtS9mDj9gHjvJpGLTbxr/c6jPDWyEmZfFBN4jdR5E6bcRrDaEtTlq
         XB3XMzL1juZ6WwkqJHC8sQOrJy8YqYlJLfHg5WXnOcP86b6iQmXaZ2gaPVqOqILIjkMB
         G7LEwJx5mJGqQjBF0C/LNde6za5q2EOBpuIvmgxxRiqHyDw7F/VmTP15OIRGSzJeilQh
         GEIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HkOiPFxX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42577bb5776sor39327855e9.12.2024.07.05.14.44.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 14:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HkOiPFxX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720215880; x=1720820680; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmMguUuvinPCPU7WQXG5jWn/+aZ22Fyg2tEU+UTesOs=;
        b=HkOiPFxXHX1xM0Ed91T5tJS3HYBdCQPc/cXUFE6aFajWE6jjvLyWtFmE+UEDh5E2m9
         5EmicjYiFL0pAlRMWndQP6H7jauLrte+2Ug/YRWE9MBxxxLE09SAJIuOriqWxIL+f0hR
         46LZpc+fyWLtYmHGO48OPKDp+8dBORxXqow9Qu63tunqmWTruaYLotpNM9QSfWpw/zJ0
         henisREVT8a5CWDGjZHtNlVRSNZUgtGIx0g7ycEFvoPD5fHgGFK/5SH67p5hHzVTC8Qa
         8T7h1PUluvA+Fy5SClHcYH5TOX9qL5Cj9aYBuzkIld94j1NQM3DdZoHMGzKsAXBtQisv
         PTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720215880; x=1720820680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmMguUuvinPCPU7WQXG5jWn/+aZ22Fyg2tEU+UTesOs=;
        b=XQBRtb/N7Aanozxlccb7Vfc2lI7svjs4phpjIs1DDVRgQc+SYoXNRfVz+vPiRgrXPr
         oOpwI2dtcbvEjogQeyDnSO9UcyxVfDf3PY1yqHT+VqJNDhg3iagiWdXUImbdLk8ksP5Z
         a2Yr/nEbztAO4hO5pkfeRiBc8lusuhdA3RFrJI7raV7BVxaxkqGJ3DsKURUrvCsU/pQH
         Jw6Y2k8bOtoaRStHwefqJjZWTQIzyEpd/aT7dJTBG0YyY0fxqXkYdW0+6CdJDxyHTK96
         C6GBgf8j0sgfMHIkC+6QjkC3vhDzadfukxoATunFrCW0p+VKhGo7leG3q7n9m3uY2Pxm
         5g9A==
X-Forwarded-Encrypted: i=1; AJvYcCX7QPAh5PJS4S2T6gkGEZw0Br9FJtZtIfvBFHY5c8e207uyD1akYBoF40KhUD7rTgb8eHKj8Zd30cZpEBwnuMI5g+ov7Aad
X-Gm-Message-State: AOJu0YyDKnN/zD08yMNhfUySg3ROBwK+gg0Ytma7QS2IqThe8aDuU2MB
	rr0cVUnAv+20rC/6ad1IMXAv0h3OfziflJKOxlYQnRWfbi9GLXwVeNscPeSwpAbuNA==
X-Google-Smtp-Source: AGHT+IHDzAb6ryJHXJeNFQWFcHSZbnDG/ppl4K+087u4JJX6oM5L5km14hJfgv3Whd8D5BeGIhP4/g==
X-Received: by 2002:a05:600c:331b:b0:426:5fbc:f319 with SMTP id 5b1f17b1804b1-4265fbcf850mr75635e9.33.1720215879384;
        Fri, 05 Jul 2024 14:44:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.163.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678eb6593bsm9034405f8f.93.2024.07.05.14.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 14:44:38 -0700 (PDT)
Message-ID: <15191eac-49f4-47bc-b450-1385b3d7fe18@linaro.org>
Date: Fri, 5 Jul 2024 23:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/40] gitlab: don't bother with KVM for TCI builds
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Aleksandar Rikalo <arikalo@gmail.com>,
 Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
 <20240705084047.857176-21-alex.bennee@linaro.org>
 <07195265-2a54-4396-9724-2a63c98e45fb@linaro.org>
 <5d3be228-1dbb-4e4a-8e20-fb76e4c90134@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <5d3be228-1dbb-4e4a-8e20-fb76e4c90134@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JrnuCzogSCqs

On 5/7/24 18:49, Thomas Huth wrote:
> On 05/07/2024 18.34, Philippe Mathieu-Daudé wrote:
>> On 5/7/24 10:40, Alex Bennée wrote:
>>> In fact any other accelerator would be pointless as the point is to
>>> exercise the TCI accelerator anyway.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   .gitlab-ci.d/buildtest.yml   | 2 +-
>>>   .gitlab-ci.d/crossbuilds.yml | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>>> index 425fc6479b..e3a0758bd9 100644
>>> --- a/.gitlab-ci.d/buildtest.yml
>>> +++ b/.gitlab-ci.d/buildtest.yml
>>> @@ -635,7 +635,7 @@ build-tci:
>>>       - TARGETS="aarch64 arm hppa m68k microblaze ppc64 s390x x86_64"
>>>       - mkdir build
>>>       - cd build
>>> -    - ../configure --enable-tcg-interpreter --disable-docs 
>>> --disable-gtk --disable-vnc
>>> +    - ../configure --enable-tcg-interpreter --disable-kvm 
>>> --disable-docs --disable-gtk --disable-vnc
>>
>> Shouldn't we also disable the other accelerators for completeness?
> 
> No, this is a Linux machine, and there's only TCG and KVM available for 
> Linux. No need to bother with the other accelerators here.

I noticed this is Linux. If for some reason the Xen libs get installed,
Xen accel will be enabled. Explicit would be:

--enable-tcg --enable-tcg-interpreter --disable-kvm --disable-xen

But I won't insist. Anyhow Alex sent his pull request.

Regards,

Phil.
