Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1929692lfq;
        Sun, 10 Jan 2021 04:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIo1YVYG1UfNyfb82j191WHhtlzRiOfScxEtVV8SiIQR3UpbsXaMTeM2vKeAiMWcYwBLek
X-Received: by 2002:a5b:410:: with SMTP id m16mr17949994ybp.451.1610280285021;
        Sun, 10 Jan 2021 04:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610280285; cv=none;
        d=google.com; s=arc-20160816;
        b=F593zsj7CVE7GhPEadOEyYjz7oxy21PP4iR8ATQ3USxODq4AHcwRoAnzkOLBaZLAJe
         zHanLghur/ZL8A+6/8ZhGVXktAI3xopaCM8Y8a9jmtoqpwU7EeHBmKKC04EGPdIdlLc+
         GzJRlAIXuTYCYIkeaVfv/CVqlR9QAZ0cEvzlb/lHRkV6gKyLT8sa057gCJmgWAs1KEQg
         4KWHLXCbvUhjgUz1A3CsGuuwv/tDpVdxVR93/30yTM2sg2UxRWponnjRyaSDanB5tI7G
         AvDhXjeejHIpd6lDX7YUHj8CRsZyM8wwyA5JpR59S2ErPI9xKQQhLBA/9WIA1/3KawCE
         uinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xG8U7TIsKlN/tujt2SnC5DAcpADsKwXN5jx1HZq7xoA=;
        b=F2VKw8XdaRmp+cgN0LfUsrsVPz1BRn10hICLYq0nTG/hyeDo1OQdZLc78Wigb4qKUz
         Jup8ja6njuBGmADHyTVYxO2tzVabGdI33zS0roUlUx+xiXWK5CYB3nt/mXcLhyg5cJ2d
         4Yn9jNF46gN6sko6ZD5BI83cjmPgeNuWr/cgdQp1WrS4ctc/LaBDzeuuupSmULc4+pBB
         ec7KV2G0/TrLnRB/uJ4YL1XP0roZQfA2+EzsxCihNS6O1YjjUoXrp4Dm133vUZzmdVL8
         GU/k+D+wKfadrSXOZAAauwdnlfBUA9grfO+PfEEHc7Oh1xxNVBl7Ij3q9mHN3AbYfoN2
         99wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N+6y8fmH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si17355945ybg.242.2021.01.10.04.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 04:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N+6y8fmH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyZSe-00045b-Eh
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 07:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyZST-00045Q-6g; Sun, 10 Jan 2021 07:04:33 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:42420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyZSI-000110-NN; Sun, 10 Jan 2021 07:04:32 -0500
Received: by mail-yb1-xb35.google.com with SMTP id j17so14133172ybt.9;
 Sun, 10 Jan 2021 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xG8U7TIsKlN/tujt2SnC5DAcpADsKwXN5jx1HZq7xoA=;
 b=N+6y8fmHIRt6FXQcqTurEgi6FseIdbSInE3gCZWiDPaYoiNXy2y6hM/gdPx4FPsem3
 NrCgzcKhPby7JX9FJGsIiKKJyoucyktGuOIEn3A9gs3bf+3A00Vty4JbK1reqeb25oTp
 8xdzxOHGd7v7JUWgVeKqSpK4KILcSgyHkuZBeJmTnO9wnGB1lQjC4JXlpn4hF9b8P5UW
 yfmWuNItHgJP0fqB6kk5vRQrd3djDSzAqR/Ibbgw+c0zzW00l7Gz/gGQWcU72H11Xcwe
 f1Iv1fpncfv1r9y4dqEYYnM+gZ/d7Sx96LEZh8AFHK56wB4GG/fn6zaFIuCV2xbVE+jq
 DOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xG8U7TIsKlN/tujt2SnC5DAcpADsKwXN5jx1HZq7xoA=;
 b=LZ/RpEMoTVEcCxWRIgNpqof7g73e3s4sMlnQAUaAVvq/vJw3sF1qVPXhIHTBqQ5CGK
 wEbY465w22a4HFOY+6UF/dTpGfvJ9MnyxjFeXXpfjhPw+yImnw85Nu35Hh0AcL0+a8VG
 arjtQ6X83Ey0axBdW4KHYud3q360rhnCnAmaPfO2vqZm7P1mA4jDn6w07tbHTPdjtZ1w
 nnxUqGviBGUYyu0FlE+/iAE4NU1X07kh0fVx4kxsaZWB818YcQR5Agnvyav0eyFV+4ri
 GZCY1Wp/vJEMm9EqPQMVZpTeVYHqecaSfybyeaxg82rV3Zs5Ip3dx5PI5XGzZiYHbgd2
 i3ww==
X-Gm-Message-State: AOAM531luXcevwxY+26+5uept8OIJQ4ZQVptON5KlpMtUTU/LtAdaPqG
 Wj26/E/fe5HnVQJCp47cMFA2cKiIAwiNpMIueuA=
X-Received: by 2002:a25:690b:: with SMTP id e11mr17502703ybc.314.1610280261611; 
 Sun, 10 Jan 2021 04:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-3-bmeng.cn@gmail.com>
 <40b62e4a-6139-7427-77bc-b33436687f92@amsat.org>
In-Reply-To: <40b62e4a-6139-7427-77bc-b33436687f92@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 10 Jan 2021 20:04:10 +0800
Message-ID: <CAEUhbmXkfikgjOMoOqf6DSmngftZPci5hRpGpDVU9aJvp7QB8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RTusV2/4ezwk

Hi Philippe,

On Sun, Jan 10, 2021 at 7:15 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/10/21 9:14 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Usually the approach is that the device on the other end of the line
> > is going to reset its state anyway, so there's no need to actively
> > signal an irq line change during the reset hook.
> >
> > Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
> > imx_spi_hard_reset() that is called when the controller is disabled.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v4:
> > - adujst the patch 2,3 order
> > - rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusio=
n
> >
> > Changes in v3:
> > - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> >
> >  hw/ssi/imx_spi.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index e605049a21..2c4c5ec1b8 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
> >      imx_spi_rxfifo_reset(s);
> >      imx_spi_txfifo_reset(s);
> >
> > -    imx_spi_update_irq(s);
> > -
> >      s->burst_length =3D 0;
> >  }
> >
> > +static void imx_spi_hard_reset(IMXSPIState *s)
> > +{
> > +    imx_spi_reset(DEVICE(s));
> > +
> > +    imx_spi_update_irq(s);
> > +}
> > +
> >  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned siz=
e)
> >  {
> >      uint32_t value =3D 0;
> > @@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offs=
et, uint64_t value,
> >          s->regs[ECSPI_CONREG] =3D value;
> >
> >          if (!imx_spi_is_enabled(s)) {
> > -            /* device is disabled, so this is a reset */
> > -            imx_spi_reset(DEVICE(s));
> > +            /* device is disabled, so this is a hard reset */
> > +            imx_spi_hard_reset(s);
> > +
> >              return;
> >          }
> >
>
> Almost good :)
>
> DeviceReset handler is a hard reset, so you need:
>
>   dc->reset =3D imx_spi_hard_reset;
>
> Thus you also need this function prototype:
>
> void imx_spi_hard_reset(DeviceState *dev)
>
> Eventually renaming imx_spi_reset() -> imx_spi_soft_reset()
> will make things even easier.

Now I am confused. The v3 patch did the above already, but you
mentioned that usually the hard reset includes the soft reset. But in
the hard reset the imx_spi_update_irq() does not need to be called.

Regards,
Bin
