Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3292220dye;
        Tue, 1 Jul 2025 09:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2v7jJ+XRe2L+F1oChm2hie1eWilCDCh6pICIO4x39NYCn4FkWYlFe32qc4p03+aO9TVttxwgV284VEw==@linaro.org
X-Received: by 2002:a05:690c:25c7:b0:708:cd31:88a9 with SMTP id 00721157ae682-715171da938mr273426847b3.37.1751388610131;
        Tue, 01 Jul 2025 09:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751388610; cv=none;
        d=google.com; s=arc-20240605;
        b=buHmj6b0gFnNS/6E8otRRQT7d8kiErh3HJcpllI05C3yk1JtjcjrFVyE7efrrdb0aV
         7L6FUub41qvSnea7XfI+cl8PY1JcM0sOS49O14d+EzJhAJeg93+9f5qPRLULp/vlW+k4
         war5vQrLYNb9kiGFFkALo+y395RZTk3MxH9For2XvQomp1TQWblLTPQdHaXlR2Jf5Be1
         GMsiuJsLSQNvXcExK+Y+r7UWnsH4zhXqOCu1wLJy8T8Zh3xeEeT9xqDSMY0WhQxchnUq
         ZUB9ImX9ymVTqoOa7xhDI8l+WOekPPkbyZMypeA7cJynyk74xjsJL/Z89pH0Rt/CCKEb
         /ZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=35ez7Kc170voOUq5A4zUyhLBeVOgMP189lwSGDqJvck=;
        fh=41QzEUiCNHxgw2WiN5IW4uwuIkGPOW2Q0ZKI+r30gc4=;
        b=F3dSB9vj26NsR0iu5q5Vm1xOVxALc3uQZW//9Op371nWpWbm09iLVelc+i8K0ZHSNt
         P+DJqN7mQ3tH6f3woRA7knyoX83KaAb4ugoAdd+EG6hGimebzMmws9BT+4uD4wtFm3CS
         1cri1vXzO+kAW7GLQ39X4JuAxKHCq83qgyqLOCJaTUiQJ8/GVBgGVCiJl8ouXkC6r7cf
         viOfgXpZrsmZPbUvSbL4STl0zIi4LC26SSg5iwvN0JrFphZTgf3BigFUHJBudWxL/1P3
         wVwBJ1+ye8vGB0K+sFOkoBI2OIhBl8/+vV0dKpNl6tyHy6zjh0f2R13gZA7c6KjxfX2+
         aEpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbiEQmHc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515bea77asor67891507b3.2.2025.07.01.09.50.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 09:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbiEQmHc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751388610; x=1751993410; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35ez7Kc170voOUq5A4zUyhLBeVOgMP189lwSGDqJvck=;
        b=vbiEQmHcNhRqyn7gK6aoMKU4Xe4XPg6/LogJRwS6x3iPJTGMoHYN9Wic/U1AwJQL0O
         r4Z9KbLlsTi8tbmMKeGuyhEjSqX6Lb/kXI+3VnqcITWi4TiANMpTjpZjVDCYLVpdwQej
         uYQwDZ8+T1HXd0IOztJB4yxDI1GoVeu7d3dcsI/k8DO7WmeFlZAmzIfUHmIga2uLfoP0
         fPkZO/Xvqpnp8SMkSnCkWNg1LfQiSILD51xMT/bauFrwLelwapK8FifQiqyQKVy92lLD
         SRdR4eCw66Nl/QX7W6hTBXAY+XR2KGNldMsELi6XuhILlzJjV08csji01XrOhGYpyIr1
         6kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388610; x=1751993410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35ez7Kc170voOUq5A4zUyhLBeVOgMP189lwSGDqJvck=;
        b=YRRjnQlDwZ/s988yes+6zbiW9fvuZVFDEK8B/qnZP/joYJ/NeB5X1g6YPY2JQjMiO0
         DnuBnEonULa6X8TsCGPoG8qID7169n+hmuptBJkTaF0TycdIUwDUYs51mgR2xIXojvgc
         hOd0cAEdR6yDHiGkInYh8qb/YY6ZsVzeoSYlLbj8MUAaq9kLzuDxChxOBEa4GBvSUxM9
         FCqceavvFQaKUzCWn91M1G8XrcyvXMSYIz2bJkgt402Hokqt9ZjpmofpUxs8+NX8aYbi
         DiRCuFTMp96HVsG7HrYnGyyDK/VFUhANpjK3fMz/WKPr/EAgFYVO+F8U4+B99hH5q3tx
         Rm6A==
X-Forwarded-Encrypted: i=1; AJvYcCWh+RV/KIS4dwe3xNoLlELHIx9PzUNmBxJH6WDhkHUl9Q06jR7X8ZEKkv6mp1jtCw+H8TbOzUx2O+OcrA==@linaro.org
X-Gm-Message-State: AOJu0YyiujG+u6cF9zwQWUZPWiGLEW5ebBPn8eJ1m8JViTOZlSo/BQ9r
	2Sh9wLv/C4VeityruWS2KAQqD6LsYHimvopz1XoWIHZ39WoCoGnIm/RnBLvxElF0qYQGfIf79T7
	3K6pw4lBbIyVlHxxKOQhC4KoYEPjfna6i76yXzmkXlFr0
X-Gm-Gg: ASbGncssxO2u77T2DcAOhvpa85I20IOfN6MboIkN8QraPoUzpjtuWvf8OwSgxtJipbO
	67K1GmBv4t3/hmGtIeKN14EGBOLKVxUIopu4CyujolRX6THUuvECg/H3AbXmg0Zs4OjSvFDCUNv
	+rPakQEBikpI9rrRF4OdrAmJKe5bkQ4hSxiBNbSwGX2eOT
