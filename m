Received: by 10.25.208.211 with SMTP id h202csp3465587lfg;
        Fri, 26 Feb 2016 09:13:27 -0800 (PST)
X-Received: by 10.140.21.229 with SMTP id 92mr3417272qgl.89.1456506807763;
        Fri, 26 Feb 2016 09:13:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org ([2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a126si4850289qkb.100.2016.02.26.09.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 09:13:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZLxH-0003GE-6Q
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 12:13:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1aZLxE-0003DO-JG
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 12:13:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1aZLxA-0001kV-B6
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 12:13:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1aZLxA-0001kG-32; Fri, 26 Feb 2016 12:13:20 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DA74C6540A;
	Fri, 26 Feb 2016 17:13:18 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-171.bos.redhat.com
	[10.18.17.171])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1QHDHSX018347; Fri, 26 Feb 2016 12:13:17 -0500
To: Mats Malmberg <mats.malmberg@tritech.se>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
	<BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<56CDF624.6050104@redhat.com>
	<BLUPR0301MB2034F3C40B01A1A3536A837C9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<605392182193B84A99A143D9DA347B52FB8B57@post>
From: John Snow <jsnow@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56D087AD.3040001@redhat.com>
Date: Fri, 26 Feb 2016 12:13:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <605392182193B84A99A143D9DA347B52FB8B57@post>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 26 Feb 2016 17:13:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel]  help on how to emulate rasbperry pi 2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D/UqDn6JEM3k



On 02/26/2016 04:30 AM, Mats Malmberg wrote:
> Hello, thank you for your quick response!
> 
> It helped me to get a little bit further, but unfortunately the problem persists. 
> I now get some output from the kernel startup, but I think that it is unable to find the provided sd-card image.
> 
> Here's what I've tried (the most successful setup):
> 1. download and deflate jessie/jessie-lite image (I tried both distros)
> 2. mount the boot partition and copy the following files to host: kernel7.img, kernel.img and bcm2709-rpi-2-b.dtb
> 3. mount the rootfs partition. Open the file /etc/ld.so.preload and comment out the line /usr/lib/arm-linux-gnueabihf/libarmmem.so (which is the only line present in the file.)
> 4. execute the command 
> qemu-system-arm -M raspi2  -kernel kernel7.img -sd 2016-02-09-raspbian-jessie.img -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2" -dtb bcm2709-rpi-2-b.dtb -serial stdio
> 
> the resulting terminal printout : 
> 
> WARNING: Image format was not specified for '2016-02-09-raspbian-jessie.img' and probing guessed raw.
>          Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
>          Specify the 'raw' format explicitly to remove the restrictions.
> Warning: Orphaned drive without device: id=sd0,file=2016-02-09-raspbian-jessie.img,if=sd,bus=0,unit=0
> VNC server running on '127.0.0.1;5900'
> Uncompressing Linux... done, booting the kernel.
> ...
> lots of kernel output
> ...
> [    6.306894] sdhci-pltfm: SDHCI platform and OF driver helper
> [    6.335521] ledtrig-cpu: registered to indicate activity on CPUs
> [    6.338465] hidraw: raw HID events driver (C) Jiri Kosina
> [    6.341004] usbcore: registered new interface driver usbhid
> [    6.341768] usbhid: USB HID core driver
> [    6.346873] Initializing XFRM netlink socket
> [    6.348012] NET: Registered protocol family 17
> [    6.350974] Key type dns_resolver registered
> [    6.352810] Registering SWP/SWPB emulation handler
> [    6.360245] registered taskstats version 1
> [    6.374999] vc-sm: Videocore shared memory driver
> [    6.397370] uart-pl011 3f201000.uart: no DMA platform data
> [    6.428165] VFS: Cannot open root device "mmcblk0p2" or unknown-block(0,0): error -6
> [    6.429208] Please append a correct "root=" boot option; here are the available partitions:
> [    6.430848] 0100            4096 ram0  (driver?)
> [    6.431718] 0101            4096 ram1  (driver?)
> [    6.432348] 0102            4096 ram2  (driver?)
> [    6.433101] 0103            4096 ram3  (driver?)
> [    6.434627] 0104            4096 ram4  (driver?)
> [    6.435317] 0105            4096 ram5  (driver?)
> [    6.435995] 0106            4096 ram6  (driver?)
> [    6.436749] 0107            4096 ram7  (driver?)
> [    6.437507] 0108            4096 ram8  (driver?)
> [    6.438159] 0109            4096 ram9  (driver?)
> [    6.438853] 010a            4096 ram10  (driver?)
> [    6.439562] 010b            4096 ram11  (driver?)
> [    6.440193] 010c            4096 ram12  (driver?)
> [    6.440815] 010d            4096 ram13  (driver?)
> [    6.441439] 010e            4096 ram14  (driver?)
> [    6.442065] 010f            4096 ram15  (driver?)
> [    6.443003] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [    6.444949] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.17-v7+ #838
> [    6.445837] Hardware name: BCM2709
> [    6.448200] [<800180c0>] (unwind_backtrace) from [<80013b88>] (show_stack+0x20/0x24)
> [    6.449477] [<80013b88>] (show_stack) from [<80555028>] (dump_stack+0x80/0x98)
> [    6.450490] [<80555028>] (dump_stack) from [<80551540>] (panic+0xa4/0x204)
> [    6.451641] [<80551540>] (panic) from [<80777384>] (mount_block_root+0x1a8/0x260)
> [    6.452802] [<80777384>] (mount_block_root) from [<80777614>] (mount_root+0xec/0x110)
> [    6.453878] [<80777614>] (mount_root) from [<807777a0>] (prepare_namespace+0x168/0x1c8)
> [    6.454982] [<807777a0>] (prepare_namespace) from [<80776f90>] (kernel_init_freeable+0x270/0x2bc)
> [    6.456243] [<80776f90>] (kernel_init_freeable) from [<80550968>] (kernel_init+0x18/0xfc)
> [    6.457378] [<80550968>] (kernel_init) from [<8000f858>] (ret_from_fork+0x14/0x3c)
> [    6.459706] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> 
> I know that in some of my previous attempts (before I contacted you guys), I was able to get similar result. At that time an mmcblk device was listed among the available partitions, but the kernel was unable to mount it.
> 
> I'm having problem to identify the cause (since as I mentioned earlier this is not really my domain).
> I've also tried (without any positive results)
> - mark the boot partition as bootable with fdisk (does not seem to make any difference)
> - use kernel.img instead of kernel7.img (does not provide any kernel printout, but still says that it has an orphaned drive and hangs indefinetly after saying VNC server running)
> - create a image with 'qemu-img create raw jessie.img 4G' and use dd to copy original image into jessie.img file, and the provide qemu with format=raw.
> - make the above qemu-system-arm invocation with -hda 2016-02-09-raspbian-jessie.img instead of -sd
> - make the above qemu-system-arm invocation with -drive file=2016-02-09-raspbian-jessie.img,format=raw,if=sd instead of -sd
> 
> 
> Do you have any suggestions on how to proceed with my troubleshooting?
> Are you able to explain what seems to be the problem (and possible cause)?
> 
> Thank you for your help, really appreciated!
> 
> Best regards
> Mats
> 

