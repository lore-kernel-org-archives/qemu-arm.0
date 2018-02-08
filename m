Received: by 10.28.71.27 with SMTP id u27csp2400727wma;
        Thu, 8 Feb 2018 10:33:30 -0800 (PST)
X-Google-Smtp-Source: AH8x2255Qoeocp8st5bBKv+ivdeRj5fOA71G8uKpgcKTPOszLhNqz5246Fn1tsx8yq6ntyB4ojVd
X-Received: by 10.37.223.193 with SMTP id w184mr6868ybg.100.1518114810319;
        Thu, 08 Feb 2018 10:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518114810; cv=none;
        d=google.com; s=arc-20160816;
        b=PAAeK5HYq2YOmTB1AQ2ocxl+q4oDF+GjilI3F25GiDnhG7giwQNUALLREXehcV8wCn
         eSB5C/DQhpfER0KpMMDkGsH/0PRnan0vd3K4aOxtTpQH3IE6KdQlBcslh5Z8GfGcFOIr
         ERoJCeUTgASv6O6WC9BVSs2YAOx4NtNvv0B7n98oWr8daEV1YY+fY7PutH7ACfv0HGOh
         64wmq9LewJ+feahgx+NUCDGp3PQnGpudzIXUFOfKKWEwMcrKHOAbqi0HJzLgRBdLaZpn
         StJO/tEIyP3aeHswpBjAwNb7FmygvntThF042pLyB9Vl9FLEnT/gP6P8PswI+gqYf89g
         GBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=prmdEHB2vIaLRf+vAvWtJX0xBqmkn1N/6wovMzftieg=;
        b=J58RrqtrJoH/vCpnTqa43sGqrqIJxEmBnRkzjYuOyZB/S/6H4FpPPam2kg56X8jpSR
         ahVvDKR5gwW5fBnt4dUMu4XL2CtpPh3DacY8iZErCWUHfW0R+xChMfnLQHveguzE3+Wo
         Lw9WI8dJiR/MSGZD/F3IWSxHu9uS3pOR1H49JHPLAs6GsYM78BZLSpqOSyhVqx7CyY3k
         oQnvHbRkOPynTyeT2jzdmvlN5hGCH+EEKCIcZFkP+YH55F604cCoz4JI2UOAh7auoZKg
         X6wKKNpc+U8EnZwBdrPHyw6fI+xgo4GsCqANhOqUvLog4k1Ooorh9WoLAdRp3rWfIpYS
         BzPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d204si93544ybh.425.2018.02.08.10.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 10:33:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejr0j-00076p-Hq
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 13:33:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejqL4-0002z6-DK
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:50:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejqL0-0007WM-Lc
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:50:26 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46586 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ejqL0-0007W4-FY; Thu, 08 Feb 2018 12:50:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB8224022909;
	Thu,  8 Feb 2018 17:50:21 +0000 (UTC)