X-Google-Smtp-Source: AGHT+IFTfzg7zxbm1tLzoaUaVZDl2uQqTZJq8NNLOxX6vxXh0XpyMCVDc9uv5IHO5vj5V+Jkhzbnk6Q9LwooxYwplk0=
X-Received: by 2002:a05:690c:30c:b0:714:3e9:dd3 with SMTP id
 00721157ae682-715171582c0mr277642827b3.6.1751388609643; Tue, 01 Jul 2025
 09:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250617153931.1330449-1-cohuck@redhat.com> <20250617153931.1330449-14-cohuck@redhat.com>
 <CAFEAcA9OXi4v+hdBMamQv85HYp2EqxOA5=nfsdZ5E3nf8RP_pw@mail.gmail.com> <87bjq3rj3a.fsf@redhat.com>
In-Reply-To: <87bjq3rj3a.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 17:49:57 +0100
X-Gm-Features: Ac12FXxH6G6SW_BVrh5mED54ufWIrOs3TRJVPA_Y5UCQOxGxPr3hVy6_FRNJx3A
Message-ID: <CAFEAcA8+OjptoJgPDeQkw5TQtVduhq-KvP-Br6JNDmW57jgXbw@mail.gmail.com>
Subject: Re: [PATCH v8 13/14] arm/cpu: switch to a generated cpu-sysregs.h.inc
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: PxT4Z3/g61qf

On Tue, 1 Jul 2025 at 17:07, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Mon, Jun 30 2025, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Tue, 17 Jun 2025 at 16:41, Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >> Generated against Linux 6.15.
> >>
> >> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> >> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >
> > Stripping out all the lines that just moved around,
> > here are the additions:
> >
> >> +DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)
> >
> > This is ARMCPU::id_afr0. If we want to store this in
> > the idregs[] array that's fine but we ought to move it.
> >
>
> I guess the *afr* regs fell into the cracks because they were not in the
> isar struct -- makes sense to move them.
>
> (This reg "must be interpreted with" MIDR_EL1; I'm wondering if that has
> any implications once we enlighten guests with possible midr/revidr/aidr
> values.)

It just means that the contents are entirely implementation
defined, so you can't tell what they mean unless you first
look at MIDR_EL1 to find out what your implementation is.

(Linux doesn't appear to ever look at the AFR0 registers.)

> >> +DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
> >
> >> +DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
> >
> >> +DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
> >
> > These are all ID registers we don't implement yet
> > because we don't implement any features that are
> > described in them (i.e. our implementation is RAZ/WI).
> > I guess it's OK to list them here, though we won't
> > do anything with the array entry.
>
> I don't think it hurts to include them, it makes things easier when we
> want to deal with non-zero values in there via kvm.
>
> >
> >> +DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
> >
> > ARMCPU::id_aa64afr0
> >
> >> +DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
> >
> > ARMCPU::id_aa64afr1
> >
> >> +DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
> >
> >> +DEF(ID_AA64MMFR4_EL1, 3, 0, 0, 7, 4)
> >
> > More ID regs for features we don't implement yet.
> >
> >> +DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
> >
> > CCSIDR_EL1 isn't a single ID register, it's an array
> > of them (indexed by CCSELR_EL1). We keep them in
> > ARMCPU::ccsidr[]. I don't think it makes sense to
> > have an entry in isar.idregs[] for this.
>
> Hm, IIUC, kvm gets the correct CCSIDR_EL1 under the covers already
> (i.e. no array).

There's support in the KVM GET_ONE_REG API for reading
and writing the full array (see KVM_REG_ARM_DEMUX_ID_CCSIDR).
We just don't bother in QEMU at the moment because we never
need the values in userspace.

> >> +DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
> >
> > ARMCPU::clidr
> >
> >> +DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
> >
> > This is an array too.
>
> Currently, kvm handles this as undef.

That seems like a missing feature in KVM -- it ought to be
implemented on anything where ID_AA64MMFR2.CCIDX says
we have FEAT_CCIDX (which means that the whole cache ID
format changes and the info is split between CCSIDR
and CCSIDR2).

> >> +DEF(GMID_EL1, 3, 1, 0, 0, 4)
> >
> > Another ID register for a feature we don't yet implement
> > (and a slightly oddball one in that it should UNDEF
> > until we do implement FEAT_MTE2).
> >
> >> +DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
> >
> > We implement this as a fixed zero in helper.c.
>
> Undef in kvm.

Probably because KVM doesn't have support for SME in
guests yet ?

> >
> >> +DEF(DCZID_EL0, 3, 3, 0, 0, 7)
> >
> > We construct the value of this one in aa64_dczid_read()
> > based on ARMCPU::dcz_blocksize plus some runtime info.
>
> That one's another bit of a headache (I didn't manage to spot kvm code
> dealing with it.)

The hardware handles it for you -- inside the guest, the
value of the DZP bit depends on HCR_EL2.TDZ (and maybe also
SCTLR_EL1.DZE). The value of DCZID_EL0.BS has to match the
real host CPU anyway because you can't change the block
size that the DC ZVA insn is going to use. (You could
trap DCZID_EL0 accesses via HFGRTR_EL2.DCZID_EL0 if you really
wanted to, but you'd also need to trap-and-emulate the
DC ZVA insns, which is a lot of effort for something
no guest is really going to notice the difference on.)

-- PMM
