Received: by 10.25.21.156 with SMTP id 28csp66075lfv;
        Tue, 23 Aug 2016 18:54:21 -0700 (PDT)
X-Received: by 10.55.91.196 with SMTP id p187mr453566qkb.263.1472003661469;
        Tue, 23 Aug 2016 18:54:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i93si1343702qkh.29.2016.08.23.18.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 18:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcNOW-0001qe-Tn
	for alex.bennee@linaro.org; Tue, 23 Aug 2016 21:54:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bcNNa-0001BH-C5
	for qemu-devel@nongnu.org; Tue, 23 Aug 2016 21:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bcNNX-0007aM-5w
	for qemu-devel@nongnu.org; Tue, 23 Aug 2016 21:53:22 -0400
Received: from mail-ua0-f173.google.com ([209.85.217.173]:34746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bcNNW-0007ZB-Pp
	for qemu-devel@nongnu.org; Tue, 23 Aug 2016 21:53:19 -0400
Received: by mail-ua0-f173.google.com with SMTP id k90so4459781uak.1
	for <qemu-devel@nongnu.org>; Tue, 23 Aug 2016 18:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kju7p1sgBwhhPw4ORm/uG8Z7+OepG624lEQL+8N09vc=;
	b=PdN1bXV+sqGXJraAST5eYAtAj1dV1CBExtRye6AHntHNSwNfNjwdx7VGVCGlo30anA
	uUPrb+70cKP2cU/tbBvrAUwhHLtfaOIk5vsMglTN5Rn86D6yoj2CIW+73T4yWMf0pJ9R
	n8AvhEe7sAJwaBpfEL2jOAXsEJKjZNvTzsdXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kju7p1sgBwhhPw4ORm/uG8Z7+OepG624lEQL+8N09vc=;
	b=QLwPsMcLNxFPBxzyZKEjO+wC/6+2/85xxsvqc/2X2IfcBthMUM3tStxsetCWYDACTR
	7JEDGmwiKucIhuG6plkkjTeUQBJN+LJ+EJ6ybp7SxMtKDpfshtaLd8Y2bFkQi6cgIRZt
	Cr45nLhvwjMDQiYG0KZ3UCg6DTAzN1CjbaE7YTF/8JrqaDhJDx6j6U9wZw1EvrCqWyRy
	PBNpZscQfbj1vmQGut8iRiUBSG3wH8exwYkm6hBnV0jZLBRhnP4PmJ3xal17VEu3nJeg
	pjpxAkZxd6OmAtjAR8jap+noKZ/IxJpXyjpOWimnrKXSjFGINdatAjA9RV9pXXi19NSM
	BOFg==
X-Gm-Message-State: AE9vXwPafNSLa7ZfPRvkL+cCn+hBE/G0Qv5X4dpNwPQkL8TB3MXW5md+wLcBjvQUxv1JO4mpNunJwkBJHBW+wySq
X-Received: by 10.176.0.211 with SMTP id 77mr264501uaj.75.1472003537500; Tue,
	23 Aug 2016 18:52:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.195 with HTTP; Tue, 23 Aug 2016 18:52:16 -0700 (PDT)
In-Reply-To: <1471528312.3820.48.camel@redhat.com>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
	<CAN76PtR-5NsEE_jqvmO=xdETOvh44c8q=t5AGimmPqU_N7bHJA@mail.gmail.com>
	<1471528312.3820.48.camel@redhat.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Wed, 24 Aug 2016 09:52:16 +0800
Message-ID: <CAN76PtTBAPxHkm41fOzDC39SSm92FM4Pam1-NVAwNEGAhXRn0g@mail.gmail.com>
To: Andrea Bolognani <abologna@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Thomas Hanson <thomas.hanson@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tF6cCWKYPtsR

Great ~ Thanks for your valuable information~
I will try with the xml and any update I will post here.

On 18 August 2016 at 21:51, Andrea Bolognani <abologna@redhat.com> wrote:

> On Thu, 2016-08-18 at 20:43 +0800, Kevin Zhao wrote:
> > What's the minimum version of  Qemu that support virito-1.0?
> > Does Qemu 2.6 works?
>
> 2.6 definitely has virtio 1.0 support, however libvirt does
> not yet allow you to control whether a device uses 0.9, 1.0
> or both. The default for 2.6 should be both IIRC.
>
> > Now I will manually add the slots and bus to pcie. Because
> > I am not familiar with it,  if it convenient, could you give
> > me an available xml file which PCIE disk and PCIE
> > net device can work for machine virt ?
>
> The XML you're looking for is at the end of this message.
>
> Note that a Fedora 24 guest configured this way will not
> boot at all if the machine type is virt-2.6; on the other
> hand, an identically-configured RHEL 7.3 guest will boot
> even with virt-2.6, but both the disk and the network
> adapter will be legacy PCI instead of PCIe.
>
>
> <domain type='kvm'>
>   <name>abologna-f24</name>
>   <uuid>f6d0428b-a034-4c4e-8ef2-f12f6aa9cab0</uuid>
>   <memory unit='KiB'>2097152</memory>
>   <currentMemory unit='KiB'>2097152</currentMemory>
>   <vcpu placement='static'>4</vcpu>
>   <os>
>     <type arch='aarch64' machine='virt-2.7'>hvm</type>
>     <loader readonly='yes' type='pflash'>/usr/share/
> AAVMF/AAVMF_CODE.fd</loader>
>     <nvram>/var/lib/libvirt/qemu/nvram/abologna-f24_VARS.fd</nvram>
>     <boot dev='hd'/>
>   </os>
>   <features>
>     <gic version='2'/>
>   </features>
>   <cpu mode='host-passthrough'/>
>   <clock offset='utc'/>
>   <on_poweroff>destroy</on_poweroff>
>   <on_reboot>restart</on_reboot>
>   <on_crash>restart</on_crash>
>   <devices>
>     <emulator>/usr/libexec/abologna-qemu-kvm</emulator>
>     <disk type='file' device='disk'>
>       <driver name='qemu' type='qcow2'/>
>       <source file='/var/lib/libvirt/images/abologna-f24.qcow2'/>
>       <target dev='vda' bus='virtio'/>
>       <address type='pci' domain='0x0000' bus='0x01' slot='0x00'
> function='0x0'/>
>     </disk>
>     <controller type='pci' index='0' model='pcie-root'/>
>     <controller type='pci' index='1' model='pcie-root-port'>
>       <model name='ioh3420'/>
>       <target chassis='1' port='0x8'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
> function='0x0'/>
>     </controller>
>     <controller type='pci' index='2' model='pcie-root-port'>
>       <model name='ioh3420'/>
>       <target chassis='2' port='0x10'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x02'
> function='0x0'/>
>     </controller>
>     <controller type='virtio-serial' index='0'>
>       <address type='virtio-mmio'/>
>     </controller>
>     <interface type='network'>
>       <mac address='52:54:00:10:07:41'/>
>       <source network='default'/>
>       <model type='virtio'/>
>       <rom bar='off'/>
>       <address type='pci' domain='0x0000' bus='0x02' slot='0x00'
> function='0x0'/>
>     </interface>
>     <serial type='pty'>
>       <target port='0'/>
>     </serial>
>     <console type='pty'>
>       <target type='serial' port='0'/>
>     </console>
>     <channel type='unix'>
>       <source mode='bind'/>
>       <target type='virtio' name='org.qemu.guest_agent.0'/>
>       <address type='virtio-serial' controller='0' bus='0' port='1'/>
>     </channel>
>   </devices>
> </domain>
>
> --
> Andrea Bolognani / Red Hat / Virtualization
>
