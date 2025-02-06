Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1705510njb;
        Thu, 6 Feb 2025 09:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGFQBwF/IJVhtao8rQJX/ZutzqpuM3oRE2NDOght79LVc6CbnLkyMyau57d4q7tMsoJOUnJCWdc0mHEQ==@linaro.org
X-Received: by 2002:a5d:5850:0:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-38db490f8b3mr5824777f8f.46.1738864180272;
        Thu, 06 Feb 2025 09:49:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738864180; cv=none;
        d=google.com; s=arc-20240605;
        b=b1Hf4h3l7V4Uvn2KIfpgRVmH1gP/ek3mLom2+WOww4jPc2OBzk2yhB6UTDo/bWPu0F
         QJGttKKBBFXzu/id5EqcXrJxdN0pR+yka+VpSU+Ou1/fe1H68FoKhWL0hD7gwtgmxwhe
         T5YNv6FJKlvkl7gC4lVUktmwT7sF5c4mN/Z520gNbh55r0L455sLOkijdT/9Pgiz1f4i
         vkXZSQuzQCiL4ScGMOlDxi1ZBR8uB6C2fIU1LLfDsC7AdeGGeSpwOt4rvN3+oJHve2W4
         Na12RbI8SYepIUFtH/HwpdeCioqbclH9Bmwfom6z1oB6Kk+B0Xgj58+H4orwoWsyFzza
         JNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1qbATPXaShk6uHSkyuikGuAhkTLp1PYYgNhbuymCQ74=;
        fh=yw+3VhWcxjjwWFcXDHGCJZ57WGP1+G7xHjh2bfImVjQ=;
        b=TgYeD9Z4OsrZxkVPTd8JmaEAT9AaFWzn4lw5tAmqPBCQEUCE9FDcZhz6bTR17bInBk
         7pgTFxW61T+rT3otZ8mSSLtxw9o5oxJDP/P+Pxlxft2up9x91O5IIIbbbm8kkPBzvPd0
         PcCywEbgMKULv7MdvroUsQV24ZkZFVceducIrD+3bl46SxxUg5ZDOIsouDMRUHgWHRAA
         GMI8QXUaV2KaiFgFwxZzGaaJNgVJhkxreIwZkrU6PYtflGJCxFmaKlZbyrXXr4DypZSz
         /2J46HDDQAlUuihWiNBgGvvUVPo4f6A+7OyrQjJUnT3BLRequBm7D9jiRluePBN2LzT6
         7z9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qb4RM8um;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4391dcad258sor6996065e9.3.2025.02.06.09.49.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 09:49:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qb4RM8um;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738864180; x=1739468980; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qbATPXaShk6uHSkyuikGuAhkTLp1PYYgNhbuymCQ74=;
        b=qb4RM8umvyrmVAsHMnVgLDv/tBDPZ1VVzDHmKMJ3VcN/lPIYfFRJXw8GxMhvYV86p4
         qH52EMgOwiyvd6pKEfDXLNx89DGecbI4o8Z9I78kW1crK4LZoWvyRQ5yhZNUyaA6FT3i
         fEZeGlgGL09iehRfjVergHN+HHkCgGEp/e/CMUDVhzvPoWmeDWQObeZfSO9IRC4wy367
         376rDAenSUkzmz9Kightj0CRVCKFCBv/qr1DDUoLULo6MfYD2K2gpQquGcnWaF8cHC4t
         eOodwlylMulvV8+HSmM2I71Gosf5s8bLE0zfmZpvxBWX+qhgNxXA7CEnKME+PWRY+Gs8
         sBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864180; x=1739468980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qbATPXaShk6uHSkyuikGuAhkTLp1PYYgNhbuymCQ74=;
        b=e13aczmKueQ1pa+H3rwSGQhXKdcSmWxOh5jgn25AaxLyrS1VMIC8puz8eEYAXnIKoZ
         NnWalK9KOCEW0rdGaoUsVjwrnRTBY67+VDZ6MV2b+utLEgQVKpBJc6dR13ncJDsGOsIi
         cYQQlJkH2p1tbRbB1i7gdmeBAujNFtp38iHkLrht1XCsEXDUG51JYoH60h9LK4f9kcD7
         XgOr50/bPZ733HvZxk53anWzCWfKvAHDFUdotjJS7x+P22hLA/7JBdY817ylrWV1hunr
         V6RrfOKdnZU9KA2Nl4g2I8/GlT8Y2KJfmpbfh5aYJIg7l8q7/G57s+a85cvH5KwA2p4G
         kung==
X-Forwarded-Encrypted: i=1; AJvYcCURyq4Iw6xB3NGVI7xKiSMGNZoTHK2dyBRQmnvwZQoj1NnPFIBKPa4zJN4mzAlyyYf2bB7/+DU0hn0hhw==@linaro.org
X-Gm-Message-State: AOJu0YyNfUeTu8w6TrUy42jnpmQy+g7j4E0mgpWH6fjyGwk8urn/amGr
	RNQ53t28zwhbDmr1yV1/UpKlUj4WxIEXBg1T6hQkHO856dDcJcJ1ehuiWa2IM1O0Dw==
