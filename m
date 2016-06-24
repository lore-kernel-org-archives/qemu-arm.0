Received: by 10.25.21.96 with SMTP id l93csp995309lfi;
        Fri, 24 Jun 2016 04:35:17 -0700 (PDT)
X-Received: by 10.55.142.132 with SMTP id q126mr3740990qkd.81.1466768117143;
        Fri, 24 Jun 2016 04:35:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si4602517qtc.5.2016.06.24.04.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 04:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGPOG-0000OQ-Hl
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 07:35:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1bGPOC-0000O4-Af
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 07:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1bGPO8-0004Jl-Uu
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 07:35:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1bGPO8-0004I1-QL; Fri, 24 Jun 2016 07:35:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95B4A633ED;
	Fri, 24 Jun 2016 11:35:07 +0000 (UTC)
Received: from [10.10.116.65] (ovpn-116-65.rdu2.redhat.com [10.10.116.65])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5OBZ6q6019731; Fri, 24 Jun 2016 07:35:06 -0400
To: Kevin Zhao <kevin.zhao@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
	<CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
	<CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <2431b67a-8602-4400-bdd8-d597ff62a13b@redhat.com>
Date: Fri, 24 Jun 2016 07:35:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 24 Jun 2016 11:35:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Question about a qemu Aarch64 error
 when adding several SCSI disks
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UmlvU933aFrl

On 06/24/2016 12:58 AM, Kevin Zhao wrote:
> Hi Peter,
>      Follow your advice, I have complied the Qemu v2.6.
> stack@u202158:~$ kvm --version
> QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright (c)
> 2003-2008 Fabrice Bellard
>      With this newest version, I use virt-manager to create the guest , the
> xml file is in the attachment. But the Qemu return error when creating:
>      *error: internal error: process exited while connecting to monitor:
> qemu-system-aarch64: -device
> pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> device*
> 

That's probably this libvirt issue fixed in 1.3.4 and later:

https://www.redhat.com/archives/libvirt-users/2016-April/msg00030.html

I suggest testing with libvirt.git as well, there's been aarch64 related
patches trickling in regularly

- Cole

>      The guest xml file in in attachment. But the XML worked when Qemu is
> v2.4.0.
>       Also I delete the items in the xml :
>   -  <controller type='pci' index='0' model='pcie-root'/>
>   -  <controller type='pci' index='1' model='dmi-to-pci-bridge'>
>   -    <model name='i82801b11-bridge'/>
>   -    <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
> function='0x0'/>
>   -  </controller>
>   -  <controller type='pci' index='2' model='pci-bridge'>
>   -    <model name='pci-bridge'/>
>   -    <target chassisNr='2'/>
>   -    <address type='pci' domain='0x0000' bus='0x01' slot='0x01'
> function='0x0'/>
>   -  </controller>
>       Using virsh create guest.xml, got the error too :
>       *error: internal error: process exited while connecting to monitor:
> qemu-system-aarch64: -device
> pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> device.*
> My test machine is Softiron, with AMD* ARM64 *server CPU. The  libvirt
> version is 1.3.1
> 
>      Kindly need your help. You will be really appreciated :-)
>      Big Thanks~
> 

