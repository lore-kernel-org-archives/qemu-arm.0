Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2122534ejb;
        Mon, 13 May 2024 04:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRvmixg+HLdCrhqCjEMVDWqaDvzYKLWjNMDkOevVIK/CclOzVyWkm/hiI8pN8+1PHVOclhiv0paQeBZztVgsdQN+va5Nnh
X-Google-Smtp-Source: AGHT+IHVCY8cTesSG2qiyMlxop1Q7jM/NBSYypzpVKXmFzyk7bTwZ9dDgqFfe8ySIWW+mQ4OTSTB
X-Received: by 2002:a05:6808:488:b0:3c9:934b:6cd2 with SMTP id 5614622812f47-3c99706d795mr10477766b6e.32.1715600881347;
        Mon, 13 May 2024 04:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715600881; cv=none;
        d=google.com; s=arc-20160816;
        b=OlBX3hgezN+M4qjfpRocHvl2UT/aSkYNMjGZWcRP0OYWJsZOdmZQFJT4WZ5UyGGIXE
         Ph2RWL4WHVwWLs/cOk9l5ArMF9i3FS7urn64UH8MfIRzMhkvU/rdYd5GIuE26Z8v0Pre
         /Wl0mYoS0flisLzRIMWOXI58b2ahhr/fDEY8aENOWZsKZbzTfgheZbcER2NF2ISNC8Ug
         /z0FoSWtKkmchyjTecUPj2UddYKKfkfK6Dz0aMELg0H4FsZH/GwfLpYY6xNZJ91fCubo
         sGrVVSZqh6ffHBfcKq/hj94WifV6D2P2urTUjmFyPrz1XWB5aX9kfqN7HwSy/XRKcSxe
         0FEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=cYI058oCZP5dRs8SiHki1bY0FtB7y7O7BEdWatNL1Fk=;
        fh=0kv3iRklIcy9pD1k6b5wzhOS8qJzeRpxb56XtcGByWM=;
        b=ExcUiGtUVeX5ffqooqsHTJcyZV+Tgj9Vp8GTo1aNicchnn6kbsW9kfy68NZiGwgcE0
         E5JAjEDCoxEuB9SSNO5Zzpmrnj3lLBlt484ciD6MbQKSgZBvSosGAKu8emISOf8jrULd
         GxU59vezzMLuTid8ijySaEyjTWggGi0ET/wGAo7Xtz0vk7cz8B4wF4z4T5+uUkUAsa0C
         O3dcSbZdiHavVsJFlhBVHzgFKNcS4duPwK+LSdMueLEESjfGuTzCvQhz+USmovwnl49r
         2TqXvXkcvthwLUpjyq3Nhkkm7LENzdC3PN7M3eoh61UrcVVxTYwqUV8QLT82VQsA7l9v
         lagQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNHbSELY;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf2778b4si992527985a.70.2024.05.13.04.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 04:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNHbSELY;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715600880;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYI058oCZP5dRs8SiHki1bY0FtB7y7O7BEdWatNL1Fk=;
	b=VNHbSELYIPUTHFVK5rOXv1dBaXRKfkGX5PRSs2OO+eQxqIboFEFF7F+8zxzIqMUmgeT2hq
	bF+z4su2MsBw2ujsJLh5ieKARYcxzY2YVWFsxO3E9EZ6ecElvJJFimWIks7Dx3TvUQaWu7
	h2c87nZGd74pCkD0XA6juEXqeagEvys=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-xSoI6lnbNsSy1XdyIia4Vw-1; Mon, 13 May 2024 07:47:49 -0400
X-MC-Unique: xSoI6lnbNsSy1XdyIia4Vw-1
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-4df237c3edaso3206727e0c.2
        for <alex.bennee@linaro.org>; Mon, 13 May 2024 04:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715600869; x=1716205669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYI058oCZP5dRs8SiHki1bY0FtB7y7O7BEdWatNL1Fk=;
        b=N0Cu9uEdUDD8+cryn+ZPQJiWOddPQHrQeOpqCzZnvYoY0Y6Y5iUXYj+FkLj6kHVXKY
         Fke6dHOREU08upXKCFygSlSJUgMJ71alNo47pMS6/Nkc/mqm+jvp9Z1nSSAsIzysaiWu
         nejdyQfxn5iEoClAd4W1DEkhISWX9GBcQhSheFT3uEjiZSESiTJre/rz8hpT9rnTTMot
         qRr+QATpmAuLFNnzmVrOueeWwilB1mE3mDSE2CLisDnLKLjYud8XGYZ6Ve7L4Zg8Ndrh
         YJUMB0mJG6HPagBcJGMTHvDFILJpC4ayrIdRw1uVlvL74MLn81Q2fziWT7FUzVrqC8cs
         djpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWETwoWTwQ53OoSWKumTh4w6hWGym1Ni2w12QVqgfuy3FeFzpcHe9ykrL3gZvX/2DHBPEayK3ZS7iPlYwzj6YQzBhSXKTR2
X-Gm-Message-State: AOJu0YyY2wgT95cj60vtAsezhHBn4o5Be7Cbvtjc/KBxbt6twyTTKRPg
	bHaAV+bC0B0E0HfTR+63H2TAB2IzFQ1C+ydGNLeqr7PS6Y9k6SCK1vv5d+vAFsiYODeIfsXs0p+
	codHNoxr1O+O5EtO6FHIKPAEKkkhY91ZKpnk0aU/IXaCw99DUKD9m0w==
X-Received: by 2002:a05:6122:1806:b0:4d3:b326:5ae8 with SMTP id 71dfb90a1353d-4df8838024emr7760797e0c.14.1715600869141;
        Mon, 13 May 2024 04:47:49 -0700 (PDT)
X-Received: by 2002:a05:6122:1806:b0:4d3:b326:5ae8 with SMTP id 71dfb90a1353d-4df8838024emr7760778e0c.14.1715600868706;
        Mon, 13 May 2024 04:47:48 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf310c16sm447321185a.114.2024.05.13.04.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:47:48 -0700 (PDT)
Message-ID: <4161c29f-411c-480e-abca-84e8963ce0ab@redhat.com>
Date: Mon, 13 May 2024 13:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 02/18] hw/arm/smmu: Fix IPA for stage-2 events
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-3-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-3-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YEv8Z2zc+MiS

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
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
CLASS == IN sounds a bit confusing here since the class value depends on
what is being translated and class is not handled in that patch.
>
> However, this was not implemented correctly, as for stage 2, we Qemu
s/we QEMU/ the code
> only sets the  S2 bit but not the IPA.
If this is a fix, please add the "Fixes:" tag and fixed commit sha1.
>
> This field has the same bits as FetchAddr in F_WALK_EABT which is
> populated correctly, so we don’t change that.
> The population of this field should be done from the walker as the IPA address
s/population/setting? I am not a native english speaker though
> wouldn't be known in case of nesting.
>
> For stage 1, the spec says:
>   If fault occurs at stage 1, S2 == 0 and:
>   CLASS == IN, IPA is UNKNOWN.
>
> So, no need to set it to for stage 1, as ptw_info is initialised by zero in
> smmuv3_translate().
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
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
>
After taking into account above comments,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
