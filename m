Received: by 10.80.163.71 with SMTP id 65csp223741edn;
        Wed, 28 Sep 2016 00:17:37 -0700 (PDT)
X-Received: by 10.55.45.196 with SMTP id t187mr29931853qkh.2.1475047057459;
        Wed, 28 Sep 2016 00:17:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si4231375qkq.193.2016.09.28.00.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 00:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bp97Y-0001xY-VI
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 03:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pradeepkiruvale@gmail.com>) id 1bp96c-0001PW-V1
	for qemu-devel@nongnu.org; Wed, 28 Sep 2016 03:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pradeepkiruvale@gmail.com>) id 1bp96a-0002Cf-Kb
	for qemu-devel@nongnu.org; Wed, 28 Sep 2016 03:16:37 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pradeepkiruvale@gmail.com>)
	id 1bp96a-0002C4-87; Wed, 28 Sep 2016 03:16:36 -0400
Received: by mail-wm0-x232.google.com with SMTP id b130so54333093wmc.0;
	Wed, 28 Sep 2016 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mZb9l5wMLEKaQqBBRP1yLID8lzgkI5ez1wDmvA+KAMY=;
	b=STH5iRGxjNKilCLuEJxd15r2JBEywCZV5EKhTJR18ls16N6ZXZcKyMio1ucfP4Cpz+
	wtlI/4K+iqS/rkTyO0CvtIuzvVnjLTQvBBFZUyKPZyxLqrwYYU6sQzD3mr6Wb3kKHZgF
	U4jM8e5NsQaFPYwPPowcZ42NzPCnBgPwEnUNqJJVLuFsSFqroLcMK9c4cNH8PCpG+gaS
	yDQAKXYE5M/noz4uM4PaQhCaXyN6ewOyV6SmerJ5aWmrjygHLWOzEtJg2KLiwQAaiPyy
	ZZUgTu3kgSBXmdSbdReATuaPR1QyBSnoHzGhDRj4lZz4IrW4Etbybp0gTyGN65tJSx7h
	E2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mZb9l5wMLEKaQqBBRP1yLID8lzgkI5ez1wDmvA+KAMY=;
	b=QGiR7Km3s8jQwT5bS89fr6Ru+Ir7REp86c03T/QLQy4C+rCTU6N5Y61LVelsxuiMeF
	KVmf5JXqOn6DJuptwyb1IBTazjeRZxQGtub8SV98WJwRge3aGf+36UeBQGG97M4yaeKZ
	oxOTi9RMXlwC1fZUaDyGuNXHvf6Wd9v8IX3h7F9+BAaD5M6ZHR4Z3n44ET7mR5A4KqKW
	I6kjBfaLeGH0cAmEApz/72DzsOORdFxR+cCFsF15dF4wYisBdRHetgqXuzs+/9P1QCCE
	s2ZbrZSTjdkxbPvdF/C0ho9Koaxlq/i8hT46ilu79QdYjYKFoE0A4lBw6KF08gV/2+db
	WRRw==
X-Gm-Message-State: AA6/9Rm7cgCWHnMXu09IhM29rJhjNKktUNHMWba1hWLyaylPl8qhQrD8gx4gQRcHHJW1c051RClP4nw140mL9Q==
X-Received: by 10.28.139.145 with SMTP id n139mr6818517wmd.125.1475046994124; 
	Wed, 28 Sep 2016 00:16:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.158.1 with HTTP; Wed, 28 Sep 2016 00:16:33 -0700 (PDT)
In-Reply-To: <f9aa10e5-0f7a-241d-f772-7c34e7d8c448@gmail.com>
References: <6f7cd004-06b6-0ee5-86bc-082aa593ea64@gmail.com>
	<fcd86bbd-f730-9a52-314e-fb582511673e@gmail.com>
	<f9aa10e5-0f7a-241d-f772-7c34e7d8c448@gmail.com>
From: Pradeep Kiruvale <pradeepkiruvale@gmail.com>
Date: Wed, 28 Sep 2016 09:16:33 +0200
Message-ID: <CAJ2SuLmaK2LOoibPu6uO04kXj5ncgeBz+BeQu=Q6BMC1Zia7pw@mail.gmail.com>
To: "mar.krzeminski" <mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] 9p as rootfs
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxCqlEcr5n8f

Hi Marcin,

Hope you have compiled the qemu with virtfs enabled.i.e --enable-virtfs

And the cli looks like this.  But I am working on x86 not ARM.

-fsdev local,id=root,path=${ROOTFS},security_model=none,writeout=immediate
-device virtio-9p-pci,fsdev=root,mount_tag=/dev/root

-Regards,
Pradeep


On 27 September 2016 at 21:33, mar.krzeminski <mar.krzeminski@gmail.com>
wrote:

> So for some reason kernel expect that 9pfs channel will be named /dev/root
> (root= seem to be ignored).
> Working command line:
>
> Kernel: /root=/dev/root rootfstype=9p rootflags=trans=virtio rw/
> Qemu: /-device virtio-9p-device,fsdev=host_fs,mount_tag=/dev/root -fsdev
> local,id=host_fs,security_model=none,path=////work/rootfs/
> /
> Thanks,
> Marcin/
> /
> W dniu 23.09.2016 o 21:41, mar.krzeminski pisze:
>
> And most important, while mounting as roots, error is:
>>
>> [    1.086235] device: '9p-1': device_add
>> [    1.087859] 9pnet_virtio: no channels available
>> [    1.091619] device: '9p-1': device_unregister
>> [    1.092783] device: '9p-1': device_create_release
>> [    1.093534] VFS: Cannot open root device "host" or unknown-block(0,0):
>> error -2
>>
>> Thanks,
>> Marcin
>>
>> W dniu 23.09.2016 o 21:38, mar.krzeminski pisze:
>>
>>> Hello,
>>>
>>> I have a problem in my custom arm machine to use 9p fs as a rootfs.
>>>
>>> 9p command line i qemu:
>>>
>>> /-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs -fsdev
>>> local,id=host_fs,security_model=none,path=/work/rootfs/
>>>
>>> Kernel cmd line:
>>>
>>> /--append "root=hostfs rootfstype=9p rootflags=trans=virtio noinitrd
>>> console=ttyS3,115200"
>>>
>>> /Device tree entry:
>>>
>>> /        virtio: virtio_mmio@ff0a4000 {//
>>> //            compatible = "virtio,mmio";//
>>> //            reg = <0xff0a4000 0x200>;//
>>> //            interrupts = <0 72 1>;//
>>> //            status = "okay";//
>>> //        };
>>>
>>>
>>> / I can mount this fs from kernel using fstab entry:
>>> /hostfs               /mnt/host            9p trans=virtio          0  0
>>>
>>> /Do you have any idea what am I doing wrong?
>>>
>>> Thanks,
>>> Marcin/
>>> /
>>>
>>
>>
>
