Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2171191ejf;
        Mon, 26 Feb 2024 08:43:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXW3/nSfwgBjtd7k2iH2ws1SLYZ1XEMm3Ya3MjjX5/xXSeXzrUuFiplieOdgLC71UJBhVSOTxrF3LNezFbmHc+E+9Kn7R90
X-Google-Smtp-Source: AGHT+IG0gZZp9evgnjbB6ILLsuiAmit4IFETegbIono8IL0ejX21oV/PAmaB4/0Vfu8KnGxB6lVJ
X-Received: by 2002:a05:6808:23cd:b0:3c1:a8fe:d688 with SMTP id bq13-20020a05680823cd00b003c1a8fed688mr1318754oib.8.1708965819739;
        Mon, 26 Feb 2024 08:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708965819; cv=none;
        d=google.com; s=arc-20160816;
        b=mLghqyfmyG3Dl7qRnmnf9ZLrMcBP7Toc0VkXmKG1kAEjIhp1tgDIopJ0nyXh7XuL3w
         RH4jgbljipgpNWt9GmDuT8Nx4ikjfG+gTRAXOofw0o27cqxwFhinCujuxUgbhOwrcsjG
         QC0qEdEKXCWyiuzDySGkAVW2WURZVLlr4Lchly+p+gWZeT2GnRAuIzf0iI+lFLlm/vjA
         DF8pxHLhJijGwJHTiuCsytfeNrRbe+h+6xtfkQpqhfFXZQCh7UtwAZ6lek7qsYjtbuyV
         9RlBgXMk/vnP5fibMlgjOD7KcyrKyQAGtkksaLcXAJ8n6KBegr95jLjGEvPeTnwmr+Y9
         im0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zacmyTmiqU9SagCBBD4kEIuUv8302gDFeGTxL6SrB94=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=F7VyXdi7Wq6wd+SO6O43FgfSRtMZUPLG7Y065gLsdoGAyEW9Nxqz6epE0SbO67CySV
         JjcFlwcjCu6n/p1mXlkIwIN7EoIWnl7DePyQBWApvuQPounbSQYqLklpkr6uLhA8aeVB
         nX1ujXGjHrm5h0p9YXLdc5aMRbWCA19YkZiOCARnkDEIhEae/C/e7NEw4l0S5UinbdcC
         5IIXCYEXyc7e+4bePHFD6uO1TTFyq/IQ4FkTRRIoSPHb6MH0X2kOGdxKUKOgcRz5sSf6
         +mbOeI8wRPTHIjvd8vNUSRV8r9LvMuDJH7B3P0CHTED9Fp+qUpGt+dLtjOaiVLnqKITI
         NSiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5YuYL0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ad45dcc000000b0068fe59b0e56si5462788qvh.62.2024.02.26.08.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5YuYL0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ree4k-00022g-82; Mon, 26 Feb 2024 11:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree4Y-0001qQ-2L
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:43:22 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree4W-00052X-C8
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:43:21 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso4141708a12.2
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708965799; x=1709570599; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zacmyTmiqU9SagCBBD4kEIuUv8302gDFeGTxL6SrB94=;
 b=K5YuYL0VHDQZeduBMJ0wuopizUdfpdbDgjuau4tOGM3woev4jdQ7t0uu6adxcJ2yNg
 fjHktMJOFaGlbYZ15MlvJUoafechBI8QpUU0rxEIU1Z0+I9RG6e1dM0yZBbfmJtH2rVi
 CIwRFG78mkiPMPQyHGg/iaa7C1yHlyI5fDrUvSdivXqzuivIJwevXb2YBIvjemYrDhJD
 9lO1EObdoAgA62CfgsKbUF1kA4l7oeS9lKEdoxMz0mQ8cv+DUzRP84BTzXb32ejXdyvg
 Cn4eJQxg7fbTdhuXOGkvq2RSXUhefy9VJDsuuaqoX2f7zTndroznSjt0cA9hE27Poo5R
 Jipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708965799; x=1709570599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zacmyTmiqU9SagCBBD4kEIuUv8302gDFeGTxL6SrB94=;
 b=iiKY7Nqgw+qNXmN6RpiYyunx+N/lOZu+/Z/fRdqpGXan6bSOnQSC0UDwEX8la2N63n
 9Jol6sW6DIM4fu2fxN3OLgsDG+9mqxdussBeeEP9I1Jh9qzOepZyA334MBosrV6OAg5S
 6UTkINeK4q4t+cu7gmgMgj6K2pFwPBuLouBGEHCBs2vA/8satdyjXQFl4iLjTFgClBoY
 QyYNJW614utlTvyQUgvvpBjh8HNEJ6opgD9vDlA8jXRTx5lY3vTsSvrTCTglYBoqyBFB
 ERryhR4FjIwt+vXTppo7AIat1s+uXFKmhHZN3O13jH+h5cpYIrmJSoEUGrvvXjJcyEMF
 bndA==
