Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp235443lfo;
        Thu, 28 Jan 2021 05:47:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxU5GS0lnCPMju2BTqddbPZ6ouNnoaXv2fPmFs8U22F5JpsXUpIidxWYQgW7aY4flrmDOcg
X-Received: by 2002:a25:e054:: with SMTP id x81mr16252896ybg.487.1611841668434;
        Thu, 28 Jan 2021 05:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611841668; cv=none;
        d=google.com; s=arc-20160816;
        b=NuuoYh4PoJ1xNtNRRKL4SuDiJNlI7gsjGvo5I412DcpDyHAPwLS8OlwR2pM9G3/ID0
         wTfDEX/74M031zLhGGcDqwcv2ojykKwsQLv11rgfXZ05oy4kzkqr79FvF9pNRqJ8LDvh
         3OmJAWvsRw72UrIvft2LPX9y7agOfGMuIs/gnxnCveEW5nuVewANnCug0QNE+/qNYHjs
         NFK3GiDppN/fVMpXLCHn4oWjbtUT86+p8vPxBavO8oOn2JgCO4/5ZGZKKvEdsySDsvrt
         3Nk63Q+Px8B5omOP3jGOxt5oZn2Rll4I0EXDK4qIDZY3xJlM/NISmCNauHBPpqQKn/+G
         N5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PHspNHzClM8kdz38xYtmQHS4+REVO2x57FezXCH/BDY=;
        b=HdgiDpdjZKYYc0TrqvNPK13CtOETn9YTD9TsURtjMxABoO1aL4z3DuxgArK50J0eGa
         ajjmiYLHWdf1tsG06scU2iwBlN8VR6Fp9rzLWMG98K3idRFrB5Fb8hdFG54Fhll/66wd
         +Ar7MQrusKokJIAEJxlkgBRvWdnci0sjJ+yiQEx36CqEb+UgJZSMSP7JVagFragKnyFP
         OtbBwUKRxjVq+B2DC3FCjLN3PcV/F4mVnbOmnFvhdX200W73Yokz8Wyu/GJ1D09VJ9sH
         Z3Dre7/nqFnDyt2GtU0gUh2Bz4GcDjpe1ubb7SI+bQPqBE7QLV8mDbh/qAb2GBMOeqd+
         /Ayg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f2zk0rJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si5386548ybk.139.2021.01.28.05.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:47:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f2zk0rJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57eF-0001o9-SH
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l57db-0001o0-BV; Thu, 28 Jan 2021 08:47:07 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l57dZ-0006LC-M7; Thu, 28 Jan 2021 08:47:07 -0500
Received: by mail-yb1-xb35.google.com with SMTP id v200so5515638ybe.1;
 Thu, 28 Jan 2021 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PHspNHzClM8kdz38xYtmQHS4+REVO2x57FezXCH/BDY=;
 b=f2zk0rJ3y1T9Q5ofdFORrWHD2Eg1flxm9ae2fdqc3kTTx2hdAbtheSeHZ/EElg6Be5
 PrraepRJgssyG0krnl7gtpdIGEOQcQJ7HzGcN65lFi+e/sp840P4yMVVMDt3/TbPVqcg
 F7IUqcUFxkOAZ6jQ294iLxbrXPTzq8ibf2GQMW5euAu+AKvWS64izUgPosFOw5ng2EHj
 NSrnfw17tWQO4OuaD3/bRTrgpT4WstEn4jwYbU26YUMmTUhquDDH+/0qPQC9YmDmfatj
 IfmgDz+Pvr+WJ4wXe5K9hYk3Fi6LK7XEyvVId663HU0lUwSagqMtQzP9ORSpwsSYkby3
 OvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PHspNHzClM8kdz38xYtmQHS4+REVO2x57FezXCH/BDY=;
 b=NtVzUwUHaWBIyGNo7WxFD2x+Z+aOyu/3osxk3ldEHZ9/vGIQCEs/oG2ngNwRh8tz/E
 WvVYeTSJvGrF/vRtfSM8SGIQSajk/cr7G8x6GgKLNL5In77b7Mlj7BZdD3OlygC2rjLU
 7UWWHGeI7EZkP6ocAfAIdymraRdUcup7HKZFqJmk25oiftTmMzcnQWz6O9Eavh6nf4Sb
 7LjiSHUgbH2rIKlRPy48tbwbBy+hZIWNhDQJ7slqXB4H8BGIrDHgBmbIIxIcQJ2feOU6
 pcOWPHoljx8532SQhUCPKJPk9xeGoyr+5vEzWUrfd7bXaEA/dqHNnD97LRH3hYFAf0GN
 ZzmA==
X-Gm-Message-State: AOAM533ZGt2NYv4Rjt4vKN1XVshJ9eZBcS1tF9E1NrOm4vzoIWUOh1xY
 tNuX2scjs0tfz29LS+JzxsDRoU9/d2vteFgrDJg=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr21873244ybm.517.1611841624163; 
 Thu, 28 Jan 2021 05:47:04 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
In-Reply-To: <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jan 2021 21:46:52 +0800
Message-ID: <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 1xnwZbODMNlM

On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > When the block is disabled, all registers are reset with the
> > exception of the ECSPI_CONREG. It is initialized to zero
> > when the instance is created.
> >
> > Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
> >      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 8fb3c9b..c952a3d 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >  static void imx_spi_reset(DeviceState *dev)
> >  {
> >      IMXSPIState *s =3D IMX_SPI(dev);
> > +    int i;
> >
> >      DPRINTF("\n");
> >
> > -    memset(s->regs, 0, sizeof(s->regs));
> > -
> > -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> > +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> > +        switch (i) {
> > +        case ECSPI_CONREG:
> > +            /* CONREG is not updated on reset */
> > +            break;
> > +        case ECSPI_STATREG:
> > +            s->regs[i] =3D 0x00000003;
> > +            break;
> > +        default:
> > +            s->regs[i] =3D 0;
> > +            break;
> > +        }
> > +    }
>
> This retains the CONREG register value for both:
>  * 'soft' reset caused by write to device register to disable
>    the block
>    -- this is corrcet as per the datasheet quote
>  * 'power on' reset via TYPE_DEVICE's reset method
>    -- but in this case we should reset CONREG, because the Device
>    reset method is like a complete device powercycle and should
>    return the device state to what it was when QEMU was first
>    started.

The POR value of CONREG is zero, which should be the default value, no?

Regards,
Bin
