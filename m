Received: by 10.25.21.156 with SMTP id 28csp292841lfv;
        Thu, 18 Aug 2016 05:30:55 -0700 (PDT)
X-Received: by 10.200.37.111 with SMTP id 44mr2003060qtn.17.1471523454998;
        Thu, 18 Aug 2016 05:30:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65si1092051qkj.9.2016.08.18.05.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 05:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baMTG-0004F4-E1
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 08:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1baMTC-0004Eo-2U
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1baMT9-00024W-4O
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:30:48 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:36437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1baMT8-000229-Ut
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:30:47 -0400
Received: by mail-ua0-x232.google.com with SMTP id 97so25149109uav.3
	for <qemu-arm@nongnu.org>; Thu, 18 Aug 2016 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xN+ebsW0NSOilu2/FJfuB7iZhtcbZMaIu2XuvRWbHIg=;
	b=grYvloqeWUNSjIRUzdF7lHI0SkD/kQypaaStheEmrnqfw+/kfspih5vt+aMeeY2YcS
	c/0iHKNyvkRmJgENk9viuESftTvK7i5hnM46r4WJhTafTyVbpQNsw+QFG1vMVZZj68ZE
	linsI/94W+nOfjGpoFi+hFRh98zliznvGHKFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xN+ebsW0NSOilu2/FJfuB7iZhtcbZMaIu2XuvRWbHIg=;
	b=bcx3ARmfDpROIqvw9+d1gwjd/qKwQei5ehgaPyzFK48cPacyfKIcYAKtYGG3FTIizB
	Ef17jLEJ86dLzvxSWuc6H2iJ0lZPDXkQ9B68t00y7FjLQzdNQvD4KjXb3EHpH6Jb/bDP
	0rOd0dwuUK7vXXE4BO2LY6slvy6di8FFTuQxSIhgoE1Tk2wz9YXVh7sFhI6Zfw/gBbnV
	O/rC3Rkn8yKcJYf22FDcUfIreC/EKuYauHcORGBLPiLoUrAVsCy6tQqvLqWtvEvqhos5
	fiZs4MM52v58e5oOsKkmnMh3QBAkSVRXLMCnfRYbH2lREY61W7mM6glqxOYv89ZfVl4J
	d9bA==
X-Gm-Message-State: AEkoousba02lx570fzzEg5PZgcZO9xSEIdv9yb/iVz1mgGRtHoiq1M5xKLygCLSXfBTVYOfY/H5psV37gLZYTsCf
X-Received: by 10.176.80.229 with SMTP id d34mr932718uaa.24.1471523445432;
	Thu, 18 Aug 2016 05:30:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.195 with HTTP; Thu, 18 Aug 2016 05:30:44 -0700 (PDT)
In-Reply-To: <20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Thu, 18 Aug 2016 20:30:44 +0800
Message-ID: <CAN76PtRX_tgiTbdMZ=CdgwYF6+ux4rA1b+caH0R49vs=JPAEuA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: multipart/alternative; boundary=94eb2c190b5e3e8e80053a57c089
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
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
	Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Laine Stump <lstump@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: piEb5rz1oHv6

--94eb2c190b5e3e8e80053a57c089
Content-Type: text/plain; charset=UTF-8

Hi Jones:
   Thanks~It is great that Qemu has been working on that :-)

On 18 August 2016 at 00:13, Andrew Jones <drjones@redhat.com> wrote:

> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
> > Hi all,
> >      Now I'm investigating net device hot plug and disk hotplug for
> > AArch64. For virtio , the default address is virtio-mmio. After Libvirt
> > 1.3.5, user can explicitly specify the address-type to pci and so libvirt
> > will pass the virtio-pci parameters to the Qemu.
> >      Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
> > Libvirt version is 1.3.5.
> >      For net-device, I change the address-type to pci, and libvirt pass
> the
> > command below:
> >      -device
> > virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:
> 0d:25:25,bus=pci.2,addr=0x1
> >
> >      After booting, the eth0 device disappear(eth0 occur when the address
> > is virtio-mmio),
> > but I can find another net-device enp2s1, also it can't work for dhcp:
> > Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network
> > device
> > I'm not sure whether it worked.
> >
> >      For disk device,* when I change the address-type to pci, the whole
> > qemu command is :*
> > https://paste.fedoraproject.org/409553/,  but the VM can not boot
> > successfully. Does Qemu not support device disk of virtio-pci in AArch64
> > just as it in X86_64?
> >      Thanks~Since I am not very familiar with Qemu, really looking
> forward
> > to your response.
> >
> > Best Regards,
> > Kevin Zhao
>
> libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add
> the i82801b11 bridge, which was necessary to use PCI devices with the PCIe
> host bridge mach-virt has. IMO, libvirt and qemu still have a long way to
> go in order to configure a base/standard mach-virt PCIe machine.
>
>
Yeah, I am changing to libvirt 2.1.0, I find that I should use PCI by
manually add
the slots and bus to it.

