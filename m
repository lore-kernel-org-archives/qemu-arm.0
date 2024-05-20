Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1435678ejb;
        Mon, 20 May 2024 06:16:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtdWwAZg2n1CKKPq3JOLdVOcbBlDW7twfj+04TI7Wd/TwEay34XzSs/TFd2dxUaA0kPb7RWwToCo6TFp96wGfXAqu78tme
X-Google-Smtp-Source: AGHT+IGV5gYtxU0YkwYUON0FVx3KNK2MKm7zUXX0+AhC4poPlTDFEEtlaYMj4EX88rRHjNr4wfoM
X-Received: by 2002:a05:620a:2a0d:b0:792:914d:ccb7 with SMTP id af79cd13be357-792c75ac1abmr3478978085a.34.1716211006567;
        Mon, 20 May 2024 06:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716211006; cv=none;
        d=google.com; s=arc-20160816;
        b=0IPmV/a/5/13UJmN7TD0mNosKDeK3YG+4PKctQrkrUEzQ+GJvW3nnTqfacVvXJBPRX
         jK5rFrGEzLEABIOTzl9JR074ItMZtohROEBb/BlMl+ItoefUh7wZj1Ra0LAzc5h33524
         nQhP2cMXiDeTO+ZwMIMYuV/kWa4sZCDT6/XL1SQCg5RC213nNme0QVb7vAYmmO3zNm53
         fK2YDbZKiBRxjBOj4rzHQcAs4bakxmZAV04Iayd4ge0fxB4YKph1ZVF/T/kkzjOOceaj
         I+Kk1oOE+J6S/iL2H9ovwJZcWbSwHmlKCpTKTTHXh9aLbsU+nsBKLNz47XLDJjMwyeLI
         B7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=pVZkvusaM0CkwClRERHObKOMN2wWsmfdEdfvVwoQBIw=;
        fh=pDL7OyND9DWy3ruS5GFPDBhF6VkeCeorikS1dLlNTls=;
        b=p7enJ10y+epkeKjDGq/+BUJkgEPpL1Rt170PVHikpIr+kKm98FDFkr9w3bkNfcTU69
         MzxDgbYrD/VHIG6cvOXKsuscjV6VaaZ+B92eIGwlGG/h2T5JHhSvlSdS43dWa5dAx1R4
         VTpYK16cc0ets6+9oYwj8aaLI+Yg9DljoUCvOFejBpHxfbvYmHi3zjClG+VfdKJvGNcy
         sfZk/Celhyg1jhhr3jfH6eEXt9wlkzXCxXJAkDMs8hPPtam32m0NrYM9HHB4Rhi78BuO
         ayEovC/HKUe9lwm76MbI4vQXJIajjOTHNllaJyfCTy5T+yca4vPmZX6V6sR+pF+z4gVw
         E8iQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GvcoNz0E;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf33b07csi35168885a.404.2024.05.20.06.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GvcoNz0E;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716211006;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVZkvusaM0CkwClRERHObKOMN2wWsmfdEdfvVwoQBIw=;
	b=GvcoNz0EdgQ78hvhmq6i2lqFHQwHwaonaFzKogyasmS0CXXBbHq4dN8QwoSQrJ3LFeGUyA
	p+dy2iSoUSOH+fEqYUWGypXLhqY4TTTWEpF7dg5Spt8DNSVVHjf1VNp0M/SsA8j7B1RGyK
	Y9SHqWYKDh0/Z4PIjHfbK8umTNw5qFM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-TsZb_kx3ON6bMJGproB4ew-1; Mon, 20 May 2024 09:16:44 -0400
X-MC-Unique: TsZb_kx3ON6bMJGproB4ew-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59aedbd9a9so822270766b.0
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 06:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211003; x=1716815803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVZkvusaM0CkwClRERHObKOMN2wWsmfdEdfvVwoQBIw=;
        b=WAyWhYnUpq8fent79ASRpQ881rUQq5+pKzayP6Lj+kQpapIjeifpqI7iD8Wttbkqot
         HLI0M8fTG99wsqJQGEMg8nBhamiVStOTIfL9NwsB/O30/RYPPIcscXXdQPFu+mB5Gdix
         PVal392wjbLF5CSMBKMPZYEZryAGhninoQ6hPAZRgQ4tMT5rdbFBFNpIUtGghxowch6u
         BeF/W10e+gzaoZWbt3G1TFPYC263yf5LhpCeyD9Rghic1ZHH2a0POQTzhoL9dMspNPOI
         7LBWGMAGrZvVie/vW7MDGFLI3wXBLuTJBooNGgqc1wF99ezis0Oxz680+8KIdLx0SQlz
         EBXg==
