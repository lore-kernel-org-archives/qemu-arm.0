Received: by 10.25.21.156 with SMTP id 28csp1701393lfv;
        Fri, 5 Aug 2016 02:07:54 -0700 (PDT)
X-Received: by 10.200.56.253 with SMTP id g58mr11474809qtc.28.1470388074522;
        Fri, 05 Aug 2016 02:07:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si8352205qkf.251.2016.08.05.02.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 02:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVb6f-00013i-SI
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 05:07:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bVaV9-00069b-NH
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 04:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bVaV8-0003E9-ED
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 04:29:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bVaV3-00039t-Fm; Fri, 05 Aug 2016 04:29:01 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE97761E4D;
	Fri,  5 Aug 2016 08:29:00 +0000 (UTC)
Received: from redhat.com (vpn1-7-88.ams2.redhat.com [10.36.7.88])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u758Svx3028945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 5 Aug 2016 04:28:59 -0400
Date: Fri, 5 Aug 2016 09:28:57 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Kevin Zhao <kevin.zhao@linaro.org>
Message-ID: <20160805082857.GH9933@redhat.com>
References: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 05 Aug 2016 08:29:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJVsdKt+Epcn

On Fri, Aug 05, 2016 at 10:23:58AM +0800, Kevin Zhao wrote:
> Hi All,
>      I have a problem may about Qemu and kindly need your help. Does
> qemu-system-aarch64 support virtio-9p ?
>      Recently I have tried to use qemu remapped the file from host to
> guest. As I know, Qemu has supported this so long as guest kernel has
> support 9p(virtfs). Reference to this link:
> http://wiki.qemu.org/Documentation/9psetup
> Fedora 24 AArch64 kernel has supported this:
> [root@sha-win-225 ~]# lsmod | grep 9p
> 9p                     56273  0
> fscache                87449  1 9p
> 9pnet_virtio            9122  0
> 9pnet                  83564  2 9p,9pnet_virtio
> virtio_ring            13866  5 virtio_net,virtio_pci,9pnet_
> virtio,virtio_mmio,virtio_scsi
> virtio                  9467  5 virtio_net,virtio_pci,9pnet_
> virtio,virtio_mmio,virtio_scsi
> 
>     Now I use virsh to launch the VM, and the corresponding qemu command I
> have pasted here:
> http://paste.openstack.org/show/549225/.
>     You can see that:
> * -fsdev
> local,security_model=mapped,id=fsdev-fs0,path=/var/lib/libvirt/images/coreos
> -device
> virtio-9p-pci,id=fs0,fsdev=fsdev-fs0,mount_tag=share,bus=pci.2,addr=0x1*
>      Here is the command that remapped the directory from host to guest.
> After VM launched, I use the command to mount:
> * mount -t 9p -o trans=virtio share /tmp/shared/
> -oversion=9p2000.L,posixacl,cache=loose*
> But mount command will be blocked and output nothing.

Try using  version=9p2000.u instead - I've noticed other versions have
been buggy in various kernel version/qemu version combinations. The
9p2000.u version is what i use in libvirt-sandobx and so I know it will
work in general.

>      The Qemu version is QEMU emulator version 2.5.0 (Debian
> 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the same
> problem in Debian jessie.
>       Kindly need your help~You will be really appreciated.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|
