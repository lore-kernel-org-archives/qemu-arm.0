Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4780755njb;
        Thu, 12 Dec 2024 05:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXu3w1LqqxYwyIJZf/UVrcTJT0ZxoBzurBM/KvKT9ju7OYOzGcuRxyA5YhPkWFnicw0pdru7gncIdN2Eg==@linaro.org
X-Google-Smtp-Source: AGHT+IH7hRzDxdZ1aSv+xtXLhvzuxdatqpCbK0aEiiGeQVCvNxRy6jEABq4xxJpULvwxFSiXCLwG
X-Received: by 2002:a05:6102:3e24:b0:4b1:3409:944a with SMTP id ada2fe7eead31-4b257f669eamr352329137.2.1734010176799;
        Thu, 12 Dec 2024 05:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734010176; cv=none;
        d=google.com; s=arc-20240605;
        b=BnagOUd8i+hFqPXKsSeKjZLcac43m0UfJyCZGUFjskbsVCYp7yqKM4KUSnUzVM56XB
         MomFgzOHV9b01LyO7ZWLv7sxdewpcQzF/5OnGK2zxlV45zzM0OXIVNN0ofcSzkPo4vY3
         +cfJ838ZbtjdE78qysjukUQwPupfpgn7sv5mw5UnXFH2Kwxe3bqbaT8UYa0WuyZNSDB9
         ZHVQbwsBBeNeC2Jbsmk8qFxyc62iSTCQgAyoHg3gs+HC+8ePehFPs14eZlqdX58WuVLO
         fbqgLqSx0/+lqXwpNilslRVo1Rf85l4chVQfiJ9GHKlUfpQCevi1j4pgnsn/3iFCM+92
         1Zsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gwEJLU8VfEe4WpG6Kyyy8koTZmYNzH3QNWOlLWxrr8c=;
        fh=vf/nGRkHGp4nYtKZJTmZF6Ie6oIcxM9w9skUEKRg7es=;
        b=Wm6Qfegwalni3ZT97du1LTTOBQpLnHKIGVl5czoNNQYU5E5yXTdha4lSSuv8DuYHoh
         8h8CYXMljrK0+CMc1Az/fFmNkfguUgZrZyPD4TzEPSmmKZyeKMquxLwQykzgwS/lX1F5
         8kYwp3rxrpTzy+v7QA2IW0jrUCKZKHc+0LSVyUo196kS539XLxV/mzV0X2gMP91DyAzY
         6TO1gH1G6dEmIlqYqSULrwuB3RqJBqPubVnueuDsTCpkhghQckZyDSZq/lheHEQV7KFz
         DqTI0shN/AKpQkK2YOm18fuDffQ4FsgsUw/N97tZLkAF8NF+d9zptqK3kOTj8Cg9xRB5
         599A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EQLH9IsD;
       spf=pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eauger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eauger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afeae19bb6si2489938137.518.2024.12.12.05.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EQLH9IsD;
       spf=pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eauger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734010176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwEJLU8VfEe4WpG6Kyyy8koTZmYNzH3QNWOlLWxrr8c=;
	b=EQLH9IsDNhhN9BPxTbm9f4Au8DhacMvhSIeSqZSEogy+eFXwRyUmAAnKdzJ1iSNVA4waNI
	IaFe/bZmmsPAomciVQEPMlcLJMBwzdRNFlTYMAjCsXbzk9k+lsnl+XWk4aySNSfFrW89Bj
	zcTJm8/1NVT2gO5tRfOJxpBORkBaQ8Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-ocoUou2mP6yFBaWwpwDN5A-1; Thu, 12 Dec 2024 08:29:35 -0500
X-MC-Unique: ocoUou2mP6yFBaWwpwDN5A-1
X-Mimecast-MFC-AGG-ID: ocoUou2mP6yFBaWwpwDN5A
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385dc37cb3eso367578f8f.0
        for <alex.bennee@linaro.org>; Thu, 12 Dec 2024 05:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010174; x=1734614974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwEJLU8VfEe4WpG6Kyyy8koTZmYNzH3QNWOlLWxrr8c=;
        b=YM9fdHN0iCrc9FE8sbWIPEU38veu8+SVCsHUH5DezLElrEAvl5Okd43SzVhsVcrEP3
         6P56g9yHIGkbHi26BktvXDTyqkVE7YV9LTThwI/CUqCd9ogNYWQaGbpSxLComzcrEOXg
         QEf8z5eQ7j+3oug/ioVU/IaeZS4wRog0cH5PdVYqlXwJBV0xrSCsxLJNCNu4NzTPRiVp
         djbCqCTi/fBtv1P9ET20QUWtQiAAIlB2NF5tv5zGv67aessSraJwUskrHHw1SLaJtXSb
         a5vSB2voiX5BN08Tq4srW2eUi2fKp2WAUX430jnvHNxKUd34/LxpF/R7PypQwQLHGqwl
         nZmw==
