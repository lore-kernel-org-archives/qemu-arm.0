Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp393783njb;
        Tue, 13 May 2025 02:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdWZ5J2LMKOONm0cVShO01Z8+0en/KUMpeT/Fg4aTRz4QlJkCFwXG7lOAmUGaYRoAj+BSFjMdbrQ+AHg==@linaro.org
X-Google-Smtp-Source: AGHT+IEyva+gS411cja2JYsH599t0RVlWsHPjEfEpDwHPWHLj/KyZUg2DS3dsR2ZnbOiil1apact
X-Received: by 2002:a05:6214:242c:b0:6ea:d604:9e4f with SMTP id 6a1803df08f44-6f85b680750mr41660396d6.19.1747128942432;
        Tue, 13 May 2025 02:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747128942; cv=none;
        d=google.com; s=arc-20240605;
        b=SM9Zzf/C/izY/KEyi9q+dwAOhbFrzavUtqY/Doxm0n4IqbBh4nXxCxWL5kKtto7YdT
         CbEgH2JiQKKpUnXoYIS8TV5nmS/79ZEsGX4F+zmaY6ENWTHtrsNpL2MqFzjM5wr5CUS5
         vmgSr+l4FF6VRm3Sh/+rywqr0e/YrxbbQX1e6ioDYH2xwSARX0y2DHTbaU1atZfDc9Gd
         XsMDgG6qS5nVD/5ZciFJLM8F2YWOi1/tkkjVwlyMSZW4MCWKr4/B9MHcA0rgjzuWFSb6
         0rgDVXHOUh77B+KQZnYQe3paNqnSyc6DeOJqlsdRYRlq2vW9Mon5bXQ9l4sjne3rqFCp
         d1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=x2sEFkNhHYZ7GGQUEXzmazTwyDBnc/lAYLVVyCnVFpc=;
        fh=D1/dwVuM/w/rbj2m3FtALNkGikm5YiG2Y8AwnirmbsY=;
        b=XSKpFpczsKnquo4QK7+qsTjeo1b+IAbICwPnUxFdlHO4lGBeqNhJzEYgmaH4PPMY3H
         KfXnwOhW/5mdF580i+zlyfV09VZuiQ6NFshQbFsdXfI67eTeMMQr5UvP3coqa6IXBfi/
         qNWPzX2e2Svbdjqk/uzlYw9HSkuKI+sRcaeo7CZUTeB7Qu8gd2d68qW8CZeoR5Ufqzxs
         TtXZcQxfwZ3HKX4VKOlh4FqwMX11kMlG1Jrr1d7JF2mCUPfx1X0ZL05zolCcea3d1n1L
         2g7rTdV45MfRZRU0Haldh4jRUgSoKE5plYYdIfZyWjiIkq9vmUhLVNZ077wnNxZ+Teoh
         9xug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cUTYlZjh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a43002si111042296d6.268.2025.05.13.02.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cUTYlZjh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747128942;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2sEFkNhHYZ7GGQUEXzmazTwyDBnc/lAYLVVyCnVFpc=;
	b=cUTYlZjhjUlGa/fEKYdXYiAw0MCRZOm1JetnfXBj6doKTMd++Ki83Urns6mxSYQDpaJXh6
	sFqlq+m6AtrbxOW4cUIo/wneTCFSsLdrtwwHhK9iumn9YKlkmHn6/If8mru3OEZe/23mn6
	Jmeqbf50Xq60yk007YeDW8WZ+9L40yU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-adNF7CEzOA2CglaA9aDuXQ-1; Tue, 13 May 2025 05:35:39 -0400
X-MC-Unique: adNF7CEzOA2CglaA9aDuXQ-1
X-Mimecast-MFC-AGG-ID: adNF7CEzOA2CglaA9aDuXQ_1747128938
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-44059976a1fso18291275e9.1
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 02:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128938; x=1747733738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2sEFkNhHYZ7GGQUEXzmazTwyDBnc/lAYLVVyCnVFpc=;
        b=unbCihYpc7JA5ywxt+u2Gz14P3HNuFLJLz8lmdXHlg/qopuofgiJPIuzf13H9r9pgL
         IestywkfwQWeLyx7mqwFmrkerlY37NoT1ixiyzfs/gfRUSOI8/MdAx/E3IVQ/E2v1qKY
         /eYFSk9zskKjwbqNgCos2k0jo3dUrkXLiQ3M0Y5WW/LdbSQ6LK2Z5v10Cj/Z2eaWRNc2
         paEk3bT98pBgsYPtBAhlIfepunyQONqn6P7sLv3urWsAVmRLPpR7FvchrHFontiuQBJN
         2naAE+8aFpnuovrpf3UejBSSXNV4Cdu6v45JgiYBaA1WRhxYLEVvO5dL/WBOKNg8ufpP
         zvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtih5Iis0/mYyqzVuwqchCeHlUIqy8xKAUsf2LLZi0Ry6gTukAyy9G7j2lnxEA1y1xPdNp7zIERDUHaA==@linaro.org
