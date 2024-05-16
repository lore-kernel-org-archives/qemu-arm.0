Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1420309ejl;
        Thu, 16 May 2024 07:50:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWev6kNDLWHhmL9czY7nBvATZj1qAHM6PSZbJFNHxMgg1z52kKyPdh1A9x/F08ZZQze4q5whP87daA7uEySuEkZEzf8luSk
X-Received: by 2002:a05:600c:4585:b0:41f:cf63:3ace with SMTP id 5b1f17b1804b1-41fead65ab1mr129532695e9.34.1715871051592;
        Thu, 16 May 2024 07:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715871051; cv=none;
        d=google.com; s=arc-20160816;
        b=z5uhbQd98CW3ATx1aDpx18TpTjcxbQGNLCA8wWLqh6iYa1kMYVO0hvSuPzSdMQnxm4
         wC/dlmzQm5XOgnaVhqxTVysDk9B7pg5aVjr0JBeMPgsr8JPZkLomVtFMFiGVj32X3AY4
         p/x/2Q2ZAMDNF9KOVmJRlZBPZEnNDvvaokOivS5AoDd94hG8l749zZrRb0KGMCpxAfHy
         xfWAFy3Qk7dcNfctsQcNuievmVcjQRg+fj7XKB4YQUIaw0wEoB0obHS15tiwTB/zz5Ah
         AgNDYZnG5e3xPUi5m7rs4svVwbO32TV5jdkVYr2H31T66aLn0NaVitPfR8LLdrm8an3d
         7zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0fMJVCubVaRpMDCSR7hSQVqaNqRKdkVSa3v5hqLU758=;
        fh=buSXzjZM122wj0dSnVzt2JNcXHUdNmB8DTfA24TBg7Q=;
        b=XgMQ5VvvByI10gDDo7wD/eMUd3HAPQLxK9tHt2d7AzEidPUNXIlXOh9UlH/VKipCuB
         92oU81GDTB4ska7fW4m7/ZGnDdowDKhLiwuahr+F6qwBYJaW1uxDIagY0lLbG9p3DVGJ
         VM5//Jcf8RVmuvf+6K+MrU/9u6AXXGAbY8eJ0u1xBVU1devhHwtDx9ZEa5BrnTJBOVPL
         5Er7sXJHCANgEPBFqe96p/XT5swFXTFG0aQrjfbAG0LYW3vkakzLk1Yhj7NfrsL4mCXX
         8URkg2JAOIK/v39yFBnynGOtgeXONHwJPfmc1KUUoCgMiDIJAjbnJhwVBdJ9BpWd5zbp
         mFcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wvIqz39t;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4200eeccf70sor4199475e9.10.2024.05.16.07.50.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2024 07:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wvIqz39t;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715871051; x=1716475851; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fMJVCubVaRpMDCSR7hSQVqaNqRKdkVSa3v5hqLU758=;
        b=wvIqz39tQwZ0oCLmRbAIfqjpuAvseWOHoDs/Qa6AnAOeEkWJ+1FpTNWbomJTFCA68S
         edmHpCtYxH56HvFm/BahlfUqiCGU1rp6hjlJIb/DsBBYFWHU1Gsc/NA9H8OU4nTzGdCB
         DXRokptC4useQZCppPGhlFBMmmPCASN5dDoQp3Zh5IJBBxGLB+8S6SEQD8K5CVqimHgN
         aSXnxBH2mmE76IL2ISSpv3Pqjf/xzg4zg9DEsZ+i6df0X7ykSomV3PDvZ19vbor5vboQ
         syba8AWjNjHlGWHEzKaN4aJk/jAzFbkVqphc+eyKH/pL5c9V5LhXwukzxmhhWdHX04TJ
         TtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715871051; x=1716475851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fMJVCubVaRpMDCSR7hSQVqaNqRKdkVSa3v5hqLU758=;
        b=M9njvX9P5xsKcHwpbToNL0vopb+7eFZzz4sux5XOl6Q9cnG+SKo6h80Gs+WqtVpv04
         tfLXKr+Tip+nu9QBeCeRiJQnfIubAOkse7+vn41bpH5SaV08rJDk4ZXG2HyLpXaUzcL3
         ZtlLumGMeFXqqHe7Tf6voQjLmRzSraVmoPKekJILENT37FBkWsKoQhNutGG3GqRLDzCz
         bvTzJs6V+gYTnPDLMGbDfvkNDgYTSs6ATMsV7h/BDGydmXrZeBqBXLORbUMrRf6Q3jZ8
         nwE1CSg+3zbuqYvKAsyHqhbu8RtKZT+AY6g17vum+KtPQT3y6n5nRv/5PboNY338C6ww
         3DTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/Sc9QimF/LGuZbdMI7qviwtpEMfrdJn0pBbfJyGsUywCwaVYo0m4HwLkz9zzs9/h8ZdC5/KzgJX2QqKamDDtX+lG9muJ/
