Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1738113njb;
        Thu, 6 Feb 2025 10:43:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUIK9OUA5mFW1OJP9N9fpCW6s+Gjf4k015yaUE0UtQAMiXFsvCXkDZynfTjm7exC6NFMVuquuYHfZ3Lwg==@linaro.org
X-Received: by 2002:a05:600c:3ba3:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-43924972d28mr4516245e9.4.1738867392342;
        Thu, 06 Feb 2025 10:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738867392; cv=none;
        d=google.com; s=arc-20240605;
        b=YUK7HzOV7Zo42WKceaaEzr9DwWJ+9ooFYJfg/3RIO6NPPvo1GyGcG+9v6suYuipunE
         I6xedx+NOLiSFkRtk+qHZCRciPfxUoR58Z6rMpKKDcHzM0MYZnuiraURhOmMsJMSSUC1
         y3oP08XZN3M9IopQwbTvN2QJefnOVQ58FBeCw2Xdi/8lgD6MvCIuPb3ExjlYY+U6G90+
         NBbOyTWT1ztFoFvu5pqvKbBKp6DmlUVqC7TdK4VtFmAt+UkcGNs3ivCtejqAj533v79L
         I+euT+T5Sq0I4B8l+bfOmvSHXgYRTSLZesNhhYkiBGx7pmUZwDEuBTVcaSZHS/FmT77v
         QYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fRu25FZTtQki2UM8OpruWCIN1mpgd90J2VsCiuXGr1k=;
        fh=pur4XofC7uAqAQzjcLZzkLbz4szD5UdOfMp+Ivy8Mao=;
        b=W6K69UsDI25s8wPcmOBaXJOztP66AnY+JdCcdIKnVaNConQk/idSRqQf/gEE6ryR06
         I/eA10/sexc01RVNGweXRNV5mmXAJyM5VcWtExhvgL1YXMDmZR/bDdkfL8bNc7Vx4lFT
         W30m1Xmkw5P9muRcET3LbV1hMchkfCxNWpLwKSoa1oUFf4Vgh8rUk62+5yOabwcfRkQI
         Si692MF5ECzThhFHqkLcUO3j47tSGQBVtRQHV9flvVRb+700g4jmpy4s7WmUGmS46PIq
         BsnC1zipN2UQQVkydK6o1p6x/Gz6GfjPkw5m+5JZOo3o1a+1N4B3OBZWomJfG1qaeWAZ
         HX+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UO3/JCxZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dbde1241csor679530f8f.5.2025.02.06.10.43.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 10:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UO3/JCxZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867392; x=1739472192; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRu25FZTtQki2UM8OpruWCIN1mpgd90J2VsCiuXGr1k=;
        b=UO3/JCxZXupUg7TnQI8rST+zYpPWvjm6bQjHcspWmQeNs4bb2g0ziHqlViB+noNdJd
         tz5YogHP2omma3HHg4nCMEUk8b5M48Y1fMuW6mK5VrOQTqYihfglPK0oh1fn6Qlrn5UX
         aG/OPrsxCbsQtrhQT5cn4GcvLXGLpShRGSyEg+GzSXh0zCCf+UiDFHvnFZKvBWKkt15C
         D1KqSFFA1XTQ328UAfC6iIisBVUHD3XTyFchmenDUpjsL3BvUxaVZPaNfYmqQbtzN4VP
         HXQulwhfcojCQTnxNO3VLMKzrygF77CPkKbsbhAt9PG51O0CnKj0WynQIBSTOXUmZy9s
         9C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867392; x=1739472192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRu25FZTtQki2UM8OpruWCIN1mpgd90J2VsCiuXGr1k=;
        b=pc190LxsTO1PBJaPVWIFL0rQky+4726Ea5xVgq42SiuqjICAJihNYzIhC51Pd5gGDd
         +5FikOpXjwHcmgdH7W+0uPj36qmkRj308ju+bmAWWtXEjUFD7Hkg7kVNCCiIpXelbBND
         I7sb2jPE5WfrgtwNKGJ03I54ypbpGz7tKZG/dddjGMTk1Uv9+2mVQPudso3n8HfSyIIZ
         Iei4H47FiNl0mzlZgsNUEEo7h97bGVxOTTVv1a2BqgT/FLNo/i+DccFu4+gcBhld3GWm
         6GuWer2NnSsovUfvpwfP1XGJZda0KYkCONwPLF2bkhbXxnrvKUIMC9myWq7ioo1J1IxI
         oD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkJwtRVsciHOze9m9Rec4+Nv0jLmdOf4XpG+B7M5vSz0+AnbNtm1TCQ073ZBLpXwxEJKi0/MPOTYTVGg==@linaro.org
X-Gm-Message-State: AOJu0YzcXhESMdmsjS2fgJVoy0WVyfqqFjjOIOnH6+/lztEfHc+7nrPm
	RQtFYsO0mesCebfeF0S/PF7TBMcI17vvYalIegA5Lw+0aKtfUDN09INOIxScRVDM1g==
X-Gm-Gg: ASbGncsv4o/2Dv6GzyjilzibyRpmZbLUOr5nALNaAXS3smYTDd4yQHIL7KvzTNAAW90
	DAc4LRZRpHWLdpK/QRLAaqZjg1gJL3PDo3aWNohCYevWyUuJQ0oFlTAIeS7+WuboG4kJhRm+MU0
	hXRNH9p7CCKNm1zKeWZdHnjTqMzZJMrunoIb28rIS7OM417WvCMa2g2geNp7sIdDP+OSmRxJ1CM
	MRbkQRKd025oV2itKlIbn1WfIO7NdTk2wKLQlyT/ardIAQiBTuShNMH3pHZO2A4FTx4HnY5oY8m
	IooFBC8jBqX3FiR0MnFhyQLAWe4G81I1JAICxzdjy/Ho5ZrxpnRXqrai+C4=
