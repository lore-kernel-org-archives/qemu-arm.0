Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp1003535ejy;
        Fri, 30 Jun 2023 10:51:46 -0700 (PDT)
X-Received: by 2002:a19:7418:0:b0:4f9:5d2a:e0f6 with SMTP id v24-20020a197418000000b004f95d2ae0f6mr2720434lfe.14.1688147506259;
        Fri, 30 Jun 2023 10:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688147506; cv=none;
        d=google.com; s=arc-20160816;
        b=MxOli8O/+FPkLpxLCgZ0sgaNvsJJFC1yRvETa7QCUEd/pmjo2hUy9Kx/UU0aavMJFE
         +/+KnVXHOMZvzgrTPZvB4kZaUeMjBFMnZCPWqiQgAMjxACUN/sPB+IK4FSZZy85Bw4cI
         +YOCxcZ6u275tHA99lSMCgOWQGFbuWisBAuE3WDlaNWKwb+ztVqRKfe/53zTiVlKCLMZ
         SG/2akX6NBc7xXYl+7UzPJFkgNVlPyd7k5Cmv8cPBDsDjNALM6Btr9YvomkRgEiFYgTf
         hw5VS6kUrvKZELMqlpk/OBMT/KRRIBIQtQIlIMzT78LTlmze0PKpzMil+G2y5GGkePjQ
         AKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BMniqV8Qa24ce3aH/nfEq1ieh79OKRsSEbO0YUUdqc4=;
        fh=eQ8y4mkJYSrqYQiT2aNW9yygQGn+xHBbVIU/HHnJ9N4=;
        b=sv9YPOT4+nqldfHXOBc8b5BMorKYgDmwe9u98bPrEZW94UfxwO9AoJckKDThfks95g
         xdBQQh+HLgmQdFW+NNWpQEahpvO/hB7sqQaG5gRy7pD2yKZNlcVXvlQBpcSz7NfIhSKE
         p+m42QNx0T/coaOSIVy/Gut/Of4RE6VyBouSzLH7HKBtq0AJ5cBVNfNMhFXo2Yo/ilNY
         qvpvsgv+mmCAlrPA82iJ6dR55LZHmuYuOhhcAdl9UxRkWZNtSxSXL2lIc8w2OZKEaycD
         5oX0sC4jqAamNOdUjxDPODRTrTY0GDcrOAZWm7T9AuWQz7S2nVFdhoGHtu4KH09+OhXr
         C+yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIF+UPmW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b22-20020a196456000000b004f607f926fdsor5782363lfj.10.2023.06.30.10.51.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 30 Jun 2023 10:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIF+UPmW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688147506; x=1690739506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMniqV8Qa24ce3aH/nfEq1ieh79OKRsSEbO0YUUdqc4=;
        b=fIF+UPmWasW2PfmGGUXn42ROcmwATgvJy90h3W0/BWfVvnfLWjBlOluXWCbBuUNwOk
         hsYIvuqCYlS5LCJBEuT/ueymBZoR4bnriSbEK2KDRwJgYOmLdh8B+jXG0r4TGRCRulqk
         9rORyDm97Hxio9vRmJWy6uuYIDXki69UuyCvsLpOxo+iydZV27WoA/nJxfu7PLvuCKu8
         s/paX3oDkgaZ4RIMYaZCaZ92CzHR6jXM8qdA5jBS+4+MqMT1lCg2X1exY7tOIeRpv6MC
         5NPqswzptQKNAEvA2LcySWRrKDDC9o1aoitsfp21bfkgV/6qeanzAVmy3SCVhGo7HDAt
         5v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688147506; x=1690739506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMniqV8Qa24ce3aH/nfEq1ieh79OKRsSEbO0YUUdqc4=;
        b=VLwWiqp4+im/Jn+zNIM9SD22U4OHdQg7PW4GKztx3AXRB3J67Pe3fE9hbu/r5t9Xwo
         8tyE9/jLS7kv7Q8Pml2gtjElnekGlR+d3x6jEWrWtkbaBTRruy98YN8MCOHoFtTxKAed
         8gFmNHAsNSRgscIgFQtsmg9cyaZNVT+QzhtE9Cclc3D/yuqzwDhh+kMH/ovgon4qbgyZ
         hFVO9Cpk5y+2qS/MKjLpRppqd530g3qhmdfpcRJFR8Kxx3eNsycrD86ijMpbiyksEazj
         u7KJsqBWXAq1UKQkFGZKXFfzjQRZxGTc4T55p2G/MlqdoQo9WBkKMcwKKootcD89k9Y3
         QkcA==
