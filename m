Received: by 10.25.21.156 with SMTP id 28csp465690lfv;
        Fri, 19 Aug 2016 10:51:51 -0700 (PDT)
X-Received: by 10.237.37.58 with SMTP id v55mr10345064qtc.9.1471629111848;
        Fri, 19 Aug 2016 10:51:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d132si5323997qke.186.2016.08.19.10.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 10:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1banxP-0004Fd-7S
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 13:51:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1banxJ-0004EX-8d
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 13:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1banxG-0002ig-4u
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 13:51:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>)
	id 1banxF-0002iV-T4; Fri, 19 Aug 2016 13:51:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 109E84E4CA;
	Fri, 19 Aug 2016 17:51:41 +0000 (UTC)
Received: from vlap.laine.org (ovpn-116-25.phx2.redhat.com [10.3.116.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7JHpcpr008866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 19 Aug 2016 13:51:39 -0400
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<1471452093.3820.42.camel@redhat.com>
	<20160818063807.mqs7jdjau5uwyswx@hawk.localdomain>
	<1471621399.3820.64.camel@redhat.com>
From: Laine Stump <laine@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <37ae3fd2-639a-84ca-5044-0c76ef1b9d94@redhat.com>
Date: Fri, 19 Aug 2016 13:51:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471621399.3820.64.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 19 Aug 2016 17:51:41 +0000 (UTC)
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
X-TUID: qb3En4+ph8rt

On 08/19/2016 11:43 AM, Andrea Bolognani wrote:
> On Thu, 2016-08-18 at 08:38 +0200, Andrew Jones wrote:
>>>> Finally, FWIW, with a guest kernel of 4.6.4-301.fc24.aarch64. The
>>>> following qemu command line works for me.
>>>> (notice the use of PCIe), and my network interface gets labeled enp0s1.
>>>>    
>>>> $QEMU -machine virt-2.6,accel=kvm -cpu host \
>>>>     -m 1024 -smp 1 -nographic \
>>>>     -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>>>>     -device ioh3420,bus=pcie.0,id=pcie.1,port=1,chassis=1 \
>>>>     -device ioh3420,bus=pcie.0,id=pcie.2,port=2,chassis=2 \
>>>>     -device virtio-scsi-pci,disable-modern=off,disable-legacy=on,bus=pcie.1,addr=00.0,id=scsi0 \
>>>>     -drive file=/home/drjones/.local/libvirt/images/fedora.qcow2,format=qcow2,if=none,id=drive-scsi0-0-0-0 \
>>>>     -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1 \
>>>>     -netdev user,id=hostnet0 \
>>>>     -device virtio-net-pci,disable-modern=off,disable-legacy=on,bus=pcie.2,addr=00.0,netdev=hostnet0,id=net0
>>>>    
>>>> I prefer always using virtio-scsi for the disk, but a similar command
>>>> line can be used for a virtio-blk-pci disk.
>>>   
>>> Does the same command line work if you don't specify any of
>>> the disable-* options?
>>>   
>>> I'm asking because I tried running a Fedora 24 guest through
>>> libvirt, which doesn't support those options yet, and I get
>>>   
>>>     virtio_blk virtio2: virtio: device uses modern interface but
>>>                                 does not have VIRTIO_F_VERSION_1
>>>     virtio_blk: probe of virtio2 failed with error -22
>>   
>> Doesn't work for me either. I can only boot with disable-modern=off,
>> disable-legacy=on (at least when building my config the way I try to
>> build it...) I presume that's a guest kernel issue.
> I tried Fedora 24 and Debian testing, and for both of them
> the result is the same: I can only boot the guest if I'm
> setting up a legacy-free PCIe topology and use virt-2.7 to
> obtain virtio-1.0 devices (see below); for every other
> permutation of
>
>    { PCI topology, PCIe topology } x { virt-2.6, virt-2.7 }
>
> the guest doesn't boot at all.
>
> On the other hand, a RHEL 7.3 guest was able to boot *every
> single time*, even though the result was in some cases
> quite questionable (eg. legacy PCI devices plugged into
> ioh3420 ports).
>
>>> Isn't the default for 2.6 disable-modern=off,
>>> disable-legacy=off? Or was that 2.7? I tried both anyway ;)
>>   
>> Dunno. With the command line getting longer all the time, I just
>> have a script that generates one that works for me, and haven't
>> worried much about the defaults...
> So I thought the default for 2.6 was supposed to be
>
>    disable-modern=off,disable-legacy=off  [0.9+1.0]
>
> but it turns out it's actually
>
>    disable-modern=on,disable-legacy=off       [0.9]

Huh. I had thought it switched to disable-modern=off with 2.6 as well.

>
> whereas the default for 2.7 is
>
>    disable-modern=off,disable-legacy=on       [1.0]
>
> Is the idea that there would be a QEMU release with both
> 0.9 and 1.0 enabled by default something that I just
> imagined? Or did the plan just change at some point?

If I understand the patches correctly, the default for 2.7 will be 
different depending on the type of slot:

pcie-root -> disable-modern=off,disable-legacy=off
legacy PCI -> disable-modern=off,disable-legacy=off
pcie-*-port -> disable-modern=off,disable-legacy=on

The idea is to eliminate the need for the pcie-*-port to reserve IO port 
space (this isn't an issue on pcie-root, so the default is different).
