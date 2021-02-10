Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1102788lfc;
        Wed, 10 Feb 2021 01:08:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh0KrMNTNDeSDXKZvFCs96dS7F67EEEx3tkB8YicOH9QnzBhSEh+lU6pJIRDGG3qZN277m
X-Received: by 2002:a25:b048:: with SMTP id e8mr3037718ybj.0.1612948108807;
        Wed, 10 Feb 2021 01:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612948108; cv=none;
        d=google.com; s=arc-20160816;
        b=Tm22EB2XP8gR1l4TeyBen/5dbilV3V32V8tEJYOB4Ujj+aXt/QuXD0LwUP8xWdhthh
         s1GL0DrdI6AhNhz3/tlrzKDQDdvAG+ob7cSXuwzUqi4fchUGQbx2qVfM7d9++Qk7LshK
         hBKCurW13o5QmfQvYqo05gux8pPUymGVfnDetr4ZFiFgGF7ub23W+fNMWgnxZzQ/ZH+E
         pTvjX26iyv8+oxoUbnJS0xyulSRfZutq23sNj3aHGxq1QGwosi388oPgDEonuQPiRp7N
         77SFpciN0Tq/ms1d8Duiom9WBUKjx4D+N0jr+U1bNcWisB9BSwril3opXmOnoDNNYiGj
         cpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XB7IoY7qmrAklnZkzXGAxKo8Jj1EfjuEYmouH+ifTgQ=;
        b=EZoVtUBMJQOe55t+zrM0GTBMsi418m/tey7rU+3nHskgP55cfbZblL/qLT4OXaHQSJ
         KIGMeQMpCBy2c719Sr/SiwCDeThhHzIPpgD81U1ApoZ0U3S1HJ8UchREAW3uq0jtQ4ZB
         Iae4mdYeIlGQj4moEFO4oW8B8Dnp3/XxUZxTyZlMuQyYiT1EpcnVbfd4VxDUEgiUerXW
         eL57dCdujayuAUvoMXAG7cRrT2YGUyvl9NhOSuu8vlXvZitUna04Z6IDgredXa1mAMJE
         DhnE/AxH0+6obBnOWb+6FJbVD9bi7f5krVUpclK9ki9OKy8r7VkPcQ7Wd+OeEsqL9m2Z
         3ZFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eGElY7w8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si1528272ybc.205.2021.02.10.01.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 01:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eGElY7w8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9lU4-0005KA-4i
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 04:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9lTr-0005Jx-Ad; Wed, 10 Feb 2021 04:08:15 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:33383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9lTp-0003mZ-KJ; Wed, 10 Feb 2021 04:08:15 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id m76so1318291ybf.0;
 Wed, 10 Feb 2021 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XB7IoY7qmrAklnZkzXGAxKo8Jj1EfjuEYmouH+ifTgQ=;
 b=eGElY7w83tyrtKJFPKu3XIqPDhnawtKmvAcKoAgAElxGr/r22iQz1HyQIhKrMIKAfc
 NfqUoV/fuAAUHLWBAk/2r1cTBijYhDi5Fqf8o7oRDbjaAVOlhAHiFZrbyxlDMiCHjIYa
 KTbE6U6ey3bRy+ianLK8Qd2PdvWej6/KNWEeqZBvG/t9HxG+DRm7/mPzxghNIiO+h/9x
 mqUY7UPXamJsvOL0Y9R/c8U+/7FarYVmK7Tc3NvFy6hhDeWNrWBjcAfNIbLfOlUiq3X5
 4Hym+KkbIVIN10u73O9d0NI0M2oPjCbLll4Kz7B19A68Gjcf/XllK5T7Yc5ExTRi7kiV
 G3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XB7IoY7qmrAklnZkzXGAxKo8Jj1EfjuEYmouH+ifTgQ=;
 b=H8AI/RB8ERytAew/7t/O3te5AcwrV7yfkD0pdzcSjZ9zBjsXgA6xC3BWp9KilS8v1x
 7HD51WSy89/iAMCwWQDE5a4pl5aacdjYL/jAPfe7B0D/uKSJSj7MgDwi6ajCZHMUdf7D
 s/Rkp3+52h3lKkiiRa+cJqHeD3+4V9BPaSEO1ZqnDmZXAjqF9sSQ/gpdoxBPrGasjS/Z
 o9hDqYoQYexKr4i0qs7dzC0H5G61BchI3qwUlOnYP3MxdEcpLAo+ATbec3QBbbqXVrlp
 A8i7YV0fbo0vJbRYcxqlbq2cSREwE5sOZBniBmBotM7J5b/eZb0dL/wmXgXmpVUkjF6w
 vKnw==
