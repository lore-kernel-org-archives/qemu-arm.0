Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp282769ejb;
        Mon, 17 Jun 2024 08:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjuKUfWt5BHQwqikzvPNm+9dYIKASb2eYA0DjyUA6rR97syrYEYduOjHSs0o8SZivxz10NA6NzWYz9sHl1n0/bq21Zl/kl
X-Received: by 2002:a05:6000:1f8a:b0:360:98c8:c44a with SMTP id ffacd0b85a97d-36098c8c61dmr2166255f8f.63.1718636696462;
        Mon, 17 Jun 2024 08:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718636696; cv=none;
        d=google.com; s=arc-20160816;
        b=ZuxVDo+jWNqW0S27068lfumVe/isJyJuscJ45DVr0oleF3ft0iVfi3VEHXHHhzmm2b
         xHXr+OgW/bl16K8T2Eli2Lxj3rBZjn3TQ/20qmcYao5XBwamhpCpr1D42ExCax5N4Cep
         D1eaV9MJyfbn7ez8AH7BRchq6x0dW+T9vfSlvWS7FegzR4CUw9uDvI5hRPdtkKSfHrin
         OCCjlCwXyQGSha8EKTlUTPXkc7J/PRMa46X0vit9qfFR2+BfN+vHV9LV9uLvD3VihgN1
         JpAySMp3hcNs7xC1bj9UpSKCzXUOk08hPEBLToogZnPm8hq6q6e7cMl1F7wPyBt4pFfI
         RkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JEb/dM6YDzVA2Zymea3s7EQXxCPBswSiGHuTJJHFw+o=;
        fh=0jZpyj68wAEvAbwMpchA/ck1pxxviAWJ+Ne8atXjucA=;
        b=J3czOyskDg+dq87l6B2uvYDOSGu0iZdFi7k9jIqqTC6cK5d9gG35Vj25AEeuXdFxuS
         I9F9uqBY6DXxdhIHYDuMVpKqfileZjpci/XDjHDCHPSYMkAmiMeDrSlh6OSD3fP0jsnU
         DnL2LTG4EaPO1t9XniBTE9tAVbG97hm8epGbExrnhtifKmAjdrHZ38aEKnAmjTP9aDQ/
         ySFdtME33R2CDeL4f/JxHoEkx4WpthG2mqb6wObJPzdGbp37UW0gbFXpBAyA7gEwW5Ap
         JBE6+lq9p/SiAOfOsJuQRuUq5Ze7BzRMGeO1Ppfnpf8oESADrL93xAdDxW4BRbfX/XH/
         MOgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sEwl+7ui;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-422612dad1bsor4380195e9.10.2024.06.17.08.04.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 08:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sEwl+7ui;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718636696; x=1719241496; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JEb/dM6YDzVA2Zymea3s7EQXxCPBswSiGHuTJJHFw+o=;
        b=sEwl+7uiXhAeRjjHFThwM5uUJiz+mzZ2LMtqdvWaL3cTr8sgk6X7SXJeGYRjNEipiu
         ckK68iP/g/4VhQ1UZ7NIMw4Wcrv0ca2+52NjKgip5qQpzRZlVL+5F7Ml3hJzsci1Nef9
         Qiradv1YaHFfOi+szD2sZQORaA/7xOWPYHOGkShzrDHfRbwteb5XEsh70Fy5vSJthhb5
         /+O7lggza3PaqCmVmd1ETETAkjokWiUMY0pEoomJw3Z4uY0M8yPqoxTLn2z4aiTXKANC
         lBA0DvXvXKrd7DVlsd8gOCizoaDpF8E1YuQ2sS8WVHqxe9/61srVx/Kb7PbE4SJaDHXh
         mF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636696; x=1719241496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEb/dM6YDzVA2Zymea3s7EQXxCPBswSiGHuTJJHFw+o=;
        b=sVmW9M03OUDC1ujMwVjwFMdS0+l2B07gjlfsWC1zXYUc6+MxXXe9kwxGWHss7Xn7vq
         fh5gFdA6EM3B+//H1DzfVWjbxrUGNRYljnPH0EqJTv+AXHsqR9J3m+ZoDH70eIi/zY/m
         DhrU9QXA1tZViH4BhsBlFKhjeuyvdKvT3oopD+j1uAA9B7Lxi9oiic1r6XoOHbi9pGdv
         nzDvK/cv4JaW/k0e3egAhNABaIztPYJQaDD1cn2gkMcHanNmN1X01thhO6HjkBWiBkqZ
         YE/FZSyTGonYEy0HykcQ8Ze5OxMH8rTVSC2DW/xZ0PivFiF5LUWVzTArw/eo1W/y0xwm
         t6+A==
X-Forwarded-Encrypted: i=1; AJvYcCUiHAv/PqHBMy1e6V9FookdMUvvyPwsDVU7E0EpcvLWzNamCiUfzpXh7v6f2QU27z8gxqDJzbUJeWw/W4s67zuGE0eq2Z4E
X-Gm-Message-State: AOJu0YwMTP6nQlL30HlkGLJvW0A+HcFz77O4DH44uq1j8nIBHhqxtqe7
	jzzgqyxzKb6kgayD+mOhiqtGYto551LmgKbz3vscJGY0x92nF+xGULw3I0giBw==
X-Google-Smtp-Source: AGHT+IFcc8pAhmQFYM30VxZjzSVn4m/uUOG+18wjf7NT0dAe5wX6WXwuJeWRAA9xsUXbAMzQ7oJS7A==
X-Received: by 2002:a05:600c:1d97:b0:421:8486:7d2d with SMTP id 5b1f17b1804b1-423b6687d82mr3468175e9.1.1718636695784;
        Mon, 17 Jun 2024 08:04:55 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a5b4sm161197725e9.41.2024.06.17.08.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:04:55 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:04:51 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 15/18] hw/arm/smmuv3: Advertise S2FWB
Message-ID: <ZnBQkyn60KO8Zyt-@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-16-smostafa@google.com>
 <b3488980-2136-4620-b875-a11f75373462@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3488980-2136-4620-b875-a11f75373462@redhat.com>
X-TUID: ggacYbKhV6XF

Hi Eric,

On Mon, May 20, 2024 at 03:30:58PM +0200, Eric Auger wrote:
> 
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > QEMU doesn's support memory attributes, so FWB is NOP, this
> > might change in the future if memory attributre would be supported.
> if mem attributes get supported
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 88f6473d33..8a11e41144 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
> >          /* XNX is a stage-2-specific feature */
> >          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> > +        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {
> > +            /*
> > +             * QEMU doesn's support memory attributes, so FWB is NOP, this
> > +             * might change in the future if memory attributre would be
> if mem attributes get supported
> > +             * supported.
> > +             */
> > +           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
> spec says:
> 0b0    Stage 2 control of memory types and attributes is
> not supported and the STE.S2FWB bit is RES 0.

My understanding it is still OK for the SMMU to advertise that although as
patch description indicates it is useless, but I thought it is similar to
XNX recently added, but I can drop it if it is not useful.

Thanks,
Mostafa
> 
> 
> Thanks
> 
> Eric
> > +        }
> >      }
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
> 
