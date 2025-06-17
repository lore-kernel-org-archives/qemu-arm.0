Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2392968njc;
        Tue, 17 Jun 2025 02:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6155CahF9E/xUEGFCVBy4Mw8JjTVMagPRqIEwhKzAgweTiM2fzEu+pjIzEZAJPpHK89kh7mVrvTSI+A==@linaro.org
X-Google-Smtp-Source: AGHT+IE7leNvVxPxbs52ZczkUU8by3OboIQrRbCjFO4jLgiOvT+lOgn/SoytPCn0ZRLSqTFjS1FJ
X-Received: by 2002:a05:6214:2629:b0:6fa:be7e:c0be with SMTP id 6a1803df08f44-6fb47777366mr207983886d6.34.1750153616181;
        Tue, 17 Jun 2025 02:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750153616; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYNVsZBAwo5chpzVrmtaFA5RFCGF9o8wES45jab1ILbmvg8wz7osyyKGhYlv91OTKY
         ajboSFgdxigFWKmfccaFWCZQnmaLNbFmH3X8qTjHy8n92i/krWLPcPt2zzQ29X9rhzWA
         j0y6WJhZp++RBflPMvtN2+NqV2h1k/COQrGxd9gx783nFSgp1UAqzz81TdU9kIm3RhhY
         0nVwAHsKAB5h9u8lQl/kDCLXpBkFygL2Nr+yUIXZYaAeliCBBUdcNDwTWfP8Pi7B/33Q
         zZWsG9kLwu0xpBy3525aXymXZ8popmHvN7//QgRXXa0ER/o2AJJWKvmETbM38/iHQEOF
         wWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=JM0RIiNZftal/f1jZbhP/9upwL7QmYYstUXcI6ZDHQA=;
        fh=1jfZc9CvrrlkoWv1LC0of5kPApyqz52Q92jrRBR1gSw=;
        b=atn+8lORqfYEP4VqVWvB1vIL/0Q0wg0vNI4dwkMedVx7JC/m/RktDkkuG+ERqOdUYx
         6mT5GjultCaRPNsCQm7d5eH0EKo2yjhRnM6Tk45F22/Fe7HWLDg50r5pJUSVN4lb+tUa
         s7au5TnSjys5hCyNUVR3EJ+WkstuU1x1p/vS47Muh2BHGSFOYzQrTfY0ItasVOa1WWVy
         JX9xE0Hf+EvOuyWVIM5cbnFqkBR9o/ypzf5jZIlJ0U10++LzuKmcyDKubjX6BQER/pB8
         wlno6M6NscXLBBwBmFizgBkWhvuOenGDGx74VIAVh6waIUD2XAzcgIT1M/JwoQtTFxZ2
         E24A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CuacSIzK;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb546b1dc6si48087646d6.269.2025.06.17.02.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CuacSIzK;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153615;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JM0RIiNZftal/f1jZbhP/9upwL7QmYYstUXcI6ZDHQA=;
	b=CuacSIzKPnlysUfmoYN3WmxnQ4M06ptVsTgT0jSK4zKV5IysCVCsdGVXXOHapmysVtm1B8
	sYJjXWZhzFxq6W0Bt6nopoL9i+aWR40zBwmYHpZ9Aaq4rXyrE0dsJBfPeVgwauyrmmcjSp
	h8EAtYWPf9waz4WIP2K4I8MNgzUWTVM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-z7pP9ZS2O-a1J3iNWF3I5A-1; Tue, 17 Jun 2025 05:46:54 -0400
