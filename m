Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp280403ejb;
        Mon, 17 Jun 2024 08:02:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnKdSMEsOwBHM5HSMBCwwMy5D7WoOkW5FY5EzpZxkPV82jCcyMVw92ZRuh/wI3XiFY4JH3fl1S08dPwLl31kYMlkge2WEV
X-Received: by 2002:a05:6512:a84:b0:52c:c04f:4e30 with SMTP id 2adb3069b0e04-52cc04f4e53mr1622019e87.40.1718636530148;
        Mon, 17 Jun 2024 08:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718636530; cv=none;
        d=google.com; s=arc-20160816;
        b=JsOiOZYWBA41YjTqQG9FfGtUz1F6njlaFSswuOlBjZCbW84H/Hw3WcJ5+wKRt4ERWc
         euqHiyrBDrpSOuro7VybzdrlmxZYHFal6xoRAJ/TnrzJJxC+z9OW1wATFG3m29gfOkeA
         EPS97yLrOSdlQxaMUGy+sB5qX+nX+QnfMGog5tF66606QAmVTQwFskGk6VKGifzeEtOw
         sdcGejs+nswecAWRj/K6KIbqJ+eSJ2q4D46g06CnEFsqvn35b9d+F02upyftACsiyZpm
         EFbHfy1sskvn3UpQYd86RlGJkj/QvxljONEtAsWpNhFBxKTsO2XYaH6/OTCy6K5etl5b
         Dxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XQ0ikf2V9L0ChQ2aIx/bsKRbW4q9ae9R/rVmAWg7XLA=;
        fh=Bi/jIzFN6A6JU30cq+x8Pe/bFQxPf5u0qThzlx4zM0c=;
        b=LahEzoHql0fKwlws+rCMC6z2ykAXncbgotR+Ol390ASDgdSRUW0SCQnWgPoOdU2569
         drK8uKnArvZ0pIx+R+wNzzcMg/APt+wHEBP/+gh3sI0I8yRck0sHXxE6H4Zl6dcKMkV9
         8oxtA+EkfJ/WbrWaYk61olwh/ViSQTHhqqx/IbdXVcBmxFyFI2QN03h6fm5dTKMvIdDg
         pnIHdZbGjUKP8zWPXwrVrd2TSPs6I7X5gNS5amHPeyYpL5lha7rxgv984ynlbD1LJ4Cn
         Y9tLzxEEiNMADWQNsSdTRAAbm3XTrJnGvabhO00vUM25j2RfU56bzyll8HdMcu2vxQF1
         yBiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=d+7Phwp4;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52cbd4eacb2sor63921e87.3.2024.06.17.08.02.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 08:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=d+7Phwp4;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718636529; x=1719241329; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQ0ikf2V9L0ChQ2aIx/bsKRbW4q9ae9R/rVmAWg7XLA=;
        b=d+7Phwp4Ei8Xy1ES5YmeQxyfxA29bEJnM0gWFad+0Z+W+FtBWrvYf45XY2Vy9dcQDA
         yk2Ns8Vmw1QeT6NtEfv+dBkJp4KsHk1FkH2A/iyHYSaBbGRcJNjxCvhNu2VdWjQbzZd8
         diu3DKzmjXAPe/L/aBCQ9MXM0s8zzvSKC+LnkIhOAoXABqfkQaCe5ZELlIJi7MhUczS8
         xfP/7Md4f/b7m4KEfR9fiJxl7Y9HIKNR0zsLDEFPrtQH3zoHXkLIeV8qnLpCVHT9i160
         r0ZDEupxNmEVinzBS8Y8odg2yx7ZqoAlzfVtIt7sufFZ33bYkJB5YauYzFesLOzj8sXR
         AQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636529; x=1719241329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ0ikf2V9L0ChQ2aIx/bsKRbW4q9ae9R/rVmAWg7XLA=;
        b=nGq5MvyatUaKYbY+2QQMhHgBU0oVVVQwgJBbuz0eKMliNRCA74QGfamRJrkAwzPLKH
         nY8QT0mRYirkOJhsxiQwB9tFvchw0KX+Hn4t4DHDtRwkYLG9/x7V+pRZEwQB+liedP9M
         o1PHmND8t6wfLbFcnxMBopPv+/uw1h95pEtRdRAIEz6nGKBeEPoP7sn0xPEkTzXduQ2s
         sM9HGCMLpi0vrPeJ4kd8XHqnXvMehjcv3i3tA55OFlRf1amJrKVTPmx21+TEG6LgAJTQ
         hZEiA5GY+5789p1ZB7cPCGrCyaTkx35khH/U9fLcsNYG0uZYdWTvd8mF0EXcPGBSB7wJ
         RzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPhmvwuPWS9xaptytt5Xj6YESsW+gESEj0fymi5r8l8CIJi5iVamAc6KHmo2LceXSTE4xUoa/UP9wRKcVka+bpUciI24Uk
