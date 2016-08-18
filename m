Received: by 10.25.21.156 with SMTP id 28csp511909lfv;
        Thu, 18 Aug 2016 14:26:51 -0700 (PDT)
X-Received: by 10.55.17.211 with SMTP id 80mr4766195qkr.208.1471555611403;
        Thu, 18 Aug 2016 14:26:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c79si2556110qke.200.2016.08.18.14.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 14:26:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baUpu-00005T-Ob
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 17:26:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1baUpq-00005L-OS
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 17:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1baUpm-00065b-GY
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 17:26:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>)
	id 1baUpm-00065X-8f; Thu, 18 Aug 2016 17:26:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B76A98C23;
	Thu, 18 Aug 2016 21:26:41 +0000 (UTC)
Received: from vlap.laine.org (ovpn-116-25.phx2.redhat.com [10.3.116.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7ILQdtn020121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Aug 2016 17:26:40 -0400
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
	<CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
From: Laine Stump <laine@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <84834596-6223-3dea-da94-74c3796fe470@redhat.com>
Date: Thu, 18 Aug 2016 17:26:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 Aug 2016 21:26:41 +0000 (UTC)
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
	Andrew Jones <drjones@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0JGocS4kR+51

On 08/18/2016 08:43 AM, Kevin Zhao wrote:
> Hi Laine,
>     Thanks :-) I also has a little questions below.
>
> On 18 August 2016 at 01:00, Laine Stump <laine@redhat.com> wrote:
>
>> On 08/17/2016 12:13 PM, Andrew Jones wrote:
>>
>>> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
>>>
>>>> Hi all,
>>>>       Now I'm investigating net device hot plug and disk hotplug for
>>>> AArch64. For virtio , the default address is virtio-mmio. After Libvirt
>>>> 1.3.5, user can explicitly specify the address-type to pci and so libvirt
>>>> will pass the virtio-pci parameters to the Qemu.
>>>>       Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
>>>> Libvirt version is 1.3.5.
>>>>       For net-device, I change the address-type to pci, and libvirt pass
>>>> the
>>>> command below:
>>>>       -device
>>>> virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:25:
>>>> 25,bus=pci.2,addr=0x1
>>>>
>>>>       After booting, the eth0 device disappear(eth0 occur when the
>>>> address
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
>>>>       Thanks~Since I am not very familiar with Qemu, really looking
>>>> forward
>>>> to your response.
>>>>
>>>> Best Regards,
>>>> Kevin Zhao
>>>>
>>> libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add
>>> the i82801b11 bridge, which was necessary to use PCI devices with the PCIe
>>> host bridge mach-virt has. IMO, libvirt and qemu still have a long way to
>>> go in order to configure a base/standard mach-virt PCIe machine.
>>>
>>
>> Well, you can do it now, but you have to manually assign the PCI addresses
>> of devices (and if you want hotplug you need to live with Intel/TI-specific
>> PCIe controllers).
>
> OK. It seems that Qemu will drop PCI for machine-virt and turning to PCIE
> in the future.

This isn't a qemu issue, but a libvirt issue.

> Do I need to do more for  Intel/TI-specific PCIe controllers?


>  what do I
> need to add in the guest XML or more?

As soon as my first set of patches is pushed, what you'll need to do is 
to add:

     <controller type='pci' model='pcie-root-port'/>

for each virtio device.

As soon as I've figured out a useful algorithm for adding the pcie 
controllers automatically, you won't need to do anything at all. (Keep 
in mind that any existing configurations will maintain their original 
config. If you want an existing configuration to be switched to using 
the new recommended (pcie) bus topology you will need to replace every 
instance of:

     <address type='pci' domain='0x0000' ......../>

with a plain:

     <address type='pci'/>

This will force libvirt to reassign PCI addresses for the devices.

>
>>
>>
>>> 1) If we want to support both PCIe devices and PCI, then things are messy.
>>>     Currently we propose dropping PCI support. mach-virt pretty much
>>>     exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)
>>>
>>
>> I have a libvirt patch just about ACKed for pushing upstream that will
>> automatically assign virtio-pci devices to a PCIe slot (if the qemu binary
>> supports virtio-1.0):
>>
>> https://www.redhat.com/archives/libvir-list/2016-August/msg00852.html
>>
>
> What's the minimum version of  Qemu that support virito-1.0? Does Qemu 2.6
> works?

qemu as old as 2.4.0 has the "--disable-legacy" option for virtio 
devices. I don't know if it was actually working properly back that far.


> Also as  I see your patch for automatically assign virtio-pci to PCIE
> slot,after it merged  I think thing will go much more easier.
> Now I will manually add the slots and bus to pcie. Because I am not
> familiar with it,  if it convenient, could you give me an available xml
> file which PCIE disk and PCIE
> net device can work for machine virt ?

I think Andrea sent an example.

