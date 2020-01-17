Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10160345lff;
        Fri, 17 Jan 2020 10:29:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQ8Ft45hxWSj7MUsp3SCbyV1ZuRoReLvmwtmZftzmJ9jBmNjfX/cEB2EFabXjcokGmPbsh
X-Received: by 2002:ac8:6f2c:: with SMTP id i12mr8756783qtv.58.1579285791988;
        Fri, 17 Jan 2020 10:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579285791; cv=none;
        d=google.com; s=arc-20160816;
        b=hLDwwUYlFxTWjsa+r/4eGYOgG8BLiLOW0ZMuCWOl6vISmWECv+8hMd9Nm1c2jiHFQL
         TbljG3AoK8+rWwlMgoRwDYmRMlqLTciDOc/AgfCPiL+gDMVVFh6JgGBz88lA2k4hXyaF
         Qk0hSJHnFMk7F5Jltyo5TN4VycVAHSRxJcGXd4p+Pfd08gd3clEuy9NFnMLERRVH4cQp
         Y1mUz9wvjxXukJAq5DxBYNL8eYSeC3/91bfS0bSph5lTiOFSDqlsv9aQxd/zCUv4OfDd
         hwVKjVnK60yYX4Fj0xc9eXpG3T5pYvr5k0PXVrQGOsi4Q682qqX32IWl+mnDf4a7Ybcu
         9/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=ROPyz/f5AhqyNnlV8CsC/MUsp5r48yvDR1ZrQnvMJ4A=;
        b=pnrtcUMRetigZOSQ9rb36VnL5doiff8CVQpmN4rxJqs8sSmiKC7CPZy8gzJe3kHHdS
         EB6tyPLNKRUKVt6BgybVFFNHKLmqRNZ9QUHLndlt+SDKbIY+cY0o9/3p/bPhN1FELKVd
         s5i9ZMv8hV6j9AQ/N+i8aMWrFO9+Ev1cCYWufqHgPC/vw6FXVEtlqogzM7ysJ4XZ/NQT
         fYxigeGfr1ci9hdtZhjgkAMj0nNeu9tCL9efhZ6FlhJVTn/3XVv3o9NAG3Y2MROMcCUN
         vfRIz5zJ5Q6kagyr5bMNN2hYbPSZ0REvNF70rAgYNmc3/rnsc/PjaVge/Tka9KG1exVz
         oP6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BXDo7jjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x53si15017182qtc.8.2020.01.17.10.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 10:29:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BXDo7jjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isWNT-0006RR-Ei
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 13:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isWNM-0006RI-3a
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:29:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isWNK-0001HS-UZ
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:29:43 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:40151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isWNK-0001Gg-Nq; Fri, 17 Jan 2020 13:29:42 -0500
Received: by mail-yb1-xb43.google.com with SMTP id l197so4917884ybf.7;
 Fri, 17 Jan 2020 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ROPyz/f5AhqyNnlV8CsC/MUsp5r48yvDR1ZrQnvMJ4A=;
 b=BXDo7jjrlUZIFGB91S5G7FSKbyYXtU7ZlLi38FuNzLC+wxvfLu4oo6Mi9v+C5ggnlR
 o5tjgX8QI/kA8w9C9+0ba1HL1tn8MgwT3tXFhEBBVIIEa7LQXv9QGl17w/bjrzB4MX8l
 Tnp7kCPbtueIQcYzm3IDTqedMX1USPBaal9RmosuHidzzOcIdGNMY8Zy1rPb0KA9VQBK
 5/aDzir4YHiPKS//6BkMHElyY6BLMQ75gHFDmZ60gNpX1/JFopt5A4stlb7ftw6snneY
 e7QgtW6xxCxL22SpI7+pZ/TlJMtMQAT432GQK9YsGZXhklvLqnkb/cDbPFvy3i/SW7oY
 SOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ROPyz/f5AhqyNnlV8CsC/MUsp5r48yvDR1ZrQnvMJ4A=;
 b=nVQFYwo43uEMdii0sopzTzu3YVGSJDNZlyqTDeeiNs7Cp+7CzMIJWkLXNwTENFE+zJ
 QupHg9XEovEH5lhYjdAjTJ2dnQ6fFKVxRAucjfHOzNhZdVHwgQKZIgxTBToLchFAkNHl
 rWTQ87q00lGtIDrIXIPl1iOQz6BnA4eBzhSgHGTVPUG37McA0NKMmYtp9iHf4n9QnTzV
 lx276lYegIGDYviAgI/TF0e4hSFuiLR7hR0ySJi5bVgwJPCY3KF3LNa20DfktilBfMas
 XyY5ImXGYY+AFH40i1NmtPGeEFhk3Bxyd0MoHqZ24UPZoOX27n1HYXjkHLJEY8AgJAg5
 pSHQ==
X-Gm-Message-State: APjAAAWvU8QIotpgyrVSkXwBcvakko0zCX37ka4NppQ57yd9xrwXAt0q
 QOyoRknukZkHVQRyJYhmHmA=
X-Received: by 2002:a25:5a06:: with SMTP id o6mr30345918ybb.384.1579285781654; 
 Fri, 17 Jan 2020 10:29:41 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y206sm11930688ywa.102.2020.01.17.10.29.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jan 2020 10:29:40 -0800 (PST)
Date: Fri, 17 Jan 2020 10:29:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
Message-ID: <20200117182939.GC13396@roeck-us.net>
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
 <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UpI41+MKtCyj

On Fri, Jan 17, 2020 at 01:48:06PM +0000, Peter Maydell wrote:
> On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > The Exynos4210 serial driver uses an interrupt line to signal if receive
> > data is available. Connect that interrupt with the DMA controller's
> > 'peripheral busy' gpio pin.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  hw/arm/exynos4210.c | 39 ++++++++++++++++++++++++++-------------
> >  1 file changed, 26 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> > index c7b5c587b1..498d79ebb2 100644
> > --- a/hw/arm/exynos4210.c
> > +++ b/hw/arm/exynos4210.c
> > @@ -166,8 +166,8 @@ static uint64_t exynos4210_calc_affinity(int cpu)
> >      return (0x9 << ARM_AFF1_SHIFT) | cpu;
> >  }
> >
> > -static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
> > -                         int width)
> > +static DeviceState *pl330_create(uint32_t base, qemu_irq irq, int nreq,
> > +                                 int nevents, int width)
> >  {
> >      SysBusDevice *busdev;
> >      DeviceState *dev;
> > @@ -191,6 +191,7 @@ static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
> >      for (i = 0; i < nevents; i++) {
> >          sysbus_connect_irq(busdev, i + 1, irq); /* event irq lines */
> >      }
> > +    return dev;
> >  }
> >
> >  static void exynos4210_realize(DeviceState *socdev, Error **errp)
> > @@ -199,7 +200,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
> >      MemoryRegion *system_mem = get_system_memory();
> >      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
> >      SysBusDevice *busdev;
> > -    DeviceState *dev;
> > +    DeviceState *dev, *uart[4], *pl330[3];
> 
> Rather than having the uart and pl330 pointers be locals,
> they should be fields in Exynos4210State. (Otherwise technically
> we leak them, though this is unnoticeable in practice because there's
> no way to destroy an Exynos4210State.)
> 
Out of curiosity: Is that a new leak because they are now tied together,
or is it an existing leak ? I don't find many DeviceState entries
in xxxState structures, so find it difficult to determine if/when/why
there is such a leak.

Thanks,
Guenter