X-Gm-Message-State: AOJu0YwwPmF6wPBZo8R9ZlxCzu6fQD9yKcKgqxeRcmCTI7J+hHRHNqcv
	rwET4yE/YpB1NrJrgoriJ+pt5ZoZwlUp7DUIkzHkNYGwYThjbqlgOwgl6+MhWg==
X-Google-Smtp-Source: AGHT+IGBAWlDbf3t2O5QBHwdJ9TGMY2eblhj+E8+lvwHE9MJ/znatv1R9DsFMyS1hSb/uJt5gPTtAg==
X-Received: by 2002:a05:600c:1d97:b0:421:292d:f1e7 with SMTP id 5b1f17b1804b1-423b5fb137amr3803065e9.6.1718636528842;
        Mon, 17 Jun 2024 08:02:08 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de63asm200740215e9.30.2024.06.17.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:02:08 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:02:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 13/18] hw/arm/smmuv3: Support nested SMMUs in
 smmuv3_notify_iova()
Message-ID: <ZnBP7ONKCr2fxp-S@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-14-smostafa@google.com>
 <ee406ad2-68c9-47e2-8167-20dbceb1e484@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee406ad2-68c9-47e2-8167-20dbceb1e484@redhat.com>
X-TUID: LkbZkg+uRcI5

Hi Eric,

On Mon, May 20, 2024 at 12:37:55PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs keep
> > the implementation, while only notify for stage-1 invalidation
> > in case of nesting.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c     | 23 +++++++++++++++--------
> >  hw/arm/trace-events |  2 +-
> >  2 files changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index e0fd494646..96d07234fe 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1051,7 +1051,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> >                                 IOMMUNotifier *n,
> >                                 int asid, int vmid,
> >                                 dma_addr_t iova, uint8_t tg,
> > -                               uint64_t num_pages)
> > +                               uint64_t num_pages, int stage)
> add the new param in the doc comment above
> >  {
> >      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> >      IOMMUTLBEvent event;
> > @@ -1075,14 +1075,21 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> >              return;
> >          }
> >  
> > -        if (STAGE1_SUPPORTED(s)) {
> > +        /*
> > +         * IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs
> > +         * keep the implementation, while only notify for stage-1
> > +         * invalidation in case of nesting.
> > +         */
> > +        if (stage == SMMU_STAGE_1) {
> >              tt = select_tt(cfg, iova);
> >              if (!tt) {
> >                  return;
> >              }
> >              granule = tt->granule_sz;
> > -        } else {
> > +        } else if (!STAGE1_SUPPORTED(s)) {
> I don't get why you don't test stage == SMMU_STAGE_2 instead
> in each block shouldn't you test if the corresponding state of supported?
> >              granule = cfg->s2cfg.granule_sz;
> > +        } else {
> I don't really understand the logic here. Please can you comment each case?

The current implementation will call memory_region_notify_iommu_one()
from smmuv3_notify_iova() for stage-1 or stage-2 based on which one is supported
and in each case this address is considered an “IOVA”.

However, with nested translation memory_region_notify_iommu_one() doesn’t distinguish
between stage-1 and stage-2, so only stage-1 is considered “IOVA”.

And the implementation basically as follows:
1) If the translation was stage-1, it’s an IOVA and
   memory_region_notify_iommu_one() is called.

2) If stage-1 is not supported (this is an stage-2 only instance) maintain
   the old behaviour by calling memory_region_notify_iommu_one()

3) This leaves us with stage-1 being supported and this is a stage-2
   translation, where the notification would be ignored, I think in
   this case if the SW configured only for stage-2 it would expect
   it to behave as 2) :/

Not sure how to fix that, maybe only ignore stage-2 if it was in a nested STE,
or just or always ignore stage-2?

Thanks,
Mostafa

> 
> Thanks
> 
> Eric
> > +            return;
> >          }
> >  
> >      } else {
> > @@ -1101,7 +1108,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> >  /* invalidate an asid/vmid/iova range tuple in all mr's */
> >  static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
> >                                        dma_addr_t iova, uint8_t tg,
> > -                                      uint64_t num_pages)
> > +                                      uint64_t num_pages, int stage)
> >  {
> >      SMMUDevice *sdev;
> >  
> > @@ -1110,10 +1117,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
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
> > @@ -1144,7 +1151,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
> >  
> >      if (!tg) {
> >          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
> > -        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> > +        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
> >          if (stage == SMMU_STAGE_1) {
> >              smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> >          } else {
> > @@ -1167,7 +1174,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
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
> 
