Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp898016njk;
        Wed, 17 Jul 2024 08:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+R08zL+nCv/yyK3At3ZdEfyZfaShNoBHqHQdm004jcrxF/mkt4/344zzy29RdtHIJYWxQzxdryuWEZQO9ZFvt3FYkyDOx
X-Received: by 2002:a05:600c:450f:b0:426:5cef:ee41 with SMTP id 5b1f17b1804b1-427c2d109bemr15221145e9.38.1721231902998;
        Wed, 17 Jul 2024 08:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721231902; cv=none;
        d=google.com; s=arc-20160816;
        b=iTzyKnAlqbUpsuC/H7sa3iOqjjvacTLTHqKxBczxpXC4AUJkWqJ5Dmr/KkJQrYEens
         Ti4K6B3eB/YxFHNyCd1L/Dov0N1ggKe27HE7YZd2rkQIrS0kYS2Vq5+PgkDL3BamC1CC
         aujlAfMnDHzEFjquvpE1jvBnbnrCVutNhy/KBmTXBfTCLdXHVf+2TwzsAvTIfmR/Psfk
         ud4Cx8DJxqzHTE0KMFsmr4WHDur8fmxunzVdAw9xjWIvzOgf78YdFSuW7cv+CDG3yeJq
         0a+u+BaQLzkxkYe7JjTQ9L41ynh0ZEVl8luBitvdhC/36DaExT5GF4Hv4HxTtlmSr4hg
         l1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zouCLbYmcFgjAK4qv2JS6bT2SWhM3WRMe4azkl1Evik=;
        fh=b9zDlCK8pKYJBZYotnTJ72mDvwLEletVU8QpKVLfAk4=;
        b=jA72OQNi7tP41cMgNxlYCP+m2tRvjPpC65IFdGuklqpUFv6A1Q0LP8blID2jZs9ByM
         Jn9uoEJ7LoSzcwxD0clMT5BjiTtpWh46e7IVeSnH+Zu+zzrm6ISjrTL4RulUilrMplaY
         6TyUqMYbfD8Ggms2vzIHU3twcDrzSmCzVCGu3zj8mOa+uksBGAt4Iflj+x4VbT9tDIDD
         i0ku2uDY74SgboGJ5uXaewvuXlfEJ3CcfeLOfvmQ3TRdxH2HNKBCYRxAV+qWBfFj/8xE
         9JDDbB44WcFY9Q8cWZ9RmLlboZMn+4+wJe30/U0QUKJHwBMk0T9HePWSTzzZVwJRfHAN
         rJ9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kV4EDuCE;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427b8553944sor15930225e9.4.2024.07.17.08.58.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jul 2024 08:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kV4EDuCE;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721231902; x=1721836702; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zouCLbYmcFgjAK4qv2JS6bT2SWhM3WRMe4azkl1Evik=;
        b=kV4EDuCEzKPT76wfV+JI66z9uUtttyGlBYqxwHEyu1y7XMeloVfv2XeurvJy7nMPK7
         VxKB43WbsZ6s7U4/W3FPNl30qxutOuPfM8x+0FPpUElbVGXjWoI039aNPRSWX3Mlq9Ka
         XJlxEtsMPCtOLglpbC+Y/vA64l019iOjySCKe0ffdoIRALRZHQ/RFIVbl7B2meFSMYaR
         1055Gi/BwLiwhuW/Q7EH2i24gf/iJWaqrXypjLfi0Q6fR6Urb3JSvevoEppdZpfxxjEH
         /c1TR8tQ/IIwm/VQ/BWqgobMbfsc4dCBIKSx5k+lA5CsafqLPG6q1v9PFO+Pclnj4wF7
         9wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721231902; x=1721836702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zouCLbYmcFgjAK4qv2JS6bT2SWhM3WRMe4azkl1Evik=;
        b=bIt7RPOeoYNuJZljlcDn5r1zS47LbUiblE3q2vrfSimhwbYClwyUY2M8mddmlk6Za5
         YuiS0l9m+LGD8ymmgLVrcvuiu0eeK+SSIhA1vdVT+7cIiZZEs4qSz9ndfdsgDYmPsCTk
         /07gkawezc6sg7iaNP4zs4hLTm7/PhrUw3C2oqWdbV+BDtZf88r4W48YyghM076q/CXQ
         EkKZeRsd8TKaA1fBbXDy7zXANTC98xnWbVVIYB+j3HKkSPhilonFbgCt0DloWBWFD1Se
         BASkOwrQSVY3he1AgyeyWlNojrpr2sJJkeBcBTZ2OeXalsz2pAc7mEEHadi8015kNk5S
         1U8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAIdQI7wfvYHLzlP67FORxaI0z/KgctbW/dEaKw95qxgrwoMVRF5oRTLRCsP3i+ke3JAJDD0IWyrnm7vrruAt+CHSIhfg9
X-Gm-Message-State: AOJu0Yyz6xgDvqkUszNqTFSdafUiXWq7Eba3QOi0xspuHmiKxT8N0V3A
	gMC4PIS2LomtmSRHTQD3yAPovMlH4pANiQZ4jNu91LPUJ1hOvjob88pLTHuLwSm6YA==
