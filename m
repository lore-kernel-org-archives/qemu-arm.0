Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp936215njb;
        Thu, 1 Aug 2024 06:56:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAYVaKBMb+QATpNd2266kb+kXBKUcDJpqcfK+OXxgMyaE1wO72v6NrF18+aPKSCRH7wzXoE28T4YeDnNEvnHZWpREfHogk
X-Google-Smtp-Source: AGHT+IHusIx8dFigwCDcX9iE3FJZcSd4As0WRMf2ttgAdBesCSPA1Y+CbQwP1eRtmqwSz1wVs65W
X-Received: by 2002:a05:6830:6dcf:b0:709:49c5:fd99 with SMTP id 46e09a7af769-709b31fc75cmr230877a34.4.1722520566181;
        Thu, 01 Aug 2024 06:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722520566; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6PwpI4pRnIIbuC/Bv61owC5qsnFA3gaQEA6ce4EtKvoj1fz5fJd8Goh8FyVQkWO/N
         gaaZ7zigiT5UjQsEKriWOAr4vZWKpBALTnXeh+QhcVuwoN7BcOecsUWxw5ZcGNbMTLfp
         0bXCHW0srL++FzLDPvIU++e2+DTC/YQvRBx3crsnFyeRN2y3Wlp1HyCh3KGOyr0+4oGX
         UPx/nXVnxwrfIvmPJ131IV0xnPpjzRqeKsrEzswFpYlviu8qQGV5FqxX0/jPs9pV4tcm
         8M24/mevQzAYx02qKPqSsmlfUf5SZGwqFJU4/FSSzorpOIguHTXxKSSkfeNb3eaKkCP4
         XVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0MZp10X+tqR0pGIQSfiNJKCWljR+FU4ph0z8rqaSaxI=;
        fh=d6pdI99bZZb9WwhhEyP7AeqaOCkqRoIFC5XhhxSXzLY=;
        b=tHb/vaHRotpBHUrPZFa3Rh24Q2dqxA4zZaYrzmBobeWENPyxPwvAM7+t5OA0QEFDqc
         iHCjL+XUFrxEMxRshNJqxL5Lp0ZzrwqUODwwUzzUJVAFcFZ+mPyIg2hCwu/YPr8xnCqK
         zlgBE+x2PORKvPLUR1KFbJWHWWD1LzUTskWgC8mywfISZ8FGw2KJXOZT6+AofUjVrDTc
         y7ZhpEGgnUAKjl8mZrSyeqAo9z7RsHuIA3MhNmCY5/WonAccm9VUzo9WhysyI5Wbnlvd
         aTuyDsG+LV2gUVDTYv4bQhvaHSmUKezVQ/DfO9q7c9qQyXJeNLmjd2cjjmBMGrg4UuNP
         2nLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Sp5EDIRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe851b9easi185784451cf.690.2024.08.01.06.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 06:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Sp5EDIRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZWHM-0006k4-4J; Thu, 01 Aug 2024 09:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sZWHK-0006im-6i
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 09:55:38 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sZWH8-0002kb-PJ
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 09:55:28 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ef23d04541so82904021fa.2
 for <qemu-arm@nongnu.org>; Thu, 01 Aug 2024 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1722520524; x=1723125324; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MZp10X+tqR0pGIQSfiNJKCWljR+FU4ph0z8rqaSaxI=;
 b=Sp5EDIRbZgXOK2dlk+r6TibCqDtaP/H5cIhNOogu6nrgGeStrmnO0JnPL/o0KKXQoo
 FCivTyt9Lb4WFzQkYzixHYqdcw6fUQ44st+67N6XkQ81BgFqQCTIsdMG3P+Z3qX7sMAB
 tbvAbDtTA9OVOYtmD1ytMh3kvDkB7SwVdFfEfc3CsRyhn9SNjmTSC3q1pQYYrulDUjpi
 PAgpdD1873gWfHVgF+/9EJUxwSHMer9oOTFPbVn414KbYq5QvcEMAFSXIAKzmmpC7vzH
 IWU+7UwM8TCOiKCFfQtHWnx6PM9icoWqMEoiorjwrR06Fe+iH57iskCffmB/xJGrjRkD
 JR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722520524; x=1723125324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0MZp10X+tqR0pGIQSfiNJKCWljR+FU4ph0z8rqaSaxI=;
 b=uTWsS9dpy/EBsmRQY0KClINltwpzgV4usl/uMBr3lE0ac4tHd4fSS0xB7paEhm98n+
 GxsxI+gpqhHUhlPKP6INzhgxSCsvsSlpZhY7ju4UkqTyj58Oq9rNCr6Ng8K0VwImkGlT
 qIQYFaDAV/xdeobVGeYctQLakkMUUMKGIFh+OU6CxKdl4tOu6vl3vtIVmvFTroDWrC9C
 /2qmbkN0UbMc3Aw0cnkjOVWqlRmgpoAqt1P41Pj0hk09jqNZy/FZepxl8RvVHYHR34I8
 V5L0A3KT7v+Sb8cX7+50ZiMSFD5bOY0SXgAlplcktZURHCBvXX3SZjr3LcxgCWJupYTu
 GkTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRcsA+iSpPE6Dq6s5TaP2lnl5ZtGzKWmc88duDV+enDup8X567jAlUoTuH+AzB4g4GVygaTPb5kR4iy8H39/VSxtP5
