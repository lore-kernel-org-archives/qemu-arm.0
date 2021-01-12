Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3546060lfq;
        Tue, 12 Jan 2021 05:20:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrnB7Q7mwH1UR71an3DpOblkMPNCX33MUVUWMitrjrwEdzAbMrGAIFstQStqeGR7TQ+9CT
X-Received: by 2002:a25:3587:: with SMTP id c129mr6530191yba.223.1610457651361;
        Tue, 12 Jan 2021 05:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610457651; cv=none;
        d=google.com; s=arc-20160816;
        b=h64Z1dx6kEhmNGXCIIoWX5pOrz7sXO90hUwVr2hZnRYcrYFDtuKzU5wKro9gfGxP8Q
         AHFnkBEkDLnMfV5ESEAJ3a17GYLNCn0qjuy7TJXcatVK/8bIZTSxXS0/pK+NY/8I48V2
         YaH0tXYVwfSehKTOQN47XWgrF2T170haYCD3NqR4Lf3yImUGxoiIOYo+yGYbje01Isd/
         uim9Y7dwWtwbYyRDGCtqKk61OHSN13+2xwXzwsBjgv1MSY9905MCMNSAeK5LSRvXKJu8
         Us1vgN5qsG42Q5Iy/IRtpglHGEPLBszUBhk2GOjZZ6tsUYBLEKD5PwaAEkclsUPXToDj
         Fi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JV0fYik8m6jI9UqV5DS+cgAM+658ePS9bQ6bTpjmVVk=;
        b=vl2xSKnT3gxXGxsMob+v+y4ySsBQtJoyGd/npmNEdoAwtZ2Hr8AxWK0KZvoX5o/bVG
         rKzWlugaj6F+WxXkEjwUWlQp6TENPewobnrtpp4G4fufjjP9cmtZz/sGOc12sc3dNwGc
         vyARM4uOjLPRaI8lRibS8Xv7SSFhZAjVpJj5PA0D44j39yMVcNAzK+k389o2yqjj5eRS
         wlj1Rt5dUAUW7Vmqj2/JH43kWmfpiOFdzWQMrA4neSbaFg4HNqu6tK+EKFkvwQU09Vqt
         NHXa8q4ncvBSIXn6SbKtXxABfMfzrnc3QsB1Ku+sRtc4lxppTq4PAUlq0A2pimZLV8Ak
         Y4aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ie6Lmt2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si3312851ybf.11.2021.01.12.05.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 05:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ie6Lmt2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzJbO-0000rP-IH
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 08:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzJa8-0000pm-PO
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 08:19:32 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzJa5-0005Th-PS
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 08:19:32 -0500
Received: by mail-ed1-x52e.google.com with SMTP id cm17so2272031edb.4
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 05:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JV0fYik8m6jI9UqV5DS+cgAM+658ePS9bQ6bTpjmVVk=;
 b=Ie6Lmt2YuGNX+ETk6gYroLX6H1tguMKwi3DPMpA/mSVbPcfjL/cA7bgQeYfttTe6On
 86f8KvTTXaSVv5SOjjkH4RLEuprlQ9Hm5wg1SwI14v2utWcFc3ph/8CAYSw+xd/FtHxy
 awIBKjT3u/KEhG45bOV3qVaTq8NgjEU79sDl72/ZFm6v2oBBxt0FXLuxPtWLWTzDQDXI
 M4NRfmp7y13UoYZ1gDic+uBORBcjOlF2+SMtawFtKdun3ZtOx0/1e8OFF329q03JT5+z
 PTzp8CWLjiL3Q//DrhIODDlCSXeWiNHBTBUMthL38cxcEp+S2ib4q/TcLa6cW/q4p11j
 dV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JV0fYik8m6jI9UqV5DS+cgAM+658ePS9bQ6bTpjmVVk=;
 b=Lh3aeApk8fcJ2Fsr+1VLe6N8irU/18y6iPv6aYfbhx12Shu6vN4sE4AdqO1MsDYsP5
 dPT5VZsgDoo6odSkx3055eyKooCJqkEqvA3Mo2MIH841h1BWA2xSXc0oHBCcxBJn/cKN
 gHbHXNnlAo0ryWYY/VhUEp6/NSNLMD4j07HtymXfAzSlWwdQrOPUvHtyuC3TRkHcuU9Q
 7B3CkoaBBW7NdCNc3v+ObasaljI9Fc/3Ji5PDfFRD5yOuoRE1Y3bE0TniuBVTPzC3SUS
 MZxrWEaoyKslGmklO/R6/qRGjRjz4LbkFH7O8j1N+VTW0KvJyCsms3GaXP5fC+TsjCoi
 kdGg==