Received: from redhat.com (ovpn-120-144.rdu2.redhat.com [10.10.120.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 994B02166BAE;
	Thu,  8 Feb 2018 17:50:21 +0000 (UTC)
Date: Thu, 8 Feb 2018 19:50:21 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180208194731-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-10-andrew.smirnov@gmail.com>
	<CAFEAcA-=-+1A6toXM-ddP+iKBgHKh28Xq3VeGXfSLJ08xMRijA@mail.gmail.com>
	<20180208193033-mutt-send-email-mst@kernel.org>
	<CAHQ1cqGr2e8vjQUUypkoyUc=QGQDNVkjydmOadfsSCzm78nkJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAHQ1cqGr2e8vjQUUypkoyUc=QGQDNVkjydmOadfsSCzm78nkJQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 17:50:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 17:50:22 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DKEUUZ5pg5Ea

On Thu, Feb 08, 2018 at 09:43:53AM -0800, Andrey Smirnov wrote:
> On Thu, Feb 8, 2018 at 9:34 AM, Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > On Thu, Feb 08, 2018 at 05:20:53PM +0000, Peter Maydell wrote:
> >> On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.co=
m> wrote:
> >> > Use pci_config_size (as opposed to PCI_CONFIG_SPACE_SIZE) in
> >> > pci_data_read() and pci_data_write(), so this function would work =
for
> >> > both classic PCI and PCIe use-cases.
> >> >
> >> > Cc: Peter Maydell <peter.maydell@linaro.org>
> >> > Cc: Jason Wang <jasowang@redhat.com>
> >> > Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >> > Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> >> > Cc: Michael S. Tsirkin <mst@redhat.com>
> >> > Cc: qemu-devel@nongnu.org
> >> > Cc: qemu-arm@nongnu.org
> >> > Cc: yurovsky@gmail.com
> >> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> >> > ---
> >> >  hw/pci/pci_host.c | 13 +++++++++----
> >> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> >> > index 5eaa935cb5..ea52ea07cd 100644
> >> > --- a/hw/pci/pci_host.c
> >> > +++ b/hw/pci/pci_host.c
> >> > @@ -89,30 +89,35 @@ uint32_t pci_host_config_read_common(PCIDevice=
 *pci_dev, uint32_t addr,
> >> >  void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, int l=
en)
> >> >  {
> >> >      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
> >> > -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
> >> > +    uint32_t config_addr;
> >> >
> >> >      if (!pci_dev) {
> >> >          return;
> >> >      }
> >> >
> >> > +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
> >> > +
> >> >      PCI_DPRINTF("%s: %s: addr=3D%02" PRIx32 " val=3D%08" PRIx32 "=
 len=3D%d\n",
> >> >                  __func__, pci_dev->name, config_addr, val, len);
> >> > -    pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG=
_SPACE_SIZE,
> >> > +    pci_host_config_write_common(pci_dev, config_addr,
> >> > +                                 pci_config_size(pci_dev),
> >> >                                   val, len);
> >> >  }
> >> >
> >> >  uint32_t pci_data_read(PCIBus *s, uint32_t addr, int len)
> >> >  {
> >> >      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
> >> > -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
> >> > +    uint32_t config_addr;
> >> >      uint32_t val;
> >> >
> >> >      if (!pci_dev) {
> >> >          return ~0x0;
> >> >      }
> >> >
> >> > +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
> >> > +
> >> >      val =3D pci_host_config_read_common(pci_dev, config_addr,
> >> > -                                      PCI_CONFIG_SPACE_SIZE, len)=
;
> >> > +                                      pci_config_size(pci_dev), l=
en);
> >> >      PCI_DPRINTF("%s: %s: addr=3D%02"PRIx32" val=3D%08"PRIx32" len=
=3D%d\n",
> >> >                  __func__, pci_dev->name, config_addr, val, len);
> >> >
> >>
> >> I've just discovered that this breaks the e1000e-test:
> >>
> >> $ (cd build/clang; QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x8=
6_64
> >> ./tests/e1000e-test)
> >> /x86_64/e1000e/init: **
> >> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/e1000e-test.=
c:118:e1000e_device_find:
> >> 'e1000e_dev' should not be NULL
> >>
> >> Any idea what's going on here?
> >>
>=20
> Peter:
>=20
> Don't really have a good idea what's going on, but I am guessing this
> change broke affected pci_host_data_* methods in negative way.
>=20
> >> thanks
> >> -- PMM
> >
> > I'm yet to review these patches, but IIRC pci_data_read and friends
> > aren't designed with pcie in mind - they implement the classic pci
> > config space.
> >
> > I'd like to see more justification about how these are now going
> > to be used.
> >
>=20
> Michael:
>=20
> My only justification for this change was suggestion from Marcel to
> use pci_data_* functions, instead of calling pci_host_config_*_common
> explicitly in designware.c introduced in next patch in the series. My
> v4 patches incorrectly limited config space size to 256, so such
> replacement didn't require this patch, but switching pci_data_* to use
> pci_config_size() seemed harmless enough. I am more than happy to got
> back to using pci_host_config_*_common in designware.c and dropping
> this patch.
>=20
> Thanks,
> Andrey Smirnov

Aren't these implementing MMCFG? In that case I think you should
reuse pcie_host_mmcfg_update, like q35 does.

This would be the second user, so we might need to extend that
interface somewhat. Let me know if that's a good fit.

--=20
MST
