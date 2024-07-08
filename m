Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2480792njb;
        Sun, 7 Jul 2024 21:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEWIYAqI59NTRvdAWHZB1qz5Gouj70LyXUHUwc3iUTzYWc9N1s4NAlfVh80pc1DJbOlizG9p8Y3hygWUf+GG2Xconx2Aub
X-Google-Smtp-Source: AGHT+IFNEUMjesbATecH9oiciLcWwFJ1G8k26LdKXK6maD/vjL3MhVW69YNeF0IekZ8goXfS0HjE
X-Received: by 2002:a05:6122:4d8b:b0:4ed:26:790a with SMTP id 71dfb90a1353d-4f2f3ecc6efmr11899406e0c.4.1720414784521;
        Sun, 07 Jul 2024 21:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720414784; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/x4IbZA4+MxLq8p8Wz5apXoy+B0FIYyYMidysmQmPWQ36Gna2/tlPwe0ILagczAu2
         H9HgxgbF+7POcvviiBPHGgivDTBvERV94d0ZlX6CxxAAe4LdcKgzdRaHeARPK2X3vtux
         uWkP5Aut8Lw9F03SKmzMvTrLPJbDITSG/YGEIFrKI+VylKvx9CTpUXc/ctYq2Ys0GZhQ
         zkuLt1GQ31gDIkjP6goOt0M9c5GmoN2oa5sYJaLLmQOU2B9fynXlH4Le0ON4n/P7kVKd
         YswZ4lUH9uYlFvvkTNzH9DFG/TkZQ5DxVk8BGKi6xMg7eTgjdj37/Tvl94IzEOWKTv3B
         f1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=F/0RLhDM/4YDCJv+vBrVEtlYZ2qvfBtaVkTs6xAgNns=;
        fh=UOQ647CUEhjeAfp3wKv+qFsTx6UeO76shW2c6hbOgJE=;
        b=dl8RN2mYPZh3DRz+ZuDNq4j1deuB6w2f7ncdnpgaN5pkVHg8KByGfzhAQHr97FW+Yj
         8W76utVw5ULRftpibdS+0FnKJIr593xmENS4yqAfG9PSeQIvvcgXvzWSW9cSUCxSStE4
         5YdAFNJX4gjowNFw5OJfN9Qw6RoLodgAz4LYY54bLdnW5vnSkirAgnhwNPqIEWnMh8Fx
         uqicosf/+8zLGzkX9U397rUZjr8O+h9P5rVHrr2iD2uPWoC3m4XMVZ8VUBwUREgdlZVV
         lAwEpHr1sgTfhfpOtZVX2Zg43D17NU9BxQw3/bn06J/STi6CADxv2fgl8MYTW4FITAnZ
         JmcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrX2XG4f;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-79d69339f9esi2152762885a.639.2024.07.07.21.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 21:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrX2XG4f;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720414784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F/0RLhDM/4YDCJv+vBrVEtlYZ2qvfBtaVkTs6xAgNns=;
	b=JrX2XG4fii8acdDUOLg7+liOlJ2aybn1aapGwSch+RF5dpPRE+O8pfXKOGxMFpryUTL4vw
	ijnpQVNJ8gMYpsTgQBZ9JWzMegC2UfESngmSSY0zUZsST8W+BmhugW/jPgwQNUwVDdu/8Q
	ONuOE12RyGnF/hqKY2wDu2prAH/8hmc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-MGBfc85GMla25bblPm_Neg-1; Mon, 08 Jul 2024 00:59:42 -0400
X-MC-Unique: MGBfc85GMla25bblPm_Neg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7275e17256so305878066b.0
        for <alex.bennee@linaro.org>; Sun, 07 Jul 2024 21:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720414781; x=1721019581;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/0RLhDM/4YDCJv+vBrVEtlYZ2qvfBtaVkTs6xAgNns=;
        b=wk5hH9IxzLhr8ODl8Qj8vol4/iUTn+Gi0cHOI2V40EFFcYCM1SKGd/Krk1WX//rtiW
         3ma/u/1+Ph6f3eBqVqrjBQR74qEU258sTmQDVU0cP3QulNeTXs+1/sO6Mm6i9IP8LIyB
         VGhFGVK51q8qdhOnMIBjbZ+KmtXR2galdBL/ds9nrolgPwag10gwBgX/kzmI3aA4/mAD
         6KntSci0qJdlUs4TGTSkipilfc9ujlFRC40QZROTdbJnr6p9QNfeSWKiwOeQdWCgksvT
         b4niOfvYveEQZBG2noOTw72FSzCcDiy/Oo2rUai6pVxIgS9xqCfmLz/e1iklYiW6YDg5
         WQCg==
