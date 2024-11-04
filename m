Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2159984njc;
        Mon, 4 Nov 2024 06:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUj8notTwTjZKJOVl59u51T+sPYB5WmuseqbmXjWOZqaDOSSyF7JKVzwNNiR1p83wCUY7KpSOFHCon2oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHwn40IqP6Kvvs5wwRLfXxwcJWmcTVh/sOYZg3lsBvEBgqOxyaf2b5OMRNsaN18xSGP3/Mo
X-Received: by 2002:a05:6102:3753:b0:4a4:9363:b84f with SMTP id ada2fe7eead31-4a8cfb25e4amr30553251137.5.1730731522797;
        Mon, 04 Nov 2024 06:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730731522; cv=none;
        d=google.com; s=arc-20240605;
        b=TrYbMmj1E9+mGk+7nyAGfPAPoJA7FHbasfh4WRqPtaxgS0jgURl5c9u5sCDGPyEL1O
         szEnrlGfUUXwPH7XvEdw+37y4Xpv0mPJAUlwCoUFvXWYn8CIdv4pUlOgkQ8QcRH/Er2i
         w3itE2BxgOLCPVDoHiLS6zMecneuNWYisEPSvxYuOZ//4O1GlqEPyswqLRuQ/iCvlGwS
         HZAnHi+gC/cfWjdBesBPjiMt9sNUzfAPJFPeLVGlyTt7tKcoIVzyFgHOzRuSUwS/Pq21
         kgyOgBhpdbo2l7mt/AlUj7wLVer/1mb5SUMb0BaSrIgPg+pcC9z1MHSrx9OOfpuFmHLl
         EG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=JhlNDrXlUzM5p8FZMA7dRiQzkSxBvDnj3EpKeGQ8LMg=;
        fh=FQYDpF4nMqWebfmcMZTKh7DOI+/xfNHCyXrfikBaXUg=;
        b=H9CTYKvPiJTuLFrc7MqD6uOA3KuXNp/3x3n+JEWImJlpjy/O/kIcw9ufB6hujsuGwL
         ARWHvx6oUdGgDnOA83LVT/M8/PW3MdMVeH4Z0AkPq1b5YRcJ8+1GszkulOT19FB/1Vq0
         I2gkqkuABwYCP3l+Avoo+o9+7f0HwBMxBS+cfflR1PdFQ6p6S1NKE0oEZmjRtoboqrT7
         +zwrVarS/5Nx4zogaPixY5ZG2kBNSr4sTOd9nAWn+pJcEKvLt8ctOmh3N8oue9Zdtzzf
         Hkm20+f3RVBIevk1HXv5xSM1ulfHidRiisr/JeHPV6qF+fqLWuxQPzo2Jgl8oZUBF5Aj
         sn+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jOn+VJVm;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a95758811bsi1944865137.574.2024.11.04.06.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 06:45:22 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jOn+VJVm;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730731522;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhlNDrXlUzM5p8FZMA7dRiQzkSxBvDnj3EpKeGQ8LMg=;
	b=jOn+VJVmeUuqhJB+ZfL3s3W+2jFncd0Aap6T0Q+RRRumcS+WUNzI+Ayh0ydA8wdZWgBIMf
	arHesdhqFq9fUxLDnO6CfkdlKq+AysYnoks0NOUhM29eBgRNMT0ssdj2ZcCwISFJqVa2c8
	ZGszkl+iysXk3kI1xksZqpMtu8rZIYU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-7_XoKcbCMMqxr73HfX1WLg-1; Mon, 04 Nov 2024 09:45:18 -0500
X-MC-Unique: 7_XoKcbCMMqxr73HfX1WLg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4314f023f55so29179365e9.2
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 06:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730731517; x=1731336317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhlNDrXlUzM5p8FZMA7dRiQzkSxBvDnj3EpKeGQ8LMg=;
        b=EbxKvzMreKMjj2WC5+YTI1lQqGEriaRiRrgpwOfdWsImY7d2pngVL4KonMFw5oT1Ws
         GqTNJbI2ZwkpcZJb8ccBNIM3Ynfl+XZt05ayMXld5l9OYvsqdPAqgY50Q8pSNXwf+dpc
         YB5tCr9ZJA1gyWOovgaPs5Wjj7GQG4pGr0lwEd5c76qV0PPB0TwsQ/B4dQIM2E2FFfwE
         n/lyO1R2HRu5Z1rTOo7cSzeKXygvequXQyhFP/FFzn4pKYGtc16/9xJyMD1M4dCLkajo
         iIO+Zl094SC1R8Q9E27mO7QqW06Zsne/HvROGmaJiKlOI7xnkJzcjfgGfsahl9SSeLfC
         Dcdw==
