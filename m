Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp194655njb;
        Thu, 27 Jun 2024 04:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT6+2NYfDM0FnGx79kodZwk8QnM1TzrNiamMiJ17wrvasZlNAcff0L9jsOSS5atViEcqYx8oN5CSsIfGAeaBlA/yGRT4D8
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr7741629e87.46.1719489022819;
        Thu, 27 Jun 2024 04:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719489022; cv=none;
        d=google.com; s=arc-20160816;
        b=CbMbSDIp1E4ws/iCMcStRTy/gpr8jVMDupwOc8K2hPlXAsxwkI1HtZrUAR0iLvgR0O
         ZTMUuKgu0xZuxALEbFS3X3TKT6vLWLRZKdto8OR4uB8XYfK8nAHpP9JBSt7ycihNVmYD
         TqB0NLFAuQuxFefrPSIn/XjjucQl1myTK0XNPOxde7rEd9mwQroz5Jksdh5T5ZApgF06
         k6O2v9jwoxCpdmw9eUhcGSsi3E5ZJ15UuwXySctIRSX+FFmk5baclvrMOMKPms7mAlsg
         nG5cn/Abtmv2CgM93BwG/ms2u9ybprvPcjlxUuIUitkTTeM36CyMZKW6prjBIz/RUVbp
         VMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=e9P6rSk8vf64hp/l6OI3SI/PjxibwZs4WejYppaOX6Q=;
        fh=DdAMrGz071RmbXj6FkUBJ7bRSmX7G9XHhimsKS0s9Ig=;
        b=zmJWHexzzEsBLkSwitu5ROkJ4VAhXsgXfzLWNuiRvwaoefNBUpMJAyONiaPTrhh+rR
         Ylfrfh12fzt8aqAZSSJsSrzAJXOswDUYYcnbBMH0gNLDwE0T++9OmnO4rtX7xogqo4oD
         Q0nvrdV5tQDxyeeR2mNnl7K/b57TfCQS5dpyY8s/R656cyclCAKnAUa6OOHaDSgbv8q1
         fC8/Q0F7vTRAzGej1M4glMVwCR5rcOjfTj10dbgZ4ZhINE52FQ02ShGjwGzLG4HwX1X/
         P4hBPIgMTJ1ZGBSUbXHm3+oI0rg4eNAQF7T6op9axbTKGndLZ/P5QRrE/2UAuP317+Y+
         Ymrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2CjVroAA;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-424aa87ef40sor1937415e9.2.2024.06.27.04.50.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 04:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2CjVroAA;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719489022; x=1720093822; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9P6rSk8vf64hp/l6OI3SI/PjxibwZs4WejYppaOX6Q=;
        b=2CjVroAAS8g9HEUPINzs3IXvc3iAMxszaZGkIllPVLbcwtJZwY35kd0+fs9Ed2jAPa
         uu2/s/vLzfTGeOoCc6DDyBCvBrq2qck8V6tLKJhKvDq1w+rD0YmDIysXnyCQSKqGwWj5
         BOnLkPhzPlaZ0ANCZQMAO8fC+4bcw4s9qWp3bp2P1AvCsBYv4vxaVOebfmhI65vHHhW8
         MArldEHcXAU41aqONYOf2KFS8TCPrtdxo35gQs8FiGfwyDtOQki5NGcBYquisYe5qiAA
         uam8e0pv+ClVO9H64FkazdZCh4E9sYuXkdkwbS0VxWXeJfUgllc7dT+G4cjmFejj09oe
         L88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489022; x=1720093822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9P6rSk8vf64hp/l6OI3SI/PjxibwZs4WejYppaOX6Q=;
        b=hcD/ltoxjsJS+bSzlSoTzrvLpCjbKZylzQ9d2tv1kOGKIKPgaXOYHAHVFVbWCx5frn
         KhsTgK3Y5jbk6Ipt3X0WrWgdGPSxA01TvPp8AsZiSKeHUgTxEbvYzOpHONiwQREvEcMR
         9tO9O6SvB8BO5x5Vsx7OHWx5Eyat31gmU0rrdD6GObdenjbTDOU296hxTkH1mu8zfi55
         ydbG6SXTCZ7WEDuUTRL6F7skkAxtBL1K8zqvvdKLdMi68JwjCpX0rNZjHf2scEST2Fg5
         5y9135io+fHnaJ0UolG1td25JOXCgz2//pEsQyxR9V3Mlpci1UMln/47uXjY08KgO4Qr
         d54g==
X-Forwarded-Encrypted: i=1; AJvYcCU5pcWzIy5t95w3v3Vyf6QNiiUCktlcAWfsT88iaimzBwrQl/UF1Z8uZ0Aw/JKk4VXSZTIHkSmpqK3cVcalJvYRIJrjdtQd
X-Gm-Message-State: AOJu0YwtgjURnxnRq8GEmXMQAMuFHnNTKWLRXTXqviL1+pcf/oG/xW0L
	G9iC7J3Btjflcu20/BiKmtwLlgu0t9V520k2W6ueSAi8TtBUE08/ptD7SceU/Q==
