Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4141470wrv;
        Mon, 5 Aug 2019 08:54:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwP/OolvhRqNdk2+ak7dr1pr4Gkvlqcn/593k+m22AuKLMPTTpMrLoKVarAXpAJiVt+U9Yl
X-Received: by 2002:a37:ac1a:: with SMTP id e26mr105073047qkm.231.1565020486880;
        Mon, 05 Aug 2019 08:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565020486; cv=none;
        d=google.com; s=arc-20160816;
        b=pTJDLeaoHKKZQis/IJt7oGL0NCaC1HCBWPeSKtZwsQK/OM5nEedaerofeFkzP/CX8a
         Ga6K2VVRHFR7NrawTMGmcdoe0aAl6zjQSnanA4Ql3tb3JrUw4Q18d3YvApeDK1NVLkvm
         x/ZyT4i45SnIcX6P71+30X3rWtW8RrKk9tLGOtZMedYHwXKGqFJaU5uLQvZxE+5laX7G
         r1aUkh6GiItn6xcYg+jNK57umqNJPl64+1QI8NkNSmBb35S6EsI8Hqwn2WuBbAwJDTd0
         pKJzy8awz0B1y5eN3sGg+sY72m2i3o66XfbyHifinByO/DT08mvtFRSXr20Gaux644od
         pzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBloa4YcUMZo9GWMPqvrhaW4sSVPGAS9NZhFVzzDhak=;
        b=du2zKsKaOzcAkGokQpfuPjbWcpYbuhiCDAVfBGG9TZSKdexDnkKwNxaNag09LgkY05
         1cTlvwRk5i5aqRj2fdeWsSPWX2iQrgCfIgjiuof7JOIgg5Ymlp86oex6OvtmayZmxCjD
         h6kMof/Kund6M+wiOh90OrCQUgmaVeWJHVBoCklUdKudDSYSD+1fVu8bqIjuMr8kXJae
         AeIlDy87JBiKiMuCbD0p67nrJrznXKEgJsY15gFNcGpSasYNhDCR4kfhSdmDwAJew4tM
         /9orxb6zswq+LJcTzuy56FtzOenI3l4tnux+kZx6u7FKK03gMFCV+GOdcOq5mT4oTX67
         cVyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xMVxVeGQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si48781803qtf.324.2019.08.05.08.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 08:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xMVxVeGQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hufJu-00044m-CX
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56937)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hufJT-0003em-Vw
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hufJS-0007r9-So
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:54:19 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:35823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hufJS-0007ql-Lm
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:54:18 -0400
Received: by mail-ot1-x330.google.com with SMTP id j19so9083270otq.2
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBloa4YcUMZo9GWMPqvrhaW4sSVPGAS9NZhFVzzDhak=;
 b=xMVxVeGQe0uzGm4Cm/amfZlriLdoKKSZph1H6seQTk0mz6hi0+mFwek8G90gFHp8+z
 JNigKfh2XgIF8tw2h7f/nf3wHBL7QrchxhWCqHKZCyHFITfpLJ867+p/Ci+m8YuuWzDz
 L3mi7wxGzSOqxUP0WLEZB9fbEwDyMkp4zfuchyyuztr8rhTi52/nsnPtVQWCy/3aJwMx
 w0y0dnCUi2HoXjZ/wFitfdqxqZ8Dp5tgCViKuU/PB5okXrGMl85D9Ubpagkf6gCG7uFg
 chCcZptWmcdHTp9QYM0gEbFg7IWna3+pBpo2hr3rtSgl4vrtOU8ePoxaj44QHPWpGcAL
 /d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBloa4YcUMZo9GWMPqvrhaW4sSVPGAS9NZhFVzzDhak=;
 b=VAhxjKYN9S3lghybI8uTwdaHxFlWBBfJJKUXoNe4clvhNnqPOROkckLnWWZQgtAbFC
 HxEcmkstHtjA2ubEemm2jmhFrdt/9f6COtUi/821MWbi5+wuZsCiAAlvjy/Kn70cwMZi
 WQfIVqa2XvFdVRTltZdlMAZFue9oFVN21JREdTeVf5B+/oWWOlsItkfpyyNAc9gb7h+n
 +KWDJf6rrRhHHV1l4l8IXFsdSp3noyjuy17tz2teG67apZ75ooZXqBwZgeWW4XEH4Ggy
 1RvoC0Jsk32vPqMnW4teZr4qcKjLIzTyU4WcaeedR6t4HjpZnoCwbebp6H3L2cpiqN8h
 m9sw==
