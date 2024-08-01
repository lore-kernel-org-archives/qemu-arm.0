Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp928207njb;
        Thu, 1 Aug 2024 06:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUUaR6Tg2hxXpPa0i5vTXpCyW0bVsOFAtzVCFWLYFw2LqzY60EPay5BhM4OtjvCyPJZxQdkSBGkaEEw0DpRd+HbMRwvIw3
X-Google-Smtp-Source: AGHT+IGvwaSTr/OPyj9aEf3Qqlbkqnlqj9OGpBMpPJBM8pDPI1mX4TXY7ic+APjlAkTAb9dqGc2E
X-Received: by 2002:a05:622a:64a:b0:447:ecb5:3876 with SMTP id d75a77b69052e-451892af56fmr304921cf.52.1722519318736;
        Thu, 01 Aug 2024 06:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722519318; cv=none;
        d=google.com; s=arc-20160816;
        b=tqMHlL6h7/Zq+4BEV3jnNmnL3MjbctcuN78iF5ROv9mrfsbYIaXyXu1PvJtjsPv+9z
         GH2q11OabMVF1tjOww2KXBZRQx4hgrMjJT/yCatClHTIx230U6C/MQ0B3UgGbYG4Z8AQ
         USgP+26nY3T2eFH+8kTnF70Yjb1yNfgpAFWpeIl7l+hhUeKlJzWnXaHu5qGX4kbELNPj
         WpEFPB88wbU8o/o+jFiz0JacJ17CzPGTHilvaes0PU/G2HJjsaVDd6zXpYAlzyUGRw9Y
         BYDaE4xrx7/LjE9Vv2vitx/6oc7okynAv/GX2MLhTY+fwIsP6ofSiVTJekBuVlfnUsEP
         j/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=O3r4St+ANSSVmc/HccXT4WRX1PGEnvGIq4Svs0tqE+0=;
        fh=8+Qf6tFy29J8it1K00g6CwGkzy3d1U7iG+Lg1K13ETg=;
        b=gyEn2o44EV6bjUTvhkw2YVumZJ1YFR2cJvAoJoO9sY62SewXW15PbLxhNpYiqDHz3M
         /M0A8bjGtF9eZignfJR+Oy/Ykhdy5ofLimc5zwjUxhdPOH8aGBnXcselz/K2ojLsNLjJ
         yZ5xGslPsKI/F/5JGb3nGyWRWTo60Fm5lS8FcRjVV6RPTUf/D+A8Y/cAzrawRto5S2o8
         qnoNDtqL0wvKXbYHBNH7lEbyslAu3iqiOhp2dLeHzc3u3a/ZiFqcfNHUP0QTTlWi4hvK
         39lNS12XHtcZwnV0pgXA1dx5NMuSlNQkjHrXCyFxaa8mOireHw0k4Z5KPUdBM8V2pzJw
         khzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=ZXPJIoZz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe851af98si181505941cf.671.2024.08.01.06.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 06:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=ZXPJIoZz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZVxD-0007ib-Gs; Thu, 01 Aug 2024 09:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sZVxB-0007fD-0g
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 09:34:49 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sZVx6-0003vt-3p
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 09:34:45 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a167b9df7eso10975501a12.3
 for <qemu-arm@nongnu.org>; Thu, 01 Aug 2024 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1722519282; x=1723124082; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3r4St+ANSSVmc/HccXT4WRX1PGEnvGIq4Svs0tqE+0=;
 b=ZXPJIoZzipi97T45y+OsxxJa3sCmfFxAt8Og9VkwRKzvC70DXb6CUxLhsmr5b78XqL
 zlJ45kZIplOCdacCsYgpdnXOOTr4tY9J2CgH+ilST7+eMgg7Ti3gCSCsdGepGkvhRbcr
 nRcSGvuJaEESR2gQbCZHrTLGr8fBDmChtIcbc09UpyC0G9e+5z7SNIkCypLgccebKQVT
 fSivEwfzWg1Ge1mDf+CeN1uUWZPFU6JhUKzM5u7jhhjbxVF+KvEvhfGms8vtWrykD7A1
 urhuVSUVYitSjVeN/fM9QTg60ZTSdOIgwifBH5mHP3reihVXsWZkJCpaZWnkINXhO2Ne
 jcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722519282; x=1723124082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O3r4St+ANSSVmc/HccXT4WRX1PGEnvGIq4Svs0tqE+0=;
 b=l7Izvd3fBqVrUzn1++wGzjhQlj/0OCLwT3szxet2CFjcKcKep90dP4lZSjS1Fxni2j
 m8iCue6+qmhun43Frq9Ng9OuiEcQK6BSH2IVfNvt1A71AnFx0MUDfWnh29ckfPDgqFB3
 ypWCKQr0ZWdf/5OQxc6WIFjptEsyChH1Up45blU94NdOb1QKegCpALka5r/y2iKCyxCX
 eroNnFeX7QUcRgKwooHx7VZhnP4idrW2BTOkT6nJyJLVfHhq+iLJ5htPdw8AOFbmtS2+
 nVjOx0W1e94+g72SVx6qVGrijLCdZsb4bzKdzgijvUIzWZgsxWMlgTX2D5o9J5LZhDyT
 gb+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDKzxVvCCSTBH7InYea+0gHTl5uCN+3nRMStfLhC9+kF964YDf5JPgnuwZ/poywYIYvlsW8/SUevCXlIG/nn4RFig+
