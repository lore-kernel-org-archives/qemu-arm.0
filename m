Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp638302lfg;
        Thu, 8 Jul 2021 13:00:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoY3waYrKC3U0sGZKKFpDipoghhwxV/10OafMQkTokzhLSZgEogAIEucghCsUnfrpYzcEK
X-Received: by 2002:a92:d58b:: with SMTP id a11mr23575799iln.305.1625774401168;
        Thu, 08 Jul 2021 13:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625774401; cv=none;
        d=google.com; s=arc-20160816;
        b=DqManvWb8WaP9Fo9kSpUD2GwxoK2lM3EMTKLn90JG8l2Ax5iyDjDcwSYnmCWRI7o7j
         guduIp6YtFSbkbZml/+WR/5TBLh9Wv8KPtKqVv24UgWWcXsJdLCujhjCqV14/OLH/Fmy
         NSMKWS7BZvp8W6VS22YFmLphhFP3O6lT7gML/LLQK1Z5S6E9JlpcT3tJpGAKovUqRi/8
         TeV9JwyL+1wJ9R3Hsmm+wTxLzQczOZFNoh5qyFN8OHWontxbkquml8msP3u3AfI7z2KT
         7986hnqloA0q0AaF8S2MOWhESDVKaJUmkq1ZpYUhrhFdJDoH6Z8RTF0SjdBlwdD5N6ln
         pMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OOaquHkAVFf4QuKlVG5cWXqIFLuarnsqw+cLdBz6DcU=;
        b=rZJasv25TTYaUA+CjkSWEdUJw/eSfdEg4Gmmg06h2PIEH272oqPSXJP5nLzIDIS4VJ
         tNdczmA5QNR/S/zsiPE6GlZzX/p6WtCcVhN56Pe2hLRiN5fL9T6zghpI1sokQRnZC728
         aR6DwMyfv2ES4r0Fwr9sjJnXPv4GyomHSjruPqtav7AyVcS1ZEvo7WL68Hb/gxy8Y/yk
         3HxmEtMwxqZN8hktekgwnPptS5bJowUzqxguHYvjQWnhT1F3nhlkIFT15v85GOaIlucm
         pclEysvyjAmFnngYxE41DO6ErkNa4YhB7j7PD56U4v9KrPZQrNMzdZDNU/5aOESoSN87
         Qm/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=E9YrRxYH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si3181697ioy.95.2021.07.08.13.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 13:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=E9YrRxYH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1aBk-0008Sm-A3
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 16:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1m1ZtM-0006Yu-7q
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 15:41:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1m1ZtJ-0005wT-J4
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 15:40:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso4788016wmj.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition;
 bh=OOaquHkAVFf4QuKlVG5cWXqIFLuarnsqw+cLdBz6DcU=;
 b=E9YrRxYHoCWzrh1YXLd9zTMSiYF2cG01VLMbEmiG0UrtT/4uTsxinwylLeeTWsvrpH
 q0IkxkrQAh/rVnLEh5NVqfu0Nt9XxbQYMn5xFYMASAtWDeueVtPyGBgaHMARGnunUyq2
 pdZLA6idMlawAsbc+xtA1p0k2kh8wDVaEPTmhreCbsHpvQlcReJKLmT043WPq6vtZaxr
 DfSYNbfuPl2sie3g38yEYyqwF2ZcEACD4iDRH4kVBG7t540GecRb8IF6aRbjYF7U7Th5
 v7OgYYer+YuMa7v9/5G+sysLOJ+PxGoMYr/JolUBUnJ9zVH8TFeG6wD32ON7LVMWkvMh
 18Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition;
 bh=OOaquHkAVFf4QuKlVG5cWXqIFLuarnsqw+cLdBz6DcU=;
 b=oaME5BsdK1mGEh0qzIV3Fz7fXjzbpXMVtlkApzf3aq5zmcbKdbo/FC3b7uXYXvUegV
 kYXbPg98I57wFMqsgCF1f5yeAG1Qlnzcox8J03gm4dqz6wPjc2hjSGMxJ5dv8YuY5MGU
 FfKYrq7aDoP6AxAq+mGptxbuNccFaFD6k6iNhVubvDQduEY5e5+spYHIPsspTvyMeIub
 yy7JsoiQ72E4pU0HVzaq0CDlvGyykyw0t0t+D9bqDkBHC25kavMn0TBEC4hUrkRvQ6zK
 yP7rcJ/mhmaMbzZmDXjOzm/dfr7IWNz4Ck1TDMQaigHFCM+aHzawd+pqVlUu9zRwQnDr
 Q07Q==
