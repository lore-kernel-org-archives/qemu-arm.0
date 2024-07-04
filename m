Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp769278njb;
        Thu, 4 Jul 2024 11:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBmpzloZRM0sYu0HXnAM3UzX5BjM4ZOhmmBitUtiPNMLoxfOpTgkB4OKmFrGgbYEA6BKDdgHmUNDU+U2gHtlQACMgRifA6
X-Received: by 2002:a2e:be0e:0:b0:2ec:500c:b2e1 with SMTP id 38308e7fff4ca-2ee8ed3d2dbmr20403391fa.5.1720116108961;
        Thu, 04 Jul 2024 11:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720116108; cv=none;
        d=google.com; s=arc-20160816;
        b=Tmqje7pY6tOloJL8jZNYO2sCF24Iy+QLWSgMMlzaM/r80vQe7iZEdacoji4A9LAMSZ
         DhjDj8kcxDTbARKTbXFalKwl6QYZnzj339MdiqFmtd807J6djRf5YSsGXNgvOSxfdF0I
         ducmFYcDmU6GzIVkWotYAEMYMFkCGOvD3XIMk4TmkxgPc/U6QxG9fUIoHR98o9YsubDM
         MAKCYm+auJ53zug6mgCxSlBm2mOW4vJF+hjyI6ShKCfflAhHEuhNUT2egyH3IvfhyPh/
         rxvnjI9acMLCWCldzXgtNbTiWStvl+AfHohPUku9pk+bdgY1D4UFEqUd2/ZuL4wZB6Rd
         Tw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=MzoctlUTiSFA9iUoFOMhm1Km2jWzaVUvPlzy/f/ntRQ=;
        fh=gjv6RG5nRbH0I1B199jetnUK6usfi228yb9QkUWFIZ0=;
        b=SFrsYgBcC8guWmVaAF1KQdDExfKFFf5IpDBPsoqwzFYoaNHW1Vo96u2s9u+SAmyPOx
         mCa2EiIccjinwbmWIIA5X0vN+1PClX/92fz19ghNBpGTuNMQcFeuTUxYUztH3zlSonRp
         AZtIVDNiaqBZE9WwowaMMRSC0nekVVHY/PHiPXP0RXNng1RMTWk7OSdOpO6O3tAwZCZV
         mvULhW1IwagvEb4tuR+coifOMOOfUXbfIP2eRJMU6IAPPWTslVPzuUT3/5i4exKTNB6u
         0lYKvl6DXkaW78zOKsH4244c2KJeSgiWRdMKJxNyBEL238D9/zClvue6Q7HzNfp4mKdE
         6+Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pNCny14n;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ee91034316sor3523321fa.9.2024.07.04.11.01.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pNCny14n;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720116108; x=1720720908; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzoctlUTiSFA9iUoFOMhm1Km2jWzaVUvPlzy/f/ntRQ=;
        b=pNCny14n9UPEsvMrugDmBYH3pCHG3vCtozed1SSkIqEjUcFVIVaH3IVbT0+pG/bbgk
         OQd1W1fMFdNTyxOMj7Sw+azD0+yu91XJhOsoja3e2g0I2wDetrii3Xw+oyNoyn+6MGC+
         YHb5yXybTofcSb5xE6YUSBvmPqrbhQPKLEeUc5ZfXwZP6e3/LoiYVpaeFFYPlEv7WrX5
         MgN0eoU7psiC+CuBb73GYKXsGyP3IFBKxhOfoRHVo6U2ldXj6S4lLD8+RbaMMAPYouPI
         m8OwcBCH+uEXXU6JiUz6FXoaP/EY7wgqvwI6isDnmMhERgkmRFfOlr3ufwoQGy3n4HWj
         CmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116108; x=1720720908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzoctlUTiSFA9iUoFOMhm1Km2jWzaVUvPlzy/f/ntRQ=;
        b=Joj1XcpuqJIgdnGtc9DUiAkrIIWfifQHNSrWHIeGar1NeF/He+pkrR/DUlsjdxb7ae
         tR3hVTyGwWeGY9uVHZT6wiR5Qrne92+/9vbkUnGLxwC8ckVRYspO+WzpkVdZ8DpSqN/L
         NIpqCgncW1Kl5TitTxROhe/Oz94vVmpfsxVQJxUOolp+p9+cyNRkj0pIZr50j+EgX2Xo
         zjdTGRfnD6hXUaC1u4mrY5xZRuuEog20PCMFHQ6/NpE2h3i+CBPAEFViLac2hO02pPD3
         UR0pU2pk3NWxmVEeXgJAcULv7I528GSiiETSdE7vnU8IT3h81Z1arepyaSSvmERpW9nk
         5UGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbFtmJ0tJjS7ICRIPkKiBoyqs3+FasCzFeJYUdGx8dbrBkP/iuyEeIPzKKXBV4kcQeU+bcsbezsHJDuuv+JTCQ/bWIO13P
