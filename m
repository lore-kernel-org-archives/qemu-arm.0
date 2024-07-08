Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2801600njb;
        Mon, 8 Jul 2024 09:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ7ooD47ad+IfeflZ9wZx9nhtQIcMksedauYLujnkiSYNClYBDZ3CZdm5I96Dbj6FLAZRENqQIaoAo1F6Ew9/IKfKL4OlT
X-Google-Smtp-Source: AGHT+IEWXaunEdbkCtYSf20k20sn4DxT+VmnqAQGfnmt7n82PTgyjtVXXu6l0SkH7t3TEj/aBkCq
X-Received: by 2002:ad4:5c68:0:b0:6b5:d9ef:d576 with SMTP id 6a1803df08f44-6b61bc80440mr2975356d6.12.1720457506455;
        Mon, 08 Jul 2024 09:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720457506; cv=none;
        d=google.com; s=arc-20160816;
        b=FrrJYdaQNEP0D/GV5uqnebtk3luizbMcuIhoOyftklUkgjPWYUS11tWHXZPhAZ91M5
         XTT1FHEwm/9ODKHxYZu4qV5/yIgAhg6C7uYeacWQShLAGqFmiEJiY/a2neAuevq3r9u7
         ktE06qdh4VhgkVkz9kyuOOlgjPeCwdT6T4Wg8Vl2UbI619C2BDzkt0mABCYSYe1fZ7gF
         RqinNujtpEPahNxyit7Ij6ViNx59huxGETwSYrNJPFOPmfgdhsldqW1jF2A9Zhz65wpx
         fgoSAmOKfwSy8ZqQR5pWVer14P8R993FzgCr1Tc4bzvoE3oUfCZRK4jiBNjO9ZCxLMkA
         e2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HSnd0i7P0nG6+oAmjYKaVL2/5qRtYO1496V8NqLX0b4=;
        fh=dkus1YikTGMkouNkiGEc2NP8dwjsQBvlH7wczvbC4hw=;
        b=w+mXhYkEtD3/rrmZbQwzo3oadhc18bF+CK1fEwZHzJRn9RrzxcAf7zgggTuDD1B0ri
         afMIYgo8HUCVsGeakgyj27BLPlIJQ7eaLbApAcNPYr+31kHZt38MfLut/CPRN0EI+Lo2
         TNqj9Y13Q06kAF3SdNfg6KrfBmcV1JuFzhkyOBz3ahEdNvQ9w7UeHRGDdPZczoUPV5pY
         Sbh8ihe29LCuAXThrdpCluYFjIknhphFg+ysoLRIBPlcSIS3rzqLTJ6TVNe5RiQdTYJl
         eBQ/81n0biENBqC20nCWFkQ6rtvocMaEw4MHuUg+ck/IZZiLEOmSY1fBcSZsb06lmhM8
         6BNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KTatiPGO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba8fa5fsi2737506d6.212.2024.07.08.09.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KTatiPGO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720457506;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSnd0i7P0nG6+oAmjYKaVL2/5qRtYO1496V8NqLX0b4=;
	b=KTatiPGOayIARhR72Dtlu0mc7KtRfsl/Vcbz/MaU5BKf6l9huup4p+b/+qspG+fU5DQMOO
	FXB+/2E2bw9slPETI5kNihZwDAk2qQgJQB1jVA9qwqkDE5bihzovVch69I+Y1JBzQAU9vH
	BeRV/kJoR9FzqTdfmcMQmJmkgSgzf0U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-vmrR06w1Owy915PChguAYA-1; Mon, 08 Jul 2024 12:51:44 -0400
X-MC-Unique: vmrR06w1Owy915PChguAYA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36789dfcc8bso2636014f8f.3
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 09:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720457503; x=1721062303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSnd0i7P0nG6+oAmjYKaVL2/5qRtYO1496V8NqLX0b4=;
        b=ca8114kY5nqzmAYmHFEe71J2bokrnujaPgjh7nvuZEQNj66idIuK/I4qy2EDe9GMgh
         x5l9GkRj0zKDOegQWcneBMVWIlGi1ZKarK1+Ei0bKJTk2tR0yjhGYrK/dgHZuAo8msr0
         Stj/UZRN/56LYrVJWhHEo2kT8mVBJbWw7sz6mxmrvUv6T907r9+jtWLZUlY9syrYkyZ2
         gP9zSO8wwDux/BFeOarZQkAgCSbkirEUhfJi0zIVM0BKSDqEkFdbmuluHEQklAaYyM86
         VsPprZ8h2MBh2ajit77He2ouAq0b3GSFwizskK5revL3tH99BRKokP68pKJUzKRrLHTq
         OJhw==
X-Forwarded-Encrypted: i=1; AJvYcCV/EKr6JTsZXbLBAasPaaCpOap5cMGoCAgdH+I3yps7L6fA2xV6Asyp4/4nenqA7yM13XtFMKqZDcy/3f33Kf/0gjQBvTCg
X-Gm-Message-State: AOJu0Yx2f0fsTVcYK9KbciRV8654aFjhyAvG3zPAQIf6ZiOVvU9QqiH0
	EOABJVy7H/5T/LdIAUAO8fOx2mxQj2RkGlJ8rnagg0nvdHm04plk5lxFBl0/VMtSl59v7OEJfHD
	3VmH28QQWtwB8Cpx7PM4usEvKI4lgL48AzPgXXmDdVUMBEjt0B2BgUA==
X-Received: by 2002:a5d:5847:0:b0:367:9614:fb99 with SMTP id ffacd0b85a97d-367cea46a4emr169243f8f.10.1720457503630;
        Mon, 08 Jul 2024 09:51:43 -0700 (PDT)
X-Received: by 2002:a5d:5847:0:b0:367:9614:fb99 with SMTP id ffacd0b85a97d-367cea46a4emr169223f8f.10.1720457503274;
        Mon, 08 Jul 2024 09:51:43 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab199sm241520f8f.106.2024.07.08.09.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:51:42 -0700 (PDT)
Message-ID: <69fb7fb2-52fc-4d03-bfd6-deb2a254f081@redhat.com>
Date: Mon, 8 Jul 2024 18:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 17/19] hw/arm/smmuv3: Support and advertise nesting
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-18-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240701110241.2005222-18-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: AWyA3y+cq9PD

Hi Mostafa,

On 7/1/24 13:02, Mostafa Saleh wrote:
> Everything is in place, consolidate parsing of STE cfg and setting
> translation stage.
>
> Advertise nesting if stage requested is "nested".
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
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
