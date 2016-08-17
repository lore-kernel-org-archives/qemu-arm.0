Received: by 10.25.21.156 with SMTP id 28csp2593690lfv;
        Wed, 17 Aug 2016 09:13:19 -0700 (PDT)
X-Received: by 10.237.37.58 with SMTP id v55mr46592836qtc.9.1471450399738;
        Wed, 17 Aug 2016 09:13:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t7si21481263qtc.39.2016.08.17.09.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 09:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba3Sx-0000hk-5x
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 12:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ba3Ss-0000gA-K8
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 12:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ba3Sn-0002I8-JV
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 12:13:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ba3Sn-0002Ht-C4; Wed, 17 Aug 2016 12:13:09 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC304635CE;
	Wed, 17 Aug 2016 16:13:07 +0000 (UTC)
Received: from kamzik.localdomain (dhcp-1-170.brq.redhat.com [10.34.1.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7HGD33S016923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 17 Aug 2016 12:13:05 -0400
Date: Wed, 17 Aug 2016 18:13:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Kevin Zhao <kevin.zhao@linaro.org>
Message-ID: <20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 17 Aug 2016 16:13:08 +0000 (UTC)
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
	Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Laine Stump <lstump@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHcdzu63SDmk

On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
> Hi all,
>      Now I'm investigating net device hot plug and disk hotplug for
> AArch64. For virtio , the default address is virtio-mmio. After Libvirt
> 1.3.5, user can explicitly specify the address-type to pci and so libvirt
> will pass the virtio-pci parameters to the Qemu.
>      Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
> Libvirt version is 1.3.5.
>      For net-device, I change the address-type to pci, and libvirt pass the
> command below:
>      -device
> virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:25:25,bus=pci.2,addr=0x1
> 
>      After booting, the eth0 device disappear(eth0 occur when the address
> is virtio-mmio),
> but I can find another net-device enp2s1, also it can't work for dhcp:
> Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network
> device
> I'm not sure whether it worked.
> 
>      For disk device,* when I change the address-type to pci, the whole
> qemu command is :*
> https://paste.fedoraproject.org/409553/,  but the VM can not boot
> successfully. Does Qemu not support device disk of virtio-pci in AArch64
> just as it in X86_64?
>      Thanks~Since I am not very familiar with Qemu, really looking forward
> to your response.
> 
> Best Regards,
> Kevin Zhao

libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add
the i82801b11 bridge, which was necessary to use PCI devices with the PCIe
host bridge mach-virt has. IMO, libvirt and qemu still have a long way to
go in order to configure a base/standard mach-virt PCIe machine.

1) If we want to support both PCIe devices and PCI, then things are messy.
   Currently we propose dropping PCI support. mach-virt pretty much
   exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)
2) root complex ports, switches (upstream/downstream ports) are currently
   based on Intel parts. Marcel is thinking about creating generic models.
3) libvirt needs to learn how to plug everything together, in proper PCIe
   fashion, leaving holes for hotplug.
4) Probably more... I forget all the different issues we discovered when
   we started playing with this a few months ago.

The good news is that x86 folk want all the same things for the q35 model.
mach-virt enthusiasts like us get to ride along pretty much for free.

So, using virtio-pci with mach-virt and libvirt isn't possible right now,
not without manual changes to the XML. It might be nice to document how to
manually convert a guest, so developers who want to use virtio-pci don't
have to abandon libvirt. I'd have to look into that, or ask one of our
libvirt friends to help. Certainly the instructions would be for latest
libvirt though.

Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
following qemu command line works for me.
(notice the use of PCIe), and my network interface gets labeled enp0s1.

$QEMU -machine virt-2.6,accel=kvm -cpu host \
 -m 1024 -smp 1 -nographic \
 -bios /usr/share/AAVMF/AAVMF_CODE.fd \
 -device ioh3420,bus=pcie.0,id=pcie.1,port=1,chassis=1 \
 -device ioh3420,bus=pcie.0,id=pcie.2,port=2,chassis=2 \
 -device virtio-scsi-pci,disable-modern=off,disable-legacy=on,bus=pcie.1,addr=00.0,id=scsi0 \
 -drive file=/home/drjones/.local/libvirt/images/fedora.qcow2,format=qcow2,if=none,id=drive-scsi0-0-0-0 \
 -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1 \
 -netdev user,id=hostnet0 \
 -device virtio-net-pci,disable-modern=off,disable-legacy=on,bus=pcie.2,addr=00.0,netdev=hostnet0,id=net0

I prefer always using virtio-scsi for the disk, but a similar command
line can be used for a virtio-blk-pci disk.

Thanks,
drew
