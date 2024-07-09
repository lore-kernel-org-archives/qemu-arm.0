Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3121366njb;
        Tue, 9 Jul 2024 00:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMUuYB3F+q+mGibL3JeGy8DeULrBPRJra1iNf3PRLEQShyzKcnrFsqYLeqH/ZGce1ZqkEPOIQ3qAArE2rtD+Ne3ch84won
X-Received: by 2002:a05:6402:17d4:b0:582:9fb8:11a1 with SMTP id 4fb4d7f45d1cf-594bcaaf426mr1045353a12.35.1720509682069;
        Tue, 09 Jul 2024 00:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509682; cv=none;
        d=google.com; s=arc-20160816;
        b=U1DRAgEqFJzehtxEFm6ljIj2w78u2Xf+ZGg7sW9ZzciTiVc80mCsdZhSNVthQ5to+q
         iQq/AB6ByQcGh1SI9MsacV/fj4153tRJC3la9Jlr+Eisy79e4efxcjWG0qJSvLbPsPuo
         3EaG1znzaxHevNnZ3WDVuXg6W/uy09m8nasE1OQaj1fJXv0Vxib4Rg/hQQ4Bvheslus9
         C+8IXD0XnZIVb2U+39Gb/a9yTreNuZZs6UphO9PA2y1aquaJFB7FTXdzgtIODWQ2IXYW
         R2rzottCTYtytnKQv7aThUWp+8N/uImrEL0oKPzitenC9/6ZrBzZEJw6uZOZgY4TpRMt
         qBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gIkOsfO4MWR8FV0BxCpeB1qOa5jyLB5kgFJtPbMATAo=;
        fh=p7VVDoLQL79rtp14GEiBQ7hPsRzF0p7QddijW58x7RU=;
        b=BN+zjPNYAoyocoDq//pqmT8yu30nHno9JLmCNBmmje+hFkQ2Mg7ijNg24MJmiDoYq6
         gLrJqsuer1ovFX2rGgm859j2856/UnrOUuM0kwpYNu6vVchx9PCJw/76anrDfJ2fIXmu
         nLi//vjCCCYbzjykx7EoF2lfyZeelVGEsBtGyEMOqTtzEnVF0Ue8PJZ54HR0gL1dr4PD
         GBdtIqE4+Hz3beX6SnobvAZTFG4beaONlzymvo91ht8iPGyDL371fz44ACm0nLZWVe52
         w4XaOAea0uGQrmGxsxn3UQwHRYu5xkU0NVwVTrJgHqNfp+UPIkr8spHwHYgTXap27HVc
         WhJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=I7EPgmIV;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-594eb0909dfsor62103a12.8.2024.07.09.00.21.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=I7EPgmIV;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509681; x=1721114481; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gIkOsfO4MWR8FV0BxCpeB1qOa5jyLB5kgFJtPbMATAo=;
        b=I7EPgmIVSLuiHoHgb5VXmXxS7Imc7i1fQt/9GG5kGhNEK9dPmZHJE/dzvQ1Gh+cghI
         /h9YEEdNku71FPae+DrkATnbWNdKqtlppRlBBBZbpfOiS6BccVbrvKmhi8IejqILCWUn
         oM+JkKPxPa/0NVB/4yLSD2Tmx4qEIv4ufYDjcCrKxnWiyTZto7Xo+ew/eQbFmNn7CizY
         sIDGCcr1OTmGaan9gr6KKFR8FJib0tjUOcS/kyd6iuGRPTLYg1qpJYzSWgoomvThPnp7
         Zp/ARBHAmsr+bd1yJn0QlEPZVez9wW3KN/4tC3+bmvHiXVuYCriRref9RatoztLKj5q8
         I+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509681; x=1721114481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIkOsfO4MWR8FV0BxCpeB1qOa5jyLB5kgFJtPbMATAo=;
        b=ebdXf1p4kwqHo6wu4AZo0hCP3TlmzbYtYraD+UfgK6E3Xn1lI08BiguufjUqCDtHT7
         JCXK1BnkKPYR0d6Y1oBRU/cFF+K/RXCZN4KQVr4SG4DKwjjlQXlxXZyd51cSmfP+J4Rm
         89/QsYjm+hzMSD9AFKmvh5zoq1Z5wr0rgkO9CSHCygaZt1BY4nQGc6Jw5URRWU+bKDRx
         lDzMa7SVImlCd0UFEiKcQ9uICsuVRWbFVy8UvztNEXMKSHv20wsoGCMQc221Ykb0JJ8I
         DcydTVmx3NQ+CNcihJZnfn61l1d1cT0Ja+rKHjzRI0CNNWybPZ6p7HAy5ZzxpayZgCI0
         W8pw==
X-Forwarded-Encrypted: i=1; AJvYcCUglb6vP2++/sALu4chnBWBHFxV6EyJ0GkY/1k3raJVUUltBCc8gWRh1x1Tn48pE1kIVNZXf7IeZIZum/uF6h2PNgR888XW
X-Gm-Message-State: AOJu0YzvdlCOPTGHrG8Dgj2OatYKsprm1lEOzgIIaQCx9NT0GBOVYVuT
	PSgvzP1G0kijI0qEMDvra7Aod+GlEudH9A6r84s+9hINgBtZcFJOQV+w9SbKBg==
X-Google-Smtp-Source: AGHT+IEL04bxd3EFQJudI33ZxQSuRGB1U2za770AoRhm3DAxGO2Wj86zA/oZ6KC3BaDfHBl5U248ag==
X-Received: by 2002:a05:600c:4f53:b0:426:6e95:6ea7 with SMTP id 5b1f17b1804b1-426717a3a54mr1371955e9.0.1720509681160;
        Tue, 09 Jul 2024 00:21:21 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab7d4sm1654148f8f.113.2024.07.09.00.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:21:20 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:21:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 18/19] hw/arm/smmuv3: Advertise S2FWB
Message-ID: <Zozk7IdpbYqtGMiN@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-19-smostafa@google.com>
 <20240704183658.GO1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704183658.GO1693268@myrica>
X-TUID: NhHbvdyVY+h5

Hi Jean,

On Thu, Jul 04, 2024 at 07:36:58PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:40AM +0000, Mostafa Saleh wrote:
> > QEMU doesn's support memory attributes, so FWB is NOP, this
> > might change in the future if memory attributre would be supported.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 807f26f2da..88378e83dd 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
> >          /* XNX is a stage-2-specific feature */
> >          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> > +        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {
> 
> Why is this check needed?
>

I thought that only made sense only for nested SMMUs, but I guess in
practice it’s not important for qemu and Linux doesn’t use it, I can
just drop this patch.

Thanks,
Mostafa

> 
> > +            /*
> > +             * QEMU doesn's support memory attributes, so FWB is NOP, this
> 
> doesn't
> 
> Thanks,
> Jean
> 
> > +             * might change in the future if memory attributre would be
> > +             * supported.
> > +             */
> > +           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
> > +        }
> >      }
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
