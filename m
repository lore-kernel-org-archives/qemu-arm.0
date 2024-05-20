Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1301297ejb;
        Mon, 20 May 2024 01:27:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWK51kgS2eHh3HLXhn2ykso1L4sofx4Z+wh3u/qxXTbzBLbs8i3b/RZeTJ2y3QbNMJnVeKIVz3vdj+Ujanv6Rm5QmY/skw3
X-Google-Smtp-Source: AGHT+IHzg6tjPyM6jabOu+ACSMPHKFzS4bGfAEjazp10ylreeosCHZSl8hCGwwU98zthuizSJeWZ
X-Received: by 2002:a05:620a:2a0d:b0:792:914d:ccb7 with SMTP id af79cd13be357-792c75ac1abmr3408653185a.34.1716193678528;
        Mon, 20 May 2024 01:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716193678; cv=none;
        d=google.com; s=arc-20160816;
        b=fnnD+QShBNKvtTcgycYjbJwj9TJpgEP7Tl45ItQYzjLX65yvv09h3UiA8wua3sni1m
         biZk3hMWAXGdsGBVEeRVKRE7MkfgsVBE9f9qophohlH+jgPx8vYeQHgvix0M/Tw9GcRR
         ReWYoloeBK4HYZIAyzmJI+Dz2M3bfasAStw6Q04889FZ85QCCXXQtkVhq4RfKfqsekzr
         ur/h375XOJX2VLQoZ+WIn7K2tzoAjkEE/2VA1ADbrjuJlL6mtmmuGHAgq38mwERpduSM
         ULbXJobvT+l0nI7s1ItKcaJU9OrAK/z9wIWobOfc+M9H/ZEKggfYIdNr9HuqfPtHNO3Y
         e2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=krc6tNgzPH2+iJleITGbXi8D+vtGRcZ3UX7tAfMsAno=;
        fh=w6RWGc5DF8NCmvefl2HmmGHDs5fYNP6SSampmD1bxGw=;
        b=lZOGOqazSfFn3UviPXatTY+miypBc8YqrtbC0GantJC4bdntLCtRUj5QXtuaQt4h+k
         9dy6z4sOve7dzM4Ey8nwkjl2So9b9nbat5tA+wvXJuq6v4mrymEBpw0JqLlMKPyCNcJo
         Y9XCNAoOMArHUpyPjtg398Mh1tsNNNmvadj4xpwfH42py8Yr5GOEFCRHtwrwMi0ZbN9A
         Glz1UEhn4OqLKHCQNJJQnR9RvH2sX9zqd7O/SxlNPLEfgoEat02P8+x36RkmhJkaFUKo
         4TegHTz1UdjOPruF56dQ36b9qvSBczL58554Ffh7mQj4s2T5/+ObXHYF1kZCintfV7S3
         83RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icps6nv4;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf277398si2715548585a.86.2024.05.20.01.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 01:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icps6nv4;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716193678;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krc6tNgzPH2+iJleITGbXi8D+vtGRcZ3UX7tAfMsAno=;
	b=icps6nv4Zj3jJ5TLHrh2ivNxOGqR4q+uZs77dOLIoUl1c39Y2i7cNZIootpPaYv9Z4ut2U
	c1t6eOxWuvmFX8+hd8AtH1vTFXvJJBDi2iQLFlaR52q3kYivYiWqNCFQVqwMuAo9JtDFOx
	Eq5jdtWqNzMzVfiD/OmkL3iOz5F+lgo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-r284nFdAPc6aMEOByKfzhQ-1; Mon, 20 May 2024 04:27:56 -0400
X-MC-Unique: r284nFdAPc6aMEOByKfzhQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-792c365cacdso1568350585a.1
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 01:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716193676; x=1716798476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krc6tNgzPH2+iJleITGbXi8D+vtGRcZ3UX7tAfMsAno=;
        b=aiFV1bPdUqkUYl/QnFvFLvUkm2zys3sWu+oL1eh77cmBd7bix/Fr03YgfM2fFdSwn8
         UG2aaknDRbMSOHtn516KFQZ9QjhdAD9O9lvLUGdpnfYF1sK4wvvUceWmIW+qdQVwirkp
         nBzIHokeOwSChFf1KXBt7H4ib7YAaaig48NKp1Yi3FyhSbN49WTcGSKdfPzm9MFK3RcE
         6uYusHQYbmGEUR693pyZ7pWOvidPTiGWPW8bozb2R61xf0I3s/y/IslmmnESRG3kK8Tm
         zQGI949B+uimF04pLkNj9kMB53aLweA+Wc0JYH8zUMSj6tcJxRzGRmTcTFDrLSgLwG+S
         L98Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfS1lVwPKMk2WDBvFyNbPCN9MOswCnafHDrIrKtsCp8N4du/lde+74hODlsBFt2yCbB+0HIogEYkalQH46NEhCVOvd7gq9
X-Gm-Message-State: AOJu0Yy5DhUuyGLPEXYypJ3tnyijI8Y7DNtso8W3pnbnK/8h3JuMx+sj
	CdRZmMNqctJ+APPKKdFO4s6mlaN2ZTsOS171nwdAe2KWG612ac5Kply+WFqQc9SlnhyN3QlWnCZ
	fW984F9FTijpEq1IYMIkHYxxRxmGH1u7wq5CB9OTptWV6tw3WG4zEGQ==
X-Received: by 2002:a05:620a:5201:b0:793:1b3e:dd19 with SMTP id af79cd13be357-7931b3edde5mr726642485a.76.1716193675842;
        Mon, 20 May 2024 01:27:55 -0700 (PDT)
X-Received: by 2002:a05:620a:5201:b0:793:1b3e:dd19 with SMTP id af79cd13be357-7931b3edde5mr726641185a.76.1716193675483;
        Mon, 20 May 2024 01:27:55 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf310c2csm1165240285a.112.2024.05.20.01.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 01:27:54 -0700 (PDT)
Message-ID: <c22b04a2-c15c-4d9e-bfff-8d9922a83122@redhat.com>
Date: Mon, 20 May 2024 10:27:50 +0200
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
X-TUID: CcGeeJxyBnSu

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> In the previous patch, comine_tlb() was added which combines 2 TLB
> entries into one, which chooses the granule and level from the
> smallest entry.
>
> This means that a nested translation, an entry can be cached with the
> granule of stage-2 and not stage-1.
>
> However, the lookup for an IOVA in nested configuration is done with
> stage-1 granule, this patch reworks lookup in that case, so it falls
> back to stage-2 granule if no entry is found using stage-1 granule.
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
is it safe to alter the tt->granule_sz without restoring it? In the
positive I think this would deserve a comment.

Eric
> +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    }
>  
>      if (entry) {
>          cfg->iotlb_hits++;
