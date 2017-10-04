Received: by 10.223.197.9 with SMTP id q9csp5435608wrf;
        Wed, 4 Oct 2017 02:08:39 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDFGU9mI9acjvtQ5BrD5PW4DFUXBoAF8N7xTcTziWc19rGtfhYJy6Bop45v9z8GsME8IS/+
X-Received: by 10.55.20.29 with SMTP id e29mr11269174qkh.253.1507108119061;
        Wed, 04 Oct 2017 02:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507108119; cv=none;
        d=google.com; s=arc-20160816;
        b=cp+cZgNVoUEy/edyBiK0W0ZGt/yLwKfvCU4RekzNK/angXoTVhti9twJHji2O7IYSN
         Z5EH+ZC1tJGCyuSg4o+MQOHJYAeTJlfgEnW9jVAs7gS2jxByBXavrfeHrhH8b5hF7o98
         uNHSV8d7e37H7RAx2orrvL61suxd2FK+Xz7teV6/dUmCRWvvWn/cvHw9tSWcPBVFX0jm
         jdo8X5bNaSf373rvOjlMR8A3qHo4fK9cPv1PxuRvygBxBz+OLbdYyigww/DKfHEZiOKY
         HaRe31A1X9+dkoCfNIWMR6dbB0VjCCzxC+gmFPy35yvTIoq6tPubRmd92eaKkuVxxx+q
         IOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-disposition
         :content-transfer-encoding:mime-version:in-reply-to:references:to
         :from:date:message-id:arc-authentication-results;
        bh=HdL0D+SjTQ4mvueVqn+Q3mEOgkSVK8r4RcRIp5Jj57Q=;
        b=oOgwx0NXjWrLaCkvuXy+t1L7GnqexyToujGVMWTaZYAegtUb6hyQKYzUeAiXrKDQkh
         Ru5Oy925Ql+c4lKUuVQvvl3tFPvt/EquTiV5WXHO9CwLdJMhVPF7o/rv/f9iSB/+VoiN
         VEOZE8xD+nKZeHWp1GpmmBPda+kK8VBW9lms/B9fyMy7W8FqiIgMx1y4W5atmP/P0eMy
         N8mB9bjkm6Y5GIaW54rOq73f23Ep3E0m5dq6COYFockSSNMP78Kimgi0StJlE6NPXoOp
         02GC5ybLRI6w4/FFREsix7o0bCA8DMw3OBR5Gji+BVHfPBBkqQ8cTmb7/0BCX/3trrhV
         O9qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z56si3287604qtj.203.2017.10.04.02.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 02:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzffS-0007lw-Js
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 05:08:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JBeulich@suse.com>) id 1dzffJ-0007ln-6l
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 05:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JBeulich@suse.com>) id 1dzffD-0002bV-Hv
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 05:08:29 -0400
Received: from prv-mh.provo.novell.com ([137.65.248.74]:59934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <JBeulich@suse.com>)
	id 1dzffD-0002XU-7g; Wed, 04 Oct 2017 05:08:23 -0400
Received: from INET-PRV-MTA by prv-mh.provo.novell.com
	with Novell_GroupWise; Wed, 04 Oct 2017 03:08:18 -0600
Message-Id: <59D4C11F0200007800181F48@prv-mh.provo.novell.com>
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
Subject: [Qemu-arm] xen-pci-passthrough PCI Express support? (Re:
 [Qemu-devel] [Xen-devel] [PATCH v2 4/5] pci: Add
 INTERFACE_CONVENTIONAL_PCI_DEVICE to Conventional PCI devices)
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NmtCwALRKSiX

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

