Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp786451njb;
        Thu, 4 Jul 2024 11:36:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlCi71Hd2cF/WPPVxb4OoZ3D7TruCtfF0xBSLplePY39pdpmehUIEIB+W6K3nj5pXrzgIPxjsN0TxmgsTPJKVHPtkd/ZLI
X-Received: by 2002:a05:6000:1b86:b0:367:900c:c098 with SMTP id ffacd0b85a97d-3679dd31a6emr2008237f8f.39.1720118186280;
        Thu, 04 Jul 2024 11:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720118186; cv=none;
        d=google.com; s=arc-20160816;
        b=fOHV75L6YRxMnjJbv1rSMiAABrz+smEcjJwQm74BGP7i4PnB05squJYvNqQydx6nNV
         AH25mCfbfEIX/DCGFOEP/1Y7YH5IK7pdqDGIAxxZlNj8VZuWClravns9iXP6lPv/7n5T
         5HHqwPPTftScBAOjDldjyLUEINrrmCS4hl+u0sN1dz2rlms+7MYWDKiiP8CmWt36ZXSP
         OUtng+0a+6ROI14Ye35IapssuKBIoLU3m02Cu7XsfOMDoI0NRYR2H13h2YC5LRbDgAmz
         F8VcQgBIdENeY/LWJn5TLWw0jg/U8PtC69mTfqtWX10BXVtzUm7F592HaFFj3DYQK5Qa
         NJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jtchTFG44Pvi0xc80JWiSIr27cVk869TIYOe8ewITfk=;
        fh=0XBuwYq1PT9fWDcLlt2NzFI4xYmgZKhdWCFD7/S16Zc=;
        b=LWs5xtaP8+SVOPFIukTh6r+nyevexC2Z3kbRWedP6YDinWdLL2eMwz0OHJYFuzMAuJ
         r9e33bqhpxZw3S5/hMGyu9Mv2JRmrAq+EX0eF5sdVxnOhmILr6WLoMYUjDAkhsyF4HBQ
         AkysWlAE22hOr5HP3bgHw+jQsJvVMmQUEIvkmNSNeg6WE9hwxtbqCOEnlaRlAzMjx6Ef
         HlIlnWupT3I/dPaI24yfP+6qsoADYZO/8Hh16Iwyv5XT+h4uWcflDeiPXkaByXZN+NON
         irLK7muuGklPY0eQHzZnsZxJBJqnMtVffePx+7tIOqDEcV7XQoOYS8jrhGcROmj3b1E4
         thaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8AAMskQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3674356141esor5905048f8f.2.2024.07.04.11.36.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8AAMskQ;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720118186; x=1720722986; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtchTFG44Pvi0xc80JWiSIr27cVk869TIYOe8ewITfk=;
        b=V8AAMskQ2VjG4L/54FrwtZmHaGibDBkb4Mfm/d1aw283g2XontJzi8O4EKReAz9XaV
         irBfHvnx0D5QBbFTUR7ekxMO8IutO6vVPpmHXm9E8OLZ0KHkvDgLUwqHox2jCdPP5j+3
         byl0ncVR12+S8Sd8BdSuyXuHj++AwGvVjIDuOOJRNmDRt+3mQznmhCWr+4dj9cUR0+5H
         YqpN6pHxxW6xF3waZSiygc7z7bq0rnSfJc0H9wFniDKJAdDHKyBZJ7NtbTX0ib1bR4KJ
         oIBWzSPV+aNQzSzJnGVke4L67YerpjLkhJ1++bEAgKKnQXW+dPh/UqSQ6FoMd3sALMIH
         8NtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118186; x=1720722986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtchTFG44Pvi0xc80JWiSIr27cVk869TIYOe8ewITfk=;
        b=UVGhA0j4ng2oAJSFHtP7xa9YJiu5vhyPrzGIpttWKQYD4Ll4jUmB30LrdZX2lGgD2k
         C3bc7Znjxt5w8CTPmZG8DDYb5WpfHpSSegf7x/8F77sBmQUW4gLHNWUSFkg6boA9YXUJ
         KIQFSza1Mx5eLTj+ztaGepXtuQwiTbE+Rdl6/QBnIOWZO92J1z4qXCH1rD8uAPELyoA9
         nSxWExljDG/XqMq8TseNEINgbPucSX0tH8+IYtpZ5FeMH/3Org4CTkrsMo/uyGd3E1MJ
         1gb8OklWOUjFX2oOLlniGpv5DfyB7NcogFbzoVK524kAvHIow5GM1NFql31UrORODhkD
         7bGw==
