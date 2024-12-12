Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4971003njb;
        Thu, 12 Dec 2024 09:46:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQtDjEd1c2sddC99Ou4V5U3N0X8thcLMjaV8Z0iRf9y5jeZSSGt9+Tz/GZfs791pSdjJr2mqkXN922zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFa5GXiyj0BS+x1G+Yge0mXa9sslTm7bxvpUGyMJp6+FVzYe+NvyPXRGr0xoFUOHODFYYzD
X-Received: by 2002:ac8:6f06:0:b0:463:648d:32 with SMTP id d75a77b69052e-467a13e0b3amr23533901cf.0.1734025577767;
        Thu, 12 Dec 2024 09:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734025577; cv=none;
        d=google.com; s=arc-20240605;
        b=Jk5owOht7/e/pAeIqqyuE676zCTSHeB1bZmKePq1XNU6aWq359mWpsLr6YQlyb4O7h
         VPTyyfI+P/AjEY998xyqfBJvs+0wSHGZc8QGPJJplJP8k1r/jWGNDjO95Q8hTJRLZ94R
         hIyxLL4M94P/xMHKFj2tSpyTGoweX37RLEng+Rrty6mwlPOh3XGGWRRhO997K01vtkWe
         Sx6yA79Qp5v+sGB0ytCf+TLqaDRAEI/Bimwdv/whDaZh4Qxz+vuCxRJBIFWbLwLPrEgq
         yOcbOpqSVW2o+IgG9h+HeKKLrLAIPJK5g9AIdHMLpOnpg4Qjg+29xwZJx9OjVHkQzbMC
         L0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=yBznrJE56VRWhrBvxk3/sZkoRE2CzrKK9JIJqvtRp14=;
        fh=4eQyGTR/bwY9elS0gCoV7ZFM6p/UMzSTeaso9xKCot0=;
        b=ibYKLXRbLADalqwKxrbWsRN0ArStFvYa71J4A76YDC9xOzq9M97PRPi700yfytKraq
         gqjzW//y121wNy6xHkTJwvRh7sPek7f5iXJ20SMq54XXussmGLE6FwBFPSTYA6pFj5ti
         wS59cOvKWYRW0Dovmckr1RhGNmv4vcluDmczhagR63Iejqx2Bi2tx5CJpgfealOQZ0FL
         m9KWP6FFmV7jn7kBNjCd6WYmn5NbXVNpxSgqjZRffqhzdOdjpfrb4r6/oYbUV7/YNG2n
         D/fCIIeWVfqAD/HmnT8u/AIJa5KVRh+8RhxBpV89W3JxwItrkijD+M2cDOaBO3ESAw5s
         GzRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDikkh6J;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4678348fb1bsi65129581cf.265.2024.12.12.09.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDikkh6J;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734025577;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yBznrJE56VRWhrBvxk3/sZkoRE2CzrKK9JIJqvtRp14=;
	b=bDikkh6J2Sl2eojWe6Vk9+cSfdb5DhFQdDyUsc8ZEYALLeZuqPsZahoNHQy4iZC9QgKiw0
	4TqBgBl62L1qGoBYPQnMTP/vYY24hVlUbuWh7MYGO4MdsK8NA6YJEzjThrMptPjMngBVj3
	x1FR5OUT1KaIKi2fGNgS0olsS4I90sw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-R3EYA-pxPsudogrEeI5Tyw-1; Thu, 12 Dec 2024 12:46:14 -0500
X-MC-Unique: R3EYA-pxPsudogrEeI5Tyw-1
X-Mimecast-MFC-AGG-ID: R3EYA-pxPsudogrEeI5Tyw
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4678f97242fso24381041cf.0
        for <alex.bennee@linaro.org>; Thu, 12 Dec 2024 09:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025574; x=1734630374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBznrJE56VRWhrBvxk3/sZkoRE2CzrKK9JIJqvtRp14=;
        b=fW7Po0wgXAi2Eb+pR2ZNQxamF6BBFMNuejlPOnz5ghqm4oA+9XgiYRXcVeMVKQU9AF
         Jo+Ga4FAiK/aN4q50rT2DeE4GQAH9wm27yhhgVlS0wISIQvbmOsWpxyBDQuBIrRdvBsg
         aPMUNLXIEEmQBL5KLmJDzws4x9on3bi38MHHNhhPQ9p/rsVfqV6vI+nWjhGIi3RgU2Zc
         a9Nlxyq65wCS2z77xSOV7pFO4DSNX5PNwkuLMJOwiM3tdQY4O3YMvKrafGzxYnRzqzZn
         wKLsZ46lM4siNvF1YeVDjxRojhCyrKCpnQMyYSsatczZgeABWxJa1zn+9Ll1jf4ymR7B
         lLGA==
X-Forwarded-Encrypted: i=1; AJvYcCV7YkjrV442VGKd7pD9YQROCX8SD2TH9RszHAKi3XLk6zpQfzQuhnxWMvUgO3rzbVfqoP/e+G5PC5+aog==@linaro.org
X-Gm-Message-State: AOJu0YzH62eR9SnMKc237f7wXPi3TS8c6kU6sueZ+hWhIZCBPzDO6IbK
	OU8d0bgTrbghv42tqX9ZqUMBzRBZFlZNOJha9mPwlPPunbOpqhOwZ1d7c6saGVzvoaYtcUZn13J
	IUKmMK+Q2hnqBhtepbfHqvqleIPGB/92ki7DNaEJecpr2xKGGRclhcg==