X-Gm-Gg: ASbGncsjp+EtCGoMddQCRrZ0aCGhIiAemfXsbTwdIhRSLcHjFZtjbirHf1YURYL9jUy
	is4SBAUan/Gq45OVNPQ4myRsiMBFiGIWLvSVZZDn7Z0AXBRw6BPP5y5ueTUT7w4q9oU9wWU6dQW
	erGLwlXpsSWVbJRU/wkaM0IJEfkend+jYvZ32BosD1ZngmHlP/WZuFRxvI6Ef1/3F+vVZKGU1+6
	nTqtAZ4/Fgm6X2EugBNjQPWX8rjnp7CaedT65dKlV7MZyv7C72fiBJwXcmV5SMTXrbh3z4kR00L
	xx0K1SY4Q7kzX0s/trhH9jdQiFUdOFk8oBnfvuSfcAYvafruHCdYG33sjPA=
X-Google-Smtp-Source: AGHT+IHGwiA08zihX48ND/VhtsouPRB1vY98R0v9pH2fOXaRNWTVoOUqMhvwPWkq8cNmhk8ESV7Szg==
X-Received: by 2002:a05:600c:218f:b0:436:fbe0:cebe with SMTP id 5b1f17b1804b1-43924aca5c4mr2326755e9.30.1738864179625;
        Thu, 06 Feb 2025 09:49:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1deebsm2253959f8f.86.2025.02.06.09.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:49:39 -0800 (PST)
Message-ID: <63f1130e-a30d-4416-ae74-374f1fd94dbe@linaro.org>
Date: Thu, 6 Feb 2025 18:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
 <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
 <Z6TtisO7JGAMGILH@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6TtisO7JGAMGILH@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Hgfr+bFOdWLK

On 6/2/25 18:12, Daniel P. Berrangé wrote:
> On Thu, Feb 06, 2025 at 04:04:20PM +0100, Philippe Mathieu-Daudé wrote:
>> On 6/2/25 15:31, Daniel P. Berrangé wrote:
>>> On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Hi Daniel,
>>>>
>>>> On 6/2/25 14:20, Daniel P. Berrangé wrote:
>>>>> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>> Introduce an abstract machine parent class which defines
>>>>>> the 'little_endian' property. Duplicate the current machine,
>>>>>> which endian is tied to the binary endianness, to one big
>>>>>> endian and a little endian machine; updating the machine
>>>>>> description. Keep the current default machine for each binary.
>>>>>>
>>>>>> 'petalogix-s3adsp1800' machine is aliased as:
>>>>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>>>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>>>
>>>>> Does it makes sense to expose these as different machine types ?
>>>>>
>>>>> If all the HW is identical in both cases, it feels like the
>>>>> endianness could just be a bool property of the machine type,
>>>>> rather than a new machine type.
>>>>
>>>> Our test suites expect "qemu-system-foo -M bar" to work out of
>>>> the box, we can not have non-default properties.
>>>>
>>>> (This is related to the raspberry pi discussion in
>>>> https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
>>>>
>>>> My plan is to deprecate 'petalogix-s3adsp1800', so once we
>>>> remove it we can merge both qemu-system-microblaze and
>>>> qemu-system-microblazeel into a single binary.
>>>>
>>>> If you don't want to add more machines, what should be the
>>>> endianness of the 'petalogix-s3adsp1800' machine in a binary
>>>> with no particular endianness? Either we add for explicit
>>>> endianness (fixing test suites) or we add one machine for
>>>> each endianness; I fail to see other options not too
>>>> confusing for our users.
>>>
>>> We would pick an arbitrary endianness of our choosing
>>> I guess. How does this work in physical machines ? Is
>>> the choice of endianess a firmware setting, or a choice
>>> by the vendor when manufacturing in some way ?
>>
>> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
>> (wired to a CPU pin which is sampled once at cold reset).
> 
> That makes me thing even more it is just a machine type property.

I'm happy with a machine property, this was even my first approach
using OnOffAuto until I ran the test-suite and have qom-introspection
failing.

What should be the default?

Per the SH4 datasheet:

   Bit 31—Endian Flag (ENDIAN): Samples the value of the endian
   specification external pin (MD5) in a power-on reset by the
   RESET pin. The endian mode of all spaces is determined by this
   bit. ENDIAN is a read-only bit.

There is no default per the spec, and I believe using one is
a mistake.

> None the less, since you've already taken this pattern of
> dual machine types for BE & LE on  MIPS/SH4/XTensa, I think
> we should stick with your precedent. Consistent modelling
> of endian handling across all machine types is most important
> IMHO
> 
> 
> With regards,
> Daniel
