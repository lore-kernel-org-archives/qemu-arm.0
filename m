Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3121041njb;
        Tue, 9 Jul 2024 00:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7ziRO4Vy3L129waQVUErE2w1GL8zo5E+Qc4d2PIIiuJqzwMOlzrzktowk8R5YVSGsSgLQvr85hUEqIobvaBaR7KT5ubAJ
X-Received: by 2002:a2e:9f12:0:b0:2ee:96e9:769a with SMTP id 38308e7fff4ca-2eeb31890dfmr13818411fa.52.1720509622162;
        Tue, 09 Jul 2024 00:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509622; cv=none;
        d=google.com; s=arc-20160816;
        b=P1cp3f+J4TH+8vh0ewKgEk+R+8OH9hNW6q0Y8lWEtMm/AyRdFfelqJpOhPq/7pP9iF
         +fSRxL8xu4mwCN1ljRnpff3mOWDEY6+5gezTu2sC7yF8dz6zhi3o8kWsni9rP4TlocP/
         zZX9Yz3KMSjD3c2v+xiFdNakLbfANGeWWwp+ZgYLr6IvuYkhaUhUPP5QczhoC48tv4Fc
         2FeBByGUYm4Q9LplxwECclyAuq252n7VeAU+d1UXHONUjdaIIzCNb61uaarDCJdbASgR
         /BBoYnkZXs8f6czQPz1jiSvsCDrH/j1EYdYfKZnHCYsUYMwDh7fgx9x0wrrPFDM/QB4D
         71Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=lQgiBgX82Mz62yDzj8fxlZaDlaODGH4QZ7AVoQBDUrw=;
        fh=wZ0Qa5VGJ8hFWUlrb3OGCpzCoHZAb38r304b7mpl0LM=;
        b=cAnIGhLdGGEHEbkE9dvmEhwzFY/VyxMwIIeejPQKYsbsJ7b2HXmmaaWejwsusNpPFC
         rBz3qHFbdNIN0G/6OUr2SxY3HmxA6ZqkNC5CPlU4LlYr8ayvnQ5iRDCPMOtqa1ITGFiM
         DIi/hCWmVMuP/GqzSWJVoONDUcuUrmLZwNnItn4xhKeVBb3MWoF6OjvcT8FGhlA65XJT
         sXT3wVhZM1sGK2e9VMSgxsWDDD/AQY6yIeCo/dzEMPk4NXFLAzl9cmEvkab7bKiEOvCR
         hwEpwuLAVAf8xZiKeL3RyJ8DMVwesnoMa45GWus3tzb3fnPYmXOo3n3YbM9Dbixn3XqA
         pDgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="NbQ8/Jpa";
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-426740d9c47sor306105e9.5.2024.07.09.00.20.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="NbQ8/Jpa";
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509621; x=1721114421; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQgiBgX82Mz62yDzj8fxlZaDlaODGH4QZ7AVoQBDUrw=;
        b=NbQ8/JpavxnFp351hbjzWydR2TvDlDCMtiok/rc2zAtmsLGqFFKYzZ14qSyzTOrh9q
         6tuds8hARNb3L70tYVee112DaAsQsuodTooczM3J/OCAJ9y1MNTyr34+CQ6T6OkruXKT
         QPj9IIQCmRPu4WAm6zvTE4OcBfGcOganr0qyGwWyZnp7m6hugmIgHfko2tKgFf5qfZSY
         tztxaqY8iaoxNrvm1A+2Wowt3HwJLA17fEWBYHu/1RCxJLQ80M7AreRazcm8gvZLkEaA
         Ex50P0zRzq2Ua7rh/P6NkgxhDWgkRrNL0st5TmHIiEonQ5ipOF4n3QJLOjJv9RDm4JI3
         X9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509621; x=1721114421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQgiBgX82Mz62yDzj8fxlZaDlaODGH4QZ7AVoQBDUrw=;
        b=Vtq8uGHzIUC4REMcK/KiT5lNT7OetxdbURo3g2//Qr7CUlaiFQ6q8qYoIsVPMOkrXW
         AgnjTaCfsq73M+g8q+baeSIgBLzf0qBXEJgq/JiB0pSn/cNCsrzhX5/MMA+cQKkI+RmN
         arxwaKRVjlON4Es0G9Rk/xsdssFnd6Cqc0LzVa8l2LIWinGJk1rIkgc/J1etS2DEX6mk
         xFfAJM/Otc1PYssdRPg1YLCRHhuqFTIBjieXSk8hRVPPVmbSnTzDtsHRvM98pdidrYwM
         0V2G6Pd7JybCG5W9H28jyj/xBvjst+8u6GuCKUdLHgXFkdg28SYAVRB0OshnGjfdWf1z
         TKwg==
X-Forwarded-Encrypted: i=1; AJvYcCVK74gAsz1p5f6+Fo2sKy2VO80tFkLfjv4h2Wz6gsvd/YEG0Ccv1vItBDdZZBUL6s9je6z9ZV0WAB7QRD55jvyAmg9IReOU
X-Gm-Message-State: AOJu0YxvtvzuF82nXwbrgdfa0rVGU9QbnlE8nONc/f5EkcGyWVfRTdXW
	VG7f9NVfgzQL0f5fu8Escu35zbykjyYxvO8JOrSYPDQy9vcvydwhaLLvMXv1pQ==
