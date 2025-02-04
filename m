Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp125031njb;
        Tue, 4 Feb 2025 02:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXH53dcKhDb8IYoSscF/JCGhTCSBcZGMT8Eh4bYQ5T1eLVM+tePanqEer9DspHCbu0FJgYVqSXKg/C2w==@linaro.org
X-Received: by 2002:a5d:64a5:0:b0:38c:3fd1:6164 with SMTP id ffacd0b85a97d-38c51e8dc97mr18710353f8f.42.1738666093404;
        Tue, 04 Feb 2025 02:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738666093; cv=none;
        d=google.com; s=arc-20240605;
        b=Ey1KXSX1APQqHwMAU6CN/g/Jtxa71oj3sG0J6gmMZviyeQXdCoA1pEUT19RylW7Kws
         DuWuMMW35Mbo5rlhieCtp8zfMjadcK2V84BWuHXUiowJChkYrKCTJkEsJlhcGbO8yYC9
         EGithYNgZ4cbZNErnqi1qLh9ZfRyi+vk+9dFB1fg+qfw6Y8D9CXdnVp5GwzAEAOVFsIZ
         QegBvZb1T8yjQgpY7WWltCZSCvFVrQPl4W//+OZOW3cRKVqz9KQYz6Eb3EIkOQzscTvf
         6ekLHSVzQ5cYdGuPhNMMzwpTNHgBEKGBQ7DSl9ncZTlYfvAjRw8tfB9JGIYOxCADGDNx
         dU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4hATsIhAPEZ088vEoX0wRpa5znwmory8rQu1kxTiuaM=;
        fh=YoxGjZSy6WYGo3Mh0ZiQ/NtjsjGQ4yGHJ0OTwWiSBTY=;
        b=X/ZvGtrN56wpfyjD6YibKt8r3ToSoQfwuA8LPFjHcwTPGeeXIpCwsltGpBdAvSUbXb
         j2bumJF4vohGDXypQf+bQv3xxPGXWR6yNVEdrMvHn9iffnZ6LOLg1A629Wi5/tdT02k1
         KaJuZg+xndrTGs/Y0YoijRpn0VP3VDbUDGzCAtABEg0xZ+fqC2qox4zoRFUEba7TCRGG
         JpkR9jdODCwEEFd9NUlGwQKKdj9aEBeHrUZrPlDZo5EdTdxW/kchk7xYITTkvIiMDrE0
         F/EneeufgEOpYDTWsSWkbJcaLy1ybcuRoxD7CqytIPsbuHhq4eifaXrlb/V11Ssk18dK
         1yuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z7P0IgOf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e2372035sor48811005e9.0.2025.02.04.02.48.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 02:48:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z7P0IgOf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738666093; x=1739270893; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hATsIhAPEZ088vEoX0wRpa5znwmory8rQu1kxTiuaM=;
        b=Z7P0IgOfr+xzMbnzRFtBj8Hn9A3UFXRtLGBMCHLFIQdrARBh7wX3aNYL2j5ErtCiBl
         LrLKwoV2FFQq8vpU3J5KeM1x9g0Kez3r3kSpVKNo5LGNc5nAGd1xDLorRrLJGiMRVyna
         ldNfb1Yl/7E/Q3Lgoer+biMNBYvTevSBX7JYBEUaa/LTLm+dloer/zD4i0oTZGmFu56O
         BaMlGYxtlW4i7JGAL/oMFYnMhNOvoMIvfSRoZ8bKFNAmXI1eVXpcIm9ZQo2fPYZ65Ndq
         xjRNz6t/x5DDk9eelMkjjCvUSW6o8uXBQCA/KKd9c2Gtk+wtqHIazGudz96dn7r75lgl
         eY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666093; x=1739270893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hATsIhAPEZ088vEoX0wRpa5znwmory8rQu1kxTiuaM=;
        b=himUlOjlSGQRpb0jpjrHqxbLEBGCn8UY0beyU/SjzUk4pS13Xq2/zaY3UyjUg5odxv
         SnFliG07v8RJZO+RrffWILS3POSH0htSUpE3WWl9rmGKz4vrS1DHrIb3oQ04UEGdIGZM
         LBoQ+ppr1Joky4h37hDLyjgDNL8G7GmtB1XwM1+mNG24vd3VgOeoFT+QjybTL4gQVv9m
         R4n8EfGnvfHzJIK7GJnZUHQy+tD8YI2NK4v3hE9Wt5qfTnKWMVWuIl0wszTd/QduzvbY
         X1AvuZuNDIgr3Z5ypA4CYwbW8DLtkNGO63/dCFwT+mmkWFOaLl59APt/immnQcOSyR+T
         W2+g==
