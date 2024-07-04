Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp785792njb;
        Thu, 4 Jul 2024 11:34:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULVYtMHn185mYfNNvFBAJljRN2P4YN+7PVv5Pe2WPP0zd6LX9QtvxjmG6RWXW8YNWuQ1DgOnX5lzsq+HLsuQMFnq88qaIO
X-Received: by 2002:a05:600c:3418:b0:425:6171:5d26 with SMTP id 5b1f17b1804b1-4264a46bfc8mr17612045e9.36.1720118090965;
        Thu, 04 Jul 2024 11:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720118090; cv=none;
        d=google.com; s=arc-20160816;
        b=bgPBb2SzcFtEf2Q0VLEKyhoUQjX8JKAL83Fvm2UA5VFOE4RMJ1OuQpWwZcxrfcaii6
         0NeIhEGMDsTiy+hgpZHYZyv4uQ9O6FKeXrwMuMqF48P1GrURih64KLe46keU2DMEYgdT
         H3JK6qf6CVCTVwzgwBssNxUonVo+ALzFDIFQp1QiBiv0sqEgntoZEs1yrDqPHGerRric
         /ca/6irciDYfVoDLpMksiNiECuoDin+rf3CuBq1n9LkKjeE+EA8dyUaXEVLubrsOuXsd
         QG9mq/gTaTttpNyspWuWPmjbclqH0HeN2qaULYk9X/CPf6xKoJVUcXNWjo7WQZ5PjmES
         5wrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0QXWX4qz6faB0p5QP7wLk33QyiWxxAQGCZN44SNcwPo=;
        fh=RLu8KJZldK9AkFykAViHRMBdAakg/tWgTvdKGRHndPg=;
        b=mQWn04AerlSQmr3+Hby/aB1kO3WUTwJh1VCzOZl4BlrS0KVegju0wOemjJzXOnEZS8
         qcczVY9aMpkimAYA0ul1+3iZtA8AsDCnqV6XgEQ5Ipe16ZsLfjMp3PYf7xOHt6ruVl6D
         7IQ3wPKilu2UfM/4CIAxRAWxF7F5Elz73p5Zz/8oU5U7YbwaKmso1ATqOJgq8HLqC3yt
         RHS7ZB9MBXSCZrFSqeyXeFjKqsi9Ij7P5cOkpAFumoOzYj/4eypJ+1/jbdwxt3w0M/JE
         xIW0NyI+oYV5eDBEKNPcNi5HgMIIo+rbLxf7z5onz73RTWZfqjx6wDV95pJ5tCwS6+O1
         Bbzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQEdO0F3;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-425655a41aasor47446505e9.8.2024.07.04.11.34.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQEdO0F3;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720118090; x=1720722890; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0QXWX4qz6faB0p5QP7wLk33QyiWxxAQGCZN44SNcwPo=;
        b=UQEdO0F3Rj14MegSLC8wy0BIaJLM3ND/AflOz66hiKqoPys0D9IQG6G48XFRDFiMRp
         XLrrId/Dc1Czf6aaN9dtlWmGdVWlt2cVGYslFscPSH6H0sjoCp5fIIPIAtLjwjl58UGe
         M9M3v13zKGvPagB7bteNMpImtgJSsLsgwDqRf3Hdv7yMN2KRAHLvrZAd23LSb85jI+Ml
         Slehb65zvDRXSZFJv9f7hkN1w1YOv967T7nQA1l1Gj7wfQIhQ6F5kZqztzSbHwc+wVbW
         Wzt53OqjuT9l4uFw+ozktuI1ySJXNqkshvKuIbJGBsqGqP8c8953TDOy20R9yeIxcoe2
         zkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118090; x=1720722890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QXWX4qz6faB0p5QP7wLk33QyiWxxAQGCZN44SNcwPo=;
        b=oHL+36d6mADnnYOYexAwg1mR8LaFTv6lrmer0se3Os2S09xjUtsFTV8893UJigM/zd
         NRM6TROtBRePLaeT+l1OmLwDFgNf1lzfTCoG347PHGzTS3uVQ2RpDL86R56zilyMr2Nu
         agWJuz4txrsXtGmyc5xsUYZ3m4DPaeb9BFkgALmjG7Mxy9sT9UUzB8X1uJwbEKFoknXk
         z3FGzhF51QRHVVNbCvySy7a87ssXGSPrBt4nbf+7kpLpfPwLeKkx4X20/W/xzPnYt8vb
         HoRubZWP1KwpCvFKeszl8mO1m7V+GZZpHK/5XSFlMtU+tgcarIiS/fnzECaYuDiPfNLQ
         vQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCX2ic5CePArI7QIGJlD4zWrvkg8vleZ4QltML/soxmEMK5fQ73gQGU/1g1/6muPdPoFI2xAHMiEty+h9K6CnV0T2xTq7vLs
