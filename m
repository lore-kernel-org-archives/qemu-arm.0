Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1352342ejb;
        Mon, 20 May 2024 03:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyFvXqSKhoHV+4BzHZuKE+hG4WYKuFOZkKgb1rbs6jpbsSYwesec0xZYgZJIB2ISNDqYAIzrQfbeAYkdJSx0O9u8dPBZbB
X-Google-Smtp-Source: AGHT+IGHeaqtulObrwUnCpn/9UbnfKqmJ6octnla+tIIrFlkKR2jSo427S7OEUWCErE+O4tpQpkZ
X-Received: by 2002:a05:6214:5509:b0:6aa:9287:b2e3 with SMTP id 6a1803df08f44-6aa9287b535mr34873326d6.3.1716201484573;
        Mon, 20 May 2024 03:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716201484; cv=none;
        d=google.com; s=arc-20160816;
        b=mokQqgLv5xm6o/F4VrRut9oay/yglv6v1xFln/W1o/qhOxzyAsdpifQ8uA1lNErsI4
         N6gjbeWHyWQeGIKpQoi3t0jxaN3xDmZaBCm40gSari+oqCwoBzXSJzKkQnGR400COAv8
         5MsWT+NspPfv12C+4WUrD9ZAHiBgygUc/HJDVO8wRS3PRB7kexo8u3niweGxEdLB8GTe
         iMMOX+jtk5ToizHmXFCdoQ5rL/rv48Wi4dVGX+F+4COQlhFyT9hw5uhBCPhbX8P8olfj
         ai7EMDVttZX1JrwnDVKHB2iaMjEfvLnd1eJ/A5uICf5RL+VHtVmtwjPNjGCng1SzEjKa
         V0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=qYybloYhddQjFVVfwcV3qV3Wofv8tKjeWYVubu3SEX0=;
        fh=JVsKlQbC1ItX5vulykAbTF+O/AH2/cRg+fwbqKkzTRE=;
        b=FBpD67OHYFkaUhLCwLjfelJCZscSMTRDFPWgmMBVmEGBpMSSKyyqPfLlwSvCUFYL2R
         2fPS6sTX40vWAMqamEjTQL3EHmxHAIiRNRo+T5Qt9cavL0r8AJJtQ8PKg9tfEUqhKz/N
         i+HWTnw5HvgJmJKjf7HHZVOJYltRkCuGoUeZeCzZJRxfbs0bJXGaRYALd3QJHosqW8xZ
         rM1tmABbrxWVhka3kVI0igP3x8HfQBpZDHG56z+i/VVMp7x6vOkMgmfMn8vuLpp9jPc+
         5U9IOBTHp9QZUb+NVopmTIpGaSJ26N5srsZgrRZ9CSREb/d5O9FXKBE6FPvF6mAQ02Oi
         E0uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UG0TW/IN";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a349c29ff1si137849786d6.216.2024.05.20.03.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 03:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UG0TW/IN";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716201484;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYybloYhddQjFVVfwcV3qV3Wofv8tKjeWYVubu3SEX0=;
	b=UG0TW/IN0OcplvyOLBVpyLL86FhlZi9SpqR41OlzQFrIMTcL0jFZmknCCG0yg1Riu6FvDo
	sP8HSq0Lc/cJ+42L4ypTdoXbJF9EVcmdhjfRlqGCPC5lYMa5l7miW4KXTctlRqBejepF6H
	iPYjGdlcx8hYjRXCF5LLrpsMm/LHIZM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-FdbHgh2iMeiEmYSOtwpFEw-1; Mon, 20 May 2024 06:38:01 -0400
X-MC-Unique: FdbHgh2iMeiEmYSOtwpFEw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-792baeb223bso1469207685a.1
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 03:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716201480; x=1716806280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYybloYhddQjFVVfwcV3qV3Wofv8tKjeWYVubu3SEX0=;
        b=NiWKuZ8CCOWuj34mFQ3gOG9JXqxa1oLDrJxaj29b6Vnp/I84C4MvlwmMTNCaqsNOeP
         SWXN3yujvTYW13UFK/ZYT91R4VToggemU1KgTPV8kCFO9PK/r9R8eWqfd+qT5qCGgkp7
         PZd9hG2L1EiuxaXhNn8Kij4h2XUZxvgpLLnGcnyRGmnt+E1aNK6nPrEgwtlUfGG31E/5
         BkXZT9Y/KKwPmIM9WYpRRklMdl50J8cAYuQAonuJ98m+speVyDEfrxP9Mrp8AWpiyumR
         AIiRnvbUfs8U0Nn0lO8zIp09Zcyh9chBwZuQcyGl+xD0gugDQrjDVEEQAXHerlIZLs+j
         lA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4gksu+xv/Bw+ScIQooTRfF7JJyCoip36s2qwcr9A7nILAl9Viz7Mc6D6WuMSyJLSHFIap4t5qKzj2Et9fyo4/Lj2t4BSz