X-Gm-Message-State: APjAAAXn/dBRZKVIbPCfHGBfi35l1NRD06uAlTpFC3rBLeKcMmZjcpwD
 8HKHss+s/bZLvu6324ePX3Sj/5nrPNk7Jb7zhQM8YA==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr21293650otj.97.1565020457712; 
 Mon, 05 Aug 2019 08:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-4-shameerali.kolothum.thodi@huawei.com>
 <20190730172524.6cf566ed@Igors-MacBook-Pro>
 <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
 <20190805153045.60db7bf5@redhat.com>
 <CAFEAcA-+z4t75VwfWG1ezJm=4zfdWH6nz1Oe75Zs953+vKMvdQ@mail.gmail.com>
 <20190805174652.61e9852a@redhat.com>
In-Reply-To: <20190805174652.61e9852a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 16:54:06 +0100
Message-ID: <CAFEAcA-2LPngO8nXbzZBNTN6c60xG11ogUyqVM1N8Ct-bECqNQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add ACPI Generic
 Event Device Support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQtl+U5vvN0b

On Mon, 5 Aug 2019 at 16:47, Igor Mammedov <imammedo@redhat.com> wrote:
> On Mon, 5 Aug 2019 14:42:38 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > This is definitely a bad idea -- devices should not add their
> > own memory regions to the system memory MR. They should
> > expose their MRs (by being a sysbus-device) and let the board
> > code do the wiring up of the MRs into the right memory space
> > at the right address.
>
> it's not the only place in GED that is trying to add to system address
> space, optionally if called acpi_memory_hotplug_init() will do the same,
> then later we could add cpu hotplug memory region over there.
>
> Perhaps we could use bus-less device plug code path,
> in that case memory_region_init_io()/qdev_init_gpio_out_named()
> should be moved to ged_initfn() and mapping part into specialized helper
> (similar to pc_dimm_plug() ) that's called by board (from virt_machine_device_plug_cb)
> callback during completing device realize stage, it would be something like:
>
> virt.c:
>    virt_machine_device_plug_cb()
>       if dev == GED_TYPE
>         machine_ged_plug_helper(system_memory)
>
> generic_event_device.c:
>    machine_ged_plug_helper(as, irq) // similar to sysbus_mmio_map() but ged specialized
>       connect_irq()
>       memory_region_add_subregion(as, ged->ged_base, &ged->io)
>       if ged->memory-hotplug-support
>           memory_region_add_subregion(as, ged->memhp_base , &ged->memhp_state.memhp_io)

I don't really understand why we want to do this complicated
thing, rather than just doing the normal thing for devices
that live at particular addresses, ie make them sysbus devices
and have the board map their memory regions in the right place.

> in this case addresses could be normally hard-codded in board code if device is not optional
> (as in patch 6/9: create_acpi_ged() )
> or potentially they could come from CLI as -device parameters
> (/me thinking about building blocks that allow to create machine from config)

I don't think we want to do this. The user should not have to
know anything about addresses or have to specify them on the
command line. (This is why you can't create sysbus devices
with -device except for some odd special cases to do with passthrough
of hardware.)

> sysbus device might be fine as shortcut if we are thinking about
> only creating device during machine_init (although I have a reservations towards
> sysbus interface (ex: caller of sysbus_mmio_map() has no clue when mapping N-th
> region at some address)).

Not sure entirely what you have in mind here? (though yes, the
sysbus device API has its awkward corners, some of which are
just down to how old it is.)

thanks
-- PMM
