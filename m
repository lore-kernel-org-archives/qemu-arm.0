Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23168363lff;
        Mon, 6 Jan 2020 01:40:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqylgbiEem48YzKUCD3lURxVzU3GCPsm41xhUYYIsgKwK6U0mNiihCrZI/eRc0SgxcT5mDd8
X-Received: by 2002:a37:b602:: with SMTP id g2mr83027029qkf.174.1578303615163;
        Mon, 06 Jan 2020 01:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578303615; cv=none;
        d=google.com; s=arc-20160816;
        b=yxKJNjmLBgzfAPqeIlNQaNH6UWbpE3nr0rSYd/KhiD5wsHeRjZrgZj6+fqXu33Z6Mr
         5U3exSxGHN+nAQ2gYqKbdh7xK+Tbs4WziG/jQgk9agCYUSdZ8Hx1PgzRBLdg5IejpBw3
         D9OsK2DxQD9iIqqB4GE4y21Q0HiWeW+7w+iIk6AdE0kHMXDgP4cdGThYjtePHSM6vQnw
         KVOPq/OXkqWO9dxqQDOJaqgH/Zik8UCRgwySJlbVGdP3MMTyNTNLi2II6ApOTnCjgG24
         M+wauQPRababPXqaryg6qaSOQl0kFq8SIMQfV8uAM9dtwWdqrhamCIOBR9VBn7E+m6o2
         iFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=iYqAVPxUxJ0pYZQs8wa7T/ak8CCWMZ7gnjMrnRcBxXs=;
        b=MG5dNOD2IxOFAQ72dsc6kDwEx3wj4C/S6ZC8D5MN8kSNttvMmHdfY0GDF/Q2upEGzm
         ZHqfz/4UD++oFdS5E4hXW5HJXQHl1rE3TDs26jwjTVWrENx7+Egho9wqwD++o1YF9NXj
         NHUZghiJA7JZHAy3haBJAIPuYGxMuJ4omScB+BDvR9B7ly+9WhE8aJHXE5fcwOAT8qcq
         Z3p++wzHzj0b4bbXYQnNfe9B9zYl+EZ44guJt1Y6xqugGe3dY6ielStJGxCBZHa+ym/h
         a0eeWPDoascjZpO5FOSvI1r1+BzFjShGeHVXPTJTbyZDOGf7GdReVUfL2XqZpHU8+jkd
         J3UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pvjou1Ld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q71si28248855qka.52.2020.01.06.01.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 01:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pvjou1Ld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioOru-00070H-9a
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 04:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56729)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ioOrh-0006xs-TU
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 04:40:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ioOrf-00082c-5Y
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 04:40:00 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46557
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ioOrf-00081p-0L
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 04:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578303598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYqAVPxUxJ0pYZQs8wa7T/ak8CCWMZ7gnjMrnRcBxXs=;
 b=Pvjou1LdE+pd+y3hAyMSiDz531lrNfju9V+Q64DQ6QrqZ7TVHzEUyOGfDB6aOJj161MxCn
 PU3v1mGWLlxQTLHwMrBVHSOn+uC2WV8wY6E3LWhF3qqHv9TTSS4yj8Rk78u6Yjzg0XtqO6
 bpWQnBqR5RYAUVWjIHAf0trcSPx2KiM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-wPzsSw9_OM-B-B0jhmH8bw-1; Mon, 06 Jan 2020 04:39:56 -0500
Received: by mail-wm1-f69.google.com with SMTP id 7so1269932wmf.9
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 01:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9fUCqkphBRJc1ecZ77d6BtO1jCfuVFgMgIpeh+trpr0=;
 b=I2wiw0vQkiJ+kiL94zh+8nmQ2RNThxvtMzui+pjlI5JJEe5fPpuP4EQyHIAz0iGObI
 ioLy0QOuaV5uH5A0uj0M5dGemcaswHlZLl6Bt00BmHZy0u801LrBm7gtRTEn+fQFi9ad
 IGkU5IAujRktuWByvnht0OH11+YiA04Ykrlzbv6p3KQSXFqyH4kZSyWEVnhIYeRME/2q
 0S40wCfdgs4DOPmpyrqeKBDXMnevzt4nMKH5cdNU1kTF60ICnyi6RtaMip5LVqRZOKHf
 cCponQELQaQ/sO7FTpJa5DidVI+tDxM1ciaJsNIF/3F7pse27+Cfkz+O2Nl0YEMSkkdA
 9y+w==
