Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp2055841dlb;
        Wed, 15 May 2024 05:27:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIHYWE5rxU+AxR6T17/4Buo0aQh6J5yS1ykNqCgfka0+Tisjzr7lT9bBalCpkYdhCh6omeGPBWF9dmdBG6j5yocDvogjNr
X-Google-Smtp-Source: AGHT+IFK802g95LgIp7AQdI3PWLpo5njAwrHfdZ0Tv/B0L1ER1kWtHyqHHrzZZ+b5L+W0y5Wu0Xx
X-Received: by 2002:a05:620a:5a54:b0:792:9bf6:fca1 with SMTP id af79cd13be357-792c75f1eb3mr1627309085a.60.1715776074305;
        Wed, 15 May 2024 05:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715776074; cv=none;
        d=google.com; s=arc-20160816;
        b=ap2TPyXXexcv6/eFQxvthGVzJ/B2JeNLZf9wC20GCIaPmSn7vma+0+BTjovF4LHIgM
         E35pOP2uuCMKjAw3wbiSSmJDPcfZlqf97iRJQ6jdw7cv0IGH0paZiZuYC3uMR+cYV4Hs
         mjzoSHNdqBOy6AyrdHGZTrlK4ycBWF9QoS/bkTt+S8/WfXJIIJaCTL9n3w1vLg8Dcx0l
         SkSevuLg6NpajJUYXE3tiDgBCdWDvfZfbQJ5tSPkIV/MLHsOYA/2Bt/71NWFj6GDAYx/
         L0ENGJ5MFBt3ouWxmbAxZAC3uHj4MXy3uze4eVhTVRmCbzKYLGiiD2JhivAZEGGnGExF
         CjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=AaeqkP6PPe9K5SSu45mB7EqksnjY8lmh0nHD4tF6fFI=;
        fh=uxxjOKsmf5KMp1hfZow4zw9gtx+hcEsz2IEDpuj9mZs=;
        b=y/r+0gM0LMqFdB5xBFBRC3O3oSrbjdUHQn+QH0hF/5rKXF+VOekmtzT7/UtRqDPXJ8
         LKczvGIXVIq9iosgDaQ4P//SfWDHjUdCaE7yCffvdzHFxkgTpsKpWg+ZmYWPmGjAcoZ2
         9QTSXHmL2IQSPJKqU7/qiXJbm5lBStsf/kqsjow7z4QG7jAnHyPewN2DUSsi9Xr0w/lJ
         faCiC8i5w9+qDIx/WrFvNEKyKAJy5/zBu0N1OikJtnOSRUq9U+sIUijcGxP6CSGAdwJX
         Hojz3qgEHonUr4eZ8vR1ail5DVdL0i1+6+b4Wpe0G985b26RGP6bK3KMQ809wjlDehrJ
         Kuiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YiYKjeon;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf2772c6si1336608685a.7.2024.05.15.05.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YiYKjeon;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715776073;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaeqkP6PPe9K5SSu45mB7EqksnjY8lmh0nHD4tF6fFI=;
	b=YiYKjeon94o2NbImSuAO/LUC4AkRZKL5VyIMzG8wFA1aaVSSM59LDjOwxuzHfmpCkqo3rr
	r0AHwoCd2XRf3KvbeQkI8txEjO6hPfwhDOw2EgMwL78x5tJXCEKXP/5Z9SRZJjVlT8l+xj
	L0oUyVxb3YvSrLfSnQl0UPgGnrO/rz4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-ldcxI_BfMOijauHm4trt6g-1; Wed, 15 May 2024 08:27:52 -0400
X-MC-Unique: ldcxI_BfMOijauHm4trt6g-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1ee2f06e652so70109145ad.1
        for <alex.bennee@linaro.org>; Wed, 15 May 2024 05:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715776071; x=1716380871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaeqkP6PPe9K5SSu45mB7EqksnjY8lmh0nHD4tF6fFI=;
        b=loMqt8zlnARJqDcyYFJfH6+7UXECacLGopCxiduHcyiZkkypBuHrI7TK4GpJIVR1TL
         KGzRyivl4vaj5FrW06/IwQLmb/IYNm8rzpB98r9RB+ejVBmkZJVqei4lVGz+jU4fUzaq
         KwdE0oSwoXfJTMMb2/T77RrkmQer9da4fbduw6z14cGJ8cCW/0AE7vwdOGxPJLjqrhhc
         WWMD5bbso7dNiOzwuGhW/il1Xq9X+hS+drC3SBm+eBSW46rIMW6gcwBiTP/z8WSuyMop
         ZmnNen+lzdzlsyQDnhzWhjYnLOG9n1zrPuX9uIp6AfGJr88oUeG0+VGe924QupA0VPRX
         7dgA==
X-Forwarded-Encrypted: i=1; AJvYcCXoJdoE7Ghj4DLX6jIvReiogyH87wrXcyg6BGmt9OVJxp5GrupYXrnhjQi4JblxLiRlXI3WheKeRNF01ibAFnGbVbi4nBdI
X-Gm-Message-State: AOJu0Yz+OYyHXwV9TkvoU8nNq3Xn5IrmN7mSldeql9bwoUSHywadsUWM
	yvEJmHpyJvht0Id/JOizsjVfsOmlAjfITCvemfNOBVcIuyY5fZTg42+M4OFe0FjShCYNYpoeAkW
	K9y/5+ZewlyevVBSEwb1iWL98+MlUl16mTfK3jd4SETqLlYFBrpe2X7EhSV8suQ==
X-Received: by 2002:a17:902:cec3:b0:1e4:346e:74d8 with SMTP id d9443c01a7336-1ef4404bcd4mr175898215ad.61.1715776070728;
        Wed, 15 May 2024 05:27:50 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:1e4:346e:74d8 with SMTP id d9443c01a7336-1ef4404bcd4mr175897975ad.61.1715776070290;
        Wed, 15 May 2024 05:27:50 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bada405sm117435485ad.92.2024.05.15.05.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 05:27:49 -0700 (PDT)
Message-ID: <2ca04dfa-61bb-4f35-954a-b5f107bf8f36@redhat.com>
Date: Wed, 15 May 2024 14:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 03/18] hw/arm/smmuv3: Fix encoding of CLASS in
 events
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-4-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-4-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: x97mcPeyNHkh

Hi Mostafa,
On 4/29/24 05:23, Mostafa Saleh wrote:
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
> While at it, add an enum for class as it would be used for nesting.
If this fixes somethings please add a Fixes: tag.

Also you may add that until nested gets implemented, CLASS values are
the same for stage 1 and stage2. This will change later on.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h | 6 ++++++
>  hw/arm/smmuv3.c          | 6 +++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
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
> index 9dd3ea48e4..1eb5b160d2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -942,7 +942,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.type = SMMU_EVT_F_WALK_EABT;
>              event.u.f_walk_eabt.addr = addr;
>              event.u.f_walk_eabt.rnw = flag & 0x1;
> -            event.u.f_walk_eabt.class = 0x1;
> +            event.u.f_walk_eabt.class = SMMU_CLASS_TT;
>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> @@ -950,6 +950,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
> @@ -958,6 +959,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
> @@ -966,6 +968,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
> @@ -974,6 +977,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_permission.rnw = flag & 0x1;
>              }
>              break;
