Received: by 10.28.91.67 with SMTP id p64csp1104823wmb;
        Sat, 3 Mar 2018 16:14:47 -0800 (PST)
X-Google-Smtp-Source: AG47ELteEzeqgn+ATkv8hqJqYef4F8azcu0L8GGzbKmfN+lHWyVuzJRivcsW7eF29gkzKP+y3+Ym
X-Received: by 2002:a25:2586:: with SMTP id l128-v6mr6375389ybl.198.1520122487605;
        Sat, 03 Mar 2018 16:14:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520122487; cv=none;
        d=google.com; s=arc-20160816;
        b=Ai0vLYOkF5aYrgA6GX9kcMSRozfp9HPKNz62jOyQDRsC80bZcJi+wPVoeI2gl4TBIs
         zvRJkuHL3AXDmnsofAjDlC38bfKpCsNrQuRhVcD3TuujJ8LHDfhvKySqP+ocAN1fZUhw
         pm2sQBods4Bc9fvxnoHUb8nId7/Ytc/NdWD8DtjAXMdH8C0IaEUXbkhTwDzaNQYh+aJd
         WG4789+MiC9YkdRCzR+k+NLXf2CTScxaCeQXC1As7WSq/VOOQd/VXLa1biH+cFlbmOfY
         NiYCp463P5d1lV4hIBU1/05NIyIlBIFN2PchsRHrJDUOAaz9B9FXQfnvpxG5r/td2m+F
         gfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Owgg2rna0MD3CzpAnt8gv1AOdpJjAwGrfKV8aBYb7TY=;
        b=qYtmVzLbJwEpZk/CWpbSPeyzJbKX+4j1ATz+BK1WpCJ8dksktO6/zPGZeVPUsdGbVp
         gBlMcZ8UPPYgvE9Vul0Nkj253ZQKQRjLkcUGn7QKiRg/gO+53nrlWcW/jRtnclgaSLpp
         o97RU57NbtFj6859572ybefEH0ktZvNdYjk14sgXDMk3rJ4bwHJk3/R/oHhToWTyynPz
         dUVp2YhsqvvmA5aJYp+/9o1CWqK6HmDsqdFQ4bueH+XUaIX470GJoeuq0/DO95mUUQBZ
         +wv/lQvaA0rbxnog69PSjunkk5yAFJQXhkRgAG9ThQuny7ywAlpV1nvkgdt55MC7SGVE
         BGsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AtRj8x4t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l185-v6si1605840ybf.633.2018.03.03.16.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 16:14:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AtRj8x4t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esHIc-0006xA-UZ
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 19:14:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esHIM-0006uC-90
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 19:14:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esHIL-0000ZV-3S
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 19:14:30 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:42050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1esHIK-0000ZG-Tl; Sat, 03 Mar 2018 19:14:29 -0500
Received: by mail-qk0-x242.google.com with SMTP id b130so16519188qkg.9;
	Sat, 03 Mar 2018 16:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Owgg2rna0MD3CzpAnt8gv1AOdpJjAwGrfKV8aBYb7TY=;
	b=AtRj8x4t0CI0CG6/NsJrALhJkysqE1erSlhtUeh92rkxl6ck6wLQYlGeWB43ZaBmlL
	Sr517Vegfyxz+3YrFxzHBh/XjtFz2boBOJiE9z1k53Q8GEP8gJFjM+5ypNUCR+Hn+IHA
	Au72nk5KBNpTHkYghGMV/UTeUjUV4UBYaDy8PcrvYWJu4WLAW0Mjb6TBQc16+K8HRdI5
	M3Fj0y5JoFI6MBSoZm7NCxvz1Sh1FcdOZQ1vyuVuRCxVds+0xrt0USQcv5IJItuLbHxn
	3UnM2yGbQjuJmazEqdYl0ynogQiEzqQQ9Pv2TW7rygwS73vOKTTEZKeI+kdhILDKna13
	jCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Owgg2rna0MD3CzpAnt8gv1AOdpJjAwGrfKV8aBYb7TY=;
	b=onsS4B+cOgysj19PMBpuygyFn9CvviR4K7c3MVKwzg3vNQAzfu1DVFkHv7FNpiRT+z
	OeDFfkoa8KDWV/cKZImf3ZtGBrhf5MOyU4x+sjlFAfRa2szLXC5rGsBUEw1JqtyccMHk
	iHoJqXdGgJcMUWEiNib66/DoeI9Tf5qFkIMXezCfT2Be7+YlJDP30dyb22Po3/NQpAk/
	iuUwnj3oPoAALZmhdHw96KLY/fBo3n/x//QWLHqhRgZFpCJ2ivENhmWgDXADHY+vhecJ
	0urHGgiOcF+QHpqwR1ET/KZgj4iEdOXjEHkwhccxgmIJ5cRSlwacFVm6CvRCXSv6WzJf
	/G/w==
X-Gm-Message-State: AElRT7F7oRKiJxQ6KnyTsbkBnxpOFyY7sKEHf3juhSxcI5+vETwECNMB
	/l83c7h69IAAi8hfD9zsgysC98VYRM4qKOtg5us=
