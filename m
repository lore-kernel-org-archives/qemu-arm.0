Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp240313lfo;
        Thu, 28 Jan 2021 05:55:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHj2ZVu2bBhLQFMgpUNyi7Zp10qrYszPTZ6G1lqxGGJ2pgpQ8AUakmimmmo3B9RS0I3b/U
X-Received: by 2002:a25:d202:: with SMTP id j2mr24171147ybg.216.1611842108480;
        Thu, 28 Jan 2021 05:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611842108; cv=none;
        d=google.com; s=arc-20160816;
        b=oD03K7+hohKVIFz/AEWv86aiG9eaM0NS3KGQaSxxUhP+4b1E0Q+sWdw2kVY9+BjhoP
         Jba6yj1ezO7RbHg4UWY64/VcCw8ZcRiswvJt3i7IbCxtlK3IsBK7zi2bZZnBcNXLxvla
         Qdn2pBp7vrOI1++kDJcd3Zc0d1yPXWoi1kDinywgnIrVVfDIykz0wISuTXDY7m/t3wxG
         78Pwh9Bx7AIvZiQTg632XQ6oUeiC1rvJWJrASLbNNNGeYQUsByrxxyDQCRp1gRytknwc
         +XTRFE0UFdBcth9uMR0EuKRvjs7strK7CmXL7K1AJ7TDk5lcqUP1jefMUf1IboSuREG5
         SncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J9bT+1htkfWngb5GTCiyd2mns4sFH1yUFJ/HiJJTGYE=;
        b=ZaAnlB+cAX3Gc7avugF8E2zbyhpbnwESO10AGsLAjLsi+Fsn2gqM4rRFXZ96XLMYJF
         LIaC9kg3Og1q5QCxbBSBxjKZBkjvksk9kZGzvFG01sonBsuf91tgfgmqFZnpUVAZrgPn
         MX35Wq6qKUSIXHxZ8lzTDwmLXqEVvBMQxIX6uQwILr6on6/0PXaTdLXRjFMeD629TWW4
         peRedngqOoDf6WUJVaCysbKQ8erjcDCPiafHgw0F0oAC9snfjCQkF0gBMQxYLFq1lcmq
         9LUCkyxacZFwPOw5tQhfN5wWKVA+XNgxjdWDFOKFPR9EYza1gu1erUsp+Sc/Nz++v3t8
         A86g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BpvcHLSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d38si6681498ybi.366.2021.01.28.05.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BpvcHLSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57lL-0006Bk-Qt
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57kg-00069Z-Gn
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:54:26 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57kZ-00087J-NV
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:54:25 -0500
Received: by mail-ed1-x529.google.com with SMTP id dj23so6654608edb.13
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 05:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J9bT+1htkfWngb5GTCiyd2mns4sFH1yUFJ/HiJJTGYE=;
 b=BpvcHLSiMfCOzRe1m7j3Ji4YBY8bpsUxLDiKAoVl9KGC3JurCIAxMdDmG4D9PGP3vr
 RF5/PMzOJmg+QhjGA53cZtysB5wMdqDXx/U9CUJ4qPOpDT1Ps/X9sLpQJO+5AxeS/Q7V
 dY1rj0XPzua/NYvnHtwXvjFjOqFQANpjXXCbhH6Nalbsu9tupg9MSkMFzjMcVtqCNAD9
 WcjCc2xgDbmlj5H9B7UdEb120Yr++9M1g16fymzMA/iTrQ75pVkDbSBeAN72/3r6DHNc
 LNV1zWMhg/bVOiFc4tjQ1BORNmb5fsj0O9OnyX5zxLRCvwSRqWFmrUxPlpkNRj4NlRla
 agNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J9bT+1htkfWngb5GTCiyd2mns4sFH1yUFJ/HiJJTGYE=;
 b=Ka0fGjQBRrAlrLHlDC1k4MBC03/KofgRGOHA2Z5L96gCB8UxgTIdPGtAEP9TFXLlhj
 GCO5s7opGo95sEUl5ZhqQ0E59cBc8QMNkFg9nF30MTTGWf7fo8bKo3xZTVTy0Q7iRfAl
 q1t/nJJ7gEYJH4uBo/DFlenu4z4x6+jjsck5j5S3FU0ZAFt3bI7xrwauLFkiKLoUo5La
 VTnBFUMGDl+bE7LPAF43T4A7OCVRktPHDKp2BdDarZbrFP/2qGIMpZtqITFhNp9qrs1p
 QGngk45BEXQa6B+3yRzkZe+HEBFs57s6yX4POinV3RrWHDgmsKsExg4EIbMB14wyZwnQ
 izYg==
X-Gm-Message-State: AOAM53042Q7letK6bLFzqMhlSrCGS25culv6Jl55MaxOPFUFqw7uSS1b
 iv0Y3+r3/3H0PWRMGVl8BEJsdaA/I/BPH2X1guzKHw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr14017698edd.52.1611842056944; 
 Thu, 28 Jan 2021 05:54:16 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
In-Reply-To: <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:54:05 +0000
Message-ID: <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +fE0a0VxarfO

On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >
> > On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >
> > > When the block is disabled, all registers are reset with the
> > > exception of the ECSPI_CONREG. It is initialized to zero
> > > when the instance is created.
> > >
> > > Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
> > >      chapter 21.7.3: Control Register (ECSPIx_CONREG)
> >
> > > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > > index 8fb3c9b..c952a3d 100644
> > > --- a/hw/ssi/imx_spi.c
> > > +++ b/hw/ssi/imx_spi.c
> > > @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s=
)
> > >  static void imx_spi_reset(DeviceState *dev)
> > >  {
> > >      IMXSPIState *s =3D IMX_SPI(dev);
> > > +    int i;
> > >
> > >      DPRINTF("\n");
> > >
> > > -    memset(s->regs, 0, sizeof(s->regs));
> > > -
> > > -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> > > +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> > > +        switch (i) {
> > > +        case ECSPI_CONREG:
> > > +            /* CONREG is not updated on reset */
> > > +            break;
> > > +        case ECSPI_STATREG:
> > > +            s->regs[i] =3D 0x00000003;
> > > +            break;
> > > +        default:
> > > +            s->regs[i] =3D 0;
> > > +            break;
> > > +        }
> > > +    }
> >
> > This retains the CONREG register value for both:
> >  * 'soft' reset caused by write to device register to disable
> >    the block
> >    -- this is corrcet as per the datasheet quote
> >  * 'power on' reset via TYPE_DEVICE's reset method
> >    -- but in this case we should reset CONREG, because the Device
> >    reset method is like a complete device powercycle and should
> >    return the device state to what it was when QEMU was first
> >    started.
>
> The POR value of CONREG is zero, which should be the default value, no?

But you're not setting it to zero here, you're leaving it with
whatever value it had before. (That's correct for soft reset,
but wrong for power-on.)

thanks
-- PMM
