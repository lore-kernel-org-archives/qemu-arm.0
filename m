Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp872251njk;
        Wed, 17 Jul 2024 08:08:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+RHf8Zjsfe51DtP3MS52B5w68x0F6eK5BqVqbbI5sR0QHJ2bCFbWzoiKQetG/XJGP1Ismwm8OjUiX79OhtiLKv1PjXkS1
X-Google-Smtp-Source: AGHT+IHkkjYE/m4pLNPGa8u60rashtZ+O/7ASZctR9a2HPxbgffbBkeZlReyUUZa8AoPI6pxFdis
X-Received: by 2002:a05:620a:1792:b0:79e:fed9:7943 with SMTP id af79cd13be357-7a187517271mr217679685a.61.1721228887564;
        Wed, 17 Jul 2024 08:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721228887; cv=none;
        d=google.com; s=arc-20160816;
        b=bhQ1eJGo9hf4nG6E23ynXc+Iu1N+3HQMXJmMLGAJn2rU/2aLJd/pVWE2WuugyZwyZ5
         wG9JlDjPf4GF7NYgVqhH8BdLmwaGvebXget7ssyvJhuz8vxtVQZ3DWDTjGN6xEu2y8NX
         J8P1dVxc/azBOJIpV8SWQKDrLYC+Wu1q0v2kVaF0OZGh9+QS688g1feht2INBwrgU1xF
         i5gNG2Ky0wsJUbJxRU8LKq+YOu+RT12noqqhRJBynbuyxl4ih8g5vhF8WNiajOA4wuyy
         Wm03F7ULwPVkaMg0SX1g4EPlKTKpeB+fPm46rgjpAOnb6P5gKTt8s8mUF1WqfTbHycIq
         oFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=8usRwtiMatigIKv6SUJ2naiRlabsyo6rGgCib1jD/ac=;
        fh=muOchOhdu4yky3Luor3kD46ZLZgx4YvZAOtisKEO2J4=;
        b=0h2gdjYhW7Wz7wGPRGN5Nnp+0rv1xrDNae8DvOwSm161uvqsK87GcpEKVXlk2GI19X
         WZf5LeewlendCVikp3IhAnOpZacPi3OK5o+AdrtjrxtgnzWDxu9Ns6x3tiXpsWSbRI0R
         F3u5tdAn6rxT9CzQIvkd6TjDjpXPFhzqijxALfAYTKnkHYV/p7ofQkSv7OYsF8WtphZL
         MP2GqTyLShag/lbsP1MoDk0nxFHP4beY/JENYPgfu3r1fpA5X3JLyA3Je5B89lyRjCA1
         mcxHYufA0v6r0sG3ReIZjcTQi7ROsMza/IcpDhL6dQJGLpDcHFF1M8t1s0iHVvZ5jLrm
         Jt3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uv7KKMYJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160bac1a9si1006189785a.193.2024.07.17.08.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uv7KKMYJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721228887;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8usRwtiMatigIKv6SUJ2naiRlabsyo6rGgCib1jD/ac=;
	b=Uv7KKMYJSHjqH9GbtxVhh75Hs00Uy6RL/axs4Sno+Fjb+J2i74a9USbbA88vFCIn921Wbb
	g51eMhr757EczBLpr4zlwWtumlTEMiMV6lM6RVo52k40yDpFe1FJGyN0k0JFkAybheHC7I
	TPomggjaDiW6utLBYMFSly0s/Os3TVM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-MSpnXFj0O1eYyf4kRbhyOA-1; Wed, 17 Jul 2024 11:08:05 -0400
X-MC-Unique: MSpnXFj0O1eYyf4kRbhyOA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b5ebdd8109so103938356d6.0
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 08:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721228885; x=1721833685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8usRwtiMatigIKv6SUJ2naiRlabsyo6rGgCib1jD/ac=;
        b=qliXl/STqgJ92tYwswKia7y9jjd6Hzs1/waCBdbPs6go5F5ql57cXjGNjKuEk7DboE
         FsCzI1t1AQRqRbo3isG8VAycthbI/wZrVkG1PKXLSGKqYXKOQakokmaYx8VriZLby7ug
         CXZsQeHU1UgKxJQcD5rErei5QNuS/gX6gDPz3Sl7gYXZnR4Uw+81c1ScrlUg2KPwk19B
         Kzt5GA1o4D/bZQWujfpF7JlSXBlGlFGiHeymZCBDA7ooGPCgGoJaXXryTtx4QA78ky3M
         YCgJngHrs6yRoKKNxYlwpxBRARxdv/pdOVVpMUs1EZeVsyQLxpLM5D8WTSbh2GwiOkVi
         UUKw==
