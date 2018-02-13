Received: by 10.28.71.27 with SMTP id u27csp1649916wma;
        Tue, 13 Feb 2018 10:40:11 -0800 (PST)
X-Google-Smtp-Source: AH8x227Bz0STQtk9dAdL83bIcOdVGFY7Mcjicexa5pPGu18HadO84JrUlwHliOLRWsUdjqt1Ws0g
X-Received: by 10.129.3.14 with SMTP id 14mr1224325ywd.6.1518547210922;
        Tue, 13 Feb 2018 10:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518547210; cv=none;
        d=google.com; s=arc-20160816;
        b=lj8PuYpiLiQ8PTKyS1htQgy//o9Qh974mIebEJLJTPzizczPoxjq6R9l2Zv/jpha2K
         SVj1c7IPhOhfsX9VxbS5A8WOV4Xf6CNecZNdpuB9qPK3CpKkqTV0VzM9shGpJYqYx/tY
         JvkGGRsKStIimeneFUQqf/HoZPl8ehlXRphpR/JVFJ5j7KebdO1QctgyNtstKw9xrW3T
         uzX/CqQDQ7oNm55J25O+QgW3u2s8w7rnBBYrcMULWY9pT7+U4AyCMkRA/yvUpWt6tXO1
         O8h01E7i9mDvl67s+yZeS5JkecPtdoChf0zkm7U5XEI1bRNMYZG2LTOcajJzqevVeBDg
         xzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=EMZ31ZBJp4H60FX0IYFqRaOD9NHc5NaXlBSVc8Fx9mY=;
        b=IQCUCD88mgHxirWIyoU42XvqBvGAIC2ev2vCSxDDoaIG2rdcZDYrxatD/9UYg1Je8z
         xbTWjLga2l3Xq1SbJDtRIvwxFLCCupRjpyfugRAgAmCiqZObrpFxUi/R3Kq5yY1hgvyo
         jsQAUl3l+dn5rwHPtk2yy4B19ntsQp9b8bQE5lSF9oRQ2vVetu5tMgmS8h263NoCROmZ
         t/XRjreKpxzmVOU5KmfovqFcvH1fpdL2BKB4E4P2kcFLYzlIBiAjzRDYPVGVnSC0YdhT
         +EzIOQkAKnYb+/xaTd+MppaLJq+NuNAN9ZbwYaY4sdOjbEqCvJKm8Yx/6znuKUW/nEgG
         Ao8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si972850ybk.17.2018.02.13.10.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 10:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elfUw-0003cd-9f
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 13:40:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1elf5D-0003tn-Ul
	for qemu-devel@nongnu.org; Tue, 13 Feb 2018 13:13:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1elf5D-000584-0X
	for qemu-devel@nongnu.org; Tue, 13 Feb 2018 13:13:35 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39684 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1elf56-00053O-G0; Tue, 13 Feb 2018 13:13:28 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 185AD4022909;
	Tue, 13 Feb 2018 18:13:28 +0000 (UTC)
Received: from redhat.com (ovpn-125-92.rdu2.redhat.com [10.10.125.92])
	by smtp.corp.redhat.com (Postfix) with SMTP id 92BD2B28A6;
	Tue, 13 Feb 2018 18:13:27 +0000 (UTC)
Date: Tue, 13 Feb 2018 20:13:27 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180213200450-mutt-send-email-mst@kernel.org>
References: <20180213170712.18239-1-andrew.smirnov@gmail.com>
	<20180213170712.18239-2-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180213170712.18239-2-andrew.smirnov@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 13 Feb 2018 18:13:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 13 Feb 2018 18:13:28 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v6 1/3] pci: Add support for Designware IP
 block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YksgwhEGm7g9

On Tue, Feb 13, 2018 at 09:07:10AM -0800, Andrey Smirnov wrote:
> +static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
> +{
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +
> +    k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
> +    k->device_id = 0xABCD;
> +    k->revision = 0;
> +    k->class_id = PCI_CLASS_BRIDGE_PCI;
> +    k->is_express = true;
> +    k->is_bridge = true;
> +    k->exit = pci_bridge_exitfn;
> +    k->realize = designware_pcie_root_realize;
> +    k->config_read = designware_pcie_root_config_read;
> +    k->config_write = designware_pcie_root_config_write;
> +
> +    dc->reset = pci_bridge_reset;
> +    /*
> +     * PCI-facing part of the host bridge, not usable without the
> +     * host-facing part, which can't be device_add'ed, yet.
> +     */
> +    dc->user_creatable = false;
> +    dc->vmsd = &vmstate_designware_pcie_root;
> +}
> +
> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr addr,
> +                                               unsigned int size)
> +{
> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
> +
> +    return pci_host_config_read_common(device,
> +                                       addr,
> +                                       pci_config_size(device),
> +                                       size);
> +}
> +
> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
> +                                            uint64_t val, unsigned int size)
> +{
> +    PCIHostState *pci = PCI_HOST_BRIDGE(opaque);
> +    PCIDevice *device = pci_find_device(pci->bus, 0, 0);
> +
> +    return pci_host_config_write_common(device,
> +                                        addr,
> +                                        pci_config_size(device),
> +                                        val, size);
> +}
> +
> +static const MemoryRegionOps designware_pci_mmio_ops = {
> +    .read       = designware_pcie_host_mmio_read,
> +    .write      = designware_pcie_host_mmio_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the real
> +         * device but in practice there is no reason for a guest to access
> +         * this device unaligned.
> +         */
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false,
> +    },
> +};

Could you pls add some comments explaining why is DEVICE_NATIVE_ENDIAN
appropriate here?  Most of these cases are plain "we never bothered
about cross-endian setups". Some are "there's a mix of different
endian-ness values, need to handle in a special way".

I suspect you really need DEVICE_LITTLE_ENDIAN.

-- 
MST
