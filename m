Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp22340224lff;
        Sun, 5 Jan 2020 04:54:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXt+z7m2rQhOzYuojGb5NdHVQIZNlgZAI0IGUidxWpl//mNZ61hbLRRa45//2EX2vCEPOS
X-Received: by 2002:a9d:750b:: with SMTP id r11mr106661711otk.209.1578228852882;
        Sun, 05 Jan 2020 04:54:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578228852; cv=none;
        d=google.com; s=arc-20160816;
        b=ik+xP39h86wDtPjZ2ucdLJ5XMLTE1Nx8Su50kCAJvTlDETxjjQYFZ8uu7W0O9uo5UL
         44Y9r5n7zuwiBm86e8Lelz0265eAx1Sp9slb2PyKvxZ7Kg/s16jzPbK+0TPa2bDWZm3B
         AT7Gcfa3lFWFKXfua+E4EQOAa06+cQoYRrHB+oS2Glwa/uTrsVxK/WlC5Ossd+/V1aSh
         ZclhW2iI8a5LMq7IbzH9MTiXcHyyGNxqcRXoErT5v6pia8lxTBTfhzBMlu+QHWrovLZN
         BWKWzg+K8JWYlGrTW2LpPn3zdb+yL+ynBPoExeXsCCUW2qq2Hkv8SNhy/MqV4e6MIeaE
         vhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ofOgKIJGQmYYlJvJEtar4z1ANhqjstHJaxxlbxxFsR0=;
        b=iqPzZERm/UK6TRjoYtqddzfe3igjPryQ1XnmCK8lQ/B3Kz6xu1UVio+4jYl/wT3iyz
         ydhfomw0q3C/St1pKyfvXhyrWi8mSnpNohz1cTfVehMjMtFaTZS1dIciYlKpLVOF1uFe
         mv23xpro+lZvC746TPIkgfKHVdRx5pn59Xkbu8BJ1CVxRhhOg2U6aDXZfFUQlMe3UjAM
         eHRztXfvd5avyuo8p2CCTb6mcD2ZHXHjzaBHC78OaeeXVXcmYsYbn2AB5u3dF0EZFWrO
         yGb0LZuvpnP+D5vHc1O8jlbwpkyFePCB/cHuFABCmVnPGkfoCkBcip2a09KtJmlo7F9j
         S8wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eOS1ylfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si31868762otb.90.2020.01.05.04.54.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2020 04:54:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eOS1ylfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1io5Q4-0007JH-3t
	for alex.bennee@linaro.org; Sun, 05 Jan 2020 07:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1io5Pw-0007Hr-Vi
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 07:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1io5Pv-0007DZ-2L
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 07:54:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53208
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1io5Pu-0007Ai-T9
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 07:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578228842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofOgKIJGQmYYlJvJEtar4z1ANhqjstHJaxxlbxxFsR0=;
 b=eOS1ylfL/cesZvI4Xfak0tDAWuyxMqTllwTo6zYJS/MyS9UUyDZP1/V8DO8HZAkRw2RznM
 bYqu9syBsLLS0e09NPzzvur6xVLgXOEx9MyNcociEWuubGZNbG7hZ6woFWZbB6+DFjmUh5
 1cXlZAQv7iqsNed64lxcwz9qrKid0WE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289--frOl_3zPgymrm453MyIJA-1; Sun, 05 Jan 2020 07:54:00 -0500
Received: by mail-qv1-f69.google.com with SMTP id di5so16623979qvb.3
 for <qemu-arm@nongnu.org>; Sun, 05 Jan 2020 04:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Vxo46B2oj+YCTfA3i4ixkh8kVV8Fpgnabmgxa9H/c0M=;
 b=jbbVqnGkYGY+XcQSxbH88zEdVdp/co2KnP2yjV9vZ/RaEf7s9XkG46fY1DVCK/sDXJ
 7DBk0Xk8I2jwOxZgT1vZy4s6KwOJ7ZC45Srcl1qTDszJNr6zVGTwZ9WrDMEtIlTFA+09
 uOuow6HsftSZ6LiQji5wfpxUEhIiHHqRBxrIqT1r7bWihIu1SvXMYvC/ts13sTaLe2wT
 UEoJBUO7/MbH6xEYgYlTIDRbpEyKo+zYU+4QKlfL0Vpq6MV53ahyx3iKdLfQyHvjsd/Y
 HiWn0hrUqOzmGkPHPc1rFoHlE6FRICe9PM3n9aPIY3N2EcR7h87bJf9W9ProZLOpbtoa
 WoXw==