Andrew, you might want to update the examples on that wiki: it looks
like with recent changes that "-sd" was temporarily insufficient for
getting a proper instance running.

Maybe you should also add some examples that use the -drive/-device
combo that we canonically support in addition to the sugared -sd/-hda.

Mats: for now, try grabbing the latest qemu master, it fixed a bug with
-sd. :)

> 
> ________________________________________
> From: Andrew Baumann [Andrew.Baumann@microsoft.com]
> Sent: Wednesday, February 24, 2016 7:51 PM
> To: John Snow; Peter Maydell; Mats Malmberg
> Cc: qemu-arm@nongnu.org; QEMU Developers
> Subject: RE: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2
> 
>> From: John Snow [mailto:jsnow@redhat.com]
>> Sent: Wednesday, 24 February 2016 10:28 AM
>> On 02/24/2016 01:04 PM, Andrew Baumann wrote:
>>>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>>>> Sent: Wednesday, 24 February 2016 9:49 AM
>>>>
>>>> On 24 February 2016 at 15:40, Mats Malmberg
>> <mats.malmberg@tritech.se>
>>>> wrote:
>>>>>
>>>>> Hello all!
>>>>>
>>>>> TL;DR : Is the raspi2 machine ready to use? If yes, how do I use it with
>>>>> ordinary rpi distros? If not, what is the best way to emulate raspberry
>>>>> pi 2 via Qemu?
>>>>
>>>> Hi; I've cc'd the main qemu-devel list and Andrew Baumann who
>> contributed
>>>> the rpi2 support. I know there are still some missing pieces to be
>>>> added later but I forget the details.
>>>
>>> There are still a number of missing pieces (including display and USB) which
>> I hope to submit soon, but you should be able to boot Linux with a serial
>> console. Brief instructions are at the end of this page:
>> https://github.com/0xabu/qemu/wiki
>>>
>>> BTW, instead of -hda you need to pass -sd for the image file.
>>>
>>> Cheers,
>>> Andrew
>>>
>>
>> Is it worth changing the default interface for the "raspi2" board to be
>> SD so that "-hda xxxxx" mounts an SD card?
>>
>> Or do we support using that for an imagined S/ATA interface? (BCM2836
>> doesn't have SATA, right?)
> 
> Oh, in fact I am already setting that, so perhaps -hda does already work. Mats' problem is most likely just that he's not seeing/enabling the serial console.
> 
> Andrew
> 
