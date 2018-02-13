Received: by 10.28.71.27 with SMTP id u27csp79123wma;
        Tue, 13 Feb 2018 14:16:25 -0800 (PST)
X-Google-Smtp-Source: AH8x227dAjiH3OPEipX2XrwtZvYy1mY925pUDket3c9TiyQqlxVpWwm2vY2EnbcKxKEKqJIkuK67
X-Received: by 10.37.9.82 with SMTP id u18mr1848847ybm.288.1518560185215;
        Tue, 13 Feb 2018 14:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518560185; cv=none;
        d=google.com; s=arc-20160816;
        b=ksVVsqVUOT+oNmEdsHvxcWtFfD45cwlBMzUMC+fNfpdeMC8+RCBU1ALwgU+Igc7iG5
         F7RlJ7BRjhifWXV5C2cZOplMC2vyzCPLMWaYdsP2ZItSFUcdHPS0AqGh4br3eE1TTl3q
         1lbFU+LNki8W0aZLY3/l1ERpNWC2dcf/KLazKo+I3WDPHLefpafTn4GtAK4qiI5dz4bu
         xNFCTJTqEg6RPPt2PP2dC463h72zPYGY+GkOZl9Q2/z0m+i10PHSyER+rjciob0EaVJm
         n9cOypSAPFLz8DL1X5fSdjuMekKlBi8aUlyrT+LivwR3yo0iaqliG2cTUDyINKIpDV9H
         3E/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=8H72+nzrYIIoCgYAERYOpsP+oqDRMP2zLZj49gLKWBc=;
        b=XjGukvEAoJiKwxUK2ptIZgZyrEsD1BvP5QQkLOVF8536wKTRuj8UQxvsjI2EXRKN4D
         o1bW3jeOBWQ8U7A5jZyoGnVLNcWzAHiKW4pvLNpfaI2u0vybILVCALLiuy91/0OxzaMU
         ZXaSX6fNtDOey0Zc99GOowattovG3EZP2mKP6a/rNk8sq8lJfdgUdSYX9e88PgA/uoPr
         emz4f+JLEJirKz+IBW0r37YUbOqFXgZGiqlAlBdT39EkU9XP1WsrMP6dknIn4czhvro1
         R/l1TeXT3GxzeJZaQXERnokiyQ6EX/w2TQJmn/FcegxRYHfF1vVRymbfB1sxOiAsd+fw
         tYBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si966050ywa.465.2018.02.13.14.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 14:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elisC-0000bO-LF
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 17:16:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1elis1-0000aJ-LH
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 17:16:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1elirx-0000BM-KQ
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 17:16:13 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46888 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1elirx-0000BA-Eo; Tue, 13 Feb 2018 17:16:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04AE2402291E;
	Tue, 13 Feb 2018 22:15:59 +0000 (UTC)
Received: from redhat.com (ovpn-125-92.rdu2.redhat.com [10.10.125.92])
	by smtp.corp.redhat.com (Postfix) with SMTP id 3F28B215671B;
	Tue, 13 Feb 2018 22:15:52 +0000 (UTC)
Date: Wed, 14 Feb 2018 00:15:52 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180214000837-mutt-send-email-mst@kernel.org>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
	<20180213200450-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 13 Feb 2018 22:15:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 13 Feb 2018 22:15:59 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v6 1/3] pci: Add support for Designware IP
 block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EHxG7v2fCw2

On Tue, Feb 13, 2018 at 12:24:40PM -0800, Andrey Smirnov wrote:
> On Tue, Feb 13, 2018 at 10:13 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
> >> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
> >> +{
> >> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> +
> >> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >> +
> >> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
> >> +    k->device_id = 0xABCD;
> >> +    k->revision = 0;
> >> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
> >> +    k->is_express = true;
> >> +    k->is_bridge = true;
> >> +    k->exit = pci_bridge_exitfn;
> >> +    k->realize = designware_pcie_root_realize;
> >> +    k->config_read = designware_pcie_root_config_read;
> >> +    k->config_write = designware_pcie_root_config_write;
> >> +
> >> +    dc->reset = pci_bridge_reset;
> >> +    /*
> >> +     * PCI-facing part of the host bridge, not usable without the
> >> +     * host-facing part, which can't be device_add'ed, yet.
> >> +     */
> >> +    dc->user_creatable = false;
> >> +    dc->vmsd = &vmstate_designware_pcie_root;
> >> +}
> >> +
> >> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
> >> +                                               unsigned int size)
> >> +{
> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
> >> +
> >> +    return pci_host_config_read_common(device,
> >> +                                       addr,
> >> +                                       pci_config_size(device),
> >> +                                       size);
> >> +}
> >> +
> >> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
> >> +                                            uint64_t val, unsigned int size)
> >> +{
> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
> >> +
> >> +    return pci_host_config_write_common(device,
> >> +                                        addr,
> >> +                                        pci_config_size(device),
> >> +                                        val, size);
> >> +}
> >> +
> >> +static const MemoryRegionOps designware_pci_mmio_ops = {
> >> +    .read       = designware_pcie_host_mmio_read,
> >> +    .write      = designware_pcie_host_mmio_write,
> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
> >> +    .impl = {
> >> +        /*
> >> +         * Our device would not work correctly if the guest was doing
> >> +         * unaligned access. This might not be a limitation on the real
> >> +         * device but in practice there is no reason for a guest to access
> >> +         * this device unaligned.
> >> +         */
> >> +        .min_access_size = 4,
> >> +        .max_access_size = 4,
> >> +        .unaligned = false,
> >> +    },
> >> +};
> >
> > Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
> > appropriate here?  Most of these cases are plain "we never bothered
> > about cross-endian setups". Some are "there's a mix of different
> > endian-ness values, need to handle in a special way".
> >
> > I suspect you really need DEVICE_LITTLE_ENDIAN.
> >
> 
> That MemoryRegion corresponds to a register file permanently mapped
> into CPU's address space, so my assumption is that SoC designers will
> wire it according to CPUs endianness be it big or little. I am not
> aware of any big-endian CPU based SoC on the market using Designware's
> IP block, so I don't think there are any precedent confirming or
> denying correctness of my assumption. IMHO, this is also the reason
> why all of Linux driver code for that IP assumes little endianness.

IMHO if Linux driver code does cpu_to_le then it seems best to be
consistent with that.

> I can't say that I testing this code against a big-endian guest/CPU,
> but that is primarily due to the fact that there's no real use case
> and any test set up I can put toghere would be a contrived example
> pointlessly proving my point.
> 
> Anyway, I am more than happy to switch it to use DEVICE_LITTLE_ENDIAN,
> I just don't know if doing so is any more justified than keeping it
> DEVICE_NATIVE_ENDIAN.
> 
> Thanks,
> Andrey Smirnov

I agree it's probably not critical for a target-specific device.

-- 
MST
