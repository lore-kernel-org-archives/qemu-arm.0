Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2790788njb;
        Mon, 8 Jul 2024 09:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp8OOwmotHfOgEvCyNhTDA67ogGvPE0HAV1c9HvIwkzts8hmIQL867ZUeyjyig8WDGMKGrgLDQ7QJo3eWWvocOIm3uDr//
X-Google-Smtp-Source: AGHT+IHKpu7aeRLuHZpEiylm6FIWlQYWonHezMcBKQBp4jzmDWgiJxTlEfi2PacoWrO8qN01KDKm
X-Received: by 2002:a05:620a:1926:b0:79f:706:b46a with SMTP id af79cd13be357-79f19a1f248mr7037685a.29.1720456254480;
        Mon, 08 Jul 2024 09:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720456254; cv=none;
        d=google.com; s=arc-20160816;
        b=KYsCTsnfTXYksmds1zXmrA+uBRG5f3kwIfh7zo56b2Ah7a0QhPf/CInE9F2WHvPVtg
         v1uWASAUlAoIt3eTeN/tBfR6TWbLbMHDicpc5baDQblC5Hje8xxSTwML6k/E7mDmwkSj
         yR/LyN0Y3xB+zBDZOQuuMhqsHa808eHrqGMkjnb4B/doaPvowrkuF+CnkQs1nPnj33SA
         rj8mrpRmY+dKCcGvO8obSXifdWtmj+yfmlMK7/kpE31yJUb6uiFDJN/FP1OCZBVflJEp
         bjaTbX6wEubK4oMYnY2PfxfO6EAXm+S1fKj0N2dcX+JvbG/7rYo/X1fRzcQvHxPy3s+h
         m3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HjGbYZ9SL0+r3c1nWTC603usckRgPGn71L4n803ns+c=;
        fh=a7M7f3GAYnxMMtkUaaI+JXs6HyTA3CDiqSgwF4CeJi8=;
        b=x0UT/JUnEeV9hB3QplSBLYrYkuUrANtQ6WEjcOyGW/Zw3iAJonrqKAlMEbKKZzPpTS
         cSM0DCTZnI3ci+aZXcUZrN8zwEd4QigjdIFNGUxXLqGPp2Czr0nkGny6/Xl0SkD1yejt
         vxyxw0d9qe56KPNUW930cC6YukPeB/qs6us7Gl+o9ZNLgXEhdTevyedhZ9qCAcsE4JJT
         jBMv/eoFQw0a2UpLgKGjSn/e0d9BAHYcn01gvyFn9+a9CWufnZzpGNazOdVdKA4pFltE
         b7A25Pt/d4EhIxG8mqzoEZ5qrc+fTKr8yKQiFr40b04sFF9/zU89uuxuMs7Uyue4qfSt
         mDWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EuTjaqp/";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-79f1909f152si14487785a.374.2024.07.08.09.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EuTjaqp/";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720456254;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HjGbYZ9SL0+r3c1nWTC603usckRgPGn71L4n803ns+c=;
	b=EuTjaqp/CihJo0Frp1capR/IazolzrQRcypQSL+jPiREpgtO6EPY/ZcqgQ/zUq6aozzaH8
	gbWQmAp/Hg4P1Ku1+prspIdaaFZnQm7icg6oyR7/sZ4H4Xmc93+47TFE+gL/JSOop9KdJQ
	MD+4MtZ2F7nHpxeQTIwDzytJtHWg5qM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-q1WV7ruzNhqmNI1kwmNnuA-1; Mon, 08 Jul 2024 12:30:52 -0400
X-MC-Unique: q1WV7ruzNhqmNI1kwmNnuA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3678ff75122so2966169f8f.0
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 09:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720456251; x=1721061051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjGbYZ9SL0+r3c1nWTC603usckRgPGn71L4n803ns+c=;
        b=uuHyOOFc9ypfAMDrxu2pd6Abgw1jgBDsKmwemR/h7CgTpikVyim6X8KkEOFLe7uVeG
         jE1o2Epjc9pnblKd24SaP8FQUqGkRL1JuBbnwD/hbDSki9vMXxqhCk0m5quzCBm5weWj
         dVxq6+XMET9aWyMhGbktKRo3MtFxDxiAYXhQwXvWohvBxycHgdAd9fg9x42Bx60HXJsP
         ynUWU05gx9y384pqZVOslXCnt41vp2a0XToMAfK8mlvNiCuFMtz00ffynaKsub+X6fzj
         XQMPORfIHcyguQ8r9MCHh6ZR51cNt3Liv2EyJWegPCRTg3AKrCyp/ISJdW3+7pomMwlq
         kA5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqtLRmulFwgunPYnMQFk8ZSS3xig4Mf6Frhr/xBvNqiME8ZNzKTJP08ffgA4EIdWYeTjjSGMlx6gWQ4L/xSh0dHHfye31L