X-Gm-Message-State: AOAM5337TpvV44yVgvSS/LP2V/YuuNlbhuVVxn3NnaMTBWaCHjFk1xex
 uNM9hyONgMHq9PgaXOBjrflj6g==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr34480571wmq.16.1625773255605; 
 Thu, 08 Jul 2021 12:40:55 -0700 (PDT)
Received: from leviathan (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id m6sm3798173wrw.9.2021.07.08.12.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:40:55 -0700 (PDT)
Date: Thu, 8 Jul 2021 20:40:53 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: shashi.mallela@linaro.org
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210708194053.ar4yspiodigxwbwc@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
 <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
 <20210604104204.z3hhm2cxesnm2jx2@leviathan>
 <16db7ae4bb0b38100a08f0539ae2865c15264f1e.camel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: or8SOBi3QJDQ

Hi Shashi,

Apologies for dragging my heels over this. And the couple of GICv4-ish
patches that have been
I finally sat down today and did the cross-referencing between GIC
architecture reference manual and GIC-6/700 TRMs required to verbalise my
concerns usefully.

On Thu, Jul 08, 2021 at 18:54:00 +0100, Leif Lindholm wrote:
> On Fri, Jun 04, 2021 at 11:36:02 -0400, shashi.mallela@linaro.org wrote:
> > On Fri, 2021-06-04 at 11:42 +0100, Leif Lindholm wrote:
> > > On Thu, Jun 03, 2021 at 11:31:21 -0400, shashi.mallela@linaro.org
> > > wrote:
> > > > On Thu, 2021-06-03 at 12:42 +0100, Leif Lindholm wrote:
> > > > > On Wed, Jun 02, 2021 at 14:00:41 -0400, Shashi Mallela wrote:
> > > > > > Included creation of ITS as part of SBSA platform GIC
> > > > > > initialization.
> > > > > > 
> > > > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > > > ---
> > > > > >  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
> > > > > >  1 file changed, 23 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > > > > > index 43c19b4923..3d9c073636 100644
> > > > > > --- a/hw/arm/sbsa-ref.c
> > > > > > +++ b/hw/arm/sbsa-ref.c
> > > > > > @@ -107,6 +108,7 @@ static const MemMapEntry sbsa_ref_memmap[]
> > > > > > = {
> > > > > >      [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
> > > > > >      [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
> > > > > >      [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> > > > > 
> > > > > It seems customary in QEMU to flag gaps in memory space (although
> > > > > admittedly, we'd already failed to do so here). This patch leaves
> > > > > a
> > > > > gap of 0x00010000. Is there a particular reason?
> > > > > 
> > > > > > +    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
> > > > > 
> > > > > And then again a gap (the one we already had).
> > > > > 
> > > > > No specific reason,but from ITS point of view tried to stay
> > > > > within 
> > > > > the GIC's 0x40060000 to 0x50000000 zone.The gap of 0x00010000
> > > > > would 
> > > > > also account for future GIC additions like virtual LPI support.
> > > 
> > > Right. I was more thinking 64kB isn't much space to extend into.
> > > Would it be worth pushing the ITS either all the way up to just below
> > > 0x50000000, 0x48000000, or 0x45000000?
> >
> > The current memory allocation size (of 67MB) for
> > redistributor(SBSA_GIC_REDIST) is already very large relative to its
> > overall required register address space.
> 
> > Hence ITS started at 0x44090000
> > (considering that redistributor space is sufficiently spaced) until
> > 0x440B0000.Future virtual LPI addition can still stay within the
> > 0x45000000 mark,

So, it turns out the practical problem here isn't the size and
placement of "buffer" regions around the ITS region - but the actual
placement of the ITS region itself, and the buffers around it.

While this is an idealised model of a GIC implementation, there are
benefits to it looking (quite) a bit like an actual ARM
implementation.

And GIC-6/700 place the ITS between the Distributor and
Redistributors. Both GICs support up to 16 ITS *per chip*:
https://developer.arm.com/documentation/100336/0106/operation/interrupt-translation-service--its
and for GIC-600 this takes up (ITScount x 2) + 1 64k pages.
For GIC-700, with GICv4.1 support, it is (ITScount x 4) + 1.

Now, I don't know if we fully want to support layout compatibility
with a "real GIC". But ideally, I would want to. At least for
sbsa-ref.

I think my summary-summary would be:
- I think we will need to introduce a compatiblity-breaking change to
  sbsa-ref.
- I think we will need to have support for more than one ITS if we're
  going to be able to use QEMU to prototype real systems.
- I think we should then start versioning sbsa-ref (like many other
  platforms already are). And there are other reasons why I would want
  to do this.
- But I think it would be unfair to hold this set back for it.

Which can be seen as a long-winded way of saying:
Reviewed-by: Leif Lindholm <leif@nuviainc.com>

/
    Leif

> > Leaving the whole area between 0x45000000 to 0x50000000
> > free for other devices.
> > are comments still recommended here? 
> 
> I would prefer comments on the sizes of gaps.
> 
> > > 
> > > Either way, the gap(s) would be good to point out with comments, and
> > > potential future use. I only noticed this one on like the third pass
> > > of reading.
> > > 
> > > /
> > >     Leif
> > > 
> > > > > >      [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
> > > > > >      [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
> > > > > >      [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
> > > > > > @@ -377,7 +379,20 @@ static void
> > > > > > create_secure_ram(SBSAMachineState
> > > > > > *sms,
> > > > > >      memory_region_add_subregion(secure_sysmem, base, secram);
> > > > > >  }
> > > > > >  
> > > > > > -static void create_gic(SBSAMachineState *sms)
> > > > > > +static void create_its(SBSAMachineState *sms)
> > > > > > +{
> > > > > > +    DeviceState *dev;
> > > > > > +
> > > > > > +    dev = qdev_new(TYPE_ARM_GICV3_ITS);
> > > > > > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > > > > > +
> > > > > > +    object_property_set_link(OBJECT(dev), "parent-gicv3",
> > > > > > OBJECT(sms->gic),
> > > > > > +                             &error_abort);
> > > > > > +    sysbus_realize_and_unref(s, &error_fatal);
> > > > > > +    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
> > > > > > +}
> > > > > > +
> > > > > > +static void create_gic(SBSAMachineState *sms, MemoryRegion
> > > > > > *mem)
> > > > > >  {
> > > > > >      unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
> > > > > >      SysBusDevice *gicbusdev;
> > > > > > @@ -404,6 +419,10 @@ static void create_gic(SBSAMachineState
> > > > > > *sms)
> > > > > >      qdev_prop_set_uint32(sms->gic, "len-redist-region-count",
> > > > > > 1);
> > > > > >      qdev_prop_set_uint32(sms->gic, "redist-region-count[0]",
> > > > > > redist0_count);
> > > > > >  
> > > > > > +    object_property_set_link(OBJECT(sms->gic), "sysmem",
> > > > > > OBJECT(mem),
> > > > > > +                                 &error_fatal);
> > > > > > +    qdev_prop_set_bit(sms->gic, "has-lpi", true);
> > > > > > +
> > > > > >      gicbusdev = SYS_BUS_DEVICE(sms->gic);
> > > > > >      sysbus_realize_and_unref(gicbusdev, &error_fatal);
> > > > > >      sysbus_mmio_map(gicbusdev, 0,
> > > > > > sbsa_ref_memmap[SBSA_GIC_DIST].base);
> > > > > > @@ -450,6 +469,7 @@ static void create_gic(SBSAMachineState
> > > > > > *sms)
> > > > > >          sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> > > > > >                             qdev_get_gpio_in(cpudev,
> > > > > > ARM_CPU_VFIQ));
> > > > > >      }
> > > > > > +    create_its(sms);
> > > > > >  }
> > > > > >  
> > > > > >  static void create_uart(const SBSAMachineState *sms, int uart,
> > > > > > @@ -762,7 +782,7 @@ static void sbsa_ref_init(MachineState
> > > > > > *machine)
> > > > > >  
> > > > > >      create_secure_ram(sms, secure_sysmem);
> > > > > >  
> > > > > > -    create_gic(sms);
> > > > > > +    create_gic(sms, sysmem);
> > > > > >  
> > > > > >      create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
> > > > > >      create_uart(sms, SBSA_SECURE_UART, secure_sysmem,
> > > > > > serial_hd(1));
> > > > > > -- 
> > > > > > 2.27.0
> > > > > > 
> > 
