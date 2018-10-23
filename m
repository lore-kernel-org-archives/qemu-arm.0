Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4704443wrt;
        Tue, 23 Oct 2018 08:49:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60u0fGGmHPT/T70Uk+c3bphmzpi+946n4DuI4iMnGqYceelQhKbr8v/8HZG5P7axP3DDPg2
X-Received: by 2002:a37:5e43:: with SMTP id s64-v6mr47897630qkb.39.1540309795275;
        Tue, 23 Oct 2018 08:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309795; cv=none;
        d=google.com; s=arc-20160816;
        b=AJ3+4uOo0bZGMBD1EMoLtZLb5EKUtl83P5NW0SekohIZRxrGB8Don4QrQeXcsxYsNd
         udaJa9GCXFVBNdrC3UzigCJgedVHHQ4i5Q/rTyiX9UJGAB0s/LRZk0GV0aKywa70HQkO
         GuEkxXNN0csuXSPmv0bDgq6EGbAUenBECE8Z1o3QCa6gxITqbX98t/wH+n8YBdztPVAA
         Ahf/MeVWZ3v9Upi5WDiD3g5SzqrNMAwqmxpvmf8vRrvYQBKAY+DB9ApKkdIrqfsJU82W
         krpwJzNNOk9U6CO9XLKfJ8NwIVgodzCtHiLxCx3T6rzWxmz4Fsy0v8UGVmbfACXYZgMA
         SSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=+OZN5I0av7EuSDmMA4jL5L8wGuxZDAxHWKNEeZ4d98A=;
        b=pUuH/rPcJG8xAJNYes65dhI3SJPdxnzZJ5foebnLD43Jd/VcwhhrCUzwdc2d5b7wUB
         fKXWuqIw2ERq/i/DcAyWkL0Y7XEiIQMRbJQCs0xFCJhARj74aPfwAICAtZkBe6IX9gjP
         mYAmN37joT3Wj9SRV8P/Ih+kZ5oLFGSJOatxZEKhq1MR0U1hE2yyx7aB+i+AEbXLJW87
         paCH8a9SmC13JDeGwoaehscq3UmLlQKSP9HiwHCvPJZ0hTJzE623iSY2/gwLf6kF/HvJ
         Wl9tt6MqQRTJHDZSIk08k7BN7jLnODgWb0HDdDi7M0IqtzYopLxScp/s3YVy7LEpJXdX
         bEKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=kzhtvYjF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6-v6si1400619qtx.347.2018.10.23.08.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=kzhtvYjF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEywM-0004Yx-B8
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:49:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhX-0007C3-IF
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybq-0006vM-Ad
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:45 -0400
Received: from ozlabs.org ([203.11.71.1]:49449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybU-0006fK-MX; Tue, 23 Oct 2018 11:28:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj71RNhz9sN6; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=uHhiIkJnjvNfQv8Px38b+a84EGtI5SCbQJFL/xxb/ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzhtvYjF7EEDB2b2axJIIvgZd8q0jO95yAzG27/j9Gza2IXr4jETG3M+aWlg2GOnw
	V0tpiWTYMUPO1CbET8yGyjCjBl0pJOBPWqRBCWMPOIwZNnw+7pdkoGIacqf414DiUl
	/GZVM6MsW6pZQY9mlsEHTsm0r/RwlJrLm2urXJN0=
Date: Tue, 23 Oct 2018 16:12:39 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151239.GH12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-10-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-10-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 09/45] hw/sh4/sh_pci: Use
 DeviceState::realize rather than SysBusDevice::init
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xwK5+8D4sTyz


