Received: by 10.25.87.130 with SMTP id l124csp668716lfb;
        Thu, 8 Sep 2016 00:18:11 -0700 (PDT)
X-Received: by 10.55.114.193 with SMTP id n184mr57336808qkc.4.1473319091636;
        Thu, 08 Sep 2016 00:18:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r48si27805266qtb.104.2016.09.08.00.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Sep 2016 00:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhtb8-0001Uo-Sq
	for alex.bennee@linaro.org; Thu, 08 Sep 2016 03:18:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bhtAi-00073F-7V
	for qemu-arm@nongnu.org; Thu, 08 Sep 2016 02:50:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bhtAg-0005JU-GA
	for qemu-arm@nongnu.org; Thu, 08 Sep 2016 02:50:52 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bhtAg-0005J1-4H
	for qemu-arm@nongnu.org; Thu, 08 Sep 2016 02:50:50 -0400
Received: by mail-wm0-x22e.google.com with SMTP id b187so150788225wme.1
	for <qemu-arm@nongnu.org>; Wed, 07 Sep 2016 23:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G+vnnJkHScijlQJLTrrMt4ZDcr4VGjBACBXbw1zQd5o=;
	b=VgAvf2c7ZWVlKXP2/vek8XzpV/iZ3r5Wg4GgMw963uV53VFswrw/d2v/QBf7OZmoep
	v1wcvt4MWTOZRc9OHSRdav59bfm/6WsmsHbeC8Yz3lg84poGmt2TgU9kFcc2Y507xXtx
	FejXtm85WaXsPPvaXJp1GHXfg4z0cvvx0KM2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G+vnnJkHScijlQJLTrrMt4ZDcr4VGjBACBXbw1zQd5o=;
	b=lpToNzrg1Y+5Kpj2XPN27lERUocv7K5A8V3e+ONqJAmg+/sKqaoFJLXzRzZeFnkotk
	TjbZbnc0/FG1vXKphD9uJz/3aLwIw3+BbaXyzE8zHakHkkAcZXtUl0M4AfdJq2ndWKg3
	hXqb+NjTaIpE8hqEg8/yZPXWUc7WSsupb37MpVFa9LLOlMRXxOHWY7Av6cV8sV+Y849l
	D8gLhTDctrINxfU+urISzUFOC06KePNh6nAX6aU1Fetee7ysy1YvqW3j6E7MaRwgb4NC
	FvY5qisLIoM4jCo8o5m7stermx6Bf4qmguqPnMhAhlCyXKBGXgcVf76+lip4T1V/QY7X
	Pvcw==
X-Gm-Message-State: AE9vXwNowT/etOLUuASrxEHp/rrj7DThAGNKtnXCM3S4GuQ0xWZvmSmiNTqPUx5hbD8dgs2k1z1CscMeKYMhgSus
X-Received: by 10.28.147.76 with SMTP id v73mr7102686wmd.56.1473317448926;
	Wed, 07 Sep 2016 23:50:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.36.67 with HTTP; Wed, 7 Sep 2016 23:50:48 -0700 (PDT)
In-Reply-To: <CAN76PtTBAPxHkm41fOzDC39SSm92FM4Pam1-NVAwNEGAhXRn0g@mail.gmail.com>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
	<CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
	<1471528312.3820.48.camel@redhat.com>
	<CAN76PtTBAPxHkm41fOzDC39SSm92FM4Pam1-NVAwNEGAhXRn0g@mail.gmail.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Thu, 8 Sep 2016 14:50:48 +0800
Message-ID: <CAN76PtShe4yg8OarkqAxYK9vGHcHFgYgJRWt=woGJ-MEvB-XJg@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: multipart/alternative; boundary=001a1145ba322f6399053bf9738f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
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
	Thomas Hanson <thomas.hanson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Laine Stump <laine@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /8TyxqOfHlhl

--001a1145ba322f6399053bf9738f
Content-Type: text/plain; charset=UTF-8

Hi  All,
   As discussed before, upstream are working about PCIE instead of PCI in
