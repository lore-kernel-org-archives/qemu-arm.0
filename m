Received: by 10.25.21.156 with SMTP id 28csp587922lfv;
        Fri, 15 Jul 2016 05:31:27 -0700 (PDT)
X-Received: by 10.55.166.149 with SMTP id p143mr23514149qke.79.1468585886756;
        Fri, 15 Jul 2016 05:31:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si5129119qkm.83.2016.07.15.05.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 05:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bO2H8-0002gm-97
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 08:31:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bO2H4-0002fp-Vd
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 08:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bO2Gz-0004er-V3
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 08:31:21 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:64161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1bO2Gz-0004bn-Pd; Fri, 15 Jul 2016 08:31:17 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 129245B80945C;
	Fri, 15 Jul 2016 13:31:07 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 15 Jul 2016 13:31:10 +0100
Date: Fri, 15 Jul 2016 13:31:05 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <20160715123105.GA32594@hhmipssw201.hh.imgtec.org>
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
	<1468503826-10617-4-git-send-email-marcel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1468503826-10617-4-git-send-email-marcel@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/7] hw/mips: fix PCI bus
 initialization
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, mst@redhat.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j5B/C2+hnPUn

On Thu, Jul 14, 2016 at 04:43:42PM +0300, Marcel Apfelbaum wrote:
> Delay the host-bridge 'realization' until the
> PCI root bus is attached.
> 
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  hw/mips/gt64xxx_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Leon Alrae <leon.alrae@imgtec.com>
Tested-by: Leon Alrae <leon.alrae@imgtec.com>

Thanks,
Leon

> 
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 3f4523d..4811843 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -1167,7 +1167,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
>      DeviceState *dev;
>  
>      dev = qdev_create(NULL, TYPE_GT64120_PCI_HOST_BRIDGE);
> -    qdev_init_nofail(dev);
>      d = GT64120_PCI_HOST_BRIDGE(dev);
>      phb = PCI_HOST_BRIDGE(dev);
>      memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", UINT32_MAX);
> @@ -1178,6 +1177,7 @@ PCIBus *gt64120_register(qemu_irq *pic)
>                                  &d->pci0_mem,
>                                  get_system_io(),
>                                  PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
> +    qdev_init_nofail(dev);
>      memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d, "isd-mem", 0x1000);
>  
>      pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
> -- 
> 2.4.3
> 