X-Forwarded-Encrypted: i=1; AJvYcCWFhJekhCOHxTo8m6rFQEWalCtZnr1HW/SlCZcdwLeWmEL3HHgMi8Fptj7p2mxbqkIceXhMtZZPCViv5w==@linaro.org
X-Gm-Message-State: AOJu0YyiUNUJSIDQxdCSfYGv2XQaiqEpREcV3t24+0MUV0wSVhBzXEEH
	uwFLwFEuBgdRrBgEgtS2eSk5CgwPIBRlF/ExtZLq3my/4cisE7z1zfMS2DRNs/2JKC4uFX6JJC8
	5v8N1UA==
X-Gm-Gg: ASbGncsuegkBJqz7AocQ3wRabQr/rAvjzq0pirwIxUJtVcM4eCCacyVwG3odTIN7AlA
	BUBwAhV+qqJfO4PDmGveX+fI4ohfcrtPe/z/YoHJXM4eIZG1BD7z8TqX6H6I4WMlJOGFEpo/ibf
	g0Z0Y2uLCxrc7A8jTL3Z/j478rVxOECNZSn2OhdNJRvjGqOX45zSTrshVBugPUtinmxPckYtb/p
	A/ofP0jOl5TCgctrKJWxcySDTf9VJ+4jcPd5sAGW42tECglvP87kCCfFfI4Lj9WSHOLBM7iNrrF
	9Zy6FoXv8hXIdb7WsvI6pI69Lld9KPq5mfJMyFgMiJlcgKbaFNFb9w==
X-Google-Smtp-Source: AGHT+IFFiKgC/r4IEwG8B5YHkgiXLjbxAbGsXv2FjurSHxT9Hqm874wbeDOkDWebiML/nA+8Z0aIeQ==
X-Received: by 2002:a05:600c:ccc:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-438e07cd868mr179529545e9.21.1738666092864;
        Tue, 04 Feb 2025 02:48:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [10.53.21.213] (88.171.88.92.rev.sfr.net. [92.88.171.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42dfsm189380995e9.4.2025.02.04.02.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:48:12 -0800 (PST)
Message-ID: <18ebe0c3-7ae6-4ba4-92f1-452a613d2c8d@linaro.org>
Date: Tue, 4 Feb 2025 11:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
 Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 devel@lists.libvirt.org
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
 <Z6HklNsu0Mzgh7bC@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6HklNsu0Mzgh7bC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hOTFMwc/t9M7

On 4/2/25 10:57, Daniel P. Berrangé wrote:
> On Tue, Feb 04, 2025 at 10:51:04AM +0100, Philippe Mathieu-Daudé wrote:
>> On 4/2/25 10:22, Peter Maydell wrote:
>>> On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> All previous raspi machines can be created using the
>>>> generic machine. Deprecate the old names to maintain
>>>> a single one. Update the tests.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>>> index 4a3c302962a..c9a11a52f78 100644
>>>> --- a/docs/about/deprecated.rst
>>>> +++ b/docs/about/deprecated.rst
>>>> @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
>>>>    Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
>>>>    CPUs. Big endian support is not tested.
>>>>
>>>> +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and ``raspi4b`` machines (since 10.0)
>>>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>>> +
>>>> +The Raspberry Pi machines have been unified under the generic ``raspi`` machine,
>>>> +which takes the model as argument.
>>>> +
>>>> +    - `raspi0`` is now an alias for ``raspi,model=Zero``
>>>> +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
>>>> +    - `raspi2b`` is now an alias for ``raspi,model=2B``
>>>> +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
>>>> +    - `raspi3b`` is now an alias for ``raspi,model=3B``
>>>> +    - `raspi4b`` is now an alias for ``raspi,model=4B``
>>>
>>> This is not how we typically handle "we have a bunch
>>> of different devboards in one family". What's wrong with the
>>> existing set of machine names?
>>
>> Zoltan and you don't want to add more machine names, then you
>> don't want a generic machine. This is very confusing.
> 
> IMHO we can have distinct machines for each model, but
> *NOT* have further machines for each RAM size within a
> model.

Got it. Unfortunately I spent more than my hobbyist time credit
doing this, so if I find the motivation to revisit, it'll be later.

Still, having machine memory size depending on the host config was
a bad design choice IMHO, as we test different setup depending on
the host being used, so not really a "reproducible" setup.
