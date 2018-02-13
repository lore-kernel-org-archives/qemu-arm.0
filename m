Received: by 10.28.71.27 with SMTP id u27csp105015wma;
        Tue, 13 Feb 2018 14:47:40 -0800 (PST)
X-Google-Smtp-Source: AH8x226d1JBDZZCRKVQQbF6xHk45GCTiSPQRw15Obvayq2j25dYLjbIuuwO7CAqt1z2hAOwPjd8J
X-Received: by 10.129.155.2 with SMTP id s2mr1904160ywg.219.1518562060879;
        Tue, 13 Feb 2018 14:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518562060; cv=none;
        d=google.com; s=arc-20160816;
        b=cDN23MnWZL62RygSPMz1IuQ0U9lQS6TcdoKBrVYRM1CMetsq/w+N56SLMmVQ7+i7wz
         nG+P74EQIj+xoyMOqSC33Cm63LzlITDjKRAqLGNx0XzjdG63L+KBwJtpaMO2uhnmomSH
         vgq/PJq22VGaGGxKz7uJQBgfy0wZPWPtyNOZ0Y+MxIuCbSPaxgwCCqN9MUk/vsPmdg6Q
         fNk2dtLG/oPkM4kNbPNZ9/wcg5H7vnvoR2sk6a4E7ybrCSfbUx2cllHuVS67I3mK1Gd7
         QwTZyLRawmrQPVnjrKKTJwU6yMzsSJYBBmqaCe4V/G/XIiFmwAclou+1gUCQV9tYy7SU
         hC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1l58liQhVEoTBQfhZIKn/V1bFN1e0jrZ4DrGgzflPG4=;
        b=C8Xr7wRgo7U43ThpVt9jBS29E6X4+iGa8dsxkT/cFcNzjwRHx/VKtHi5ZG6oJQvS1Z
         RplTqYavYWYXYZpb16qG1cEp+CKScVf+crbZeL1MwJ5+vQ2haRGQyQBABQFh96juwkeo
         zsOygaAA+A0vwMqbrxp2REGggoKbQDXORXTGXIiSmJTO1pCP1FV1EsyUwyH8MEstIm3C
         P6Eycr0EQSrXOs52imbxltATTYqW5dlx2hWv4f7HB2z5RXMT2BajbGu6Kd+kfyRrL7vt
         F5Rf7yPAmSlS1taPH8vL/NATNTI+7XsypIsY36lrhkMrT7B0vEnGSED1zKb89upBEYhs
         7hBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VKg15hUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si2053269ybm.751.2018.02.13.14.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 14:47:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VKg15hUF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eljMS-0005qK-5P
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 17:47:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eljMF-0005pf-6A
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 17:47:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eljME-0001ZV-6B
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 17:47:27 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eljME-0001ZD-1V; Tue, 13 Feb 2018 17:47:26 -0500
Received: by mail-qk0-x243.google.com with SMTP id 15so24439185qkl.3;
	Tue, 13 Feb 2018 14:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1l58liQhVEoTBQfhZIKn/V1bFN1e0jrZ4DrGgzflPG4=;
	b=VKg15hUF3n9Pcqifci8HCid094tajOli7MhDPDURbRCUQaAE6ua52R0moFqpV5QXyT
	/7HlXcHJ0CllPVJvPkC9DRPWuBM2KYPeqEMEEx8JudTEXbV0+nx0jmHN4xi1JSHPIIb2
	EnERDyolIadxcF/VbySmWymOj3QvSSw3U3mszpOr0R9YtOO1k8rDRmce/T4T6QRaO7d8
	c7kAUP+DNmtScwzAeJhEQ+6QlXmZy85f9IloibY2b9n6oSCYS914fDJV7CbEUyARSXQD
	OmBwH1K7IUhxc6D0DltzVAZZoMz80zpeY7BjXv2nrX1l29G2rmtev1QnzBYXSZsVMLLV
	U44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1l58liQhVEoTBQfhZIKn/V1bFN1e0jrZ4DrGgzflPG4=;
	b=ryg9GfHgmkWCEa+WYBOTlWV23hPO85E5wkcKmhig6tIVXKMgAjPyzCtWmMd3cTxItN
	iV0P6zWI7fNwBYcuPCsRF8iR7/EAIxbpMk/H7O2J5nlTtNedP9FWtmGSaLWsNZ+9uTqg
	Ii8qfRTDUvas+qV0hK2NfPKpxYXNWv1Q6XWkqqhU2NLlGB5Moh1edTohxkcmoyO3G8w8
	4pKAMi6ryRKPMn6RPaPkOkatQtvRSfFT1fyt97qOSY557YV3Scv7LJuyn1SvA9Lk0r1t
	UKgCkBZGEExaZvBuaEV8YdBms/LrZHR6JB2CoqVR3ImqGHS9Jt35aDcByCpnmFFNk1S8
	jUQQ==
