Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2113291ejb;
        Mon, 13 May 2024 04:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVX+QOM9GfdBhVluOqtTNwmcMEOVraUwVfsj1nTz/v14HstqOG2debEhg4Ckzw36PFSFH4oZKJ4ZOWnb4bFyILZ+JKkRN1
X-Google-Smtp-Source: AGHT+IF3uogP7+ApzuYO8Wel/6vKz1VjzNT807dPsaYKLHFSb7e3rjatlNWwwNKXqBv8a4JcEqRE
X-Received: by 2002:a05:6808:4185:b0:3c9:6e10:ab35 with SMTP id 5614622812f47-3c9971f9993mr8458887b6e.58.1715599831575;
        Mon, 13 May 2024 04:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715599831; cv=none;
        d=google.com; s=arc-20160816;
        b=zNq84AsFUtEN0tdHl23VHO+2UMI/pXzfz+XdDDJKwp/yCIocYA+80SrchZdLmVHlTU
         BqjvJsWO4CtXh4o7LtRti6r/To5yDNXXgDw83PhU0sgKyN73x9Yl38wPpim1aftGvNb8
         GNjcRtkUTbhImxLwh9DQ29yhuZoLB7tZor7dkGfxKzEk1KlkkS3NBLBwYMX9LMMgbDI+
         KJ0aJr8D6B6wOWoryeO2kH9GmTQgjBsw/2ZKlFdeyW2Tb7vChbqSH9G+1C9XZGdc0b7+
         4DFbc4PLILf4XneqiGMRQ2T8FX/dApsc/IfbEFLzNm0CCj7DxCtpNxlcHfM6eqw1v0pb
         znKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=s1vbbD8eyh+YapZ1tbyTXmaKMwlt/B2MBUfyCaE+HSw=;
        fh=bp7yo3a688jGxva2Gb/fhEas20M7jX9SepqRgTsXTvM=;
        b=YG+qrrmidqrXIEIS34HS5ETAaUWpaEGOvhYFI+qqlrXq7ZdWww9lAxlI2kJAwdisu0
         2tPTfGUuy3R3jnVd34quVm0uSJGa8kOF+2Bnns+UjSv4bi47+3pkSjVrj5HFyLUJNHcN
         xHtw8DmwdVnAXijGLLujit3wcF6s3s69JlEut0ufBUgViA7UHqO4UHU0eJKS6P4YHe3m
         aB+pI7Ht/BVw5+LY5qum6vHrD/Ysqe+40PnicwrWxtcyPZhxbVnZlALZSG2h/7J5A28h
         ZMeiPOYvXcr6SEbme1EpqaAfNvi6oBdNFhTQabRKVPVHMsJrt/+zD8ZN90jLVflSNrIF
         PYWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WP0jia/j";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f1d76c8si93426076d6.61.2024.05.13.04.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 04:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WP0jia/j";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715599831;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1vbbD8eyh+YapZ1tbyTXmaKMwlt/B2MBUfyCaE+HSw=;
	b=WP0jia/jUNfRg0Xm+zQ+7jLkCbXiwKyouz4QR3rC16zRD6A2HK/lf8LybsAhFFxh4kQx9J
	4BA1unL/Wf0tU9geHtX+WZSwxjSo2dqjlfaYHv8jM1a2Uu8kMsFbcOgiddQlgq4nFQ30ui
	e4kQCXI6cjoRmxT7W6U3sB2LlkosD7o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-HT0ym8sHN6y7T27scUOutA-1; Mon, 13 May 2024 07:30:24 -0400
X-MC-Unique: HT0ym8sHN6y7T27scUOutA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6a0e7d77b41so62403046d6.0
        for <alex.bennee@linaro.org>; Mon, 13 May 2024 04:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715599824; x=1716204624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1vbbD8eyh+YapZ1tbyTXmaKMwlt/B2MBUfyCaE+HSw=;
        b=P6gPudO/D7aL2GKQtxCWipPbYqqUFozE8OIbljffgfMz+khRbWdVqyK3IgIuQdIhYZ
         kEuX3NBLKTHcSqorJ+KS3k4g/nM6PySv+fD+SXxaeGXlrme/RBxMrr9d8kRPobWuNF6g
         Oa4pRnJWjTUwzT/LCWRX1R4dNt9cJ3+E7We08y8jijYyLl1fa4CCdLCcAPkZ5aI1UbxH
         MyFHwLXzo4jFAR8S4i/Xfr3Wc4MbWbaSZ7MHPqI/oIYpFqIBI8+WZTDZdKHMs33QjAgw
         bMBtwPXR7I/UIbLCi+rKmOi5jkCn85PBLUwRnKi3S1U5nXw5shUTLzT0FWMee9oCV4/e
         wCHw==
X-Forwarded-Encrypted: i=1; AJvYcCV4L28U5r9yFdchnvaGsTrowIrN7lHlFr4O1jH/nsqfXu1p6X8daN8/QuYrgeRr6qU7T2twNc71KyluGcfBBgzztQbQgRyx
X-Gm-Message-State: AOJu0Yz5ZUP+1gpLYAgGLhFdzM1skL2Wu8CmkBzwI91OQK8rQDN5hiCv
	ee+V/mSyMQEAR66h4WlERaTIYl5db/nfHW42pw/DIsvswXbaUdZ+KQoROud6DYFBnd1RRcLSXlA
	NeHfy0pwKOXFlWVKkqmkKZlEo2I9CQ99PEBWjnKdOUvQsHi4bjHDyow==
X-Received: by 2002:a05:6214:3bc4:b0:69b:1f75:e700 with SMTP id 6a1803df08f44-6a168219c4cmr120015026d6.33.1715599824198;
        Mon, 13 May 2024 04:30:24 -0700 (PDT)
X-Received: by 2002:a05:6214:3bc4:b0:69b:1f75:e700 with SMTP id 6a1803df08f44-6a168219c4cmr120014846d6.33.1715599823867;
        Mon, 13 May 2024 04:30:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1d73d3sm42602996d6.114.2024.05.13.04.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:30:23 -0700 (PDT)
Message-ID: <34258a31-5bfa-4005-ae04-6e56a2fab671@redhat.com>
Date: Mon, 13 May 2024 13:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 01/18] hw/arm/smmu-common: Add missing size check
 for stage-1
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-2-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-2-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EHJIhncmh1Vc

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> According to the SMMU architecture specification (ARM IHI 0070 F.b),
> in “3.4 Address sizes”
>     The address output from the translation causes a stage 1 Address Size
>     fault if it exceeds the range of the effective IPA size for the given CD.
>
> However, this check was missing.
>
> There is already a similar check for stage-2 against effective PA.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmu-common.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 1ce706bf94..eb2356bc35 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -381,6 +381,16 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>              goto error;
>          }
>  
> +        /*
> +         * The address output from the translation causes a stage 1 Address
> +         * Size fault if it exceeds the range of the effective IPA size for
> +         * the given CD.
> +         */
> +        if (gpa >= (1ULL << cfg->oas)) {
> +            info->type = SMMU_PTW_ERR_ADDR_SIZE;
> +            goto error;
> +        }
> +
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = iova & ~mask;
>          tlbe->entry.addr_mask = mask;