X-Gm-Message-State: AOAM531F04TEttzHUGB/rCcEtlMsXFoP/4nmKv2gJymRgUnTHlbh3MMj
 utG159GzdGWwKjTIg4V58dW4ORE2cDIg2vx2flkQ2A==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr3514339eds.146.1610457567807; 
 Tue, 12 Jan 2021 05:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-3-bmeng.cn@gmail.com>
 <CAFEAcA8W8vxA8AJY-Ka+--drv_asw5soaFNO90VzVENApMMH0w@mail.gmail.com>
 <CAEUhbmW2NaTNusZ123D7FPAK6uJZtCuak=UOtEE6Nc5fNfnsHQ@mail.gmail.com>
In-Reply-To: <CAEUhbmW2NaTNusZ123D7FPAK6uJZtCuak=UOtEE6Nc5fNfnsHQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 13:19:16 +0000
Message-ID: <CAFEAcA8Yc9d5d0R3_m5FQE6NE6Gk3_RnDrX45eg0D0nCgaW4WA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fKqj/AnWqpTa

On Tue, 12 Jan 2021 at 12:54, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jan 12, 2021 at 6:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Usually the approach is that the device on the other end of the line
> > > is going to reset its state anyway, so there's no need to actively
> > > signal an irq line change during the reset hook.
> > >
> > > Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
> > > imx_spi_hard_reset() that is called when the controller is disabled.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > ---
> > >
> > > Changes in v4:
> > > - adujst the patch 2,3 order
> > > - rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
> > >
> > > Changes in v3:
> > > - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> > >
> > >  hw/ssi/imx_spi.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > > index e605049a21..2c4c5ec1b8 100644
> > > --- a/hw/ssi/imx_spi.c
> > > +++ b/hw/ssi/imx_spi.c
> > > @@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
> > >      imx_spi_rxfifo_reset(s);
> > >      imx_spi_txfifo_reset(s);
> > >
> > > -    imx_spi_update_irq(s);
> > > -
> > >      s->burst_length = 0;
> > >  }
> > >
> > > +static void imx_spi_hard_reset(IMXSPIState *s)
> > > +{
> > > +    imx_spi_reset(DEVICE(s));
> > > +
> > > +    imx_spi_update_irq(s);
> > > +}
> > > +
> > >  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
> > >  {
> > >      uint32_t value = 0;
> > > @@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> > >          s->regs[ECSPI_CONREG] = value;
> > >
> > >          if (!imx_spi_is_enabled(s)) {
> > > -            /* device is disabled, so this is a reset */
> > > -            imx_spi_reset(DEVICE(s));
> > > +            /* device is disabled, so this is a hard reset */
> > > +            imx_spi_hard_reset(s);
> > > +
> > >              return;
> > >          }
> >
> > The function of the code is correct, but you seem to have the function
> > naming backwards here. Generally:
> >  * soft reset == the reset triggered by the register write
> >  * hard reset == power-on reset == the dc->reset function
> >
> > I think this is what Philippe was trying to say.
>
> Philippe said: "Hmm usually hard reset include soft reset."

True in hardware, but for QEMU there are some things we don't
want to do in what we would call a hard or power-on reset.

> Since we are moving imx_spi_update_irq() out of imx_spi_reset() to a
> new function called imx_spi_soft_reset() (what I did in v3), that
> confused him (and I felt the same thing), so I renamed
> imx_spi_soft_reset() to imx_spi_hard_reset() in v4..

thanks
-- PMM
