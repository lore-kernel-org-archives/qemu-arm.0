Received: by 10.25.21.156 with SMTP id 28csp298240lfv;
        Thu, 18 Aug 2016 05:44:05 -0700 (PDT)
X-Received: by 10.237.43.162 with SMTP id e31mr2137099qtd.110.1471524245588;
        Thu, 18 Aug 2016 05:44:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si1123317qkf.61.2016.08.18.05.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 05:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baMg0-0002Ay-Vr
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 08:44:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1baMft-00025M-Rs
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1baMfm-0004rU-Ka
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:43:57 -0400
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:34037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1baMfm-0004r7-46
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 08:43:50 -0400
Received: by mail-ua0-x229.google.com with SMTP id k90so25810993uak.1
	for <qemu-arm@nongnu.org>; Thu, 18 Aug 2016 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OI9XI2VI0NT5m2O8MIZL5CE9ZqSs3p4tuXelEXZLmqI=;
	b=KyV5eez7KsMarMwSaTA9NW6U/cWv7z7n85itRMajoEBHObMzqphrV02KEDLXkWfgjK
	BsVAxt6bEZlejH0GZYqwxKkHyLfXgfBLhhuuBlLHne1aVE50qMm2Wwzq5dhNq0TEF0kS
	N7D4ZcyqSY++2QbxBFaeGB/lexn7jeoCHMB1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OI9XI2VI0NT5m2O8MIZL5CE9ZqSs3p4tuXelEXZLmqI=;
	b=YeKQqhKwd1j/Dl8T57KewN+gO3DywBZoW6OC7DWkvsRYps27LypSnb+d6QO5jDhYJ5
	R4urqo9G7XFzRgUB4A7APGyxmcN9NZk1X1fsemnT59yk9XOvUALCQSrmr6n+PCIu7iER
	JYPwlQ5cGl7gN8GLBUHd/0M5c3brS6ZR6kCdJlCUf1fhO1GzcWbVvAi3J8Z19ZS1laxY
	X75h02hBaOIpUzK5Zt+jMv/2qBH9u5DUKfjLIWvtxDo1Hv8z6iqMd10kxwuvFaRcJ3Uk
	o7mxJuDRii8o34zPu5V0wBRNnTHXx1EK875ShxUORs+P29EEV82M1lMq4vAYIAepACea
	jFEQ==
X-Gm-Message-State: AEkoouvFOIfyyYDzoyloFhYA5Ac5pe5BesiAr4pMtJbECEZqRg5Sw9wPEH9Q5SRVZg0QUnIVgFo9gjMgGoiv8nPz
X-Received: by 10.31.69.8 with SMTP id s8mr720920vka.146.1471524229454; Thu,
	18 Aug 2016 05:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.195 with HTTP; Thu, 18 Aug 2016 05:43:48 -0700 (PDT)
In-Reply-To: <45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Thu, 18 Aug 2016 20:43:48 +0800
Message-ID: <CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
To: Laine Stump <laine@redhat.com>
Content-Type: multipart/alternative; boundary=001a114daf8af9b4cb053a57eeb8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
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
	Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 91zg7HewQYjV

--001a114daf8af9b4cb053a57eeb8
Content-Type: text/plain; charset=UTF-8

Hi Laine,
    Thanks :-) I also has a little questions below.

On 18 August 2016 at 01:00, Laine Stump <laine@redhat.com> wrote:

