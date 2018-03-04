Received: by 10.28.91.67 with SMTP id p64csp1226132wmb;
        Sat, 3 Mar 2018 19:55:59 -0800 (PST)
X-Google-Smtp-Source: AG47ELtwIqNwJMpjxwdT1uqDbYZYx6HE2qvijj1EJFCzMwpczgEv98kIxzFcxUPHXslWHE27X0bU
X-Received: by 10.129.133.193 with SMTP id v184mr6897942ywf.4.1520135759443;
        Sat, 03 Mar 2018 19:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520135759; cv=none;
        d=google.com; s=arc-20160816;
        b=cFxDtOST7FXByv0PNBCA4EK39n8IRUX4Wa6wCmmqVGnKJyycOt1RpCAqqUrSXDiJQc
         AYUbS4GQEiNiRor9BsXnk+GXLtguKAc+wRni9VVF4h+SE3gZRP1ZEQiEaLGzSLy3ANI5
         MunaS/AYutPN/FtFBJbUfYVD/nF2Y4h69MJ1ypr8BGpI6FrwE1V1qeACFwO7qjPpxXk+
         sHOYotDnH/PA7Tbmsw3/NMzAPk4Q4YctwMB2rPnuCEg5S8Egn7FKcQvND2/3FtoTKd+D
         BAxk+yzGh2Zg85fIzLxNDfqoLcbEx9Wmd7wND4vtj53lF8E2wZPft0uox1Q9iixDGFSB
         OJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=E9ubworXMBQqQijuqIfCTug2WD0wXqjx5Ipdzs6YmHo=;
        b=a6OzHyMD39kJyGwwSsSPWcPeogV0kXYHCKAeqs0+1n3RcOU7dYxVhLu1MGo0lNtvNl
         jDI2bbVcPrVtl2YvYCrIw0WgjKBYRKtNfOxZJG8h9V2gWhwhyJTUxjl3zpur4iKTWmSv
         WxOC4el38O6wBC5Du6X4yerlUdxq4ht7dtX5b2b8xG/gpg0J8o0LLtP4tG0BPHp+6KBr
         +uCXIog1JcUijqOeAixtdPj4xFAN0eBVC2eepmdxUUTQk1bcs4haAuN6tJCi++MsHgSO
         X1gMmyktpzK1Wx5cNwAXvEFtHIUzAYgAfiG7Rqgvtay+WnnKfZppQ1LXKuF9A/wqHr4t
         jeiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v71-v6si1616579ybv.84.2018.03.03.19.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 19:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esKkg-0007LH-SD
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 22:55:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1esKka-0007Iv-6m
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 22:55:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1esKkV-0000EO-Af
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 22:55:52 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54080 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1esKkV-0000E4-3o; Sat, 03 Mar 2018 22:55:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A681940FB64A;
	Sun,  4 Mar 2018 03:55:43 +0000 (UTC)
Received: from redhat.com (ovpn-120-100.rdu2.redhat.com [10.10.120.100])
	by smtp.corp.redhat.com (Postfix) with SMTP id AB7CC111DCF0;
	Sun,  4 Mar 2018 03:55:40 +0000 (UTC)
Date: Sun, 4 Mar 2018 05:55:40 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180304055334-mutt-send-email-mst@kernel.org>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
	<20180213200450-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
	<20180214000837-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEDDz5ni-+MfQp7dE0x_b51=JwgU-fwS4Y+AkyDyLpxRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqEDDz5ni-+MfQp7dE0x_b51=JwgU-fwS4Y+AkyDyLpxRQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sun, 04 Mar 2018 03:55:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sun, 04 Mar 2018 03:55:43 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: QB13eY1ZSiAN

