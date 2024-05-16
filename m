Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1449817ejl;
        Thu, 16 May 2024 08:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCmVsjPc3Ws882AqkxPWfWpFIVmJ20Mb6wXZKcLKExBOd2R6KXoPtxhXkXTMGK6pLgnL0W8KxP01vnbKPRMwRWI0WtzvY/
X-Received: by 2002:a05:600c:55da:b0:41b:e55c:8de0 with SMTP id 5b1f17b1804b1-41feaa3937fmr129279325e9.22.1715873406516;
        Thu, 16 May 2024 08:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715873406; cv=none;
        d=google.com; s=arc-20160816;
        b=fUqccQ6ZyU7z4sZ6eFrPlqkXGvKvV0BVWDuuGv6M5zj/yvwQp9h43SR00Pas1wr7mY
         cbU3l/RwIUFihpkqNPtIyEMsgFGtNqW8XAAv11314teNLHZL3xuW4I1G/CMDS9qN8nBe
         rqHBBR3WCMOehnVfCMCTCM7rHBtAB37AMhYh6FXcvBCzPJA2sdoG9ybufv9AmchO/3Nh
         7Kuwrcfybr03ApkKx30xWQ/zc5oczEpItLfqSPBiU14nX5uifjkEliQkpR/j+Vt1Efdh
         qfJpZUZo6USc2UOE0Jg62M1w+cAH1pJZrixPpjQSCGIHL79pUBTlv3PXk8eqaBkeC44A
         pm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jinLSx1Bi957v0doVAhmp1h/kFD3OvDhTl6ISPr3gNU=;
        fh=3Uh4MAkSUhZVj6mGkIoXjyOzkrKFOQSUoF1+dfOha8w=;
        b=HDIZW0lzQwVMCh7QE/SaOJSdKyq71ESAaLMskoUkZF/hUP2dsQQxp9KMnbWXGrU3uk
         3hZAOCX6K1V3FD8LJscnbrOH10e8b5+mGNNcRELilgmaFrDrlcuI8ZTTt2LLR5gRdxyQ
         z+HL8tMfjDacfBuIcM9zZ6RKi+AS1MVF46WFWSe7hpu+4Rho6K/1GSAsGZtZ2m7C0053
         cdU4tMS25Ke+Tq2v81zZcYLRfk0bgrTPsY6y/fSssap8U2LzOiTaFHOrtcMfC2sCtKxf
         VyW94pnSUpiWjTPSfK54MoQkHll8yDIYobjjkvDs6aUzZcwWml1GogDRR3X26a/RwidQ
         O/9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KlMwCFNi;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4201592a0adsor3682925e9.3.2024.05.16.08.30.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2024 08:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KlMwCFNi;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715873406; x=1716478206; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jinLSx1Bi957v0doVAhmp1h/kFD3OvDhTl6ISPr3gNU=;
        b=KlMwCFNi4T/EWnZVZYt7CnJz01mqu9lndt2wnah3ZqKA+iXsU0bAVJdGN1QQful1oL
         Hk9Wx+68UFKIbvpiFZRqEBLUcNMq09opiaspu5ceAe2TCnZFnsjZ9acleN6u7k8vpYO3
         AaWgkrgXtllUCAxKRbZ/TdsPP++G/wfDuyOUBiwey3fFqetO2ytgQYPabOfthSM2So5P
         H2M3K+6yEZ1br8rSdpZTmTA40fSSMituPEsI+uGNJ7LuKMECTE8u9vr4aBMxHnwjC0BX
         jtrCfucnn/C8HXmDZ6odd6J+zj6qmLDVbbKdDRuqDR+DFXo82O9tkOUCsXtfOEuazL4W
         /Exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715873406; x=1716478206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jinLSx1Bi957v0doVAhmp1h/kFD3OvDhTl6ISPr3gNU=;
        b=MiRsf0kVlX5fXsggOHYSHpyR528NdrIyvuxPn8SCsQDxUsT7+cQjimjQ6DwzmuyuSr
         YfUY/K1PrycbYEoL/7BwbISVjot5Ty5tJoqEM0986+8jamaLyZ8KN3SSljXnj0w4mwDu
         dwA0JdKPpK+t33Y3WA886wKyhz0zzUh6E4s4yPoB2AQe8z85uWdfh75mb5HxsjinPSNB
         o/7XWkCZ8OkyPutGEOsPx/rJypesFT2Dy6RMRnQ4F+mn0UY/3NgBf+9puR9NI0ggC0W+
         IYXL31vspShW74iiDYDjo6P0jw7U4Zu4FZVI+MnoJ7K1DEwQR8gZEimYa58/g0ScvLKS
         kq3g==
