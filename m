Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp984375dlb;
        Wed, 17 Jul 2024 08:30:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXsRW4BkDOvfg60ui9rWzsic8Fx8UivITncOfdNETMr3W+rzY9tcUcAShW4fFj4X7tbn0VablMA0anzoYEg4+qKhF9NQFj
X-Google-Smtp-Source: AGHT+IGtEGL4TZoOCxfSSwQURZr65YJ7osmPxRjoDncmmTAtFg7+mxftfazjaOdu94k67+Yz5gsP
X-Received: by 2002:a05:620a:4095:b0:79e:fcb5:55e2 with SMTP id af79cd13be357-7a187441635mr240156485a.5.1721230227438;
        Wed, 17 Jul 2024 08:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721230227; cv=none;
        d=google.com; s=arc-20160816;
        b=Zna/uM+V7SZEndEfIGE7Rzk/Tu9sJX2iXQ3IR1mBFFfj5YU4kUjGq2r+Qo9UFE+QjW
         8sZ/AAJDPgbW3AngqTUl3mAwf+KvbRLa8xFxlSkZXMu9MUrQmD2oINSaDdImX+zNYYdY
         Kbqiz/+1gRVCwM5V23I42u1ndqe6XtgsskWt4G4axLsdKRf0yHPlKyQkrBgyam6YgchC
         08/Z55/5TNHGf0u2HwoYdEe4cjkHk6jqTFAYFICD1RrDTdGkPiiqgJO+vBOgNUH7un7D
         n1L7a5PyLJr1Lkt/HiYop/yykVQV9Z1H9AbVr7lqNP7fcBqbpMm4sRI7AQJ5z+o1Mpio
         1PWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ALaMNY1059SLRwzn/2RfEPOXfxCaDgRxwRcSvdvPpf4=;
        fh=/WlxTIHPNxnKi5X3zuIoIs/uu+GP1W7W1hYAYXf4CHg=;
        b=tEeyLeXeqk9+uXTyvM22B6DUJLysU0SD2Uf1SqZBafKLL8XjuEnQoAF1ejbAXgdLXU
         wBtpF89fzFyPd4LpMnR5QnYhkJJhBvohZSybipxe8u44zm7ZsrTsvWsfoGsKqMDj/Xg8
         qtmrRxQFOqBLYVsrS9VHAoQmJsnG9WfrilYeqaNH5ckwgQxN8HLVu+4OTy9Gg4sAA65W
         ntlmjHRDrY1XtiREcpVYqP8Vfp2+cPc5Z0l7ACuscZooDnLOW876bg5SAkPJUeR//xwK
         BtudiGj09Uf1vxkTNf0XnA0xlbij5llbf6wE8paezbhi+NuPO9g2eeIs4s/MTQ1hvLQE
         xseA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pim+zsy8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160b7bd99si1003844685a.40.2024.07.17.08.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pim+zsy8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721230226;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALaMNY1059SLRwzn/2RfEPOXfxCaDgRxwRcSvdvPpf4=;
	b=Pim+zsy8fz0bjPenCy8UwlluLegIBboUc+K03urR215btssc2dz8hUCJA+Wl7NexVsCrw7
	7qcULdseqvlQ4Su7qjJcghkwip1ak2SAgHbdDmK5Qkn2ortM4gNPpyURJvS6Yef8eW2wme
	SviIM7BY8rdxBdS4IIBG9BHY7HP9OBA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-FBX2XuocPsCW31GOglbn1g-1; Wed, 17 Jul 2024 11:30:25 -0400
X-MC-Unique: FBX2XuocPsCW31GOglbn1g-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-79efd11a9b9so912350785a.1
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 08:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230225; x=1721835025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALaMNY1059SLRwzn/2RfEPOXfxCaDgRxwRcSvdvPpf4=;
        b=Im0h4i0GVMGr5/Sp6IRTxnnOOfBb3SyuVeAuDwZhgL+4h006UiG8UoRrUrWQUYDN87
         V7NDffTxmbKPwkG0Tw0je9ogsI/2VbCFMBoS4inpbDD6YufsJDEDM8LL+onQayfdTQqL
         COLxWOOIkHZ/+LL70fo24E6MTlCWgQhVG/4OfFi+tkXF7jCzbLwc5cR0mBReD3jmMGOE
         9+M8zFsnbijtOejrT1Vl0agvdTzhrTRBM+qL0KL1jZWdfrtOuAa9hsx3rQERQ5BgAFCV
         KVS/tUTtRo5O5WflHCXA93jknXSkaVs0YMG1yzUGf6CulomwJ3cUBkeDHfcbtKTDr/b2
         uMdA==
