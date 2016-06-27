Received: by 10.25.21.96 with SMTP id l93csp1249273lfi;
        Mon, 27 Jun 2016 11:24:00 -0700 (PDT)
X-Received: by 10.55.42.216 with SMTP id q85mr26950247qkq.157.1467051840005;
        Mon, 27 Jun 2016 11:24:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z189si18357672qke.10.2016.06.27.11.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 11:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHbCR-0002Qi-DO
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 14:23:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1bHbCN-0002Qc-SN
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 14:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1bHbCJ-0007VQ-Er
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 14:23:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1bHbCJ-0007VM-6W; Mon, 27 Jun 2016 14:23:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 114F73E50F6;
	Mon, 27 Jun 2016 18:23:50 +0000 (UTC)
Received: from [10.10.116.79] (ovpn-116-79.rdu2.redhat.com [10.10.116.79])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5RINmfx016877; Mon, 27 Jun 2016 14:23:49 -0400
To: Kevin Zhao <kevin.zhao@linaro.org>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
	<CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
	<CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
	<2431b67a-8602-4400-bdd8-d597ff62a13b@redhat.com>
	<CAN76PtSMP_cdWXrbWOvchUDJMXNDwg5LjCxCHVTPEBTomS_ysw@mail.gmail.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <3ec77a9e-5ba7-c81a-ad12-3ade3115308f@redhat.com>
Date: Mon, 27 Jun 2016 14:23:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAN76PtSMP_cdWXrbWOvchUDJMXNDwg5LjCxCHVTPEBTomS_ysw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 27 Jun 2016 18:23:50 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xS4gzAvypisC

On 06/27/2016 09:05 AM, Kevin Zhao wrote:
> Hi Cole,
> 
> On 24 June 2016 at 19:35, Cole Robinson <crobinso@redhat.com> wrote:
> 
>> On 06/24/2016 12:58 AM, Kevin Zhao wrote:
>>> Hi Peter,
>>>      Follow your advice, I have complied the Qemu v2.6.
>>> stack@u202158:~$ kvm --version
>>> QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright (c)
>>> 2003-2008 Fabrice Bellard
>>>      With this newest version, I use virt-manager to create the guest ,
>> the
>>> xml file is in the attachment. But the Qemu return error when creating:
>>>      *error: internal error: process exited while connecting to monitor:
>>> qemu-system-aarch64: -device
>>> pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
>>> device*
>>>
>>
>> That's probably this libvirt issue fixed in 1.3.4 and later:
>>
>> https://www.redhat.com/archives/libvirt-users/2016-April/msg00030.html
>>
>> I suggest testing with libvirt.git as well, there's been aarch64 related
>> patches trickling in regularly
>>
>> - Cole
>>
>>      Thanks for your valuable advice. Follow your advice, I have build the
> upstream vesion
> of libvirt. The libvirt  version is :
>         root@u202158:/opt/stack/kevin/libvirt/daemon# ./libvirtd
>         2016-06-27 12:11:03.501+0000: 28044: info : libvirt version: 2.0.0
> I stopped the system libvirtd-bin and libvirt-guests , then using libvirtd
> above.
> 
> Also I have replace the system Qemu with the Qemu 2.6.50 which I have built
> from upstream :
>         root@u202158:/opt/stack/kevin/libvirt# qemu-system-aarch64 --version
>         QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty),
> Copyright (c) 2003-2008 Fabrice Bellard
> Using this XML in the attachment:
>         Then Run virsh command to create guest:
>         root@u202158:/opt/stack/kevin/libvirt/tools# ./virsh create
> /opt/stack/f23.xml --console
>         error: Failed to create domain from /opt/stack/f23.xml
>         error: internal error: process exited while connecting to monitor:
> 2016-06-27T12:45:23.807405Z qemu-system-aarch64: -drive
> file=/var/lib/libvirt/qemu/nvram/f23_VARS.fd,if=pflash,format=raw,unit=1:
> Could not open         '/var/lib/libvirt/qemu/nvram/f23_VARS.fd':
> Permission denied
> 
> Here I met the permission problem and I'm not sure where is wrong. If I use
> origin qemu-system-aarch64(installed by apt-get),I will not meet the
> problem of permission..Kindly need your help, you will be really
> appreciated,,,   :D
> $ls -l /usr/bin/qemu-system-aarch64
> -rwxr-xr-x 1 root root 26935520 Jun 27 10:56 /usr/bin/qemu-system-aarch64
>  $ls -l /var/lib/libvirt/qemu/nvram/f23_VARS.fd
> -rw------- 1 root root 67108864 Jun 20 07:27
> /var/lib/libvirt/qemu/nvram/f23_VARS.fd
> 
> 
> 

Depending on how you compiled libvirt, it may run qemu as the unprivileged
qemu:qemu user. Perhaps that VM was created with the default compilation
options to run qemu as root:root, and whatever you are trying to run it with
now is using qemu:qemu

- Cole