AArch64.
   Thanks for your efforts about this on AArch64 :-)
   If it convenient, could you tell me when we plan  to finish this task ?
and which qemu version will support this functions in the future?
   Big Thanks~

Best Regards,
Kevin

On 24 August 2016 at 09:52, Kevin Zhao <kevin.zhao@linaro.org> wrote:

> Great ~ Thanks for your valuable information~
> I will try with the xml and any update I will post here.
>
> On 18 August 2016 at 21:51, Andrea Bolognani <abologna@redhat.com> wrote:
>
>> On Thu, 2016-08-18 at 20:43 +0800, Kevin Zhao wrote:
>> > What's the minimum version of  Qemu that support virito-1.0?
>> > Does Qemu 2.6 works?
>>
>> 2.6 definitely has virtio 1.0 support, however libvirt does
>> not yet allow you to control whether a device uses 0.9, 1.0
>> or both. The default for 2.6 should be both IIRC.
>>
>> > Now I will manually add the slots and bus to pcie. Because
>> > I am not familiar with it,  if it convenient, could you give
>> > me an available xml file which PCIE disk and PCIE
>> > net device can work for machine virt ?
>>
>> The XML you're looking for is at the end of this message.
>>
>> Note that a Fedora 24 guest configured this way will not
>> boot at all if the machine type is virt-2.6; on the other
>> hand, an identically-configured RHEL 7.3 guest will boot
>> even with virt-2.6, but both the disk and the network
>> adapter will be legacy PCI instead of PCIe.
>>
>>
>> <domain type='kvm'>
>>   <name>abologna-f24</name>
>>   <uuid>f6d0428b-a034-4c4e-8ef2-f12f6aa9cab0</uuid>
>>   <memory unit='KiB'>2097152</memory>
>>   <currentMemory unit='KiB'>2097152</currentMemory>
>>   <vcpu placement='static'>4</vcpu>
>>   <os>
>>     <type arch='aarch64' machine='virt-2.7'>hvm</type>
>>     <loader readonly='yes' type='pflash'>/usr/share/AAVMF
>> /AAVMF_CODE.fd</loader>
>>     <nvram>/var/lib/libvirt/qemu/nvram/abologna-f24_VARS.fd</nvram>
>>     <boot dev='hd'/>
>>   </os>
>>   <features>
>>     <gic version='2'/>
>>   </features>
>>   <cpu mode='host-passthrough'/>
>>   <clock offset='utc'/>
>>   <on_poweroff>destroy</on_poweroff>
>>   <on_reboot>restart</on_reboot>
>>   <on_crash>restart</on_crash>
>>   <devices>
>>     <emulator>/usr/libexec/abologna-qemu-kvm</emulator>
>>     <disk type='file' device='disk'>
>>       <driver name='qemu' type='qcow2'/>
>>       <source file='/var/lib/libvirt/images/abologna-f24.qcow2'/>
>>       <target dev='vda' bus='virtio'/>
>>       <address type='pci' domain='0x0000' bus='0x01' slot='0x00'
>> function='0x0'/>
>>     </disk>
>>     <controller type='pci' index='0' model='pcie-root'/>
>>     <controller type='pci' index='1' model='pcie-root-port'>
>>       <model name='ioh3420'/>
>>       <target chassis='1' port='0x8'/>
>>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
>> function='0x0'/>
>>     </controller>
>>     <controller type='pci' index='2' model='pcie-root-port'>
>>       <model name='ioh3420'/>
>>       <target chassis='2' port='0x10'/>
>>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02'
>> function='0x0'/>
>>     </controller>
>>     <controller type='virtio-serial' index='0'>
>>       <address type='virtio-mmio'/>
>>     </controller>
>>     <interface type='network'>
>>       <mac address='52:54:00:10:07:41'/>
>>       <source network='default'/>
>>       <model type='virtio'/>
>>       <rom bar='off'/>
>>       <address type='pci' domain='0x0000' bus='0x02' slot='0x00'
>> function='0x0'/>
>>     </interface>
>>     <serial type='pty'>
>>       <target port='0'/>
>>     </serial>
>>     <console type='pty'>
>>       <target type='serial' port='0'/>
>>     </console>
>>     <channel type='unix'>
>>       <source mode='bind'/>
>>       <target type='virtio' name='org.qemu.guest_agent.0'/>
>>       <address type='virtio-serial' controller='0' bus='0' port='1'/>
>>     </channel>
>>   </devices>
>> </domain>
>>
>> --
>> Andrea Bolognani / Red Hat / Virtualization
>>
>
>

