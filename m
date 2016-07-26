Received: by 10.25.21.156 with SMTP id 28csp1591089lfv;
        Tue, 26 Jul 2016 01:43:56 -0700 (PDT)
X-Received: by 10.55.187.4 with SMTP id l4mr28609695qkf.152.1469522636863;
        Tue, 26 Jul 2016 01:43:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si20321264qkb.126.2016.07.26.01.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 01:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRxy0-0006CY-9H
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 04:43:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bRxxs-00069o-Sj
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 04:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bRxxp-00082t-9B
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 04:43:48 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:2965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bRxxo-00082E-LI; Tue, 26 Jul 2016 04:43:45 -0400
Received: from 172.24.1.137 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DKU14186; Tue, 26 Jul 2016 16:40:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 26 Jul 2016 16:39:57 +0800
Message-ID: <579721DA.1000808@huawei.com>
Date: Tue, 26 Jul 2016 16:39:54 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <57971270.1010008@huawei.com>
	<CAKv+Gu8jzjLjpC7FR4fq13H+4rThQsW=fpMZ0F3Qfc45Gj1XSw@mail.gmail.com>
In-Reply-To: <CAKv+Gu8jzjLjpC7FR4fq13H+4rThQsW=fpMZ0F3Qfc45Gj1XSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.579721EC.00CE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6f30e3d06d06245728ebd27f253e66be
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] usb keyboard and mouse can't work on QEMU ARM64 with
 KVM
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Hangaohuai <hangaohuai@huawei.com>, Marc Zyngier <Marc.Zyngier@arm.com>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	arm-mail-list <linux-arm-kernel@lists.infradead.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLF7P9zR3vqM



On 2016/7/26 16:07, Ard Biesheuvel wrote:
> On 26 July 2016 at 09:34, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> > Hi，
>> >
>> > Recently I'm trying to use usb keyboard and mouse with QEMU on ARM64. Below is my QEMU command line,
>> > host and guest kernel both are 4.7.0-rc7+, and I ran it on Hikey board.
>> >
>> >     qemu-system-aarch64 \
>> >     -smp 1 -cpu host -enable-kvm \
>> >     -m 256 -M virt \
>> >     -k en-us \
>> >     -nographic \
>> >     -device usb-ehci -device usb-kbd -device usb-mouse -usb\
>> >     -kernel Image \
>> >     -initrd guestfs.cpio.gz \
>> >     -append "rdinit=/sbin/init console=ttyAMA0 root=/dev/ram earlycon=pl011,0x9000000 rw"
>> >
>> > The following guest log shows that usb controller can be probed but the keyboard and mouse can't be
>> > found.
>> >
>> > [    1.597433] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
>> > [    1.599562] ehci-pci: EHCI PCI platform driver
>> > [    1.608082] ehci-pci 0000:00:03.0: EHCI Host Controller
>> > [    1.609485] ehci-pci 0000:00:03.0: new USB bus registered, assigned bus number 1
>> > [    1.611833] ehci-pci 0000:00:03.0: irq 49, io mem 0x10041000
>> > [    1.623599] ehci-pci 0000:00:03.0: USB 2.0 started, EHCI 1.00
>> > [    1.625867] hub 1-0:1.0: USB hub found
>> > [    1.626906] hub 1-0:1.0: 6 ports detected
>> > [    1.628685] ehci-platform: EHCI generic platform driver
>> > [    1.630263] ehci-msm: Qualcomm On-Chip EHCI Host Controller
>> > [    1.631947] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>> > [    1.633547] ohci-pci: OHCI PCI platform driver
>> > [    1.634807] ohci-platform: OHCI generic platform driver
>> > [...]
>> > [    1.939001] usb 1-1: new high-speed USB device number 2 using ehci-pci
>> > [   17.467040] usb 1-1: device not accepting address 2, error -110
>> > [   17.579165] usb 1-1: new high-speed USB device number 3 using ehci-pci
>> > [   32.287242] random: dd urandom read with 7 bits of entropy available
>> > [   33.110970] usb 1-1: device not accepting address 3, error -110
>> > [   33.223030] usb 1-1: new high-speed USB device number 4 using ehci-pci
>> > [   43.635185] usb 1-1: device not accepting address 4, error -110
>> > [   43.747033] usb 1-1: new high-speed USB device number 5 using ehci-pci
>> > [   54.159043] usb 1-1: device not accepting address 5, error -110
>> > [   54.160752] usb usb1-port1: unable to enumerate USB device
>> > [   54.307290] usb 1-2: new high-speed USB device number 6 using ehci-pci
>> > [   69.839052] usb 1-2: device not accepting address 6, error -110
>> > [   69.951249] usb 1-2: new high-speed USB device number 7 using ehci-pci
>> > [   85.483171] usb 1-2: device not accepting address 7, error -110
>> > [   85.595035] usb 1-2: new high-speed USB device number 8 using ehci-pci
>> > [   90.619247] usb 1-2: device descriptor read/8, error -110
>> > [   95.743482] usb 1-2: device descriptor read/8, error -110
>> > [   95.959165] usb 1-2: new high-speed USB device number 9 using ehci-pci
>> > [  106.371177] usb 1-2: device not accepting address 9, error -110
>> > [  106.372894] usb usb1-port2: unable to enumerate USB device
>> >
>> > lsusb shows:
>> > root@genericarmv8:~# lsusb
>> > Bus 001 Device 001: ID 1d6b:0002
>> >
>> > Besides, I have also tried QEMU TCG without KVM. The guest can successfully probe usb controller,
>> > keyboard and mouse.
>> > lsusb shows:
>> > root@genericarmv8:~# lsusb
>> > Bus 001 Device 002: ID 0627:0001
>> > Bus 001 Device 003: ID 0627:0001
>> > Bus 001 Device 001: ID 1d6b:0002
>> >
>> > So it looks like that usb keyboard and mouse don't work with KVM on QEMU ARM64 while they can work
>> > with TCG. IIUC, all the usb devices are emulated by QEMU, it has nothing with KVM. So it really
>> > confused me and I'm not familiar with usb devices. Also I have seen someone else reports this issue
>> > before[1].
>> >
>> > [1]https://lists.gnu.org/archive/html/qemu-arm/2016-06/msg00110.html
>> >
>> > Any comments and help are welcome. Thanks in advance.
>> >
> Does your QEMU have this patch?
> http://git.qemu.org/?p=qemu.git;a=commitdiff;h=5d636e21c44ecf982a22a7bc4ca89186079ac283

Great! I applied this patch and the keyboard and mouse can work with KVM
now. Thanks a lot, Ard.

Thanks,
-- 
Shannon

