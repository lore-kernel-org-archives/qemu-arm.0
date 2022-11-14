Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3195760ejx;
        Mon, 14 Nov 2022 15:31:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67eW2WJ5CDgkyirlqLtr2N9CpXHJXypPHDU5eOnNLzYePVydCWtK507tidm3C1LsK0ycoI
X-Received: by 2002:a37:e306:0:b0:6fa:23d1:856f with SMTP id y6-20020a37e306000000b006fa23d1856fmr13652337qki.564.1668468691281;
        Mon, 14 Nov 2022 15:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668468691; cv=none;
        d=google.com; s=arc-20160816;
        b=sqYsi4Sb8JrRoKTy/Bv0av+atdxi+6Ufmd4ucfEZQVb50UPv2dDxEE46iP667ETSJM
         nEssJw6QPbCbIIcgL+z1uWyB+ZXVY+w/cYW8MnInOPWfjvc49I7mEpVuX1ryUZ+PLshj
         ldpoLXEYXIfcgUsX4R4gnc6jEW+W/6jx3O5mLX50f/39Ive3zZvtMvJpXOKEJWbhnrmy
         WVJWGHDoCZDJ9KlIzXPuF2YbhPcXETrcqPkL2SKJVS1j4f4U77mFTXjl5zf47TdLYlOn
         n3o+x8U4j6foH+tJfr55MEAu3kv2ZTCvkyzJJg+Fby9rplaihIf3uhogjd4VW+jOfhwI
         f9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UNcWyo4dEsCdrEF658NodGVxPzjNzPqCMlk3Adm9N8k=;
        b=S87OWl4HjsrYqfjqqvFECjdkHajnvrtouVcJtL/ALLcmLyIzpViidRKb14d/F9hOWQ
         GNIKmLCSzD475EfGvrzRZH8Q9pFk2Xc1n0aLAVO3ugOX+zDGrngxMhkIT3j919dAboJF
         oyTm6fDP2lbWwk3a43G0fd3LJeOTDc2JONs5YgTX0t7Fih92n+D2ZZUPyioho/TFf8ih
         c3sv4qrb+6Y+MIMgo0e4Gp8+Boxnh5PP7B7ZlhCHm/5p/sGV4S99UpoW/jPeKbA/B1w0
         hRKA51Gxlw8EKhGIZsjNoYzO9p04mvFcokS1ryTngHUQInXyPImIpmfol9Ar+HiWDPS0
         sHEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MagfRO+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ac87647000000b0039cefc6b46esi6332465qtr.312.2022.11.14.15.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Nov 2022 15:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MagfRO+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ouijG-00036V-7P; Mon, 14 Nov 2022 18:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouieb-0003Da-Fk
 for qemu-arm@nongnu.org; Mon, 14 Nov 2022 18:14:14 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oudNZ-00082q-8j
 for qemu-arm@nongnu.org; Mon, 14 Nov 2022 12:36:18 -0500
Received: by mail-pg1-x529.google.com with SMTP id o13so10836315pgu.7
 for <qemu-arm@nongnu.org>; Mon, 14 Nov 2022 09:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UNcWyo4dEsCdrEF658NodGVxPzjNzPqCMlk3Adm9N8k=;
 b=MagfRO+ZmzLQXhw9sniE8KwxzKYiECG7mCmvNdkhyslPcWX6P1ys4LVBs0U+z7zcVK
 9W0fdPVOVApQwabxHFmrew9s/CMByBv5kqZJYobmHVfWfWfoLHEsUMok+xU1JGW+eE7I
 Ch5sO8W5AQrnbNMdCOA08IOB/cHurnS8nkUK2pxdRinmqcfNhshmul6pPQNu5gukYmqw
 UsHJcxPbREKfEeVOM+uCUbrmVa+E/L2QaKQXNxte1/kVLBxBZnjsYJDVutNqhSQ000V+
 m7a1PkP4ajDiUhhD41Mh/23fSIOQi8Q1jd/q5dtdFWJd0b0oRmDE7AN0uaSYd6BNqHVf
 UwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNcWyo4dEsCdrEF658NodGVxPzjNzPqCMlk3Adm9N8k=;
 b=wqsY8yXej/fy1e5rGw8hFrpxREiPjBl+BE1Wx98wChhqWL1knk24ejYkpxq5iJ5/sp
 8zAJqt/nKpQI4f37HnUjrR4WulEbfbLD1OIRIKD6SrBFwB37DplC2iAYH8fyWzVR2gYS
 WZct4qpmR3xoHhK2GWdtY6hr4JkRbSrwthL2rHfRf+T7X8L0hvvy7lNi4O+ytm1JQUEB
 S8E6a7+szI7eihpkWQkTn8JUs+MNvSrs1Y9csv3xxgzAqusKUR3Ay+/JEaTzDf3Llmik
 ZuK4pQqY3a3GRj0QCDuF6cpARZjiuoS/5TcWKdUhBIX/IrnaIfUbjMJRJWuooc2tslqU
 KCnw==
X-Gm-Message-State: ANoB5pn7vFBQPQrmy+K6l3852XWjsDv8c7RPYpUo8HsIINvFgq+42E03
 B6C6snSEKtbK8O/qKtP/2UZ8ZXPdyfWthZODqGyiLA==
X-Received: by 2002:a63:535e:0:b0:43c:7da:e64b with SMTP id
 t30-20020a63535e000000b0043c07dae64bmr12830159pgl.231.1668447375689; Mon, 14
 Nov 2022 09:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
 <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
 <CABtshVRnwQiTypOFaOqVE69+1wbVoVJEy_x7ELez8Mo6aXT=Yg@mail.gmail.com>
