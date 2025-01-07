Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp12257220njk;
        Tue, 7 Jan 2025 00:03:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2xrtW4om82UsS8+GpMt7K/G5oxq+xt7Fcv22Fa9X5j7CpmL5MqKzU2uSGb94194GYDgsQeOo3guQ+iQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFWFhA7yybmXlbTnYJhh+0UVfoWfHoH9c5/zonBxJH5xvCIYb3n1/NsVSRDmJkwXterahKt
X-Received: by 2002:a05:6a00:8087:b0:71e:21:d2d8 with SMTP id d2e1a72fcca58-72abdd7c3aamr79850484b3a.7.1736236991973;
        Tue, 07 Jan 2025 00:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736236991; cv=none;
        d=google.com; s=arc-20240605;
        b=DHeGy/EoxrEHhFB6J7/KONwfosolT77Ydf2YrS/dttBCgLvOmyye2hl2fhUdETyXVP
         P8JeMHdyQp7lpYgXS5IfGdV8TdwLtF8kQ+oWkc6k93SJfwDSvRSel5pIiofi688vCCdS
         CW8+CEzT5gcXRiiWuRCDD0gpdC19+iG313FH70glhJb3qjI4b6lKMqjT4zKk/q/Whv7I
         SoQcNr/gGmH6EV57qF4bLdJf5YNn/8C1/K56KMhlXo5RMCr2wqbX9UC8fbrI6bQLSUgQ
         fvuI7Z4C5f46mq48qTA6mtl75N+5OV9wgVI3CkyKcdkHzOZ+3GvGGcDMHnl9tAVjdHzl
         bqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=wiMOOHV60q4eXagNMIOLvNFV+qq1RGRo7TL5T/ORWco=;
        fh=2RO8K0C+7qdnrToNMfADzswy6Cfksh+Q7yXeSQAo5TA=;
        b=chDqg1fmKqRv9UTHcKo4L4kdnvnojRMmAOvjK3jKD4KGg0hE9Xllb9CXoFt+y8HTdJ
         7yr+/9HrDNEk0MzRie7zKiaAuYBPRMpVjPGjVM/p2+pP2fg7IEQFhU6q8MLrWcSa9+xc
         oVaa8yX86TeuUNfZ3l/im1lRXbclCfXYUpev4yhLCkDpZzgacnvnd0/rYFEwJuY7Z1cz
         OQjmL3ahUXXy2v32uAOLXqzNA+F9kz/uBDFbVP5YgQHZPKJgPXYahxhHLwsa+3vyeT4s
         FB6c93DN+AKBn2k3dGxYv3NVoYEo2PFQ7w1b9aP+yiwFr7aPoYPVFLCN1MDlunlyozvc
         2p2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GCR5ZqsD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72d0fcde671si1501837b3a.331.2025.01.07.00.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:03:11 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GCR5ZqsD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736236990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wiMOOHV60q4eXagNMIOLvNFV+qq1RGRo7TL5T/ORWco=;
	b=GCR5ZqsDKBjLrldPsMf/oOmXQh5pYXSktrAL77G7O4pLwhPjfbGVLvl4GYIkKeVRH8iCFO
	FaNuX+Yv5NpwZjBZV0jvBtqNoXQ/zPDoJr68zIYl04epU5ud8ZcfCHF8BiuQdxD+d7gu4M
	UtL2WH9j0JJzKiqoULh1BD6OOtGs+Lc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-NUMOnnD_OUGlH1xah0AkEw-1; Tue, 07 Jan 2025 03:03:09 -0500
X-MC-Unique: NUMOnnD_OUGlH1xah0AkEw-1
X-Mimecast-MFC-AGG-ID: NUMOnnD_OUGlH1xah0AkEw
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6dcf01612f0so197896626d6.3
        for <alex.bennee@linaro.org>; Tue, 07 Jan 2025 00:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736236988; x=1736841788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiMOOHV60q4eXagNMIOLvNFV+qq1RGRo7TL5T/ORWco=;
        b=uidm5KS6BANVtpUh5qGw0RSRusUGF00rzR1UbMPBq5+r36U/33KZNhFYEEn17lmlUX
         xFE1P1+BY+QDUS98aowhkeitz76iRZ2Qdtf+Zq6+GCzUXWpZJe/TEzvR5GLDR/DwyYIg
         eJjpHAD6Ys9LpSptnLfC+YFvvg3gi7/U5oqlGI6BxjPwgYitpKtSNqXralYQ+88tkWRH
         fELe3Q8yv5W11lSvFCbZ5bzRynyfsxRxo4CemApo59mjdgn/OorFOX/G57iEnEdnqnuh
         jxQGTuQkyu5PoHYbGgBFPUmlqebbyPE59t8Q+HKZhcGHJqzsOj4RfbgQmr0z5j0pTyYp
         LxOg==
