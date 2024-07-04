Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp786315njb;
        Thu, 4 Jul 2024 11:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZcK0abwK2ImcoFvpLf5gwG/AO+FAklC0EwAQDGMbNzRcoRul70L4/tOfmLmftrXR5cc+SwzBJrICQFYjyGAbgNvnChmFW
X-Received: by 2002:a05:600c:22c2:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-4264b131861mr21292525e9.10.1720118169148;
        Thu, 04 Jul 2024 11:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720118169; cv=none;
        d=google.com; s=arc-20160816;
        b=oTqoBuRimWUbPd9jdow/zYJa6VfSha7rrEFaCYK3zTAJIv6iwytjsJeSHI5ir/kbLM
         dJ042nk0v0FHFnaU1qssqJ6+9LAVFLnhzPiF4wujIwYJm/oaV5yhGtQVy9w8AX71GiDH
         QeOxPfT6CzFYDfho8CrqL8jNUCO1gcohJzQQepEpFB56hVQjW8+kWzcceXIkO8kKzBI0
         5PsrqekoVAqGNSC+enXOVhA7nZZRYn6zZONto7T0FA/ev8cVMxZ+8lO5As+hzYI/tBQ4
         SIdoOp5f5RDqDPPBAtaPARqLltoYLL9lHRNzVBm9OnBNGoV1dGaYled03P7oBhgiV4Ao
         rahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=xUcX8OSnZPAM+qJh3gAPm0zyGoKendARxFQeDBD8NZA=;
        fh=QApmo3XO7d4UvxAxDskCm2wAzGXU6afMIW5+HzlLzUk=;
        b=uOEL+e0OYSkuXyuB8TGoS+3rU9z43qzqT13hPjdsXepIj3qI8ood//LftBu35hmG5z
         NPuoTGzy+lnUrOIaVQ7BJ/mBCeJWG1El4asvW2HXqzYX7Rw3PlMV/L+BNpbZvYZMrQ6g
         VL+ksTbO3UZlwZRF0vSuzt/SxdITV45Enm+60rWdHPat+Yi+BCUEUsrcEKtwszfm67OM
         8WrK7HjXOUpKqWVOJm9JUIlNI3OBJ4x6FD54lKkrJ8n4nrwBNO1gyecAv52YER3DJMGE
         6ihn9uzTlBIV4z3DdmtedmV7UHDBfKwwBhH3FNRvT9VL9r3K2/44nuEPJQA9L9HPGAmE
         cwwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPFm2CGg;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4264a2ff4c4sor5319805e9.4.2024.07.04.11.36.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPFm2CGg;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720118168; x=1720722968; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUcX8OSnZPAM+qJh3gAPm0zyGoKendARxFQeDBD8NZA=;
        b=KPFm2CGgjLfMFHSXJgCZQgo1JJntJkXgZx5sHxrxE9tP6v+Xg7bJ94Enr2ZqLpLiWj
         UFFzvDLP92E7zQw7YBerEqITg/DUJqc8RrywxhivCw0mKpwpuuttoO6cUZE9bV+WtSmt
         ddmu1uqP7oUhX92ilV/U1D3zVmSzOQ+a9JSwy5Lq0eX87foDv6y49mLjZwRotDYGCxpA
         J+NtyuMo7mLP685UKqzb20HiaJSgri3jwPK2wEeaUesWNR26Y87xTiuJvv4ZaP+fizNd
         W+Jp3hZM9K20qzUz318ggUlSoXNSIWCLpE7pkVdjuEf4QGMIwv+tvjET4sq0l20i80z+
         lccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118168; x=1720722968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUcX8OSnZPAM+qJh3gAPm0zyGoKendARxFQeDBD8NZA=;
        b=DqBPto2nOP01U95c6dfkVRgFV/TE0HRO3pLhMVcNTojxGLl9pP6sYVWtSTObsSUJtA
         j749S1V1IzSlZR6Hw95g6la2P4GdxFuxklglaE8IqLrLCRfX6zMzrSyv4LdfQdPfwsvK
         KxdzWrXCMP3uQhQSI3zKuzDLSQ/9KO4agOt/ZRnNW+8jrKL6DtUMpvOuwptpsR9JzZi/
         L8sGLJq9bs25h2239cjvuNh34k2BwhOTN4fWbIzf1peRrIcf2USQa5jycK3Gdyw3pWki
         Sk9/2SCKGlaep73CWwW5k/I2rnMTP4uOScd4F54NQ8cOur6i6URa31eOic1wUxsTVGKm
         JH1A==