X-Forwarded-Encrypted: i=1; AJvYcCVIEQI4kJhAilMVJKRQgcT1KNvVTZbbl6CCVdtyNkeiH0y6rv4vJIJcRegJcg4Sjdu3Q/vOFV6m364Gfw==@linaro.org
X-Gm-Message-State: AOJu0YxuPHyrkKNm2JPByDycaNIUVoWNlXiliFiEoUDJV/ItaiSZWBib
	3pNLPukKu5t7HI5n3kxMIbNb6dtbXEOIpcCftn02/vsB6Nv78XyUHnpjnhNvNSl+IzeaLgoJ0p6
	+shJknH75Ed2vzjTA2q8ZUbLGc8SlR4rvmKvW4+Y/ARpFrWTRpyGoNQ==
X-Received: by 2002:a05:600c:4f83:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4319ad089b0mr249763595e9.23.1730731517249;
        Mon, 04 Nov 2024 06:45:17 -0800 (PST)
X-Received: by 2002:a05:600c:4f83:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4319ad089b0mr249763345e9.23.1730731516834;
        Mon, 04 Nov 2024 06:45:16 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9180f2sm184056535e9.19.2024.11.04.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:45:16 -0800 (PST)
Message-ID: <24ca0278-5018-41e3-a097-ac560a16f8fa@redhat.com>
Date: Mon, 4 Nov 2024 15:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <ZxuZkUFz_bwAA1pf@redhat.com>
 <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
 <Zxudl5-fZV1vIaEL@redhat.com> <87y128nrfr.fsf@redhat.com>
 <Zx-3OUioG1l47hW3@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zx-3OUioG1l47hW3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2UgIhojbMhcp

Hi

On 10/28/24 17:09, Daniel P. Berrangé wrote:
> On Mon, Oct 28, 2024 at 05:05:44PM +0100, Cornelia Huck wrote:
>> On Fri, Oct 25 2024, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>>> On Fri, Oct 25, 2024 at 03:28:35PM +0200, Eric Auger wrote:
>>>> Hi Daniel,
>>>>
>>>> On 10/25/24 15:13, Daniel P. Berrangé wrote:
>>>>> On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>>
>>>>>> Add some documentation for the custom model.
>>>>>>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>>>> ---
>>>>>>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
>>>>>>  1 file changed, 47 insertions(+), 8 deletions(-)
>>>>>> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
>>>>>>  properties have special semantics (see "SVE CPU Property Parsing
>>>>>>  Semantics").
>>>>>>  
>>>>>> +The ``custom`` CPU model needs to be configured via individual ID register
>>>>>> +field properties, for example::
>>>>>> +
>>>>>> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
>>>>>> +
>>>>>> +This forces ID_AA64ISAR0_EL1 DP field to 0.
>>>>> What is the "baseline" featureset implied by 'custom' ?
>>>> there is no baseline at the moment. By default this is a host
>>>> passthrough model.
>>> Why do we need to create "custom" at all, as opposed to just letting
>>> users toggle features on "-cpu host" ? 
>> We could consolidate that to the current "host" model, once we figure
>> out how to handle the currently already existing properties. Models
>> based on the different architecture extensions would probably be more
>> useable in the long run; maybe "custom" has a place for testing.
> If you can set the features against "host", then any testing could
> be done with "host" surely, making 'custom' pointless ?
Yeah I do agree that we may not need to introduce this "custom" model
bus just enhance the custom host model with the capability to tweek some
features. For instance we have the case where migration between 2 Ampere
systems fails with host model but if you tweek 1 field in CTR_EL0 it
passes. So I think in itself this modality can be useful. Same for
debug/test purpose. As mentionned in the cover letter the number of
writable ID regs continue to grow and this enhanced host model gives
flexibility to test new support and may provide enhanced debug
capabilities for migration (getting a straight understanding of which ID
reg field(s) causes the migration failure could be helpful I think)

Thanks

Eric
>
> With regards,
> Daniel
