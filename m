Received: by 10.25.0.144 with SMTP id 138csp1651664lfa;
        Mon, 24 Apr 2017 18:10:58 -0700 (PDT)
X-Received: by 10.55.34.10 with SMTP id i10mr30290373qki.138.1493082658345;
        Mon, 24 Apr 2017 18:10:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q74si14226145qkh.113.2017.04.24.18.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Apr 2017 18:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2p0L-00086F-Ow
	for alex.bennee@linaro.org; Mon, 24 Apr 2017 21:10:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1d2p0B-00084t-1G
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 21:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1d2p07-0008TA-Oy
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 21:10:46 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3853
	helo=dggrg03-dlp.huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1d2p06-0008Qe-SG; Mon, 24 Apr 2017 21:10:43 -0400
Received: from 172.30.72.53 (EHLO dggeml405-hub.china.huawei.com)
	([172.30.72.53])
	by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AML05567; Tue, 25 Apr 2017 09:10:29 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by dggeml405-hub.china.huawei.com
	(10.3.17.49) with Microsoft SMTP Server id 14.3.301.0; Tue, 25 Apr 2017
	09:10:17 +0800
Message-ID: <58FEA1F5.6020509@huawei.com>
Date: Tue, 25 Apr 2017 09:10:13 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>
References: <58EF2AA9.8010501@huawei.com>
	<313049a7-b154-d3a1-9cb1-205950ab055a@redhat.com>
	<58F036D1.9090009@huawei.com>
	<93a12497-5239-2fde-e9fa-b00c869a6050@redhat.com>
	<502cfa6c-fb8f-108f-747a-994107ccbae3@redhat.com>
In-Reply-To: <502cfa6c-fb8f-108f-747a-994107ccbae3@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.58FEA206.0056, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ce41be9b1226bee14110c1605e18effd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.189
Subject: Re: [Qemu-arm] ARM virt machine boots fail with 14 ioh3420
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
Cc: Drew Jones <drjones@redhat.com>, Ard
	Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu devel list <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, zhuweilun <zhuweilun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NdpLArNrfdH+