> On 08/17/2016 12:13 PM, Andrew Jones wrote:
>
>> On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:
>>
>>> Hi all,
>>>       Now I'm investigating net device hot plug and disk hotplug for
>>> AArch64. For virtio , the default address is virtio-mmio. After Libvirt
>>> 1.3.5, user can explicitly specify the address-type to pci and so libvirt
>>> will pass the virtio-pci parameters to the Qemu.
>>>       Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
>>> Libvirt version is 1.3.5.
>>>       For net-device, I change the address-type to pci, and libvirt pass
>>> the
>>> command below:
>>>       -device
>>> virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:25:
>>> 25,bus=pci.2,addr=0x1
>>>
>>>       After booting, the eth0 device disappear(eth0 occur when the
>>> address
>>> is virtio-mmio),
>>> but I can find another net-device enp2s1, also it can't work for dhcp:
>>> Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network
>>> device
>>> I'm not sure whether it worked.
>>>
>>>       For disk device,* when I change the address-type to pci, the whole
>>> qemu command is :*
>>> https://paste.fedoraproject.org/409553/,  but the VM can not boot
>>> successfully. Does Qemu not support device disk of virtio-pci in AArch64
>>> just as it in X86_64?
>>>       Thanks~Since I am not very familiar with Qemu, really looking
>>> forward
>>> to your response.
>>>
>>> Best Regards,
>>> Kevin Zhao
>>>
>> libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add
>> the i82801b11 bridge, which was necessary to use PCI devices with the PCIe
>> host bridge mach-virt has. IMO, libvirt and qemu still have a long way to
>> go in order to configure a base/standard mach-virt PCIe machine.
>>
>
> Well, you can do it now, but you have to manually assign the PCI addresses
> of devices (and if you want hotplug you need to live with Intel/TI-specific
> PCIe controllers).

OK. It seems that Qemu will drop PCI for machine-virt and turning to PCIE
in the future.
Do I need to do more for  Intel/TI-specific PCIe controllers?  what do I
need to add in the guest XML or more?

>
>
>> 1) If we want to support both PCIe devices and PCI, then things are messy.
>>     Currently we propose dropping PCI support. mach-virt pretty much
>>     exclusively uses virtio, which can be set to PCIe mode (virtio-1.0)
>>
>
> I have a libvirt patch just about ACKed for pushing upstream that will
> automatically assign virtio-pci devices to a PCIe slot (if the qemu binary
> supports virtio-1.0):
>
> https://www.redhat.com/archives/libvir-list/2016-August/msg00852.html
>

What's the minimum version of  Qemu that support virito-1.0? Does Qemu 2.6
works?
Also as  I see your patch for automatically assign virtio-pci to PCIE
slot,after it merged  I think thing will go much more easier.
Now I will manually add the slots and bus to pcie. Because I am not
familiar with it,  if it convenient, could you give me an available xml
file which PCIE disk and PCIE
net device can work for machine virt ?

Thanks~