X-Gm-Message-State: AOJu0YzIZWdNOkQQL5mu3jKN4nRE4ydV8yJNDAv+ejMp9C04b8nGhH1L
	rheMEr83oPsEUd273vpRM89gcRVjAQ5sUo4BV8XNqEYzQbblag3ijLwyd+9EOQ==
X-Google-Smtp-Source: AGHT+IGvBKsbNqZ2C0szf2K5UUJxaiEKlzZXy+jJ37XfQmuXY8ZsvfRD+1ZL+U1yCM1ZmC63Av/JWQ==
X-Received: by 2002:a05:600c:5010:b0:41b:4c6a:de6d with SMTP id 5b1f17b1804b1-4200f8b159fmr11168565e9.5.1715871050937;
        Thu, 16 May 2024 07:50:50 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3518d817ee2sm15520099f8f.2.2024.05.16.07.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 07:50:50 -0700 (PDT)
Date: Thu, 16 May 2024 14:50:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 03/18] hw/arm/smmuv3: Fix encoding of CLASS in
 events
Message-ID: <ZkYdRmCf4KJzIe9a@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-4-smostafa@google.com>
 <2ca04dfa-61bb-4f35-954a-b5f107bf8f36@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca04dfa-61bb-4f35-954a-b5f107bf8f36@redhat.com>
X-TUID: tutQIyO5WCRB

Hi Eric,

On Wed, May 15, 2024 at 02:27:45PM +0200, Eric Auger wrote:
> Hi Mostafa,
> On 4/29/24 05:23, Mostafa Saleh wrote:
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
> > While at it, add an enum for class as it would be used for nesting.
> If this fixes somethings please add a Fixes: tag.
> 
> Also you may add that until nested gets implemented, CLASS values are
> the same for stage 1 and stage2. This will change later on.
Will do.

Thanks,
Mostafa

> 
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3-internal.h | 6 ++++++
> >  hw/arm/smmuv3.c          | 6 +++++-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
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
> > index 9dd3ea48e4..1eb5b160d2 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -942,7 +942,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              event.type = SMMU_EVT_F_WALK_EABT;
> >              event.u.f_walk_eabt.addr = addr;
> >              event.u.f_walk_eabt.rnw = flag & 0x1;
> > -            event.u.f_walk_eabt.class = 0x1;
> > +            event.u.f_walk_eabt.class = SMMU_CLASS_TT;
> >              event.u.f_walk_eabt.addr2 = ptw_info.addr;
> >              break;
> >          case SMMU_PTW_ERR_TRANSLATION:
> > @@ -950,6 +950,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_TRANSLATION;
> >                  event.u.f_translation.addr = addr;
> >                  event.u.f_translation.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_translation.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -958,6 +959,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_ADDR_SIZE;
> >                  event.u.f_addr_size.addr = addr;
> >                  event.u.f_addr_size.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_addr_size.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -966,6 +968,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_ACCESS;
> >                  event.u.f_access.addr = addr;
> >                  event.u.f_access.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_access.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -974,6 +977,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >                  event.type = SMMU_EVT_F_PERMISSION;
> >                  event.u.f_permission.addr = addr;
> >                  event.u.f_permission.addr2 = ptw_info.addr;
> > +                event.u.f_translation.class = SMMU_CLASS_IN;
> >                  event.u.f_permission.rnw = flag & 0x1;
> >              }
> >              break;
> 