X-Google-Smtp-Source: AGHT+IGlSe/OauHhGNHRq4VO1vZOyZ0i28VGTbFb7XtcApTPNi4+CyX8mGSbryfOsBp+IF42KZ6a9A==
X-Received: by 2002:a5d:5984:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38dc934bcd9mr49083f8f.35.1738867391705;
        Thu, 06 Feb 2025 10:43:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd36967sm2421995f8f.37.2025.02.06.10.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:43:11 -0800 (PST)
Message-ID: <e403f0be-1bd0-4b8c-a99d-bbb1abebfe55@linaro.org>
Date: Thu, 6 Feb 2025 19:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Michal Simek <michal.simek@amd.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
 <ce653340-1375-41b5-bebb-c7089d3ab2bb@linaro.org>
 <Z6T_hq21zjtU43bC@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6T_hq21zjtU43bC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0cAn3lsHeK99

On 6/2/25 19:29, Daniel P. Berrangé wrote:
> On Thu, Feb 06, 2025 at 07:24:55PM +0100, Philippe Mathieu-Daudé wrote:
>> +Michal
>>
>> On 6/2/25 19:06, Daniel P. Berrangé wrote:
>>> On Thu, Feb 06, 2025 at 06:49:38PM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 6/2/25 18:12, Daniel P. Berrangé wrote:
>>>>> On Thu, Feb 06, 2025 at 04:04:20PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>> On 6/2/25 15:31, Daniel P. Berrangé wrote:
>>>>>>> On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>>>> Hi Daniel,
>>>>>>>>
>>>>>>>> On 6/2/25 14:20, Daniel P. Berrangé wrote:
>>>>>>>>> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>>>>>> Introduce an abstract machine parent class which defines
>>>>>>>>>> the 'little_endian' property. Duplicate the current machine,
>>>>>>>>>> which endian is tied to the binary endianness, to one big
>>>>>>>>>> endian and a little endian machine; updating the machine
>>>>>>>>>> description. Keep the current default machine for each binary.
>>>>>>>>>>
>>>>>>>>>> 'petalogix-s3adsp1800' machine is aliased as:
>>>>>>>>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>>>>>>>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>>>>>>>
>>>>>>>>> Does it makes sense to expose these as different machine types ?
>>>>>>>>>
>>>>>>>>> If all the HW is identical in both cases, it feels like the
>>>>>>>>> endianness could just be a bool property of the machine type,
>>>>>>>>> rather than a new machine type.
>>>>>>>>
>>>>>>>> Our test suites expect "qemu-system-foo -M bar" to work out of
>>>>>>>> the box, we can not have non-default properties.
>>>>>>>>
>>>>>>>> (This is related to the raspberry pi discussion in
>>>>>>>> https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
>>>>>>>>
>>>>>>>> My plan is to deprecate 'petalogix-s3adsp1800', so once we
>>>>>>>> remove it we can merge both qemu-system-microblaze and
>>>>>>>> qemu-system-microblazeel into a single binary.
>>>>>>>>
>>>>>>>> If you don't want to add more machines, what should be the
>>>>>>>> endianness of the 'petalogix-s3adsp1800' machine in a binary
>>>>>>>> with no particular endianness? Either we add for explicit
>>>>>>>> endianness (fixing test suites) or we add one machine for
>>>>>>>> each endianness; I fail to see other options not too
>>>>>>>> confusing for our users.
>>>>>>>
>>>>>>> We would pick an arbitrary endianness of our choosing
>>>>>>> I guess. How does this work in physical machines ? Is
>>>>>>> the choice of endianess a firmware setting, or a choice
>>>>>>> by the vendor when manufacturing in some way ?
>>>>>>
>>>>>> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
>>>>>> (wired to a CPU pin which is sampled once at cold reset).
>>>>>
>>>>> That makes me thing even more it is just a machine type property.
>>>>
>>>> I'm happy with a machine property, this was even my first approach
>>>> using OnOffAuto until I ran the test-suite and have qom-introspection
>>>> failing.
>>>>
>>>> What should be the default?
>>>>
>>>> Per the SH4 datasheet:
>>>>
>>>>     Bit 31—Endian Flag (ENDIAN): Samples the value of the endian
>>>>     specification external pin (MD5) in a power-on reset by the
>>>>     RESET pin. The endian mode of all spaces is determined by this
>>>>     bit. ENDIAN is a read-only bit.
>>>>
>>>> There is no default per the spec, and I believe using one is
>>>> a mistake.
>>>
>>> If it is left as an unspecified choice in the spec, then I would
>>> presume HW vendors are picking an option based on what they
>>> expect "most" common usage to be amongst their customers. IOW,
>>> if we know of typically used guest OS prefer big or little, that
>>> could influence our choice.
>>
>> Please have a look at this thread:
>> https://lore.kernel.org/qemu-devel/d3346a55-584b-427b-8c87-32f7411a9290@amd.com/
> 
> That seems to give a pretty clear choice for qemu defaults
> 
>   "I am not aware about anybody configuring MB to big endian"
> 
> so in that particular case, defaulting to LE would be most sensible.

Or maybe I should stop trying to unify the current binaries, and add
the new data-drive machines in a new binary, as you already suggested:
https://lore.kernel.org/qemu-devel/ZEoyNt0UtSYRt9Go@redhat.com/

But then I'm worried about our users, on how to deprecate the current
microblaze{,el} binaries to have them use the new one seamlessly.

And more importantly, one of the goal is to maintain LESS binaries,
no more.
