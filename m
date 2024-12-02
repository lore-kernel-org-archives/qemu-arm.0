Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2695274njk;
        Mon, 2 Dec 2024 02:58:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNrc06F2tyBbwodskEl5E/akg+LaGt9FEAwjguaVKpYzv7aBq5SeXWRux6q0uN/ekGrM0iFXoegeNsyw==@linaro.org
X-Received: by 2002:a05:6512:39d2:b0:53d:ec9a:138f with SMTP id 2adb3069b0e04-53df0112687mr12005818e87.57.1733137124365;
        Mon, 02 Dec 2024 02:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733137124; cv=none;
        d=google.com; s=arc-20240605;
        b=OnRrzwfZ5X7cEo5lBvxfDMD5vJQEsVew9XCoiy2BkQvtfrPkU6OAcgQ2QVObWZJnLF
         /Lp6h0g3XAWvoIhw+qL1e0tS1IG7dWOC42O7T9maoniv/7/HJmOtVR5l+xpRgj4ibXhc
         1S4/CF3HKdfke63usK/r7FvEOAt463wUIQiu0Bgy92r3Kcn7CZAf7d/09JR4QqV3hrMR
         MA8C1xtOCTGKqAuejtgRq/FG/aZc+oFy0vZS6JPImKdCxts0okxJsuJyFCmdfZ/UuqcC
         uH7hdW2M5CKpSwnEnN27UalWx0ixUg+OF/liHWOWRLo2Dnala7Kq14/pBAxvFFbTwPhx
         oyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=c8jm30HIJIHDRqV6Q97GgxCiYLshI3pxdnrd4Buw6EE=;
        fh=7SSHETaeoeZCTKqWl2Iih1mupux51e7p5pJZTjPBr+4=;
        b=NsQs82s13qtE6Zsz+fkgy4yjhXuiTB7XUJq9G5NYB3VxGNs1kAwSJSKE0voqyaLLfC
         sM/VCUM2C9gimXUs1qoXDVPNQemVTkLYn4cT4HUzKXXe+tze8jxdvcFmhUiOOvqbkobU
         VGgD30xrkSt7vAsLn0aGNL0yLNO2IQiNkR32Lb0inOP04GF14DxAWE0/9vxgT3sc2XIo
         bUYvUqdd+odbEINVV5gzLf1ZBXbKRwF7gqtXPe5v/iiR2v+M9Ml1KGkzNQIbBXglH9mR
         T9+8R2BW0x9Up/HvLFiBxHfsiSlb+4f1INymuMyKxhL8qSQcJrPQmYYyKtdcA2LLwgIB
         WasA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nN0I1NWp;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53df6496db4sor1682632e87.29.2024.12.02.02.58.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 02:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nN0I1NWp;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733137124; x=1733741924; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c8jm30HIJIHDRqV6Q97GgxCiYLshI3pxdnrd4Buw6EE=;
        b=nN0I1NWpjnbcJOU7KM4Kh0tzcR1ntgmb0NQ728kDYA75mDGfpOms2HW9BFCCG7X2Jx
         V+a5GnM78iqkJd6sn7RqWSLHTB/GC/TDZVPhQIh4C2u3eZf1NZTpngkxm+ekPKqolpmJ
         5eDGXYNDAZME2R0gHXCV/VRuIOcbS8l0xjYZywGrkZC7t772i+dxnUkYLgViUh2hX4tb
         tFFfmCN6hIXNFifeU1ZdD18LwzQsVsk93zhqgu4ifz8Rrjvs19HhStxTJSYdooq321S2
         kZpS0T81pAo8chJQqmikVTvpG1lar5KmQ2QqDIBTiyrGlOQN1RKn/ym3s47OX/meKygY
         Jt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137124; x=1733741924;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8jm30HIJIHDRqV6Q97GgxCiYLshI3pxdnrd4Buw6EE=;
        b=NRviDsOMTDfbT468T/wquWccYhYNswlGZlVDu7l7gZHBcMvlH6htPhDfYR57C8R/OY
         O7MQSh9dNkFU/Y+UDabxnekWIDMpKqD6cvCTp+aDkSLa+iB45BLDjA//pHgSHNJLgBTG
         LxiVUpwA2joIPFbVT0YQBZO4TnskpzUjWhfKOan6o5LBx2GvwsoCQrZuLrRFuTNo9CLS
         Hu+FRiXWx2NjiQLLvyHvUNwk692m/GIVEfWnW73KPRUvpOnrU/qor5b+i5TbiInCSKGv
         k3DEr+vy2FzZaz+TOJI/NLrCE2VXaww1rlOs0GMCBMJ89AIlQ64WKAF5DNqmm9i3epge
         zE8w==
