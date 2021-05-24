Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3695561lfm;
        Mon, 24 May 2021 09:19:27 -0700 (PDT)
X-Received: by 2002:a17:906:5285:: with SMTP id c5mr23724463ejm.282.1621873167493;
        Mon, 24 May 2021 09:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621873167; cv=none;
        d=google.com; s=arc-20160816;
        b=0j050XJn7ulLHsTaGz5mrRHZOxOCmbXzlWKWegRtampx90t04fXSMIlippxoJdPpcw
         KDp2UUfGtu/ccAS27ViSdMKOZTrSSiGkWvRbqsqm97XniNERY/wRLguLsJ/WSHHcUtq5
         vvSK0mAeWO3CC79blbRBweTAQUUSQvg3brgZc3Uey+BGDwYx1TCkYvI3YElKlP0Y5uGZ
         74NOuEFGm8CmaxXsbcw+7rKirrN0YiYgPHPIbIWYbeHNVHqkg2nK6xBV5Na8tDPEdpe8
         K8e4KaXuFX2f1y7G+G7nqGisE9FWoOxIpJj7ZJ8AUW2d/5BKScl1qKyyKRFdsuI7LTd0
         riwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4P2N433ux4DzJVB+wBRX3ObiQYOJR1BrRY+gMDmtSjg=;
        b=NcddfuA/2/4cJA9CnFYG5a2SBHkdF/oTwZ3K5/w6PxvDM6RqSBAL9achMxzHUN3Hni
         PEVx5TE9AuZbHbiCyJmIseA0qKzPNM2Pl/+UOtdlfQbv6LZa1CVmYNFmlGa6xatdpb6+
         bx1fcU+Fsx7ck0RDiWK8LyJl4oJEtNQr555FXYr6RZuJvtEcJWNmYb+XtKGBiCrMX38+
         hXemm+WboZ7Bo73CE+iW+Iu/3UWRPybpVSUqGza4J2HY/aySlaEvjh4Ry9wNsbcLdfZX
         iGeF171/8ElSF/BIDW3hTRRpm95/GUly+RU//XtaHx5QiHPXM+xIADINzTsp61wlganm
         ARiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caj+QNcq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lv11sor6520281ejb.87.2021.05.24.09.19.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 May 2021 09:19:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caj+QNcq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4P2N433ux4DzJVB+wBRX3ObiQYOJR1BrRY+gMDmtSjg=;
        b=caj+QNcq8IpjRlMNjFLoq//zFaLB5AvfTjmiGD4CILRI1LCbp/HowCoz6I6xso4T4x
         OdkJu2riQ8GNfm+q09v2H1+YsxrVnMsKfOyc7ZekvvfTzJy62GpkzfQAzbmwylua/ypC
         ggklIwQ1nf7yimlitbk5313ovpT19fJSKzD3tT7xKVCxOWzOM4DuufVrSbZ+R8Imf/Rd
         5Vo0XiziBwY3ojGlBXG7UTeEZiUUhEx7z05Gv5VPHIFWvgmaDJVshie5GQ4CwzD6lv84
         vVRSUGZAPiT9Iarvan+e6nfmaLrp8X90q7QPNTFHHVJv6wgN2EOzb96+ixms/urXFXNZ
         /ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4P2N433ux4DzJVB+wBRX3ObiQYOJR1BrRY+gMDmtSjg=;
        b=TDg83oNYUfn/at42+Eb7esSnWu9YHhGd6YKy4o0M2ucr43r/60x6Yq6/Owz669gr29
         Q9376plzfnUksBQKhzkfWPccUtkv3FYnJcWVse05NfCky9S42WMMaVOmtiNTwkJ0nB8f
         ydU2P0pjH+R5a7tr/o/BvpbqvxpKzeMq2a/jfffxDUGvlMq6TPgOr4f9t+OqoEzEWdp7
         IJ/Ny2bg5PmQeIJpk8uP0kcRWdFXiPHEyjtSftGeiADZSiDVqlSMhoW0xkvD0NivS7vB
         2nzNaFY6RlLfsVv4CPGVmflL/Rz7FjjV2zzsz7EqkUdaiY9IsJd6qtYPyCL8d5sESEYG
         4W2Q==
X-Gm-Message-State: AOAM530m3Rhjj726xx4DXI+I0vlVUaGkK7xX7/bRzPHYBd/KriPQlEoY
	yjk49ztqLhZdV0G5ev+dbpLZWaSmlhn52TLJAgG87jF/gajsyQ==
X-Google-Smtp-Source: ABdhPJyLh16TM6rTIjze6P+3PBKGgQHbjbk6reKqDqzxL3b8z00u6StzwyGnDywYEBmKvfBNtNlKEA1+EkqI9trr/fI=
X-Received: by 2002:a17:906:9bd6:: with SMTP id de22mr23721342ejc.382.1621873167196;
 Mon, 24 May 2021 09:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150016.24910-1-peter.maydell@linaro.org> <87fsyc3yhl.fsf@linaro.org>
In-Reply-To: <87fsyc3yhl.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 17:19:04 +0100
Message-ID: <CAFEAcA-SupJcEc0c70_XU-mAcPZsJk4V05L17x+KRC-3_ViGHw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Chan Kim <ckim@etri.re.kr>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FH3OkUIknlNL

On Mon, 24 May 2021 at 17:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In icc_eoir_write() we assume that we can identify the group of the
> > IRQ being completed based purely on which register is being written
> > to and the current CPU state, and that "CPU state matches group
> > indicated by register" is the only necessary access check.
> >
> > This isn't correct: if the CPU is not in Secure state then EOIR1 will
> > only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> > complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> > ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> > prevent EOIR0 writes completing G0 IRQs when they should not.
> >
> > Rearrange the logic to first identify the group of the current
> > highest priority interrupt and then look at whether we should
> > complete it or ignore the access based on which register was accessed
> > and the state of the CPU.  The resulting behavioural change is:
> >  * EL3 can now complete G1NS interrupts
> >  * G0 interrupt completion is now ignored if the GIC
> >    and the CPU have the security extension enabled and
> >    the CPU is not secure
> >
> > Reported-by: Chan Kim <ckim@etri.re.kr>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 43ef1d7a840..81f94c7f4ad 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, co=
nst ARMCPRegInfo *ri,
> >      GICv3CPUState *cs =3D icc_cs_from_env(env);
> >      int irq =3D value & 0xffffff;
>
> Un-related but the docs do say that:
>
>   This field has either 16 or 24 bits implemented. The number of
>   implemented bits can be found in ICC_CTLR_EL1.IDbits and
>   ICC_CTLR_EL3.IDbits. If only 16 bits are implemented, bits [23:16] of
>   this register are RES0

Yeah, this is one of those implementation-choice areas: you can
implement either 16 or 24 bits. QEMU chooses 24 bits and
correspondingly we set the ICC_CTLR_ELx.IDbits field to 1
in icc_reset().

> From my reading of the spec it looks OK to me:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

thanks
-- PMM
