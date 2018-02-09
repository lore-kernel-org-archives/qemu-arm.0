Received: by 10.28.71.27 with SMTP id u27csp1180454wma;
        Fri, 9 Feb 2018 09:17:01 -0800 (PST)
X-Google-Smtp-Source: AH8x226DlIBXbFtM+6a7fAy7Y9I1MP8Eu8NAIydm+pQrTvl7CvyBd2PwMCiEXq4QsAOSXSM6/aDG
X-Received: by 10.129.145.20 with SMTP id i20mr2445665ywg.258.1518196621099;
        Fri, 09 Feb 2018 09:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518196621; cv=none;
        d=google.com; s=arc-20160816;
        b=nOoK+U1KRZ04vdyOS5lf+89cgoTfoNohWiGv4lfdwWcaWbaK/qKWehjtYotxqkYan1
         S4RA/CshIOxp7m5ePupIzm7yjX9ziT8vwrsVmhyPNKK2Km3Uu8vsS38r8tAQ9fhNDQtl
         ThVserJx6utUPiy6hrPvVsk4HMx6pw9rBkJxx9t+8xaZBxdr5oeD7i8onMrtbWSdupPp
         CnjqMIskHZDZMkLcATXZrXj4ckIFxdVZrjGSvQ9VfLzlTmkqhqEnEd5bgmYbQ744PMAE
         91kuqFzwrWvGmSEZ/QlyyJfOWHdpYIcIuJ0eWhCsJjgLFV4LtTi16uFAzfRSQwIcl2NH
         gy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=YJHxb3B6WEdUhuSM2ATty3LCHsx+h8ZNf4SwRS7PRKI=;
        b=XJXjO/f4SsMc/QT/UpvCHZ8xTbxTOgCdiBk/GgQVRiYxlEQWZJTqgsMgDHV2E7kg67
         3F0xhOQRB3gjpfi7KXefv05oQ7rv1TQJ8H18PKIYQn82kO/Dl9vN7tsDY2W5oh4vwvvf
         LiKwedIEhdfIXD1xlXNEaIY4+LQIGSoBATONrKo0GwMeoORHWFqOdBnwkYWGuGkAenni
         YlTpn7PNpbKcLeWguBgwlp4MCtG2V0JkFKpVMsccKUVEDsZtqgGKvqO2JOmyw/l0GmOM
         KMdJc8NNTkHduhWVoeg5z6gVsbGWhJn/iSfKm9gklu0n12xD9JLIU9d2XqrsFyWIWnAz
         I5WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20si476790ybk.585.2018.02.09.09.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekCIG-0002RH-HL
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:17:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1ekC8J-00025E-6C
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 12:06:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1ekC8G-00073D-15
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 12:06:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1ekC8F-00072i-P1; Fri, 09 Feb 2018 12:06:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B274A3DE44;
	Fri,  9 Feb 2018 17:06:38 +0000 (UTC)
Received: from w520.home (ovpn-117-203.phx2.redhat.com [10.3.117.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECA7A5EE02;
	Fri,  9 Feb 2018 17:06:34 +0000 (UTC)
Date: Fri, 9 Feb 2018 10:06:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20180209100634.7a908eb9@w520.home>
In-Reply-To: <CAMuHMdWaoutP+oFL0Vtw+Z-986_=3wLAu+58N9ZT7t+uZb1ycA@mail.gmail.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-5-git-send-email-geert+renesas@glider.be>
	<20180209085024.004b6f9e@w520.home>
	<CAMuHMdWaoutP+oFL0Vtw+Z-986_=3wLAu+58N9ZT7t+uZb1ycA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Feb 2018 17:06:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kBefYjpoMH96

On Fri, 9 Feb 2018 17:06:34 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Alex,
> 
> On Fri, Feb 9, 2018 at 4:50 PM, Alex Williamson
> <alex.williamson@redhat.com> wrote:
> > On Fri,  9 Feb 2018 16:17:35 +0100
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:  
> >> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
> >>
> >> Add qemu support for the newly introduced VFIO No-IOMMU driver.
> >>
> >> We need to add special handling for:
> >> - Group character device is /dev/vfio/noiommu-$GROUP.
> >> - No-IOMMU does not rely on a memory listener.
> >> - No IOMMU will be set for its group, so no need to call
> >>   vfio_kvm_device_add_group.
> >>
> >> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
> >> [geert: Rebase]
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
> >>  include/hw/vfio/vfio-common.h |  2 ++
> >>  2 files changed, 50 insertions(+), 13 deletions(-)  
> >
> > NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
> > vfio devices with no-iommu (which provide no DMA translation!!!)
> > transparently as if they might actually work like a regular vfio device
> > is absolutely unacceptable.  Without DMA translation and isolation, you
> > might want to think about another interface, I'm not keen on the idea  
> 
> What if the device cannot do DMA?
> 
> There are other devices that cannot do DMA, but that can be useful to
> access from a guest in an embedded system.
> E.g. smart ADC monitor blocks that monitor and average several ADCs in an
> automotive environment (drivers/iio/adc/rcar-gyroadc.c).
> 
> Should all such devices be paravirtualized?

How do we know that a device is not capable of DMA?  The moment we add
no-iommu support generically to QEMU, I get to deal with a swarm of
people trying to use it to assign DMA capable PCI devices to VMs and
failing miserably.  We added no-iommu support because the UIO PCI driver
was under pressure to add support for MSI/X interrupts and we figured
we could at least taint the kernel an give people a path to a more
secure setup with an IOMMU by allowing use of the vfio device
interface.  For PCI, this makes some sense because PCI has architected
interrupts and config space and standard layouts.  What's the value of
vfio over UIO for ad-hoc, non-DMA platform devices?  UIO is intended for
non-DMA devices.  vfio is intended for IOMMU protected, DMA capable
devices.  vfio no-IOMMU is a band-aide that hopefully goes away
eventually.

> > of corrupting vfio support in order to blink some LEDs.  Thanks,  
> 
> This GPIO+LED prototype is just a proof-of-concept. There's no plan to
> upstream it.

If vfio with no-IOMMU is to be used, it must not enable users to
casually assign DMA capable devices.  Certainly any PCI/e device needs
to be assumed to be DMA capable.  I don't know how you tell with
platform devices since there's no standard interface.  Thanks,

Alex