X-Forwarded-Encrypted: i=1; AJvYcCXTssPqZUWCXUPkvvN0xw/pYOjhJ4IXoox+3FqBgn0lrR3PQJzY6pe6bB0ra4Gtykn2bLYV5Nk6c2iBgw==@linaro.org
X-Gm-Message-State: AOJu0YzpClu4chlQgvGTjbCbdj0/goVyb9uDRnHB+Pi+dz566ZkXNJEs
	WOU4B0C/TpikXK12ageRkJLBCQaAUZHnoWM4scDhvMd3b0K0v7XyF3VENxs0Q2MCxa8dgLuxC6a
	lCWOZbh0O/T0zOjg1DxjELWN0IDPCSvOjwiqczletjRsWZDskyatTBw==
X-Gm-Gg: ASbGncs1eIY1rIhnVW7uW97jUM7NuXIjwr56kEfjxfkDTlT0AILiGLSWjusq3yvM8fb
	ke/Nti54lmqyipXB1xJMQHS6CJuIDFGdg/IP3t14LlLc+dt4S26Kq4i2Ji+D2uA3YmHb58HgPlN
	8rXXN9yMT1Nzw3vOgot0Iz2m58J9OD4hOQJX2J9ICn1i3AhCTkFblf5mUKIMp+cxeoiUvcAW4jl
	7Guu6VCX/Dgjc1NP0bXhmuUz4vr11nwWSH9rhGA+sKmBucv11pHHkn2ed3kNUBwW7lOSXmrVghK
	SrCTqg5G3Ad9
X-Received: by 2002:a05:6214:240e:b0:6d8:9838:d3a9 with SMTP id 6a1803df08f44-6dd23356042mr888122446d6.26.1736236988711;
        Tue, 07 Jan 2025 00:03:08 -0800 (PST)
X-Received: by 2002:a05:6214:240e:b0:6d8:9838:d3a9 with SMTP id 6a1803df08f44-6dd23356042mr888122216d6.26.1736236988466;
        Tue, 07 Jan 2025 00:03:08 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-182.web.vodafone.de. [109.42.49.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18110450sm179182026d6.44.2025.01.07.00.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 00:03:07 -0800 (PST)
Message-ID: <3fb8281e-23f0-44a7-904b-34b8ea8ca7f3@redhat.com>
Date: Tue, 7 Jan 2025 09:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] qtest: Remove uses of 'first_cpu'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20241211233727.98923-1-philmd@linaro.org>
 <5d2a536d-9b68-4b31-8d92-6cc42ed72e5c@linaro.org> <87msg884mn.fsf@suse.de>
 <05820c9b-a683-4eb4-a836-e97aa708d5e5@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <05820c9b-a683-4eb4-a836-e97aa708d5e5@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W4aRqDMUqNcTmVQDKG_4oyqg9jhKgIO_mHpsucagfqA_1736236988
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tjfKrecPlpcw

On 04/01/2025 00.48, Philippe Mathieu-Daudé wrote:
> On 3/1/25 13:26, Fabiano Rosas wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> Hi Fabiano,
>>>
>>> On 12/12/24 00:37, Philippe Mathieu-Daudé wrote:
>>>> Replace first_cpu->as by address_space_memory.
>>>>
>>>> Philippe Mathieu-Daudé (2):
>>>>     system/qtest: Remove uses of 'first_cpu'
>>>>     qtest/fuzz: Remove uses of 'first_cpu'
> 
>>> Ping :)
>>
>> Hi!
>>
>> Good that you pinged, I thought you were looking into the test failures
>> from v1. I copied you in this other thread that mentioned them as well:
>>
>> https://lore.kernel.org/r/87y10jctbd.fsf@suse.de
>>
>> Applying this series on top of master just now:
>>
>> Summary of Failures:
>>
>>   10/519 qemu:qtest+qtest-arm / qtest-arm/stm32l4x5_usart- 
>> test               ERROR            1.40s   exit status 1
>> 165/519 qemu:qtest+qtest-arm / qtest-arm/sse-timer- 
>> test                     ERROR            0.40s   killed by signal 6 SIGABRT
>> 185/519 qemu:qtest+qtest-arm / qtest-arm/stm32l4x5_exti- 
>> test                ERROR            0.19s   exit status 1
>> 187/519 qemu:qtest+qtest-arm / qtest-arm/stm32l4x5_rcc- 
>> test                 ERROR            0.19s   exit status 1
>> 515/519 qemu:qtest+qtest-arm / qtest-arm/microbit- 
>> test                      TIMEOUT         60.01s   killed by signal 15 
>> SIGTERM
> 
> Hmm interesting, I have a "quick-before-posting-series" set
> of tests, and a "full-before-posting-pullreq" one. The quick
> is quite extensive, but only include Aarch64. I thought, since
> it contains the ARM targets, they would also be tested, but
> no...

IIRC this was a deliberate decision once in the past to avoid double 
testing: qtests_aarch64 in tests/qtest/meson.build does not include 
qtest_arm, it's a separate set of tests indeed.

IMHO it's a little bit unfortunate, since in a couple of spots in the CI, we 
are taking the shortcut of only adding aarch64-softmmu to the target list, 
but not arm-softmmu.

Maybe we should add some logic to tests/qtest/meson.build so that if 
arm-softmmu is not in target_dirs, we add the tests to qtests_aarch64 ?

  Thomas