X-Received: by 10.55.142.71 with SMTP id q68mr15249643qkd.40.1520119556213;
	Sat, 03 Mar 2018 15:25:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.80.146 with HTTP; Sat, 3 Mar 2018 15:25:55 -0800 (PST)
In-Reply-To: <CAHQ1cqEDDz5ni-+MfQp7dE0x_b51=JwgU-fwS4Y+AkyDyLpxRQ@mail.gmail.com>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
	<20180213200450-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
	<20180214000837-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEDDz5ni-+MfQp7dE0x_b51=JwgU-fwS4Y+AkyDyLpxRQ@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Sat, 3 Mar 2018 15:25:55 -0800
Message-ID: <CAHQ1cqGKSJcV5warB_mHUHvikGdAUST-otPUXzHhLwR2KV=SPw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: feUqKn8YcWzZ

On Tue, Feb 13, 2018 at 2:47 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> On Tue, Feb 13, 2018 at 2:15 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Tue, Feb 13, 2018 at 12:24:40PM -0800, Andrey Smirnov wrote:
>>> On Tue, Feb 13, 2018 at 10:13 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
>>> > On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
>>> >> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
>>> >> +{
>>> >> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> >> +
>>> >> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>> >> +
>>> >> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
>>> >> +    k->device_id = 0xABCD;
>>> >> +    k->revision = 0;
>>> >> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
>>> >> +    k->is_express = true;
>>> >> +    k->is_bridge = true;
>>> >> +    k->exit = pci_bridge_exitfn;
>>> >> +    k->realize = designware_pcie_root_realize;
>>> >> +    k->config_read = designware_pcie_root_config_read;
>>> >> +    k->config_write = designware_pcie_root_config_write;
>>> >> +
>>> >> +    dc->reset = pci_bridge_reset;
>>> >> +    /*
>>> >> +     * PCI-facing part of the host bridge, not usable without the
>>> >> +     * host-facing part, which can't be device_add'ed, yet.
>>> >> +     */
>>> >> +    dc->user_creatable = false;
>>> >> +    dc->vmsd = &vmstate_designware_pcie_root;
>>> >> +}
>>> >> +
>>> >> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
>>> >> +                                               unsigned int size)
>>> >> +{
>>> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>>> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>>> >> +
>>> >> +    return pci_host_config_read_common(device,
>>> >> +                                       addr,
>>> >> +                                       pci_config_size(device),
>>> >> +                                       size);
>>> >> +}
>>> >> +
>>> >> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
>>> >> +                                            uint64_t val, unsigned int size)
>>> >> +{
>>> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>>> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>>> >> +
>>> >> +    return pci_host_config_write_common(device,
>>> >> +                                        addr,
>>> >> +                                        pci_config_size(device),
>>> >> +                                        val, size);
>>> >> +}
>>> >> +
>>> >> +static const MemoryRegionOps designware_pci_mmio_ops = {
>>> >> +    .read       = designware_pcie_host_mmio_read,
>>> >> +    .write      = designware_pcie_host_mmio_write,
>>> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>> >> +    .impl = {
>>> >> +        /*
>>> >> +         * Our device would not work correctly if the guest was doing
>>> >> +         * unaligned access. This might not be a limitation on the real
>>> >> +         * device but in practice there is no reason for a guest to access
>>> >> +         * this device unaligned.
>>> >> +         */
>>> >> +        .min_access_size = 4,
>>> >> +        .max_access_size = 4,
>>> >> +        .unaligned = false,
>>> >> +    },
>>> >> +};
>>> >
>>> > Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
>>> > appropriate here?  Most of these cases are plain "we never bothered
>>> > about cross-endian setups". Some are "there's a mix of different
>>> > endian-ness values, need to handle in a special way".
>>> >
>>> > I suspect you really need DEVICE_LITTLE_ENDIAN.
>>> >
>>>
>>> That MemoryRegion corresponds to a register file permanently mapped
>>> into CPU's address space, so my assumption is that SoC designers will
>>> wire it according to CPUs endianness be it big or little. I am not
>>> aware of any big-endian CPU based SoC on the market using Designware's
>>> IP block, so I don't think there are any precedent confirming or
>>> denying correctness of my assumption. IMHO, this is also the reason
>>> why all of Linux driver code for that IP assumes little endianness.
>>
>> IMHO if Linux driver code does cpu_to_le then it seems best to be
>> consistent with that.
>>
>
> Well, all of the DW code does so implicitly by using readl()/writel()
> helpers which will perform cpu_to_le/le_to_cpu under the hood. But is
> seems to me that it could be either because the access does have to be
> LE always or simply because readl()/writel() are goto memory helpers
> on ARM/LE-platforms.
>
> FWIW: Somewhat similar precedent of MIPS/Boston machine can serve as
> counter-example to my assumption, since Xilinx PCIE IP there seem to
> be wired to be LE despite being attached to BE CPU.
>

Michael, Peter:

Just in case we are in an accidental deadlock waiting on each other,
my assumption is that this patch in particular and the rest in the
series are good as is to be applied. Please let me know if any changes
need to be made and I'll submit v7.

Thanks,
Andrey Smirnov