1) If we want to support both PCIe devices and PCI, then things are messy.
>    Currently we propose dropping PCI support. mach-virt pretty much
>    exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)
> 2) root complex ports, switches (upstream/downstream ports) are currently
>    based on Intel parts. Marcel is thinking about creating generic models.
> 3) libvirt needs to learn how to plug everything together, in proper PCIe
>    fashion, leaving holes for hotplug.
> 4) Probably more... I forget all the different issues we discovered when
>    we started playing with this a few months ago.
>
> The good news is that x86 folk want all the same things for the q35 model.
> mach-virt enthusiasts like us get to ride along pretty much for free.
>
> So, using virtio-pci with mach-virt and libvirt isn't possible right now,
> not without manual changes to the XML. It might be nice to document how to
> manually convert a guest, so developers who want to use virtio-pci don't
> have to abandon libvirt. I'd have to look into that, or ask one of our
> libvirt friends to help. Certainly the instructions would be for latest
> libvirt though.
>
>
As you said,  that means that I can use PCIe as the bus for disk and
net-device.
I will try using pcie in libvirt. I will try the newest version of libvirt.
Do I need to change <address type = 'pcie'> to enable it in AArch64 ?
The pcie bus will  be automatically assigned in libvirt ?


> Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
> following qemu command line works for me.
> (notice the use of PCIe), and my network interface gets labeled enp0s1.
>
> $QEMU -machine virt-2.6,accel=kvm -cpu host \
>  -m 1024 -smp 1 -nographic \
>  -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>  -device ioh3420,bus=pcie.0,id=pcie.1,port=1,chassis=1 \
>  -device ioh3420,bus=pcie.0,id=pcie.2,port=2,chassis=2 \
>  -device virtio-scsi-pci,disable-modern=off,disable-legacy=on,bus=pcie.1,addr=00.0,id=scsi0
> \
>  -drive file=/home/drjones/.local/libvirt/images/fedora.qcow2,
> format=qcow2,if=none,id=drive-scsi0-0-0-0 \
>  -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-
> scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1 \
>  -netdev user,id=hostnet0 \
>  -device virtio-net-pci,disable-modern=off,disable-legacy=on,bus=
> pcie.2,addr=00.0,netdev=hostnet0,id=net0
>
> I prefer always using virtio-scsi for the disk, but a similar command
> line can be used for a virtio-blk-pci disk.
>
> OK great! Because in Openstack Nova ,AArch64 need to realize the hotplug
only with
the virtio bus, so investigate the virtio-pci. :-)
Thanks again!


> Thanks,
> drew
>

--94eb2c190b5e3e8e80053a57c089
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jones:<div>=C2=A0 =C2=A0Thanks~It is great that Qemu ha=
s been working on that :-)<br><div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 18 August 2016 at 00:13, Andrew Jones <span dir=3D"ltr=
">&lt;<a href=3D"mailto:drjones@redhat.com" target=3D"_blank">drjones@redha=
t.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:<br>
&gt; Hi all,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Now I&#39;m investigating net device hot plug and =
disk hotplug for<br>
&gt; AArch64. For virtio , the default address is virtio-mmio. After Libvir=
t<br>
&gt; 1.3.5, user can explicitly specify the address-type to pci and so libv=
irt<br>
&gt; will pass the virtio-pci parameters to the Qemu.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Both my host and guest OS is Debian8, and Qemu ver=
sion is 2.6.0.<br>
&gt; Libvirt version is 1.3.5.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 For net-device, I change the address-type to pci, =
and libvirt pass the<br>
&gt; command below:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -device<br>
&gt; virtio-net-pci,netdev=3D<wbr>hostnet0,id=3Dnet0,mac=3D52:54:00:<wbr>0d=
:25:25,bus=3Dpci.2,addr=3D0x1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 After booting, the eth0 device disappear(eth0 occu=
r when the address<br>
&gt; is virtio-mmio),<br>
&gt; but I can find another net-device enp2s1, also it can&#39;t work for d=
hcp:<br>
&gt; Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio networ=
k<br>
&gt; device<br>
&gt; I&#39;m not sure whether it worked.<br>
&gt;<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 For disk device,* when I change the address=
-type to pci, the whole<br>
&gt; qemu command is :*<br>
<span class=3D"">&gt; <a href=3D"https://paste.fedoraproject.org/409553/" r=
el=3D"noreferrer" target=3D"_blank">https://paste.fedoraproject.<wbr>org/40=
9553/</a>,=C2=A0 but the VM can not boot<br>
&gt; successfully. Does Qemu not support device disk of virtio-pci in AArch=
64<br>
&gt; just as it in X86_64?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Thanks~Since I am not very familiar with Qemu, rea=
lly looking forward<br>
&gt; to your response.<br>
&gt;<br>
&gt; Best Regards,<br>
&gt; Kevin Zhao<br>
<br>
</span>libvirt 1.3.5 is a bit old. Later versions no longer unconditionally=
 add<br>
