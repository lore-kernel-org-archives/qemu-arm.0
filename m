Received: by 10.28.71.27 with SMTP id u27csp2396770wma;
        Thu, 8 Feb 2018 10:29:48 -0800 (PST)
X-Google-Smtp-Source: AH8x225oW4NipbReJB8Krmf3BcTIG/h/0k1Bkd9qwOc04UOq282WvIN2DCfcY0H4fM747hzUfuk1
X-Received: by 10.37.198.72 with SMTP id k69mr24006ybf.281.1518114588863;
        Thu, 08 Feb 2018 10:29:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518114588; cv=none;
        d=google.com; s=arc-20160816;
        b=dfTCsZaqBzoOJsfRdxwsxs1cQk0uyc6jT4U9Vkf+/ps5/I/wlKjaERq1rS8z8yXTVp
         Po+O23zcqn7Lqr8nhx4IAv8/wF96YB9dZlBn7o0KdAkAlEWeaB0X+vbNZ0cCBpUFNGFK
         XG8CduG0FDZmPIphve6XnZdpHIfEpQLW8qih7TRJFSLTPiqzY4ylfVXsle9t/tih+3mA
         idDtdtw+wtxhZPOZysqfxZODErzu0tWwMdsD1ENV635aFCIsQFqR/J+MQd4/qzIdOgfv
         CDrl2c1RvVMopisGCmbTVHEmz5tL8aVRQGcbiuLql2eK7XPrsF6tZPgcgeyH0ZZ08xp1
         7dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=zN364pukiFchYb66EarZaSMsNDkVPT+BQwz73Z2csdU=;
        b=oU74bRRzcagynFLkFBlPy3zLEYGPr27vxlVuvAAvfJl/NpiKTs033pjngCSf1XLc60
         AgWVf5MHxT+O+LL+TcPgC87mQNIXQlS89TMj7DzMi9X1RuRkPk9teBUpJUhsSqt4Sk5R
         E/U1SvCc1vxXaAk6PI5lVfZV5KxDd8XnkPpKnKwNX2nP3qz7Wyq5xRC8w/hCBS4vTHKJ
         CYw9UqXIfvXW/vix4fdkrCeTrfXUYIQkp6BSklya2vSS3GmcAuoaL3TjDPOf5uu4hor2
         WYWqEzBPj7li4jOrJWfOo8+TFi9dVeJlMkE1PAxVHPsQlwUy4naQP37N1qRVCBJYl3DC
         bZ7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o145si96824ybc.223.2018.02.08.10.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 10:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqxA-0003gn-23
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 13:29:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejqHC-0008OD-KH
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:46:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ejqH9-0004MW-ED
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:46:26 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46452 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ejqH2-0004Ic-7u; Thu, 08 Feb 2018 12:46:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 904EF4022909;
	Thu,  8 Feb 2018 17:46:05 +0000 (UTC)
