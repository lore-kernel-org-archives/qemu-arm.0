Received: by 10.25.21.156 with SMTP id 28csp506845lfv;
        Thu, 18 Aug 2016 14:11:41 -0700 (PDT)
X-Received: by 10.200.35.215 with SMTP id r23mr5045239qtr.140.1471554701486;
        Thu, 18 Aug 2016 14:11:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si2508449qkc.251.2016.08.18.14.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 14:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baUbE-0003d2-UN
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 17:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1baUbA-0003ch-9f
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 17:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1baUb5-0003Oe-Su
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 17:11:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>)
	id 1baUb5-0003OY-Jx; Thu, 18 Aug 2016 17:11:31 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09EFD91FE5;
	Thu, 18 Aug 2016 21:11:30 +0000 (UTC)
Received: from vlap.laine.org (ovpn-116-25.phx2.redhat.com [10.3.116.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7ILBSIl019799
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Aug 2016 17:11:28 -0400
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
	<20160818074103.pvean3dgnzyzcdgm@hawk.localdomain>
From: Laine Stump <laine@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Message-ID: <4c21325e-bf1f-3011-b6a4-265cf0fb664c@redhat.com>
Date: Thu, 18 Aug 2016 17:11:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160818074103.pvean3dgnzyzcdgm@hawk.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Aug 2016 21:11:30 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Kevin Zhao <kevin.zhao@linaro.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	Marcel Apfelbaum <mapfelba@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hBMxPeCNUzNp

On 08/18/2016 03:41 AM, Andrew Jones wrote:
> On Wed, Aug 17, 2016 at 01:00:05PM -0400, Laine Stump wrote:
>> On 08/17/2016 12:13 PM, Andrew Jones wrote:
>>> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
>>>> Hi all,
>>>>       Now I'm investigating net device hot plug and disk hotplug for
>>>> AArch64. For virtio , the default address is virtio-mmio. After Libvirt
>>>> 1.3.5, user can explicitly specify the address-type to pci and so libvirt
>>>> will pass the virtio-pci parameters to the Qemu.
>>>>       Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
>>>> Libvirt version is 1.3.5.
>>>>       For net-device, I change the address-type to pci, and libvirt pass the
>>>> command below:
>>>>       -device
>>>> virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:25:25,bus=pci.2,addr=0x1
>>>>
>>>>       After booting, the eth0 device disappear(eth0 occur when the address
>>>> is virtio-mmio),
>>>> but I can find another net-device enp2s1, also it can't work for dhcp:
>>>> Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network
>>>> device
>>>> I'm not sure whether it worked.
>>>>
>>>>       For disk device,* when I change the address-type to pci, the whole
>>>> qemu command is :*
>>>> https://paste.fedoraproject.org/409553/,  but the VM can not boot
>>>> successfully. Does Qemu not support device disk of virtio-pci in AArch64
>>>> just as it in X86_64?
>>>>       Thanks~Since I am not very familiar with Qemu, really looking forward
>>>> to your response.
>>>>
>>>> Best Regards,
>>>> Kevin Zhao
>>> libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add
>>> the i82801b11 bridge, which was necessary to use PCI devices with the PCIe
>>> host bridge mach-virt has. IMO, libvirt and qemu still have a long way to
>>> go in order to configure a base/standard mach-virt PCIe machine.
>>
>> Well, you can do it now, but you have to manually assign the PCI addresses
>> of devices (and if you want hotplug you need to live with Intel/TI-specific
>> PCIe controllers).
>>
>>
>>>
>>> 1) If we want to support both PCIe devices and PCI, then things are messy.
>>>     Currently we propose dropping PCI support. mach-virt pretty much
>>>     exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)
>>
>> I have a libvirt patch just about ACKed for pushing upstream that will
>> automatically assign virtio-pci devices to a PCIe slot (if the qemu binary
>> supports virtio-1.0):
>>
>> https://www.redhat.com/archives/libvir-list/2016-August/msg00852.html
>>
>> Separate patches do the same for the e1000e emulated network device (which
>> you probably don't care about) and the nec-usb-xhci (USB3) controller (more
>> useful):
>>
>> https://www.redhat.com/archives/libvir-list/2016-August/msg00732.html
>>
>
> Thanks for the update Laine. This sounds great to me. With those patches
> we can switch from virtio-mmio to virtio-pci easily, even if we're still
> missing hotplug a bit longer. What limit do we have for the number of
> devices, when we don't have any switches? I think I experimented once and
> found it to be 7.