X-Google-Smtp-Source: AGHT+IHF2+OWLkDVOlVs+eamxkFdARYG2bMOTEh+jiXREdWWJJJgTOLPwU4rS5i1HLRx+QKS9xzVFw==
X-Received: by 2002:a05:600c:3ba9:b0:424:891e:a9fe with SMTP id 5b1f17b1804b1-425641c24c3mr1459555e9.1.1719489021028;
        Thu, 27 Jun 2024 04:50:21 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82462a2sm63024555e9.2.2024.06.27.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:50:20 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:50:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 17/18] hw/arm/smmuv3: Add property for OAS
Message-ID: <Zn1R-BwOnSRpstw2@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-18-smostafa@google.com>
 <689f6ac7-86ce-482f-a59a-fd17f8a5216d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <689f6ac7-86ce-482f-a59a-fd17f8a5216d@redhat.com>
X-TUID: Ly5lhKHmJ1he

Hi Eric,

On Tue, May 21, 2024 at 11:32:48AM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:24, Mostafa Saleh wrote:
> > Add property that sets the OAS of the SMMU, this in not used in this
> > patch.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3-internal.h |  3 ++-
> >  hw/arm/smmuv3.c          | 29 ++++++++++++++++++++++++++++-
> >  include/hw/arm/smmuv3.h  |  1 +
> >  3 files changed, 31 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> > index 0ebf2eebcf..dd91807624 100644
> > --- a/hw/arm/smmuv3-internal.h
> > +++ b/hw/arm/smmuv3-internal.h
> > @@ -111,7 +111,8 @@ REG32(IDR5,                0x14)
> >       FIELD(IDR5, VAX,        10, 2);
> >       FIELD(IDR5, STALL_MAX,  16, 16);
> >  
> > -#define SMMU_IDR5_OAS 4
> > +#define SMMU_IDR5_OAS_DEF 4 /* 44 bits. */
> > +#define SMMU_IDR5_OAS_MAX 5 /* 48 bits. */
> >  
> >  REG32(IIDR,                0x18)
> >  REG32(AIDR,                0x1c)
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 4ac818cf7a..39d03e7e24 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -299,7 +299,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
> >  
> > -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> > +    /* PTW doesn't support 52 bits. */
> remove the point
> > +    s->oas = MIN(s->oas, SMMU_IDR5_OAS_MAX);
> > +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, s->oas);
> >      /* 4K, 16K and 64K granule support */
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> > @@ -1901,11 +1903,34 @@ static const VMStateDescription vmstate_gbpa = {
> >      }
> >  };
> >  
> > +static const VMStateDescription vmstate_oas = {
> > +    .name = "smmuv3/oas",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> don't you need a .needed function?
> 
> I tested backward migration and this fails
> qemu-system-aarch64: error while loading state for instance 0x0 of
> device 'smmuv3'
> qemu-system-aarch64: load of migration failed: No such file or directory
> post-processing ...

Yes, I think we need a .needed which returns if oas is not as default,
that should be backward compatiable (at least for this patch) and would
break when oas changes.

Thanks,
Mostafa
> 
> Thanks
> 
> Eric
> > +    .fields = (const VMStateField[]) {
> > +        VMSTATE_INT32(oas, SMMUv3State),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static int smmuv3_preload(void *opaque)
> > +{
> > +    SMMUv3State *s = opaque;
> > +
> > +    /*
> > +     * In case it wasn't migrated, use the value used
> > +     * by older QEMU.
> > +     */
> > +    s->oas = SMMU_IDR5_OAS_DEF;
> > +    return 0;
> > +}
> > +
> >  static const VMStateDescription vmstate_smmuv3 = {
> >      .name = "smmuv3",
> >      .version_id = 1,
> >      .minimum_version_id = 1,
> >      .priority = MIG_PRI_IOMMU,
> > +    .pre_load = smmuv3_preload,
> >      .fields = (const VMStateField[]) {
> >          VMSTATE_UINT32(features, SMMUv3State),
> >          VMSTATE_UINT8(sid_size, SMMUv3State),
> > @@ -1933,6 +1958,7 @@ static const VMStateDescription vmstate_smmuv3 = {
> >      },
> >      .subsections = (const VMStateDescription * const []) {
> >          &vmstate_gbpa,
> > +        &vmstate_oas,
> >          NULL
> >      }
> >  };
> > @@ -1945,6 +1971,7 @@ static Property smmuv3_properties[] = {
> >       * Defaults to stage 1
> >       */
> >      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> > +    DEFINE_PROP_INT32("oas", SMMUv3State, oas, SMMU_IDR5_OAS_DEF),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >  
> > diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> > index d183a62766..00a9eb4467 100644
> > --- a/include/hw/arm/smmuv3.h
> > +++ b/include/hw/arm/smmuv3.h
> > @@ -63,6 +63,7 @@ struct SMMUv3State {
> >      qemu_irq     irq[4];
> >      QemuMutex mutex;
> >      char *stage;
> > +    int32_t oas;
> >  };
> >  
> >  typedef enum {
> 