X-Forwarded-Encrypted: i=1; AJvYcCXcsJw2czptB6aCc+OMN94Dim7uhfjr+hSBaHAfQB3aYm79xS0RZRNZp0hAsEUOW7nYr38m9Y//LfBYob8PsY778Zma95Uj
X-Gm-Message-State: AOJu0YzlCTMIwkUt1jI5r9d1Fz7kZMupOIOIjdxsndM02ys1x9aZsFRs
	i7vH2nT0iFUpoEeqx0tOC4vN6SRkaBF8FE56ioRFBe9jGL4ljmjHEwuwfHvwDrknhYCnrOFD6sh
	+9hpmjXgZnaW0enDbUAGVhyuvG3oR8jM5vQxNR9Ie9n+P3B/14m8nQg==
X-Received: by 2002:a17:906:5798:b0:a77:cc6f:e791 with SMTP id a640c23a62f3a-a77cc6fedbfmr504517066b.38.1720414781523;
        Sun, 07 Jul 2024 21:59:41 -0700 (PDT)
X-Received: by 2002:a17:906:5798:b0:a77:cc6f:e791 with SMTP id a640c23a62f3a-a77cc6fedbfmr504515166b.38.1720414781053;
        Sun, 07 Jul 2024 21:59:41 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-42-179-211.web.vodafone.de. [109.42.179.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1babesm898231166b.17.2024.07.07.21.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 21:59:40 -0700 (PDT)
Message-ID: <0edcf260-aec2-4ba3-a315-3c0438322147@redhat.com>
Date: Mon, 8 Jul 2024 06:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/40] gitlab: don't bother with KVM for TCI builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
 <15191eac-49f4-47bc-b450-1385b3d7fe18@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <15191eac-49f4-47bc-b450-1385b3d7fe18@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /Ng1kQtu27mO

On 05/07/2024 23.44, Philippe Mathieu-Daudé wrote:
> On 5/7/24 18:49, Thomas Huth wrote:
>> On 05/07/2024 18.34, Philippe Mathieu-Daudé wrote:
>>> On 5/7/24 10:40, Alex Bennée wrote:
>>>> In fact any other accelerator would be pointless as the point is to
>>>> exercise the TCI accelerator anyway.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>   .gitlab-ci.d/buildtest.yml   | 2 +-
>>>>   .gitlab-ci.d/crossbuilds.yml | 2 +-
>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>>>> index 425fc6479b..e3a0758bd9 100644
>>>> --- a/.gitlab-ci.d/buildtest.yml
>>>> +++ b/.gitlab-ci.d/buildtest.yml
>>>> @@ -635,7 +635,7 @@ build-tci:
>>>>       - TARGETS="aarch64 arm hppa m68k microblaze ppc64 s390x x86_64"
>>>>       - mkdir build
>>>>       - cd build
>>>> -    - ../configure --enable-tcg-interpreter --disable-docs 
>>>> --disable-gtk --disable-vnc
>>>> +    - ../configure --enable-tcg-interpreter --disable-kvm 
>>>> --disable-docs --disable-gtk --disable-vnc
>>>
>>> Shouldn't we also disable the other accelerators for completeness?
>>
>> No, this is a Linux machine, and there's only TCG and KVM available for 
>> Linux. No need to bother with the other accelerators here.
> 
> I noticed this is Linux. If for some reason the Xen libs get installed,
> Xen accel will be enabled. Explicit would be:
> 
> --enable-tcg --enable-tcg-interpreter --disable-kvm --disable-xen
> 
> But I won't insist. Anyhow Alex sent his pull request.

Oh, drat, I somehow only had the hvf and whpx accelerators in mind... You're 
right, --disable-xen is certainly a good idea here, too:

  https://gitlab.com/qemu-project/qemu/-/jobs/7281510036#L583

Mind to send a patch on top of the previous one?

  Thomas

