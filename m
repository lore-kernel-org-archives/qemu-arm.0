Received: by 10.25.77.65 with SMTP id a62csp2704831lfb;
        Wed, 8 Feb 2017 07:30:22 -0800 (PST)
X-Received: by 10.55.65.136 with SMTP id o130mr19978621qka.168.1486567822395;
        Wed, 08 Feb 2017 07:30:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x188si5839950qkd.12.2017.02.08.07.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Feb 2017 07:30:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbUCJ-0002HQ-KO
	for alex.bennee@linaro.org; Wed, 08 Feb 2017 10:30:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cbUC9-0002Bt-9W
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 10:30:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cbUC3-0008Qc-Gu
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 10:30:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cbUC3-0008PT-86; Wed, 08 Feb 2017 10:30:03 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E4C4C04D2BE;
	Wed,  8 Feb 2017 15:30:03 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-31.phx2.redhat.com
	[10.3.116.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v18FU105030375; Wed, 8 Feb 2017 10:30:01 -0500
To: Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
Date: Wed, 8 Feb 2017 16:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486560712-44171-1-git-send-email-agraf@suse.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Feb 2017 15:30:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Declare virtio-mmio
 as dma-coherent in dt
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /IFbMrLXLzt2

CC'ing Ard and Shannon (I recall this property from earlier):

On 02/08/17 14:31, Alexander Graf wrote:
> QEMU emulated hardware is always dma coherent with its guest. We do
> annotate that correctly on the PCI host controller, but left out
> virtio-mmio.

I recommend to reference the following commit here:

commit 5d636e21c44ecf982a22a7bc4ca89186079ac283
Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon Jul 4 13:06:36 2016 +0100

    hw/arm/virt: mark the PCIe host controller as DMA coherent in the DT
    
    Since QEMU performs cacheable accesses to guest memory when doing DMA
    as part of the implementation of emulated PCI devices, guest drivers
    should use cacheable accesses as well when running under KVM. Since this
    essentially means that emulated PCI devices are DMA coherent, set the
    'dma-coherent' DT property on the PCIe host controller DT node.
    
    This brings the DT description into line with the ACPI description,
    which already marks the PCI bridge as cache coherent (see commit
    bc64b96c984abf).
    
    Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
    Message-id: 1467134090-5099-1-git-send-email-ard.biesheuvel@linaro.org
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> 
> Recent kernels have started to interpret that flag rather than take
> dma coherency as granted with virtio-mmio. While that is considered
> a kernel bug, as it breaks previously working systems, it showed that
> our dt description is incomplete.
> 
> This patch adds the respective marker that allows guest OSs to evaluate
> that our virtio-mmio devices are indeed cache coherent.

As noted above, commit bc64b96c984a ("hw/arm/virt-acpi-build: _CCA attribute is compulsory", 2015-11-03) had done the same in the ACPI description of the PCIe host controller.

Thus, do we need _CCA in the ACPI description of the virtio-mmio transports, to parallel the DT change? See the LNRO0005 device in acpi_dsdt_add_virtio().

If that's the case, then I propose that either the patch please fix both DT and ACPI, or that at least we file a bug "somewhere", for adding _CCA in acpi_dsdt_add_virtio().

Ard, Shannon, any comments?

Thanks,
Laszlo


> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  hw/arm/vexpress.c | 1 +
>  hw/arm/virt.c     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 58760f4..e057568 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -452,6 +452,7 @@ static int add_virtio_mmio_node(void *fdt, uint32_t acells, uint32_t scells,
>                                         acells, addr, scells, size);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", intc);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 0, irq, 1);
> +    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
>      g_free(nodename);
>      if (rc) {
>          return -1;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1f216cf..14881fa 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -797,6 +797,7 @@ static void create_virtio_devices(const VirtMachineState *vms, qemu_irq *pic)
>          qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
>                                 GIC_FDT_IRQ_TYPE_SPI, irq,
>                                 GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
> +        qemu_fdt_setprop(vms->fdt, nodename, "dma-coherent", NULL, 0);
>          g_free(nodename);
>      }
>  }
> 