--001a1145ba322f6399053bf9738f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi =C2=A0All,<div>=C2=A0 =C2=A0As discussed before, upstre=
am are working about PCIE instead of PCI in AArch64.=C2=A0</div><div>=C2=A0=
 =C2=A0Thanks for your efforts about this on AArch64 :-)</div><div>=C2=A0 =
=C2=A0If it convenient, could you tell me when we plan =C2=A0to finish this=
 task ? and which qemu version will support this functions in the future?=
=C2=A0</div><div>=C2=A0 =C2=A0Big Thanks~</div><div><br></div><div>Best Reg=
ards,</div><div>Kevin</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 24 August 2016 at 09:52, Kevin Zhao <span dir=3D"ltr">&=
lt;<a href=3D"mailto:kevin.zhao@linaro.org" target=3D"_blank">kevin.zhao@li=
naro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Great ~ Thanks for your valuable information~<div>I will try with =
the xml and any update I will post here.</div></div><div class=3D"HOEnZb"><=
div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2016 at 21:51, Andrea Bolognani <span dir=3D"ltr">&lt;<a href=
=3D"mailto:abologna@redhat.com" target=3D"_blank">abologna@redhat.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Thu, 2016-08-18=
 at 20:43 +0800, Kevin Zhao wrote:<br>