X-Forwarded-Encrypted: i=1; AJvYcCWYEHlwsZsu+zuPkvVb3LsBj+7uPvWDdI5QbQ8LsMC1FrEoxuo7TL/phWDEYpvNVhHq1qLPU31bSamCkg==@linaro.org
X-Gm-Message-State: AOJu0YzvLeLA1+4EktJRC6ihY9UmUoNPluH/+yCVivAs1ooAnDiQZ2zp
	9cJXR8C7na5jKjD8cQYTUl3p1Xlsg7Mm2DH9QLp7+8I31fOCVCIX55N4cVoUXkLWPA==
X-Gm-Gg: ASbGnctGVglZtlKPsX2bHLoCPySotgfCj1A6tdM3wGkZs04MDGOMVejRkz13/IEMZlt
	MW0gK7BpTo5X5gMrUXeJ6inWz3d4HJ64vW3OlWYdXHCDb9vaa247e6qYxKo+wr1lWZfLoRXmWhk
	4GC4n6A+BVEqAKwUbG8PTQi0WbP8U3QUkqc9L0H4LWI0JEwhiXYYXswI1x6O2g8h7V4flkxC0iJ
	RmaZyZBZSXa9CZesdKzN5XKE14KQZtlFtSZwmOgeUnZyGhyxIweYxgwnhnyBEGIWfT4VZlT0bx8
	CvbKZHwev1g07+Yn/vL7aaOZu/Kt
X-Google-Smtp-Source: AGHT+IH7dsn19ofz+BupGbFw7tGSjLy2B6mpxA9PGkJhftfXmFKk7nrnousYCt6ixB1lc5fD+vo29w==
X-Received: by 2002:a05:6512:3e08:b0:53d:dbec:9fca with SMTP id 2adb3069b0e04-53df001abb1mr11580153e87.0.1733137123731;
        Mon, 02 Dec 2024 02:58:43 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.210.26] (83.11.10.28.ipv4.supernova.orange.pl. [83.11.10.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646effdsm1434026e87.130.2024.12.02.02.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 02:58:43 -0800 (PST)
Message-ID: <21d8399a-91bf-4599-a73d-351f9f0c147c@linaro.org>
Date: Mon, 2 Dec 2024 11:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GLKlws8vtbSa

W dniu 1.12.2024 o 19:09, Pierrick Bouvier pisze:
> Hi Marcin,
> 
> On 12/1/24 05:34, Marcin Juszkiewicz wrote:

>> So RME tests probably need longer timeouts or would not run at all.
>>
> 
> By any chance, are you running those tests in debug mode?

zOMG, thanks! Turned out that I left "--enable-debug" in my local build 
and forgot to remove it.

90s vs 2974s is a difference ;D

>>> +++ b/tests/functional/test_aarch64_rme_sbsaref.py
>>
>>> +        self.vm.add_args('-accel', 'tcg')
>>
>> That's default value so can be skipped.
>>> +        self.vm.add_args('-m', '2G')
>>
>> I sent patch to bump default memsize to 2G recently.
>>
> 
> Is that merged already, or will be later?

Still in review queue.

>>> +        self.vm.add_args('-M', 'sbsa-ref')
>>> +        self.vm.add_args('-drive', 
>>> f'file={pflash0},format=raw,if=pflash')
>>> +        self.vm.add_args('-drive', 
>>> f'file={pflash1},format=raw,if=pflash')
>>> +        self.vm.add_args('-drive', f'file=fat:rw:{virtual},format=raw')
>>
>>> +        self.vm.add_args('-drive', 
>>> f'format=raw,if=none,file={drive},id=hd0')
>>> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
>>
>> sbsa-ref is fully emulated target. There is AHCI controller built-in so
>> only "-drive" argument should be needed (no "-device" one).
>>
> 
> I followed official instructions from Jean Philippe to build RME stack, 
> and I think it's better to keep them in sync.

OK.

>>> +        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
>>> +        self.vm.add_args('-netdev', 'user,id=net0')
>>
>> e1000e is built-in already
>>
> 
> This is needed, because without this, there is an explicit wait for a 
> network interface when booting. Adding this device allows to skip it.

Thanks.

>> As both virt and sbsa-ref tests do "more or less" the same stuff then it
>> would be good to make common file/class and reuse it both tests by
>> adding hardware differences.
> 
> I was thinking that at the beginning, but most of the config is 
> different. The only common part is the nested guest test.
> 
> However, I didn't see any other tests that were importing functions from 
> other files, and since we want to keep those two tests in separate files 
> (to allow parallelism), the most pragmatic solution was to duplicate.

Fetching firmware on sbsa-ref is done in separate to not duplicate it. 
Which gave me idea.

> Overall, tests files should be as simple as possible, even if the price 
> is to repeat a few lines.
> If you have a cleaner solution, I'm open to implement it.