X-Gm-Message-State: AOJu0Yxl9QxDQJ/75GgzD6e7PdNBvSvJ3osA+Lat2IGRsrdwhNpy0w2T
	081cdCsHxNxLlhmSz77UftU7aAZWvw5Ape5h492N6YTt3TqaGZlNf3bSAZLAb/C336VsptGunZm
	VOQRdHXHexVpKNt+fVzAkwKuBFWKtK9npr01Gp7IoOZ7hUVWn1oo1Xg==
X-Received: by 2002:a5d:5552:0:b0:367:4354:52c2 with SMTP id ffacd0b85a97d-367cea6b825mr93344f8f.22.1720456251619;
        Mon, 08 Jul 2024 09:30:51 -0700 (PDT)
X-Received: by 2002:a5d:5552:0:b0:367:4354:52c2 with SMTP id ffacd0b85a97d-367cea6b825mr93325f8f.22.1720456251238;
        Mon, 08 Jul 2024 09:30:51 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df53sm215934f8f.14.2024.07.08.09.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:30:50 -0700 (PDT)
Message-ID: <4cc94a1f-4328-4bec-aa66-fc2d88701a16@redhat.com>
Date: Mon, 8 Jul 2024 18:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 16/19] hw/arm/smmuv3: Handle translation faults
 according to SMMUPTWEventInfo
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, julien@xen.org,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-17-smostafa@google.com>
 <20240704183621.GM1693268@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240704183621.GM1693268@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: cfmLpt0RR/M3



On 7/4/24 20:36, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:38AM +0000, Mostafa Saleh wrote:
>> Previously, to check if faults are enabled, it was sufficient to check
>> the current stage of translation and check the corresponding
>> record_faults flag.
>>
>> However, with nesting, it is possible for stage-1 (nested) translation
>> to trigger a stage-2 fault, so we check SMMUPTWEventInfo as it would
>> have the correct stage set from the page table walk.
>>
>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>> ---
>>  hw/arm/smmuv3.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 36eb6f514a..6c18dc0acf 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -34,9 +34,10 @@
>>  #include "smmuv3-internal.h"
>>  #include "smmu-internal.h"
>>  
>> -#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == SMMU_STAGE_1) ? \
>> -                                 (cfg)->record_faults : \
>> -                                 (cfg)->s2cfg.record_faults)
>> +#define PTW_RECORD_FAULT(ptw_info, cfg) (((ptw_info).stage == SMMU_STAGE_1 && \
>> +                                        (cfg)->record_faults) || \
>> +                                        ((ptw_info).stage == SMMU_STAGE_2 && \
>> +                                        (cfg)->s2cfg.record_faults))
> I guess this could be simplified as "(info.stage == STAGE_1) ? s1cfg : s2cfg"
> Anyway:
>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
>>  
>>  /**
>>   * smmuv3_trigger_irq - pulse @irq if enabled and update
>> @@ -919,7 +920,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>>              event->u.f_walk_eabt.addr2 = ptw_info.addr;
>>              break;
>>          case SMMU_PTW_ERR_TRANSLATION:
>> -            if (PTW_RECORD_FAULT(cfg)) {
>> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>>                  event->type = SMMU_EVT_F_TRANSLATION;
>>                  event->u.f_translation.addr = addr;
>>                  event->u.f_translation.addr2 = ptw_info.addr;
>> @@ -928,7 +929,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>>              }
>>              break;
>>          case SMMU_PTW_ERR_ADDR_SIZE:
>> -            if (PTW_RECORD_FAULT(cfg)) {
>> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>>                  event->type = SMMU_EVT_F_ADDR_SIZE;
>>                  event->u.f_addr_size.addr = addr;
>>                  event->u.f_addr_size.addr2 = ptw_info.addr;
>> @@ -937,7 +938,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>>              }
>>              break;
>>          case SMMU_PTW_ERR_ACCESS:
>> -            if (PTW_RECORD_FAULT(cfg)) {
>> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>>                  event->type = SMMU_EVT_F_ACCESS;
>>                  event->u.f_access.addr = addr;
>>                  event->u.f_access.addr2 = ptw_info.addr;
>> @@ -946,7 +947,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>>              }
>>              break;
>>          case SMMU_PTW_ERR_PERMISSION:
>> -            if (PTW_RECORD_FAULT(cfg)) {
>> +            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
>>                  event->type = SMMU_EVT_F_PERMISSION;
>>                  event->u.f_permission.addr = addr;
>>                  event->u.f_permission.addr2 = ptw_info.addr;
>> -- 
>> 2.45.2.803.g4e1b14247a-goog
>>