&gt; What&#39;s the minimum version of=C2=A0=C2=A0Qemu that support virito-=
1.0?<br>
&gt; Does Qemu 2.6 works?=C2=A0<br>
<br>
</span>2.6 definitely has virtio 1.0 support, however libvirt does<br>
not yet allow you to control whether a device uses 0.9, 1.0<br>
or both. The default for 2.6 should be both IIRC.<br>
<span><br>
&gt; Now I will manually add the slots and bus to pcie. Because<br>
&gt; I am not familiar with it,=C2=A0=C2=A0if it convenient, could you give=
<br>
&gt; me an available xml file which PCIE disk and PCIE<br>
&gt; net device can work for machine virt ?<br>
<br>
</span>The XML you&#39;re looking for is at the end of this message.<br>
<br>
Note that a Fedora 24 guest configured this way will not<br>
boot at all if the machine type is virt-2.6; on the other<br>
hand, an identically-configured RHEL 7.3 guest will boot<br>
even with virt-2.6, but both the disk and the network<br>
adapter will be legacy PCI instead of PCIe.<br>
<br>
<br>
&lt;domain type=3D&#39;kvm&#39;&gt;<br>
=C2=A0 &lt;name&gt;abologna-f24&lt;/name&gt;<br>
=C2=A0 &lt;uuid&gt;f6d0428b-a034-4c4e-8ef2-<wbr>f12f6aa9cab0&lt;/uuid&gt;<b=
r>
=C2=A0 &lt;memory unit=3D&#39;KiB&#39;&gt;2097152&lt;/memory&gt;<br>
=C2=A0 &lt;currentMemory unit=3D&#39;KiB&#39;&gt;2097152&lt;/currentMem<wbr=
>ory&gt;<br>
=C2=A0 &lt;vcpu placement=3D&#39;static&#39;&gt;4&lt;/vcpu&gt;<br>
=C2=A0 &lt;os&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;type arch=3D&#39;aarch64&#39; machine=3D&#39;vi=
rt-2.7&#39;&gt;hvm&lt;/type&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;loader readonly=3D&#39;yes&#39; type=3D&#39;pfl=
ash&#39;&gt;/usr/share/AAVMF<wbr>/AAVMF_CODE.fd&lt;/loader&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;nvram&gt;/var/lib/libvirt/qe<wbr>mu/nvram/abolo=
gna-f24_VARS.fd&lt;<wbr>/nvram&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;boot dev=3D&#39;hd&#39;/&gt;<br>
=C2=A0 &lt;/os&gt;<br>
=C2=A0 &lt;features&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;gic version=3D&#39;2&#39;/&gt;<br>
=C2=A0 &lt;/features&gt;<br>
=C2=A0 &lt;cpu mode=3D&#39;host-passthrough&#39;/&gt;<br>
=C2=A0 &lt;clock offset=3D&#39;utc&#39;/&gt;<br>
=C2=A0 &lt;on_poweroff&gt;destroy&lt;/on_power<wbr>off&gt;<br>
=C2=A0 &lt;on_reboot&gt;restart&lt;/on_reboot&gt;<br>
=C2=A0 &lt;on_crash&gt;restart&lt;/on_crash&gt;<br>
=C2=A0 &lt;devices&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;emulator&gt;/usr/libexec/abo<wbr>logna-qemu-kvm=
&lt;/emulator&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;disk type=3D&#39;file&#39; device=3D&#39;disk&#=
39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;driver name=3D&#39;qemu&#39; type=
=3D&#39;qcow2&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;source file=3D&#39;/var/lib/libvirt=
/images/<wbr>abologna-f24.qcow2&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;target dev=3D&#39;vda&#39; bus=3D&#=
39;virtio&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;address type=3D&#39;pci&#39; domain=
=3D&#39;0x0000&#39; bus=3D&#39;0x01&#39; slot=3D&#39;0x00&#39; function=3D&=
#39;0x0&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/disk&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;controller type=3D&#39;pci&#39; index=3D&#39;0&=
#39; model=3D&#39;pcie-root&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;controller type=3D&#39;pci&#39; index=3D&#39;1&=
#39; model=3D&#39;pcie-root-port&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;model name=3D&#39;ioh3420&#39;/&gt;=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;target chassis=3D&#39;1&#39; port=
=3D&#39;0x8&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;address type=3D&#39;pci&#39; domain=
=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x01&#39; function=3D&=
#39;0x0&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/controller&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;controller type=3D&#39;pci&#39; index=3D&#39;2&=
#39; model=3D&#39;pcie-root-port&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;model name=3D&#39;ioh3420&#39;/&gt;=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;target chassis=3D&#39;2&#39; port=
=3D&#39;0x10&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;address type=3D&#39;pci&#39; domain=
=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x02&#39; function=3D&=
#39;0x0&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/controller&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;controller type=3D&#39;virtio-serial&#39; index=
=3D&#39;0&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;address type=3D&#39;virtio-mmio&#39=
;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/controller&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;interface type=3D&#39;network&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;mac address=3D&#39;52:54:00:10:07:4=
1&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;source network=3D&#39;default&#39;/=
&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;model type=3D&#39;virtio&#39;/&gt;<=
br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;rom bar=3D&#39;off&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;address type=3D&#39;pci&#39; domain=
=3D&#39;0x0000&#39; bus=3D&#39;0x02&#39; slot=3D&#39;0x00&#39; function=3D&=
#39;0x0&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/interface&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;serial type=3D&#39;pty&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;target port=3D&#39;0&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/serial&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;console type=3D&#39;pty&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;target type=3D&#39;serial&#39; port=
=3D&#39;0&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/console&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;channel type=3D&#39;unix&#39;&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;source mode=3D&#39;bind&#39;/&gt;<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;target type=3D&#39;virtio&#39; name=
=3D&#39;org.qemu.guest_agent.0&#39;/<wbr>&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;address type=3D&#39;virtio-serial&#=
39; controller=3D&#39;0&#39; bus=3D&#39;0&#39; port=3D&#39;1&#39;/&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0&lt;/channel&gt;<br>
=C2=A0 &lt;/devices&gt;<br>
&lt;/domain&gt;<br>
<div><div><br>
--=C2=A0<br>
Andrea Bolognani / Red Hat / Virtualization<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1145ba322f6399053bf9738f--