Received: from redhat.com (ovpn-120-144.rdu2.redhat.com [10.10.120.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE0F02024CA2;
	Thu,  8 Feb 2018 17:45:58 +0000 (UTC)
Date: Thu, 8 Feb 2018 19:45:58 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20180208194226-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-11-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180207042438.15422-11-andrew.smirnov@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 17:46:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 17:46:05 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v5 10/14] pci: Add support for Designware
 IP block
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
X-TUID: 7ZeRWwWOiJSz

On Tue, Feb 06, 2018 at 08:24:34PM -0800, Andrey Smirnov wrote:
> Add code needed to get a functional PCI subsytem when using in
> conjunction with upstream Linux guest (4.13+). Tested to work against
> "e1000e" (network adapter, using MSI interrupts) as well as
> "usb-ehci" (USB controller, using legacy PCI interrupts).
>=20
> Based on "i.MX6 Applications Processor Reference Manual" (Document
> Number: IMX6DQRM Rev. 4) as well as corresponding dirver in Linux
> kernel (circa 4.13 - 4.16 found in drivers/pci/dwc/*)
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  default-configs/arm-softmmu.mak  |   2 +
>  hw/pci-host/Makefile.objs        |   2 +
>  hw/pci-host/designware.c         | 759 +++++++++++++++++++++++++++++++=
++++++++
>  include/hw/pci-host/designware.h |  97 +++++
>  include/hw/pci/pci_ids.h         |   2 +
>  5 files changed, 862 insertions(+)
>  create mode 100644 hw/pci-host/designware.c
>  create mode 100644 include/hw/pci-host/designware.h
>=20
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> index b0d6e65038..0c5ae914ed 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -132,3 +132,5 @@ CONFIG_GPIO_KEY=3Dy
>  CONFIG_MSF2=3Dy
>  CONFIG_FW_CFG_DMA=3Dy
>  CONFIG_XILINX_AXI=3Dy
> +CONFIG_PCI_DESIGNWARE=3Dy
> +
> diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
> index 4b69f737b5..6d6597c065 100644
> --- a/hw/pci-host/Makefile.objs
> +++ b/hw/pci-host/Makefile.objs
> @@ -17,3 +17,5 @@ common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o
>  common-obj-$(CONFIG_PCI_Q35) +=3D q35.o
>  common-obj-$(CONFIG_PCI_GENERIC) +=3D gpex.o
>  common-obj-$(CONFIG_PCI_XILINX) +=3D xilinx-pcie.o
> +
> +common-obj-$(CONFIG_PCI_DESIGNWARE) +=3D designware.o
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> new file mode 100644
> index 0000000000..551a881af0
> --- /dev/null
> +++ b/hw/pci-host/designware.c
> @@ -0,0 +1,759 @@
> +/*
> + * Copyright (c) 2018, Impinj, Inc.
> + *
> + * Designware PCIe IP block emulation
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/pci/msi.h"
> +#include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/pci/pcie_port.h"
> +#include "hw/pci-host/designware.h"
> +
> +#define PCIE_PORT_LINK_CONTROL          0x710
> +
> +#define PCIE_PHY_DEBUG_R1               0x72C
> +#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
> +
> +#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
> +#define PORT_LOGIC_SPEED_CHANGE         (0x1 << 17)
> +
> +#define PCIE_MSI_ADDR_LO                0x820
> +#define PCIE_MSI_ADDR_HI                0x824
> +#define PCIE_MSI_INTR0_ENABLE           0x828
> +#define PCIE_MSI_INTR0_MASK             0x82C
> +#define PCIE_MSI_INTR0_STATUS           0x830
> +
> +#define PCIE_ATU_VIEWPORT               0x900
> +#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
> +#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
> +#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
> +#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
> +#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
> +#define PCIE_ATU_CR1                    0x904
> +#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
> +#define PCIE_ATU_TYPE_IO                (0x2 << 0)
> +#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
> +#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
> +#define PCIE_ATU_CR2                    0x908
> +#define PCIE_ATU_ENABLE                 (0x1 << 31)
> +#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
> +#define PCIE_ATU_LOWER_BASE             0x90C
> +#define PCIE_ATU_UPPER_BASE             0x910
> +#define PCIE_ATU_LIMIT                  0x914
> +#define PCIE_ATU_LOWER_TARGET           0x918
> +#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
> +#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
> +#define PCIE_ATU_UPPER_TARGET           0x91C
> +
> +static DesignwarePCIEHost *
> +designware_pcie_root_to_host(DesignwarePCIERoot *root)
> +{
> +    BusState *bus =3D qdev_get_parent_bus(DEVICE(root));
> +    return DESIGNWARE_PCIE_HOST(bus->parent);
> +}
> +
> +static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
> +                                           uint64_t val, unsigned len)
> +{
> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(opaque);
> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
> +
> +    root->msi.intr[0].status |=3D BIT(val) & root->msi.intr[0].enable;
> +
> +    if (root->msi.intr[0].status & ~root->msi.intr[0].mask) {
> +        qemu_set_irq(host->pci.irqs[0], 1);
> +    }
> +}
> +
> +static const MemoryRegionOps designware_pci_host_msi_ops =3D {
> +    .write =3D designware_pcie_root_msi_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,


Native endian normally means you need to do byteswaps yourself.
I don't see any here which looks suspicious.

> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot=
 *root)
> +
> +{
> +    MemoryRegion *mem   =3D &root->msi.iomem;
> +    const uint64_t base =3D root->msi.base;
> +    const bool enable   =3D root->msi.intr[0].enable;
> +
> +    memory_region_set_address(mem, base);
> +    memory_region_set_enabled(mem, enable);
> +}
> +
> +static DesignwarePCIEViewport *
> +designware_pcie_root_get_current_viewport(DesignwarePCIERoot *root)
> +{
> +    const unsigned int idx =3D root->atu_viewport & 0xF;
> +    const unsigned int dir =3D !!(root->atu_viewport & PCIE_ATU_REGION=
_INBOUND);
> +    return &root->viewports[dir][idx];
> +}
> +
> +static uint32_t
> +designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int l=
en)
> +{
> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(d);
> +    DesignwarePCIEViewport *viewport =3D
> +        designware_pcie_root_get_current_viewport(root);
> +
> +    uint32_t val;
> +
> +    switch (address) {
> +    case PCIE_PORT_LINK_CONTROL:
> +        /*
> +         * Linux guest uses this register only to configure number of
> +         * PCIE lane (which in our case is irrelevant) and doesn't
> +         * really care about the value it reads from this register
> +         */
> +        val =3D 0xDEADBEEF;
> +        break;
> +
> +    case PCIE_LINK_WIDTH_SPEED_CONTROL:
> +        /*
> +         * To make sure that any code in guest waiting for speed
> +         * change does not time out we always report
> +         * PORT_LOGIC_SPEED_CHANGE as set
> +         */
> +        val =3D PORT_LOGIC_SPEED_CHANGE;
> +        break;
> +
> +    case PCIE_MSI_ADDR_LO:
> +        val =3D root->msi.base;
> +        break;
> +
> +    case PCIE_MSI_ADDR_HI:
> +        val =3D root->msi.base >> 32;
> +        break;
> +
> +    case PCIE_MSI_INTR0_ENABLE:
> +        val =3D root->msi.intr[0].enable;
> +        break;
> +
> +    case PCIE_MSI_INTR0_MASK:
> +        val =3D root->msi.intr[0].mask;
> +        break;
> +
> +    case PCIE_MSI_INTR0_STATUS:
> +        val =3D root->msi.intr[0].status;
> +        break;
> +
> +    case PCIE_PHY_DEBUG_R1:
> +        val =3D PCIE_PHY_DEBUG_R1_XMLH_LINK_UP;
> +        break;
> +
> +    case PCIE_ATU_VIEWPORT:
> +        val =3D root->atu_viewport;
> +        break;
> +
> +    case PCIE_ATU_LOWER_BASE:
> +        val =3D viewport->base;
> +        break;
> +
> +    case PCIE_ATU_UPPER_BASE:
> +        val =3D viewport->base >> 32;
> +        break;
> +
> +    case PCIE_ATU_LOWER_TARGET:
> +        val =3D viewport->target;
> +        break;
> +
> +    case PCIE_ATU_UPPER_TARGET:
> +        val =3D viewport->target >> 32;
> +        break;
> +
> +    case PCIE_ATU_LIMIT:
> +        val =3D viewport->limit;
> +        break;
> +
> +    case PCIE_ATU_CR1:
> +    case PCIE_ATU_CR2:          /* FALLTHROUGH */
> +        val =3D viewport->cr[(address - PCIE_ATU_CR1) / sizeof(uint32_=
t)];
> +        break;
> +
> +    default:
> +        val =3D pci_default_read_config(d, address, len);
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static uint64_t designware_pcie_root_data_access(void *opaque, hwaddr =
addr,
> +                                                 uint64_t *val, unsign=
ed len)
> +{
> +    DesignwarePCIEViewport *viewport;
> +    DesignwarePCIERoot *root;
> +    PCIBus *pcibus;
> +
> +    root     =3D DESIGNWARE_PCIE_ROOT(opaque);
> +    viewport =3D designware_pcie_root_get_current_viewport(root);
> +    pcibus   =3D pci_get_bus(PCI_DEVICE(root));
> +
> +    addr &=3D PCIE_CONFIG_SPACE_SIZE - 1;
> +    addr |=3D PCIE_ATU_BUS(viewport->target) << 16;
> +    addr |=3D PCIE_ATU_DEVFN(viewport->target) << 8;
> +
> +    if (val) {
> +        pci_data_write(pcibus, addr, *val, len);
> +        return 0;
> +    }
> +
> +    return pci_data_read(pcibus, addr, len);
> +}
> +
> +static uint64_t designware_pcie_root_data_read(void *opaque, hwaddr ad=
dr,
> +                                               unsigned len)
> +{
> +    return designware_pcie_root_data_access(opaque, addr, NULL, len);
> +}
> +
> +static void designware_pcie_root_data_write(void *opaque, hwaddr addr,
> +                                            uint64_t val, unsigned len=
)
> +{
> +    designware_pcie_root_data_access(opaque, addr, &val, len);
> +}
> +
> +static const MemoryRegionOps designware_pci_host_conf_ops =3D {
> +    .read =3D designware_pcie_root_data_read,
> +    .write =3D designware_pcie_root_data_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,

Native endian is usually not what's needed for device emulation.


> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
> +                                            DesignwarePCIEViewport *vi=
ewport)
> +{
> +    const uint64_t target =3D viewport->target;
> +    const uint64_t base   =3D viewport->base;
> +    const uint64_t size   =3D (uint64_t)viewport->limit - base + 1;
> +    const bool enabled    =3D viewport->cr[1] & PCIE_ATU_ENABLE;
> +
> +    MemoryRegion *current, *other;
> +
> +    if (viewport->cr[0] =3D=3D PCIE_ATU_TYPE_MEM) {
> +        current =3D &viewport->mem;
> +        other   =3D &viewport->cfg;
> +        memory_region_set_alias_offset(current, target);
> +    } else {
> +        current =3D &viewport->cfg;
> +        other   =3D &viewport->mem;
> +    }
> +
> +    /*
> +     * An outbound viewport can be reconfigure from being MEM to CFG,
> +     * to account for that we disable the "other" memory region that
> +     * becomes unused due to that fact.
> +     */
> +    memory_region_set_enabled(other, false);
> +    if (enabled) {
> +        memory_region_set_size(current, size);
> +        memory_region_set_address(current, base);
> +    }
> +    memory_region_set_enabled(current, enabled);
> +}
> +
> +static void designware_pcie_root_config_write(PCIDevice *d, uint32_t a=
ddress,
> +                                              uint32_t val, int len)
> +{
> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(d);
> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
> +    DesignwarePCIEViewport *viewport =3D
> +        designware_pcie_root_get_current_viewport(root);
> +
> +    switch (address) {
> +    case PCIE_PORT_LINK_CONTROL:
> +    case PCIE_LINK_WIDTH_SPEED_CONTROL:
> +    case PCIE_PHY_DEBUG_R1:
> +        /* No-op */
> +        break;
> +
> +    case PCIE_MSI_ADDR_LO:
> +        root->msi.base &=3D 0xFFFFFFFF00000000ULL;
> +        root->msi.base |=3D val;
> +        break;
> +
> +    case PCIE_MSI_ADDR_HI:
> +        root->msi.base &=3D 0x00000000FFFFFFFFULL;
> +        root->msi.base |=3D (uint64_t)val << 32;
> +        break;
> +
> +    case PCIE_MSI_INTR0_ENABLE: {
> +        const bool update_msi_mapping =3D !root->msi.intr[0].enable ^ =
!!val;
> +
> +        root->msi.intr[0].enable =3D val;
> +
> +        if (update_msi_mapping) {
> +            designware_pcie_root_update_msi_mapping(root);
> +        }
> +        break;
> +    }
> +
> +    case PCIE_MSI_INTR0_MASK:
> +        root->msi.intr[0].mask =3D val;
> +        break;
> +
> +    case PCIE_MSI_INTR0_STATUS:
> +        root->msi.intr[0].status ^=3D val;
> +        if (!root->msi.intr[0].status) {
> +            qemu_set_irq(host->pci.irqs[0], 0);
> +        }
> +        break;
> +
> +    case PCIE_ATU_VIEWPORT:
> +        root->atu_viewport =3D val;
> +        break;
> +
> +    case PCIE_ATU_LOWER_BASE:
> +        viewport->base &=3D 0xFFFFFFFF00000000ULL;
> +        viewport->base |=3D val;
> +        break;
> +
> +    case PCIE_ATU_UPPER_BASE:
> +        viewport->base &=3D 0x00000000FFFFFFFFULL;
> +        viewport->base |=3D (uint64_t)val << 32;
> +        break;
> +
> +    case PCIE_ATU_LOWER_TARGET:
> +        viewport->target &=3D 0xFFFFFFFF00000000ULL;
> +        viewport->target |=3D val;
> +        break;
> +
> +    case PCIE_ATU_UPPER_TARGET:
> +        viewport->target &=3D 0x00000000FFFFFFFFULL;
> +        viewport->target |=3D val;
> +        break;
> +
> +    case PCIE_ATU_LIMIT:
> +        viewport->limit =3D val;
> +        break;
> +
> +    case PCIE_ATU_CR1:
> +        viewport->cr[0] =3D val;
> +        break;
> +    case PCIE_ATU_CR2:
> +        viewport->cr[1] =3D val;
> +        designware_pcie_update_viewport(root, viewport);
> +        break;
> +
> +    default:
> +        pci_bridge_write_config(d, address, val, len);
> +        break;
> +    }
> +}
> +
> +static char *designware_pcie_viewport_name(const char *direction,
> +                                           unsigned int i,
> +                                           const char *type)
> +{
> +    return g_strdup_printf("PCI %s Viewport %u [%s]",
> +                           direction, i, type);
> +}
> +
> +static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
> +{
> +    DesignwarePCIERoot *root =3D DESIGNWARE_PCIE_ROOT(dev);
> +    DesignwarePCIEHost *host =3D designware_pcie_root_to_host(root);
> +    MemoryRegion *address_space =3D &host->pci.memory;
> +    PCIBridge *br =3D PCI_BRIDGE(dev);
> +    DesignwarePCIEViewport *viewport;
> +    /*
> +     * Dummy values used for initial configuration of MemoryRegions
> +     * that belong to a give viewport
> +     */
> +    const hwaddr dummy_offset =3D 0;
> +    const uint64_t dummy_size =3D 4;
> +    size_t i;
> +
> +    br->bus_name  =3D "dw-pcie";
> +
> +    pci_set_word(dev->config + PCI_COMMAND,
> +                 PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> +
> +    pci_config_set_interrupt_pin(dev->config, 1);
> +    pci_bridge_initfn(dev, TYPE_PCIE_BUS);
> +
> +    pcie_port_init_reg(dev);
> +
> +    pcie_cap_init(dev, 0x70, PCI_EXP_TYPE_ROOT_PORT,
> +                  0, &error_fatal);
> +
> +    msi_nonbroken =3D true;
> +    msi_init(dev, 0x50, 32, true, true, &error_fatal);
> +
> +    for (i =3D 0; i < DESIGNWARE_PCIE_NUM_VIEWPORTS; i++) {
> +        MemoryRegion *source, *destination, *mem;
> +        const char *direction;
> +        char *name;
> +
> +        viewport =3D &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND=
][i];
> +        viewport->inbound =3D true;
> +        viewport->base    =3D 0x0000000000000000ULL;
> +        viewport->target  =3D 0x0000000000000000ULL;
> +        viewport->limit   =3D UINT32_MAX;
> +        viewport->cr[0]   =3D PCIE_ATU_TYPE_MEM;
> +
> +        source      =3D &host->pci.address_space_root;
> +        destination =3D get_system_memory();
> +        direction   =3D "Inbound";
> +
> +        /*
> +         * Configure MemoryRegion implementing PCI -> CPU memory
> +         * access
> +         */
> +        mem  =3D &viewport->mem;
> +        name =3D designware_pcie_viewport_name(direction, i, "MEM");
> +        memory_region_init_alias(mem, OBJECT(root), name, destination,
> +                                 dummy_offset, dummy_size);
> +        memory_region_add_subregion_overlap(source, dummy_offset, mem,=
 -1);
> +        memory_region_set_enabled(mem, false);
> +        g_free(name);
> +
> +        viewport =3D &root->viewports[DESIGNWARE_PCIE_VIEWPORT_OUTBOUN=
D][i];
> +        viewport->inbound =3D false;
> +        viewport->base    =3D 0x0000000000000000ULL;
> +        viewport->target  =3D 0x0000000000000000ULL;
> +        viewport->limit   =3D UINT32_MAX;
> +        viewport->cr[0]   =3D PCIE_ATU_TYPE_MEM;
> +
> +        destination =3D &host->pci.memory;
> +        direction   =3D "Outbound";
> +        source      =3D get_system_memory();
> +
> +        /*
> +         * Configure MemoryRegion implementing CPU -> PCI memory
> +         * access
> +         */
> +        mem  =3D &viewport->mem;
> +        name =3D designware_pcie_viewport_name(direction, i, "MEM");
> +        memory_region_init_alias(mem, OBJECT(root), name, destination,
> +                                 dummy_offset, dummy_size);
> +        memory_region_add_subregion(source, dummy_offset, mem);
> +        memory_region_set_enabled(mem, false);
> +        g_free(name);
> +
> +        /*
> +         * Configure MemoryRegion implementing access to configuration
> +         * space
> +         */
> +        mem  =3D &viewport->cfg;
> +        name =3D designware_pcie_viewport_name(direction, i, "CFG");
> +        memory_region_init_io(&viewport->cfg, OBJECT(root),
> +                              &designware_pci_host_conf_ops,
> +                              root, name, dummy_size);
> +        memory_region_add_subregion(source, dummy_offset, mem);
> +        memory_region_set_enabled(mem, false);
> +        g_free(name);

This implements the MMCFG, doesn't it?
I suspect you need pcie_host_mmcfg_update instead of rolling
your own.

> +    }
> +
> +    /*
> +     * If no inbound iATU windows are configured, HW defaults to
> +     * letting inbound TLPs to pass in. We emulate that by exlicitly
> +     * configuring first inbound window to cover all of target's
> +     * address space.
> +     *
> +     * NOTE: This will not work correctly for the case when first
> +     * configured inbound window is window 0
> +     */
> +    viewport =3D &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0]=
;
> +    viewport->cr[1] =3D PCIE_ATU_ENABLE;
> +    designware_pcie_update_viewport(root, viewport);
> +
> +    memory_region_init_io(&root->msi.iomem, OBJECT(root),
> +                          &designware_pci_host_msi_ops,
> +                          root, "pcie-msi", 0x4);
> +    /*
> +     * We initially place MSI interrupt I/O region a adress 0 and
> +     * disable it. It'll be later moved to correct offset and enabled
> +     * in designware_pcie_root_update_msi_mapping() as a part of
> +     * initialization done by guest OS
> +     */
> +    memory_region_add_subregion(address_space, dummy_offset, &root->ms=
i.iomem);
> +    memory_region_set_enabled(&root->msi.iomem, false);
> +}
> +
> +static void designware_pcie_set_irq(void *opaque, int irq_num, int lev=
el)
> +{
> +    DesignwarePCIEHost *host =3D DESIGNWARE_PCIE_HOST(opaque);
> +
> +    qemu_set_irq(host->pci.irqs[irq_num], level);
> +}
> +
> +static const char *
> +designware_pcie_host_root_bus_path(PCIHostState *host_bridge, PCIBus *=
rootbus)
> +{
> +    return "0000:00";
> +}
> +
> +static const VMStateDescription vmstate_designware_pcie_msi_bank =3D {
> +    .name =3D "designware-pcie-msi-bank",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(enable, DesignwarePCIEMSIBank),
> +        VMSTATE_UINT32(mask, DesignwarePCIEMSIBank),
> +        VMSTATE_UINT32(status, DesignwarePCIEMSIBank),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_designware_pcie_msi =3D {
> +    .name =3D "designware-pcie-msi",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(base, DesignwarePCIEMSI),
> +        VMSTATE_STRUCT_ARRAY(intr,
> +                             DesignwarePCIEMSI,
> +                             DESIGNWARE_PCIE_NUM_MSI_BANKS,
> +                             1,
> +                             vmstate_designware_pcie_msi_bank,
> +                             DesignwarePCIEMSIBank),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_designware_pcie_viewport =3D {
> +    .name =3D "designware-pcie-viewport",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(base, DesignwarePCIEViewport),
> +        VMSTATE_UINT64(target, DesignwarePCIEViewport),
> +        VMSTATE_UINT32(limit, DesignwarePCIEViewport),
> +        VMSTATE_UINT32_ARRAY(cr, DesignwarePCIEViewport, 2),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_designware_pcie_root =3D {
> +    .name =3D "designware-pcie-root",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(parent_obj, PCIBridge),
> +        VMSTATE_UINT32(atu_viewport, DesignwarePCIERoot),
> +        VMSTATE_STRUCT_2DARRAY(viewports,
> +                               DesignwarePCIERoot,
> +                               2,
> +                               DESIGNWARE_PCIE_NUM_VIEWPORTS,
> +                               1,
> +                               vmstate_designware_pcie_viewport,
> +                               DesignwarePCIEViewport),
> +        VMSTATE_STRUCT(msi,
> +                       DesignwarePCIERoot,
> +                       1,
> +                       vmstate_designware_pcie_msi,
> +                       DesignwarePCIEMSI),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void designware_pcie_root_class_init(ObjectClass *klass, void *=
data)
> +{
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +
> +    k->vendor_id =3D PCI_VENDOR_ID_SYNOPSYS;
> +    k->device_id =3D 0xABCD;
> +    k->revision =3D 0;
> +    k->class_id =3D PCI_CLASS_BRIDGE_PCI;
> +    k->is_express =3D true;
> +    k->is_bridge =3D true;
> +    k->exit =3D pci_bridge_exitfn;
> +    k->realize =3D designware_pcie_root_realize;
> +    k->config_read =3D designware_pcie_root_config_read;
> +    k->config_write =3D designware_pcie_root_config_write;
> +
> +    dc->reset =3D pci_bridge_reset;
> +    /*
> +     * PCI-facing part of the host bridge, not usable without the
> +     * host-facing part, which can't be device_add'ed, yet.
> +     */
> +    dc->user_creatable =3D false;
> +    dc->vmsd =3D &vmstate_designware_pcie_root;
> +}
> +
> +static uint64_t designware_pcie_host_mmio_read(void *opaque, hwaddr ad=
dr,
> +                                               unsigned int size)
> +{
> +    PCIHostState *pci =3D PCI_HOST_BRIDGE(opaque);
> +    PCIDevice *device =3D pci_find_device(pci->bus, 0, 0);
> +
> +    return pci_host_config_read_common(device,
> +                                       addr,
> +                                       pci_config_size(device),
> +                                       size);
> +}
> +
> +static void designware_pcie_host_mmio_write(void *opaque, hwaddr addr,
> +                                            uint64_t val, unsigned int=
 size)
> +{
> +    PCIHostState *pci =3D PCI_HOST_BRIDGE(opaque);
> +    PCIDevice *device =3D pci_find_device(pci->bus, 0, 0);
> +
> +    return pci_host_config_write_common(device,
> +                                        addr,
> +                                        pci_config_size(device),
> +                                        val, size);
> +}
> +
> +static const MemoryRegionOps designware_pci_mmio_ops =3D {
> +    .read       =3D designware_pcie_host_mmio_read,
> +    .write      =3D designware_pcie_host_mmio_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .impl =3D {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the rea=
l
> +         * device but in practice there is no reason for a guest to ac=
cess
> +         * this device unaligned.
> +         */
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +        .unaligned =3D false,
> +    },
> +};
> +
> +static AddressSpace *designware_pcie_host_set_iommu(PCIBus *bus, void =
*opaque,
> +                                                    int devfn)
> +{
> +    DesignwarePCIEHost *s =3D DESIGNWARE_PCIE_HOST(opaque);
> +
> +    return &s->pci.address_space;
> +}
> +
> +static void designware_pcie_host_realize(DeviceState *dev, Error **err=
p)
> +{
> +    PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);
> +    DesignwarePCIEHost *s =3D DESIGNWARE_PCIE_HOST(dev);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +    size_t i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(s->pci.irqs); i++) {
> +        sysbus_init_irq(sbd, &s->pci.irqs[i]);
> +    }
> +
> +    memory_region_init_io(&s->mmio,
> +                          OBJECT(s),
> +                          &designware_pci_mmio_ops,
> +                          s,
> +                          "pcie.reg", 4 * 1024);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +
> +    memory_region_init(&s->pci.io, OBJECT(s), "pcie-pio", 16);
> +    memory_region_init(&s->pci.memory, OBJECT(s),
> +                       "pcie-bus-memory",
> +                       UINT64_MAX);
> +
> +    pci->bus =3D pci_register_root_bus(dev, "pcie",
> +                                     designware_pcie_set_irq,
> +                                     pci_swizzle_map_irq_fn,
> +                                     s,
> +                                     &s->pci.memory,
> +                                     &s->pci.io,
> +                                     0, 4,
> +                                     TYPE_PCIE_BUS);
> +
> +    memory_region_init(&s->pci.address_space_root,
> +                       OBJECT(s),
> +                       "pcie-bus-address-space-root",
> +                       UINT64_MAX);
> +    memory_region_add_subregion(&s->pci.address_space_root,
> +                                0x0, &s->pci.memory);
> +    address_space_init(&s->pci.address_space,
> +                       &s->pci.address_space_root,
> +                       "pcie-bus-address-space");
> +    pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
> +
> +    qdev_set_parent_bus(DEVICE(&s->root), BUS(pci->bus));
> +    qdev_init_nofail(DEVICE(&s->root));
> +}
> +
> +static const VMStateDescription vmstate_designware_pcie_host =3D {
> +    .name =3D "designware-pcie-host",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_STRUCT(root,
> +                       DesignwarePCIEHost,
> +                       1,
> +                       vmstate_designware_pcie_root,
> +                       DesignwarePCIERoot),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void designware_pcie_host_class_init(ObjectClass *klass, void *=
data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(klass);
> +
> +    hc->root_bus_path =3D designware_pcie_host_root_bus_path;
> +    dc->realize =3D designware_pcie_host_realize;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->fw_name =3D "pci";
> +    dc->vmsd =3D &vmstate_designware_pcie_host;
> +}
> +
> +static void designware_pcie_host_init(Object *obj)
> +{
> +    DesignwarePCIEHost *s =3D DESIGNWARE_PCIE_HOST(obj);
> +    DesignwarePCIERoot *root =3D &s->root;
> +
> +    object_initialize(root, sizeof(*root), TYPE_DESIGNWARE_PCIE_ROOT);
> +    object_property_add_child(obj, "root", OBJECT(root), NULL);
> +    qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
> +    qdev_prop_set_bit(DEVICE(root), "multifunction", false);
> +}
> +
> +static const TypeInfo designware_pcie_root_info =3D {
> +    .name =3D TYPE_DESIGNWARE_PCIE_ROOT,
> +    .parent =3D TYPE_PCI_BRIDGE,
> +    .instance_size =3D sizeof(DesignwarePCIERoot),
> +    .class_init =3D designware_pcie_root_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_PCIE_DEVICE },
> +        { }
> +    },
> +};
> +
> +static const TypeInfo designware_pcie_host_info =3D {
> +    .name       =3D TYPE_DESIGNWARE_PCIE_HOST,
> +    .parent     =3D TYPE_PCI_HOST_BRIDGE,
> +    .instance_size =3D sizeof(DesignwarePCIEHost),
> +    .instance_init =3D designware_pcie_host_init,
> +    .class_init =3D designware_pcie_host_class_init,
> +};
> +
> +static void designware_pcie_register(void)
> +{
> +    type_register_static(&designware_pcie_root_info);
> +    type_register_static(&designware_pcie_host_info);
> +}
> +type_init(designware_pcie_register)
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/des=
ignware.h
> new file mode 100644
> index 0000000000..63db9cdfbe
> --- /dev/null
> +++ b/include/hw/pci-host/designware.h
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * Designware PCIe IP block emulation
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef DESIGNWARE_H
> +#define DESIGNWARE_H
> +
> +#include "hw/hw.h"
> +#include "hw/sysbus.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pcie_host.h"
> +#include "hw/pci/pci_bridge.h"
> +
> +#define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
> +#define DESIGNWARE_PCIE_HOST(obj) \
> +     OBJECT_CHECK(DesignwarePCIEHost, (obj), TYPE_DESIGNWARE_PCIE_HOST=
)
> +
> +#define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
> +#define DESIGNWARE_PCIE_ROOT(obj) \
> +     OBJECT_CHECK(DesignwarePCIERoot, (obj), TYPE_DESIGNWARE_PCIE_ROOT=
)
> +
> +typedef struct DesignwarePCIEViewport {
> +    MemoryRegion cfg;
> +    MemoryRegion mem;
> +
> +    uint64_t base;
> +    uint64_t target;
> +    uint32_t limit;
> +    uint32_t cr[2];
> +
> +    bool inbound;
> +} DesignwarePCIEViewport;
> +
> +typedef struct DesignwarePCIEMSIBank {
> +    uint32_t enable;
> +    uint32_t mask;
> +    uint32_t status;
> +} DesignwarePCIEMSIBank;
> +
> +typedef struct DesignwarePCIEMSI {
> +    uint64_t     base;
> +    MemoryRegion iomem;
> +
> +#define DESIGNWARE_PCIE_NUM_MSI_BANKS        1
> +
> +    DesignwarePCIEMSIBank intr[DESIGNWARE_PCIE_NUM_MSI_BANKS];
> +} DesignwarePCIEMSI;
> +
> +typedef struct DesignwarePCIERoot {
> +    PCIBridge parent_obj;
> +
> +    uint32_t atu_viewport;
> +
> +#define DESIGNWARE_PCIE_VIEWPORT_OUTBOUND    0
> +#define DESIGNWARE_PCIE_VIEWPORT_INBOUND     1
> +#define DESIGNWARE_PCIE_NUM_VIEWPORTS        4
> +
> +    DesignwarePCIEViewport viewports[2][DESIGNWARE_PCIE_NUM_VIEWPORTS]=
;
> +    DesignwarePCIEMSI msi;
> +} DesignwarePCIERoot;
> +
> +typedef struct DesignwarePCIEHost {
> +    PCIHostState parent_obj;
> +
> +    DesignwarePCIERoot root;
> +
> +    struct {
> +        AddressSpace address_space;
> +        MemoryRegion address_space_root;
> +
> +        MemoryRegion memory;
> +        MemoryRegion io;
> +
> +        qemu_irq     irqs[4];
> +    } pci;
> +
> +    MemoryRegion mmio;
> +} DesignwarePCIEHost;
> +
> +#endif  /* DESIGNWARE_H */
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 35df1874a9..23fefe1bc6 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -266,4 +266,6 @@
>  #define PCI_VENDOR_ID_TEWS               0x1498
>  #define PCI_DEVICE_ID_TEWS_TPCI200       0x30C8
> =20
> +#define PCI_VENDOR_ID_SYNOPSYS           0x16C3
> +
>  #endif
> --=20
> 2.14.3
