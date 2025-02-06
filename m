Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1727893njb;
        Thu, 6 Feb 2025 10:24:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsjzi/OFptAbl+jlE9IfujZ4HnAsUY0k4nvUmCYL5Bi8mAjCisZpCDN/m/VH0OBaHh2dodWrM7JypJig==@linaro.org
X-Received: by 2002:a05:6000:2a2:b0:38a:88be:bcb5 with SMTP id ffacd0b85a97d-38dc8d989abmr54998f8f.5.1738866298390;
        Thu, 06 Feb 2025 10:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738866298; cv=none;
        d=google.com; s=arc-20240605;
        b=PybuFUzkAto5CYR08hMCV3Z/eAaCNM0czjwtd0Y3bdt1wEfiOeOivC+mYy1eUBYK2w
         v6+8Yq/2BbHLg8x+UcX6ujKbAMD3bEcTi13wUX9UiX8pdMZKYVSBrTzkpyE8yjonhzc8
         6vxOHLB9mCjOKcGJI0J3t3vfDP1CqtN/Qg8njY6GUDWS/3oi6RfZHnle1GsAGTvFAV9Y
         DLYq/9qu3qUVwPHjq5SeALyqbisX9fkawsbyJKwSFf/c9WJnDVLbonDq633oGrwiPAdP
         4s8Te9ODShQAb0RTR/wo+N53LzO3lPJlG10rS1OTWgnUZ1JcRo54Bwbbws1yldE2ZNw2
         WmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UEHokQ/tlwrnv9GfhI4Ppqv6w6OxNGWo4cEqfNX/KA0=;
        fh=4dJjTQxoNcN0kqeqQkdvrRHbA3gl4aXA3HpRv4v4KXc=;
        b=SAhMCBDFRqS+bOzXdvQ4y3QZXxOuD+PSrpGTyrbQkC8UKpAxN6zf2JZRW/7b2dR3fE
         UOXqyoW5jHooIaKJ0ahYPXEJY7wT9wWoINptiqE9VxyX8yHS81RgNnKlb/U3kIGDGaap
         yvJTD0abPtsQ2UvJE3OZNG4g9PuF2F78hHpzhL3JguTBNkkosp1hNUybaMUjIsfUxExr
         FkOVR6hnTNHdPxnxEgR2ZQrR8wqH84+wEXhD+58LXlhkHVXPEraJr5Jnoxe9F94H0FHV
         UKTbz1oxLaZndm9FPbR7SA3Nb19sMdr+xI91+3YlWWwiotAB89oFJhIg0buc6xKgjeui
         OBwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TrJE9p0N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dbdf6fd81sor718886f8f.8.2025.02.06.10.24.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 10:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TrJE9p0N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738866298; x=1739471098; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEHokQ/tlwrnv9GfhI4Ppqv6w6OxNGWo4cEqfNX/KA0=;
        b=TrJE9p0N2TjidluSIGFeyuy76sOvxy5D2V9NtyaYWIEGbS9nPkBXTZ3EpnDJ6DGazo
         m1KXURO2N0YzbMOYhdX46Wt5jry5yk2/aLhmRk2Go1fkrMPbsxHhzJRF2RV7Da77R1Um
         KmJolj0qENIw1VNVeDcnMp+67IjStpXRH/UE8iOrMID4MhBowRge7TRbCJaANMZNjfM6
         7ghneghkhpP3tbql0lGS2y+6dok0TWfIHXjtEWebCkvDiM0SESeeIpZe0xN4+xBCpJ27
         PnkrbkjZPDIzp8eOdPnwYp/V3cZDHwAXgqp63wdm0LcK6JlP6jgbvoB4xH8dYFOdhjhq
         Z4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866298; x=1739471098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEHokQ/tlwrnv9GfhI4Ppqv6w6OxNGWo4cEqfNX/KA0=;
        b=tNhX1+JxlcKjt3qgrfX6bWb/iGuc3SxZ5MjQCW92g3mz88hgug3gM5tW61puBZ+4Mn
         jvRgLgY5YLa2B1yS6r+Q5clswUVBLTcuy4HXqTE1Ny30hS3+WWVRBBp5+BtpZ3niARPx
         JP1XqvrsvDER6Ezejui8IefncK6CWUtcelbfHfnF5ZPbnnAOZZkGO5jWF5xaFzMAb5yM
         yAWAhF5D7M7UDfwvlG4jWEj+ht3mVvS2uKVHjVWXXs6eRAS4vM+a8yetFn0o09ebNjBC
         JolY6KX7loGsFSOIDK9s4lCbZy6uUf8yQvwjOR10qVQtOBqUETgPpLo0ppIOXlMWYgQl
         Ateg==
X-Forwarded-Encrypted: i=1; AJvYcCV64dhiRLW8XziCxWxt91XwtfjOW4fPRccoI9EkgUuULOSjllY0JEM3SbZ5RP8yqYe/qCBAx8gx3vAdbQ==@linaro.org
X-Gm-Message-State: AOJu0Yz6woulWwYvVLJJ/VoETrSyzN4A43juTcVHeObK4cGmKNXUFOCL
	zFJkw+4n87oN/peAlvqY0xDmWg6AFHUgRrcK3DWVQ5bkpRsUpwdFtWMPK3zoL55ckg==