the i82801b11 bridge, which was necessary to use PCI devices with the PCIe<=
br>
host bridge mach-virt has. IMO, libvirt and qemu still have a long way to<b=
r>
go in order to configure a base/standard mach-virt PCIe machine.<br>
<br></blockquote><div>=C2=A0</div><div>Yeah, I am changing to libvirt 2.1.0=
, I find that I should use PCI by manually add</div><div>the slots and bus =
to it.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
1) If we want to support both PCIe devices and PCI, then things are messy.<=
br>
=C2=A0 =C2=A0Currently we propose dropping PCI support. mach-virt pretty mu=
ch<br>
=C2=A0 =C2=A0exclusively uses virtio, which can be set to PCIe mode (virtio=
-1.0)<br>
2) root complex ports, switches (upstream/downstream ports) are currently<b=
r>
=C2=A0 =C2=A0based on Intel parts. Marcel is thinking about creating generi=
c models.<br>
3) libvirt needs to learn how to plug everything together, in proper PCIe<b=
r>
=C2=A0 =C2=A0fashion, leaving holes for hotplug.<br>
4) Probably more... I forget all the different issues we discovered when<br=
>
=C2=A0 =C2=A0we started playing with this a few months ago.<br>
<br>
The good news is that x86 folk want all the same things for the q35 model.<=
br>
mach-virt enthusiasts like us get to ride along pretty much for free.<br>
<br>
So, using virtio-pci with mach-virt and libvirt isn&#39;t possible right no=
w,<br>
not without manual changes to the XML. It might be nice to document how to<=
br>
manually convert a guest, so developers who want to use virtio-pci don&#39;=
t<br>
have to abandon libvirt. I&#39;d have to look into that, or ask one of our<=
br>
libvirt friends to help. Certainly the instructions would be for latest<br>
libvirt though.<br>
<br></blockquote><div><br></div><div>As you said, =C2=A0that means that I c=
an use PCIe as the bus for disk and net-device.</div><div>I will try using =
pcie in libvirt. I will try the newest version of libvirt.=C2=A0</div><div>=
Do I need to change &lt;address type =3D &#39;pcie&#39;&gt; to enable it in=
 AArch64 ?</div><div>The pcie bus will =C2=A0be automatically assigned in l=
ibvirt ?=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The<br>
following qemu command line works for me.<br>
(notice the use of PCIe), and my network interface gets labeled enp0s1.<br>
<br>
$QEMU -machine virt-2.6,accel=3Dkvm -cpu host \<br>
=C2=A0-m 1024 -smp 1 -nographic \<br>
=C2=A0-bios /usr/share/AAVMF/AAVMF_CODE.fd \<br>
=C2=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.1,<wbr>port=3D1,chassis=3D1 \<=
br>
=C2=A0-device ioh3420,bus=3Dpcie.0,id=3Dpcie.2,<wbr>port=3D2,chassis=3D2 \<=
br>
=C2=A0-device virtio-scsi-pci,disable-<wbr>modern=3Doff,disable-legacy=3Don=
,<wbr>bus=3Dpcie.1,addr=3D00.0,id=3Dscsi0 \<br>
=C2=A0-drive file=3D/home/drjones/.local/<wbr>libvirt/images/fedora.qcow2,<=
wbr>format=3Dqcow2,if=3Dnone,id=3Ddrive-<wbr>scsi0-0-0-0 \<br>
=C2=A0-device scsi-hd,bus=3Dscsi0.0,channel=3D0,<wbr>scsi-id=3D0,lun=3D0,dr=
ive=3Ddrive-<wbr>scsi0-0-0-0,id=3Dscsi0-0-0-0,<wbr>bootindex=3D1 \<br>
=C2=A0-netdev user,id=3Dhostnet0 \<br>
=C2=A0-device virtio-net-pci,disable-modern=3D<wbr>off,disable-legacy=3Don,=
bus=3D<wbr>pcie.2,addr=3D00.0,netdev=3D<wbr>hostnet0,id=3Dnet0<br>
<br>
I prefer always using virtio-scsi for the disk, but a similar command<br>
line can be used for a virtio-blk-pci disk.<br>
<br></blockquote><div>OK great! Because in Openstack Nova ,AArch64 need to =
realize the hotplug only with</div><div>the virtio bus, so investigate the =
virtio-pci. :-)</div><div>Thanks again!=C2=A0</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
Thanks,<br>
drew<br>
</blockquote></div><br></div></div></div></div>

--94eb2c190b5e3e8e80053a57c089--