On Tue, Feb 13, 2018 at 02:47:24PM -0800, Andrey Smirnov wrote:
> On Tue, Feb 13, 2018 at 2:15 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Tue, Feb 13, 2018 at 12:24:40PM -0800, Andrey Smirnov wrote:
> >> On Tue, Feb 13, 2018 at 10:13 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> >> > On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
> >> >> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
> >> >> +{
> >> >> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> >> +
> >> >> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >> >> +
> >> >> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
> >> >> +    k->device_id = 0xABCD;
> >> >> +    k->revision = 0;
> >> >> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
> >> >> +    k->is_express = true;
> >> >> +    k->is_bridge = true;
> >> >> +    k->exit = pci_bridge_exitfn;
> >> >> +    k->realize = designware_pcie_root_realize;
> >> >> +    k->config_read = designware_pcie_root_config_read;
> >> >> +    k->config_write = designware_pcie_root_config_write;
> >> >> +
> >> >> +    dc->reset = pci_bridge_reset;
> >> >> +    /*
> >> >> +     * PCI-facing part of the host bridge, not usable without the
> >> >> +     * host-facing part, which can't be device_add'ed, yet.
> >> >> +     */
> >> >> +    dc->user_creatable = false;
> >> >> +    dc->vmsd = &vmstate_designware_pcie_root;
> >> >> +}
> >> >> +
> >> >> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
> >> >> +                                               unsigned int size)
> >> >> +{
> >> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
> >> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
> >> >> +
> >> >> +    return pci_host_config_read_common(device,
> >> >> +                                       addr,
> >> >> +                                       pci_config_size(device),
> >> >> +                                       size);
> >> >> +}
> >> >> +
> >> >> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
> >> >> +                                            uint64_t val, unsigned int size)
> >> >> +{
> >> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
> >> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
> >> >> +
> >> >> +    return pci_host_config_write_common(device,
> >> >> +                                        addr,
> >> >> +                                        pci_config_size(device),
> >> >> +                                        val, size);
> >> >> +}
> >> >> +
> >> >> +static const MemoryRegionOps designware_pci_mmio_ops = {
> >> >> +    .read       = designware_pcie_host_mmio_read,
> >> >> +    .write      = designware_pcie_host_mmio_write,
> >> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
> >> >> +    .impl = {
> >> >> +        /*
> >> >> +         * Our device would not work correctly if the guest was doing
> >> >> +         * unaligned access. This might not be a limitation on the real
> >> >> +         * device but in practice there is no reason for a guest to access
> >> >> +         * this device unaligned.
> >> >> +         */
> >> >> +        .min_access_size = 4,
> >> >> +        .max_access_size = 4,
> >> >> +        .unaligned = false,
> >> >> +    },
> >> >> +};
> >> >
> >> > Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
> >> > appropriate here?  Most of these cases are plain "we never bothered
> >> > about cross-endian setups". Some are "there's a mix of different
> >> > endian-ness values, need to handle in a special way".
> >> >
> >> > I suspect you really need DEVICE_LITTLE_ENDIAN.
> >> >
> >>
> >> That MemoryRegion corresponds to a register file permanently mapped
> >> into CPU's address space, so my assumption is that SoC designers will
> >> wire it according to CPUs endianness be it big or little. I am not
> >> aware of any big-endian CPU based SoC on the market using Designware's
> >> IP block, so I don't think there are any precedent confirming or
> >> denying correctness of my assumption. IMHO, this is also the reason
> >> why all of Linux driver code for that IP assumes little endianness.
> >
> > IMHO if Linux driver code does cpu_to_le then it seems best to be
> > consistent with that.
> >
> 
> Well, all of the DW code does so implicitly by using readl()/writel()
> helpers which will perform cpu_to_le/le_to_cpu under the hood. But is
> seems to me that it could be either because the access does have to be
> LE always or simply because readl()/writel() are goto memory helpers
> on ARM/LE-platforms.

PCI things generally tend to be LE since that's how standard
PCI registers are defined, and being consistent avoids confusion.

> FWIW: Somewhat similar precedent of MIPS/Boston machine can serve as
> counter-example to my assumption, since Xilinx PCIE IP there seem to
> be wired to be LE despite being attached to BE CPU.
> 
> Thanks,
> Andrey Smirnov

OK so the above seems to imply it really should be LE, right?

-- 
MST