X-Gm-Message-State: AOJu0YyWj3ZVXGOlZW9f4+sIvc+kGCDxQvNXLHj/VbViL2VlEtn0/yTt
 HXsVRgvpQYttFoA07oAIrJLVclhBDW9slgO8CDgDnr+XUH2ijurfbn9I7Gh5Ht2rOoViIlo8Zxv
 C891GZDcBjTUhtSyrBPeMlG0Kk/ZMQ0RtyHwn0A==
X-Received: by 2002:a05:6402:457:b0:59e:686b:1874 with SMTP id
 4fb4d7f45d1cf-5b7f36f5040mr239688a12.6.1722519281771; Thu, 01 Aug 2024
 06:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240726055933.817-1-jim.shu@sifive.com>
 <20240726055933.817-5-jim.shu@sifive.com>
 <CAFEAcA_QmSdqTo4zmv=AKox2ZiJPt18vV4CwaLLp6VPLWBMcpA@mail.gmail.com>
In-Reply-To: <CAFEAcA_QmSdqTo4zmv=AKox2ZiJPt18vV4CwaLLp6VPLWBMcpA@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 1 Aug 2024 21:34:31 +0800
Message-ID: <CALw707pAUJWo8CytZ2ndK7fEQ9=rNVw1XVumLxX9y4VszWvVAg@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/net: xilinx_axienet: Fix DMA RX IRQ if ethernet
 disable RX
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x531.google.com
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
X-TUID: IXBmiF/gHRj7

Hi Peter,

Thanks for the suggestion.

axienet_eth_rx_notify() is also called by axidma_write() as a notify()
callback, so we need to check RCW1_RX in the function.
I think I could remove RCW1_RX checking in the enet_write() to avoid
double checking.
I will fix it in the v2 patchset.


Thanks,
JIm Shu.

On Mon, Jul 29, 2024 at 11:31=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> On Fri, 26 Jul 2024 at 06:59, Jim Shu <jim.shu@sifive.com> wrote:
> >
> > When AXI ethernet RX is disabled, it shouldn't send packets to AXI DMA,
> > which may let AXI DMA to send RX full IRQs. It is aligned with real AXI
> > DMA/ethernet IP behavior in the FPGA.
> >
> > Also, now ethernet RX blocks the RX packets when it is disabled. It
> > should send and clear the remaining RX packets when enabling it.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  hw/net/xilinx_axienet.c | 71 ++++++++++++++++++++++++-----------------
> >  1 file changed, 42 insertions(+), 29 deletions(-)
> >
> > diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> > index 05d41bd548..8428f10946 100644
> > --- a/hw/net/xilinx_axienet.c
> > +++ b/hw/net/xilinx_axienet.c
> > @@ -530,6 +530,40 @@ static uint64_t enet_read(void *opaque, hwaddr add=
r, unsigned size)
> >      return r;
> >  }
> >
> > +static void axienet_eth_rx_notify(void *opaque)
> > +{
> > +    XilinxAXIEnet *s =3D XILINX_AXI_ENET(opaque);
> > +
> > +    /* If RX is disabled, don't trigger DMA to update RX desc and send=
 IRQ */
> > +    if (!axienet_rx_enabled(s)) {
> > +        return;
> > +    }
>
> This checks s->rcw[1] & RCW1_RX, and does nothing if it's not set...
>
> >  static void enet_write(void *opaque, hwaddr addr,
> >                         uint64_t value, unsigned size)
> >  {
> > @@ -546,6 +580,14 @@ static void enet_write(void *opaque, hwaddr addr,
> >              } else {
> >                  qemu_flush_queued_packets(qemu_get_queue(s->nic));
> >              }
> > +
> > +            /*
> > +             * When RX is enabled, check if any remaining data in rxme=
m
> > +             * and send them.
> > +             */
> > +            if ((addr & 1) && s->rcw[addr & 1] & RCW1_RX) {
> > +                axienet_eth_rx_notify(s);
> > +            }
>
> ...but at this callsite we open-code a check on RCW1_RX and
> skip the call if it's not set. We don't need to check twice.
>
> >              break;
> >
> >          case R_TC:
>
> thanks
> -- PMM