X-Forwarded-Encrypted: i=1; AJvYcCUhNKjVorA8QHiL3sa/iDE41woD2eyh3rH8HEDO84W/kStpuIF/Qu7LZKBwhh7iz/Rt/VHkurMvMe7JAQ==@linaro.org
X-Gm-Message-State: AOJu0YweJ+fPkam/hWRxspANmICDfXYvW/Z8OJJ7gJ4WoWsFE/ykyE2T
	vxlTtDWWLdCCYBRIlMEmqblK1H/tifrbIQh7tfbhzQCRauuPVR3WoqCRVBpG4cuf0QKgfzLO43S
	x2YcFN7LMmgiAWIliilUkLa1ak3p3ge7mpLcGMa46sQeETXiW1nUYbg==
X-Gm-Gg: ASbGnctigIMN7mLJJZyhVK4r8wvzF+kC3RD/abzefVq8OezymlAC/5o+bkfSlo71xn+
	ZIvA6Ka1KZ0N6Y9MlqkP3YCXanKJq4A05GpS2zsUdauaR41e7sDN/met9UWk49YrASqvCSJk/Tg
	TywrLNZh48qpyH0jwCf73uFep1+CLlH9mp4r9/mLRUPwec4y+o7efLxLXflAK15IbB8hjtWzARa
	dNLPM+ROPHKkdSt1BTLNuIfVGZSyxHzc8UMgh8m0K4a72fcGF93DRrEWkB+TJwlBnwQhrYmhPXi
	+vUrnjFFSt+cKd780Iiaa0Q=
X-Received: by 2002:a5d:64ab:0:b0:385:c511:240a with SMTP id ffacd0b85a97d-38787696b5amr2543338f8f.25.1734010174178;
        Thu, 12 Dec 2024 05:29:34 -0800 (PST)
X-Received: by 2002:a5d:64ab:0:b0:385:c511:240a with SMTP id ffacd0b85a97d-38787696b5amr2543320f8f.25.1734010173698;
        Thu, 12 Dec 2024 05:29:33 -0800 (PST)
Return-Path: <eauger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514db8sm4103844f8f.84.2024.12.12.05.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 05:29:32 -0800 (PST)
Message-ID: <7b29665f-a9b5-4f51-ace1-7bad4eaba10c@redhat.com>
Date: Thu, 12 Dec 2024 14:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
Cc: "shahuang@redhat.com" <shahuang@redhat.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, Linuxarm <linuxarm@huawei.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
 <38604260-6f92-4f16-9a4d-c310cbc52d77@redhat.com>
 <4fb49b5b02bb417399ee871b2c85bb35@huawei.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <4fb49b5b02bb417399ee871b2c85bb35@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5UWTQ-H7H9XQNWg8E7A4g3jsmy9xGKbZlqtinxPWqN0_1734010174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: eA+tmn3ENtVZ

