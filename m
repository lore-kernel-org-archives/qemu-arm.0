Received: by 10.28.71.27 with SMTP id u27csp1762858wma;
        Tue, 13 Feb 2018 12:24:55 -0800 (PST)
X-Google-Smtp-Source: AH8x2247TpsNjh14BZ81lKMZcqMRG36Cnv62vtzwSlL6VlbFU/Fl+EIimkKwFG/vUjWU3hIkknkK
X-Received: by 10.129.201.2 with SMTP id o2mr1690036ywi.2.1518553495472;
        Tue, 13 Feb 2018 12:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518553495; cv=none;
        d=google.com; s=arc-20160816;
        b=DKCzWO96d0kaMbgHObRilWz3XifL/x44RKcGb6A8YwWbJyPw9h/se8K21Y+rnRuqUO
         k2Zj3gcbzrstU2sI3uN/XMZHuEzHncK4uTcZaDTG2wWhyivu+6YOn/6r5hFH4htZFQbA
         /2b54Fs1kfr4C/HKmNa2eNoZoucEk2ZhJwjbL6qlKca4SoDgjcfNQFI8ueejfPoFhezd
         dGr92jbCOEl/pkDNWbV9EBxvACjZqqhiSz6oX1tWu2+AKFi8Vwgb0QsERgXMYnD8snU2
         DvRWQyjJunBS+SuYO0jeBh/T5q7mDrS/HKZ9mSkELbhyWTNaFRRb+vH0qIpoJogPmvTI
         +IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=C9+awM+UAUhjuta+6Dc/tqrPd7MTAXksXWP/5/aID2w=;
        b=ioxjGht6o82kDM1yfQTccD43FYfPfU9+U6/I2Qr3boqNy7urzCwRURxez2oMzEfvD4
         mMDVPgIgDgmprWC5K1xdwIPDh6is0MTlzn2qgzLwQdYzJulK7pEmpf1AlYcvw9bXaYRS
         Epm5PQOJzoklgwLfsz+j5xLBKpjXPlPk9K7bnA//TPhMm03S5wQny4yY8JUNrV4FC7WM
         nTqIeXoQpYK/nBsGlIsOVM6B3m9ncMgCrs9sN1Kj/vIi0pERaHVPNFK49a9BoJuQYYKK
         V5a7XHXitaonhAj19Rx20K9y1xoB6G6pzSa75MURO4T/cNHAL/fi4Qjoz5klH/SdtmYP
         AomQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hxj6pK8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t191si1225321ywc.138.2018.02.13.12.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 12:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hxj6pK8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elh8I-0006j7-UJ
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 15:24:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1elh86-0006gX-Kb
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 15:24:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1elh85-0006Pj-JL
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 15:24:42 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1elh85-0006Ok-Do; Tue, 13 Feb 2018 15:24:41 -0500
Received: by mail-qk0-x242.google.com with SMTP id o7so9585023qkc.1;
	Tue, 13 Feb 2018 12:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C9+awM+UAUhjuta+6Dc/tqrPd7MTAXksXWP/5/aID2w=;
	b=hxj6pK8y663aT9jrddq+pdz1ZSfK0492FNuJj7gwMf+sEhmApBHEYEfjc7i3jtFUit
	HUvUzOyByGyrWIjMJQbBH7D/Qb74olpzFVmBj4IUDGr+TeyiD6Fmv0IAFbU//TAq5V8h
	JS5det0fSScR8ynMO3YMi/22O+zoykGrANm3MZmxk7Q1wc2KY4PGyk2cLvxWijuUzNey
	cC1u1ZPXQVRVfgy9OTH8k5vP3VV1rL7uGb0YZbA9A7AEDfj3tLn6LgbG/8ncyd/E1ovP
	Fbjdnv/r1vXbg4ffP5aP9ccEOtmnbY2v05K0Y373t74Wab6gEnEM0g6rR+BABWIrxVp8
	vXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C9+awM+UAUhjuta+6Dc/tqrPd7MTAXksXWP/5/aID2w=;
	b=TiD1RMFTn0Su8XSSWTvFzn8eRPt+5DVjL40/i8e7eZMaHUDGW97UspeDsAXEDHm4Bh
	odXx6mF0qKeF6YYXgi//febb6PoJJeHlaEUR8zQbdWZrVFiOcLIdIB2avKgA/vi/qaBy
	3WBTnssL7rRJZILqzCaXsXhqa2l6eikQlPqxSBNTDNegoJWI75UUBO8hVguzh3WHhByx
	/4QUy5Hjqj4VWd6ytzijWAP6KICmQCKEHS+i3wGKNDJ1l8iaLknnXdeWld3CUY5vZBv+
	obtQQoJpMSYjlh9hrcgDB9gsyDNiLhEHCWB3I47zSA18S5QK/BkDhvcX+We91ra9UkrD
	O6Tw==