In-Reply-To: <CABtshVRnwQiTypOFaOqVE69+1wbVoVJEy_x7ELez8Mo6aXT=Yg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 17:36:03 +0000
Message-ID: <CAFEAcA-s9a2zCy6O0j6=OXZOcYbj=_mS=aa2vxbKbuSMKNjMoQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gnorFxAPr1+f

On Mon, 14 Nov 2022 at 17:29, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> Hi,
>
> Thank you for your reply.
>
> On Mon, Nov 14, 2022 at 4:42 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 12 Nov 2022 at 21:49, Strahinja Jankovic
> > <strahinjapjankovic@gmail.com> wrote:
> > >
> > > Trying to run U-Boot for Cubieboard (Allwinner A10) fails because it cannot
> > > access SD card. The problem is that FIFO register in current
> > > allwinner-sdhost implementation is at the address corresponding to
> > > Allwinner H3, but not A10.
> > > Linux kernel is not affected since Linux driver uses DMA access and does
> > > not use FIFO register for reading/writing.
> > >
> > > This patch adds new class parameter `is_sun4i` and based on that
> > > parameter uses register at offset 0x100 either as FIFO register (if
> > > sun4i) or as threshold register (if not sun4i; in this case register at
> > > 0x200 is FIFO register).
> > >
> > > Tested with U-Boot and Linux kernel image built for Cubieboard and
> > > OrangePi PC.
> > >
> > > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > > ---
> > >  hw/sd/allwinner-sdhost.c         | 67 ++++++++++++++++++++++----------
> > >  include/hw/sd/allwinner-sdhost.h |  1 +
> > >  2 files changed, 47 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> > > index 455d6eabf6..51e5e90830 100644
> > > --- a/hw/sd/allwinner-sdhost.c
> > > +++ b/hw/sd/allwinner-sdhost.c
> > > @@ -65,7 +65,7 @@ enum {
> > >      REG_SD_DLBA       = 0x84,  /* Descriptor List Base Address */
> > >      REG_SD_IDST       = 0x88,  /* Internal DMA Controller Status */
> > >      REG_SD_IDIE       = 0x8C,  /* Internal DMA Controller IRQ Enable */
> > > -    REG_SD_THLDC      = 0x100, /* Card Threshold Control */
> > > +    REG_SD_THLDC      = 0x100, /* Card Threshold Control / FIFO (sun4i only)*/
> > >      REG_SD_DSBD       = 0x10C, /* eMMC DDR Start Bit Detection Control */
> > >      REG_SD_RES_CRC    = 0x110, /* Response CRC from card/eMMC */
> > >      REG_SD_DATA7_CRC  = 0x114, /* CRC Data 7 from card/eMMC */
> > > @@ -415,10 +415,29 @@ static void allwinner_sdhost_dma(AwSdHostState *s)
> > >      }
> > >  }
> > >
> > > +static uint32_t allwinner_sdhost_fifo_read(AwSdHostState *s)
> > > +{
> > > +    uint32_t res = 0;
> > > +
> > > +    if (sdbus_data_ready(&s->sdbus)) {
> > > +        sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
> > > +        le32_to_cpus(&res);
> > > +        allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> > > +        allwinner_sdhost_auto_stop(s);
> > > +        allwinner_sdhost_update_irq(s);
> > > +    } else {
> > > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> > > +                      __func__);
> > > +    }
> > > +
> > > +    return res;
> > > +}
> > > +
> > >  static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> > >                                        unsigned size)
> > >  {
> > >      AwSdHostState *s = AW_SDHOST(opaque);
> > > +    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
> > >      uint32_t res = 0;
> > >
> > >      switch (offset) {
> > > @@ -508,8 +527,12 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> > >      case REG_SD_IDIE:      /* Internal DMA Controller Interrupt Enable */
> > >          res = s->dmac_irq;
> > >          break;
> > > -    case REG_SD_THLDC:     /* Card Threshold Control */
> > > -        res = s->card_threshold;
> > > +    case REG_SD_THLDC:     /* Card Threshold Control or FIFO register (sun4i) */
> > > +        if (sc->is_sun4i) {
> > > +            res = allwinner_sdhost_fifo_read(s);
> > > +        } else {
> > > +            res = s->card_threshold;
> > > +        }
> > >          break;
> > >      case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
> > >          res = s->startbit_detect;
> > > @@ -531,16 +554,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> > >          res = s->status_crc;
> > >          break;
> > >      case REG_SD_FIFO:      /* Read/Write FIFO */
> > > -        if (sdbus_data_ready(&s->sdbus)) {
> > > -            sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
> > > -            le32_to_cpus(&res);
> > > -            allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> > > -            allwinner_sdhost_auto_stop(s);
> > > -            allwinner_sdhost_update_irq(s);
> > > -        } else {
> > > -            qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> > > -                          __func__);
> > > -        }
> > > +        res = allwinner_sdhost_fifo_read(s);
> >
> > Does the sun4i really have the FIFO at both addresses, or should
> > this one do something else for sun4i ?
>
> The sun4i sdhost actually has no registers with offset higher than
> 0x100 (offset of REG_SD_THLDC in patch), so REG_SD_DSBD, all
> REG_SD_*_CRC, REG_SD_CRC_STA and REG_SD_FIFO@0x200 should not be
> accessed from application code meant to run on sun4i. That is why I
> only changed the FIFO/THLDC (offset 0x100) register behavior, since
> that change makes U-Boot work.
>
> I could update the patch so all of these registers with offset bigger
> than 0x100 log error if sun4i is selected, so that is more clear.
> Would that be ok?

Yes, I think that's a good idea, but let's do that change as a
separate patch, so we can keep this one as it is as the bugfix.

For this patch,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
