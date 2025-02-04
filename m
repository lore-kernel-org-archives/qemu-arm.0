Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp102698njb;
        Tue, 4 Feb 2025 01:51:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEipQyu9XZdfZGM++X/2THe79qNBIOFAZ9eH4Enhg5Od3byO9bK9lybUmmjZL8fvaEqJ0C/pEUExyQyA==@linaro.org
X-Received: by 2002:a05:600c:3b94:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-438dc3cba35mr260656385e9.18.1738662667160;
        Tue, 04 Feb 2025 01:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738662667; cv=none;
        d=google.com; s=arc-20240605;
        b=lYEiSWZAl6JCHfxEdO8v15/g1pqJ4a/5RNpnhxjCqqX6QP29w2xzlY2zgmWhaOCjt0
         u1tr/4LIGD6N2LVSNFuYdntjrtChWSHsw0r1peKhVt/HXiE+UoP4kAKId4ckm7Sprj4d
         nL6cZyPDLj0YYa8oJ1Njf8xSSGTv2iDha16Q/2bkSQCGKE+/5tcCOzV1U5uOm+CwT+lH
         MF66Kb9kq6SaFkxmzpSfEUUvhutFbD6i0LzjFD8ZP0BGUkiXPqeWA1BwhppPsCvhRPX2
         rtUMR5GdJL8cjRGGKPB+KonCTzAr6W2KGg/oLP1Q1sOaz7GkOnpujc5lVXkVgE7kqb/B
         wlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zHTiKGciijEmOOrMPs2vI15Mn9KBYN9ZOQdMuU5NI3o=;
        fh=M3WJUHbICDOrGHNY1odo6ow+DuaJTq/6DsXP2frHlb4=;
        b=JsMKLtBtrC2GKAAGlHTeced5XE8TjbyCxqM9XswW4UIMkycUHNB2JgtKHVXpkETpke
         OGR9aUUjJBYQ/iit7glkzNjh/WEW9SLx3jyD6HodQgRp2fjBBXOyXOl65QQ2uadfV6+e
         6QuL50tPWOeyhXmGsbpwJGF8PkT4+5z90qAd3dzxf74d3JewnIn/JIAVp6fStbp3CxiV
         asp6KgSpdofmaFk9DsqqcnCBkueHRALth398fL9aC2dmB8CrRiIlxkcPwwdqvjIde6Uh
         Ivpsx3rVGF8wouEYHweWKzVcMKLHDfe7nlUcAzPJ8fhhgtQRe6cDGd8Qju9YkruDJ7C3
         Gdqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QTyfQpWv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e2462056sor56313935e9.11.2025.02.04.01.51.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 01:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QTyfQpWv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738662666; x=1739267466; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHTiKGciijEmOOrMPs2vI15Mn9KBYN9ZOQdMuU5NI3o=;
        b=QTyfQpWv1JEOU94MTYfv3GIA8HsFO6/Ak2cjLnQRz6P5U0aMuyYUO+yu+1IiBeaCFj
         igkvPHTwtsvsu50M+JGcjJlesET+9z4dktDxFpQt7N7UjQda54v9qCRkdkk37tY16ppM
         EdWOmqWOkksuDDksWtjfJ08bYf36uhYbnZXxif2/rXxuWuxMAXvY9/3tnhbJ7D+51tPa
         PqibjjrQB2v4O51irF8aTbHa29Zchu8zX5IDO3fHLVF/g88yO0xGvQ2++wjbr41+T6uT
         s7u55XC6rs8UX32OlGGt+t4uoDR+1m/WLuoQquoN5HDGKUQLIndO9zFfe4QK6t+4CDyw
         9kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738662666; x=1739267466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHTiKGciijEmOOrMPs2vI15Mn9KBYN9ZOQdMuU5NI3o=;
        b=wkCqL5BToiEy+WhZXWAf0IyyXTEYbW5dy+X0BgdWoczsAv9AJU3MEx0viT8BdDv3PM
         LbEdeBtHzG4uILfEWeBaivyw7u2VUsFVWEQyQq+C4hCsmU+TVpyqm7QW2vmIFOkVXTqJ
         OCa5pVmtgufEsagM68xECCSTkR0lNoj965+gsyIC/7/gUCt2G4weK02PtQEhbpg/iLWx
         8v1xH1UB+h/YvDI0KyIrpVWcM5lCGKziE4F06StNJz9zHLmQSHA8EAj0Crz/qqOt60sk
         7Mwzq8adSo6+0T8QDrwCZnDLk3joaqeCyExZHv5f+wBYT3zD3yxuURh4mkGjnAPMo275
         l3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVPMm6Qt0xiXMTGmRsS6HvNmmjIr5b/u9EhQQCU0+kqG6app5D5jdvB9WRlw+VKoJRiUb2LaiOD+NkLxg==@linaro.org
