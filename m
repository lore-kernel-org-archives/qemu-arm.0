Received: by 10.28.91.67 with SMTP id p64csp1228259wmb;
        Sat, 3 Mar 2018 20:00:20 -0800 (PST)
X-Google-Smtp-Source: AG47ELuAAq2eOlWImINCYEhy2SKsLfW0ygoJPoncMmGKgh2KD8l5kWnSbZtjeVk2pYwt2sqQYCR1
X-Received: by 10.129.178.68 with SMTP id q65mr7044347ywh.148.1520136020087;
        Sat, 03 Mar 2018 20:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520136020; cv=none;
        d=google.com; s=arc-20160816;
        b=hehKwIbmE1WUyx6yIhgpBV3M1862Nfq/3u5/tYPB4M7aTPO/wIo2llJ5Zdu6lPK5mx
         PnEYtXSahq/ll1WWlvjunURlN0qbRmRxGFiHsekhRRzqFGTjEM+VUH4InYkaCXidT+Xf
         K1kl5abMLjcv7+pcsnesHr8Q7J9+j4sI0IwgSJj8ypIaarl00IQvm/HQx+5sALVrEbD1
         aTf7z9QUHx5/3poQnL8ZvuYeDPuW1dIN6wH/oRk64qKFfV7BqkgLJkAFfxKzjkoNtuaW
         VXxJudUqmgS7bAvyaMoJATo5KiBRZ2Q027QrYc7aCQVyTBDxMrtHNz3q8ws6uABV9Xxu
         E3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZqsnDl4oiZawHIftmA8mnq6CYkxwNiiuOk+5qJ4KSOk=;
        b=SxMMa3CVOWugOTMBs7G1qA8al8peWV3vKc7glSuk5BPRMAM5rSSihM65r7svuH33wt
         Ybh/Z+ErRgph07hKBeuZ7cO2a00lHBrhJu3k+EMT4GCfzTPxmAF16xvkL8PLoXL4aSF8
         I9+qjlvZR0zin4zjGkeH8lOcFgQPOra6o+wJGWHxrdEMQU2Ptv3lEWy7yoXyNo9YKwP5
         VidpcjvNAsI9aTFGLLW2haaPRnZG/XczAqTpSFOm79LB/KF9DJQEqyHvnmmic9596rb6
         /F9TdNVUZu7kRuX3b8ZNk5Q71Yr2mSdGjpv+V+cm23tdifpOqti98qpXfGa/UH2Nybko
         jJDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VduoHso+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x126-v6si1639286ybx.514.2018.03.03.20.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 20:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VduoHso+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esKot-0000J0-Fj
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 23:00:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esKoh-0000Ej-Jx
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 23:00:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esKog-0001do-HB
	for qemu-arm@nongnu.org; Sat, 03 Mar 2018 23:00:07 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1esKog-0001di-Bk; Sat, 03 Mar 2018 23:00:06 -0500
Received: by mail-qt0-x241.google.com with SMTP id n12so16660550qtl.5;
	Sat, 03 Mar 2018 20:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZqsnDl4oiZawHIftmA8mnq6CYkxwNiiuOk+5qJ4KSOk=;
	b=VduoHso+CmFgQHJ70YgW+OPxaXdwyRXQmC8DRd5DYfWRmRBr+Ld+E1LqHqodel/Cd7
	Es4lPTErPI/ljH2p1VCST7uVWoGxGjEPZCsAjVCv2qJ01YbWUqlZMHA6qdLXedwmi5HP
	Lcx2mroCILsf0ANwGPEoiMfsfHR7Aue80K5U+YbJ3MuTWWdMtWdV7bnApjziB668gWM7
	rh2l0KlzlwArWm1gwWihSWTzhY9wIxzPa8zZyOK+9CBSu0X887ZGvaY1wxAFhjKBxbo0
	bnO3Ikr36x54ZNvV5N1ujLT1ywZQCfLeV7WZfgP808WU/i+ZwE4MbX/uW1zO/y1aPnaO
	ZSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZqsnDl4oiZawHIftmA8mnq6CYkxwNiiuOk+5qJ4KSOk=;
	b=sG1xct1ECoOJtX/YP1jxYcl0sSc+JUrsDhFEn82tTJVKy59UOcsZMOGA8NHTNNXjy7
	3FiRW3XARyld3R8gF7tztBO3C9GvfsHKZFGIn6Svcim3RLM4UzXPs6C6XcimUNWtxw3W
	sFio//Os2gAEa27b9dLsbm1XW5C+t5v5UZPmVCSzBTHisx+9R30UfFykJi4cvpKmsMwN
	l3icg6n5q/30IRUBvLBQePEYqjDkEgrvfFpUWjEfuoliA9ahnglw/V5oko/ERHKZgREi
	SwMx2rAfidp+6pePdbxYO7nVyM/vHgy9y/SJQte6IE89+ti4/lmAl0WV0nAfrqjy5Twh
	/A3g==
X-Gm-Message-State: AElRT7GVMxieaPbnA98jqzjNlQty1tA2mz7fe3vleEpfcpC1XYWfWWx9
	oEzHq2wdcg1N6mkq5BovZ7ysoqMDRibr1O0V1L0=
X-Received: by 10.200.49.226 with SMTP id i31mr16453867qte.42.1520136005469;
	Sat, 03 Mar 2018 20:00:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.80.146 with HTTP; Sat, 3 Mar 2018 20:00:04 -0800 (PST)
