Received: by 10.25.0.144 with SMTP id 138csp625154lfa;
        Thu, 13 Apr 2017 00:38:02 -0700 (PDT)
X-Received: by 10.55.18.231 with SMTP id 100mr1522046qks.135.1492069081972;
        Thu, 13 Apr 2017 00:38:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w45si13877574qtg.173.2017.04.13.00.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 00:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyZKJ-0001Cz-Fy
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 03:37:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cyZKA-0001CW-DS
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 03:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cyZK5-0000de-GP
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 03:37:50 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3374
	helo=dggrg03-dlp.huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cyZK0-0000X5-JE
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 03:37:45 -0400
Received: from 172.30.72.57 (EHLO DGGEML401-HUB.china.huawei.com)
	([172.30.72.57])
	by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ALQ17220; Thu, 13 Apr 2017 15:37:26 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEML401-HUB.china.huawei.com
	(10.3.17.32) with Microsoft SMTP Server id 14.3.301.0; Thu, 13 Apr 2017
	15:37:16 +0800
Message-ID: <58EF2AA9.8010501@huawei.com>
Date: Thu, 13 Apr 2017 15:37:13 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>, Laszlo Ersek
	<lersek@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.58EF2AB6.0186, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7bb7a82a0bd3d6fcb7e7aa4e67febb6b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.189
Subject: [Qemu-arm] ARM virt machine boots fail with 14 ioh3420
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
Cc: qemu-arm <qemu-arm@nongnu.org>, zhuweilun <zhuweilun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PDo71VYSKhBj

Hi,

I'm testing the PCIe devices hotplug for ARM virt machine and using
ioh3420 as root port. I found that below command line could work.

qemu-system-aarch64 -machine virt,accel=kvm,usb=off -cpu host -bios
QEMU_EFI.fd -m 12288 -smp 8,sockets=8,cores=1,threads=1  -device
ioh3420,port=0x8,chassis=1,id=pci.1,bus=pcie.0,addr=0x1 -device
ioh3420,port=0x9,chassis=2,id=pci.2,bus=pcie.0,addr=0x2 -device
ioh3420,port=0xa,chassis=3,id=pci.3,bus=pcie.0,addr=0x3 -device
ioh3420,port=0xb,chassis=4,id=pci.4,bus=pcie.0,addr=0x4 -device
ioh3420,port=0xc,chassis=5,id=pci.5,bus=pcie.0,addr=0x5 -device
ioh3420,port=0xd,chassis=6,id=pci.6,bus=pcie.0,addr=0x6 -device
ioh3420,port=0xe,chassis=7,id=pci.7,bus=pcie.0,addr=0x7 -device
ioh3420,port=0xf,chassis=8,id=pci.8,bus=pcie.0,addr=0x8 -device
ioh3420,port=0x10,chassis=9,id=pci.9,bus=pcie.0,addr=0x9 -device
ioh3420,port=0x11,chassis=10,id=pci.10,bus=pcie.0,addr=0xa -device
ioh3420,port=0x12,chassis=11,id=pci.11,bus=pcie.0,addr=0xb -device
ioh3420,port=0x13,chassis=12,id=pci.12,bus=pcie.0,addr=0xc -device
ioh3420,port=0x14,chassis=13,id=pci.13,bus=pcie.0,addr=0xd -device
i82801b11-bridge,id=pci.17,bus=pcie.0,addr=0x11 -device
pci-bridge,chassis_nr=18,id=pci.18,bus=pci.17,addr=0x0 -device
usb-ehci,id=usb,bus=pci.18,addr=0x1 -device
virtio-scsi-pci,id=scsi0,bus=pci.1,addr=0x0,disable-legacy=on,disable-modern=off
-drive
file=/mnt/sdb/guest.raw,format=raw,if=none,id=drive-scsi0-0-0-0,cache=none,aio=native
-device
scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1
-netdev tap,id=hostnet1,vhost=on -device
virtio-net-pci,netdev=hostnet1,id=net1,mac=00:16:3e:2b:cc:e1,bus=pci.2,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet2,vhost=on -device
virtio-net-pci,netdev=hostnet2,id=net2,mac=00:16:3e:22:29:80,bus=pci.3,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet3,vhost=on -device
virtio-net-pci,netdev=hostnet3,id=net3,mac=00:16:3e:28:07:9a,bus=pci.4,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet4,vhost=on -device
virtio-net-pci,netdev=hostnet4,id=net4,mac=00:16:3e:3d:cd:b6,bus=pci.5,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet5,vhost=on -device
virtio-net-pci,netdev=hostnet5,id=net5,mac=00:16:3e:64:9f:b0,bus=pci.6,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet6,vhost=on -device
virtio-net-pci,netdev=hostnet6,id=net6,mac=00:16:3e:33:5b:d3,bus=pci.7,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet7,vhost=on -device
virtio-net-pci,netdev=hostnet7,id=net7,mac=00:16:3e:39:7c:df,bus=pci.8,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet8,vhost=on -device
virtio-net-pci,netdev=hostnet8,id=net8,mac=00:16:3e:0a:c1:4e,bus=pci.9,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet9,vhost=on -device
virtio-net-pci,netdev=hostnet9,id=net9,mac=00:16:3e:0a:58:a6,bus=pci.10,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet10,vhost=on -device
virtio-net-pci,netdev=hostnet10,id=net10,mac=00:16:3e:35:b5:80,bus=pci.11,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet11,vhost=on -device
virtio-net-pci,netdev=hostnet11,id=net11,mac=00:16:3e:4d:b5:bb,bus=pci.12,addr=0x0,disable-legacy=on,disable-modern=off
-netdev tap,id=hostnet12,vhost=on -device
virtio-net-pci,netdev=hostnet12,id=net12,mac=00:16:3e:3b:69:e9,bus=pci.13,addr=0x0,disable-legacy=on,disable-modern=off
-nographic

But if I add one more ioh3420 device by appending above command with
"-device ioh3420,port=0x15,chassis=14,id=pci.14,bus=pcie.0,addr=0xe",
the guest can't boot. It seems that the firmware doesn't recognize the
PCIe devices and print "Connect: PciRoot(0x0): Not Found".

I'm using QEMU 2.8.1 and edk2 at commit 36a0d5c. Is there any limitation
of the supported PCIe devices?

Thanks,
-- 
Shannon

