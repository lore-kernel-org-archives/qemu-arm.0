Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp22746615lff;
        Sun, 5 Jan 2020 14:54:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzoHwgazWi2+OWbtSX91PY3avRz2s5Aip5xhpGJUdv9mdOYeOSCIAJitG2o0EKx7KUwFsIY
X-Received: by 2002:aed:2725:: with SMTP id n34mr68420640qtd.333.1578264883246;
        Sun, 05 Jan 2020 14:54:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578264883; cv=none;
        d=google.com; s=arc-20160816;
        b=yTtzbFspeMU6nU/Qv3ks+G3FORcRibiN9tSTFjwmvBIVwe/fo5DBSJ+gIOjp7RgyVv
         BlVt5q2WsV3veG+xxLOA7lLKSZmPEeIjIwEHGIC+6000L3es85bqkuMe7NbFBjZ9L5a5
         DkAiR7pthGrfde0a168V4hDAX2dB0FuqnWhYC3sK9MGu9sH+vn86TQi+w+lMZadnnpTw
         DUnUJ46L9U1Pk4y+M5dL9dJ4gO0TNsmOeffY52ctkWd7Uomy4FcTyUPMpd55vE61bSsS
         ktvjHatS4tWXdBJfZqE5kyUAFRASXcBJqJHCZvEbWidLchv1HRqCmwda/3+tTCs8dmIG
         J1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=mwgYs8eWDOCfuvC3mnrF+p+N4kGwebNgq829saTcSvo=;
        b=NY7fG2tujXJA7YUz7c9qbnDaGbUJx4XtxBLY4Otb8CDTxaRLDPa9Vjvp5mFmvD18To
         bkBM4EhVZef0EldR23lHjVX1IB9yBiXbqHcK4v5oZuglTNjAosEmU+d4xvIL+PtSzP3B
         aCtrz4RwMO+tXtEX5P7A6/MM/FnOtp+TwdIzOvSHJXDHLULg1vwmA4VnfeVAdn64nn1F
         8gSW737bQGmzXOHqAyAesXeMFuIvhcWB1zXBzJu5WK7xObU1RAijSD3uGEVg8RY25m7k
         anBqLqIuTPxCmJE1uGGxQ6DNJi0BpRNGSoinK1oCl1mTfUI2XtnfhuCZwYGNr7ls8fsA
         pXoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=O9+deE1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21si3275178qtt.26.2020.01.05.14.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2020 14:54:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=O9+deE1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46069 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioEnC-0002Zk-Nk
	for alex.bennee@linaro.org; Sun, 05 Jan 2020 17:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cminyard@mvista.com>) id 1ioEmx-0002ZV-2G
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 17:54:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cminyard@mvista.com>) id 1ioEmv-0001Kt-9N
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 17:54:26 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33150)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <cminyard@mvista.com>) id 1ioEmv-0001HD-4a
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 17:54:25 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so47294931otp.0
 for <qemu-arm@nongnu.org>; Sun, 05 Jan 2020 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mwgYs8eWDOCfuvC3mnrF+p+N4kGwebNgq829saTcSvo=;
 b=O9+deE1k7TDCrNron0kcxhal2CE/KuLaP6DiqavFG/S9E30PvJINnEROvEorO2Gxfc
 Cg0bhplN5FpeSoY8QkCRzZrftMV8rJRk9vuDDZcTljRID35L6YAYOTz6JzXOhXmS6+cY
 Un5qKC2eVEUEbf04ITSp/1MehvpRYSaUUL1kiYo+AKdB8ik2fUgoMOAVBAzfgc/CnXND
 qgXSBPLVDWexsDz+/vMNZZfA8XIb3qhy9deAaEs2gmxuMKky/s+E/kWkpZak+o4LeqYe
 k9ipoRgPomPoJ0A4TNrERBL/AyQeej4Iw+yek0Fvm6K43g1QeG0ipxeSIOnSzfnvJ+c3
 oVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mwgYs8eWDOCfuvC3mnrF+p+N4kGwebNgq829saTcSvo=;
 b=CVooQQRyOdIr3iqDrR5wu2KIeIRF87QizSlVH6HduB4TohzgJGqU7usfQEqic8xbt+
 EfbXK3zhwPsT7MN+atAhuH7NuS5bj1SU0O04UgQRq4Uy04cGByYBL+ycO7coX+D6dDsc
 ApTjRRcstBpN3ONfg7a5Ily9Z5/COxavIaJJDzk2W34adhw/XpMLBKxIzmsWtSFmiHOq
 J0Y672iNwOHB9fMO9iiO4W6BxzmNEilOL4pIorNg/cyd7vzlEtw8GhXQ37CP0mHF2O+7
 CJsUiJxdI+uJxeM9GSFiYWqRP6KaMhf577srtuN2j4Rgk0AP3hSRSX5XxZ1W/gDqXw8A
 +zaQ==
