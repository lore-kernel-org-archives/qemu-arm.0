Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1962311ejb;
        Tue, 21 May 2024 02:32:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd5V2KdIAP0uw7SMYvLGf6LJjWre4Q0pEkY2bWSxF3LDMIHkO1Wmgk4OiTvqzBux4j+1EnVj9nXhoPWKvFifAJHbHmDn0z
X-Google-Smtp-Source: AGHT+IGgM/ACgkJJc0YK2kih4cZQe4V0ZzXzQKr9lZEkPVRZ0ELnsYWFB8h5tPJ4/kvSD+OpZRVY
X-Received: by 2002:a05:6214:2b93:b0:6a9:b883:dc72 with SMTP id 6a1803df08f44-6a9b883ddcdmr115364206d6.10.1716283974096;
        Tue, 21 May 2024 02:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716283974; cv=none;
        d=google.com; s=arc-20160816;
        b=pxis+kweCG6uKCaX2OG56AWkd9s8wdoOx1mgCWkY1dZrGdy9zuRAFp2zmb8YQA8SP8
         8HVK82SW3rhoK+/XwnsMq+mrP890VtGcRnITnAuTtMY9hACDBqbg5CB92pzrzbTa59Yf
         6brwBTRkLaF85qIy4c48yacZNs5B5WH4/CVxZsEM3FiATaL9hY+JCIbg/mnASv3C6yMd
         w+tl4D1Gq79PlTkWxwYQX+w3dWOvV32L23wh7YK4wnfuVAveOXib9qAluMrY/rNmkTfT
         TY2b5z6njYXhwe3Y2hXndRRk0v1570nNaYWctYf2tuSjMatGNkNMnfKWwjKvbz0F19Qa
         5yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=FxuNXruQERn88CJvHXojix949xQDC5DeLTI9DnbBVtg=;
        fh=3xImdNUfo7+lzZLkBUht0p0UJ8wzsFCFTqeqDj6h02c=;
        b=b2/Fx+AtNZ5r1k47YmUqqqtUdMYzywdy1mJiqY8WsylaRqPSm6gtuLbrZF4QoFXTrB
         b6uadGUrLmHQS3Y3iseeFbmJErs7Y7OjPtETaoxpsehquyqyA3kugDNM50bClAvkA4Hp
         sMlTMg/ztoP0xhxHc2ZQ+i2QrT2DkeW394M9J0ecQouM2lFHnLFYyMtLm5OeTC9YfKj6
         VSdv3+M+Ljwie8MRzln8MFXH+oLX5VqVq5ETIcVsyHB4fY55M8kseKfduajp0aGAetbz
         W6raYlbAn4zLQB1m9nteKSC9so1Ac68+HhkYcTN1o3MsqU2P7k6133ayyjP7h89YtG53
         iaCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MQraS8KS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43df566f530si12824391cf.320.2024.05.21.02.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MQraS8KS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716283973;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxuNXruQERn88CJvHXojix949xQDC5DeLTI9DnbBVtg=;
	b=MQraS8KSCW4F+Fr4NZSdhHqLHlUaZtUPQ91D9cscrdUrJlTd1uDF/wRrrDaXDqXoEsqNC9
	5Kfq5V5XKxfhEWtQmWqlV+KHoRrTB61W+zM9bAsQt5G9iOMFygM5tBhTbYrYa9Aoigmg9z
	x9aIa7QgaPt5rcfLZzFg4Kr1KyW/i7E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-foSHPqJpMvewudHDVZsytA-1; Tue, 21 May 2024 05:32:52 -0400
X-MC-Unique: foSHPqJpMvewudHDVZsytA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a59c3cf5f83so713084466b.2
        for <alex.bennee@linaro.org>; Tue, 21 May 2024 02:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716283971; x=1716888771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxuNXruQERn88CJvHXojix949xQDC5DeLTI9DnbBVtg=;
        b=JrTQmBaSyqKaQfuP4LNZyycSXo5iwe23MFuyoYdRtsFwS8wkwhaM+XRh/q9wOVmB3C
         CZp25pGCMsiyGhbK5sFJVPvnOITQEpWciq4eTuAff06X35bup1i0yQmqp/Y8Aylv7dVz
         Jubarn8Pr9G3HM25zPuh88xLs92BYwQ9kywdJbbPi/SFPvTbNDZ0pXgJRdoSS2GpCshT
         5Lj/khJEtFqZ6emkWJIeLL4N/eOV5iO7s+TfhYg6NGgzZpdcdSxu3mC8MXVr0NjH3sQp
         430v02Nr0a2ZIoZkGOQWZGjrRtb9crPQoVs24FGoznskfuRJ5PRu1/Kao3E/AwFk9Jrw
         0z3A==