Separate patches do the same for the e1000e emulated network device (which
> you probably don't care about) and the nec-usb-xhci (USB3) controller (more
> useful):
>
> https://www.redhat.com/archives/libvir-list/2016-August/msg00732.html
>
> Once these are in place, the only type of device of any consequence that I
> can see still having no PCIe alternative is audio (even though only the
> virgl video device is PCIe, libvirt has always assigned the primary video
> to slot 1 on pcie-root anyway (although you shouldn't put a legacy PCI
> device on a pcie-root-port or pcie-switch-downstream-port, it is acceptable
> to plug it directly into pcie-root (as long as you know you won't need to
> hotplug it).
>
> 2) root complex ports, switches (upstream/downstream ports) are currently
>>     based on Intel parts. Marcel is thinking about creating generic
>> models.
>>
>
> I say this every time it comes up, so just to be consistent: +1 :-)
>
> 3) libvirt needs to learn how to plug everything together, in proper PCIe
>>     fashion, leaving holes for hotplug.
>>
>
> See above about virtio, although that doesn't cover the whole story. The
> other part (which I'm working on right now) is that libvirt needs to
> automatically add pcie-root-port, pcie-switch-upstream-port, and
> pcie-switch-downstream-port devices as necessary. With the patches I
> mentioned above, you still have to manually add enough pcie-*-port
> controllers to the config, and then libvirt will plug the PCIe devices into
> the right place. This is simple enough to do, but it does require
> intervention.
>
> As far as leaving holes for hotplug, there's actually still a bit of an
> open question there - with machinetypes that use only legacy-PCI, *all*
> slots are hotpluggable, and they're added 31 at a time, so there was never
> any question about which slots were hotpluggable, and it would be very rare
> to end up with a configuration that had 0 free slots available for hotplug
> (actually libvirt would always make sure there was at least one, but in
> practice there would be many more open slots). With PCIe-capable
> machinetypes that is changed, since the root complex (pcie-root) doesn't
> support hotplug, and new slots are added 1 at a time (pcie-*-port) rather
> than 31 at a time. This means you have to really go out of your way if you
> want open slots for hotplug (and even if you want devices in the machine at
> boot time to be hot-unpluggable).
>
> I'm still not sure just how far we need to go in this regard.  We've
> already decided that, unless manually set to an address on pcie-root by the
> user/management application, all PCI devices will be auto-assigned to a
> slot that supports hotplug. What I'm not sure about is whether we should
> always auto-add an extra pcie-*-root to be sure a device can be hotplugged,
> or if we should admit that 1 available slot isn't good enough for all
> situations, so we should instead just leave it up to the user/management to
> manually add extra ports if they think they'll want to hotplug something
> later.
>
>
> 4) Probably more... I forget all the different issues we discovered when
>>     we started playing with this a few months ago.
>>
>> The good news is that x86 folk want all the same things for the q35 model.
>> mach-virt enthusiasts like us get to ride along pretty much for free.
>>
>> So, using virtio-pci with mach-virt and libvirt isn't possible right now,
>> not without manual changes to the XML. It might be nice to document how to
>> manually convert a guest, so developers who want to use virtio-pci don't
>> have to abandon libvirt. I'd have to look into that, or ask one of our
>> libvirt friends to help. Certainly the instructions would be for latest
>> libvirt though.
>>
>> Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
>> following qemu command line works for me.
>> (notice the use of PCIe), and my network interface gets labeled enp0s1.
>>
>> $QEMU -machine virt-2.6,accel=kvm -cpu host \
>>   -m 1024 -smp 1 -nographic \
>>   -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>>   -device ioh3420,bus=pcie.0,id=pcie.1,port=1,chassis=1 \
>>   -device ioh3420,bus=pcie.0,id=pcie.2,port=2,chassis=2 \
>>   -device virtio-scsi-pci,disable-modern=off,disable-legacy=on,bus=pcie.1,addr=00.0,id=scsi0
>> \
>>   -drive file=/home/drjones/.local/libvirt/images/fedora.qcow2,format
>> =qcow2,if=none,id=drive-scsi0-0-0-0 \
>>   -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-sc
>> si0-0-0-0,id=scsi0-0-0-0,bootindex=1 \
>>   -netdev user,id=hostnet0 \
>>   -device virtio-net-pci,disable-modern=off,disable-legacy=on,bus=pcie
>> .2,addr=00.0,netdev=hostnet0,id=net0
>>
>> I prefer always using virtio-scsi for the disk, but a similar command
>> line can be used for a virtio-blk-pci disk.
>>
>> Thanks,
>> drew
>>
>
>
>

--001a114daf8af9b4cb053a57eeb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Laine,<div>=C2=A0 =C2=A0 Thanks :-) I also has a little=
 questions below.<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 18 August 2016 at 01:00, Laine Stump <span dir=3D"ltr">&lt;<a href=
=3D"mailto:laine@redhat.com" target=3D"_blank">laine@redhat.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D""><div class=3D"h5">On 08/17/2016 12:13 PM, Andrew Jones wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
On Wed, Aug 17, 2016 at 08:08:11PM +0800, Kevin Zhao wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Hi all,<br>
=C2=A0 =C2=A0 =C2=A0 Now I&#39;m investigating net device hot plug and disk=
 hotplug for<br>
AArch64. For virtio , the default address is virtio-mmio. After Libvirt<br>
1.3.5, user can explicitly specify the address-type to pci and so libvirt<b=
r>
will pass the virtio-pci parameters to the Qemu.<br>
=C2=A0 =C2=A0 =C2=A0 Both my host and guest OS is Debian8, and Qemu version=
 is 2.6.0.<br>