X-Gm-Message-State: APjAAAVplGHAd7Af6C/cEvgFrv2V3Uc3D7s+kMp9TMLEFMdGdsxMJv1K
 WwkZxYHQRxm3rUU+H6xXTvXsgA==
X-Received: by 2002:a9d:32c7:: with SMTP id u65mr94925431otb.224.1578264863029; 
 Sun, 05 Jan 2020 14:54:23 -0800 (PST)
Received: from minyard.net ([2001:470:b8f6:1b:cc9e:6ccd:245e:1af1])
 by smtp.gmail.com with ESMTPSA id g19sm19123083otj.1.2020.01.05.14.54.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Jan 2020 14:54:22 -0800 (PST)
Date: Sun, 5 Jan 2020 16:54:20 -0600
From: Corey Minyard <cminyard@mvista.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200105225420.GJ6497@minyard.net>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105072504-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Reply-To: cminyard@mvista.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b9qo5n2hqlwY

On Sun, Jan 05, 2020 at 07:33:55AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
> > According to ACPI spec, _ADR should be used for device which is on a
> > bus that has a standard enumeration algorithm. It does not make sense
> > to have a _ADR object for devices which already have _HID and will be
> > enumerated by OSPM.
> > 
> > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> 
> Are you sure? I would think this depends on the ID and the device
> really. E.g. PCI devices all are expected to have _ADR and some of them
> have a _HID.

That's my understanding, too.

> 
> CC Corey who added a device with both HID and ADR to x86 recenly.
> 
> Apropos Corey, why was HID APP0005 chosen?

I don't remember.  I thought I had looked it up someplace, but I didn't
document it.

From reading the spec, I believe you could safely delete the _HID and it
would be fine.  However, I don't see anything that says it can't be
there, either.  But it is extraneous.

Searching on the web a bit, I see that the APP0005 has confused windows.
It does look to be wrong.  Maybe deleting it would be a good idea.

-corey

> 
> > ---
> > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: qemu-arm@nongnu.org
> > Cc: qemu-devel@nongnu.org
> > ---
> >  hw/arm/virt-acpi-build.c          |   8 --------
> >  tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
> >  tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
> >  tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
> >  4 files changed, 8 deletions(-)
> > 
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 9f4c7d1889..be752c0ad8 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> >                               AML_EXCLUSIVE, &uart_irq, 1));
> >      aml_append(dev, aml_name_decl("_CRS", crs));
> >  
> > -    /* The _ADR entry is used to link this device to the UART described
> > -     * in the SPCR table, i.e. SPCR.base_address.address == _ADR.
> > -     */
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)));
> > -
> >      aml_append(scope, dev);
> >  }
> >  
> > @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> >      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
> >      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
> >      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
> >      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> > @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
> >  {
> >      Aml *dev = aml_device("GPO0");
> >      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >  
> >      Aml *crs = aml_resource_template();
> > @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> >  {
> >      Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
> >      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >      aml_append(scope, dev);
> >  }
> > diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> 
> 
> Please do not include binary changes in acpi patches.
> 
> See comment at the top of tests/bios-tables-test.c for documentation
> on how to update these.
> 
> -- 
> MST
> 