X-Forwarded-Encrypted: i=1; AJvYcCWQgvEo0maR/f65Y4B5SYbGIgRS6rlQa1X0kuWud0YD054VRb5mqPTEuDY8oLGAKnJ/Ex6x3Hcl7HJPqlpgRbSRZNEbzoEa
X-Gm-Message-State: AOJu0YySddN1aeF3T1oVgMhgrV/AE4627od9iLJJVF7AUmdZoXEOBJfR
	gNbiqav5GjIuRqLyzU8TvIubqtz1E+P3kzei7wgT+kJHtLnsBTz/wWWZRivoGRkfHQ==
X-Google-Smtp-Source: AGHT+IHn5Baii57+Pho6BH3Ld6xrqD6gYO2Fd5H3MYHn8Pb70IW1TVB0XxglA8RSyp/gs4iJgHwQVQ==
X-Received: by 2002:a05:600c:3154:b0:424:895c:b84b with SMTP id 5b1f17b1804b1-4264b0cc4d0mr21803195e9.4.1720118168617;
        Thu, 04 Jul 2024 11:36:08 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264d6d41cesm18764715e9.16.2024.07.04.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:36:08 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:36:21 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 16/19] hw/arm/smmuv3: Handle translation faults
 according to SMMUPTWEventInfo
Message-ID: <20240704183621.GM1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-17-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-17-smostafa@google.com>
X-TUID: CZm0xOWMGcAL

On Mon, Jul 01, 2024 at 11:02:38AM +0000, Mostafa Saleh wrote:
> Previously, to check if faults are enabled, it was sufficient to check
> the current stage of translation and check the corresponding
> record_faults flag.
> 
> However, with nesting, it is possible for stage-1 (nested) translation
> to trigger a stage-2 fault, so we check SMMUPTWEventInfo as it would
> have the correct stage set from the page table walk.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 36eb6f514a..6c18dc0acf 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -34,9 +34,10 @@
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
>  
> -#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == SMMU_STAGE_1) ? \
> -                                 (cfg)->record_faults : \
> -                                 (cfg)->s2cfg.record_faults)
> +#define PTW_RECORD_FAULT(ptw_info, cfg) (((ptw_info).stage == SMMU_STAGE_1 && \
> +                                        (cfg)->record_faults) || \
> +                                        ((ptw_info).stage == SMMU_STAGE_2 && \
> +                                        (cfg)->s2cfg.record_faults))

I guess this could be simplified as "(info.stage == STAGE_1) ? s1cfg : s2cfg"
Anyway:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
> @@ -919,7 +920,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              event->u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_TRANSLATION;
>                  event->u.f_translation.addr = addr;
>                  event->u.f_translation.addr2 = ptw_info.addr;
> @@ -928,7 +929,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_ADDR_SIZE;
>                  event->u.f_addr_size.addr = addr;
>                  event->u.f_addr_size.addr2 = ptw_info.addr;
> @@ -937,7 +938,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_ACCESS;
>                  event->u.f_access.addr = addr;
>                  event->u.f_access.addr2 = ptw_info.addr;
> @@ -946,7 +947,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_PERMISSION;
>                  event->u.f_permission.addr = addr;
>                  event->u.f_permission.addr2 = ptw_info.addr;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
