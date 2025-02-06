Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1735092njb;
        Thu, 6 Feb 2025 10:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVC/70OgTn9YF0YIw/QZX/YcN0V+mgLSfeZ8JC2XW9MR6QSyBKGCDFFOW9OGZymxal3kbPUg/DrpJNI6g==@linaro.org
X-Received: by 2002:a05:600c:5811:b0:436:488f:4f3 with SMTP id 5b1f17b1804b1-43924991efamr3970615e9.17.1738867030305;
        Thu, 06 Feb 2025 10:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738867030; cv=none;
        d=google.com; s=arc-20240605;
        b=j+Ulwct+bPg8ZAkX50yTXSqAy3DwMp04fQgY5DQNbFQ6mPnVMYPPD1Zjm3BgoCDA3/
         k1Z+cblL2WAxIeJsHsTtGAN4KkLzuduFklcOv+RDUhnLu8kW8i9GBObHJr9q1gACnKlz
         zuRT4qvwWW/r3mOe9Tsb/33fxcMMaTRaRzpaMw83CFWGsGvKM2GssFqk34T6VU5l8eZM
         ZwRmYGurH2E/QDhkwbNhaX1obGQsfWOukDsg0iXsUOFULcuyShZMfLWb7XVNxuF/PZB4
         yUFMEFc0hm8c1PTy19ATCMTYRhb9SIk6D2zytoJVsBSWSBm9/w99vJoKDbBwdrZvRUBg
         zvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7Hhur0L/R0Khsw01cA+rc/OjVYMOUw5k7Zige8e37gM=;
        fh=uoiNQv8qXs0NzLNwyfptHYY7cZuUJL3L2efyp/KVI+o=;
        b=Gy/m9/v+BkCWfp1HX77WxNTXe3Y65H2EqidyGTpAABQWr3GjgvPFlAKd5oDXzNN8F+
         CvZevck1WQlVaFQj9gePXUj2AcZ19rNhIt0BFRzNv/deAkP7aSZisrfGDwsTfyqPSCS0
         owITaasCcdJm2bO+upEHksNzbbxIVkztcJmssjXKc4FNggASE4SQfhF10VDSXM1T10DF
         toQ375cZl0d1qB7q08i/CCpI/e5uuanRPSY0txiMzvvc9Ei6YM3d8LCY4NegkMXx0t7i
         rP3PHpwiJHUQgqbEdmCm03KNHIpBBNwWyDWn+NlbO88pQdIiDI4s5JjrQoR4OI189EvJ
         buJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uwi/fumo";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4391dc9a19asor7041405e9.2.2025.02.06.10.37.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 10:37:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uwi/fumo";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867030; x=1739471830; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Hhur0L/R0Khsw01cA+rc/OjVYMOUw5k7Zige8e37gM=;
        b=uwi/fumojGajLyrTR9yb0pMgTybXZpnVHJcwcKv4rIxR6h8WaaGMHMA40lk5RvK3Pl
         wdhOosjNuACj//7R7/f43S/WCzRoDG6wZV1sn3lAqyYih72ekID9/qFD9y5o/f8tZ0J9
         uvO/nFE9FmNOag9GaHM+0ezRCCpL0eWaoz8eqbxO9OcIjioH6X18QGrZpjphdwpP9SWL
         ewqPacTsfHyBFFETCTKFxchRQVxs39VLxz6HXGGBZkZ6eoaX+3SCBidwswT0YODLS0mM
         DqwvVukAbmyNaJ3tMIsaTKBePcbDZZivK4Cgc+2obWeH5n+45NeA3o4oiuvazeJlEgYL
         NK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867030; x=1739471830;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hhur0L/R0Khsw01cA+rc/OjVYMOUw5k7Zige8e37gM=;
        b=iKUjwBmbIPrP0EuOprJLJIeHmnpCt9XSFTH67f0m10IrcwWgMudhXFpAKXK6FOeo0T
         vakmIThSzdVpnCiFHWvRsOh2dgR3IdhCoqWb7jimAdLKZoWBh4mJSMOy6kDHk6njl2X0
         9w2nCPCUOtQFDGnZSzzyfZqvBA3yoCoN+1Yl9h0HxCXbxSUziiFy2Wsb4GrpXed73y0p
         ILI6hAD9aZpg5K4V9Gm/UVA0/DqIXW+tCq7++0hBsB8FlCBOZxGNWO/iB/WE8rOnT0aN
         FXq5fY89MDYynZkTk2DCBPWc9nsWre/1egjx7WYp3HPc0Wv9Mxmypq4JVGH5VOdvqClm
         UzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4WwG55yvMCxZpzaCuqZ801zDOJzIQw4R2nQC1yxQv/GsJfu4Op5vn1P3kki0E7uOnMtZncHKHXw0ctw==@linaro.org
