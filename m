Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23351891lff;
        Mon, 6 Jan 2020 05:07:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzBDsY/n5dHWI1kOsZ0NOmqKYS/N0pm7zq28bT+oU6wV/9x+rVxtdhEa2U5HzQPwne3cydT
X-Received: by 2002:a37:814:: with SMTP id 20mr82157444qki.314.1578316064615;
        Mon, 06 Jan 2020 05:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578316064; cv=none;
        d=google.com; s=arc-20160816;
        b=q0Xc8IeeuA4UPOB2LhOQ5hg1yf95sRx+MN0wtcdTUn05+H4NQ5vn9Eogv9DbrfLUWp
         QJGsfqqlITRk3nuDABh6EPvNJxVTXA9sHQhtDzWvPYpEv8bKENj4RHqcMR1yzaSMmfGC
         jcPIMyMIXKv/5PAwUmm/FUnPpFaIQeoe9XMDFsuanCbocTnGq3DVmuCt7CbQHs2OEktD
         P9GUpyfCDUSHeSt8NhiNshSGWWVqbbNjXHKMnwmyedffCShqYvLAq5hhXX2QiCgul+4F
         56VNOSfrpH7T0mlXKGZgxkCeerdm7qX/tyeVYG1gu0Kw5rkAkFNChImO2D2+8BVyr8gU
         xzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=djuTjSz97I65e9Rdhz0iVYkKZcol8tp8cxJmmTQmsow=;
        b=JI9tLIwT+II14hmrC1UWrGbO3bWA+Ir9ty4UI8SoZkVVNn7vOUH3L9wMlvil4RAP9m
         8KYMKQDa9OvSpjxu2YjGfpAe7tDZ9ToKIILc1xZX7FCfoTzjWu2TXy9HvNs5PNikLKhk
         zfWE35jwg2LpXggPjwOykscHxMkHT4vCq3YvCxQerh8GrXhv3HAhDhSBAXUK+OXixzmp
         th1wL4/OOWuOUAYH35kLCNQIY8Ghm4QtGfKvKYDYdUoGem7vKZkxkK/LMmMwNsImc4CR
         tpB2jWcqvXf9OYDathFW6rZluZ7OUFlOy6Tx3DmWc6Y2IpqKO9kBQuW7l3edBI8HyPDo
         iuzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ojVjjgaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t197si29583360qke.304.2020.01.06.05.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 05:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=ojVjjgaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioS6h-0001v8-Vq
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 08:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cminyard@mvista.com>) id 1ioS6Y-0001tg-NG
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 08:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cminyard@mvista.com>) id 1ioS6W-0005sQ-Pa
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 08:07:34 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39125)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <cminyard@mvista.com>) id 1ioS6W-0005qw-Ku
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 08:07:32 -0500
Received: by mail-oi1-x241.google.com with SMTP id a67so15805915oib.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 05:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=djuTjSz97I65e9Rdhz0iVYkKZcol8tp8cxJmmTQmsow=;
 b=ojVjjgaVktB6L4hwatHWW51Aq8aJUGwXU3j4mdXUglwDsTyP51fJOEq8XhMmaRUFX4
 RgCgV0Egn020XKoo5Ehx7Md4yaq7w137GfcBC8QAlNMhRflqSRyrIOBa+xgGWshfmH9W
 TAs9pe6J5elc4gPfg8W1nkmsCaNzSLYxnU9H7x6shG0QroE2UTL1md8ARDQyvCscwZsz
 7gzg2QUDYsCm4RkklJ9HOvSUiVFb50Gh+t31C7p+PEDNGqsyrGxPhL/XfAM2hBaMiODc
 yNPdv9yepRJ1pf9QaaDw+UFK2vuMypeG5Q1cTvWhfB01rF9HipsA2JfVeXU47pgbu675
 HLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=djuTjSz97I65e9Rdhz0iVYkKZcol8tp8cxJmmTQmsow=;
 b=J/DVduS7EFrPgHeHkuwLY4SoxxYjzkdFknDE/kFIQezgXjPCm55/rwtiz7E7hO+3SB
 BeWdCl/t70c96mJLv0UHG3Sz+3uh+TUv8gJv6fjKRVSFmXfNuaR2Cv9nePf/yewbmyWZ
 49bAfqqSie6Lxk5FfgNjG3PeMfbD3eZC7qWVfaFbc6nDuVIijj8PUQPPME+qwdVdJrFh
 T7vOq9/z00rf4Gs0yctWvaMJgm/lWhj928UNtE+0V4ft4JU1Wd+GwXzhiP4H/vQKLDME
 QudJfQaHX6tK4QzIz37z6t+myTq0TQlyOscqI/5bSTWO6KPcDL1YlfaDsed3WnjSgmjn
 sqhw==
