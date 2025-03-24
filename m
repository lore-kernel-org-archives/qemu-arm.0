Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2237697njc;
        Mon, 24 Mar 2025 14:31:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIh7IRupxvxCD4Up6K3m4Q7PIjyjGhlvR1V+DPGWiDb7vzXGnvfvD1EHPVKbIGovv/iBpVpY1CduQlsA==@linaro.org
X-Received: by 2002:a17:903:32c3:b0:224:1774:1ecd with SMTP id d9443c01a7336-22780c5599amr207417645ad.4.1742851866197;
        Mon, 24 Mar 2025 14:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742851866; cv=none;
        d=google.com; s=arc-20240605;
        b=G+ODgzu+tPGHxhFg/yIG6N4QIZW39zYvg8dG9xrs639XM8RONeT65qPOmvFWumF0UW
         LGd0CWzlvOxyDigk0iYyooLEMqHNjTywwZQ2BpoyjfmL6c1Vezv0iWbjTCQ92Hj5hA9O
         /aKjt4QQiHXBQPJZkIg6SbVLj9wHErtxyguieZ2w7+66+qgY3tIOHiRI/2I+AJvR20Kj
         0OG4wx3nwGj8WYs5xt1i2RLoWiivn2jlCy+VNZ3f8uh0v7wgYDk/6gpChVUyX+mY615u
         UmY8QhuwCDev/2r58Ns2zDkkVdDqNGDAwc8ze18dHc6JgxT5corUxvp/+GswlnCZuUNh
         OZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DZMha2t/FZ5+K9Z9EZOfeX0DoxH1TC8eTZwVsJ1i/ss=;
        fh=vIsFPuttzbfNU/kf6qFehD1zZUPIiDkRHjc4cPez8Dw=;
        b=EphGvBTXsM3WIXFXoB5fJlSFDyI8ySW/eOk4q2iFJDPrbvK9ScSLkfbAHhK5dT+Cfd
         BtV7zcY2U2VWIdkxSLLF7USWY2Yp2x53Sb3Aw6q64rHyeA9G30HBh1eEsanv6qyj892/
         UFLWQ4pwmRyZDI88txYVUbqD5GqPQGeoUTV5YqNwt46kiN9tgAKXjuUY7Y0ZVBj48ww0
         jBw7k41rYUONpN9lE6qgJ6J1LVsK9qg+qJdrHqvjk52H+qysxkfC8tQS/KBHCyyDb9we
         OKGmIdaP7WtGjVdeFdGzqwEM+1DvcWeDc0pajiX31z9JXowGDrFqMy69BD+BxUNNzkKb
         ZXMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8QLEZ61;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f54ff3sor59319625ad.10.2025.03.24.14.31.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 14:31:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8QLEZ61;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742851866; x=1743456666; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZMha2t/FZ5+K9Z9EZOfeX0DoxH1TC8eTZwVsJ1i/ss=;
        b=t8QLEZ61sImPJ7t8O1/AApaPCPwztbJuFC+PgH5BVHH9LddnEKk0A2cC1ff0/9eZgi
         G20slE+Uw8pMM4Cm4KgSmx/Ai6x9rgSloj4xrp/B8tXvxJZD2RxD7mNgW7gTciJwFLxh
         OdtaOfPzYjoG7zDOjPqKunhmf8a8bK+lj5zTTwxiwwf1/4/nEXdvc0HKpsVmHWs6LnxR
         YZMvR1fQWswmZXbzHwu9pdmLn4gJSV9KcXluEPLT1O5FqG2PfQJ8/46p5N7+GKfQl8CT
         5v54lB6HFYygRpw58pv+qflhbL3NjibJ86MgVLEuPzbnTZPqEL2B4OvnXI/6lCrsPDiX
         hi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742851866; x=1743456666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZMha2t/FZ5+K9Z9EZOfeX0DoxH1TC8eTZwVsJ1i/ss=;
        b=aUIhlbXIU/p7sA4GsT4LUi4YBBlsZh0Q3+DRAdriRiv5cJqqEeLd8Tp0yBHMvGpXWQ
         /9DvLQOZfNamASLzDnKAtFEHggZ4H0zIq1n4NPRqV5DdLMtZ0m8wIsgqGp7k0VqBNJnI
         uMpOF5ZaOcW8TFOE6hUSIWvAOnaZ7C51fyL9LyPth9kke6kIlbhm7muET1r31LLRKCXl
         kMsK+W4TLgqYH3vNsOzAq39JN2gur+fw12dbYEZdlKDNFRK8Rbhy3lULp+TYoy2vhGZw
         veRSRLRkRNS+4xFKTaZje6Vh41v3FAEuXYjpsNVTjdYx7uc9YYXR7BfTWpSRtApVQo4m
         TB0g==