Libvirt version is 1.3.5.<br>
=C2=A0 =C2=A0 =C2=A0 For net-device, I change the address-type to pci, and =
libvirt pass the<br>
command below:<br>
=C2=A0 =C2=A0 =C2=A0 -device<br>
virtio-net-pci,netdev=3Dhostnet0<wbr>,id=3Dnet0,mac=3D52:54:00:0d:25:<wbr>2=
5,bus=3Dpci.2,addr=3D0x1<br>
<br>
=C2=A0 =C2=A0 =C2=A0 After booting, the eth0 device disappear(eth0 occur wh=
en the address<br>
is virtio-mmio),<br>
but I can find another net-device enp2s1, also it can&#39;t work for dhcp:<=
br>
Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network<br>
device<br>
I&#39;m not sure whether it worked.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 For disk device,* when I change the address-type to pc=
i, the whole<br>
qemu command is :*<br>
<a href=3D"https://paste.fedoraproject.org/409553/" rel=3D"noreferrer" targ=
et=3D"_blank">https://paste.fedoraproject.or<wbr>g/409553/</a>,=C2=A0 but t=
he VM can not boot<br>
successfully. Does Qemu not support device disk of virtio-pci in AArch64<br=
>
just as it in X86_64?<br>
=C2=A0 =C2=A0 =C2=A0 Thanks~Since I am not very familiar with Qemu, really =
looking forward<br>
to your response.<br>
<br>
Best Regards,<br>
Kevin Zhao<br>
</blockquote>
libvirt 1.3.5 is a bit old. Later versions no longer unconditionally add<br=
>
the i82801b11 bridge, which was necessary to use PCI devices with the PCIe<=
br>
host bridge mach-virt has. IMO, libvirt and qemu still have a long way to<b=
r>
go in order to configure a base/standard mach-virt PCIe machine.<br>
</blockquote>
<br></div></div>
Well, you can do it now, but you have to manually assign the PCI addresses =
of devices (and if you want hotplug you need to live with Intel/TI-specific=
 PCIe controllers).=C2=A0</blockquote><div>OK. It seems that Qemu will drop=
 PCI for machine-virt and turning to PCIE in the future.</div><div>Do I nee=
d to do more for =C2=A0Intel/TI-specific PCIe controllers? =C2=A0what do I =
need to add in the guest XML or more?</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span class=3D"">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
1) If we want to support both PCIe devices and PCI, then things are messy.<=
br>
=C2=A0 =C2=A0 Currently we propose dropping PCI support. mach-virt pretty m=
uch<br>
=C2=A0 =C2=A0 exclusively uses virtio, which can be set to PCIe mode (virti=
o-1.0)<br>
</blockquote>
<br></span>
I have a libvirt patch just about ACKed for pushing upstream that will auto=
matically assign virtio-pci devices to a PCIe slot (if the qemu binary supp=
orts virtio-1.0):<br>
<br>
<a href=3D"https://www.redhat.com/archives/libvir-list/2016-August/msg00852=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archive<=
wbr>s/libvir-list/2016-August/<wbr>msg00852.html</a><br>
=C2=A0</blockquote><div>What&#39;s the minimum version of =C2=A0Qemu that s=
upport virito-1.0? Does Qemu 2.6 works?=C2=A0</div><div>Also as =C2=A0I see=
 your patch for automatically assign virtio-pci to PCIE slot,after it merge=