X-Gm-Message-State: AOJu0YzMd1dHwedmqSO9jnKaes4dNiltprY7XbrIteU8flGdAwmKBCWW
	glllEKu97TNAgeV0rR8gRaDLalrS1rHEHELlSeRdti42A8gIr6onXaD2vh7CKaZ7gA==
X-Gm-Gg: ASbGnctrqRePcuW0bfl5Bt1KLgvbo2GbBaJYboDDHLO4zr60k1yMKCoyO5pg91qMyvN
	X69fusF2cBcrYzlJd5Fy34zYR2TJcuT6aQioKOOKtJUlaNEe0LbhuFoKzy4uvcpsuP+K6ZBWuIh
	ykIobTRZ0KMATY5aamK/BzWZ2o+uuPLVYi3+eFtAHmaq/wOeFNP0tRqHM6oShnbBcE3eq59NF7t
	Ij0xiEO4MwHxj9e12lPrk0IKVhqNsGk5uEu6T0jFqqYyLDeRB/8AYfwpGnTPMl7ruRdlM34OLUn
	Nvf7XGWYlxqrpM8xGHJqfo5HLC+2kxQOZzR5Rzbb7leVC0HUWxV8+3kTtUE=
X-Google-Smtp-Source: AGHT+IFRn0k/0VNdHATF21CxDhL2kDDJrPFrnzVYkO+t9DsvcqlIB579bGymQcNch+UVz1jhRR758Q==
X-Received: by 2002:a05:600c:4f47:b0:434:ea21:e14f with SMTP id 5b1f17b1804b1-43924990cb5mr4514975e9.13.1738867029695;
        Thu, 06 Feb 2025 10:37:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b2fsm62443835e9.33.2025.02.06.10.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:37:09 -0800 (PST)
Message-ID: <c2ef5d4a-a1ec-42e3-b65a-1c1d96df749a@linaro.org>
Date: Thu, 6 Feb 2025 19:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <ce653340-1375-41b5-bebb-c7089d3ab2bb@linaro.org>
Content-Language: en-US
In-Reply-To: <ce653340-1375-41b5-bebb-c7089d3ab2bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MmiapzV7aUJB

(sorry, posted too quick)