X-Google-Smtp-Source: AGHT+IH+Y/IUuU8cJdZrUYcb1gvil/YDFOURR7qNRgqSIEyxRxH6Yz0egIuyQtufE2EoYSpGtJGilg==
X-Received: by 2002:a05:600c:450f:b0:426:5cef:ee41 with SMTP id 5b1f17b1804b1-427c2d109bemr15220915e9.38.1721231902398;
        Wed, 17 Jul 2024 08:58:22 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c77b0300sm2801635e9.12.2024.07.17.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:58:21 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:58:38 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com,
	julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v5 03/18] hw/arm/smmuv3: Fix encoding of CLASS in events
Message-ID: <20240717155838.GA4073279@myrica>
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-4-smostafa@google.com>
 <cb687788-4bf4-4bc1-94e1-5f023b731b9c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb687788-4bf4-4bc1-94e1-5f023b731b9c@redhat.com>
X-TUID: qv7RR4bbUxBd

Hi Eric,

On Wed, Jul 17, 2024 at 05:07:57PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 7/15/24 10:45, Mostafa Saleh wrote:
> > The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
> > class of events faults as:
> >
> > CLASS: The class of the operation that caused the fault:
> > - 0b00: CD, CD fetch.
> > - 0b01: TTD, Stage 1 translation table fetch.
> > - 0b10: IN, Input address
> >
> > However, this value was not set and left as 0 which means CD and not
> > IN (0b10).
> >
> > Another problem was that stage-2 class is considered IN not TT for
> > EABT, according to the spec:
> >     Translation of an IPA after successful stage 1 translation (or,
> >     in stage 2-only configuration, an input IPA)
> >     - S2 == 1 (stage 2), CLASS == IN (Input to stage)
> >
> > This would change soon when nested translations are supported.
> >
> > While at it, add an enum for class as it would be used for nesting.
> > However, at the moment stage-1 and stage-2 use the same class values,
> > except for EABT.
> >
> > Fixes: 9bde7f0674 “hw/arm/smmuv3: Implement translate callback”
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3-internal.h | 6 ++++++
> >  hw/arm/smmuv3.c          | 8 +++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> > index e4dd11e1e6..0f3ecec804 100644
> > --- a/hw/arm/smmuv3-internal.h
> > +++ b/hw/arm/smmuv3-internal.h
> > @@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
> >      SMMU_TRANS_SUCCESS,
> >  } SMMUTranslationStatus;
> >  
> > +typedef enum SMMUTranslationClass {
> > +    SMMU_CLASS_CD,
> > +    SMMU_CLASS_TT,
> > +    SMMU_CLASS_IN,
> > +} SMMUTranslationClass;
> > +
> >  /* MMIO Registers */
> >  
> >  REG32(IDR0,                0x0)
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 9dd3ea48e4..3d214c9f57 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -942,7 +942,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              event.type = SMMU_EVT_F_WALK_EABT;
> >              event.u.f_walk_eabt.addr = addr;
> >              event.u.f_walk_eabt.rnw = flag & 0x1;
> > -            event.u.f_walk_eabt.class = 0x1;
> > +            /* Stage-2 (only) is class IN while stage-1 is class TT */
> > +            event.u.f_walk_eabt.class = (ptw_info.stage == 2) ?
> > +                                         SMMU_CLASS_IN : SMMU_CLASS_TT;
> does it match your expectations. While reading your previous comment I
> have the impression what you had in mind was more complicated than that
> 
> * s2 walk that encounters EABT on S2 descriptor while translating
>   non-descriptor IPA is reported as class=IN, even when doing s2-only.

At this point we only support single-stage, so I believe this is correct:
	"A stage 1-only table walk that encounters EABT ... CLASS == TT"
	"translation of ... in stage 2-only configuration, an input IPA...
	 CLASS == IN"

Later in the series this code changes in order to support nesting, but I
think it's still correct, because the EABT class works similarly to
translation errors, except for stage-1 faults which have CLASS==TT

Thanks,
Jean

> 
> Thanks
> 
> Eric
> 
> >              event.u.f_walk_eabt.addr2 = ptw_info.addr;
> >              break;
> >          case SMMU_PTW_ERR_TRANSLATION:
> > @@ -950,6 +952,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_TRANSLATION;
> >                  event.u.f_translation.addr = addr;
> >                  event.u.f_translation.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_translation.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -958,6 +961,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_ADDR_SIZE;
> >                  event.u.f_addr_size.addr = addr;
> >                  event.u.f_addr_size.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_addr_size.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -966,6 +970,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_ACCESS;
> >                  event.u.f_access.addr = addr;
> >                  event.u.f_access.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_access.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -974,6 +979,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_PERMISSION;
> >                  event.u.f_permission.addr = addr;
> >                  event.u.f_permission.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_permission.rnw = flag & 0x1;
> >              }
> >              break;
> 