X-Gm-Message-State: AOJu0Ywnq2ZmqoejLVUXsf+Tm1RhwVoTfy/qT02mgpO2roFljaC5ksMN
 z3cu5YP6WXMGKXJGx1BLr6x8O0FaQ+VWjDib7sUDR0OBlEZQd9w4icAgL7kZzPfW51NKv3W6zWc
 d4VmIhhnPhnew6IEPN1MiDoBLH8G+qaclgycXCA==
X-Received: by 2002:aa7:c908:0:b0:565:dfac:a686 with SMTP id
 b8-20020aa7c908000000b00565dfaca686mr2923244edt.38.1708965798762; Mon, 26 Feb
 2024 08:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-42-sergey.kambalin@auriga.com>
 <CAFEAcA_xdowvZkxFC7ypEFRJSTLDkdx+9E3_fwPNY=S2sK5=UA@mail.gmail.com>
In-Reply-To: <CAFEAcA_xdowvZkxFC7ypEFRJSTLDkdx+9E3_fwPNY=S2sK5=UA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:43:08 +0000
Message-ID: <CAFEAcA88NqshmyH5czz8ZC0Kbb81_-8VHRMCSQDbpHrPwm6AWA@mail.gmail.com>
Subject: Re: [PATCH v6 41/41] Add RPi4B to raspi.rst
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hZYGmlT5QZLZ

On Mon, 26 Feb 2024 at 16:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 26 Feb 2024 at 00:03, Sergey Kambalin <serg.oker@gmail.com> wrote:
> >
> > Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/system/arm/raspi.rst | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> > index d0a6f08b2b..c21b27744e 100644
> > --- a/docs/system/arm/raspi.rst
> > +++ b/docs/system/arm/raspi.rst
> > @@ -1,5 +1,5 @@
> > -Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
> > -======================================================================================
> > +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``, ``raspi4b-2g``)
> > +======================================================================================================
> >
> >
> >  QEMU provides models of the following Raspberry Pi boards:
> > @@ -12,12 +12,13 @@ QEMU provides models of the following Raspberry Pi boards:
> >    Cortex-A53 (4 cores), 512 MiB of RAM
> >  ``raspi3b``
> >    Cortex-A53 (4 cores), 1 GiB of RAM
> > -
> > +``raspi4b-2g``
> > +  Cortex-A72 (4 cores), 2 GiB of RAM
> >
> >  Implemented devices
> >  -------------------
> >
> > - * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
> > + * ARM1176JZF-S, Cortex-A7, Cortex-A53 or Cortex-A72 CPU
> >   * Interrupt controller
> >   * DMA controller
> >   * Clock and reset controller (CPRMAN)
> > @@ -34,6 +35,8 @@ Implemented devices
> >   * MailBox controller (MBOX)
> >   * VideoCore firmware (property)
> >   * Peripheral SPI controller (SPI)
> > + * PCIE Root Port (raspi4b-2g)
> > + * GENET Ethernet Controller (raspi4b-2g)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> For the "no PCI/no ethernet" initial version, I'll drop these last
> two lines; we can add them in when we land the pci and ethernet
> patches.

...better, I'll move them to "missing devices":

--- a/docs/system/arm/raspi.rst
+++ b/docs/system/arm/raspi.rst
@@ -35,12 +35,11 @@ Implemented devices
  * MailBox controller (MBOX)
  * VideoCore firmware (property)
  * Peripheral SPI controller (SPI)
- * PCIE Root Port (raspi4b-2g)
- * GENET Ethernet Controller (raspi4b-2g)
-

 Missing devices
 ---------------

  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
+ * PCIE Root Port (raspi4b-2g)
+ * GENET Ethernet Controller (raspi4b-2g)

-- PMM
