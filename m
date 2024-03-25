Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp731199ejj;
        Mon, 25 Mar 2024 07:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI79MUAT12e9ZZVyi3RIhI2csebAoN28Ef4OutvCJAimpvVmgbHe83OSQZEy/a3yn9nRf1tHXz7dxszdNSzEXr5QB1KQ2q
X-Google-Smtp-Source: AGHT+IEajf/Q6DOMR27D3LAaz4WwIRgBfI4IOMnx9GF91sIVjLXk365pJ4jZm8ZYXiXathGMbNRa
X-Received: by 2002:a05:6870:a40b:b0:229:e8d7:c82b with SMTP id m11-20020a056870a40b00b00229e8d7c82bmr6779508oal.0.1711376412942;
        Mon, 25 Mar 2024 07:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711376412; cv=none;
        d=google.com; s=arc-20160816;
        b=OqobFkuCV2sexHZM8mlB3YAe6v40uF1ZW1eTiJKdgMhnyE3D7qt+2gD0KYKwyhnQih
         uUv3DIip+immJCGqKVxNLLA/JIH5S3C8i1nGnfJ1S31zaID7USEbmF/bD6FT/LwHxV8e
         8e2zAPy4yieyHt3OcnAx5rDV6vrcVkbRm/XMwnsgufJCqovHTDwEhtuEWt08f4TSpeTA
         e6Hxxm12g/Z3Cescc/Vc0AWD+rcQz2FAAcm0P3Po6JSeIL1GJsBY45IKINsDD85cOvAS
         NpmgmJd3mLZv2wFuu9x+AO9WnXkOIpm68/RpZ36NHt2wZ9M6D/QfITzvSEm7E2QIbsfA
         CywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QexzJ9cYy2KD0jegfeEsjBpTMHG2d/u49cn46Vy/+d0=;
        fh=YBwW1fhzpd4dDd55QFJlqPJ749ky6hj92YCsLFsVA+k=;
        b=YYWhExBwKvb+CkoMypenW7QVyRGjeYoWrtZEWgkgugYlH6oAnq0fH2k4h1kcT0OFQy
         F7RXWkH/bi7BvCEogSN8M7WX7REiNI3BX6RO0E735mrF3LGKIU1ioqKR+v1PJTg6np4u
         1KSMOV4RDI6+cuWMmJjQW1ZxhF1uWHu8Oya7Pcwv/LTIHb/XELFWelC1WnBeXKkt4goz
         HdNIXqStccSDj8MSJagtyq0h90abCB/i5w6ZCXImPZdYquoYzOw+SeWVAAEL9DM4Wong
         zVimQft6JhE6vMJs/Y4C7lZSNN2SQHwYodR8Z8njL/q+DaPmxD18vF7uFzXHvLdU9eOA
         YsMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=XG49cDPV;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id xm12-20020a0568709f8c00b002298f2d53edsi1588443oab.59.2024.03.25.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=XG49cDPV;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=QexzJ9cYy2KD0jegfeEsjBpTMHG2d/u49cn46Vy/+d0=; b=XG49cDPVrEeGTdHwQ+Y8Uo5TCf
	a7OSVOSP+GdrejbjJ0syoGwG3jri9ZaVJrpw/GXfxmEtN8cjMp67+7h7Z8Qh8jTcz5GS+G59TjzRs
	XH0GZUId6SxcTseKutCWcJCjG7OItgKYaRyYkalBZw6Ydv6spJszWm8fAinQHwqfLaq0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1rolBJ-0003kg-Bi; Mon, 25 Mar 2024 14:20:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1rolBJ-0001Lc-1i; Mon, 25 Mar 2024 14:20:09 +0000
Message-ID: <bd24dc1a-d474-4cc7-87f9-2d5059a19602@xen.org>
Date: Mon, 25 Mar 2024 14:20:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/12] hw/arm/smmu-common: Support nested translation
Content-Language: en-GB
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 eric.auger@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com
References: <20240325101442.1306300-1-smostafa@google.com>
 <20240325101442.1306300-8-smostafa@google.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240325101442.1306300-8-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XqdKYdwxZvYP

Hi Mostafa,

On 25/03/2024 10:14, Mostafa Saleh wrote:
> @@ -524,7 +551,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>           tlbe->entry.translated_addr = gpa;
>           tlbe->entry.iova = ipa & ~mask;
>           tlbe->entry.addr_mask = mask;
> -        tlbe->entry.perm = s2ap;
> +        tlbe->parent_perm = tlbe->entry.perm = s2ap;
>           tlbe->level = level;
>           tlbe->granule = granule_sz;
>           return 0;
> @@ -537,6 +564,35 @@ error:
>       return -EINVAL;
>   }
>   
> +/* Combine 2 TLB enteries and return in tlbe. */
> +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> +                        dma_addr_t iova, SMMUTransCfg *cfg)
> +{
> +        if (cfg->stage == SMMU_NESTED) {
> +
> +            /*
> +             * tg and level are used from stage-1, while the addr mask can be
With the current approach, I can't boot a guest if I create a dummy 
stage-1 using 512GB mapping and a stage-2 using 2MB mapping. It looks 
like this is because the level will be used during the TLB lookup.

I managed to solve the issue by using the max level of the two stages. I 
think we may need to do a minimum for the granule.


> +             * smaller in case stage-2 size(based on granule and level) was
> +             * smaller than stage-1.
> +             * That should have no impact on:
> +             * - lookup: as iova is properly aligned with the stage-1 level and
> +             *   granule.
> +             * - Invalidation: as it uses the entry mask.
> +             */
> +            tlbe->entry.addr_mask = MIN(tlbe->entry.addr_mask,
> +                                        tlbe_s2->entry.addr_mask);
> +            tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
> +                                          tlbe->entry.translated_addr);
> +
> +            /* parent_perm has s2 perm while perm has s1 perm. */
> +            tlbe->parent_perm = tlbe_s2->entry.perm;
> +            return;
> +        }
> +
> +        /* That was not nested, use the s2. */
> +        memcpy(tlbe, tlbe_s2, sizeof(*tlbe));
> +}

Cheers,

-- 
Julien Grall
