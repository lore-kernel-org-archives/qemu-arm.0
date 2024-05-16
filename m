Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1415749ejl;
        Thu, 16 May 2024 07:43:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULy5ENpvZ3TB6KqIKlnS6DYXGLPJinw/VsvAr8V9VuwVrhEqvZXFWMrb6cr5EFcCNkb4ZTo9cdTQhP+alNFBQMJJM2yQqR
X-Received: by 2002:a2e:460a:0:b0:2e6:bb81:ba0b with SMTP id 38308e7fff4ca-2e6bb81ba18mr60424041fa.25.1715870624757;
        Thu, 16 May 2024 07:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870624; cv=none;
        d=google.com; s=arc-20160816;
        b=mYj+iOkvM6xkKye9aqC+xXQUmS0LO/plF3XWXMIS/0jUOEWXvklYSH6XQIdYTpcgRu
         mUGYMB1EiBCMlmJhz/F/fa170xy6BG0TpI9lOOH9agjN6698sF0RB0PFCCurdM17zJUt
         ovLTzxpah80YNGbFOuXEdHAKHv/YoC8RTJanir2BrKalTFdfjuPOCeisoLZWx/gGTDBX
         Zs8qZx8r1xGP0lVBn2GI/KMfrI4+WkM/aW9w8OJ5yTR4jllgODqf/BYxVUvSBaxDZXBx
         iqQXB/rRcsqxJPtoSvxi0+cpMWVkeQXnFOIRQKjN+3e8fhlBJA2oBiTwptMrDXF9S4wh
         AgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NWkcSf/8im92H27wvNg3Z2ek6JT78ooJ7tgguzoBa8Q=;
        fh=2EC/z01xSlmvILE4VfpNIEJMQ2RGyDX82k/kE0iZT0w=;
        b=SSP8AKubqD9Q/6lvi+x5uj/x/fKhLD1nHyiQaroFX8X1LT+jv/8Vs5yPt4UTeszCcx
         2yF8r8tm9hroSEXdrGTgdlNV54EuVu6f8EPs9BOyd3YmyanSvjukMiYtsZvWUOmN135M
         xKSVVQ0Y2OQF/hk58zW5RDqhs1akICru94zO5qDeUYv8toFINqBbTjOdmU4neBNTPnyU
         v8xGQE6E2sgQ+DIj3DfbQZG7tTIT6JKkwVHaTbZdQRYsR66yVSvzhxmyLelGWjdOcZL/
         r8z9NstnE7krlSdpwQ/bPQdlgtTt872g+gpXuxTU24tuf+9TwrUNRk85l6x8iJ/tCs0Q
         6b3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YsQzCTEe;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-41f440ccfb5sor7857975e9.6.2024.05.16.07.43.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2024 07:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YsQzCTEe;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715870624; x=1716475424; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NWkcSf/8im92H27wvNg3Z2ek6JT78ooJ7tgguzoBa8Q=;
        b=YsQzCTEeNpAim65W1hdjIvWQQ+1fOCvk2eO2Os3nbqCEyczRFGZuTS1uGifpo93GRv
         3VY0KmnH7qkUv/pRFSq1KiaJUllibINx7cA+cAFmo1P3YftCIes++J7FLUp97vNMfHkk
         FJT4eroFifTSDk0wHB65OC2WrILbueW0o/tEXIU36DIVnfB9mxmKRQdzkZs2FeulYwpY
         OMF8j/E3dIM/1fIAPYizZ5Ha5k7+W4xzNCzr5YvguND/9UOoHHOVlAKBGaW3VhXTwHHB
         Un9UMsoII6wVjdCFibjJ2WMBq+TNxAoDVOe0//lOPMw4TAVWk92mF8MOU/tLTRrTudJ+
         +u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715870624; x=1716475424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NWkcSf/8im92H27wvNg3Z2ek6JT78ooJ7tgguzoBa8Q=;
        b=eJtJWxku8BChEuq8Mvi8izoiCkYqwUKaqKJTXCRtNUPPiG2c1LXRx25K3fx/m0C96J
         XGy66iGkWap1IPGIHP/u1Rre3cAQJvygNNthnMwSbOtZO+rW7n7s6eIQeSC0qXb9wLCo
         MApA+caLiNrEazN+Za/OHPhouIRWtdsLC/mcZ/em21GhL2oQe6VbYSBPob4Yomp72i6T
         YBbgMBfYVg3pE8waa4WjIpTaGJJm8QmozPlU43LCNXqaIfoPXNuWdwgxltlI50iDkEKI
         lKtinUE4Svj9mhFKtG6mdEO27P9rMZ52PpvPZSEoBPJBmwfo09Y/xQmMdX7ba9cvXtwD
         z7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV3eQwiK7MRoZqI2OM+kArSgyzU2DUpRzakfMCVdGqHXWlKYRqUn6g4FXNsh9KFi8LaxH6mDkD3aeMmAWfx3zHZ9YrW6Wmt
X-Gm-Message-State: AOJu0YypYSDw5JDbeLuEBIYosHlUkRM0O0MY99ggodv1G97q4WLCbTbZ
	Je0N4AKnqVEjXm9cHhQUt0hR/C4kf1uny7CY+2EBkXbkuOsHEILr6UY7h0gX4g==
