Received: by 10.25.21.156 with SMTP id 28csp329622lfv;
        Thu, 18 Aug 2016 06:53:36 -0700 (PDT)
X-Received: by 10.200.50.82 with SMTP id y18mr2513700qta.29.1471528416253;
        Thu, 18 Aug 2016 06:53:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o97si1293897qko.135.2016.08.18.06.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 06:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baNlH-0002dh-J5
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 09:53:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1baNjo-0001XA-IJ
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 09:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1baNjh-0004AH-C5
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 09:52:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1baNjh-0004A9-3Q; Thu, 18 Aug 2016 09:51:57 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D61D4E4D7;
	Thu, 18 Aug 2016 13:51:56 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7IDpr0r020358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Aug 2016 09:51:54 -0400
Message-ID: <1471528312.3820.48.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Kevin Zhao <kevin.zhao@linaro.org>, Laine Stump <laine@redhat.com>
Date: Thu, 18 Aug 2016 15:51:52 +0200
In-Reply-To: <CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
	<CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 18 Aug 2016 13:51:56 +0000 (UTC)
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Thomas Hanson <thomas.hanson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GWLKOZykwTbm

On Thu, 2016-08-18 at 20:43 +0800, Kevin Zhao wrote:
> What's the minimum version of=C2=A0=C2=A0Qemu that support virito-1.0?
> Does Qemu 2.6 works?=C2=A0

2.6 definitely has virtio 1.0 support, however libvirt does
not yet allow you to control whether a device uses 0.9, 1.0
or both. The default for 2.6 should be both IIRC.

> Now I will manually add the slots and bus to pcie. Because
> I am not familiar with it,=C2=A0=C2=A0if it convenient, could you give
> me an available xml file which PCIE disk and PCIE
> net device can work for machine virt ?

The XML you're looking for is at the end of this message.

Note that a Fedora 24 guest configured this way will not
boot at all if the machine type is virt-2.6; on the other
hand, an identically-configured RHEL 7.3 guest will boot
even with virt-2.6, but both the disk and the network
adapter will be legacy PCI instead of PCIe.


<domain type=3D'kvm'>
=C2=A0 <name>abologna-f24</name>
=C2=A0 <uuid>f6d0428b-a034-4c4e-8ef2-f12f6aa9cab0</uuid>
=C2=A0 <memory unit=3D'KiB'>2097152</memory>
=C2=A0 <currentMemory unit=3D'KiB'>2097152</currentMemory>
=C2=A0 <vcpu placement=3D'static'>4</vcpu>
=C2=A0 <os>
=C2=A0=C2=A0=C2=A0=C2=A0<type arch=3D'aarch64' machine=3D'virt-2.7'>hvm</=
type>
=C2=A0=C2=A0=C2=A0=C2=A0<loader readonly=3D'yes' type=3D'pflash'>/usr/sha=
re/AAVMF/AAVMF_CODE.fd</loader>
=C2=A0=C2=A0=C2=A0=C2=A0<nvram>/var/lib/libvirt/qemu/nvram/abologna-f24_V=
ARS.fd</nvram>
=C2=A0=C2=A0=C2=A0=C2=A0<boot dev=3D'hd'/>
=C2=A0 </os>
=C2=A0 <features>
=C2=A0=C2=A0=C2=A0=C2=A0<gic version=3D'2'/>
=C2=A0 </features>
=C2=A0 <cpu mode=3D'host-passthrough'/>
=C2=A0 <clock offset=3D'utc'/>
=C2=A0 <on_poweroff>destroy</on_poweroff>
=C2=A0 <on_reboot>restart</on_reboot>
=C2=A0 <on_crash>restart</on_crash>
=C2=A0 <devices>
=C2=A0=C2=A0=C2=A0=C2=A0<emulator>/usr/libexec/abologna-qemu-kvm</emulato=
r>
=C2=A0=C2=A0=C2=A0=C2=A0<disk type=3D'file' device=3D'disk'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<driver name=3D'qemu' type=3D'qcow2'/=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<source file=3D'/var/lib/libvirt/imag=
es/abologna-f24.qcow2'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target dev=3D'vda' bus=3D'virtio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'pci' domain=3D'0x000=
0' bus=3D'0x01' slot=3D'0x00' function=3D'0x0'/>
=C2=A0=C2=A0=C2=A0=C2=A0</disk>
=C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'pci' index=3D'0' model=3D'pci=
e-root'/>
=C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'pci' index=3D'1' model=3D'pci=
e-root-port'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<model name=3D'ioh3420'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target chassis=3D'1' port=3D'0x8'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'pci' domain=3D'0x000=
0' bus=3D'0x00' slot=3D'0x01' function=3D'0x0'/>
=C2=A0=C2=A0=C2=A0=C2=A0</controller>
=C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'pci' index=3D'2' model=3D'pci=
e-root-port'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<model name=3D'ioh3420'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target chassis=3D'2' port=3D'0x10'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'pci' domain=3D'0x000=
0' bus=3D'0x00' slot=3D'0x02' function=3D'0x0'/>
=C2=A0=C2=A0=C2=A0=C2=A0</controller>
=C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'virtio-serial' index=3D'0'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'virtio-mmio'/>
=C2=A0=C2=A0=C2=A0=C2=A0</controller>
=C2=A0=C2=A0=C2=A0=C2=A0<interface type=3D'network'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<mac address=3D'52:54:00:10:07:41'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<source network=3D'default'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<model type=3D'virtio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<rom bar=3D'off'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'pci' domain=3D'0x000=
0' bus=3D'0x02' slot=3D'0x00' function=3D'0x0'/>
=C2=A0=C2=A0=C2=A0=C2=A0</interface>
=C2=A0=C2=A0=C2=A0=C2=A0<serial type=3D'pty'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target port=3D'0'/>
=C2=A0=C2=A0=C2=A0=C2=A0</serial>
=C2=A0=C2=A0=C2=A0=C2=A0<console type=3D'pty'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target type=3D'serial' port=3D'0'/>
=C2=A0=C2=A0=C2=A0=C2=A0</console>
=C2=A0=C2=A0=C2=A0=C2=A0<channel type=3D'unix'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<source mode=3D'bind'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target type=3D'virtio' name=3D'org.q=
emu.guest_agent.0'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'virtio-serial' contr=
oller=3D'0' bus=3D'0' port=3D'1'/>
=C2=A0=C2=A0=C2=A0=C2=A0</channel>
=C2=A0 </devices>
</domain>

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
