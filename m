Received: by 10.25.21.156 with SMTP id 28csp2605640lfv;
        Wed, 17 Aug 2016 09:41:48 -0700 (PDT)
X-Received: by 10.200.46.216 with SMTP id i24mr47142524qta.79.1471452108340;
        Wed, 17 Aug 2016 09:41:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si12814293qkd.59.2016.08.17.09.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 09:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba3uV-0001DI-PT
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 12:41:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ba3uR-0001Ck-Ig
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 12:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ba3uO-0007om-6Y
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 12:41:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1ba3uN-0007oX-Ue; Wed, 17 Aug 2016 12:41:40 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB0F7C04D280;
	Wed, 17 Aug 2016 16:41:38 +0000 (UTC)
Received: from ovpn-200-55.brq.redhat.com (ovpn-200-55.brq.redhat.com
	[10.40.200.55])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7HGfYPV016936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 17 Aug 2016 12:41:36 -0400
Message-ID: <1471452093.3820.42.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Kevin Zhao <kevin.zhao@linaro.org>
Date: Wed, 17 Aug 2016 18:41:33 +0200
In-Reply-To: <20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 17 Aug 2016 16:41:38 +0000 (UTC)
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
	Marcel Apfelbaum <mapfelba@redhat.com>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Thomas Hanson <thomas.hanson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Laine Stump <lstump@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +RqXUXKvMdyv

On Wed, 2016-08-17 at 18:13 +0200, Andrew Jones wrote:
> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
> >=C2=A0
> > Hi all,
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Now I'm investigating net device h=
ot plug and disk hotplug for
> > AArch64. For virtio , the default address is virtio-mmio. After Libvi=
rt
> > 1.3.5, user can explicitly specify the address-type to pci and so lib=
virt
> > will pass the virtio-pci parameters to the Qemu.
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Both my host and guest OS is Debia=
n8, and Qemu version is 2.6.0.
> > Libvirt version is 1.3.5.
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0For net-device, I change the addre=
ss-type to pci, and libvirt pass the
> > command below:
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device
> > virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:0d:25:25,bu=
s=3Dpci.2,addr=3D0x1
> >=C2=A0
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0After booting, the eth0 device dis=
appear(eth0 occur when the address
> > is virtio-mmio),
> > but I can find another net-device enp2s1, also it can't work for dhcp=
:
> > Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio netwo=
rk
> > device
> > I'm not sure whether it worked.
> >=C2=A0
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0For disk device,* when I change th=
e address-type to pci, the whole
> > qemu command is :*
> > https://paste.fedoraproject.org/409553/,=C2=A0=C2=A0but the VM can no=
t boot
> > successfully. Does Qemu not support device disk of virtio-pci in AArc=
h64
> > just as it in X86_64?
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Thanks~Since I am not very familia=
r with Qemu, really looking forward
> > to your response.
> >=C2=A0
> > Best Regards,
> > Kevin Zhao
>=C2=A0
> libvirt 1.3.5 is a bit old. Later versions no longer unconditionally ad=
d
> the i82801b11 bridge, which was necessary to use PCI devices with the P=
CIe
> host bridge mach-virt has. IMO, libvirt and qemu still have a long way =
to
> go in order to configure a base/standard mach-virt PCIe machine.

Debian 8, the guest OS Kevin is trying to boot, is even older,
and in particular it doesn't have any virtio-pci support.

By the way, the same issue was raised on the libvirt list as
well

=C2=A0 https://www.redhat.com/archives/libvir-list/2016-August/msg00854.h=
tml

and there's some more information there.

> 1) If we want to support both PCIe devices and PCI, then things are mes=
sy.
>=C2=A0=C2=A0=C2=A0=C2=A0Currently we propose dropping PCI support. mach-=
virt pretty much
>=C2=A0=C2=A0=C2=A0=C2=A0exclusively uses virtio, which can be set to PCI=
e mode (virtio-1.0)
> 2) root complex ports, switches (upstream/downstream ports) are current=
ly
>=C2=A0=C2=A0=C2=A0=C2=A0based on Intel parts. Marcel is thinking about c=
reating generic models.

Huge +1 from me! Way to go, Marcel! :)

> 3) libvirt needs to learn how to plug everything together, in proper PC=
Ie
>=C2=A0=C2=A0=C2=A0=C2=A0fashion, leaving holes for hotplug.

Work on this front is ongoing on the libvirt front as we speak.

> 4) Probably more... I forget all the different issues we discovered whe=
n
>=C2=A0=C2=A0=C2=A0=C2=A0we started playing with this a few months ago.
>=C2=A0
> The good news is that x86 folk want all the same things for the q35 mod=
el.
> mach-virt enthusiasts like us get to ride along pretty much for free.
>=C2=A0
> So, using virtio-pci with mach-virt and libvirt isn't possible right no=
w,
> not without manual changes to the XML. It might be nice to document how=
 to
> manually convert a guest, so developers who want to use virtio-pci don'=
t
> have to abandon libvirt. I'd have to look into that, or ask one of our
> libvirt friends to help. Certainly the instructions would be for latest
> libvirt though.

Things are very much in flux, though, so I'm not entirely sure
putting out any sort of official document would be a good idea
right now. We'll definitely help eg. through the mailing lists
and similar channels, but committing any configuration to a
more static media seems premature.

> Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
> following qemu command line works for me.
> (notice the use of PCIe), and my network interface gets labeled enp0s1.
>=C2=A0
> $QEMU -machine virt-2.6,accel=3Dkvm -cpu host \
>=C2=A0=C2=A0-m 1024 -smp 1 -nographic \
>=C2=A0=C2=A0-bios /usr/share/AAVMF/AAVMF_CODE.fd \
>=C2=A0=C2=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.1,port=3D1,chassis=3D=
1 \
>=C2=A0=C2=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.2,port=3D2,chassis=3D=
2 \
>=C2=A0=C2=A0-device virtio-scsi-pci,disable-modern=3Doff,disable-legacy=3D=
on,bus=3Dpcie.1,addr=3D00.0,id=3Dscsi0 \
>=C2=A0=C2=A0-drive file=3D/home/drjones/.local/libvirt/images/fedora.qco=
w2,format=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0 \
>=C2=A0=C2=A0-device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D=
0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 \
>=C2=A0=C2=A0-netdev user,id=3Dhostnet0 \
>=C2=A0=C2=A0-device virtio-net-pci,disable-modern=3Doff,disable-legacy=3D=
on,bus=3Dpcie.2,addr=3D00.0,netdev=3Dhostnet0,id=3Dnet0
>=C2=A0
> I prefer always using virtio-scsi for the disk, but a similar command
> line can be used for a virtio-blk-pci disk.

Does the same command line work if you don't specify any of
the disable-* options?

I'm asking because I tried running a Fedora 24 guest through
libvirt, which doesn't support those options yet, and I get

=C2=A0 virtio_blk virtio2: virtio: device uses modern interface but
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0does not have VIRTIO_F_VERSION_1
=C2=A0 virtio_blk: probe of virtio2 failed with error -22

Isn't the default for 2.6 disable-modern=3Doff,
disable-legacy=3Doff? Or was that 2.7? I tried both anyway ;)

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