X-Gm-Message-State: APf1xPC4HItLu/tfHoOPhddjJ+zGm0bPUwk1UXap3+pCxymz2vzSycmR
	hC+TldTdoKldQiCrB4nsWEsb658g+seioWxw1q0=
X-Received: by 10.55.104.150 with SMTP id d144mr3913726qkc.71.1518553480649;
	Tue, 13 Feb 2018 12:24:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Tue, 13 Feb 2018 12:24:40 -0800 (PST)
In-Reply-To: <20180213200450-mutt-send-email-mst@kernel.org>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
	<20180213200450-mutt-send-email-mst@kernel.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 13 Feb 2018 12:24:40 -0800
Message-ID: <CAHQ1cqEpeq+M6bVTBLd6dvN7=h-s_bPTXRx_GaoMFhhpq2gTpA@mail.gmail.com>
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
X-TUID: 8IESWbEen94k

On Tue, Feb 13, 2018 at 10:13 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
>> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
>> +{
>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> +
>> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
>> +    k->device_id = 0xABCD;
>> +    k->revision = 0;
>> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
>> +    k->is_express = true;
>> +    k->is_bridge = true;
>> +    k->exit = pci_bridge_exitfn;
>> +    k->realize = designware_pcie_root_realize;
>> +    k->config_read = designware_pcie_root_config_read;
>> +    k->config_write = designware_pcie_root_config_write;
>> +
>> +    dc->reset = pci_bridge_reset;
>> +    /*
>> +     * PCI-facing part of the host bridge, not usable without the
>> +     * host-facing part, which can't be device_add'ed, yet.
>> +     */
>> +    dc->user_creatable = false;
>> +    dc->vmsd = &vmstate_designware_pcie_root;
>> +}
>> +
>> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
>> +                                               unsigned int size)
>> +{
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>> +
>> +    return pci_host_config_read_common(device,
>> +                                       addr,
>> +                                       pci_config_size(device),
>> +                                       size);
>> +}
>> +
>> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
>> +                                            uint64_t val, unsigned int size)
>> +{
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
>> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
>> +
>> +    return pci_host_config_write_common(device,
>> +                                        addr,
>> +                                        pci_config_size(device),
>> +                                        val, size);
>> +}
>> +
>> +static const MemoryRegionOps designware_pci_mmio_ops = {
>> +    .read       = designware_pcie_host_mmio_read,
>> +    .write      = designware_pcie_host_mmio_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .impl = {
>> +        /*
>> +         * Our device would not work correctly if the guest was doing
>> +         * unaligned access. This might not be a limitation on the real
>> +         * device but in practice there is no reason for a guest to access
>> +         * this device unaligned.
>> +         */
>> +        .min_access_size = 4,
>> +        .max_access_size = 4,
>> +        .unaligned = false,
>> +    },
>> +};
>
> Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
> appropriate here?  Most of these cases are plain "we never bothered
> about cross-endian setups". Some are "there's a mix of different
> endian-ness values, need to handle in a special way".
>
> I suspect you really need DEVICE_LITTLE_ENDIAN.
>

That MemoryRegion corresponds to a register file permanently mapped
into CPU's address space, so my assumption is that SoC designers will
wire it according to CPUs endianness be it big or little. I am not
aware of any big-endian CPU based SoC on the market using Designware's
IP block, so I don't think there are any precedent confirming or
denying correctness of my assumption. IMHO, this is also the reason
why all of Linux driver code for that IP assumes little endianness.

I can't say that I testing this code against a big-endian guest/CPU,
but that is primarily due to the fact that there's no real use case
and any test set up I can put toghere would be a contrived example
pointlessly proving my point.

Anyway, I am more than happy to switch it to use DEVICE_LITTLE_ENDIAN,
I just don't know if doing so is any more justified than keeping it
DEVICE_NATIVE_ENDIAN.

Thanks,
Andrey Smirnov