X-Gm-Message-State: APjAAAW+/1/GvjCb4FufAmMd2GCEcRlVK4FbUwJnViVOpE1V3pYOX7va
 lpjmT86Hhz4+PVUbtopE3YfuiA==
X-Received: by 2002:aca:6744:: with SMTP id b4mr321855oiy.99.1578316050628;
 Mon, 06 Jan 2020 05:07:30 -0800 (PST)
Received: from minyard.net ([2001:470:b8f6:1b:adc3:7c20:81:d62b])
 by smtp.gmail.com with ESMTPSA id n7sm21185655oij.14.2020.01.06.05.07.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Jan 2020 05:07:29 -0800 (PST)
Date: Mon, 6 Jan 2020 07:07:27 -0600
From: Corey Minyard <cminyard@mvista.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200106130727.GA2886@minyard.net>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <20200105225420.GJ6497@minyard.net>
 <20200106043916-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106043916-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: b0L81544PFBo

On Mon, Jan 06, 2020 at 04:39:51AM -0500, Michael S. Tsirkin wrote:
> On Sun, Jan 05, 2020 at 04:54:20PM -0600, Corey Minyard wrote:
> > On Sun, Jan 05, 2020 at 07:33:55AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
> > > > According to ACPI spec, _ADR should be used for device which is on a
> > > > bus that has a standard enumeration algorithm. It does not make sense
> > > > to have a _ADR object for devices which already have _HID and will be
> > > > enumerated by OSPM.
> > > > 
> > > > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> > > 
> > > Are you sure? I would think this depends on the ID and the device
> > > really. E.g. PCI devices all are expected to have _ADR and some of them
> > > have a _HID.
> > 
> > That's my understanding, too.
> > 
> > > 
> > > CC Corey who added a device with both HID and ADR to x86 recenly.
> > > 
> > > Apropos Corey, why was HID APP0005 chosen?
> > 
> > I don't remember.  I thought I had looked it up someplace, but I didn't
> > document it.
> > 
> > >From reading the spec, I believe you could safely delete the _HID and it
> > would be fine.  However, I don't see anything that says it can't be
> > there, either.  But it is extraneous.
> > 
> > Searching on the web a bit, I see that the APP0005 has confused windows.
> 
> Could you post the link you found pls?

https://bugs.launchpad.net/qemu/+bug/1856724

> 
> > It does look to be wrong.  Maybe deleting it would be a good idea.
> > 
> > -corey
> > 
> > > 
> > > > ---
> > > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > Cc: qemu-arm@nongnu.org
> > > > Cc: qemu-devel@nongnu.org
> > > > ---
> > > >  hw/arm/virt-acpi-build.c          |   8 --------
> > > >  tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
> > > >  tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
> > > >  tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
> > > >  4 files changed, 8 deletions(-)
> > > > 
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 9f4c7d1889..be752c0ad8 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> > > >                               AML_EXCLUSIVE, &uart_irq, 1));
> > > >      aml_append(dev, aml_name_decl("_CRS", crs));
> > > >  
> > > > -    /* The _ADR entry is used to link this device to the UART described
> > > > -     * in the SPCR table, i.e. SPCR.base_address.address == _ADR.
> > > > -     */
> > > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)));
> > > > -
> > > >      aml_append(scope, dev);
> > > >  }
> > > >  
> > > > @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> > > >      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
> > > >      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
> > > >      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> > > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > >      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
> > > >      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
> > > >      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> > > > @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
> > > >  {
> > > >      Aml *dev = aml_device("GPO0");
> > > >      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> > > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > > >  
> > > >      Aml *crs = aml_resource_template();
> > > > @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> > > >  {
> > > >      Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
> > > >      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> > > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > > >      aml_append(scope, dev);
> > > >  }
> > > > diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> > > 
> > > 
> > > Please do not include binary changes in acpi patches.
> > > 
> > > See comment at the top of tests/bios-tables-test.c for documentation
> > > on how to update these.
> > > 
> > > -- 
> > > MST
> > > 
> 
