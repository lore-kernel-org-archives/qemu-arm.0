Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp985101dlb;
        Wed, 17 Jul 2024 08:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0otWeMEjSH0109EClgHuicALlyL+P0w0L77UfjfSHtewRx1lF3UCI6IA/00zV50COBHyzqNf6+kueimDSX+THIg0JWd5p
X-Google-Smtp-Source: AGHT+IEB+Nnztv00MnBVkvV1oGWOy1Cq/fMZ2/tPJEPugRlW2CG+Q5dcJC0AlgDMlKDDHRw6oAbc
X-Received: by 2002:a05:622a:54e:b0:444:d08d:6202 with SMTP id d75a77b69052e-44f7ca1aabbmr86745521cf.12.1721230289416;
        Wed, 17 Jul 2024 08:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721230289; cv=none;
        d=google.com; s=arc-20160816;
        b=Obr3syPlMpQquF2KsX4IK1dvsPijbQuAvpcaArGUI4nQgPyY92TAKFyoYpNWaEX4si
         7xsOSyqGAGYiMhJlnp9Wr8xlt5jPS1w5fCD2RYnSulMqG1Sy5U1WReDiSWf/CKudBLUv
         G2eew7STgND4dO2vu/Rf5Wi7r6Yg6S1HqNs9t0oyKJqtdOVGBgMTpj8RK/tc5QgLkhS1
         rCk1rTkfVG81HdVSn39lydTCLlCJcI0S2kYlo3w3KDOsjYYerp9hUuJqJOz/4DZteJ42
         o3NQ7ooh2oCpd+kpH8pWOieDWuYVOiB194AELn8HJd0UM7Lhh2NsNQEG4cMal8+moW5n
         1fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=c4ZHdx1No2slFPya5wMVWYTJpX1xJhqZkiTzk46H+D0=;
        fh=Hpz/N+dwjYm8jR61gZocAilaKAnp2puDME2FDGUEsjQ=;
        b=gUqXVBQH+BDeh0SlBElH+veKQ+w6GZ0r2mnITKQ0h+p7hyEopxwqFwJPzthrKeCF3n
         0djlfFGUmqjCVfrtz7KiDzZP2oA3x+nHC1Db33++A/GZ5zfVXs0A/2yJdESBAD13UBZn
         ROTOsa2SLSgwZ6dAOYslR67HQ57AN+Y5N45zkotzPYVSQANU3lKWyAzC/bAWVS9l5D14
         0f7mlbHYf9ge9YU7U0jEH7aYOFJCfR82rUNWqrFRls0DLNdCAWu2lC3rUQRqz66oBkkA
         21NDdL6ebRMBZ36ryZnE+K6Xg1VqgTG0dfDzP8Iv1IkEHEbJbRKhLK/UNMCFBYgMlbOg
         AY6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xjp6W64+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-81e68f78a36si726853241.218.2024.07.17.08.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xjp6W64+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721230289;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4ZHdx1No2slFPya5wMVWYTJpX1xJhqZkiTzk46H+D0=;
	b=Xjp6W64+W7raulsq3M0zhnI6eypCNvDNXqXwLBo8nD5i+PhzNUO6UWql4LV6V0o5wucIli
	6ke0IVfgDCUiIcN/vOd78TTtqjd45ryg5dfgFtsd8ZF9u7ZuyvMVYWcZjYF30GFWtvRFVF
	Mi87oBr9sVFQO8FOhVrNtpNCqyYZDAg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-amzVjZ0TNgWDUG_79WU1ng-1; Wed, 17 Jul 2024 11:31:25 -0400
X-MC-Unique: amzVjZ0TNgWDUG_79WU1ng-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-79efed0e796so199410285a.1
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 08:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230285; x=1721835085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4ZHdx1No2slFPya5wMVWYTJpX1xJhqZkiTzk46H+D0=;
        b=kFkTwkVuVIE01K/CaEPUJUn4To8tJkp/AE5ohgGNhn5mFMoAFOuzKwpqewEYfUS2hf
         X846eP/c6kbqYjYqGIpBp1Wb7EQa449FMtYpyRmaUHzxmaV4Zwfzit3ecYqsLUwsr+5A
         X8Fi8D+vHW4kfxyqS3276So58ObXBzhwZEKGkZGUUIxk3mwVylapaoJbWw+KgRuwly/S
         cnIxJp55iQBXR22gfj6qNcR3Ajjyfi87/AVpt/mID1RHIf+2x7+AzlHJoVVsVmsuexFR
         6t/Gn2oi9o9gFIMX7wyG6X/AyW9o0nBrKYVehM0o/B/PzG7+aiAWZrMM2eSL17LZdbq4
         CpWA==
X-Forwarded-Encrypted: i=1; AJvYcCV+WAPfTPENt9cInqLBzeKPGQgznzk0MWxMLhTrIEjANdEfCcT4TFb5JazJ77gtNOdZuoifPVNczQ3npkh6DnNqqtfJHSam
X-Gm-Message-State: AOJu0YzddFR6VHDRcqHu3AtvglExh+C+R8kbsoEbNl2uQSqG3YQV9JgE
	Rm/cnuoy62UbPwtpgDVq+zVz32il8fJF9FKx/0lc6x0QrDZJhXk8SqlozDKagr9jezk6MH2C+bq
	pKvwSi/4iSAAllouvFXQCODEXO4XQMZLpYrndrGtwoDbe40xnFWOnVQ==
X-Received: by 2002:a05:620a:f03:b0:79d:7893:1cc with SMTP id af79cd13be357-7a18da82ce5mr2743285a.12.1721230285113;
        Wed, 17 Jul 2024 08:31:25 -0700 (PDT)
X-Received: by 2002:a05:620a:f03:b0:79d:7893:1cc with SMTP id af79cd13be357-7a18da82ce5mr2735185a.12.1721230284481;
        Wed, 17 Jul 2024 08:31:24 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160b92ba7sm414925685a.27.2024.07.17.08.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:31:24 -0700 (PDT)
Message-ID: <81699528-a000-4c0f-bd72-006bdb460f9b@redhat.com>
Date: Wed, 17 Jul 2024 17:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 16/18] hw/arm/smmuv3: Handle translation faults
 according to SMMUPTWEventInfo
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-17-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240715084519.1189624-17-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: KKfqs21seRg4



On 7/15/24 10:45, Mostafa Saleh wrote:
> Previously, to check if faults are enabled, it was sufficient to check
> the current stage of translation and check the corresponding
> record_faults flag.
>
> However, with nesting, it is possible for stage-1 (nested) translation
> to trigger a stage-2 fault, so we check SMMUPTWEventInfo as it would
> have the correct stage set from the page table walk.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 84cd314b33..d052a2ba24 100644
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
> @@ -933,7 +934,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              event->u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_TRANSLATION;
>                  event->u.f_translation.addr2 = ptw_info.addr;
>                  event->u.f_translation.class = class;
> @@ -941,7 +942,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_ADDR_SIZE;
>                  event->u.f_addr_size.addr2 = ptw_info.addr;
>                  event->u.f_addr_size.class = class;
> @@ -949,7 +950,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_ACCESS;
>                  event->u.f_access.addr2 = ptw_info.addr;
>                  event->u.f_access.class = class;
> @@ -957,7 +958,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (PTW_RECORD_FAULT(cfg)) {
> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>                  event->type = SMMU_EVT_F_PERMISSION;
>                  event->u.f_permission.addr2 = ptw_info.addr;
>                  event->u.f_permission.class = class;