On 2017/4/24 18:16, Marcel Apfelbaum wrote:
> On 04/24/2017 01:02 PM, Laszlo Ersek wrote:
>> On 04/14/17 04:41, Shannon Zhao wrote:
>>> Hi Laszlo,
>>>
>>> Thanks a lot for your reply:)
>>>
>>> On 2017/4/14 1:09, Laszlo Ersek wrote:
>>>> Adding Andrea, Ard, Drew and Marcel; and the main qemu list
>>>>
>>>> On 04/13/17 09:37, Shannon Zhao wrote:
>>>>> Hi,
>>>>>
>>>>> I'm testing the PCIe devices hotplug for ARM virt machine and using
>>>>> ioh3420 as root port. I found that below command line could work.
>>>>>
>>>>> qemu-system-aarch64 -machine virt,accel=kvm,usb=off -cpu host -bios
>>>>> QEMU_EFI.fd -m 12288 -smp 8,sockets=8,cores=1,threads=1  -device
>>>>> ioh3420,port=0x8,chassis=1,id=pci.1,bus=pcie.0,addr=0x1 -device
>>>>> ioh3420,port=0x9,chassis=2,id=pci.2,bus=pcie.0,addr=0x2 -device
>>>>> ioh3420,port=0xa,chassis=3,id=pci.3,bus=pcie.0,addr=0x3 -device
>>>>> ioh3420,port=0xb,chassis=4,id=pci.4,bus=pcie.0,addr=0x4 -device
>>>>> ioh3420,port=0xc,chassis=5,id=pci.5,bus=pcie.0,addr=0x5 -device
>>>>> ioh3420,port=0xd,chassis=6,id=pci.6,bus=pcie.0,addr=0x6 -device
>>>>> ioh3420,port=0xe,chassis=7,id=pci.7,bus=pcie.0,addr=0x7 -device
>>>>> ioh3420,port=0xf,chassis=8,id=pci.8,bus=pcie.0,addr=0x8 -device
>>>>> ioh3420,port=0x10,chassis=9,id=pci.9,bus=pcie.0,addr=0x9 -device
>>>>> ioh3420,port=0x11,chassis=10,id=pci.10,bus=pcie.0,addr=0xa -device
>>>>> ioh3420,port=0x12,chassis=11,id=pci.11,bus=pcie.0,addr=0xb -device
>>>>> ioh3420,port=0x13,chassis=12,id=pci.12,bus=pcie.0,addr=0xc -device
>>>>> ioh3420,port=0x14,chassis=13,id=pci.13,bus=pcie.0,addr=0xd -device
>>>>> i82801b11-bridge,id=pci.17,bus=pcie.0,addr=0x11 -device
>>>>> pci-bridge,chassis_nr=18,id=pci.18,bus=pci.17,addr=0x0 -device
>>>>> usb-ehci,id=usb,bus=pci.18,addr=0x1 -device
>>>>> virtio-scsi-pci,id=scsi0,bus=pci.1,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -drive
>>>>> file=/mnt/sdb/guest.raw,format=raw,if=none,id=drive-scsi0-0-0-0,cache=none,aio=native
>>>>>
>>>>> -device
>>>>> scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1
>>>>>
>>>>> -netdev tap,id=hostnet1,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet1,id=net1,mac=00:16:3e:2b:cc:e1,bus=pci.2,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet2,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet2,id=net2,mac=00:16:3e:22:29:80,bus=pci.3,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet3,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet3,id=net3,mac=00:16:3e:28:07:9a,bus=pci.4,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet4,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet4,id=net4,mac=00:16:3e:3d:cd:b6,bus=pci.5,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet5,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet5,id=net5,mac=00:16:3e:64:9f:b0,bus=pci.6,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet6,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet6,id=net6,mac=00:16:3e:33:5b:d3,bus=pci.7,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet7,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet7,id=net7,mac=00:16:3e:39:7c:df,bus=pci.8,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet8,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet8,id=net8,mac=00:16:3e:0a:c1:4e,bus=pci.9,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet9,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet9,id=net9,mac=00:16:3e:0a:58:a6,bus=pci.10,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet10,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet10,id=net10,mac=00:16:3e:35:b5:80,bus=pci.11,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet11,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet11,id=net11,mac=00:16:3e:4d:b5:bb,bus=pci.12,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -netdev tap,id=hostnet12,vhost=on -device
>>>>> virtio-net-pci,netdev=hostnet12,id=net12,mac=00:16:3e:3b:69:e9,bus=pci.13,addr=0x0,disable-legacy=on,disable-modern=off
>>>>>
>>>>> -nographic
>>>>>
>>>>> But if I add one more ioh3420 device by appending above command with
>>>>> "-device ioh3420,port=0x15,chassis=14,id=pci.14,bus=pcie.0,addr=0xe",
>>>>> the guest can't boot. It seems that the firmware doesn't recognize the
>>>>> PCIe devices and print "Connect: PciRoot(0x0): Not Found".
>>>>>
>>>>> I'm using QEMU 2.8.1 and edk2 at commit 36a0d5c. Is there any
>>>>> limitation
>>>>> of the supported PCIe devices?
>>>>
>>>> In one sentence: you are running out of (emulated) IO space.
>>>>
>>>> Aarch64 does not have "IO space", but with QEMU, using the "virt"
>>>> machine type, we emulate 64KB of IO space, mapped to a special MMIO
>>>> range. This is available for PCI resource allocation, for such devices
>>>> that have IO BARs (and for such PCI bridges that reserve IO space for
>>>> hotplug purposes).
>>>>
>>>> The ioh3420 PCI Express Root Port device represents such a bridge. Even
>>>> if you plug a PCI Express device into it that has only MMIO BARs, the
>>>> bridge still advertises IO support, and it causes the firmware (and/or
>>>> Linux) to reserve 4KB of IO space. With ~15-16 such ports, you run out
>>>> of the 64 KB IO aperture, and the resource assignment fails.
>>>>
>>> So currently if we want to support more than ~15 virtio-net-pci devices,
>>> they can't connect to root port.
>>
>> Right.
>>
>>> They should connect to pcie root bus
>>> directly, right?
>>
>> Correct, that will make them integrated endpoints, and no PCI Express
>> ports will be necessary (hence no IO space will be wasted).
>>
>>> But this will not support hot-plug/remove.
>>
>> Correct.
>>
>>>
>>> BTW, I think even though the qemu assign more than ~15 root port, I
>>> think the firmware should enable the first 15 ports and continue to work
>>> instead of failing with silence.
>>
>> PCI device enumeration & resource assignment are implemented in
>> "MdeModulePkg/Bus/Pci/PciBusDxe". It is a generic edk2 driver that is
>> built into OVMF, ArmVirtQemu, and (supposedly) most physical platform
>> firmware, without any changes. If you have improvements in mind, please
>> submit a patch for that driver.
>>
>>>
>>>> The solution to this problem comes together from several parts:
>>>>
>>>> (1) New, vendor-independent device models in QEMU, for PCI Express Root
>>>> Ports and Downstream Ports, that (optionally) do not advertise any
>>>> support at all for IO BARs. This is on Marcel's task list. Please
>>>> refer to:
>>>>
>>>>   generic port device model:
>>>>     https://bugzilla.redhat.com/show_bug.cgi?id=1390316
>>>>
>>> I see this is in upstream qemu.
>>
>> Yes. All of the pertaining work will be implemented upstream first.
>>
>>>
>>>>   optional disablement of IO space:
>>>>     https://bugzilla.redhat.com/show_bug.cgi?id=1344299
>>>>
>>> Marcel, what's the status of this feature?
>>
>> (I think Marcel plans to answer your question, but AIUI he too might
>> have a bit of post-vacation email backlog to flush.)
>>
> 
> Hi,
> 
> Sorry for the delay, I am working on it, I do have some patches that should
> work, but they don't... I am checking the possibility that
> Firmwares/OSes do
> not really check if the PCI bridge actually implements IO ports forwarding
> and assumes it does instead.
> 
> I really hope I have a bug somewhere, I will update when I'll know more.
Ok, thanks in advance.

-- 
Shannon

