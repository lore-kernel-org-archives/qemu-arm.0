Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp238292lfo;
        Thu, 28 Jan 2021 05:52:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLc5Z402aarTdeyX4nm5y3rIK2lw9KCJIL3HnfIwnQ2IutfEdVbCcLxQWkR1E9kf1fU8qA
X-Received: by 2002:a25:7183:: with SMTP id m125mr17791423ybc.151.1611841932824;
        Thu, 28 Jan 2021 05:52:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611841932; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+W2bRkELGpi2hiRIpOXk1iQKB0f5v5j9P8VVEWBO+l+11BNGaB7x+/XTvt97kUcp2
         tKPY+M4jGSnUD/zw56wJzJLsFUy24p3seIg05xHwKwPZNi+svcL/Kfdqbyk4YRFmOo+0
         +Hf2M+skKIXarjC1AqLoOEgBbBGhJwKUh45aJ0mEXQNCCIOpfj7JCRXjIv/lbxVCGoQa
         8pF7nILqFUf3NdNmQh217In0AjIpWFUzeWZd3D+dMWLm31WiBFuo2hwjmyapt4ZoafUf
         sbc4/6gos+dn55n8hZEzr5Z8HXHcaeyEYuTWWpry/iiyc3xufyVr0eU70Aphl8+JtnqA
         II/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdfMHvHalYSR0XyKeDsdIX+AReyjSJNYN5Pz1VQ3A9I=;
        b=wM3M3sq0z/d3N/DpwQMLbfrRNQam6lrj4Wu7h1g6CuDUmlOvvSmvZ7AFFNt+AnDqe/
         C1+Gitzl16y6SNoiotOjV/P0yAo/XhmWA6uguvHsTPlRW/yX6Hg9dVCXOwquJ/zrvM20
         NseMrmrzspkpGDAt1OtV3FSueDauEwuJMZ0jJOLZXrTLipC3pwoafHvKm1SXXYxfEkTV
         VmlTS6nlRA2bPpl1dwQ3uVpFHtGlumQHyebJusfzcqvq/ntqx0G6U+nDddOP7m4NLgtH
         ClCyxt45aZMNAXvT5IApc6asp23zSUdgUY+qwXChajS0FHHIZe1DNy24neyD/JTsrvNH
         UrXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xnI2+13z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si5526637ybi.246.2021.01.28.05.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:52:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xnI2+13z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57iW-0004NJ-3D
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57iI-0004Lp-E6
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:51:58 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57iC-0007dT-BE
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:51:58 -0500
Received: by mail-ed1-x52a.google.com with SMTP id dj23so6645121edb.13
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdfMHvHalYSR0XyKeDsdIX+AReyjSJNYN5Pz1VQ3A9I=;
 b=xnI2+13zFHB563xKjxw6dEhAAJvAN9NhCoKrf9c/4ATzLS98yrlCOxiAFH6u6tmNl1
 Duvx0Op33030b+lc5Fv8wUiHCoCvG4hkeV8NbJrZ1dR1ZCXJwSGEQ76IIs/3JtHf6BBp
 b0YXV3K9onVnIS4nKDvTSReOIshZ4gAAGOBaJmxidVcCc79tX/2/1XFYvUSJaLRVcocZ
 hFxVteMTv2oFHhGjZqK8GjtPChukmKimdVeFabAfr6xESdEqSE6+kKNBHBow5CA1MC0+
 0R0l0Fx6mEBxke/cu1nW44EHEQZQ/owoKlw7Y2VqgazBDk3rANea6Gsgn/JbdR2O5Rxf
 RKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdfMHvHalYSR0XyKeDsdIX+AReyjSJNYN5Pz1VQ3A9I=;
 b=I59cFx59th0ategniS67CxWsb15hnKh8FbbetTtt0S4gR/xC+ZiRFtUdty5wgq3K4T
 UhzA2Lm8JZXBM6mqUCZJb00oRIrA1Fsen1zQoIGJ/94mB+rXnATj/g6fJDa9puy3QzAq
 74eJJZreR3n1Y3uTjY0Y8C1nnwvtdT/6sJZzg894SbquNAn+8xhk9vmxyX9mvCHrCWFe
 RLz2Fq8KDixOOabIsx4LTcN78vK+wdR5J9Qi2+bTkdZgZgr43a/qxNUka3QjAi1AcXAU
 8wUfxDqe3Lxpw3Cn0w6A7InXxoiBCIx5Vo6LwG1AjG+2FnOACaTXDU2m/DYjuDNzoYzL
 4J8Q==
X-Gm-Message-State: AOAM530D2uVqD1WpaENTNU7ffF8XthA+H7UdS7xOBxVVSVT5XiJ9w0MI
 6C/EH5hiqdgxwcGK2JKTjLLOBaQ/A7yGC0vmNWcR+Q==
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14592397edb.146.1611841909180; 
 Thu, 28 Jan 2021 05:51:49 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmWXTdL=DU0bRNJqx--2_=qa7kLpru7PE5jK4GxZRMWU3w@mail.gmail.com>
 <CAEUhbmWutywRhPNRQJccfo+ojUFL=P4K334zG7L=ZtdjwM_tTA@mail.gmail.com>
In-Reply-To: <CAEUhbmWutywRhPNRQJccfo+ojUFL=P4K334zG7L=ZtdjwM_tTA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:51:38 +0000
Message-ID: <CAFEAcA-yMfP27RKyDyUqNcnwArxnPcSV6z2U3AC-FCM4WisbpA@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cVgFUtUEfbr5

On Thu, 28 Jan 2021 at 07:15, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 9:36 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Tue, Jan 19, 2021 at 9:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > This v8 series is based on the following 2 versions:
> > >
> > > - v5 series sent from Bin
> > >   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> > > - v7 series sent from Philippe
> > >   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
> > >
> > > This series fixes a bunch of bugs in current implementation of the imx
> > > spi controller, including the following issues:
> > >
> > > - remove imx_spi_update_irq() in imx_spi_reset()
> > > - chip select signal was not lower down when spi controller is disabled
> > > - round up the tx burst length to be multiple of 8
> > > - transfer incorrect data when the burst length is larger than 32 bit
> > > - spi controller tx and rx fifo endianness is incorrect
> > > - remove pointless variable (s->burst_length) initialization (Philippe)
> > > - rework imx_spi_reset() to keep CONREG register value (Philippe)
> > > - rework imx_spi_read() to handle block disabled (Philippe)
> > > - rework imx_spi_write() to handle block disabled (Philippe)
> > >
> > > Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> > > (interrupt mode).
> > >
> > > Changes in v8:
> > > - keep the controller disable logic in the ECSPI_CONREG case
> > >   in imx_spi_write()
> >
> > Ping?
>
> Could we get this applied soon if no more comments?

Sorry, I think I missed this re-send. I've reviewed or left
comments on the patches that were still unreviewed.

thanks
-- PMM