X-Gm-Message-State: AOJu0Yxq2LzeMxactxEJkxmeDsr3ZC2Lp3ANyOlW+52FxywcCL8WSb1s
	3pR9wfy5rL3lXmruox5Uz3+0QEi3+kfHaDBHeLvdlRQyrce4ppr/+2UyqVIplwqwdg==
X-Google-Smtp-Source: AGHT+IGWlUZflrOohLJm9FWDJ2ZIwkpKWiMbT6ZmSab8MO7lnu3U8gyuyVMB8rG/qS8O7YCf6JkYHg==
X-Received: by 2002:a2e:9953:0:b0:2ec:3e02:972a with SMTP id 38308e7fff4ca-2ee8ed3df76mr16794871fa.11.1720116108203;
        Thu, 04 Jul 2024 11:01:48 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a494e7a1sm613421f8f.112.2024.07.04.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:01:47 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:02:00 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 03/19] hw/arm/smmuv3: Fix encoding of CLASS in events
Message-ID: <20240704180200.GC1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701110241.2005222-4-smostafa@google.com>
X-TUID: is7trPUBNFAh

On Mon, Jul 01, 2024 at 11:02:25AM +0000, Mostafa Saleh wrote:
> The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
> class of events faults as:
> 
> CLASS: The class of the operation that caused the fault:
> - 0b00: CD, CD fetch.
> - 0b01: TTD, Stage 1 translation table fetch.
> - 0b10: IN, Input address
> 
> However, this value was not set and left as 0 which means CD and not
> IN (0b10).
> While at it, add an enum for class as it would be used for nesting.
> However, at the moment stage-1 and stage-2 use the same class values.
> 
> Fixes: 9bde7f0674 “hw/arm/smmuv3: Implement translate callback”
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h | 6 ++++++
>  hw/arm/smmuv3.c          | 6 +++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index e4dd11e1e6..0f3ecec804 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
>      SMMU_TRANS_SUCCESS,
>  } SMMUTranslationStatus;
>  
> +typedef enum SMMUTranslationClass {
> +    SMMU_CLASS_CD,
> +    SMMU_CLASS_TT,
> +    SMMU_CLASS_IN,
> +} SMMUTranslationClass;
> +
>  /* MMIO Registers */
>  
>  REG32(IDR0,                0x0)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 9dd3ea48e4..1eb5b160d2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -942,7 +942,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.type = SMMU_EVT_F_WALK_EABT;
>              event.u.f_walk_eabt.addr = addr;
>              event.u.f_walk_eabt.rnw = flag & 0x1;
> -            event.u.f_walk_eabt.class = 0x1;
> +            event.u.f_walk_eabt.class = SMMU_CLASS_TT;

For EABT I think we have to differentiate S1/S2:

* s1-only walk that encounters EABT on S1 descriptor access is reported as
  class=TT, 
* s2 walk that encounters EABT on S2 descriptor while translating
  non-descriptor IPA is reported as class=IN, even when doing s2-only.

Maybe it can be done in the later patch where you propagate the different
classes, because it's a minor detail.

Thanks,
Jean

>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> @@ -950,6 +950,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
> @@ -958,6 +959,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
> @@ -966,6 +968,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
> @@ -974,6 +977,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.addr2 = ptw_info.addr;
> +                event.u.f_translation.class = SMMU_CLASS_IN;
>                  event.u.f_permission.rnw = flag & 0x1;
>              }
>              break;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