X-Gm-Message-State: APjAAAUTBec8R/T2yrQ4iXRpxuWD8bqpLmxgAAi05Ycoh40vv4ZxMvXF
 iMBpe1SrcrkJVbCc6PWmKqIy72U0nJ3dr70odDY+HR8eX0SEFUJ3kmSTPECLlGsOBztldILPvIG
 TzlCI4ZFg1azT
X-Received: by 2002:a7b:c318:: with SMTP id k24mr34454737wmj.54.1578303595628; 
 Mon, 06 Jan 2020 01:39:55 -0800 (PST)
X-Received: by 2002:a7b:c318:: with SMTP id k24mr34454713wmj.54.1578303595399; 
 Mon, 06 Jan 2020 01:39:55 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id c68sm22029361wme.13.2020.01.06.01.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 01:39:54 -0800 (PST)
Date: Mon, 6 Jan 2020 04:39:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200106043916-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <20200105225420.GJ6497@minyard.net>
MIME-Version: 1.0
In-Reply-To: <20200105225420.GJ6497@minyard.net>
X-MC-Unique: wPzsSw9_OM-B-B0jhmH8bw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0pzxW0JWFgX

On Sun, Jan 05, 2020 at 04:54:20PM -0600, Corey Minyard wrote:
> On Sun, Jan 05, 2020 at 07:33:55AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
> > > According to ACPI spec, _ADR should be used for device which is on a
> > > bus that has a standard enumeration algorithm. It does not make sense
> > > to have a _ADR object for devices which already have _HID and will be
> > > enumerated by OSPM.
> > >=20
> > > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> >=20
> > Are you sure? I would think this depends on the ID and the device
> > really. E.g. PCI devices all are expected to have _ADR and some of them
> > have a _HID.
>=20
> That's my understanding, too.
>=20
> >=20
> > CC Corey who added a device with both HID and ADR to x86 recenly.
> >=20
> > Apropos Corey, why was HID APP0005 chosen?
>=20
> I don't remember.  I thought I had looked it up someplace, but I didn't
> document it.
>=20
> >From reading the spec, I believe you could safely delete the _HID and it
> would be fine.  However, I don't see anything that says it can't be
> there, either.  But it is extraneous.
>=20
> Searching on the web a bit, I see that the APP0005 has confused windows.

Could you post the link you found pls?

> It does look to be wrong.  Maybe deleting it would be a good idea.
>=20
> -corey
>=20
> >=20
> > > ---
> > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Cc: qemu-arm@nongnu.org
> > > Cc: qemu-devel@nongnu.org
> > > ---
> > >  hw/arm/virt-acpi-build.c          |   8 --------
> > >  tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
> > >  tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
> > >  tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
> > >  4 files changed, 8 deletions(-)
> > >=20
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 9f4c7d1889..be752c0ad8 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const M=
emMapEntry *uart_memmap,
> > >                               AML_EXCLUSIVE, &uart_irq, 1));
> > >      aml_append(dev, aml_name_decl("_CRS", crs));
> > > =20
> > > -    /* The _ADR entry is used to link this device to the UART descri=
bed
> > > -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR=
.
> > > -     */
> > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)=
));
> > > -
> > >      aml_append(scope, dev);
> > >  }
> > > =20
> > > @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const M=
emMapEntry *memmap,
> > >      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
> > >      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
> > >      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > >      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
> > >      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device=
")));
> > >      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> > > @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const =
MemMapEntry *gpio_memmap,
> > >  {
> > >      Aml *dev =3D aml_device("GPO0");
> > >      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > > =20
> > >      Aml *crs =3D aml_resource_template();
> > > @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope=
)
> > >  {
> > >      Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
> > >      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> > > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > >      aml_append(scope, dev);
> > >  }
> > > diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> >=20
> >=20
> > Please do not include binary changes in acpi patches.
> >=20
> > See comment at the top of tests/bios-tables-test.c for documentation
> > on how to update these.
> >=20
> > --=20
> > MST
> >=20

