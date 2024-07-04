Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp765876njb;
        Thu, 4 Jul 2024 10:54:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9JcWab7vfZVllxGd7t+pNnkpZGc6Gmy8s5BOsiXuqakX/MdHJkSnZYJ570OcakjRrGhcDIm0q47IiLDmdOOXAvmqq9k2r
X-Received: by 2002:a2e:9b15:0:b0:2ec:5b8f:c797 with SMTP id 38308e7fff4ca-2ee8ec7c1eemr18882571fa.0.1720115697651;
        Thu, 04 Jul 2024 10:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720115697; cv=none;
        d=google.com; s=arc-20160816;
        b=vlvY7FPLwVgiZ2lfwSIA++jecBDBm3hk0a4f+uKMOSmbP1I0YI+DA4B5h+OVM3kIOf
         fYGK5sXXDO2sd3eSPRjUL6gpPBmfLvmrJZcsIWLkitRcs7KpSeeIbDNOtgkNbRruvL5f
         XNpdzArFFR1Ugj5QI3OBumTDscOySVP+4wE5osurUXSzJYWLQizAAtin4yJEtm4CYjwy
         +lbM+w5xDvAso/bXGvLSt7brRrXSmUbNh7AVwJKLukVfWQ8WC5dFWy8WVc478GVDcvg6
         wi2FIO1K7bH1DguNGPUnDuju5o3DghWKS5NP5zaTv4sycq2rpzKhJK5FNNbgO379WrjI
         33Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Is3ZyLPwvt3nZQiAgUjvFvmblsM3OzpzDvlfgCbYMOA=;
        fh=MK+0nLHnqEcmnRjYQiuj6ZcTgVVcO2YsLFpj8zT98Sg=;
        b=HTuSuejd/QNbgDSq3Vm+jU59A9SfL/G5EjXDjb3ozPzBLiJrRDx2pfvTBxTKn4KJaH
         RSsCE4TOqyzBloFMmanHOf7S/OeFb3L4N+U0lPc5J2LxcPDznSTgjuU2ftpb6cFwaqDG
         G+V8X8lfjkddTPhf7DR1H2/IBxtkWStVIm5w3tcEcxqQLOrHRSNgATDvWunc6igIrMZK
         KazJ6ISqET3FJgBiM98rST5VG34fI5mhreU7cVlFKQAvCCOJZQCopcSbOkXOAGPfKlCx
         rPr9UapXTdRu/bqdDaz9jHb6Lx+h9Avgk7mzGvLk+QVP9H04irP5FHAgD2nlagROu89j
         Zu6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdRJSYXb;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ee8eab221csor4468051fa.15.2024.07.04.10.54.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 10:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdRJSYXb;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720115697; x=1720720497; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Is3ZyLPwvt3nZQiAgUjvFvmblsM3OzpzDvlfgCbYMOA=;
        b=OdRJSYXb+6wl4WpZ5Z80Y+H43Vgepe0umAOtHlk8plfO3tsogrvwoSXLJvSFmfUmF9
         YxfJrnLROk0UBcZWfeQEf3uER7fVjwg1lXoHEP5ZFxpzUFTKpDjKm3STD0nzh0rSdE+n
         D6b6jJt7VRh9KSnKl/UO2+AoSRVM4C8KaogJN2x1vjBkaM6E1WAaV/xccvxPvMrJ4mf2
         dZLR0w3rsdo/8y56cyFG9Az3M0NYU3aW8Ko02TFl0GdL/St6QM6+7xm39peHfhRcs609
         3sEOWP8RoqsQYWDs5ML9TtU3ZBO7JVVp29NDcd5HE5fOw/ztwfCRHuNKG0IEi0qRtFJq
         UeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115697; x=1720720497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Is3ZyLPwvt3nZQiAgUjvFvmblsM3OzpzDvlfgCbYMOA=;
        b=t39fmChY61hsJ4hliQ36N70p7781Thz9Cp6KOdKsb72AAvrKQHvV4OHf8V3d4xhjDl
         8w120gTtj8bo+n9quaGRyDiE1Y9KZ0Szf9mRXd3l5C7v1GaHgXicUty+hmkIiBsiAUD/
         gFyud733/T5JZtEt2f7WCsdLLKWhTJICioW5+72/jHjXRFWpohy27QjlVqwyFQQzC+jX
         IduRrmlKx6nzJ7+oWokb3Z28Sr1VRQ2OwZ8HMTp573q28yz8nPzx8t7/sltqhUoZQT6o
         izP1iDHprIyeutpzzZ1hz3eQYd414eD3gGFAe3khEVNCJumLOOWVzq10tui+yBZ9Md5T
         36CA==
X-Forwarded-Encrypted: i=1; AJvYcCXC3Kk9f3CqHt2h+Tw+aUUHWZa2tVx5IiJLSvoUNZi3L5c3ct5bzTjxCP7FezztW1l6ZFltw6nEslCYCRRGC99vOstlOzd7
X-Gm-Message-State: AOJu0YyFzrIX1AABStY2MeAUgAa4tG+MSM8Do/WXQs5Yos1XipGX/VWj
	ZEeLe9fjWLMedmO4VIMDlrRG0H2RAHuVS8Yzh9LNpH3mTdqqoTuWK6c5L7WjVZ1sPQ==
X-Google-Smtp-Source: AGHT+IERerCxokz8+D/FbT/9E30WbZvkfYabKYLyD3SVTlxujbc2Pt+i+/EPSRs2REYhlf7LnQG5bg==
X-Received: by 2002:a05:651c:1a0f:b0:2ee:87ce:c863 with SMTP id 38308e7fff4ca-2ee8edff05emr20226921fa.32.1720115696036;
        Thu, 04 Jul 2024 10:54:56 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d510bsm32914735e9.3.2024.07.04.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:54:55 -0700 (PDT)
Date: Thu, 4 Jul 2024 18:55:08 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 01/19] hw/arm/smmu-common: Add missing size check for
 stage-1
Message-ID: <20240704175508.GA1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701110241.2005222-2-smostafa@google.com>
X-TUID: AopaGT1LErqf

On Mon, Jul 01, 2024 at 11:02:23AM +0000, Mostafa Saleh wrote:
> According to the SMMU architecture specification (ARM IHI 0070 F.b),
> in “3.4 Address sizes”
>     The address output from the translation causes a stage 1 Address Size
>     fault if it exceeds the range of the effective IPA size for the given CD.
> 
> However, this check was missing.
> 
> There is already a similar check for stage-2 against effective PA.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

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
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