--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:46PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Message-Id: <20181002212522.23303-6-f4bug@amsat.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/sh4/sh_pci.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index 4ec2e35500..379d0685ed 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -120,16 +120,15 @@ static void sh_pci_set_irq(void *opaque, int irq_nu=
m, int level)
>      qemu_set_irq(pic[irq_num], level);
>  }
> =20
> -static int sh_pci_device_init(SysBusDevice *dev)
> +static void sh_pci_device_realize(DeviceState *dev, Error **errp)
>  {
> -    PCIHostState *phb;
> -    SHPCIState *s;
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +    SHPCIState *s =3D SH_PCI_HOST_BRIDGE(dev);
> +    PCIHostState *phb =3D PCI_HOST_BRIDGE(s);
>      int i;
> =20
> -    s =3D SH_PCI_HOST_BRIDGE(dev);
> -    phb =3D PCI_HOST_BRIDGE(s);
>      for (i =3D 0; i < 4; i++) {
> -        sysbus_init_irq(dev, &s->irq[i]);
> +        sysbus_init_irq(sbd, &s->irq[i]);
>      }
>      phb->bus =3D pci_register_root_bus(DEVICE(dev), "pci",
>                                       sh_pci_set_irq, sh_pci_map_irq,
> @@ -143,13 +142,12 @@ static int sh_pci_device_init(SysBusDevice *dev)
>                               &s->memconfig_p4, 0, 0x224);
>      memory_region_init_alias(&s->isa, OBJECT(s), "sh_pci.isa",
>                               get_system_io(), 0, 0x40000);
> -    sysbus_init_mmio(dev, &s->memconfig_p4);
> -    sysbus_init_mmio(dev, &s->memconfig_a7);
> +    sysbus_init_mmio(sbd, &s->memconfig_p4);
> +    sysbus_init_mmio(sbd, &s->memconfig_a7);
>      s->iobr =3D 0xfe240000;
>      memory_region_add_subregion(get_system_memory(), s->iobr, &s->isa);
> =20
>      s->dev =3D pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "sh_pci_host=
");
> -    return 0;
>  }
> =20
>  static void sh_pci_host_realize(PCIDevice *d, Error **errp)
> @@ -187,9 +185,9 @@ static const TypeInfo sh_pci_host_info =3D {
> =20
>  static void sh_pci_device_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *sdc =3D SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> -    sdc->init =3D sh_pci_device_init;
> +    dc->realize =3D sh_pci_device_realize;
>  }
> =20
>  static const TypeInfo sh_pci_device_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOmcACgkQbDjKyiDZ
s5IPYw/+LYwW3ZMFNBHxSmIvDCo15gePud3dz9g+UXS/guOglAFDITBVdwmDaf5I
A1TM3WAkwSfbuLlJ+Rzo7htWdK8B+21Kcg57kSXJ36iGve5maOHrMCT0BUCBRqhk
bBxuZi7tN3d4axoA2SdL7OEUukkRYkUY1kEJf4U04BkgMDbbh4AGjN7xmZAqcFaQ
muRtUe19+Nh7gbaQU4s/W7Gbuqlio3osUki87NHcdkmsYyyR0ILQ4XpFLcDVjmg1
i4p5uTypmT5T7T65yL8FdaLv7CuvBUkn7+6ZdWwGwRTCH7zrU1QmgRxtjBT6O3Sa
dALD075BAPH9ZNtDAi8Xdcj/yakW+hiEKe9Zyg9JE/asXLpSssN8yvhFH1dB3UW4
Qr3YvY3yQoR+wzCuQLTYvYpcEDYasFBYJzvG2Xg0xH7GGKMcvLijUTguLNP9SILC
rCTzB9332+aaQf+6HX0ULOvbzRhF0AmP14dh0xV6O+CxzlQI11K3oCvSs9dW834a
ssSztAx57MjUzYIVJiPkWE6FBv8xRJA+3bi+A5UXIZKT3+dTCOgeKhERP4EKKiqK
6ypeHNbEONCIwwh5WDROLehegCl3Dc+1tFjXEoPbmAXL8jYOgLwC9WnAna0eJoF/
UySy6h29CtuKrg8Ky3w9xeCyFJIsXlOMGsjo9HxuOOb2VbhzL4o=
=U/0v
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
