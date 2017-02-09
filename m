Received: by 10.25.77.65 with SMTP id a62csp101639lfb;
        Thu, 9 Feb 2017 10:13:37 -0800 (PST)
X-Received: by 10.55.89.196 with SMTP id n187mr4212232qkb.17.1486664017417;
        Thu, 09 Feb 2017 10:13:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k32si8577046qtc.252.2017.02.09.10.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 10:13:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbtDq-0000eH-Px
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 13:13:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cbtDm-0000dy-K0
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 13:13:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cbtDj-0001nf-85
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 13:13:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cbtDj-0001mC-2j; Thu, 09 Feb 2017 13:13:27 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 717ADC0A5174;
	Thu,  9 Feb 2017 18:13:23 +0000 (UTC)
Received: from redhat.com (ovpn-122-115.rdu2.redhat.com [10.10.122.115] (may
	be forged))
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v19IDM8n025976; Thu, 9 Feb 2017 13:13:22 -0500
Date: Thu, 9 Feb 2017 20:13:21 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20170209201301-mutt-send-email-mst@kernel.org>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
	<70829774-a0c4-79ae-2eaf-cfac19e9dd7d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70829774-a0c4-79ae-2eaf-cfac19e9dd7d@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 09 Feb 2017 18:13:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/4] target-arm: Add some omitted dma
 cache coherency flags
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YMeobHT/U0lz

On Thu, Feb 09, 2017 at 02:15:36PM +0100, Laszlo Ersek wrote:
> On 02/09/17 13:53, Alexander Graf wrote:
> > ARM is amazing when it comes to cache coherency and VMs. While any sane
> > architecture allows the host to override the guest's caching attributes,
> > that's very hard to do on ARM.
> > 
> > That means that the guest may directly access guest memory bypassing the
> > cache while QEMU happily writes to / reads from cache. The end result is
> > very nasty, because both sides see very different views of the world.
> >  
> > That means that we need to be very cautious to tell guests that devices
> > that QEMU emulates are going to use data in the cache rather than directly
> > on memory.
> > 
> > We added this to PCI a while back for DT (5d636e21 "hw/arm/virt: mark the PCIe
> > host controller as DMA coherent in the DT") and ACPI (bc64b96 "hw/arm/virt-
> > acpi-build: _CCA attribute is compulsory") but never updated virtio-mmio or
> > fw-cfg in DT or ACPI tables.
> > 
> > This patch set adds the respective cache coherency flags for them in both DT and
> > ACPI.
> > 
> > Fortunately, no guests except for Linux 4.9.7 and 4.9.8 are broken because of
> > this. Upstream realized quickly enough that every user of virtio-mmio out there
> > describes its cache coherency incorrectly and reverted the patch that would
> > require said dma coherency flag. But we should be safe for the future and "do
> > the right thing".
> > 
> > Alexander Graf (4):
> >   target-arm: Declare virtio-mmio as dma-coherent in dt
> >   hw/arm/virt: Declare virtio-mmio as dma cache coherent in ACPI
> >   hw/arm/virt: Declare fwcfg as dma cache coherent in ACPI
> >   hw/arm/virt: Declare fwcfg as dma cache coherent in dt
> > 
> >  hw/arm/vexpress.c        | 1 +
> >  hw/arm/virt-acpi-build.c | 2 ++
> >  hw/arm/virt.c            | 2 ++
> >  3 files changed, 5 insertions(+)
> > 
> 
> Famous last words:
> series
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 
> Should we replicate patch #3 to QEMU0002 / FWCF in
> "hw/i386/acpi-build.c" too? Or is it that we couldn't care less about
> _CCA on x86? :) (Can't really muster the energy right now to look it up
> in the ACPI spec, sorry!)
> 
> Thanks
> Laszlo

ACPI spec says:
On platforms for which existing default cache-coherency behavior of the OS is not adequate, _CCA
enables the OS to adapt to the differences

So I think we don't need it on x86.

-- 
MST
