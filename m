Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2799744ejq;
        Tue, 9 May 2023 08:24:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AJlaz0ZSTk/NGVGYXzn2ut4RbgpRRPgi+A4TF4mcmIwYILBVARrQQWIxGlOWCaLa5DGsk
X-Received: by 2002:a05:6214:528a:b0:5ef:564a:3296 with SMTP id kj10-20020a056214528a00b005ef564a3296mr18234304qvb.44.1683645859264;
        Tue, 09 May 2023 08:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683645859; cv=none;
        d=google.com; s=arc-20160816;
        b=QVYpytNt1Dx8xHnvUiMuELGE314GZege+GzxqQmEkbPcyK/gI4D5EcAHiXFjczqwtm
         iB7hoHGWtfKglhr+j10IEwRrKiFXfRW7O+fEvd9IUdAbvuvBf4wchi3HIMGd8ZFD8Hma
         ShWOn5jQgQ6+kluzK6G1tu12lmyhGcU5vlcJDdCctAEmg7NyTjIRHWG1muuYJfx0i9+2
         DxF4ftWUhy2kg9yJZ1YY4oDvnEQGO7DX+VuJLUdEHdz0J/t9dcjXkpbwsKioNfbzT4sV
         Xtnw2k8+qdkObat5DEQTdrzgNpb3sJdj62Ba2xAhzmoLo7G4GcmhBA0bFWxLTtysIAo3
         DPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZdeB5ATc9Nu7Mp398+o+L4Ukszy670dmmLE3kbD+Bjk=;
        b=SjJU3R3VzbVUNDbPaTB7P+xXp3IujeKK2EtWWhNcfzpS+zWuhfSGorpBd6lp1eKiyH
         VkdvU2a73VBp2rMRJHcL63E1tAz4qb+NaY8Q5eOemRu94c8EvZUH1DVnbC9EJ33VJgFN
         JkkJLwEAjRwqCtAHDQpK7lnN3ZfJEN7VDeI3/UpSKOtiKOPMJc2NrqxHuVV7GnH7SLvC
         oHwN5fUQ5tP7YgSa2cCs+qkldkIHvQFp+1p5OO5I+iyHoMcTqlnZN9scB7uOjzIEvGdD
         e13S9iQKEFIp9Q41cubKIAPpdoagfxGT2+Exo1JaWzGSIczSXT5hC8dW65OuyYi9O47j
         /wxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gJOJXmbk;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z9-20020a05620a100900b0074aeca5a6f5si739398qkj.633.2023.05.09.08.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gJOJXmbk;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683645858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdeB5ATc9Nu7Mp398+o+L4Ukszy670dmmLE3kbD+Bjk=;
	b=gJOJXmbkdLqeQmrez325D2MUl6trYIT7MuNFpE8T4U6/QsULCFd/CUzneZOLinhxP0D68y
	01H/dYMqQAekqhMHCrsfPCZzzVPnk8Yv3rMQkZ6rCfj1Gw1v6kFw0nFFhIz5OLdy2Ugwsv
	Pg1B2pq/spPKsgkSwdpSX3dppyZ0+mI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-Lymmc2mbNFaMCr2cogNi2Q-1; Tue, 09 May 2023 11:24:17 -0400
X-MC-Unique: Lymmc2mbNFaMCr2cogNi2Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-506b0a2d5c4so6912999a12.3
        for <alex.bennee@linaro.org>; Tue, 09 May 2023 08:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683645856; x=1686237856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdeB5ATc9Nu7Mp398+o+L4Ukszy670dmmLE3kbD+Bjk=;
        b=Zrbni2mwvBZ5A5uQmryayFTSMNhOsMcJBO4l2qzxHxDjyc5CtZ3QY1+TpO+luTnijH
         Hq3b++zzCtKqdPcDzmcFcYZ0qg958uVkjT1d8zJ+gKyVh0orkOGaX+s4pLayVQsWLJ/Q
         IvkshRXvFYj1RmjV8I29qJKFkOMD+xOT6Q2eaoS4/gpZ2VDuq1s4VDSbC5VjBq45lYpk
         7WgVwSINeIgwTqSvcKfl8Av1qFivrHz074tWonou4yE1oWILH/3EpIERug9DHwNAqzgp
         hhcgE8vxGIgxjxqzEBViJjAT5SQ7pYPN5Okp6ZgL4xiIsHvoWGYEMC7dRMbnD95P3tIe
         aPnw==
X-Gm-Message-State: AC+VfDzgMxrGGPWyn2Ozi0mg1gILL/0lwLoU+xKqCgyPeDQdaPZp7WUU
	DAQp4D8bVs2xzXx7o16OR55VZCSwYS+5Rgx1/BjfjUV8wsz3yBOjfxzwG+aY2+mRNxkKiPCAThi
	Ql3hsCuqfeyGi++1O
X-Received: by 2002:aa7:d4d4:0:b0:506:976e:5242 with SMTP id t20-20020aa7d4d4000000b00506976e5242mr12092423edr.25.1683645856435;
        Tue, 09 May 2023 08:24:16 -0700 (PDT)
X-Received: by 2002:aa7:d4d4:0:b0:506:976e:5242 with SMTP id t20-20020aa7d4d4000000b00506976e5242mr12092408edr.25.1683645856154;
        Tue, 09 May 2023 08:24:16 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id n10-20020aa7db4a000000b005027d31615dsm862767edt.62.2023.05.09.08.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 08:24:15 -0700 (PDT)
Message-ID: <40863bd4-1aad-2428-7976-f31e6b7b893f@redhat.com>
Date: Tue, 9 May 2023 17:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-3-farosas@suse.de>
 <d51de29f-a23f-be79-049a-f15df2be7ac6@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d51de29f-a23f-be79-049a-f15df2be7ac6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hoSD9jmG/Rnj

On 5/9/23 16:49, Philippe Mathieu-Daudé wrote:
> On 8/5/23 20:16, Fabiano Rosas wrote:
>> We cannot allow this config to be disabled at the moment as not all of
>> the relevant code is protected by it.
>>
>> Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
>> KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
>> is now possible that nothing selects ARM_V7M (e.g. when doing a
>> --without-default-devices build).
>>
>> Return the CONFIG_ARM_V7M entry to a state where it is always selected
>> whenever TCG is available.
>>
>> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a 
>> KVM-only build")
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> index 3fffdcb61b..5947366f6e 100644
>> --- a/target/arm/Kconfig
>> +++ b/target/arm/Kconfig
>> @@ -1,6 +1,7 @@
>>   config ARM
>>       bool
>>       select ARM_COMPATIBLE_SEMIHOSTING if TCG
>> +    select ARM_V7M if TCG
> 
> Probably worth a comment mentioning this is temporarily
> required until <some magic happens>, so we won't forgot
> to remove it.

Yeah, this one should in principle be defined by the boards, but 
m_helper.c is included unconditionally instead of having some kind of 
stub for A-only boards.

Related to this is the (right now unconditional, later on only "if TCG") 
"select ARM_GICV3_TCG" that needs to be added under ARM_GIC.

Paolo