d =C2=A0I think thing will go much more easier.</div><div>Now I will manual=
ly add the slots and bus to pcie. Because I am not familiar with it, =C2=A0=
if it convenient, could you give me an available xml file which PCIE disk a=
nd PCIE</div><div>net device can work for machine virt ?</div><div><br></di=
v><div>Thanks~</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Separate patches do the same for the e1000e emulated network device (which =
you probably don&#39;t care about) and the nec-usb-xhci (USB3) controller (=
more useful):<br>
<br>
<a href=3D"https://www.redhat.com/archives/libvir-list/2016-August/msg00732=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archive<=
wbr>s/libvir-list/2016-August/<wbr>msg00732.html</a><br>
<br>
Once these are in place, the only type of device of any consequence that I =
can see still having no PCIe alternative is audio (even though only the vir=
gl video device is PCIe, libvirt has always assigned the primary video to s=
lot 1 on pcie-root anyway (although you shouldn&#39;t put a legacy PCI devi=
ce on a pcie-root-port or pcie-switch-downstream-port, it is acceptable to =
plug it directly into pcie-root (as long as you know you won&#39;t need to =
hotplug it).<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
2) root complex ports, switches (upstream/downstream ports) are currently<b=
r>
=C2=A0 =C2=A0 based on Intel parts. Marcel is thinking about creating gener=
ic models.<br>
</blockquote>
<br></span>
I say this every time it comes up, so just to be consistent: +1 :-)<span cl=
ass=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
3) libvirt needs to learn how to plug everything together, in proper PCIe<b=
r>
=C2=A0 =C2=A0 fashion, leaving holes for hotplug.<br>
</blockquote>
<br></span>
See above about virtio, although that doesn&#39;t cover the whole story. Th=
e other part (which I&#39;m working on right now) is that libvirt needs to =
automatically add pcie-root-port, pcie-switch-upstream-port, and pcie-switc=
h-downstream-port devices as necessary. With the patches I mentioned above,=
 you still have to manually add enough pcie-*-port controllers to the confi=
g, and then libvirt will plug the PCIe devices into the right place. This i=
s simple enough to do, but it does require intervention.<br>
<br>
As far as leaving holes for hotplug, there&#39;s actually still a bit of an=
 open question there - with machinetypes that use only legacy-PCI, *all* sl=
ots are hotpluggable, and they&#39;re added 31 at a time, so there was neve=
r any question about which slots were hotpluggable, and it would be very ra=
re to end up with a configuration that had 0 free slots available for hotpl=
ug (actually libvirt would always make sure there was at least one, but in =
practice there would be many more open slots). With PCIe-capable machinetyp=
es that is changed, since the root complex (pcie-root) doesn&#39;t support =
hotplug, and new slots are added 1 at a time (pcie-*-port) rather than 31 a=
t a time. This means you have to really go out of your way if you want open=
 slots for hotplug (and even if you want devices in the machine at boot tim=
e to be hot-unpluggable).<br>
<br>
I&#39;m still not sure just how far we need to go in this regard.=C2=A0 We&=
#39;ve already decided that, unless manually set to an address on pcie-root=
 by the user/management application, all PCI devices will be auto-assigned =
to a slot that supports hotplug. What I&#39;m not sure about is whether we =
should always auto-add an extra pcie-*-root to be sure a device can be hotp=
lugged, or if we should admit that 1 available slot isn&#39;t good enough f=
or all situations, so we should instead just leave it up to the user/manage=
ment to manually add extra ports if they think they&#39;ll want to hotplug =
something later.<div class=3D""><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
4) Probably more... I forget all the different issues we discovered when<br=
>
=C2=A0 =C2=A0 we started playing with this a few months ago.<br>
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
<br>
Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The<br>
following qemu command line works for me.<br>
(notice the use of PCIe), and my network interface gets labeled enp0s1.<br>
<br>
$QEMU -machine virt-2.6,accel=3Dkvm -cpu host \<br>
=C2=A0 -m 1024 -smp 1 -nographic \<br>
=C2=A0 -bios /usr/share/AAVMF/AAVMF_CODE.fd \<br>
=C2=A0 -device ioh3420,bus=3Dpcie.0,id=3Dpcie.1,p<wbr>ort=3D1,chassis=3D1 \=
<br>
=C2=A0 -device ioh3420,bus=3Dpcie.0,id=3Dpcie.2,p<wbr>ort=3D2,chassis=3D2 \=
<br>
=C2=A0 -device virtio-scsi-pci,disable-modern<wbr>=3Doff,disable-legacy=3Do=
n,bus=3D<wbr>pcie.1,addr=3D00.0,id=3Dscsi0 \<br>
=C2=A0 -drive file=3D/home/drjones/.local/libv<wbr>irt/images/fedora.qcow2,=
format<wbr>=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-<wbr>0-0-0 \<br>
=C2=A0 -device scsi-hd,bus=3Dscsi0.0,channel=3D0,<wbr>scsi-id=3D0,lun=3D0,d=
rive=3Ddrive-sc<wbr>si0-0-0-0,id=3Dscsi0-0-0-0,booti<wbr>ndex=3D1 \<br>
=C2=A0 -netdev user,id=3Dhostnet0 \<br>
=C2=A0 -device virtio-net-pci,disable-modern=3D<wbr>off,disable-legacy=3Don=
,bus=3Dpcie<wbr>.2,addr=3D00.0,netdev=3Dhostnet0,<wbr>id=3Dnet0<br>
<br>
I prefer always using virtio-scsi for the disk, but a similar command<br>
line can be used for a virtio-blk-pci disk.<br>
<br>
Thanks,<br>
drew<br>
</blockquote>
<br>
<br>
</div></div></blockquote></div><br></div></div></div>

--001a114daf8af9b4cb053a57eeb8--