X-Gm-Message-State: AOJu0Yz0HH7GP6l9JduBFIyrZ8RYf5scBJK9izSsVBMC2ywW54O0yHRm
	YDU5oN6PvC8eHRIOsJQyYvKR7W75/8UbLN5d0/iTMNAp4+2mOWrBPLfSsbjCAT51pg==
X-Gm-Gg: ASbGncvCnAf71oN9qRIrSPVVB0iJCO0uehaqsf/eC4AOqa+0W9k9mcdqmUOSQHgKcSL
	rdnuTnthqU8n+Bx8x3czT5gpkqxdDFMpZTRicJD47JCJFX+LqGl2FqZ9am4pFkxLqdAebd2pox/
	UqtrGn+pbiyLNUtx89/97tP2J96+lnvdaTkRn6n9gR5PQ3n6mIdEbYbU30cnDemUaMJAHiukAAS
	OITAtdfYYPNhQMB75LqFkgebCv0KVj7QgjO0lXHEO+2Weq1Hz1D4Sh4EKDMYY2BpT9H0lXDw0xz
	4tzuQXjs3cbs1yeHQ5dpWg7zSuG3mM2U3uEH3zuJWK9XddJWNJ9GEw==
X-Google-Smtp-Source: AGHT+IHsjir6Y1YP0vKuYkcSeYGJbHjfoOK+M+2YiB12ZURwGXwSSIIDmRpizXJCbMttApG1sErjwQ==
X-Received: by 2002:a5d:64e4:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-38c519378b7mr23839129f8f.5.1738662666550;
        Tue, 04 Feb 2025 01:51:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [10.53.21.213] (88.171.88.92.rev.sfr.net. [92.88.171.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da1a11f16sm4235694f8f.14.2025.02.04.01.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:51:05 -0800 (PST)
Message-ID: <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
Date: Tue, 4 Feb 2025 10:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Laurent Vivier <lvivier@redhat.com>,
 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
 Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 devel@lists.libvirt.org
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BG4hUlCg3kAQ

On 4/2/25 10:22, Peter Maydell wrote:
> On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> All previous raspi machines can be created using the
>> generic machine. Deprecate the old names to maintain
>> a single one. Update the tests.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 4a3c302962a..c9a11a52f78 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
>>   Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
>>   CPUs. Big endian support is not tested.
>>
>> +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and ``raspi4b`` machines (since 10.0)
>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +The Raspberry Pi machines have been unified under the generic ``raspi`` machine,
>> +which takes the model as argument.
>> +
>> +    - `raspi0`` is now an alias for ``raspi,model=Zero``
>> +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
>> +    - `raspi2b`` is now an alias for ``raspi,model=2B``
>> +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
>> +    - `raspi3b`` is now an alias for ``raspi,model=3B``
>> +    - `raspi4b`` is now an alias for ``raspi,model=4B``
> 
> This is not how we typically handle "we have a bunch
> of different devboards in one family". What's wrong with the
> existing set of machine names?

Zoltan and you don't want to add more machine names, then you
don't want a generic machine. This is very confusing.

See previous patch:

   $ qemu-system-aarch64 -M raspi,model=help
   Available models (processor):
   - A          (BCM2835)
   - B          (BCM2835)
   - A+         (BCM2835)
   - B+         (BCM2835)
   - CM1        (BCM2835)
   - Zero       (BCM2835)
   - ZeroW      (BCM2835)
   - 2B         (BCM2836)
   - 3B         (BCM2837)
   - CM3        (BCM2837)
   - 3B+        (BCM2837)
   - 3A+        (BCM2837)
   - CM3+       (BCM2837)
   - 4B         (BCM2838)

Can we or not add the other raspi models?

> Can we implement "support more than just the fixed amount
> of RAM" by making '-m 2G' work, without changing the
> machine names at all, please?

We surely can if we find developers motivated to do the work.

Regards,

Phil.