X-Google-Smtp-Source: AGHT+IFRYVanbhYW8BmcC3n1FeDtASd2iWzN0nlBA6T7Qhfh4hbQq7qbD603QECiovVm3qK2FP+BKg==
X-Received: by 2002:a05:600c:a4a:b0:41a:444b:e1d9 with SMTP id 5b1f17b1804b1-4200ee37a4cmr11750855e9.4.1715870623671;
        Thu, 16 May 2024 07:43:43 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe004eae9sm257098935e9.1.2024.05.16.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 07:43:43 -0700 (PDT)
Date: Thu, 16 May 2024 14:43:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 02/18] hw/arm/smmu: Fix IPA for stage-2 events
Message-ID: <ZkYbm91fd0Flwo2r@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-3-smostafa@google.com>
 <4161c29f-411c-480e-abca-84e8963ce0ab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4161c29f-411c-480e-abca-84e8963ce0ab@redhat.com>
X-TUID: //FAwtkVkpPF

Hi Eric,

On Mon, May 13, 2024 at 01:47:44PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > For the following events (ARM IHI 0070 F.b - 7.3 Event records):
> > - F_TRANSLATION
> > - F_ACCESS
> > - F_PERMISSION
> > - F_ADDR_SIZE
> >
> > If fault occurs at stage 2, S2 == 1 and:
> >   - If translating an IPA for a transaction (whether by input to
> >     stage 2-only configuration, or after successful stage 1 translation),
> >     CLASS == IN, and IPA is provided.
> CLASS == IN sounds a bit confusing here since the class value depends on
> what is being translated and class is not handled in that patch.
At this point only CLASS IN is used as nesting is not supported,
I will clarify that in the commit message.

> >
> > However, this was not implemented correctly, as for stage 2, we Qemu
> s/we QEMU/ the code
Will do.

> > only sets the  S2 bit but not the IPA.
> If this is a fix, please add the "Fixes:" tag and fixed commit sha1.
Will do.

> >
> > This field has the same bits as FetchAddr in F_WALK_EABT which is
> > populated correctly, so we don’t change that.
> > The population of this field should be done from the walker as the IPA address
> s/population/setting? I am not a native english speaker though
Me neither :), I will change it.

Thanks,
Mostafa
> > wouldn't be known in case of nesting.
> >
> > For stage 1, the spec says:
> >   If fault occurs at stage 1, S2 == 0 and:
> >   CLASS == IN, IPA is UNKNOWN.
> >
> > So, no need to set it to for stage 1, as ptw_info is initialised by zero in
> > smmuv3_translate().
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c | 10 ++++++----
> >  hw/arm/smmuv3.c      |  4 ++++
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index eb2356bc35..8a8c718e6b 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -448,7 +448,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >       */
> >      if (ipa >= (1ULL << inputsize)) {
> >          info->type = SMMU_PTW_ERR_TRANSLATION;
> > -        goto error;
> > +        goto error_ipa;
> >      }
> >  
> >      while (level < VMSA_LEVELS) {
> > @@ -494,13 +494,13 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >           */
> >          if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
> >              info->type = SMMU_PTW_ERR_ACCESS;
> > -            goto error;
> > +            goto error_ipa;
> >          }
> >  
> >          s2ap = PTE_AP(pte);
> >          if (is_permission_fault_s2(s2ap, perm)) {
> >              info->type = SMMU_PTW_ERR_PERMISSION;
> > -            goto error;
> > +            goto error_ipa;
> >          }
> >  
> >          /*
> > @@ -509,7 +509,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >           */
> >          if (gpa >= (1ULL << cfg->s2cfg.eff_ps)) {
> >              info->type = SMMU_PTW_ERR_ADDR_SIZE;
> > -            goto error;
> > +            goto error_ipa;
> >          }
> >  
> >          tlbe->entry.translated_addr = gpa;
> > @@ -522,6 +522,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >      }
> >      info->type = SMMU_PTW_ERR_TRANSLATION;
> >  
> > +error_ipa:
> > +    info->addr = ipa;
> >  error:
> >      info->stage = 2;
> >      tlbe->entry.perm = IOMMU_NONE;
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 2d1e0d55ec..9dd3ea48e4 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -949,6 +949,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              if (PTW_RECORD_FAULT(cfg)) {
> >                  event.type = SMMU_EVT_F_TRANSLATION;
> >                  event.u.f_translation.addr = addr;
> > +                event.u.f_translation.addr2 = ptw_info.addr;
> >                  event.u.f_translation.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -956,6 +957,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              if (PTW_RECORD_FAULT(cfg)) {
> >                  event.type = SMMU_EVT_F_ADDR_SIZE;
> >                  event.u.f_addr_size.addr = addr;
> > +                event.u.f_addr_size.addr2 = ptw_info.addr;
> >                  event.u.f_addr_size.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -963,6 +965,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              if (PTW_RECORD_FAULT(cfg)) {
> >                  event.type = SMMU_EVT_F_ACCESS;
> >                  event.u.f_access.addr = addr;
> > +                event.u.f_access.addr2 = ptw_info.addr;
> >                  event.u.f_access.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -970,6 +973,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              if (PTW_RECORD_FAULT(cfg)) {
> >                  event.type = SMMU_EVT_F_PERMISSION;
> >                  event.u.f_permission.addr = addr;
> > +                event.u.f_permission.addr2 = ptw_info.addr;
> >                  event.u.f_permission.rnw = flag & 0x1;
> >              }
> >              break;
> >
> After taking into account above comments,
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 
