Received: by 10.25.21.156 with SMTP id 28csp405169lfv;
        Fri, 19 Aug 2016 08:43:46 -0700 (PDT)
X-Received: by 10.200.39.61 with SMTP id g58mr9515622qtg.129.1471621426004;
        Fri, 19 Aug 2016 08:43:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si3017908qtc.147.2016.08.19.08.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 08:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1balxR-0004kw-Aa
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 11:43:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1balx9-0004cq-6z
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 11:43:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1balx6-00082K-2T
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 11:43:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1balx5-000810-QH; Fri, 19 Aug 2016 11:43:23 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDEDE821C3;
	Fri, 19 Aug 2016 15:43:22 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7JFhJrl014108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 19 Aug 2016 11:43:20 -0400
Message-ID: <1471621399.3820.64.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Date: Fri, 19 Aug 2016 17:43:19 +0200
In-Reply-To: <20160818063807.mqs7jdjau5uwyswx@hawk.localdomain>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<1471452093.3820.42.camel@redhat.com>
	<20160818063807.mqs7jdjau5uwyswx@hawk.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 19 Aug 2016 15:43:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Help: Does Qemu support virtio-pci for
 net-device and disk device?
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
	Marcel Apfelbaum <mapfelba@redhat.com>, Kevin Zhao <kevin.zhao@linaro.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Thomas Hanson <thomas.hanson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Laine Stump <lstump@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ud/2l4QXarE+

On Thu, 2016-08-18 at 08:38 +0200, Andrew Jones wrote:
> > > Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
> > > following qemu command line works for me.
> > > (notice the use of PCIe), and my network interface gets labeled enp=
0s1.
> > >=C2=A0=C2=A0
> > > $QEMU -machine virt-2.6,accel=3Dkvm -cpu host \
> > >=C2=A0=C2=A0=C2=A0-m 1024 -smp 1 -nographic \
> > >=C2=A0=C2=A0=C2=A0-bios /usr/share/AAVMF/AAVMF_CODE.fd \
> > >=C2=A0=C2=A0=C2=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.1,port=3D1,=
chassis=3D1 \
> > >=C2=A0=C2=A0=C2=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.2,port=3D2,=
chassis=3D2 \
> > >=C2=A0=C2=A0=C2=A0-device virtio-scsi-pci,disable-modern=3Doff,disab=
le-legacy=3Don,bus=3Dpcie.1,addr=3D00.0,id=3Dscsi0 \
> > >=C2=A0=C2=A0=C2=A0-drive file=3D/home/drjones/.local/libvirt/images/=
fedora.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0 \
> > >=C2=A0=C2=A0=C2=A0-device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D=
0,lun=3D0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 \
> > >=C2=A0=C2=A0=C2=A0-netdev user,id=3Dhostnet0 \
> > >=C2=A0=C2=A0=C2=A0-device virtio-net-pci,disable-modern=3Doff,disabl=
e-legacy=3Don,bus=3Dpcie.2,addr=3D00.0,netdev=3Dhostnet0,id=3Dnet0
> > >=C2=A0=C2=A0
> > > I prefer always using virtio-scsi for the disk, but a similar comma=
nd
> > > line can be used for a virtio-blk-pci disk.
> >=C2=A0
> > Does the same command line work if you don't specify any of
> > the disable-* options?
> >=C2=A0
> > I'm asking because I tried running a Fedora 24 guest through
> > libvirt, which doesn't support those options yet, and I get
> >=C2=A0
> >=C2=A0=C2=A0=C2=A0virtio_blk virtio2: virtio: device uses modern inter=
face but
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0does not have VIRTIO_F_VERSION_1
> >=C2=A0=C2=A0=C2=A0virtio_blk: probe of virtio2 failed with error -22
>=C2=A0
> Doesn't work for me either. I can only boot with disable-modern=3Doff,
> disable-legacy=3Don (at least when building my config the way I try to
> build it...) I presume that's a guest kernel issue.

I tried Fedora 24 and Debian testing, and for both of them
the result is the same: I can only boot the guest if I'm
setting up a legacy-free PCIe topology and use virt-2.7 to
obtain virtio-1.0 devices (see below); for every other
permutation of

=C2=A0 { PCI topology, PCIe topology } x { virt-2.6, virt-2.7 }

the guest doesn't boot at all.

On the other hand, a RHEL 7.3 guest was able to boot *every
single time*, even though the result was in some cases
quite questionable (eg. legacy PCI devices plugged into
ioh3420 ports).

> > Isn't the default for 2.6 disable-modern=3Doff,
> > disable-legacy=3Doff? Or was that 2.7? I tried both anyway ;)
>=C2=A0
> Dunno. With the command line getting longer all the time, I just
> have a script that generates one that works for me, and haven't
> worried much about the defaults...

So I thought the default for 2.6 was supposed to be

=C2=A0 disable-modern=3Doff,disable-legacy=3Doff=C2=A0=C2=A0[0.9+1.0]

but it turns out it's actually

=C2=A0 disable-modern=3Don,disable-legacy=3Doff =C2=A0 =C2=A0 =C2=A0 [0.9=
]

whereas the default for 2.7 is

=C2=A0 disable-modern=3Doff,disable-legacy=3Don =C2=A0 =C2=A0 =C2=A0 [1.0=
]

Is the idea that there would be a QEMU release with both
0.9 and 1.0 enabled by default something that I just
imagined? Or did the plan just change at some point?

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