In-Reply-To: <20180304055334-mutt-send-email-mst@kernel.org>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
	<20180213200450-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
	<20180214000837-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEDDz5ni-+MfQp7dE0x_b51=JwgU-fwS4Y+AkyDyLpxRQ@mail.gmail.com>
	<20180304055334-mutt-send-email-mst@kernel.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Sat, 3 Mar 2018 20:00:04 -0800
Message-ID: <CAHQ1cqFfHP=CWZ81=ki7UREpsPS+qBFUmwq9ggrvFj5uBzd1MA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
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
X-TUID: Wnm0OnYAKjw2

On Sat, Mar 3, 2018 at 7:55 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Tue, Feb 13, 2018 at 02:47:24PM -0800, Andrey Smirnov wrote:
>> On Tue, Feb 13, 2018 at 2:15 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
>> > On Tue, Feb 13, 2018 at 12:24:40PM -0800, Andrey Smirnov wrote:
>> >> On Tue, Feb 13, 2018 at 10:13 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
>> >> > On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
>> >> >> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
>> >> >> +{
>> >> >> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> >> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> >> >> +
>> >> >> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> >> >> +
>> >> >> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
>> >> >> +    k->device_id = 0xABCD;
>> >> >> +    k->revision = 0;
>> >> >> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
>> >> >> +    k->is_express = true;
>> >> >> +    k->is_bridge = true;
>> >> >> +    k->exit = pci_bridge_exitfn;
>> >> >> +    k->realize = designware_pcie_root_realize;
>> >> >> +    k->config_read = designware_pcie_root_config_read;
>> >> >> +    k->config_write = designware_pcie_root_config_write;
>> >> >> +
>> >> >> +    dc->reset = pci_bridge_reset;
>> >> >> +    /*
>> >> >> +     * PCI-facing part of the host bridge, not usable without the
>> >> >> +     * host-facing part, which can't be device_add'ed, yet.
>> >> >> +     */
>> >> >> +    dc->user_creatable = false;
>> >> >> +    dc->vmsd = &vmstate_designware_pcie_root;
>> >> >> +}
>> >> >> +
>> >> >> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
>> >> >> +                                               unsigned int size)
>> >> >> +{
>> >> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>> >> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>> >> >> +
>> >> >> +    return pci_host_config_read_common(device,
>> >> >> +                                       addr,
>> >> >> +                                       pci_config_size(device),
>> >> >> +                                       size);
>> >> >> +}
>> >> >> +
>> >> >> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
>> >> >> +                                            uint64_t val, unsigned int size)
>> >> >> +{
>> >> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>> >> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>> >> >> +
>> >> >> +    return pci_host_config_write_common(device,
>> >> >> +                                        addr,
>> >> >> +                                        pci_config_size(device),
>> >> >> +                                        val, size);
>> >> >> +}
>> >> >> +
>> >> >> +static const MemoryRegionOps designware_pci_mmio_ops = {
>> >> >> +    .read       = designware_pcie_host_mmio_read,
>> >> >> +    .write      = designware_pcie_host_mmio_write,
>> >> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> >> >> +    .impl = {
>> >> >> +        /*
>> >> >> +         * Our device would not work correctly if the guest was doing
>> >> >> +         * unaligned access. This might not be a limitation on the real
>> >> >> +         * device but in practice there is no reason for a guest to access
>> >> >> +         * this device unaligned.
>> >> >> +         */
>> >> >> +        .min_access_size = 4,
>> >> >> +        .max_access_size = 4,
>> >> >> +        .unaligned = false,
>> >> >> +    },
>> >> >> +};
>> >> >
>> >> > Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
>> >> > appropriate here?  Most of these cases are plain "we never bothered
>> >> > about cross-endian setups". Some are "there's a mix of different
>> >> > endian-ness values, need to handle in a special way".
>> >> >
>> >> > I suspect you really need DEVICE_LITTLE_ENDIAN.
>> >> >
>> >>
>> >> That MemoryRegion corresponds to a register file permanently mapped
>> >> into CPU's address space, so my assumption is that SoC designers will
>> >> wire it according to CPUs endianness be it big or little. I am not
>> >> aware of any big-endian CPU based SoC on the market using Designware's
>> >> IP block, so I don't think there are any precedent confirming or
>> >> denying correctness of my assumption. IMHO, this is also the reason
>> >> why all of Linux driver code for that IP assumes little endianness.
>> >
>> > IMHO if Linux driver code does cpu_to_le then it seems best to be
>> > consistent with that.
>> >
>>
>> Well, all of the DW code does so implicitly by using readl()/writel()
>> helpers which will perform cpu_to_le/le_to_cpu under the hood. But is
>> seems to me that it could be either because the access does have to be
>> LE always or simply because readl()/writel() are goto memory helpers
>> on ARM/LE-platforms.
>
> PCI things generally tend to be LE since that's how standard
> PCI registers are defined, and being consistent avoids confusion.
>
>> FWIW: Somewhat similar precedent of MIPS/Boston machine can serve as
>> counter-example to my assumption, since Xilinx PCIE IP there seem to
>> be wired to be LE despite being attached to BE CPU.
>>
>> Thanks,
>> Andrey Smirnov
>
> OK so the above seems to imply it really should be LE, right?
>

Sure, I'll change the endianness and submit v7.

Thanks,
Andrey Smrinov