X-Gm-Message-State: APjAAAXTtsYAgA2oKbtKDW5XLQpCqaV4PTP3Fwea2+TKbOM4Hs3xCd1d
 R/3TvTiI9EgIzAbEXG56fxkYeLv/Xe7o9yCzBo1nTMCZBR8RHWkoHPdYlytpylkzt6LeikCUfji
 fumwxCKh6BEtG
X-Received: by 2002:ae9:e10e:: with SMTP id g14mr80913292qkm.430.1578228840251; 
 Sun, 05 Jan 2020 04:54:00 -0800 (PST)
X-Received: by 2002:ae9:e10e:: with SMTP id g14mr80913276qkm.430.1578228839798; 
 Sun, 05 Jan 2020 04:53:59 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id t3sm21769324qtc.8.2020.01.05.04.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 04:53:59 -0800 (PST)
Date: Sun, 5 Jan 2020 07:53:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200105074308-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200105072504-mutt-send-email-mst@kernel.org>
X-MC-Unique: -frOl_3zPgymrm453MyIJA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rxwKrw8Vmd7k

On Sun, Jan 05, 2020 at 07:34:01AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
> > According to ACPI spec, _ADR should be used for device which is on a
> > bus that has a standard enumeration algorithm. It does not make sense
> > to have a _ADR object for devices which already have _HID and will be
> > enumerated by OSPM.
> >=20
> > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>=20
> Are you sure? I would think this depends on the ID and the device
> really. E.g. PCI devices all are expected to have _ADR and some of them
> have a _HID.


To clarify I am not commenting on patches.
The spec says this:
=096.1.5 _HID (Hardware ID)

=09This object is used to supply OSPM with the device=E2=80=99s PNP ID or A=
CPI ID. 1

=09When describing a platform, use of any _HID objects is optional. However=
, a _HID object must be

=09used to describe any device that will be enumerated by OSPM. OSPM only e=
numerates a device

=09when no bus enumerator can detect the device ID. For example, devices on=
 an ISA bus are

=09enumerated by OSPM. Use the _ADR object to describe devices enumerated b=
y bus enumerators

=09other than OSPM.


Note: "detect the device ID" not "enumerate the device" which I think
means there's a driver matching this vendor/device ID.

So it seems fine to have _ADR so device is enumerated, and still have
_HID e.g. so ACPI driver can be loaded as fallback if there's
no bus driver.


Note I am not saying the patch itself is not correct.
Maybe these devices are not on any standard bus and that
is why they should not have _ADR? I have not looked.

I am just saying that spec does not seem to imply _HID and _ADR
can't coexist.


> CC Corey who added a device with both HID and ADR to x86 recenly.
>=20
> Apropos Corey, why was HID APP0005 chosen?
>=20
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
> >=20
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 9f4c7d1889..be752c0ad8 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const Mem=
MapEntry *uart_memmap,
> >                               AML_EXCLUSIVE, &uart_irq, 1));
> >      aml_append(dev, aml_name_decl("_CRS", crs));
> > =20
> > -    /* The _ADR entry is used to link this device to the UART describe=
d
> > -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR.
> > -     */
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)))=
;
> > -
> >      aml_append(scope, dev);
> >  }
> > =20
> > @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
> >      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
> >      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
> >      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")=
));
> >      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> > @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const Me=
mMapEntry *gpio_memmap,
> >  {
> >      Aml *dev =3D aml_device("GPO0");
> >      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > =20
> >      Aml *crs =3D aml_resource_template();
> > @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> >  {
> >      Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
> >      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> > -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >      aml_append(scope, dev);
> >  }
> > diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>=20
>=20
> Please do not include binary changes in acpi patches.
>=20
> See comment at the top of tests/bios-tables-test.c for documentation
> on how to update these.
>=20
> --=20
> MST