X-Gm-Message-State: AOJu0Yzxz6R30sCsO5XemeoORZhKomGgLBxccHjpSC6CM6SWlGxa0fY7
	0iix8Csa2npRIjH7nYaxen+6jEUUo5uy2hhAGUC7nrHRui/z/7DG54bJDimEuRCFc+5uMbNXsrs
	XFMeUe3TQSjam2i30Q4p+uKKE631ipeCrZy1smRo59g2mmFCjf5DpsQ==
X-Received: by 2002:a05:620a:3624:b0:793:31:d2fd with SMTP id af79cd13be357-7930031d425mr1280019285a.5.1716201480425;
        Mon, 20 May 2024 03:38:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3624:b0:793:31:d2fd with SMTP id af79cd13be357-7930031d425mr1280016985a.5.1716201479872;
        Mon, 20 May 2024 03:37:59 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2fc67esm1176913585a.74.2024.05.20.03.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 03:37:59 -0700 (PDT)
Message-ID: <ee406ad2-68c9-47e2-8167-20dbceb1e484@redhat.com>
Date: Mon, 20 May 2024 12:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 13/18] hw/arm/smmuv3: Support nested SMMUs in
 smmuv3_notify_iova()
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-14-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-14-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 3DlgdMgSm2oT

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs keep
> the implementation, while only notify for stage-1 invalidation
> in case of nesting.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c     | 23 +++++++++++++++--------
>  hw/arm/trace-events |  2 +-
>  2 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e0fd494646..96d07234fe 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1051,7 +1051,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>                                 IOMMUNotifier *n,
>                                 int asid, int vmid,
>                                 dma_addr_t iova, uint8_t tg,
> -                               uint64_t num_pages)
> +                               uint64_t num_pages, int stage)
add the new param in the doc comment above
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      IOMMUTLBEvent event;
> @@ -1075,14 +1075,21 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>              return;
>          }
>  
> -        if (STAGE1_SUPPORTED(s)) {
> +        /*
> +         * IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs
> +         * keep the implementation, while only notify for stage-1
> +         * invalidation in case of nesting.
> +         */
> +        if (stage == SMMU_STAGE_1) {
>              tt = select_tt(cfg, iova);
>              if (!tt) {
>                  return;
>              }
>              granule = tt->granule_sz;
> -        } else {
> +        } else if (!STAGE1_SUPPORTED(s)) {
I don't get why you don't test stage == SMMU_STAGE_2 instead
in each block shouldn't you test if the corresponding state of supported?
>              granule = cfg->s2cfg.granule_sz;
> +        } else {
I don't really understand the logic here. Please can you comment each case?

Thanks

Eric
> +            return;
>          }
>  
>      } else {
> @@ -1101,7 +1108,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>  /* invalidate an asid/vmid/iova range tuple in all mr's */
>  static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>                                        dma_addr_t iova, uint8_t tg,
> -                                      uint64_t num_pages)
> +                                      uint64_t num_pages, int stage)
>  {
>      SMMUDevice *sdev;
>  
> @@ -1110,10 +1117,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>          IOMMUNotifier *n;
>  
>          trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
> -                                        iova, tg, num_pages);
> +                                        iova, tg, num_pages, stage);
>  
>          IOMMU_NOTIFIER_FOREACH(n, mr) {
> -            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
> +            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages, stage);
>          }
>      }
>  }
> @@ -1144,7 +1151,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>  
>      if (!tg) {
>          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
> -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
>          if (stage == SMMU_STAGE_1) {
>              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          } else {
> @@ -1167,7 +1174,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>          num_pages = (mask + 1) >> granule;
>          trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
>                                   ttl, leaf, stage);
> -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages, stage);
>          if (stage == SMMU_STAGE_1) {
>              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>          } else {
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 593cc571da..be6c8f720b 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -55,7 +55,7 @@ smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> -smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
> +smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
>  
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