X-Gm-Message-State: AOJu0Yzei/7bs1wEJMqC076CQyQSMa6NNPaMAzUK6U1dazHMw4a5Y/+j
	2BJ0OTJJSOhV/ID8rDQYn+klEeWi3oMihMYsEfUIggipFhF+oQ/KCPTyr962xbPz+4DJVn94pk0
	srSHK1UgHlBEYkBM7uKtqi4qq0Mcx6JEFAsN+gtVepXnFw0lrJinK0Q==
X-Gm-Gg: ASbGnctUzhkNx0wnZc7VxXK6j2+MxOcrqAKJ8emmzgDPkM2OYv5nRpyXLARJjhTpY2m
	OoxjEc4dXOw3PrPQc0KFIvtbwMFkHVXkNKL/kQwZCSvUe+XoAFbg+ImZ2DtDC6PmGIIGrCiYbyR
	ACWQBjICdzS0GmB+SCPsvUNM7q9Bm1pqTnkZ9HkQdctdidsqID6nPTDB9zosKX+EuCHcc3qaTHr
	1ApIXgyb6wQ+l8sOnFxzvvYOevLaFsH8UNfPhr+T50rHh1hSoHEJvLmy4hSxxHUhHANenqeQohu
	Faba3MfEqDVcw/EbyqS6iHdCvPoCRu0q7Pjfy+R2981ca9MfSLy29lbu5Ro=
X-Received: by 2002:a05:600c:3e8c:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-442d6ddf4d7mr118849345e9.32.1747128937780;
        Tue, 13 May 2025 02:35:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3e8c:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-442d6ddf4d7mr118849015e9.32.1747128937420;
        Tue, 13 May 2025 02:35:37 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687bdd6sm158275685e9.38.2025.05.13.02.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:35:36 -0700 (PDT)
Message-ID: <df944d74-335a-4131-a58b-3bf4dd6fc1b7@redhat.com>
Date: Tue, 13 May 2025 11:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v6 14/14] arm/kvm: use fd instead of fdarray[2]
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250506085234.855779-1-cohuck@redhat.com>
 <20250506085234.855779-15-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250506085234.855779-15-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TbVXiX5CLkRZnPY7XmJoha2CgwSG5W6viFw9SOeU0u4_1747128938
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: tbGeEZS1FA74

Hi Connie,

On 5/6/25 10:52 AM, Cornelia Huck wrote:
> We have fd, so might as well neaten things up.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Cheers

Eric
> ---
>  target/arm/kvm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index abb63b7f617f..1ffd67a39056 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -387,11 +387,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          err |= get_host_cpu_reg(fd, ahcf, ID_ISAR6_EL1_IDX);
>          err |= get_host_cpu_reg(fd, ahcf, ID_MMFR4_EL1_IDX);
>  
> -        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
> +        err |= read_sys_reg32(fd, &ahcf->isar.mvfr0,
>                                ARM64_SYS_REG(3, 0, 0, 3, 0));
> -        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
> +        err |= read_sys_reg32(fd, &ahcf->isar.mvfr1,
>                                ARM64_SYS_REG(3, 0, 0, 3, 1));
> -        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
> +        err |= read_sys_reg32(fd, &ahcf->isar.mvfr2,
>                                ARM64_SYS_REG(3, 0, 0, 3, 2));
>          err |= get_host_cpu_reg(fd, ahcf, ID_PFR2_EL1_IDX);
>          err |= get_host_cpu_reg(fd, ahcf, ID_DFR1_EL1_IDX);
> @@ -429,7 +429,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  
>          if (pmu_supported) {
>              /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
> -            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> +            err |= read_sys_reg64(fd, &ahcf->isar.reset_pmcr_el0,
>                                    ARM64_SYS_REG(3, 3, 9, 12, 0));
>          }
>  