X-Forwarded-Encrypted: i=1; AJvYcCUAPAm1BJ8COYJPK0ScAE0aD8iaCjHyU96W7WOLA1G3LUI8myP3q6gIWzNy1mn/30CX0d+yjfMIi/cR9F8mdH5AuD8Jx3Gn
X-Gm-Message-State: AOJu0YzkzEMKTUAK6ZUxYM6JEfg77D4Vxq/lHqlaxN2apaGj93taEhTX
	lvwFrjOX4QAbkNzZVqNXar5YrnC1MzixcNErmh8vh6OPOFlJF03/0nwvHsvpKDTVcO5kYmwGF5y
	kLg5hRl2ZSUI04RgnxOHmxuIaXyMAEVyMgPh1/d0iu0LpRhGPsrZCnA==
X-Received: by 2002:ad4:5fc9:0:b0:6b5:403:ea7b with SMTP id 6a1803df08f44-6b78e2d542emr16343596d6.54.1721228885188;
        Wed, 17 Jul 2024 08:08:05 -0700 (PDT)
X-Received: by 2002:ad4:5fc9:0:b0:6b5:403:ea7b with SMTP id 6a1803df08f44-6b78e2d542emr16342656d6.54.1721228882580;
        Wed, 17 Jul 2024 08:08:02 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7619a283dsm42554156d6.68.2024.07.17.08.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:08:02 -0700 (PDT)
Message-ID: <cb687788-4bf4-4bc1-94e1-5f023b731b9c@redhat.com>
Date: Wed, 17 Jul 2024 17:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 03/18] hw/arm/smmuv3: Fix encoding of CLASS in events
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-4-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240715084519.1189624-4-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u6nz5h5LvWMB

Hi Jean,

On 7/15/24 10:45, Mostafa Saleh wrote:
> The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
> class of events faults as:
>
> CLASS: The class of the operation that caused the fault:
> - 0b00: CD, CD fetch.
> - 0b01: TTD, Stage 1 translation table fetch.
> - 0b10: IN, Input address
>
> However, this value was not set and left as 0 which means CD and not
> IN (0b10).
>
> Another problem was that stage-2 class is considered IN not TT for
> EABT, according to the spec:
>     Translation of an IPA after successful stage 1 translation (or,
>     in stage 2-only configuration, an input IPA)
>     - S2 == 1 (stage 2), CLASS == IN (Input to stage)
>
> This would change soon when nested translations are supported.
>
> While at it, add an enum for class as it would be used for nesting.
> However, at the moment stage-1 and stage-2 use the same class values,
> except for EABT.
>
> Fixes: 9bde7f0674 “hw/arm/smmuv3: Implement translate callback”
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h | 6 ++++++
>  hw/arm/smmuv3.c          | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index e4dd11e1e6..0f3ecec804 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
>      SMMU_TRANS_SUCCESS,
>  } SMMUTranslationStatus;
>  
> +typedef enum SMMUTranslationClass {
> +    SMMU_CLASS_CD,
> +    SMMU_CLASS_TT,
> +    SMMU_CLASS_IN,
> +} SMMUTranslationClass;
> +
>  /* MMIO Registers */
>  
>  REG32(IDR0,                0x0)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 9dd3ea48e4..3d214c9f57 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -942,7 +942,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.type = SMMU_EVT_F_WALK_EABT;
>              event.u.f_walk_eabt.addr = addr;
>              event.u.f_walk_eabt.rnw = flag & 0x1;
> -            event.u.f_walk_eabt.class = 0x1;
> +            /* Stage-2 (only) is class IN while stage-1 is class TT */
> +            event.u.f_walk_eabt.class = (ptw_info.stage == 2) ?
> +                                         SMMU_CLASS_IN : SMMU_CLASS_TT;
does it match your expectations. While reading your previous comment I
have the impression what you had in mind was more complicated than that

* s2 walk that encounters EABT on S2 descriptor while translating
  non-descriptor IPA is reported as class=IN, even when doing s2-only.

Thanks

Eric

>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> @@ -950,6 +952,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
> @@ -958,6 +961,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
> @@ -966,6 +970,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
> @@ -974,6 +979,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_permission.rnw = flag & 0x1;
>              }
>              break;