X-Gm-Message-State: APf1xPD5wD4gZYYDcBB/Q9hzaYFan80Flf/f0xlyCHo8C/QUgczAnSq/
	AXueF1KsP11wmZMEBm8uWblJ4QHKyBD31GwGvuw=
X-Received: by 10.55.203.67 with SMTP id d64mr4387840qkj.210.1518562045189;
	Tue, 13 Feb 2018 14:47:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Tue, 13 Feb 2018 14:47:24 -0800 (PST)
In-Reply-To: <20180214000837-mutt-send-email-mst@kernel.org>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
	<20180213200450-mutt-send-email-mst@kernel.org>
	<CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
	<20180214000837-mutt-send-email-mst@kernel.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 13 Feb 2018 14:47:24 -0800
Message-ID: <CAHQ1cqEDDz5ni-+MfQp7dE0x_b51=JwgU-fwS4Y+AkyDyLpxRQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
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
X-TUID: uR7jXC14KBsT

On Tue, Feb 13, 2018 at 2:15 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Tue, Feb 13, 2018 at 12:24:40PM -0800, Andrey Smirnov wrote:
>> On Tue, Feb 13, 2018 at 10:13 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
>> > On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
>> >> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
>> >> +{
>> >> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> >> +
>> >> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> >> +
>> >> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
>> >> +    k->device_id = 0xABCD;
>> >> +    k->revision = 0;
>> >> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
>> >> +    k->is_express = true;
>> >> +    k->is_bridge = true;
>> >> +    k->exit = pci_bridge_exitfn;
>> >> +    k->realize = designware_pcie_root_realize;
>> >> +    k->config_read = designware_pcie_root_config_read;
>> >> +    k->config_write = designware_pcie_root_config_write;
>> >> +
>> >> +    dc->reset = pci_bridge_reset;
>> >> +    /*
>> >> +     * PCI-facing part of the host bridge, not usable without the
>> >> +     * host-facing part, which can't be device_add'ed, yet.
>> >> +     */
>> >> +    dc->user_creatable = false;
>> >> +    dc->vmsd = &vmstate_designware_pcie_root;
>> >> +}
>> >> +
>> >> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
>> >> +                                               unsigned int size)
>> >> +{
>> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>> >> +
>> >> +    return pci_host_config_read_common(device,
>> >> +                                       addr,
>> >> +                                       pci_config_size(device),
>> >> +                                       size);
>> >> +}
>> >> +
>> >> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
>> >> +                                            uint64_t val, unsigned int size)
>> >> +{
>> >> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>> >> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>> >> +
>> >> +    return pci_host_config_write_common(device,
>> >> +                                        addr,
>> >> +                                        pci_config_size(device),
>> >> +                                        val, size);
>> >> +}
>> >> +
>> >> +static const MemoryRegionOps designware_pci_mmio_ops = {
>> >> +    .read       = designware_pcie_host_mmio_read,
>> >> +    .write      = designware_pcie_host_mmio_write,
>> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> >> +    .impl = {
>> >> +        /*
>> >> +         * Our device would not work correctly if the guest was doing
>> >> +         * unaligned access. This might not be a limitation on the real
>> >> +         * device but in practice there is no reason for a guest to access
>> >> +         * this device unaligned.
>> >> +         */
>> >> +        .min_access_size = 4,
>> >> +        .max_access_size = 4,
>> >> +        .unaligned = false,
>> >> +    },
>> >> +};
>> >
>> > Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
>> > appropriate here?  Most of these cases are plain "we never bothered
>> > about cross-endian setups". Some are "there's a mix of different
>> > endian-ness values, need to handle in a special way".
>> >
>> > I suspect you really need DEVICE_LITTLE_ENDIAN.
>> >
>>
>> That MemoryRegion corresponds to a register file permanently mapped
>> into CPU's address space, so my assumption is that SoC designers will
>> wire it according to CPUs endianness be it big or little. I am not
>> aware of any big-endian CPU based SoC on the market using Designware's
>> IP block, so I don't think there are any precedent confirming or
>> denying correctness of my assumption. IMHO, this is also the reason
>> why all of Linux driver code for that IP assumes little endianness.
>
> IMHO if Linux driver code does cpu_to_le then it seems best to be
> consistent with that.
>

Well, all of the DW code does so implicitly by using readl()/writel()
helpers which will perform cpu_to_le/le_to_cpu under the hood. But is
seems to me that it could be either because the access does have to be
LE always or simply because readl()/writel() are goto memory helpers
on ARM/LE-platforms.

FWIW: Somewhat similar precedent of MIPS/Boston machine can serve as
counter-example to my assumption, since Xilinx PCIE IP there seem to
be wired to be LE despite being attached to BE CPU.

Thanks,
Andrey Smirnov
