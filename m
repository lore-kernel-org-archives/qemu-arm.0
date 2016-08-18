Received: by 10.25.21.156 with SMTP id 28csp168775lfv;
        Wed, 17 Aug 2016 23:38:22 -0700 (PDT)
X-Received: by 10.237.49.5 with SMTP id 5mr613601qtg.136.1471502302333;
        Wed, 17 Aug 2016 23:38:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32si352018qtb.52.2016.08.17.23.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 23:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baGy5-000628-Q6
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 02:38:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1baGy1-0005z3-VF
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 02:38:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1baGxy-000658-N5
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 02:38:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1baGxy-00064z-El; Thu, 18 Aug 2016 02:38:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB57CC030713;
	Thu, 18 Aug 2016 06:38:12 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7I6c7R1002748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Aug 2016 02:38:10 -0400
Date: Thu, 18 Aug 2016 08:38:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160818063807.mqs7jdjau5uwyswx@hawk.localdomain>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<1471452093.3820.42.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1471452093.3820.42.camel@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 18 Aug 2016 06:38:12 +0000 (UTC)
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
X-TUID: WR04s65fTFCP

On Wed, Aug 17, 2016 at 06:41:33PM +0200, Andrea Bolognani wrote:
> On Wed, 2016-08-17 at 18:13 +0200, Andrew Jones wrote:
> > On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
> > >=A0
> > > Hi all,
> > >=A0=A0=A0=A0=A0=A0Now I'm investigating net device hot plug and disk=
 hotplug for
> > > AArch64. For virtio , the default address is virtio-mmio. After Lib=
virt
> > > 1.3.5, user can explicitly specify the address-type to pci and so l=
ibvirt
> > > will pass the virtio-pci parameters to the Qemu.
> > >=A0=A0=A0=A0=A0=A0Both my host and guest OS is Debian8, and Qemu ver=
sion is 2.6.0.
> > > Libvirt version is 1.3.5.
> > >=A0=A0=A0=A0=A0=A0For net-device, I change the address-type to pci, =
and libvirt pass the
> > > command below:
> > >=A0=A0=A0=A0=A0=A0-device
> > > virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:0d:25:25,=
bus=3Dpci.2,addr=3D0x1
> > >=A0
> > >=A0=A0=A0=A0=A0=A0After booting, the eth0 device disappear(eth0 occu=
r when the address
> > > is virtio-mmio),
> > > but I can find another net-device enp2s1, also it can't work for dh=
cp:
> > > Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio net=
work
> > > device
> > > I'm not sure whether it worked.
> > >=A0
> > >=A0=A0=A0=A0=A0=A0For disk device,* when I change the address-type t=
o pci, the whole
> > > qemu command is :*
> > > https://paste.fedoraproject.org/409553/,=A0=A0but the VM can not bo=
ot
> > > successfully. Does Qemu not support device disk of virtio-pci in AA=
rch64
> > > just as it in X86_64?
> > >=A0=A0=A0=A0=A0=A0Thanks~Since I am not very familiar with Qemu, rea=
lly looking forward
> > > to your response.
> > >=A0
> > > Best Regards,
> > > Kevin Zhao
> >=A0
> > libvirt 1.3.5 is a bit old. Later versions no longer unconditionally =
add
> > the i82801b11 bridge, which was necessary to use PCI devices with the=
 PCIe