X-Gm-Gg: ASbGncu1jz0f3B9Q2daEhPtbUEKZogq5tnm6Nsqk5M1p6M9XQqUbvBclJFBfRtbhuPk
	mZobp7ECAcp6m1I0qcqb4rRwbQHQiv6cOHP9Mu5eT1EyZdIDgY7SraNqHJoCzRPaRKykdgH0cSW
	dSURHtlNxwQHyLoeWFOy0xmtq8LrVXUthiivDCgR6IfAPrbvi6rdhRxB52qNK9dBNRA8+R+W9BO
	p0XbjPgIkTCuxQcdCHbsvsvvIUhlq7i0HPUSsAfTI4lDNGDz1e2TVQh8MOlKuGg+ocHTaR9tTao
	uatJDUlIDoyXGMvHm2Hzr8Y8y9B/It4RbqyoMZvJN0ZA+E7UPgx687nvRvc=
X-Google-Smtp-Source: AGHT+IFsypa0N3DQFPf++qwmW0XY2J1A300ZSUz3PvdOg+EGsLUyrbJN28kNphkG7hLb1OCfwKzwFQ==
X-Received: by 2002:a5d:6d84:0:b0:385:f638:c68a with SMTP id ffacd0b85a97d-38dc8deae54mr40551f8f.30.1738866297741;
        Thu, 06 Feb 2025 10:24:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde33e86sm2379379f8f.97.2025.02.06.10.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:24:57 -0800 (PST)
Message-ID: <ce653340-1375-41b5-bebb-c7089d3ab2bb@linaro.org>
Date: Thu, 6 Feb 2025 19:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michal Simek <michal.simek@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@amd.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
 <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
 <Z6TtisO7JGAMGILH@redhat.com>
 <63f1130e-a30d-4416-ae74-374f1fd94dbe@linaro.org>
 <Z6T6CiL_F-LvLGel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6T6CiL_F-LvLGel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +3lLdrxF7F3s

+Michal

On 6/2/25 19:06, Daniel P. Berrangé wrote:
> On Thu, Feb 06, 2025 at 06:49:38PM +0100, Philippe Mathieu-Daudé wrote:
>> On 6/2/25 18:12, Daniel P. Berrangé wrote:
>>> On Thu, Feb 06, 2025 at 04:04:20PM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 6/2/25 15:31, Daniel P. Berrangé wrote:
>>>>> On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Daniel,
>>>>>>
>>>>>> On 6/2/25 14:20, Daniel P. Berrangé wrote:
>>>>>>> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>>>> Introduce an abstract machine parent class which defines
>>>>>>>> the 'little_endian' property. Duplicate the current machine,
>>>>>>>> which endian is tied to the binary endianness, to one big
>>>>>>>> endian and a little endian machine; updating the machine
>>>>>>>> description. Keep the current default machine for each binary.
>>>>>>>>
>>>>>>>> 'petalogix-s3adsp1800' machine is aliased as:
>>>>>>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>>>>>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>>>>>
>>>>>>> Does it makes sense to expose these as different machine types ?
>>>>>>>
>>>>>>> If all the HW is identical in both cases, it feels like the
>>>>>>> endianness could just be a bool property of the machine type,
>>>>>>> rather than a new machine type.
>>>>>>
>>>>>> Our test suites expect "qemu-system-foo -M bar" to work out of
>>>>>> the box, we can not have non-default properties.
>>>>>>
>>>>>> (This is related to the raspberry pi discussion in
>>>>>> https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
>>>>>>
>>>>>> My plan is to deprecate 'petalogix-s3adsp1800', so once we
>>>>>> remove it we can merge both qemu-system-microblaze and
>>>>>> qemu-system-microblazeel into a single binary.
>>>>>>
>>>>>> If you don't want to add more machines, what should be the
>>>>>> endianness of the 'petalogix-s3adsp1800' machine in a binary
>>>>>> with no particular endianness? Either we add for explicit
>>>>>> endianness (fixing test suites) or we add one machine for
>>>>>> each endianness; I fail to see other options not too
>>>>>> confusing for our users.
>>>>>
>>>>> We would pick an arbitrary endianness of our choosing
>>>>> I guess. How does this work in physical machines ? Is
>>>>> the choice of endianess a firmware setting, or a choice
>>>>> by the vendor when manufacturing in some way ?
>>>>
>>>> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
>>>> (wired to a CPU pin which is sampled once at cold reset).
>>>
>>> That makes me thing even more it is just a machine type property.
>>
>> I'm happy with a machine property, this was even my first approach
>> using OnOffAuto until I ran the test-suite and have qom-introspection
>> failing.
>>
>> What should be the default?
>>
>> Per the SH4 datasheet:
>>
>>    Bit 31—Endian Flag (ENDIAN): Samples the value of the endian
>>    specification external pin (MD5) in a power-on reset by the
>>    RESET pin. The endian mode of all spaces is determined by this
>>    bit. ENDIAN is a read-only bit.
>>
>> There is no default per the spec, and I believe using one is
>> a mistake.
> 
> If it is left as an unspecified choice in the spec, then I would
> presume HW vendors are picking an option based on what they
> expect "most" common usage to be amongst their customers. IOW,
> if we know of typically used guest OS prefer big or little, that
> could influence our choice.

Please have a look at this thread:
https://lore.kernel.org/qemu-devel/d3346a55-584b-427b-8c87-32f7411a9290@amd.com/