X-Forwarded-Encrypted: i=1; AJvYcCUXATwTU9Zr4szSMeFcjniGKxgQ0blNBxKeMD2n+ZqOVinEvnksM7dXypPml8l7j7iToWIlwPagAcdFSAIywc/9F4HnIeqO
X-Gm-Message-State: AOJu0YyGKcSZl2P16VjlySqKFHmUR8cqiRGbDuwfNbQgyzkBWfbrE0rd
	JQXhN3/ixW81Nz35FxhC4F3fJFXX5wtLTxnhDCNiPDNNPWOwyUjn9mLfys0zNlQ4sw==
X-Google-Smtp-Source: AGHT+IFjppCCHp9hGEa/evewe8nL2nya5EaB6eXY4LPE+mw35bR99F6MN/2QN4lwO5FRk5PBuzUMig==
X-Received: by 2002:a5d:4207:0:b0:367:9cd5:c608 with SMTP id ffacd0b85a97d-3679dd31836mr2020532f8f.36.1720118185853;
        Thu, 04 Jul 2024 11:36:25 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367900fd1e5sm5669181f8f.63.2024.07.04.11.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:36:25 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:36:38 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 17/19] hw/arm/smmuv3: Support and advertise nesting
Message-ID: <20240704183638.GN1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-18-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-18-smostafa@google.com>
X-TUID: pYFtXtYignqZ

On Mon, Jul 01, 2024 at 11:02:39AM +0000, Mostafa Saleh wrote:
> Everything is in place, consolidate parsing of STE cfg and setting
> translation stage.
> 
> Advertise nesting if stage requested is "nested".
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/arm/smmuv3.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 6c18dc0acf..807f26f2da 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -261,6 +261,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      /* Based on sys property, the stages supported in smmu will be advertised.*/
>      if (s->stage && !strcmp("2", s->stage)) {
>          s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
> +    } else if (s->stage && !strcmp("nested", s->stage)) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
>      } else {
>          s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
>      }
> @@ -425,8 +428,6 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
>  
>  static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
>  {
> -    cfg->stage = SMMU_STAGE_2;
> -
>      if (STE_S2AA64(ste) == 0x0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 AArch32 tables not supported\n");
> @@ -509,6 +510,27 @@ bad_ste:
>      return -EINVAL;
>  }
>  
> +static void decode_ste_config(SMMUTransCfg *cfg, uint32_t config)
> +{
> +
> +    if (STE_CFG_ABORT(config)) {
> +        cfg->aborted = true;
> +        return;
> +    }
> +    if (STE_CFG_BYPASS(config)) {
> +        cfg->bypassed = true;
> +        return;
> +    }
> +
> +    if (STE_CFG_S1_ENABLED(config)) {
> +        cfg->stage = SMMU_STAGE_1;
> +    }
> +
> +    if (STE_CFG_S2_ENABLED(config)) {
> +        cfg->stage |= SMMU_STAGE_2;
> +    }
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
> @@ -525,13 +547,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>  
>      config = STE_CONFIG(ste);
>  
> -    if (STE_CFG_ABORT(config)) {
> -        cfg->aborted = true;
> -        return 0;
> -    }
> +    decode_ste_config(cfg, config);
>  
> -    if (STE_CFG_BYPASS(config)) {
> -        cfg->bypassed = true;
> +    if (cfg->aborted || cfg->bypassed) {
>          return 0;
>      }
>  
> @@ -704,7 +722,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>  
>      /* we support only those at the moment */
>      cfg->aa64 = true;
> -    cfg->stage = SMMU_STAGE_1;
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
>      cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
