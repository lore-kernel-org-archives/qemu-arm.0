Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp766561njb;
        Thu, 4 Jul 2024 10:56:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDb4ThlXK5QrP8k+6nAm0o/sS/cLtq6AoOFDLjPkjMlYvrnw1+CK+Wr9v3pzMN40qEQyOGl3EH5ITbYTLxeVzVlkWN8tnf
X-Received: by 2002:a05:600c:15d4:b0:425:633d:926a with SMTP id 5b1f17b1804b1-4264a3e8b60mr17174715e9.21.1720115799921;
        Thu, 04 Jul 2024 10:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720115799; cv=none;
        d=google.com; s=arc-20160816;
        b=mOHVsVQRjDBqA4JiHBo6D10VqIwS9NL/WWN7ZYuS8VG00hgBcIwCTzz5sLWdx3VjGl
         zonXx/Kz/9d1YvrOknB1rdeKLvPSQTj65Tt4x4n2CveJNWpPQqM1GFJzDO9UbCZxY1eF
         C8mvkjX0a7N9+60PmxOHAOQMAFJ7e1NR7W74dsY+C9kpvj8LfMaM4MoMPkGsIOqOtf1t
         4YDFdVyjPeUYEkJUg+bCXFeG+1C3O2dpydFIcNjjSTvo5jR0EfLBDCobFy36kk0dWvqk
         9eimmhrnEVyw8DHSAAkmrGlXnpD0MKuDSHZhONRymmWQBM7yvAKcBCS2KVWI/T1b6oIc
         JaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2uba2BfP6iG9Wk4uJoNKMxlW7ISWFqPZV3/BU965vT0=;
        fh=i1gM9J9YEmzFqVn4Ii7wd1WurzRgmbGQkJRky4AP8Ew=;
        b=AJxHRFg+5VqrMgzaGesUpXAFngqpW/mxN3FM3eIBFwmdsow6MmMu8v4GnJiXBJziHe
         QSCVwc9JcXUjsVOoeTVz4gGg10SuRqfeRyMwXgr0x+E+yGoMzSGGai8Jf7RgSPpFQhec
         W+0Z8J5t9GrV0/gVCRyGB91Fdcq3lhcrDkxwLw6FZvaiOzJI4XreUumRnh/I8BkLDbk/
         bxvNF2Q6IMOl05L1Q3Ig33WT1Xi+VZ3TD9CwLf6kM0Qas4qP6nG4/XyNFOQYWkx6nqZl
         cxzB1CkLzhvUD0s4SBGOC+2FXEMeEQCfPZl2d3Y/t0rfC3IqWMihOrOHUxN0YDphgh1s
         wRtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9yT9CU9;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3679979c526sor631831f8f.7.2024.07.04.10.56.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 10:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9yT9CU9;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720115799; x=1720720599; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2uba2BfP6iG9Wk4uJoNKMxlW7ISWFqPZV3/BU965vT0=;
        b=i9yT9CU9RJQGzyctKGrcQNfardG3i+l/Uc7UMDmQho/99oD0kZKlFB+SIzoM6LTIds
         CzaWVa/wBj8lMojLJ2M7vf8mSHtlkoRwcwo3EtvtahUc/3+nPjLnKYSofiDfurpNK9bh
         /en6/B2L2qzwWCwik7zca4A78Q16k5415v+1bKCLpmfjfZ36Q8FvKCoKYVShFPX600xJ
         lghnkYYdJMsUS5OS723+HtvQRXsLnCC50xf9yE5zB8W9LSrrpBRrEqW4NrD6CHfa6PXg
         AQTzu4fuzPegpBWl245zVNRz7JnviOabBNkQ+wMHie0Kr3mzB2bCY8kzfjmJ54v2R3q3
         hOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115799; x=1720720599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uba2BfP6iG9Wk4uJoNKMxlW7ISWFqPZV3/BU965vT0=;
        b=kkNm5w/vjDjQNgfeJ1JH8EXPJd6WOUIpbebdyoNLREeRT0CBoh2Jz3t4zPSwmGaLNn
         88RVSXRNS22qqSEnYsYJEcp8YDjEiMsHJwAwB33Rqm3Ui318LtXsFIVyFFQfC/gNl+iK
         zB1VyQucVY4g66d9E9COE4YiMCpNPZvGUsmhGIBkwROEqFxzk00S00dZuiy3rqhsJm0s
         4p9TdO8ox6qSvhTj16eclXxX8/RGtSDUrYiNOOa/oaqjzS+y7jtuyhYNsc885PGec2vT
         ePnC+rJvXApm/y/MNV8ENXhkoXArbgbLKkA3cc+O5/kV5vmLuGaByl6A6kOwKLqD9Ef0
         YyxA==