X-Gm-Gg: ASbGncsNgGLwe+AweNN9M2cLmIpttZqkvtmZylfSDCfuumq0xqeeMni1GTIW5rPtTU6
	pJjKi9TYFVjdCBGSFTrMfchZxrG3rYx32xP1Ba/3fMOWcd+mxMa/OuQZKmciJnrJaofJM1EPUGV
	7WBTfV6enIRb8RzX1dHtvE9tLzVmZsm620eS6uJwjZXGrfm4lp75w3fW7WwgoDmhMIenEo+S6lU
	x3e6I+/+A4AGmM++gVWBoHrpFxj22EynnFact4CCjE1bmXbJ1yPOxWimzdr8M+kU/OiJn4wXca7
	IrWXiel3u2PL4a3gBZ3zsi8DNg2Z
X-Received: by 2002:a05:622a:1481:b0:467:6486:beea with SMTP id d75a77b69052e-467a16d8d82mr17250441cf.38.1734025573779;
        Thu, 12 Dec 2024 09:46:13 -0800 (PST)
X-Received: by 2002:a05:622a:1481:b0:467:6486:beea with SMTP id d75a77b69052e-467a16d8d82mr17250071cf.38.1734025573505;
        Thu, 12 Dec 2024 09:46:13 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4674feaaab4sm59534911cf.18.2024.12.12.09.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:46:12 -0800 (PST)
Message-ID: <12a2ef7c-0ba3-49d9-9e08-733b8ca6a753@redhat.com>
Date: Thu, 12 Dec 2024 18:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH RFCv2 02/20] arm/cpu: Add sysreg definitions in
 cpu-sysregs.h
To: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
 <20241206112213.88394-3-cohuck@redhat.com>
 <2a83a49b-6863-4fb8-b5de-c3eacf3cdb77@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2a83a49b-6863-4fb8-b5de-c3eacf3cdb77@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4227iI9NM24qCZ2sFc_7dk7ueElwbhm1gpvwje33Fss_1734025574
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m+NwDOYSZZOx

Hi Richard,
On 12/12/24 15:37, Richard Henderson wrote:
> On 12/6/24 05:21, Cornelia Huck wrote:
>> +#define SYS_ID_AA64PFR0_EL1                             sys_reg(3,
>> 0, 0, 4, 0)
> ...
>> +typedef struct ARMSysReg {
>> +    int op0;
>> +    int op1;
>> +    int crn;
>> +    int crm;
>> +    int op2;
>> +} ARMSysReg;
> ...
>> +static inline ARMSysReg sys_reg(int op0, int op1, int crn, int crm,
>> int op2)
>> +{
>> +        ARMSysReg sr = {op0, op1, crn, crm, op2};
>> +
>> +        return sr;
>> +}
>
> Not a fan.  Why take 20 bytes to represent these?
sure we can optimize it
>
> Our existing ENCODE_CP_REG and ENCODE_AA64_CP_REG macros seem much
> better, even if the argument ordering doesn't match the column
> ordering in Table D22-2.
>
>> @@ -841,6 +849,51 @@ typedef struct IdRegMap {
>>       uint64_t regs[NR_ID_REGS];
>>   } IdRegMap;
>>   +#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm,
>> op2)               \
>> +       
>> ({                                                              \
>> +                __u64 __op1 = (op1) &
>> 3;                                \
>> +                __op1 -= (__op1 ==
>> 3);                                  \
>> +                (__op1 << 6 | ((crm) & 7) << 3 |
>> (op2));                \
>> +        })
>
> Ah, well, this answers my question re patch 1.
>
> It seems a shame to use 128 slots to represent all 9 id registers in
> the op1={1,3} space.
wouldn't it make sense to use a hashtable then as we don't have
consecutive indexes?
>
> Do we really need anything beyond the defined registers, or even the
> defined registers for which qemu knows how to do anything?
what do you mean by "defined registers". The end goal is to be able to
tune any id reg that the kernel allows to write. So I guess we shall
encompass more regs than qemu currently handles.

Wrt op1={1,3}, tbh I initially sticked to the KVM API. Now looking at
D22-2, effectively we have very few ID regs there. If we were to use a
hashtable we may be more flexible in picking up the indexes that are
relevant for us.
>
> I'm certainly happy to replace ARMISARegisters fields with an array,
> but more like
>
> enum ARMIDRegisterIdx {
>     ID_AA64ISAR0_IDX,
>     etc
>     ordering arbitrary, either machine or macro generated,
>     but every register has a symbolic index.
>     NUM_ID_IDX,
> };
>
> enum ARMSysregs {
>     SYS_ID_AA64PFR0_EL1 = ENCODE_AA64_CP_REG(...),
>     etc
> };
>
> const uint32_t id_register_sysreg[NUM_ID_IDX] = {
>     [ID_AA64ISAR0_IDX] = SYS_ID_AA64PFR0_EL1,
>     etc
> };
>
> struct ARMISARegisters {
>     uint64_t id[NUM_ID_IDX];
> };
>
> This seems trivial to automate, and wastes no space.

Sure we will study such rework. As long as the key (ID_AA64ISAR0_IDX)
can be matched against the index used by the KVM API we should be fine.

Thanks

Eric
>
>
> r~
>