X-Forwarded-Encrypted: i=1; AJvYcCVv1V32B9//5qN3CN407Artvj5eyrVXdLGjnyRgUyi58TD+GcxGeG9x+/XaU77qGYprS4d+M8sCLTbsO4pLpgWDEb21rTme
X-Gm-Message-State: AOJu0Yye3GB+TppqCiPsLf4MtBFR3f2uY6R6kA5UPwTxf8dfNzZ7aRxO
	65p0dRJhp8KDARtxC40jdqeqbhBodAOhqTRPpbuAmZfVdrKvvXGq8tpv5RajXOIdedBV78jKOK7
	8wd9wH+/hrz4T5nc+js4pZelVo5M8D4PaUYhjUAT5N4sIZ7+sKMpOWw==
X-Received: by 2002:a17:907:2d89:b0:a59:a0b6:638 with SMTP id a640c23a62f3a-a5a2d66a7demr2519374466b.61.1716283971159;
        Tue, 21 May 2024 02:32:51 -0700 (PDT)
X-Received: by 2002:a17:907:2d89:b0:a59:a0b6:638 with SMTP id a640c23a62f3a-a5a2d66a7demr2519372966b.61.1716283970799;
        Tue, 21 May 2024 02:32:50 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01602sm1599919366b.147.2024.05.21.02.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 02:32:50 -0700 (PDT)
Message-ID: <689f6ac7-86ce-482f-a59a-fd17f8a5216d@redhat.com>
Date: Tue, 21 May 2024 11:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 17/18] hw/arm/smmuv3: Add property for OAS
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-18-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-18-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Ht8iW5YP3hZF

Hi Mostafa,

On 4/29/24 05:24, Mostafa Saleh wrote:
> Add property that sets the OAS of the SMMU, this in not used in this
> patch.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h |  3 ++-
>  hw/arm/smmuv3.c          | 29 ++++++++++++++++++++++++++++-
>  include/hw/arm/smmuv3.h  |  1 +
>  3 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 0ebf2eebcf..dd91807624 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -111,7 +111,8 @@ REG32(IDR5,                0x14)
>       FIELD(IDR5, VAX,        10, 2);
>       FIELD(IDR5, STALL_MAX,  16, 16);
>  
> -#define SMMU_IDR5_OAS 4
> +#define SMMU_IDR5_OAS_DEF 4 /* 44 bits. */
> +#define SMMU_IDR5_OAS_MAX 5 /* 48 bits. */
>  
>  REG32(IIDR,                0x18)
>  REG32(AIDR,                0x1c)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4ac818cf7a..39d03e7e24 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -299,7 +299,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>  
> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> +    /* PTW doesn't support 52 bits. */
remove the point
> +    s->oas = MIN(s->oas, SMMU_IDR5_OAS_MAX);
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, s->oas);
>      /* 4K, 16K and 64K granule support */
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> @@ -1901,11 +1903,34 @@ static const VMStateDescription vmstate_gbpa = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_oas = {
> +    .name = "smmuv3/oas",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
don't you need a .needed function?

I tested backward migration and this fails
qemu-system-aarch64: error while loading state for instance 0x0 of
device 'smmuv3'
qemu-system-aarch64: load of migration failed: No such file or directory
post-processing ...

Thanks

Eric
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_INT32(oas, SMMUv3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int smmuv3_preload(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    /*
> +     * In case it wasn't migrated, use the value used
> +     * by older QEMU.
> +     */
> +    s->oas = SMMU_IDR5_OAS_DEF;
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_smmuv3 = {
>      .name = "smmuv3",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .priority = MIG_PRI_IOMMU,
> +    .pre_load = smmuv3_preload,
>      .fields = (const VMStateField[]) {
>          VMSTATE_UINT32(features, SMMUv3State),
>          VMSTATE_UINT8(sid_size, SMMUv3State),
> @@ -1933,6 +1958,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>      },
>      .subsections = (const VMStateDescription * const []) {
>          &vmstate_gbpa,
> +        &vmstate_oas,
>          NULL
>      }
>  };
> @@ -1945,6 +1971,7 @@ static Property smmuv3_properties[] = {
>       * Defaults to stage 1
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    DEFINE_PROP_INT32("oas", SMMUv3State, oas, SMMU_IDR5_OAS_DEF),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index d183a62766..00a9eb4467 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -63,6 +63,7 @@ struct SMMUv3State {
>      qemu_irq     irq[4];
>      QemuMutex mutex;
>      char *stage;
> +    int32_t oas;
>  };
>  
>  typedef enum {