X-Forwarded-Encrypted: i=1; AJvYcCUnntOVOib+A5tP8dldi8WhC/ZRJCAZHADKWt127pEFNN88l2WFtnoPOVsM918uFyhsFXoul8OnJzVT4hjB2j+hku+5xKq4
X-Gm-Message-State: AOJu0Yyxghp94YpOAZCqNvG8dCUWZExLElVxko8fPt7tYl+yhjh6BCuq
	K8yizJjI2JGOTdMky0tslpfugvCcXXcC3JnMCuC/QQvlEFc2i/pEoaRDi+FpxazsYQ==
X-Google-Smtp-Source: AGHT+IHcRdCgPrf2lHbhNyGyyCy6bgp35UfJI3iUUWMUnCljydY+Ok/dxEQ/+xpFau3KpMXCYCZ57Q==
X-Received: by 2002:adf:fa04:0:b0:367:9b8a:b76b with SMTP id ffacd0b85a97d-3679dd80341mr1745075f8f.57.1720115799361;
        Thu, 04 Jul 2024 10:56:39 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm7194768f8f.104.2024.07.04.10.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:56:39 -0700 (PDT)
Date: Thu, 4 Jul 2024 18:56:52 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 02/19] hw/arm/smmu: Fix IPA for stage-2 events
Message-ID: <20240704175652.GB1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701110241.2005222-3-smostafa@google.com>
X-TUID: 3okXHZ38rt8k

On Mon, Jul 01, 2024 at 11:02:24AM +0000, Mostafa Saleh wrote:
> For the following events (ARM IHI 0070 F.b - 7.3 Event records):
> - F_TRANSLATION
> - F_ACCESS
> - F_PERMISSION
> - F_ADDR_SIZE
> 
> If fault occurs at stage 2, S2 == 1 and:
>   - If translating an IPA for a transaction (whether by input to
>     stage 2-only configuration, or after successful stage 1 translation),
>     CLASS == IN, and IPA is provided.
> 
> At the moment only CLASS == IN is used which indicates input
> translation.
> 
> However, this was not implemented correctly, as for stage 2, the code
> only sets the  S2 bit but not the IPA.
> 
> This field has the same bits as FetchAddr in F_WALK_EABT which is
> populated correctly, so we don’t change that.
> The setting of this field should be done from the walker as the IPA address
> wouldn't be known in case of nesting.
> 
> For stage 1, the spec says:
>   If fault occurs at stage 1, S2 == 0 and:
>   CLASS == IN, IPA is UNKNOWN.
> 
> So, no need to set it to for stage 1, as ptw_info is initialised by zero in
> smmuv3_translate().
> 
> Fixes: e703f7076a “hw/arm/smmuv3: Add page table walk for stage-2”
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/arm/smmu-common.c | 10 ++++++----
>  hw/arm/smmuv3.c      |  4 ++++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index eb2356bc35..8a8c718e6b 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -448,7 +448,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>       */
>      if (ipa >= (1ULL << inputsize)) {
>          info->type = SMMU_PTW_ERR_TRANSLATION;
> -        goto error;
> +        goto error_ipa;
>      }
>  
>      while (level < VMSA_LEVELS) {
> @@ -494,13 +494,13 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>           */
>          if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
>              info->type = SMMU_PTW_ERR_ACCESS;
> -            goto error;
> +            goto error_ipa;
>          }
>  
>          s2ap = PTE_AP(pte);
>          if (is_permission_fault_s2(s2ap, perm)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
> -            goto error;
> +            goto error_ipa;
>          }
>  
>          /*
> @@ -509,7 +509,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>           */
>          if (gpa >= (1ULL << cfg->s2cfg.eff_ps)) {
>              info->type = SMMU_PTW_ERR_ADDR_SIZE;
> -            goto error;
> +            goto error_ipa;
>          }
>  
>          tlbe->entry.translated_addr = gpa;
> @@ -522,6 +522,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>      }
>      info->type = SMMU_PTW_ERR_TRANSLATION;
>  
> +error_ipa:
> +    info->addr = ipa;
>  error:
>      info->stage = 2;
>      tlbe->entry.perm = IOMMU_NONE;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2d1e0d55ec..9dd3ea48e4 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -949,6 +949,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
> +                event.u.f_translation.addr2 = ptw_info.addr;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
> @@ -956,6 +957,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
> +                event.u.f_addr_size.addr2 = ptw_info.addr;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
> @@ -963,6 +965,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
> +                event.u.f_access.addr2 = ptw_info.addr;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
> @@ -970,6 +973,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
> +                event.u.f_permission.addr2 = ptw_info.addr;
>                  event.u.f_permission.rnw = flag & 0x1;
>              }
>              break;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
