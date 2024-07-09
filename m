Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3117489njb;
        Tue, 9 Jul 2024 00:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWt9zhhmFlrdQJbF0nNmWaAoQLEkgXlwiWXy7bKvr8+QL8bMr89ck7sdrtx5gpMmvVIHcLz0yJGYxiZkq7P3MGfgjU3M8aL
X-Received: by 2002:a05:6512:1246:b0:52c:7fe8:6489 with SMTP id 2adb3069b0e04-52eb99d6e61mr891684e87.63.1720509023499;
        Tue, 09 Jul 2024 00:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509023; cv=none;
        d=google.com; s=arc-20160816;
        b=jikls1ye/YQ8uF5rbRctTA8EjVLumdnbmpRAshFKri2K0+T6sCdZ1kpYxkkzB4NMHc
         j1J2UHMqr1tF9q7ib7h7QqqFG9Sw5sM0Vwz3rZ/W3RCH2ZdLB3O2czysxzqpYSd+fyXk
         BR8r62BBM4guw0Ls3YSJNZ1DPzz3QXranfDKqJjNoiLhZkgCwEmkXe/wCtgKillH13kp
         UCFkQK/PwnQ6pU7Jy6Gb66wYB8Cpb2OdmkbvjRMY2TOwBmEDdkXOInXEsEi0QrsaYDlj
         FtT8D+49suTeN1sTEdRi7EMTP11LXhzFed20VY5940DoyphpPbxFjyQIPH9ZT3k4ZB0v
         CJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Y8vgJfXVho0VbUzceXepsNZ+mEZe0DdY5f/omIsH+xU=;
        fh=BodysEVRoL9YbR0JcZxnIYUHDKZS8mrY1DtE3Ks+xfI=;
        b=SG7KwY+lVF83AhgIwZxan88439HyhT9dItKZ4sIn42ZdYvFKGRB8dFPv+lIxlC3bdU
         ZeFiSHWYsoeiMOWpwgMx8Y7YWfai72AROa/m+B3LQyb6ngW6M28o5KBLHebqqOO2YA3s
         cgCpBBwZFtVAQPQyYMDKsvKfyjWh+m2a8Y4Ka4nPKn0KeZMhXMs5lbzd5KJqhQ/+F2R7
         R8+IZxABBWycV/nUobJ7Ja3WYkMwEhfVhNAJ9PwpKgt4myp9OEREEUXbdsWWU0XV1wOp
         o8W6NamGdKc/P0TRf6dUQGmvo2h8An/RMKh8Fj1q8aym+vc+FL4fABx4lsnejoEu/sZZ
         vEpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QI6u2ZQL;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52ebacbf863sor22043e87.9.2024.07.09.00.10.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QI6u2ZQL;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509023; x=1721113823; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y8vgJfXVho0VbUzceXepsNZ+mEZe0DdY5f/omIsH+xU=;
        b=QI6u2ZQLU7rbNWbK3/6jvHxDdrFFD02wiXqpNgKun93bbpayjsbBtsI3X13wXV07fG
         d8jhGRZWtg+W4CWgiLy2CSyu9fuG4F7lyyJgE2uLkjdXsi/RvlMhe1otvQ6wh5f6bS+D
         GahhRqDlT9W37UXKDxKxMGq9carwNh13cu8z0ql4Ycrc+yRzT0+fmSzYvKj2F3vrOWTs
         U3vGnLrvtjuPHt5hRStOiYlF3PjCnY6+sTqvyk06N5UPoU6N0ukNbVr+P9ApUV9VvVdM
         BOLiMgqGg6r3o6jopTka4h/N+RAsqighIiNGAKbx+jg6I05S+zpmAkAO/A6Dvq+98Z6d
         svnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509023; x=1721113823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8vgJfXVho0VbUzceXepsNZ+mEZe0DdY5f/omIsH+xU=;
        b=GVFfFM1gChqONLhHF9wA8FIzHsEpBLMXQi6ubtWaDsF3Z41ohS79ugBl4y8EkOoLFd
         yze5j2qVX5pRaFHzb8YEzaVZf7eASnnFGTYxSFD5/Fji7znltMnGerwOO7yTHBSjJpaJ
         BkvYvQfHEtiPYO21S1bWBodIdYL6So/cwsk4E4xPTGYDel8n6ZzCxdJLcvp9hiFGCDSt
         F6dEaWm1wae7lAOyQWj6mzWcvOE45F/e4/W/0ldoVwewXs/fE72NFyDjHjJ17jjZt0PJ
         CbRf8HBRBsInOzvkQOlM/LG5OZY1eED+1P4LsAmadp2f+gJMHqdvvwNFMEF0Q7PLAMWA
         nVNw==
X-Forwarded-Encrypted: i=1; AJvYcCVeASS4PkyjqU42IsKS3qp7tQuzXSwuDt2DuM9kbpEg4gfWXWzvBd8KKTM47canlaOq3SyVAwUTYN8WpAy/OO5olRUBzAl3
X-Gm-Message-State: AOJu0Yw4gTIuVARAhB58TfgAQZJcywFZSUlSOtlFWLkRjokH4DpDKUA8
	XUAZqcPrqRL+Ac/Xs0UPcNrRzz3xviP7TR73QKN7Usl7Wbtmh3hKEzH/7fDSjg==
X-Google-Smtp-Source: AGHT+IFHb9DcF9zXH7hFJ7v22SS/9vv0LLX29yu/h9ZLyyoX9HO+ZVc5jNVMsNQ8Rf2aKLi2YeijKg==
X-Received: by 2002:a05:6512:3048:b0:52e:7b72:4f3c with SMTP id 2adb3069b0e04-52eb9a04ebemr92955e87.6.1720509022672;
        Tue, 09 Jul 2024 00:10:22 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa0613sm1640045f8f.88.2024.07.09.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:10:22 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:10:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 03/19] hw/arm/smmuv3: Fix encoding of CLASS in events
Message-ID: <ZoziWlJTCvAWmHXN@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-4-smostafa@google.com>
 <20240704180200.GC1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704180200.GC1693268@myrica>
X-TUID: oIj1qAvz+wWF

Hi Jean,

On Thu, Jul 04, 2024 at 07:02:00PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:25AM +0000, Mostafa Saleh wrote:
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
> > However, at the moment stage-1 and stage-2 use the same class values.
> > 
> > Fixes: 9bde7f0674 “hw/arm/smmuv3: Implement translate callback”
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
> 
> For EABT I think we have to differentiate S1/S2:
> 
> * s1-only walk that encounters EABT on S1 descriptor access is reported as
>   class=TT, 
> * s2 walk that encounters EABT on S2 descriptor while translating
>   non-descriptor IPA is reported as class=IN, even when doing s2-only.
> 
> Maybe it can be done in the later patch where you propagate the different
> classes, because it's a minor detail.

Thanks, for pointing it out. It is a bit tricky, for s2 only we need
class = IN which is easy.
But for nested, if we get a fault with s2 == 1 and EABT, we need to know
if it’s from:
- Translation of a s1 table IPA (translate_table_addr_ipa) as class => TT
- Access for s2 table as class = IN

We might need a new member in SMMUPTWEventInfo to distinguish this as
bool is_ipa_descriptor

Thanks,
Mostafa

> 
> Thanks,
> Jean
> 
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
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