X-Gm-Message-State: AOJu0YzZ1Yzaf8kjABtis5l208yOy8I+SZLCEyKX8Va4a2kWnHmE1yGj
 ah9OBvfjdl1vliQeVJ+ttdSOI0LkET6SbuBsEOjYkpqvP53ct6DLIX7JZ+mCXsHBzXsWHEqRh+k
 Td6vU1acxpqOcvuPEXHEAteXNPuqGSBC49T5u+A==
X-Received: by 2002:a05:6512:2c03:b0:52e:9ac6:a20f with SMTP id
 2adb3069b0e04-530b61ed13bmr1557976e87.37.1722520523597; Thu, 01 Aug 2024
 06:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240726055933.817-1-jim.shu@sifive.com>
 <20240726055933.817-4-jim.shu@sifive.com>
 <CAFEAcA-ZkcJvFkYyHGi9bXoPvqEzvV0b_z6xaQPLMK9qNHSdCA@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZkcJvFkYyHGi9bXoPvqEzvV0b_z6xaQPLMK9qNHSdCA@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 1 Aug 2024 21:55:12 +0800
Message-ID: <CALw707rwo8w3kFaga_17H+7JPneA7kahqBiLqwo6KGohLV0_SA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/dma: xilinx_axidma: Reset qemu_irq when DMA/Stream
 is reset
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=jim.shu@sifive.com; helo=mail-lj1-x231.google.com
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
X-TUID: 2aMcG94wyXUF

Hi Peter,

Except DeviceState::reset(), stream_reset() is only used in
axidma_write() and axidma_write() has qemu_set_irq() at the end of
function.
I think this commit could be dropped. I will remove it in the v2 patchset.


Thanks,
Jim Shu



On Mon, Jul 29, 2024 at 11:23=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> On Fri, 26 Jul 2024 at 06:59, Jim Shu <jim.shu@sifive.com> wrote:
> >
> > Current DMA/Stream reset will clear interrupt pending bit of DMA device=
.
> > The qemu_irq of device should be updated at the same time.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  hw/dma/xilinx_axidma.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> > index 728246f925..beb3fbf1d5 100644
> > --- a/hw/dma/xilinx_axidma.c
> > +++ b/hw/dma/xilinx_axidma.c
> > @@ -177,11 +177,24 @@ static inline int stream_halted(struct Stream *s)
> >      return !!(s->regs[R_DMASR] & DMASR_HALTED);
> >  }
> >
> > +static void stream_update_irq(struct Stream *s)
> > +{
> > +    unsigned int pending, mask, irq;
> > +
> > +    pending =3D s->regs[R_DMASR] & DMASR_IRQ_MASK;
> > +    mask =3D s->regs[R_DMACR] & DMASR_IRQ_MASK;
> > +
> > +    irq =3D pending & mask;
> > +
> > +    qemu_set_irq(s->irq, !!irq);
> > +}
> > +
> >  static void stream_reset(struct Stream *s)
> >  {
> >      s->regs[R_DMASR] =3D DMASR_HALTED;  /* starts up halted.  */
> >      s->regs[R_DMACR] =3D 1 << 16; /* Starts with one in compl threshol=
d.  */
> >      s->sof =3D true;
> > +    stream_update_irq(s); /* Clear interrupt */
> >  }
>
> The general rule of thumb in QEMU is not to call
> qemu_set_irq() from a DeviceState::reset function,
> and xilinx_axidma_reset calls stream_reset. I think
> probably the best thing is to separate out whether
> this is a DeviceState::reset or a software-triggered
> reset, and only call qemu_set_irq() in the latter case.
>
> thanks
> -- PMM
