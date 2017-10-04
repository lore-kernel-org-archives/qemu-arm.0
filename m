Received: by 10.223.197.9 with SMTP id q9csp5436362wrf;
        Wed, 4 Oct 2017 02:09:37 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDa/bXzwGT7zBWfPXHf0j80iX41mg0gCEwyA/Ljs/M0xQp3xsPIJkGxixpcjV1mX7lNzAWu
X-Received: by 10.200.40.11 with SMTP id 11mr12028704qtq.6.1507108177811;
        Wed, 04 Oct 2017 02:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507108177; cv=none;
        d=google.com; s=arc-20160816;
        b=owM8s2patWk8dK1lBxy+2j+D3Wlvo+HOK2o8ATWK+VAvpP4PIRNjQYh0mpcFFuFNZp
         2KCyrGsti/DwJdDRwir2Nct5qz4mUJPD+0D3vzg5BhQ6qGUllmO5iw9Nv5y9lQkGiElg
         rxQwYqMeL0OdqiQLAslmmx3MWhHVLsnNwnt1xNm3dOd2Qbx9fCd+QSHTXI9c3ROQzwGk
         3tw5g/bnF/0JJB0ud7TyrOVp4hfp13iH3cmLrAWAIqU9E9+Hz6g9CUdOHedz2Mbu++ZK
         FIbZYy3ryP6N3D63M8ro6Qn9C2spP42iAhfaH4p+LnZCeKmari+fqPfid7tz+hiP/+py
         83ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-disposition
         :content-transfer-encoding:mime-version:in-reply-to:references:to
         :from:date:message-id:arc-authentication-results;
        bh=HdL0D+SjTQ4mvueVqn+Q3mEOgkSVK8r4RcRIp5Jj57Q=;
        b=GLt2mdrChfOhq/hZNmLjyo98i+UAVSp42yb0OgMjwgIOL4Lw3R6VZp63HxdetJ9DOa
         owoUSLyAJfbwM5RlNVptbNLP4tEMY8gEeyQvvHiYei1kYJJtc5TC4AVux43pftnHp5yJ
         KEcpU0fjvOS820TtAKBiwkvuG5iAhiJQBG58ePSqo5z2Pm3GB90SBTqcD0rl1t57cYMq
         HRyFoUI35pKyyYNTWciTUVGDO02oiDqGDfG9ve2DjFbtwlSl74fFmzRWMpr4ZUFpMIJC
         +qOfvkfRdA5Ff1h4rC+Az38uQ0OuFGDEUdK2SwWsyl98ntMdC8dZ2NpziHb3twzj9Z98
         +r8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w34si5349436qtg.75.2017.10.04.02.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 02:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzfgP-0008DQ-Bz
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 05:09:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JBeulich@suse.com>) id 1dzffU-0007pG-7q
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 05:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JBeulich@suse.com>) id 1dzffT-0002sF-B7
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 05:08:40 -0400
Received: from prv-mh.provo.novell.com ([137.65.248.74]:59934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <JBeulich@suse.com>)
	id 1dzffD-0002XU-7g; Wed, 04 Oct 2017 05:08:23 -0400
Received: from INET-PRV-MTA by prv-mh.provo.novell.com
	with Novell_GroupWise; Wed, 04 Oct 2017 03:08:18 -0600
Message-ID: <59D4C11F0200007800181F48@prv-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 14.2.2 
Date: Wed, 04 Oct 2017 03:08:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Eduardo Habkost" <ehabkost@redhat.com>
References: <20170927195635.16014-1-ehabkost@redhat.com>
	<20170927195635.16014-5-ehabkost@redhat.com>
	<59CCD0150200007800180507@prv-mh.provo.novell.com>
	<20170928131234.GP4115@localhost.localdomain>
	<20171003001257.GA7087@localhost.localdomain>
In-Reply-To: <20171003001257.GA7087@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.65.248.74
Subject: [Qemu-devel] xen-pci-passthrough PCI Express support? (Re:
 [Xen-devel] [PATCH v2 4/5] pci: Add INTERFACE_CONVENTIONAL_PCI_DEVICE to
 Conventional PCI devices)
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <dgibson@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	=?UTF-8?Q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /rWgabjOZZ3y
Message-ID: <20171004090815.x-ByKCoNc95eEevgCa0XraUqn7wzlLEQL_f0BMbT30Y@z>

>>> On 03.10.17 at 02:12, <ehabkost@redhat.com> wrote:
> On Thu, Sep 28, 2017 at 10:12:34AM -0300, Eduardo Habkost wrote:
>> On Thu, Sep 28, 2017 at 02:33:57AM -0600, Jan Beulich wrote:
>> > >>> On 27.09.17 at 21:56, <ehabkost@redhat.com> wrote:
>> > > --- a/hw/xen/xen_pt.c
>> > > +++ b/hw/xen/xen_pt.c
>> > > @@ -964,6 +964,10 @@ static const TypeInfo xen_pci_passthrough_info =
=3D {
>> > >      .instance_size =3D sizeof(XenPCIPassthroughState),
>> > >      .instance_finalize =3D xen_pci_passthrough_finalize,
>> > >      .class_init =3D xen_pci_passthrough_class_init,
>> > > +    .interfaces =3D (InterfaceInfo[]) {
>> > > +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> > > +        { },
>> > > +    },
>> > >  };
>> >=20
>> > Passed through devices can be both PCI and PCIe, so following
>> > the description of the patch I don't think these can be statically
>> > given either property. Granted quite a bit of PCIe specific
>> > functionality may be missing in the Xen code ...
>>=20
>> This is just static data about what the device type supports, not
>> about what a given device instance really is.  Deciding if the
>> device is PCIe or Conventional at runtime is out of the scope of
>> this series.
>>=20
>> That said, if passed through PCI Express devices are really
>> supported, it looks like this should be marked as hybrid.
>=20
> Can anybody confirm if PCI Express devices are really supported
> by xen-pci-passthrough?

I think I've clearly said they're supported, with some limitations.

Jan