X-Forwarded-Encrypted: i=1; AJvYcCWvcbGcajecIvKxbOxE2SyDyGRcWotLG7T8kEpAljfmOEFd3o0ezxLh3xgbx+34sAmMAvU7Hl2bwMp2OA==@linaro.org
X-Gm-Message-State: AOJu0Yx1gA1/2AFpT3MgqUNuwex3wz1uW+jnJQBgQcDfo7a5xSOxhT9T
	y9gqxZtXhO+Yk6gIDVa3B40B9HQHVkY8o1HpysC8k+PNhi7t0x3NWQmTykKZ2Uu5enV79EfHt1W
	fyK+AOw==
X-Gm-Gg: ASbGnctJCeFixRS/TMxbf672Y945zd0G1RRZQjZEMhppWTJnO9IqzesWqQ5ppuOBwla
	CGycwDMTnuCaGIeVtXyeCvRLjfqRG0VOCCaCHz5t0VgvcnlHs0gtXqqj6SmpRhI+WnaeSus3d+5
	xGj6AYY3YZb+zNOXkgg33DDl1zVNwH5F0lDsMg9wLplTruzYWkOZp/rIE2u0q8kpeKy4XjyRN+G
	9uDHF/ZYygq/u/3ELjUMRQ+CYPHdk8KnRj0sk1I0zCQmOsBTbeg5RByYBQY77/OA5GTay7BPFpc
	RKM4jxGjFgXmZYjFj4fg9E7v3ErANiHEAxKX9QGORneMMyy9lg7p8yntUA==
X-Google-Smtp-Source: AGHT+IEWM9SFBoRyuSSBgmsPzPEyPxIRrWFs5OX1/ahn8aCoiYKj7cEZouWUI2B4dIasMlmRfEjBoA==
X-Received: by 2002:a17:90a:d008:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-3030ff08de9mr28123196a91.33.1742851865643;
        Mon, 24 Mar 2025 14:31:05 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3036bbe74f4sm58175a91.1.2025.03.24.14.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 14:31:05 -0700 (PDT)
Message-ID: <6cce9fd1-d008-4b63-a77f-c091fcd933e0@linaro.org>
Date: Mon, 24 Mar 2025 14:31:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/30] hw/arm/armv7m: prepare compilation unit to be
 common
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-27-pierrick.bouvier@linaro.org>
 <0c9055a3-2650-4802-a28c-e5d79052bc81@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <0c9055a3-2650-4802-a28c-e5d79052bc81@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ux4qTEVXnupJ

On 3/23/25 12:48, Richard Henderson wrote:
> On 3/20/25 15:29, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    hw/arm/armv7m.c | 12 ++++++++----
>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
>> index 98a69846119..c367c2dcb99 100644
>> --- a/hw/arm/armv7m.c
>> +++ b/hw/arm/armv7m.c
>> @@ -139,8 +139,9 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
>>        if (attrs.secure) {
>>            /* S accesses to the alias act like NS accesses to the real region */
>>            attrs.secure = 0;
>> +        MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
>>            return memory_region_dispatch_write(mr, addr, value,
>> -                                            size_memop(size) | MO_TE, attrs);
>> +                                            size_memop(size) | end, attrs);
> 
> target_words_bigendian() is always false for arm system mode.
> Just s/TE/LE/.
> 

Good point.

By the way, what's the QEMU rationale behind having Arm big endian user 
binaries, and not provide it for softmmu binaries?
If those systems are so rare, why would people need a user mode emulation?

Thanks,
Pierrick

> 
> r~