X-Forwarded-Encrypted: i=1; AJvYcCVdRyaoeqlzvzS9BQI+pBQ/1L/x+GAgicdQVusHS23ubJObgckQXSpju9f3PBbQG7+BJuCTPtXhO1Z/HovN9QyI+XjUqbB9
X-Gm-Message-State: AOJu0YzDzv1UMcWg+VwLa6RXeq+3lJdBT2QlL3Sx94KGrEY2+EnEDh5t
	vhQS8060+0f2sHLKMgTNZQndWOvge/dTyXVQ6/gEwr7FfxGSj2jb866klkphJQ==
X-Google-Smtp-Source: AGHT+IEQn1WPGq1X/VJV81JrV7ibIaep5s4Zt2ExJV4yXQect/QS33902BWt98J9Hmu6k510FE2fiA==
X-Received: by 2002:a05:600c:1e12:b0:419:b16:9c14 with SMTP id 5b1f17b1804b1-4200f8697eemr11861635e9.1.1715873405853;
        Thu, 16 May 2024 08:30:05 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41ff063d8cesm239609605e9.46.2024.05.16.08.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:30:05 -0700 (PDT)
Date: Thu, 16 May 2024 15:30:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 09/18] hw/arm/smmu-common: Rework TLB lookup for
 nesting
Message-ID: <ZkYmedM5uHf3DM2O@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-10-smostafa@google.com>
 <6afc41f6-7127-46f2-833f-6eb4abb2730d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6afc41f6-7127-46f2-833f-6eb4abb2730d@redhat.com>
X-TUID: Er8HSE7QEoex

Hi Eric,

On Wed, May 15, 2024 at 03:54:36PM +0200, Eric Auger wrote:
> 
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > In the previous patch, comine_tlb() was added which combines 2 TLB
> combine
Will do.

> > entries into one, which chooses the granule and level from the
> > smallest entry.
> >
> > This means that a nested translation, an entry can be cached with the
> that with nested translation
Will do.

> > granule of stage-2 and not stage-1.
> >
> > However, the lookup for an IOVA in nested configuration is done with
> > stage-1 granule, this patch reworks lookup in that case, so it falls
> > back to stage-2 granule if no entry is found using stage-1 granule.
> I should have read that before commenting previous patch ;-)
> Anyway this shows that something is missing in previous patch, at least
> the above explanation ;-)

Yup, I can add a comment in the previous patch or reorder them, let me
know what you prefer.

Thanks,
Mostafa

> 
> Eric
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 0d6945fa54..c67af3bc6d 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> >      return key;
> >  }
> >  
> > -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > -                                SMMUTransTableInfo *tt, hwaddr iova)
> > +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> > +                                                  SMMUTransCfg *cfg,
> > +                                                  SMMUTransTableInfo *tt,
> > +                                                  hwaddr iova)
> >  {
> >      uint8_t tg = (tt->granule_sz - 10) / 2;
> >      uint8_t inputsize = 64 - tt->tsz;
> > @@ -88,6 +90,24 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >          }
> >          level++;
> >      }
> > +    return entry;
> > +}
> > +
> > +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > +                                SMMUTransTableInfo *tt, hwaddr iova)
> > +{
> > +    SMMUTLBEntry *entry = NULL;
> > +
> > +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > +    /*
> > +     * For nested translation also try the s2 granule, as the TLB will insert
> > +     * it if the size of s2 tlb entry was smaller.
> > +     */
> > +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> > +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> > +        tt->granule_sz = cfg->s2cfg.granule_sz;
> > +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > +    }
> >  
> >      if (entry) {
> >          cfg->iotlb_hits++;
> 
