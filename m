Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp666275ejl;
        Wed, 15 May 2024 06:54:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX09r7k7aHBCGYF0Kc0wgwzl4Wgx2L6e8Hs5zZlVMHVfoD+YI9NVYDab4Bdf6uz8eWS00RLIY5R0KucjfiUQ/89054k+/H/
X-Google-Smtp-Source: AGHT+IFYj+SLhvzXxa2KeZ7sqT+t4GyPZBqmAWkZ6vlTv+L4PQaT4wVwfpHBm/xv9Ii4dUvEpVpx
X-Received: by 2002:a05:6214:5411:b0:6a0:5673:e50e with SMTP id 6a1803df08f44-6a1682346f1mr215681356d6.53.1715781282937;
        Wed, 15 May 2024 06:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715781282; cv=none;
        d=google.com; s=arc-20160816;
        b=DKYHdttYnwp/IncmdnnK2KrXiDLYP4Mzbv247hQPsb0vpfJ4iqa0EpssU4AB3SiyI1
         jxZd5TxuueWUdUaqAB4K0kNHFusg9y30nBQS+07roTk+lCRMgJsy/PlCM/F66Yz+/zyl
         ch0Fstak7fBtGzXbkKJvKb7GADprBsEixEzjkNxdEU/no5qgEa+3sWbl6UHhIgywSzZ8
         3zYeLG2UOqYXz9ksFF5EkVH/YOOt5s4kxyxXowADpsSjgoF4lhZwbvOriIvLQUlXnd1q
         M+0OaSLo3CPOvQWs4F71WFe+t6xGpkhyuQTgfeAQaOyBHH74AG9MROVjyeQeTn4hZB+Y
         /EVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=djiCVZW/OI+w3LX691XOABCJJ+t0FACKYRstfpa06hM=;
        fh=bUw2Z6pHxM7NB6JFZwPtP/gewayzbDWSdSY9+tJky6w=;
        b=NZ9/WeSvHrS7uTht2teyxXw1vNZERU3GF04F10J+4TgTl0DwbRkQwct6Nw6X0T00DJ
         KvcP6uWOj4TTpZVD835hrbRLDvCc4quP2oYMn+az6eTVzsDcAgxDcVISE6WNf6h7nDdv
         Hv1dTkfmwn52xOEKtC5Lej3Iy+sA3elpvs2z0ImTAte5NrH9hNSgTT20JUXpzQPjg04G
         /ORUd1qmoWOOM5YUtiW2wpCECgHNueo0sLj18gOl2SECXBb3MDJqHvnmbgS4PuS5CEDP
         UtVazbLCEq/WF7wVseQAMmo5Vgo36HGlte53zF9xZOV8sBw1O+QfVp5m2z5EBdjtqMLp
         yibA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V6uiXtkB;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f209c08si142882486d6.169.2024.05.15.06.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V6uiXtkB;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715781282;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djiCVZW/OI+w3LX691XOABCJJ+t0FACKYRstfpa06hM=;
	b=V6uiXtkBfq4hmIp6cCJiMEXxw8j5WoHCwyM0sUdh4u0P0rlpju4ISALZWVTNeWb2NGdoVP
	ihGLoRfr8suNhxGDMc6mT7VrWZjzS2/XqbZDkAl/YuyV3859/8XXA6UawCFdRAoestmgHf
	XM/ZOglpnPZmod/sjSSG1xKuToPfLUI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-wd245nvVPrCHCxEEm_wyxA-1; Wed, 15 May 2024 09:54:41 -0400