X-Gm-Message-State: AOAM531YDGVl26yKIJ/8yUAgEASd1NLrKXBkskzooyLLTdXShsqBRkn/
 jXNFyNkPITHiXz8zaCDZNkk5L7f2m75fyr4aaok=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr2618039ybm.517.1612948092473; 
 Wed, 10 Feb 2021 01:08:12 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
 <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
 <CAJy5ezqPC365CAjzMmAfSyKw9uL+ur48bD4=WmMQWHA+_fCE=A@mail.gmail.com>
 <CAEUhbmUfwOwkcLhW9X0R46rAX3R7ygu2osgCqmuY0cne706MtQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUfwOwkcLhW9X0R46rAX3R7ygu2osgCqmuY0cne706MtQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 17:08:01 +0800
Message-ID: <CAEUhbmXuEa4J45fi0yjpC81uP5DZ0DuZxjpFbffNqWUAjr_v9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/Hfd8BVPCTy

On Tue, Feb 9, 2021 at 10:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Edgar,
>
> On Mon, Feb 8, 2021 at 11:17 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> >
> >
> > On Mon, Feb 8, 2021 at 3:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> Hi Edgar,
> >>
> >> On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
> >> <edgar.iglesias@gmail.com> wrote:
> >> >
> >> >
> >> >
> >> > On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
> >> >>
> >> >> Hi Edgar,
> >> >>
> >> >> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
> >> >> <edgar.iglesias@gmail.com> wrote:
> >> >> >
> >> >> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> >> >> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> >> > >
> >> >> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> >> >> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> >> >> > > crash. This is observed when testing VxWorks 7.
> >> >> > >
> >> >> > > Add a basic implementation of QSPI DMA functionality.
> >> >> > >
> >> >> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> >> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> >> >
> >> >> > + Francisco
> >> >> >
> >> >> > Hi,
> >> >> >
> >> >> > Like Peter commented on the previous version, the DMA unit is actully separate.
> >> >>
> >> >> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
> >> >> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
> >> >> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
> >> >> different like a DMA engine in a ethernet controller.
> >> >
> >> >
> >> > Yes, it's a separate module.
> >> >
> >> >>
> >> >> > This module is better modelled by pushing data through the Stream framework
> >> >> > into the DMA. The DMA model is not upstream but can be found here:
> >> >> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> >> >> >
> >> >>
> >> >> What's the benefit of modeling it using the stream framework?
> >> >
> >> >
> >> >
> >> > Because it matches real hw and this particular dma exists in various instances, not only in qspi. We don't want duplicate implementations of the same dma.
> >> >
> >>
> >> Would you please share more details, like what other peripherals are
> >> using this same DMA model?
> >>
> >
> > It's used by the Crypto blocks (SHA, AES) and by the bitstream programming blocks on the ZynqMP.
> > In Versal there's the same plus some additional uses of this DMA...
>
> Sigh, it's not obvious from the ZynqMP datasheet. Indeed the crypto
> blocks seem to be using the same IP that QSPI uses for its DMA mode.
> With that additional information, I agree modeling the DMA as a
> separate model makes sense.
>
> Will investigate the Xilinx fork, and report back.

Unfortunately the Xilinx fork of QEMU does not boot VxWorks. It looks
like the fork has quite a lot of difference from the upstream QEMU.
For example, the fork has a new machine name for ZynqMP which does not
exist in the upstream. It seems quite a lot has not been upstreamed
yet, sigh.

The CSU DMA model in the Xilinx fork seems to be quite complicated and
has lots of functionalities. However right now our goal is to
implement a minimum model that could be used to work with the GQSPI
model to make the QSPI DMA functionality work.
We implemented a basic CSU DMA model based on the Xilinx fork, and
will send it as v3 soon.

Regards,
Bin