X-Forwarded-Encrypted: i=1; AJvYcCXvpSgB/2AW4XmMaivBWC6QNBG7yZXl65pjzll6MQCbjL+DmSi7dMojtC9uN+/1XWCfVG4FgHo69dRgwKMNEb9Ytkioa7S5
X-Gm-Message-State: AOJu0YyIouu/qEe5twEEYyK2x/pw+2MVTApAYcoVr/JTKew667u7KTsp
	7Wi/G5Mm6mOrEQADQ2UgM8i01fQuNHUUHe3EgdNgLFiGF+GC1sjT0FBTf9ogFhkveP7Zjzip0FN
	9nH+4wPYDp1eQYE9BdqiA3x7vU5ylGbsF60ocmDTtGRvSrRD2s7maLw==
X-Received: by 2002:a05:620a:199a:b0:79d:6052:1994 with SMTP id af79cd13be357-7a1875043a5mr251460485a.58.1721230225003;
        Wed, 17 Jul 2024 08:30:25 -0700 (PDT)
X-Received: by 2002:a05:620a:199a:b0:79d:6052:1994 with SMTP id af79cd13be357-7a1875043a5mr251457585a.58.1721230224596;
        Wed, 17 Jul 2024 08:30:24 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160b92ba7sm414925685a.27.2024.07.17.08.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:30:24 -0700 (PDT)
Message-ID: <f866d214-1d01-4daa-a8f1-bb9718f67278@redhat.com>
Date: Wed, 17 Jul 2024 17:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 15/18] hw/arm/smmuv3: Support nested SMMUs in
 smmuv3_notify_iova()
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-16-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240715084519.1189624-16-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: tGzq7Eu0wXJg



On 7/15/24 10:45, Mostafa Saleh wrote:
> IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
> SMMU instances we consider the input address as the IOVA, but when
> nesting is used, we can't mix stage-1 and stage-2 addresses, so for
> nesting only stage-1 is considered the IOVA and would be notified.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c     | 39 +++++++++++++++++++++++++--------------
>  hw/arm/trace-events |  2 +-
>  2 files changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 9a88b83511..84cd314b33 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1096,27 +1096,38 @@ epilogue:
>   * @iova: iova
>   * @tg: translation granule (if communicated through range invalidation)
>   * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
> + * @stage: Which stage(1 or 2) is used
>   */
>  static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>                                 IOMMUNotifier *n,
>                                 int asid, int vmid,
>                                 dma_addr_t iova, uint8_t tg,
> -                               uint64_t num_pages)
> +                               uint64_t num_pages, int stage)
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> +    SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> +    SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
>      IOMMUTLBEvent event;
>      uint8_t granule;
> -    SMMUv3State *s = sdev->smmu;
> +
> +    if (!cfg) {
> +        return;
> +    }
> +
> +    /*
> +     * stage is passed from TLB invalidation commands which can be either
> +     * stage-1 or stage-2.
> +     * However, IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
> +     * SMMU instances we consider the input address as the IOVA, but when
> +     * nesting is used, we can't mix stage-1 and stage-2 addresses, so for
> +     * nesting only stage-1 is considered the IOVA and would be notified.
> +     */
> +    if ((stage == SMMU_STAGE_2) && (cfg->stage == SMMU_NESTED))
> +        return;
>  
>      if (!tg) {
> -        SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> -        SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
>          SMMUTransTableInfo *tt;
>  
> -        if (!cfg) {
> -            return;
> -        }
> -
>          if (asid >= 0 && cfg->asid != asid) {
>              return;
>          }
> @@ -1125,7 +1136,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>              return;
>          }
>  
> -        if (STAGE1_SUPPORTED(s)) {
> +        if (stage == SMMU_STAGE_1) {
>              tt = select_tt(cfg, iova);
>              if (!tt) {
>                  return;
> @@ -1151,7 +1162,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>  /* invalidate an asid/vmid/iova range tuple in all mr's */
>  static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>                                        dma_addr_t iova, uint8_t tg,
> -                                      uint64_t num_pages)
> +                                      uint64_t num_pages, int stage)
>  {
>      SMMUDevice *sdev;
>  
> @@ -1160,10 +1171,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
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
> @@ -1194,7 +1205,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>  
>      if (!tg) {
>          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
> -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
>          if (stage == SMMU_STAGE_1) {
>              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          } else {
> @@ -1217,7 +1228,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
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