X-MC-Unique: wd245nvVPrCHCxEEm_wyxA-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43de91ba721so74529781cf.2
        for <alex.bennee@linaro.org>; Wed, 15 May 2024 06:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781281; x=1716386081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djiCVZW/OI+w3LX691XOABCJJ+t0FACKYRstfpa06hM=;
        b=ipKQNSLwGzvmkksXjvRWTawoDepUyFnqboMhdg2mn6NATYMVaW6QNUtFdL2SbF3fvP
         iUXN5AMULaYBs3S6Pqz9Ny3+8nWojuRNkB/u7rkiiwhP6EDeBx+8IY2lpOEmkpAkDtDS
         DxmjduSnhZlBLztHokhJAD5te7Y6cydRGVccR6ga7jedHblE1Fl6mMpX0nSX1yJDpUIU
         y2AO29qs8gywXFriFbqkIxX002BtHHhfHrtsBX0rfCGm8eYhjyy3awNmgBdFFcoIKe49
         ekpOdf547t95M1V+zne0ykbQ15ng4ewrYA6IjlY6ttE/TR8dzP778CEvP5OwiJwznqzf
         aw0w==
X-Forwarded-Encrypted: i=1; AJvYcCXGnuar2b4JCH7BzcgHQ420/yI1uWJGoyLwjfEzTGchWBvFzxDO9cL8NdtvWwgOLGo0RislED845A5Q12f2Sh1ceRxw1pIg
X-Gm-Message-State: AOJu0YzOrofv8YYD8BX7d/qmkEeLFozJJhvyzsAScIJcINTBFhAlnA3B
	2tGh/qacQQHAnGnTdAKL0EyaRHQMLNibeSjPbxj6x/RCXu4ZMvI61zWzfCPQvD1YVaLK8RleA0Z
	qPr4zYkPjFCrWBbVnQ/kuDUth007rosV1Mlaz2RyLbX6xb/SBV8nqPA==
X-Received: by 2002:ac8:5d4f:0:b0:43a:deee:a5ea with SMTP id d75a77b69052e-43dfdb20ed1mr178892521cf.13.1715781280524;
        Wed, 15 May 2024 06:54:40 -0700 (PDT)
X-Received: by 2002:ac8:5d4f:0:b0:43a:deee:a5ea with SMTP id d75a77b69052e-43dfdb20ed1mr178892331cf.13.1715781280171;
        Wed, 15 May 2024 06:54:40 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e3a57b396sm389351cf.24.2024.05.15.06.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 06:54:39 -0700 (PDT)
Message-ID: <6afc41f6-7127-46f2-833f-6eb4abb2730d@redhat.com>
Date: Wed, 15 May 2024 15:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 09/18] hw/arm/smmu-common: Rework TLB lookup for
 nesting
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-10-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-10-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: wXLYG4S6GV5g



On 4/29/24 05:23, Mostafa Saleh wrote:
> In the previous patch, comine_tlb() was added which combines 2 TLB
combine
> entries into one, which chooses the granule and level from the
> smallest entry.
>
> This means that a nested translation, an entry can be cached with the
that with nested translation
> granule of stage-2 and not stage-1.
>
> However, the lookup for an IOVA in nested configuration is done with
> stage-1 granule, this patch reworks lookup in that case, so it falls
> back to stage-2 granule if no entry is found using stage-1 granule.
I should have read that before commenting previous patch ;-)
Anyway this shows that something is missing in previous patch, at least
the above explanation ;-)

Eric
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0d6945fa54..c67af3bc6d 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>      return key;
>  }
>  
> -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> -                                SMMUTransTableInfo *tt, hwaddr iova)
> +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> +                                                  SMMUTransCfg *cfg,
> +                                                  SMMUTransTableInfo *tt,
> +                                                  hwaddr iova)
>  {
>      uint8_t tg = (tt->granule_sz - 10) / 2;
>      uint8_t inputsize = 64 - tt->tsz;
> @@ -88,6 +90,24 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>          }
>          level++;
>      }
> +    return entry;
> +}
> +
> +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> +                                SMMUTransTableInfo *tt, hwaddr iova)
> +{
> +    SMMUTLBEntry *entry = NULL;
> +
> +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    /*
> +     * For nested translation also try the s2 granule, as the TLB will insert
> +     * it if the size of s2 tlb entry was smaller.
> +     */
> +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> +        tt->granule_sz = cfg->s2cfg.granule_sz;
> +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    }
>  
>      if (entry) {
>          cfg->iotlb_hits++;
