Received: by 10.25.21.156 with SMTP id 28csp285772lfv;
        Thu, 18 Aug 2016 05:13:38 -0700 (PDT)
X-Received: by 10.55.163.4 with SMTP id m4mr1927906qke.110.1471522418298;
        Thu, 18 Aug 2016 05:13:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c50si1051518qtc.1.2016.08.18.05.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 05:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baMCX-0001WH-Hy
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 08:13:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1baM9P-0006ob-Fr
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1baM9H-0005FJ-W0
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:10:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1baM9H-0005F8-N1; Thu, 18 Aug 2016 08:10:15 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D65D4DB09;
	Thu, 18 Aug 2016 12:10:14 +0000 (UTC)
Received: from [10.35.203.40] (vpn-203-40.tlv.redhat.com [10.35.203.40])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7ICA84X009572; Thu, 18 Aug 2016 08:10:09 -0400
To: Laine Stump <laine@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <3a31e28f-15d6-d061-abc8-264a51375f96@redhat.com>
Date: Thu, 18 Aug 2016 15:10:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Aug 2016 12:10:15 +0000 (UTC)
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
	Thomas Hanson <thomas.hanson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CfMp7Sh6TIWC

On 08/17/2016 08:00 PM, Laine Stump wrote:
> On 08/17/2016 12:13 PM, Andrew Jones wrote:
>> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
>>> Hi all,
[...]

Hi,

>>
>> 1) If we want to support both PCIe devices and PCI, then things are messy.
>>     Currently we propose dropping PCI support. mach-virt pretty much
>>     exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)
>
> I have a libvirt patch just about ACKed for pushing upstream that will automatically assign virtio-pci devices to a PCIe slot (if the qemu binary supports virtio-1.0):
>
> https://www.redhat.com/archives/libvir-list/2016-August/msg00852.html
>
> Separate patches do the same for the e1000e emulated network device (which you probably don't care about) and the nec-usb-xhci (USB3) controller (more useful):
>
> https://www.redhat.com/archives/libvir-list/2016-August/msg00732.html
>
> Once these are in place, the only type of device of any consequence that I can see still having no PCIe alternative is audio (even though only the virgl video device is PCIe, libvirt has always
> assigned the primary video to slot 1 on pcie-root anyway (although you shouldn't put a legacy PCI device on a pcie-root-port or pcie-switch-downstream-port, it is acceptable to plug it directly into
> pcie-root (as long as you know you won't need to hotplug it).
>

I agree, please don't allow plugging PCI devices into PCIe ports (root ports/downstream ports). Use pcie.0 bus as you mentioned or start a pci "hierarchy" with a dmi-pci and pci-pci bridge.

>> 2) root complex ports, switches (upstream/downstream ports) are currently
>>     based on Intel parts. Marcel is thinking about creating generic models.
>
> I say this every time it comes up, so just to be consistent: +1 :-)
>

I plan do that for my "own selfish" reasons, one of them is to be able to specify
the IO/MEM range the guest firmware should assign to a PCIe port. But, of course,
I'll keep them neutral enough; I might need help with testing the mach-virt machines.

>> 3) libvirt needs to learn how to plug everything together, in proper PCIe
>>     fashion, leaving holes for hotplug.
>
> See above about virtio, although that doesn't cover the whole story. The other part (which I'm working on right now) is that libvirt needs to automatically add pcie-root-port,
> pcie-switch-upstream-port, and pcie-switch-downstream-port devices as necessary. With the patches I mentioned above, you still have to manually add enough pcie-*-port controllers to the config, and
> then libvirt will plug the PCIe devices into the right place. This is simple enough to do, but it does require intervention.
>
> As far as leaving holes for hotplug, there's actually still a bit of an open question there - with machinetypes that use only legacy-PCI, *all* slots are hotpluggable, and they're added 31 at a time,
> so there was never any question about which slots were hotpluggable, and it would be very rare to end up with a configuration that had 0 free slots available for hotplug (actually libvirt would always
> make sure there was at least one, but in practice there would be many more open slots). With PCIe-capable machinetypes that is changed, since the root complex (pcie-root) doesn't support hotplug, and
> new slots are added 1 at a time (pcie-*-port) rather than 31 at a time. This means you have to really go out of your way if you want open slots for hotplug (and even if you want devices in the machine
> at boot time to be hot-unpluggable).
>

I agree you need to take into account hotplug for Q35, by leaving some PCIe root ports available, but it shouldn't be too much trouble.

> I'm still not sure just how far we need to go in this regard.  We've already decided that, unless manually set to an address on pcie-root by the user/management application, all PCI devices will be
> auto-assigned to a slot that supports hotplug.

Good idea.

  What I'm not sure about is whether we should always auto-add an extra pcie-*-root to be sure a device can be hotplugged, or if we should admit that 1
> available slot isn't good enough for all situations, so we should instead just leave it up to the user/management to manually add extra ports if they think they'll want to hotplug something later.

Why not? Leaving 1 or 2 PCIe ports should be enough. On each port you can hotplug a switch with several downstream ports. You can continue nesting the switches up to depth of 6-7 I think.

Thanks,
Marcel

>
[...]
>>
>> Thanks,
>> drew
>
>