Hi Shameer,
On 12/12/24 14:09, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Eric Auger <eauger@redhat.com>
>> Sent: Thursday, December 12, 2024 8:42 AM
>> To: eric.auger@redhat.com; Cornelia Huck <cohuck@redhat.com>;
>> eric.auger.pro@gmail.com; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org; kvmarm@lists.linux.dev; peter.maydell@linaro.org;
>> richard.henderson@linaro.org; alex.bennee@linaro.org; maz@kernel.org;
>> oliver.upton@linux.dev; sebott@redhat.com; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; armbru@redhat.com;
>> berrange@redhat.com; abologna@redhat.com; jdenemar@redhat.com
>> Cc: shahuang@redhat.com; mark.rutland@arm.com; philmd@linaro.org;
>> pbonzini@redhat.com
>> Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable
>> aarch64 KVM host model
>>
>> Shameer,
>>
>> On 12/12/24 09:12, Eric Auger wrote:
>>> Connie,
>>>
>>> On 12/6/24 12:21, Cornelia Huck wrote:
>>>> A respin/update on the aarch64 KVM cpu models. Also available at
>>>> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>>>>
>>>> Find Eric's original cover letter below, so that I do not need to
>>>> repeat myself on the aspects that have not changed since RFCv1 :)
>>>>
>>>> Changes from RFCv1:
>>>>
>>>> Rebased on more recent QEMU (some adaptions in the register
>> conversions
>>>> of the first few patches.)
>>>>
>>>> Based on feedback, I have removed the "custom" cpu model; instead, I
>>>> have added the new SYSREG_<REG>_<FIELD> properties to the "host"
>> model.
>>>> This works well if you want to tweak anything that does not correspond
>>>> to the existing properties for the host model; however, if you e.g.
>>>> wanted to tweak sve, you have two ways to do so -- we'd probably either
>>>> want to check for conflicts, or just declare precedence. The kvm-specific
>>>> props remain unchanged, as they are orthogonal to this configuration.
>>>>
>>>> The cpu model expansion for the "host" model now dumps the new
>> SYSREG_
>>>> properties in addition to the existing host model properties; this is a
>>>> bit ugly, but I don't see a good way on how to split this up.
>>>>
>>>> Some more adaptions due to the removal of the "custom" model.
>>>>
>>>> Things *not* changed from RFCv1:
>>>>
>>>> SYSREG_ property naming (can be tweaked easily, once we are clear on
>> what
>>>> the interface should look like.)
>>>>
>>>> Sysreg generation scripts, and the generated files (I have not updated
>>>> anything there.) I think generating the various definitions makes sense,
>>>> as long as we double-check the generated files on each update (which
>> would
>>>> be something to trigger manually anyway.)
>>>>
>>>> What I would like us to reach some kind of consensus on:
>>>>
>>>> How to continue with the patches moving the ID registers from the isar
>>>> struct into the idregs array. These are a bit of churn to drag along;
>>>> if they make sense, maybe they can be picked independently of this
>> series?
>>>>
>>>> Whether it make sense to continue with the approach of tweaking
>> values in
>>>> the ID registers in general. If we want to be able to migrate between
>> cpus
>>>> that do not differ wildly, we'll encounter differences that cannot be
>>>> expressed via FEAT_xxx -- e.g. when comparing various AmpereAltra Max
>> systems,
>>>> they only differ in parts of CTR_EL0 -- which is not a feature register, but
>>>> a writable register.
>>> In v1 most of the commenters said they would prefer to see FEAT props
>>> instead of IDREG field props. I think we shall try to go in this
>>> direction anyway. As you pointed out there will be some cases where
>> FEAT
>>> won't be enough (CTR_EL0 is a good example). So I tend to think the end
>>> solution will be a mix of FEAT and ID reg field props.
>>>
>>> Personally I would smoothly migrate what we can from ID reg field props
>>> to FEAT props (maybe using prop aliases?), starting from the easiest 1-1
>>> mappings and then adressing the FEAT that are more complex but are
>>> explictly needed to enable the use cases we are interested in, at RedHat:
>>> migration within Ampere AltraMax family, migration within NVidia Grace
>>> family, migration within AmpereOne family and migration between
>> Graviton3/4.
>>>
>>> We have no info about other's use cases. If some of you want to see some
>>> other live migration combinations addressed, please raise your voice.
>> In relation to [1] you seem to be also interested in the migration
>> between heterogeneous systems with qemu.
> 
> Yes. That is correct.
> 
>> Do you think targeting migration within a cpu family is enough for your
>> use cases. How different are the source and destination host on your
>> cases. Do you thing feat props are relevant in your case or would you
>> need lower granularity at idreg field levelto pass the migration?
> 
> I think, from the current requirement we have for migration, the source and
> destination mostly can be handled by FEAT_XXX. But like Ampere, we do need
> to manage the CTR_EL0 differences[1].
OK
> 
> Also we do have differences in GIC support as well(AA64PFR0_EL1.GIC) which 
> I am not sure how to manage with FEAT_XXX.
interesting. We need to further look at this one.
> 
> And we are checking with our Product team whether we need to support migration
> from an old CPU type in which case we have to do a bit more analysis.
Sure, please come back to us whenever you get more insights. It will
help us define the scope of this upstream work

Thanks!

Eric
> 
> Thanks,
> Shameer
> 
> 1. https://lore.kernel.org/kvmarm/20241022073943.35764-1-shameerali.kolothum.thodi@huawei.com/
> 
> 
> 
>  
>  