> > host bridge mach-virt has. IMO, libvirt and qemu still have a long wa=
y to
> > go in order to configure a base/standard mach-virt PCIe machine.
>=20
> Debian 8, the guest OS Kevin is trying to boot, is even older,
> and in particular it doesn't have any virtio-pci support.
>=20
> By the way, the same issue was raised on the libvirt list as
> well
>=20
> =A0 https://www.redhat.com/archives/libvir-list/2016-August/msg00854.ht=
ml
>=20
> and there's some more information there.
>=20
> > 1) If we want to support both PCIe devices and PCI, then things are m=
essy.
> >=A0=A0=A0=A0Currently we propose dropping PCI support. mach-virt prett=
y much
> >=A0=A0=A0=A0exclusively uses virtio, which can be set to PCIe mode (vi=
rtio-1.0)
> > 2) root complex ports, switches (upstream/downstream ports) are curre=
ntly
> >=A0=A0=A0=A0based on Intel parts. Marcel is thinking about creating ge=
neric models.
>=20
> Huge +1 from me! Way to go, Marcel! :)
>=20
> > 3) libvirt needs to learn how to plug everything together, in proper =
PCIe
> >=A0=A0=A0=A0fashion, leaving holes for hotplug.
>=20
> Work on this front is ongoing on the libvirt front as we speak.
>=20
> > 4) Probably more... I forget all the different issues we discovered w=
hen
> >=A0=A0=A0=A0we started playing with this a few months ago.
> >=A0
> > The good news is that x86 folk want all the same things for the q35 m=
odel.
> > mach-virt enthusiasts like us get to ride along pretty much for free.
> >=A0
> > So, using virtio-pci with mach-virt and libvirt isn't possible right =
now,
> > not without manual changes to the XML. It might be nice to document h=
ow to
> > manually convert a guest, so developers who want to use virtio-pci do=
n't
> > have to abandon libvirt. I'd have to look into that, or ask one of ou=
r
> > libvirt friends to help. Certainly the instructions would be for late=
st
> > libvirt though.
>=20
> Things are very much in flux, though, so I'm not entirely sure
> putting out any sort of official document would be a good idea
> right now. We'll definitely help eg. through the mailing lists
> and similar channels, but committing any configuration to a
> more static media seems premature.

Understood, and based on Laine's response, things are looking just
around the corner now anyway, so forget I asked :-)

>=20
> > Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
> > following qemu command line works for me.
> > (notice the use of PCIe), and my network interface gets labeled enp0s=
1.
> >=A0
> > $QEMU -machine virt-2.6,accel=3Dkvm -cpu host \
> >=A0=A0-m 1024 -smp 1 -nographic \
> >=A0=A0-bios /usr/share/AAVMF/AAVMF_CODE.fd \
> >=A0=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.1,port=3D1,chassis=3D1 \
> >=A0=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.2,port=3D2,chassis=3D2 \
> >=A0=A0-device virtio-scsi-pci,disable-modern=3Doff,disable-legacy=3Don=
,bus=3Dpcie.1,addr=3D00.0,id=3Dscsi0 \
> >=A0=A0-drive file=3D/home/drjones/.local/libvirt/images/fedora.qcow2,f=
ormat=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0 \
> >=A0=A0-device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,dr=
ive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 \
> >=A0=A0-netdev user,id=3Dhostnet0 \
> >=A0=A0-device virtio-net-pci,disable-modern=3Doff,disable-legacy=3Don,=
bus=3Dpcie.2,addr=3D00.0,netdev=3Dhostnet0,id=3Dnet0
> >=A0
> > I prefer always using virtio-scsi for the disk, but a similar command
> > line can be used for a virtio-blk-pci disk.
>=20
> Does the same command line work if you don't specify any of
> the disable-* options?
>=20
> I'm asking because I tried running a Fedora 24 guest through
> libvirt, which doesn't support those options yet, and I get
>=20
> =A0 virtio_blk virtio2: virtio: device uses modern interface but
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0does not have VIRTIO_F_VERSION_1
> =A0 virtio_blk: probe of virtio2 failed with error -22

Doesn't work for me either. I can only boot with disable-modern=3Doff,
disable-legacy=3Don (at least when building my config the way I try to
build it...) I presume that's a guest kernel issue.

>=20
> Isn't the default for 2.6 disable-modern=3Doff,
> disable-legacy=3Doff? Or was that 2.7? I tried both anyway ;)

Dunno. With the command line getting longer all the time, I just
have a script that generates one that works for me, and haven't
worried much about the defaults...

Thanks,
drew
