Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp132054lfg;
        Tue, 23 Feb 2021 01:24:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLKTbpRlq7mG3k67LkL8wwo/iXtfLT7hZFr6UnCveHhAtIO6eRsyDZqGlSYDlfKyeLPBMn
X-Received: by 2002:a05:6638:2190:: with SMTP id s16mr4917575jaj.106.1614072269217;
        Tue, 23 Feb 2021 01:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614072269; cv=none;
        d=google.com; s=arc-20160816;
        b=zJ/eboo+MdBAjAYhKDqGVhYVuUyCblmGpMcY14z0l5UPT0cDc1Ngh7pf5Dy4X0Z+1X
         ppVzJ9gToltYaDUhHLtM3CVqydrySxqALJjUcC82UpiAhqKD/9syjajzKpuTHISFXekz
         fXQFJh07jsY+WhScklrNKtyu8C+Y8hfDXrjn2ZB1P0bJ5H8XGNIuX2pxApz3HdfBDRCY
         zm73l4F9N08WCJ4uG6QnTMqAr3CBml9ZCpc7lMCF4gL50SPydhVyAuw+vqoB3t2RofX+
         62NQ+RDwKoIFL6FejAXDfwy2cPDVs4x1ocWmCuQxZGkvF7A/Of4YpSASkX4H+8qnF46K
         UTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdFcHXIi2l6F4v6GC+vrTtJpdUQvJRG9CwLdjk9FXL0=;
        b=RZ1QU8bXsKLLsqOUritFQOw7utupMBqWXK/BvE4usEGmmfQM5mDu5nhkUCVcrzkl2l
         pbdnCoyZ8+NvLOT1CZDbjNkS1oGp2k6bqTS/YgW7eCtxXHL6j41MIyxWQ7pwOQJXDOhR
         IMqIBZMlNOziNGNzTN5lqufTOewtspy/kOGQRB6vjcUUUbqA7uQjSNMdArpZ3rKOg7pi
         8iZ9xDpYdjpueYWVyE42jqEOC2hT2lKXTtsphH4Cs6YBJc/ljuWkX0b/wtAvhiEcl2ZK
         ZZHom0XzguNpQu0XXw0yvgTfKaNgKeha81CwAkjguNMtFmDI1WR6ZScXJ6bl34KL6diO
         8BNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a8tTKoNl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si17543627ilr.159.2021.02.23.01.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 01:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a8tTKoNl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lETvg-0001sf-GL
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 04:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lETvC-0001qy-EA; Tue, 23 Feb 2021 04:23:58 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lETvA-0008AM-FR; Tue, 23 Feb 2021 04:23:58 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id f4so15775591ybk.11;
 Tue, 23 Feb 2021 01:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VdFcHXIi2l6F4v6GC+vrTtJpdUQvJRG9CwLdjk9FXL0=;
 b=a8tTKoNl8L1kszaxPeN7LuLjQL6dbhTilpRxEqDsWfq9MOMNzs8/EiIZHbq0boLl7Z
 y/l/xevqDLdMYC9ww58axSVC1sgv66LLzszsDgiFjACR9a1O7yUoEYj1jQXCk0g+j8PM
 fBFuRih0/gvygt9YuZYYNIAAqjWV8BFgx5JCunIalBHEjGBS9SLwpIjh9h/OpbJ0tvk6
 kuXlelexMGGLd6ugapQcZ/Osnv3w3vHi6g3ckupRlmttN5aBJTSn36NuEuQCgdnetkcv
 4w2qkYpjT2r6vGoS6yVMLt25J7e18UwpYKCRv1tcrKXzEkiwgcUZSZQQdRzygQpRTAdK
 G4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VdFcHXIi2l6F4v6GC+vrTtJpdUQvJRG9CwLdjk9FXL0=;
 b=pQissLkN+5uzbiyRpZHbwnbPaQPFSF8UtCipk23pbMdMcJJoHvfRVoRufK9794zG2j
 gDZrWYnZxASjvlkOhpK3y/oEe6XMwGQ639MsoH69A1t626jG85/CJ9rsH/JM51E9HD6j
 oSNLEHPG1RhGd8TfogfObgumTHapDsXITbpMl3d80vukPltHfxPDfLJKQfWAX3T0S2te
 CcgC411btu4EBIgnFlkX809LgRxyw7Zl53yYNpGDoyAyan+YBcbqF8ylpdsfYvVJ2chc
 tf77NZS4DKOIbMj95MhwyF8OU8huYaHi7+OASxNKlEiwslrlkecbrRPtEIK7pM/i2H54
 25Pw==
X-Gm-Message-State: AOAM531q91M5MwClDgHyP8sCGvG8HVMiJVOvU9JboWavj+eeLOgXcgs6
 h32Hwen/fowMystUphfQFdBxuAv8L8wr0J7BfUIyfd+Z
X-Received: by 2002:a25:d17:: with SMTP id 23mr9112853ybn.387.1614072235045;
 Tue, 23 Feb 2021 01:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-2-bmeng.cn@gmail.com>
 <20210223092127.GU477672@toto>
In-Reply-To: <20210223092127.GU477672@toto>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 23 Feb 2021 17:23:43 +0800
Message-ID: <CAEUhbmX-nLxDYAHDZQga4ADpy2+2cnKsfxMYucxNC=zUdfFupw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA
 model
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-TUID: ePhzPZXIawe+

Hi Edgar,

On Tue, Feb 23, 2021 at 5:21 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Mon, Feb 22, 2021 at 09:05:10PM +0800, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> > crash. This is observed when testing VxWorks 7.
> >
> > This adds a Xilinx CSU DMA model and the implementation is based on
> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c.
> > The DST part of the model is verified along with ZynqMP GQSPI model.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v4:
> > - Add complete CSU DMA model based on Edgar's branch
> > - Differences with Edgar's branch:
> >   1. Match the registers' FIELD to UG1807.
> >   2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
> >      must be word aligned.
>
> The relaxation of alignment is a new feature, not included on the ZynqMP but
> it will be included in future versions. Would be nice to keep it but we can
> also add it later since it's not really related to QSPI.

I think Xilinx folks can add the "byte-align" property in the future
patches. Is this a new feature for Versal?

>
> >   3. Make the values of int_enable and int_disable mutually exclusive
> >      otherwise IRQ cannot be delivered.
>
> This doesn't sound right. The enable and disable regs are stateless.
> They both indirectly modify the MASK register.
>
> I.e, setting a bit in the enable register will clear the correspoding bit in the
> mask register, atomically, without the need for read-modify-write of MASK.
>
> The disable register does the opposite.
>
> >   4. Clear int_status after int_disable is set.
>
> This doesn't sound right either. Status is a w1c register, i.e bits get set
> when the interrupt event happens in the DMA and bits only get cleared when
> SW writes a 1 to the STATUS reg to clear bits (write one to clear, w1c).
>
> Other than the interrupt issues, I think this looks good.

Without these interrupt fixes, our tests cannot pass. We will have a
further look at your comments.

Regards,
Bin
