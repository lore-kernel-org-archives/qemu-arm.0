Received: by 10.25.21.156 with SMTP id 28csp2625792lfv;
        Wed, 17 Aug 2016 10:32:47 -0700 (PDT)
X-Received: by 10.55.154.22 with SMTP id c22mr45719556qke.36.1471455167399;
        Wed, 17 Aug 2016 10:32:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y198si20370493qka.154.2016.08.17.10.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 10:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba4hq-0006rp-QX
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 13:32:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1ba4CO-0006yJ-IR
	for qemu-devel@nongnu.org; Wed, 17 Aug 2016 13:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1ba4CL-000327-Sn
	for qemu-devel@nongnu.org; Wed, 17 Aug 2016 13:00:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>)
	id 1ba4CG-00030M-BH; Wed, 17 Aug 2016 13:00:08 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55FA115D8;
	Wed, 17 Aug 2016 17:00:07 +0000 (UTC)
Received: from vlap.laine.org (ovpn-116-25.phx2.redhat.com [10.3.116.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7HH055S020237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 13:00:06 -0400
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
From: Laine Stump <laine@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
Date: Wed, 17 Aug 2016 13:00:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 17 Aug 2016 17:00:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Help: Does Qemu support virtio-pci for net-device
 and disk device?
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Kevin Zhao <kevin.zhao@linaro.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	Marcel Apfelbaum <mapfelba@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ngeDg7UawdV9

On 08/17/2016 12:13 PM, Andrew Jones wrote:
> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
>> Hi all,
>>       Now I'm investigating net device hot plug and disk hotplug for
>> AArch64. For virtio , the default address is virtio-mmio. After Libvirt
>> 1.3.5, user can explicitly specify the address-type to pci and so libvirt
>> will pass the virtio-pci parameters to the Qemu.
>>       Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
>> Libvirt version is 1.3.5.
>>       For net-device, I change the address-type to pci, and libvirt pass the
>> command below:
>>       -device
>> virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:25:25,bus=pci.2,addr=0x1
>>
>>       After booting, the eth0 device disappear(eth0 occur when the address
>> is virtio-mmio),
>> but I can find another net-device enp2s1, also it can't work for dhcp:
>> Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network
>> device
>> I'm not sure whether it worked.
>>
>>       For disk device,* when I change the address-type to pci, the whole
>> qemu command is :*
>> https://paste.fedoraproject.org/409553/,  but the VM can not boot
>> successfully. Does Qemu not support device disk of virtio-pci in AArch64
>> just as it in X86_64?
>>       Thanks~Since I am not very familiar with Qemu, really looking forward
>> to your response.
>>
>> Best Regards,
>> Kevin Zhao
> libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add
> the i82801b11 bridge, which was necessary to use PCI devices with the PCIe
> host bridge mach-virt has. IMO, libvirt and qemu still have a long way to
> go in order to configure a base/standard mach-virt PCIe machine.

Well, you can do it now, but you have to manually assign the PCI 
addresses of devices (and if you want hotplug you need to live with 
Intel/TI-specific PCIe controllers).


>
> 1) If we want to support both PCIe devices and PCI, then things are messy.
>     Currently we propose dropping PCI support. mach-virt pretty much
>     exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)

I have a libvirt patch just about ACKed for pushing upstream that will 
automatically assign virtio-pci devices to a PCIe slot (if the qemu 
binary supports virtio-1.0):

https://www.redhat.com/archives/libvir-list/2016-August/msg00852.html

Separate patches do the same for the e1000e emulated network device 
(which you probably don't care about) and the nec-usb-xhci (USB3) 
controller (more useful):

https://www.redhat.com/archives/libvir-list/2016-August/msg00732.html

Once these are in place, the only type of device of any consequence that 
I can see still having no PCIe alternative is audio (even though only 
the virgl video device is PCIe, libvirt has always assigned the primary 
video to slot 1 on pcie-root anyway (although you shouldn't put a legacy 
PCI device on a pcie-root-port or pcie-switch-downstream-port, it is 
acceptable to plug it directly into pcie-root (as long as you know you 
won't need to hotplug it).

> 2) root complex ports, switches (upstream/downstream ports) are currently
>     based on Intel parts. Marcel is thinking about creating generic models.

I say this every time it comes up, so just to be consistent: +1 :-)

> 3) libvirt needs to learn how to plug everything together, in proper PCIe
>     fashion, leaving holes for hotplug.

See above about virtio, although that doesn't cover the whole story. The 
other part (which I'm working on right now) is that libvirt needs to 
automatically add pcie-root-port, pcie-switch-upstream-port, and 
pcie-switch-downstream-port devices as necessary. With the patches I 
mentioned above, you still have to manually add enough pcie-*-port 
controllers to the config, and then libvirt will plug the PCIe devices 
into the right place. This is simple enough to do, but it does require 
intervention.

As far as leaving holes for hotplug, there's actually still a bit of an 
open question there - with machinetypes that use only legacy-PCI, *all* 
slots are hotpluggable, and they're added 31 at a time, so there was 
never any question about which slots were hotpluggable, and it would be 
very rare to end up with a configuration that had 0 free slots available 
for hotplug (actually libvirt would always make sure there was at least 
one, but in practice there would be many more open slots). With 
PCIe-capable machinetypes that is changed, since the root complex 
(pcie-root) doesn't support hotplug, and new slots are added 1 at a time 
(pcie-*-port) rather than 31 at a time. This means you have to really go 
out of your way if you want open slots for hotplug (and even if you want 
devices in the machine at boot time to be hot-unpluggable).

I'm still not sure just how far we need to go in this regard.  We've 
already decided that, unless manually set to an address on pcie-root by 
the user/management application, all PCI devices will be auto-assigned 
to a slot that supports hotplug. What I'm not sure about is whether we 
should always auto-add an extra pcie-*-root to be sure a device can be 
hotplugged, or if we should admit that 1 available slot isn't good 
enough for all situations, so we should instead just leave it up to the 
user/management to manually add extra ports if they think they'll want 
to hotplug something later.

> 4) Probably more... I forget all the different issues we discovered when
>     we started playing with this a few months ago.
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
> Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
> following qemu command line works for me.
> (notice the use of PCIe), and my network interface gets labeled enp0s1.
>
> $QEMU -machine virt-2.6,accel=kvm -cpu host \
>   -m 1024 -smp 1 -nographic \
>   -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>   -device ioh3420,bus=pcie.0,id=pcie.1,port=1,chassis=1 \
>   -device ioh3420,bus=pcie.0,id=pcie.2,port=2,chassis=2 \
>   -device virtio-scsi-pci,disable-modern=off,disable-legacy=on,bus=pcie.1,addr=00.0,id=scsi0 \
>   -drive file=/home/drjones/.local/libvirt/images/fedora.qcow2,format=qcow2,if=none,id=drive-scsi0-0-0-0 \
>   -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1 \
>   -netdev user,id=hostnet0 \
>   -device virtio-net-pci,disable-modern=off,disable-legacy=on,bus=pcie.2,addr=00.0,netdev=hostnet0,id=net0
>
> I prefer always using virtio-scsi for the disk, but a similar command
> line can be used for a virtio-blk-pci disk.
>
> Thanks,
> drew