Theoretically you should be able to put something in each slot of 
pcie-root, and there are 31 slots (but slot 0x1f is always used by 
integrated devices, slot 1 is usually used by video, and slot 0x1D is 
usually used by a USB controller). Anyway, you should be able to get a 
lot more than 7 devices (one potential problem is that if you add a PCI 
controller that has a device plugged into it which requests IO port 
space, that will get chewed up very quickly. That's not an issue if you 
are connecting endpoints directly to pcie-root though.


>
>> Once these are in place, the only type of device of any consequence that I
>> can see still having no PCIe alternative is audio (even though only the
>> virgl video device is PCIe, libvirt has always assigned the primary video to
>> slot 1 on pcie-root anyway (although you shouldn't put a legacy PCI device
>> on a pcie-root-port or pcie-switch-downstream-port, it is acceptable to plug
>> it directly into pcie-root (as long as you know you won't need to hotplug
>> it).
>>
>>> 2) root complex ports, switches (upstream/downstream ports) are currently
>>>     based on Intel parts. Marcel is thinking about creating generic models.
>>
>> I say this every time it comes up, so just to be consistent: +1 :-)
>>
>>> 3) libvirt needs to learn how to plug everything together, in proper PCIe
>>>     fashion, leaving holes for hotplug.
>>
>> See above about virtio, although that doesn't cover the whole story. The
>> other part (which I'm working on right now) is that libvirt needs to
>> automatically add pcie-root-port, pcie-switch-upstream-port, and
>> pcie-switch-downstream-port devices as necessary. With the patches I
>> mentioned above, you still have to manually add enough pcie-*-port
>> controllers to the config, and then libvirt will plug the PCIe devices into
>> the right place. This is simple enough to do, but it does require
>> intervention.
>
> OK, so we want this to support hotplug and eventually chain switches,
> bumping our device limit up higher and higher. To what? I'm not sure,
> I guess we're still limited by address space.

As long as the endpoint devices don't require IO port space, the 
BIOS/firmware shouldn't try to reserve it, and the limit will be "more 
than you would ever need".

>
>>
>> As far as leaving holes for hotplug, there's actually still a bit of an open
>> question there - with machinetypes that use only legacy-PCI, *all* slots are
>> hotpluggable, and they're added 31 at a time, so there was never any
>> question about which slots were hotpluggable, and it would be very rare to
>> end up with a configuration that had 0 free slots available for hotplug
>> (actually libvirt would always make sure there was at least one, but in
>> practice there would be many more open slots). With PCIe-capable
>> machinetypes that is changed, since the root complex (pcie-root) doesn't
>> support hotplug, and new slots are added 1 at a time (pcie-*-port) rather
>> than 31 at a time. This means you have to really go out of your way if you
>> want open slots for hotplug (and even if you want devices in the machine at
>> boot time to be hot-unpluggable).
>>
>> I'm still not sure just how far we need to go in this regard.  We've already
>> decided that, unless manually set to an address on pcie-root by the
>> user/management application, all PCI devices will be auto-assigned to a slot
>> that supports hotplug. What I'm not sure about is whether we should always
>> auto-add an extra pcie-*-root to be sure a device can be hotplugged, or if
>> we should admit that 1 available slot isn't good enough for all situations,
>> so we should instead just leave it up to the user/management to manually add
>> extra ports if they think they'll want to hotplug something later.
>
> Hmm... Maybe the tools can make this easier by offering an option to
> provide N extra ports.

I've thought about this, and there have even been emails about it, but I 
don't know if it could ever be accepted into libvirt. My idea was to 
have an attribute that says "always maintain X hotpluggable slots when 
coldplugging new devices". I have a feeling that will get as warm of a 
reception as my proposed "hotpluggable='no'" attribute for devices (i.e. 
not warm at all :-))

The problem is that if you just tell the user to put in extra 
pcie-*-port controllers to allow for hotplug, those will eventually be 
eaten up, and then the next time you start the guest you'll again have 
no open hotpluggable slots again (even though restarting would have 
given you the opportunity to automatically add new *-port controllers).


>
> Hmm2... I think I agree that we don't need to worry too much about
> providing free ports for hotplug (maybe just one for fun). With
> virtio-scsi we can plug disks already.


until you run out of open units/buses/whatever they're called in 
virtio-scsi (I'm too lazy to look it up right now). And then you have 
the same problem.

We really can never solve the problem, we can only *delay* it, and the 
more we try to delay it the more convoluted the code gets. And of course 
the same number that is "not enough" for some users is "too much" for 
others. That's why I've been wondering if maybe we should just throw up 
our hands and punt (i.e. unabashedly document "if you want slots 
available for hotplug, you'll need to add them. Of course *even that* 
doesn't work unless you add the hotpluggable slots in a separate change 
from any endpoint devices; otherwise the new endpoint devices would just 
be immediately assigned to the new slots you added "for future hotplug" 
:-/).


> If we want to provide multiple
> virtio-net devices for the price of one port, we can enable mutlifunction.


Except that you can't hotplug/unplug the functions independent of each 
other - all the functions in one slot must be plugged/unplugged together.

> And, iirc, there's work to get ARI functioning, allowing mutlifunction to
> go nuts (assuming I understand its purpose correctly)

I keep forgetting all the acronyms. Is ARI the one that allows you (on 
controllers that only have a single slot, e.g. pcie-root-port) to 
interpret the byte that's normally a 5 bit slot# + 3 bit function# as a 
single 8 bit function#? (The idea being that you still have only a 
single slot, but that slot has 256 functions). There again, you still 
have the "hotplug as a single unit" problem, only the effects are 
multiplied because there are so many devices.


>
> So maybe the default config just needs 3 ports?
>  1 virtio-scsi with as many disks as requested
>  1 virtio-net with as many functions as nics are requested
>  1 extra port

None of those are in any default config created by libvirt. In a libvirt 
config with no specified devices (and no specified "anti-devices" such 
as "<controller type='usb' model='none'/>"), there is just the 
integrated ACHI (sata) controller, a USB controller (usually), and a 
<balloon> device (not sure why that's considered so important that it's 
in there by default, but it is).