X-Gm-Message-State: AOJu0YzKLHFOC7je/2LFscYdLuhW0tmNlS2AAkXYK/ctsSWEB8qxvEjz
	hRI79FvH38P8k06dahZqDud2AepzDwco+sL223EMo7s0F0Y/F8IL29EcH+wUwbmbuw==
X-Google-Smtp-Source: AGHT+IEyZTVVumnDnlONSxCGuoa6eb0or8S3heJSwMcSCBaCdF8PaInd4pTl1o5J8WRM68AE2jF4ug==
X-Received: by 2002:a05:600c:4f52:b0:425:602f:d62c with SMTP id 5b1f17b1804b1-4264a3e2ed7mr18252725e9.9.1720118090509;
        Thu, 04 Jul 2024 11:34:50 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a188edasm33430055e9.0.2024.07.04.11.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:34:50 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:35:03 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 15/19] hw/arm/smmuv3: Support nested SMMUs in
 smmuv3_notify_iova()
Message-ID: <20240704183503.GL1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-16-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-16-smostafa@google.com>
X-TUID: Kab0CmbLAwbX

On Mon, Jul 01, 2024 at 11:02:37AM +0000, Mostafa Saleh wrote:
> IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
> SMMU instances we consider the input address as the IOVA, but when
> nesting is used, we can't mix stage-1 and stage-2 addresses, so for
> nesting only stage-1 is considered the IOVA and would be notified.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c     | 28 +++++++++++++++++++---------
>  hw/arm/trace-events |  2 +-
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e9007af3cd..36eb6f514a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1064,17 +1064,17 @@ epilogue:
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
>      IOMMUTLBEvent event;
>      uint8_t granule;
> -    SMMUv3State *s = sdev->smmu;
>  
>      if (!tg) {

Should the stage check be outside of the TG test?  I think CMD_TLBI_S2_IPA
with TG != 0 and nesting enabled would still go through.

Thanks,
Jean

>          SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> @@ -1093,14 +1093,24 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>              return;
>          }
>  
> -        if (STAGE1_SUPPORTED(s)) {
> +        /*
> +         * stage is passed from TLB invalidation commands which can be either
> +         * stage-1 or stage-2.
> +         * However, IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
> +         * SMMU instances we consider the input address as the IOVA, but when
> +         * nesting is used, we can't mix stage-1 and stage-2 addresses, so for
> +         * nesting only stage-1 is considered the IOVA and would be notified.
> +         */
> +        if (stage == SMMU_STAGE_1) {
>              tt = select_tt(cfg, iova);
>              if (!tt) {
>                  return;
>              }
>              granule = tt->granule_sz;
> -        } else {
> +        } else if ((stage == SMMU_STAGE_2) && (cfg->stage != SMMU_NESTED)) {
>              granule = cfg->s2cfg.granule_sz;
> +        } else {
> +            return;
>          }
>  
>      } else {
> @@ -1119,7 +1129,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>  /* invalidate an asid/vmid/iova range tuple in all mr's */
>  static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>                                        dma_addr_t iova, uint8_t tg,
> -                                      uint64_t num_pages)
> +                                      uint64_t num_pages, int stage)
>  {
>      SMMUDevice *sdev;
>  
> @@ -1128,10 +1138,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
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
> @@ -1162,7 +1172,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>  
>      if (!tg) {
>          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
> -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
>          if (stage == SMMU_STAGE_1) {
>              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>          } else {
> @@ -1185,7 +1195,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
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
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
