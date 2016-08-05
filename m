Received: by 10.25.21.156 with SMTP id 28csp1811527lfv;
        Fri, 5 Aug 2016 06:19:45 -0700 (PDT)
X-Received: by 10.55.176.130 with SMTP id z124mr11744167qke.125.1470403185338;
        Fri, 05 Aug 2016 06:19:45 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8si8983650qkl.21.2016.08.05.06.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 06:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVf2O-0006ej-O5
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 09:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVf1W-0005pE-Q6
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 09:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVf1U-0005g2-B4
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 09:18:49 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVf1U-0005fs-4c
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 09:18:48 -0400
Received: by mail-vk0-x22e.google.com with SMTP id n129so190750899vke.3
	for <qemu-devel@nongnu.org>; Fri, 05 Aug 2016 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6mTxFLEsKw8i9nijA6x7Yz7lG4t9cKWBHaAS3cd7aIk=;
	b=NOWkhxY8XMgLgYuXryG85TG8Vv6wn0TcDEJeNJGbj5Ude+13uvgYFC+vC2HbnWnF1P
	Lq6zJ0nEu48e2zpZL45FzM0c1vyLnKKA7p7xhEu4MW8iTx2qR7q63MIthUqGBI96Cz/A
	IPEXUb3kmtNMxLr5BkGIANF8pnoFTwi8Ny9Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6mTxFLEsKw8i9nijA6x7Yz7lG4t9cKWBHaAS3cd7aIk=;
	b=Qacre9ejvzlLx7+UKYJNiCVb7FElr6fPf9sA4sHWgYyja/lS4rvF0xjn2CJDAPz9UW
	H8l96CocZOdDB2P8/2zkzFd1Kdh55x64iazqMhyCw3voRo4eN4kRzQQlS9tFfNb8lZHq
	7IRN9vBGTw2g5bUtjeAx2e0A8svpwDh6E1aZCMwFDJPBPuEcPagErGTaQpBZBpJu7G38
	rQEeHVnl6gbZtj3jypYNr5quc5o5l67idQ+yzf8uW+zsO7PM0vfKlqPnB7pRJ0dg9jo9
	bOwNTfFm0G5BKNsea/a7Yao06EAY2+ULZ+BBSJyKUZkNkLOY9QLLmHMjrDi7PVyc4LUK
	Esww==
X-Gm-Message-State: AEkoouuWJDgGr8LAMZkzAQkf21tBP3GQMGoLYNXG9X86USXaa8v1VUQFE2vVZaZU87wbcSyY5/8z6Qe6HdWu/D9z
X-Received: by 10.31.93.129 with SMTP id r123mr40072739vkb.149.1470403127383; 
	Fri, 05 Aug 2016 06:18:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.41.34 with HTTP; Fri, 5 Aug 2016 06:18:46 -0700 (PDT)
In-Reply-To: <57A46B46.1090703@huawei.com>
References: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
	<20160805082857.GH9933@redhat.com> <57A46A1D.6000608@huawei.com>
	<57A46B46.1090703@huawei.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Fri, 5 Aug 2016 21:18:46 +0800
Message-ID: <CAN76PtTr88=0sPB3j9ZTrUq3SBaXQC1jjNrez9mjuWWs6xDb9Q@mail.gmail.com>
To: Claudio Fontana <claudio.fontana@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
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
X-TUID: RXnPTPTLd2Xs

Hi Claudio,
    Could you tell me what host and guest OS are you using? And the
hardware is 96board or other Hisilicon Server?
    I use SoftIron. 8 cores AArch64 servers.


On 5 August 2016 at 18:32, Claudio Fontana <claudio.fontana@huawei.com>
wrote:

> On 05.08.2016 12:27, Claudio Fontana wrote:
> > Hi,
> >
> > On 05.08.2016 10:28, Daniel P. Berrange wrote:
> >> On Fri, Aug 05, 2016 at 10:23:58AM +0800, Kevin Zhao wrote:
> >>> Hi All,
> >>>      I have a problem may about Qemu and kindly need your help. Does
> >>> qemu-system-aarch64 support virtio-9p ?
> >>>      Recently I have tried to use qemu remapped the file from host to
> >>> guest. As I know, Qemu has supported this so long as guest kernel has
> >>> support 9p(virtfs). Reference to this link:
> >>> http://wiki.qemu.org/Documentation/9psetup
> >>> Fedora 24 AArch64 kernel has supported this:
> >>> [root@sha-win-225 ~]# lsmod | grep 9p
> >>> 9p                     56273  0
> >>> fscache                87449  1 9p
> >>> 9pnet_virtio            9122  0
> >>> 9pnet                  83564  2 9p,9pnet_virtio
> >>> virtio_ring            13866  5 virtio_net,virtio_pci,9pnet_
> >>> virtio,virtio_mmio,virtio_scsi
> >>> virtio                  9467  5 virtio_net,virtio_pci,9pnet_
> >>> virtio,virtio_mmio,virtio_scsi
> >>>
> >>>     Now I use virsh to launch the VM, and the corresponding qemu
> command I
> >>> have pasted here:
> >>> http://paste.openstack.org/show/549225/.
> >>>     You can see that:
> >>> * -fsdev
> >>> local,security_model=mapped,id=fsdev-fs0,path=/var/lib/
> libvirt/images/coreos
> >>> -device
> >>> virtio-9p-pci,id=fs0,fsdev=fsdev-fs0,mount_tag=share,bus=
> pci.2,addr=0x1*
> >>>      Here is the command that remapped the directory from host to
> guest.
> >>> After VM launched, I use the command to mount:
> >>> * mount -t 9p -o trans=virtio share /tmp/shared/
> >>> -oversion=9p2000.L,posixacl,cache=loose*
> >>> But mount command will be blocked and output nothing.
> >>
> >> Try using  version=9p2000.u instead - I've noticed other versions have
> >> been buggy in various kernel version/qemu version combinations. The
> >> 9p2000.u version is what i use in libvirt-sandobx and so I know it will
> >> work in general.
> >
> > We are using version=9p2000.L here with qemu-system-aarch64, and it
> works well.
> > We tested only on qemu-2.5 though.
>
> Forgot to mention though that we backported commit c8225aa1 "virtio-9p:
> use accessor to get thread_pool" though,
> as without it we have experienced crashes.
>
> Ciao, C.
>
>