X-MC-Unique: z7pP9ZS2O-a1J3iNWF3I5A-1
X-Mimecast-MFC-AGG-ID: z7pP9ZS2O-a1J3iNWF3I5A_1750153610
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450787c8626so41105285e9.1
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 02:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153610; x=1750758410;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM0RIiNZftal/f1jZbhP/9upwL7QmYYstUXcI6ZDHQA=;
        b=olTtHfjDVlXvFoK3eOshBXO9cDjbPs2BZcU3RbFwBbIUzO0PxZ7r0GuV3yLEcAD3Kr
         9UOrNjodU4Aco0nHagYRYIxiBgaykZibOrWaqGqcP1vw5E+/i7OlfDW8OXx3XzNoLflB
         epf+LchtOmqyyU3LvagLqNwiQcoBblN/hx3F96nM8HZshkRmQ2W0OaXUqJh5nzxx4G4X
         XXTrrQzgNlStfqEso0vouLQDYIcVeZQowUXq8SRlo4YLrUZji4+at/6B5tg2UwXBlBnn
         bqHl2vkW2IzL4KpodOGlD0IZIDv/kSCUjMPfQ7rP5UB2kjcdDo36GsbL4j+etOr4EL3O
         ZXgg==
X-Forwarded-Encrypted: i=1; AJvYcCWRkCIGlSniv+1/MHbCoAqzZY3t4s7mYz/PG6OA7KcBk+PoOp4M0iV/J3itxwmzNyk/8F3FZVB6HWr0ag==@linaro.org
X-Gm-Message-State: AOJu0YwQLl7bIZBOkhbOu99UsSutb5s3sCqFc9UIAcgBoZn1WK5tFm1b
	c9Uh8AsmqQmGgS+SPylA+X6nntOzC0COXQ+h0dyKA2OyfHktl5vvwRx+bMQBapRat3y6zii65If
	kVChIaTuOvzcRpwoF/5K4iJNimYxMcANVp5II+5OuWRJmohh1LrhWy0UBBA==
X-Gm-Gg: ASbGncvYUAT6XT2SZKtZtafAlyFp8gzMRKKJLMhqn2noJ5OWr7WmRW3J3/ybJvtvMTV
	8vNizmyWPBn9GvclDoF0qFLxu3WYQwdS/11NQ6EcAb/dfVMuldS+bAYOBktqUQfbJGvrTdMcc0T
	2b53JhkvBu5C+lcauEdY+zUdBFNkLqKmfQI4qkooTEHwDyLIhZ3QX+OSn00SeZTa4xiODT0QrJ/
	TtnCl9VQJVdq1dOVdfjVgKmOmyIsyMUnx6DMFKv2AAncg1d2WDAQ5m8L9UZpFPVC4ZhFerCWLWl
	XjTB5iw3oTVV5nllWdZCBDVOB5dZxyGgV0n67MlOvMXZ2nxGHwN/WvB4a+pRvxg2tACE3g==
X-Received: by 2002:a05:600c:1da8:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-4533cb48606mr96571995e9.21.1750153609893;
        Tue, 17 Jun 2025 02:46:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1da8:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-4533cb48606mr96571735e9.21.1750153609503;
        Tue, 17 Jun 2025 02:46:49 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e151c3csm174344405e9.30.2025.06.17.02.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:46:48 -0700 (PDT)
Message-ID: <aaf6ad75-6016-43f1-989b-1937c895dc3f@redhat.com>
Date: Tue, 17 Jun 2025 11:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 2/8] hw/arm/virt: Simplify logic for setting instance's
 'tcg_its' variable
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-3-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250616131824.425315-3-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8s-QWCJ_42NFyGZ9P90ZPWLm_bsK1kRuEi36GHBgwDw_1750153610
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WjsTmo3E9VMH

Hi Gustavo,

On 6/16/25 3:18 PM, Gustavo Romero wrote:
> Because 'tcg_its' in the machine instance is set based on the machine
> class’s negated variable 'no_tcg_its', 'tcg_its' is the opposite of
> 'no_tcg_its' and hence the code in question can be simplified as:
> tcg_its = !no_tcg_its.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  hw/arm/virt.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9a6cd085a3..42a63a523e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3337,12 +3337,8 @@ static void virt_instance_init(Object *obj)
>  
>      /* Default allows ITS instantiation */
>      vms->its = true;
> -
> -    if (vmc->no_tcg_its) {
> -        vms->tcg_its = false;
> -    } else {
> -        vms->tcg_its = true;
> -    }
> +    /* Allow ITS emulation if the machine version supports it. */
remove "."?

besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>
> +    vms->tcg_its = !vmc->no_tcg_its;
>  
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