X-Google-Smtp-Source: AGHT+IGWOp6Az8LkeXXK0q3XxDyA/GZltzdSTffj12UYrjUwn9bCtjU4H9cKRv+lm6ht2YzN01dYhQ==
X-Received: by 2002:a05:600c:3b16:b0:426:5ef2:cd97 with SMTP id 5b1f17b1804b1-42671a88f7dmr1441715e9.2.1720509621423;
        Tue, 09 Jul 2024 00:20:21 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde89198sm1662607f8f.60.2024.07.09.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:20:20 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:20:17 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 15/19] hw/arm/smmuv3: Support nested SMMUs in
 smmuv3_notify_iova()
Message-ID: <ZozksXro6STwOPA1@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-16-smostafa@google.com>
 <20240704183503.GL1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704183503.GL1693268@myrica>
X-TUID: CW85C+uj2qbe

Hi Jean,

On Thu, Jul 04, 2024 at 07:35:03PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:37AM +0000, Mostafa Saleh wrote:
> > IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
> > SMMU instances we consider the input address as the IOVA, but when
> > nesting is used, we can't mix stage-1 and stage-2 addresses, so for
> > nesting only stage-1 is considered the IOVA and would be notified.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c     | 28 +++++++++++++++++++---------
> >  hw/arm/trace-events |  2 +-
> >  2 files changed, 20 insertions(+), 10 deletions(-)
> > 
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index e9007af3cd..36eb6f514a 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1064,17 +1064,17 @@ epilogue:
> >   * @iova: iova
> >   * @tg: translation granule (if communicated through range invalidation)
> >   * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
> > + * @stage: Which stage(1 or 2) is used
> >   */
> >  static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> >                                 IOMMUNotifier *n,
> >                                 int asid, int vmid,
> >                                 dma_addr_t iova, uint8_t tg,
> > -                               uint64_t num_pages)
> > +                               uint64_t num_pages, int stage)
> >  {
> >      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> >      IOMMUTLBEvent event;
> >      uint8_t granule;
> > -    SMMUv3State *s = sdev->smmu;
> >  
> >      if (!tg) {
> 
> Should the stage check be outside of the TG test?  I think CMD_TLBI_S2_IPA
> with TG != 0 and nesting enabled would still go through.

Ah yes, I will fix it.

Thanks,
Mostafa

> 
> Thanks,
> Jean
> 
> >          SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> > @@ -1093,14 +1093,24 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> >              return;
> >          }
> >  
> > -        if (STAGE1_SUPPORTED(s)) {
> > +        /*
> > +         * stage is passed from TLB invalidation commands which can be either
> > +         * stage-1 or stage-2.
> > +         * However, IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
> > +         * SMMU instances we consider the input address as the IOVA, but when
> > +         * nesting is used, we can't mix stage-1 and stage-2 addresses, so for
> > +         * nesting only stage-1 is considered the IOVA and would be notified.
> > +         */
> > +        if (stage == SMMU_STAGE_1) {
> >              tt = select_tt(cfg, iova);
> >              if (!tt) {
> >                  return;
> >              }
> >              granule = tt->granule_sz;
> > -        } else {
> > +        } else if ((stage == SMMU_STAGE_2) && (cfg->stage != SMMU_NESTED)) {
> >              granule = cfg->s2cfg.granule_sz;
> > +        } else {
> > +            return;
> >          }
> >  
> >      } else {
> > @@ -1119,7 +1129,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> >  /* invalidate an asid/vmid/iova range tuple in all mr's */
> >  static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
> >                                        dma_addr_t iova, uint8_t tg,
> > -                                      uint64_t num_pages)
> > +                                      uint64_t num_pages, int stage)
> >  {
> >      SMMUDevice *sdev;
> >  
> > @@ -1128,10 +1138,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
> >          IOMMUNotifier *n;
> >  
> >          trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
> > -                                        iova, tg, num_pages);
> > +                                        iova, tg, num_pages, stage);
> >  
> >          IOMMU_NOTIFIER_FOREACH(n, mr) {
> > -            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
> > +            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages, stage);
> >          }
> >      }
> >  }
> > @@ -1162,7 +1172,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
> >  
> >      if (!tg) {
> >          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
> > -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> > +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
> >          if (stage == SMMU_STAGE_1) {
> >              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> >          } else {
> > @@ -1185,7 +1195,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
> >          num_pages = (mask + 1) >> granule;
> >          trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
> >                                   ttl, leaf, stage);
> > -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
> > +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages, stage);
> >          if (stage == SMMU_STAGE_1) {
> >              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> >          } else {
> > diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> > index 593cc571da..be6c8f720b 100644
> > --- a/hw/arm/trace-events
> > +++ b/hw/arm/trace-events
> > @@ -55,7 +55,7 @@ smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
> >  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
> >  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
> >  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> > -smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
> > +smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
> >  
> >  # strongarm.c
> >  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