On 6/2/25 19:24, Philippe Mathieu-Daudé wrote:
> +Michal
> 
> On 6/2/25 19:06, Daniel P. Berrangé wrote:
>> On Thu, Feb 06, 2025 at 06:49:38PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 6/2/25 18:12, Daniel P. Berrangé wrote:
>>>> On Thu, Feb 06, 2025 at 04:04:20PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 6/2/25 15:31, Daniel P. Berrangé wrote:
>>>>>> On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé 
>>>>>> wrote:
>>>>>>> Hi Daniel,
>>>>>>>
>>>>>>> On 6/2/25 14:20, Daniel P. Berrangé wrote:
>>>>>>>> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé 
>>>>>>>> wrote:
>>>>>>>>> Introduce an abstract machine parent class which defines
>>>>>>>>> the 'little_endian' property. Duplicate the current machine,
>>>>>>>>> which endian is tied to the binary endianness, to one big
>>>>>>>>> endian and a little endian machine; updating the machine
>>>>>>>>> description. Keep the current default machine for each binary.
>>>>>>>>>
>>>>>>>>> 'petalogix-s3adsp1800' machine is aliased as:
>>>>>>>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>>>>>>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>>>>>>
>>>>>>>> Does it makes sense to expose these as different machine types ?
>>>>>>>>
>>>>>>>> If all the HW is identical in both cases, it feels like the
>>>>>>>> endianness could just be a bool property of the machine type,
>>>>>>>> rather than a new machine type.
>>>>>>>
>>>>>>> Our test suites expect "qemu-system-foo -M bar" to work out of
>>>>>>> the box, we can not have non-default properties.
>>>>>>>
>>>>>>> (This is related to the raspberry pi discussion in
>>>>>>> https://lore.kernel.org/qemu-devel/20250204002240.97830-1- 
>>>>>>> philmd@linaro.org/).
>>>>>>>
>>>>>>> My plan is to deprecate 'petalogix-s3adsp1800', so once we
>>>>>>> remove it we can merge both qemu-system-microblaze and
>>>>>>> qemu-system-microblazeel into a single binary.
>>>>>>>
>>>>>>> If you don't want to add more machines, what should be the
>>>>>>> endianness of the 'petalogix-s3adsp1800' machine in a binary
>>>>>>> with no particular endianness? Either we add for explicit
>>>>>>> endianness (fixing test suites) or we add one machine for
>>>>>>> each endianness; I fail to see other options not too
>>>>>>> confusing for our users.
>>>>>>
>>>>>> We would pick an arbitrary endianness of our choosing
>>>>>> I guess. How does this work in physical machines ? Is
>>>>>> the choice of endianess a firmware setting, or a choice
>>>>>> by the vendor when manufacturing in some way ?
>>>>>
>>>>> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
>>>>> (wired to a CPU pin which is sampled once at cold reset).
>>>>
>>>> That makes me thing even more it is just a machine type property.
>>>
>>> I'm happy with a machine property, this was even my first approach
>>> using OnOffAuto until I ran the test-suite and have qom-introspection
>>> failing.
>>>
>>> What should be the default?
>>>
>>> Per the SH4 datasheet:
>>>
>>>    Bit 31—Endian Flag (ENDIAN): Samples the value of the endian
>>>    specification external pin (MD5) in a power-on reset by the
>>>    RESET pin. The endian mode of all spaces is determined by this
>>>    bit. ENDIAN is a read-only bit.
>>>
>>> There is no default per the spec, and I believe using one is
>>> a mistake.
>>
>> If it is left as an unspecified choice in the spec, then I would
>> presume HW vendors are picking an option based on what they
>> expect "most" common usage to be amongst their customers. IOW,
>> if we know of typically used guest OS prefer big or little, that
>> could influence our choice.
> 
> Please have a look at this thread:
> https://lore.kernel.org/qemu-devel/ 
> d3346a55-584b-427b-8c87-32f7411a9290@amd.com/

Per Michal:

   Truth is that I am not aware about anybody configuring MB to big
   endian and we  are on AXI for quite a long time. There is still
   code in Linux kernel for it but I can't see any reason to keep it
   around. I don't think that make sense to keep big endian
   configurations alive at all.

So with that in mind, using a default of little-endian=true for
MicroBlaze seems safe as of 2025.

For MIPS, big-endian was the default but as the industry shifted,
it stayed big-endian on low-end 32-bit cores but mostly became
little-endian on high-end 64-bit cores.

For Renesas RX, the "Endian" section in the "CPU" chapter of the
hardware manual mentions:

   Both big and little endian are supported for the treatment of data,
   and the endian is switched by changing the setting on a mode pin (MDE)
   at the time of a power-on reset.

SH-4 "is bi-endian, running in either big-endian or little-endian byte
ordering."
