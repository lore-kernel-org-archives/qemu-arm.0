Received: by 10.28.71.27 with SMTP id u27csp2352233wma;
        Thu, 8 Feb 2018 09:47:27 -0800 (PST)
X-Google-Smtp-Source: AH8x227tTDXPMIiSLiZbUjp4o5nOr27piqgm3bnL82wHYP6zxu8cutRWB/3vw/az4yvj07AVx5IY
X-Received: by 10.37.102.74 with SMTP id z10mr1133616ybm.89.1518112047586;
        Thu, 08 Feb 2018 09:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518112047; cv=none;
        d=google.com; s=arc-20160816;
        b=MdEnrqH2lLDGiK04voZ1BxVpYh2003H/6lognsn1qvMtuQbE1VCO7So1vyZoi7njs6
         oM8HLp4QuQYKwxZMMKRYkQEy3ZozxVfOCKgkz5mSlgEwDb9KAyjm4eRIdA+PDVMjhFM/
         lBE4oUzhiO7mok3JCm3wqDn/z2Ayo9rgvdxnn6kWT0xP+OPPChN7JetFGOZJ5P4XDsyz
         stJ2X2CEoswsRGO5lkO5OsAbkLdylWdjkd1DOOJrJb/lhNBviQYGSX+kHZua2NlyhbmU
         NP2hQ9kixQS6ehx16m3XY+FFKDV76k7WZszAcUOsPIjkBo2azU8YEROUF8DcefR3bsBR
         kpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=SEbQut8S7nJXrIUhgPIVJJgYa23+sQUkBk+j5ZBKe5Q=;
        b=l/TKxsu+uj8aqcgRaeGha5LcGiN6cKbuwl8gJJHLdci6f8dDDBrEnSy3XdkSqi99Hv
         8Fw8X1rSynktSQMURVFpTETrfRmVOdGa4DhEbS6uMb6qFnCFhptxDNDY7NNaeXNlymoY
         /uUs2I50bw8Qr/4h4Et56gbWK3b0yesD/J7v6XOqV7R3h85S7M9ubaUYgvUTsvuahbBE
         8/4SXR0XsxumcY43UanJKoP+MAZiLzZpd5cQbfBKXOjwfLgxZBNGm7YBzoICD6wedQez
         WkgcRy0m19l3swltO9+5EBTS05/uiTbY78y7QjcP/smrs0/NV+xUouqDYKALMcYfJNSp
         cogg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si84704ybf.22.2018.02.08.09.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:47:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqIA-0000Xm-Ue
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:47:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejq5p-0005m0-Kz
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejq5m-0003Zx-BD
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:34:41 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46218 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ejq5m-0003Xd-14; Thu, 08 Feb 2018 12:34:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B68DF4022909;
	Thu,  8 Feb 2018 17:34:26 +0000 (UTC)
Received: from redhat.com (ovpn-120-144.rdu2.redhat.com [10.10.120.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 348471008385;
	Thu,  8 Feb 2018 17:34:20 +0000 (UTC)
Date: Thu, 8 Feb 2018 19:34:20 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180208193033-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-10-andrew.smirnov@gmail.com>
	<CAFEAcA-=-+1A6toXM-ddP+iKBgHKh28Xq3VeGXfSLJ08xMRijA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA-=-+1A6toXM-ddP+iKBgHKh28Xq3VeGXfSLJ08xMRijA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 17:34:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 17:34:26 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v5 09/14] pci: Use pci_config_size in
 pci_data_* accessors
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUUmNV6wd/7j

On Thu, Feb 08, 2018 at 05:20:53PM +0000, Peter Maydell wrote:
> On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> =
wrote:
> > Use pci_config_size (as opposed to PCI_CONFIG_SPACE_SIZE) in
> > pci_data_read() and pci_data_write(), so this function would work for
> > both classic PCI and PCIe use-cases.
> >
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: qemu-devel@nongnu.org
> > Cc: qemu-arm@nongnu.org
> > Cc: yurovsky@gmail.com
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > ---
> >  hw/pci/pci_host.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> > index 5eaa935cb5..ea52ea07cd 100644
> > --- a/hw/pci/pci_host.c
> > +++ b/hw/pci/pci_host.c
> > @@ -89,30 +89,35 @@ uint32_t pci_host_config_read_common(PCIDevice *p=
ci_dev, uint32_t addr,
> >  void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, int len)
> >  {
> >      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
> > -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
> > +    uint32_t config_addr;
> >
> >      if (!pci_dev) {
> >          return;
> >      }
> >
> > +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
> > +
> >      PCI_DPRINTF("%s: %s: addr=3D%02" PRIx32 " val=3D%08" PRIx32 " le=
n=3D%d\n",
> >                  __func__, pci_dev->name, config_addr, val, len);
> > -    pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG_SP=
ACE_SIZE,
> > +    pci_host_config_write_common(pci_dev, config_addr,
> > +                                 pci_config_size(pci_dev),
> >                                   val, len);
> >  }
> >
> >  uint32_t pci_data_read(PCIBus *s, uint32_t addr, int len)
> >  {
> >      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
> > -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
> > +    uint32_t config_addr;
> >      uint32_t val;
> >
> >      if (!pci_dev) {
> >          return ~0x0;
> >      }
> >
> > +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
> > +
> >      val =3D pci_host_config_read_common(pci_dev, config_addr,
> > -                                      PCI_CONFIG_SPACE_SIZE, len);
> > +                                      pci_config_size(pci_dev), len)=
;
> >      PCI_DPRINTF("%s: %s: addr=3D%02"PRIx32" val=3D%08"PRIx32" len=3D=
%d\n",
> >                  __func__, pci_dev->name, config_addr, val, len);
> >
>=20
> I've just discovered that this breaks the e1000e-test:
>=20
> $ (cd build/clang; QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_6=
4
> ./tests/e1000e-test)
> /x86_64/e1000e/init: **
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/e1000e-test.c:1=
18:e1000e_device_find:
> 'e1000e_dev' should not be NULL
>=20
> Any idea what's going on here?
>=20
> thanks
> -- PMM

I'm yet to review these patches, but IIRC pci_data_read and friends
aren't designed with pcie in mind - they implement the classic pci
config space.

I'd like to see more justification about how these are now going
to be used.

--=20
MST