X-Gm-Message-State: ABy/qLbZkSfBcrv2ImF7h/ajWTrIIlHLmK24fSLK7V3/Jfr7sk/sdjem
	evCTyPXL0vgQxnX1RIifqkNRs5zi
X-Google-Smtp-Source: APBJJlESa29bUtSPxqS248gMCmZETvtNnWupWDfKc+G1dpQMFgKHsMqEzcsLw16ZpXGSlQ8LrxtygA==
X-Received: by 2002:a05:6512:3c98:b0:4f8:7614:48a5 with SMTP id h24-20020a0565123c9800b004f8761448a5mr3210195lfv.66.1688147505772;
        Fri, 30 Jun 2023 10:51:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.208] ([139.47.41.96])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm5479822wml.15.2023.06.30.10.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 10:51:45 -0700 (PDT)
Message-ID: <e4997bdf-502e-5e45-f0a6-63f6fed0cef7@linaro.org>
Date: Fri, 30 Jun 2023 19:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/8] target/arm: Add ID_AA64ISAR2_EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
 <20230609172324.982888-2-aaron@os.amperecomputing.com>
 <a8db353d-b258-c856-d5ce-1236b0893a53@linaro.org>
 <ZIcbF8zShOr1N2Sl@strawberry.localdomain>
 <CAFEAcA8pjgXXnUcLxcnm-9mcakps4KcXKOvHQxzj7n_CzY2zSA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8pjgXXnUcLxcnm-9mcakps4KcXKOvHQxzj7n_CzY2zSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Msp1Y+qFQSaA

On 6/19/23 12:51, Peter Maydell wrote:
> On Mon, 12 Jun 2023 at 14:18, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
>>
>> On Jun 09 13:49, Richard Henderson wrote:
>>> On 6/9/23 10:23, Aaron Lindsay wrote:
>>>> --- a/target/arm/hvf/hvf.c
>>>> +++ b/target/arm/hvf/hvf.c
>>>> @@ -847,6 +847,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>>            { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>>>>            { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
>>>>            { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
>>>> +        { HV_SYS_REG_ID_AA64ISAR2_EL1, &host_isar.id_aa64isar2 },
>>>
>>> Sadly not defined for MacOSX13.1.sdk, and it's an enum so you can't #ifdef it either.
>>>
>>> You'll need a meson probe for it.
>>
>> I'm not very familiar with HVF or meson - I am not sure I understand
>> what you're suggesting here (and a few attempts to grep around for an
>> example didn't turn up anything that looked helpful). Are you suggesting
>> some sort of build-time auto-detection, a "dumb" configuration switch
>> that a user could use to manually enable this, or something else? And/or
>> is there an example you could point me to of what you're thinking?
> 
> So the first thing here is: where is HV_SYS_REG_ID_AA64ISAR2_EL1
> defined in the first place?
> https://developer.apple.com/documentation/hypervisor/hv_sys_reg_t
> does not list it.
> 
> If this is really the right name for the value, then:
> 
> We do our build-time detection of stuff that might or might
> not be present using meson's facilities or that kind of
> thing. These are all in meson.build. In this case I think
> that what you want to use is has_header_symbol(), which
> checks for presence of some symbol in a given header. There's
> examples in meson.build, you want something like
> 
> config_host_data.set('HAVE_HV_SYS_REG_ID_AA64ISAR2_EL1',
>                       cc.has_header_symbol('whatever.h',
> 'HV_SYS_REG_ID_AA64ISAR2_EL1'))
> 
> which tells meson "if this header has this symbol then define
> this preprocessor value HAVE_...". Then you can #ifdef on that.
> (We're inconsistent about whether we use CONFIG_FOO or HAVE_FOO
> for this sort of test.)
> 
> Or alternatively, since this is macos specific and Apple are
> quite careful about API versioning, it may be simpler to use
> macos's own version macros to ifdef things so we only try to
> use the enum value when building for a macos version that knows
> about it. Grepping for 'MAC_OS_VERSION' brings up examples of
> that approach.

AFAICS, there is no macos version that contains this register, because there is no Apple 
cpu that contains it.  I think we should be fine, for now, in omitting any HVF change, 
letting the register default to 0.


r~
