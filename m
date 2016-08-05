Received: by 10.25.21.156 with SMTP id 28csp1733193lfv;
        Fri, 5 Aug 2016 03:29:57 -0700 (PDT)
X-Received: by 10.55.24.149 with SMTP id 21mr11968271qky.232.1470392997189;
        Fri, 05 Aug 2016 03:29:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a64si863740qkg.206.2016.08.05.03.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 03:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVcO4-0001gi-IO
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 06:29:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Claudio.Fontana@huawei.com>) id 1bVcMW-0008Lq-Ot
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 06:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Claudio.Fontana@huawei.com>) id 1bVcMV-0000jQ-HV
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 06:28:20 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:2865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Claudio.Fontana@huawei.com>)
	id 1bVcMQ-0000hT-KB; Fri, 05 Aug 2016 06:28:14 -0400
Received: from 172.18.7.190 (EHLO lhreml704-cah.china.huawei.com)
	([172.18.7.190])
	by lhrrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COX95212; Fri, 05 Aug 2016 10:27:57 +0000 (GMT)
Received: from [10.201.112.86] (10.201.112.86) by
	lhreml704-cah.china.huawei.com (10.201.5.130) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 5 Aug 2016 11:27:44 +0100
To: "Daniel P. Berrange" <berrange@redhat.com>, Kevin Zhao
	<kevin.zhao@linaro.org>
References: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
	<20160805082857.GH9933@redhat.com>
From: Claudio Fontana <claudio.fontana@huawei.com>
Message-ID: <57A46A1D.6000608@huawei.com>
Date: Fri, 5 Aug 2016 12:27:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160805082857.GH9933@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.112.86]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.57A46A2E.005F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b52da28197425d1d050318390a740259
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-devel] [Help]: Does qemu-system-aarch64 support
 virtio-9p? I got a problem when remap host file to guest in AArch64.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVRQbiTmHR9+

Hi,

On 05.08.2016 10:28, Daniel P. Berrange wrote:
> On Fri, Aug 05, 2016 at 10:23:58AM +0800, Kevin Zhao wrote:
>> Hi All,
>>      I have a problem may about Qemu and kindly need your help. Does
>> qemu-system-aarch64 support virtio-9p ?
>>      Recently I have tried to use qemu remapped the file from host to
>> guest. As I know, Qemu has supported this so long as guest kernel has
>> support 9p(virtfs). Reference to this link:
>> http://wiki.qemu.org/Documentation/9psetup
>> Fedora 24 AArch64 kernel has supported this:
>> [root@sha-win-225 ~]# lsmod | grep 9p
>> 9p                     56273  0
>> fscache                87449  1 9p
>> 9pnet_virtio            9122  0
>> 9pnet                  83564  2 9p,9pnet_virtio
>> virtio_ring            13866  5 virtio_net,virtio_pci,9pnet_
>> virtio,virtio_mmio,virtio_scsi
>> virtio                  9467  5 virtio_net,virtio_pci,9pnet_
>> virtio,virtio_mmio,virtio_scsi
>>
>>     Now I use virsh to launch the VM, and the corresponding qemu command I
>> have pasted here:
>> http://paste.openstack.org/show/549225/.
>>     You can see that:
>> * -fsdev
>> local,security_model=mapped,id=fsdev-fs0,path=/var/lib/libvirt/images/coreos
>> -device
>> virtio-9p-pci,id=fs0,fsdev=fsdev-fs0,mount_tag=share,bus=pci.2,addr=0x1*
>>      Here is the command that remapped the directory from host to guest.
>> After VM launched, I use the command to mount:
>> * mount -t 9p -o trans=virtio share /tmp/shared/
>> -oversion=9p2000.L,posixacl,cache=loose*
>> But mount command will be blocked and output nothing.
> 
> Try using  version=9p2000.u instead - I've noticed other versions have
> been buggy in various kernel version/qemu version combinations. The
> 9p2000.u version is what i use in libvirt-sandobx and so I know it will
> work in general.

We are using version=9p2000.L here with qemu-system-aarch64, and it works well.
We tested only on qemu-2.5 though.

Ciao,

Claudio


> 
>>      The Qemu version is QEMU emulator version 2.5.0 (Debian
>> 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the same
>> problem in Debian jessie.
>>       Kindly need your help~You will be really appreciated.
> 
> Regards,
> Daniel
> 


-- 
Claudio Fontana
Server Virtualization Architect
Huawei Technologies Duesseldorf GmbH
Riesstraße 25 - 80992 München