X-Forwarded-Encrypted: i=1; AJvYcCV+5AR0ccmkIc0XFe9GJ7OMaGK1piZHIgkHgfNWdQPsv3VtzvlBa9wiYxLEgeTEWbwDEjsvCWGbSHV/fOOqmpkOjsJ+aZXZ
X-Gm-Message-State: AOJu0Yy13oLtW6q6zuET2u3WhZoPX4b5me4mYN5QssdJPEqr6e7IDCMK
	qkJxNfwDKEX8QhfyNWbKh1T+ZlmMh459uz1Or0nrBTXHvnULvDOMII1EYhy+vyhw5pp8DUoC+MJ
	5p5cVd257kiCdXCdYTaCs9qsUZzgWoDv55HBiyLritMCP0ASILtPXh/9ReHornA==
X-Received: by 2002:a17:906:b0c:b0:a59:b342:3ed5 with SMTP id a640c23a62f3a-a5a2d54d194mr1958214266b.15.1716211003087;
        Mon, 20 May 2024 06:16:43 -0700 (PDT)
X-Received: by 2002:a17:906:b0c:b0:a59:b342:3ed5 with SMTP id a640c23a62f3a-a5a2d54d194mr1958211066b.15.1716211002535;
        Mon, 20 May 2024 06:16:42 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm1452021366b.31.2024.05.20.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:16:42 -0700 (PDT)
Message-ID: <38005c2a-0e1d-4140-b046-8fbc82be7d8c@redhat.com>
Date: Mon, 20 May 2024 15:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 14/18] hw/arm/smmuv3: Support and advertise nesting
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-15-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-15-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: FWdoZdJgCm2p

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> Everything is in place, add the last missing bits:
> - Handle fault checking according to the actual PTW event and not the
>   the translation stage.
missing the "why". Can't it be moved in a separate patch?
> - Consolidate parsing of STE cfg and setting translation stage.
>
> Advertise nesting if stage requested is "nested".
I would move the introduction of the nested option in a separate patch
and in the associated commit msg properly document how the new option
shall be used.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 50 +++++++++++++++++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 96d07234fe..88f6473d33 100644
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
>  
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
> @@ -260,6 +261,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      /* Based on sys property, the stages supported in smmu will be advertised.*/
>      if (s->stage && !strcmp("2", s->stage)) {
>          s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
> +    } else if (s->stage && !strcmp("nested", s->stage)) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
>      } else {
>          s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
>      }
> @@ -422,8 +426,6 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
>  
>  static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
>  {
> -    cfg->stage = SMMU_STAGE_2;
> -
>      if (STE_S2AA64(ste) == 0x0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 AArch32 tables not supported\n");
> @@ -506,6 +508,27 @@ bad_ste:
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
> @@ -522,13 +545,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
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
> @@ -701,7 +720,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>  
>      /* we support only those at the moment */
>      cfg->aa64 = true;
> -    cfg->stage = SMMU_STAGE_1;
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
>      cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> @@ -901,7 +919,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              event->u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_TRANSLATION;
>                  event->u.f_translation.addr = addr;
>                  event->u.f_translation.addr2 = ptw_info.addr;
> @@ -910,7 +928,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_ADDR_SIZE;
>                  event->u.f_addr_size.addr = addr;
>                  event->u.f_addr_size.addr2 = ptw_info.addr;
> @@ -919,7 +937,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_ACCESS;
>                  event->u.f_access.addr = addr;
>                  event->u.f_access.addr2 = ptw_info.addr;
> @@ -928,7 +946,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_PERMISSION;
>                  event->u.f_permission.addr = addr;
>                  event->u.f_permission.addr2 = ptw_info.addr;
Thanks

Eric
