Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp5009ejj;
        Wed, 22 Nov 2023 14:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHs2SSqvAexjrmWGekoxTbSfuf892a+SKRgrL5BMXTLIl0d5/dLzGUzm8PjoRCbnTMygiHe
X-Received: by 2002:a05:620a:3d0a:b0:774:3235:4e6d with SMTP id tq10-20020a05620a3d0a00b0077432354e6dmr2965668qkn.21.1700692810288;
        Wed, 22 Nov 2023 14:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700692810; cv=none;
        d=google.com; s=arc-20160816;
        b=KU1bC/Jxy7YiGcPkWdCOOSoCj8uW43tucDQbHaLDLQrJcnAFf/JAIeJqMmMAgnZJ6F
         PSUqWgmx4s5VQ6uS/ypQHNCpNQjgmXprCu6JEwrBu5ptAtQGRtwong87CwEM2h7mxvzn
         9qpM+zq9Y44b1Bl4d01CWrTGxdT2+VLz0LxdmSpp6Y5Cf47Qsl3JUXLdDRAAafEsMCgG
         Pt7yi726ZBdxrGN643Rqbs2iTCHFSah96KNpPEIpy8DkoG2mY/eKrFXK3RZ968KksPUV
         PZ8i3w+N3Wh1/Je4DP11/yfrhlOcGvFNhWOMX9MxF3LTJf/LrIVPRUSmmjQdAtVj36+8
         g/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=hu1gphN1P3xr7cYOLOtQbh6/dbqoA3+JA0OAt6jQKL8=;
        fh=xVpkRiFRNTJtVhRJwq3wiKxoSWZjm5zqLDFV79K7yuA=;
        b=CBR0aPSENKSxJh5EfWwwI0VHJqXRm7fwLdHQLkmTCLXzRdqWLWjGhMpb3fpNuS3xDB
         Y98sWEJSxubA+1LB8cfus7Q3dv8Ac/GBDY40eUCnvDai38EE6aaMTxUUzhmAt8xcu9Hc
         IX6H0A5gwEWRNSXJMpgrgXFvNhR0IJxX5KzyRrKfVdCSQDq6LL0IaBp9oal4UdHURRjY
         5slq4HesDg8wBpctSb21DchAa1Rc2qA5b+gUEn+0mRHkkJizrlBpv06FAfGOyOCL9Fv1
         le7R7OFu5rZTo4+anqPJs/V1eS2Q4KBZCiozGQO+axtT7NsXuW62L/8YqNwQG2F1cqEj
         t0Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=a0lbyz09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s28-20020a05620a031c00b007756c8c89e2si522345qkm.614.2023.11.22.14.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 14:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=a0lbyz09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5vt0-0007ju-Gu; Wed, 22 Nov 2023 17:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1r5vsz-0007jP-3W; Wed, 22 Nov 2023 17:39:57 -0500
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1r5vsw-0003DV-EB; Wed, 22 Nov 2023 17:39:56 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 588AECE2602;
 Wed, 22 Nov 2023 22:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC668C433C8;
 Wed, 22 Nov 2023 22:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700692789;
 bh=C9Y8hgu2wt52JIIUQ1QYsv7sBZwK6T04PUmGmTA0MFA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=a0lbyz09olyizfr75zoRN3iq3Ls8Yf9MRVRmqIQgP1GBN+PMZjr497Qn5FrVbYq1q
 iS0Ci1U035TjaHH6I/72ZatQypxpn9Ntng3QQ9wrahuGVtdcu37a/jQRCOCY3SNw3s
 t7MHlMC+mjG9UCikemA68EgKVtv7s0zS+pyVrgkWHw5ewNWDDvNMZuC5+/W8NUq3Rv
 WyUnR88oXQLzGzwvm/WP/MOfnAy/hk+qOf5ivs5JY+JOsVAhGzDQn/KErdxbD6Wcm/
 cPjE3jc4rB+RVdQ0JcMeNPboPibrZAEjuW34lR0XgvBzlflduCPlV6ok+pYb8nlj5W
 rbB6RHgEUcrJQ==
Date: Wed, 22 Nov 2023 14:39:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 David Woodhouse <dwmw@amazon.co.uk>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
 vikram.garhwal@amd.com
Subject: Re: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
In-Reply-To: <20231121221023.419901-7-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2311221436430.2053963@ubuntu-linux-20-04-desktop>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-7-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=145.40.73.55; envelope-from=sstabellini@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.058,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lEA3vfUO7/SL

+Vikram

On Tue, 21 Nov 2023, Volodymyr Babchuk wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The bridge is needed for virtio-pci support, as QEMU can emulate the
> whole bridge with any virtio-pci devices connected to it.
> 
> This patch provides a flexible way to configure PCIe brige resources
> with xenstore. We made this for several reasons:
> 
> - We don't want to clash with vPCI devices, so we need information
>   from Xen toolstack on which PCI bus to use.
> - The guest memory layout that describes these resources is not stable
>   and may vary between guests, so we cannot rely on static resources
>   to be always the same for both ends.
> - Also the device-models which run in different domains and serve
>   virtio-pci devices for the same guest should use different host
>   bridge resources for Xen to distinguish. The rule for the guest
>   device-tree generation is one PCI host bridge per backend domain.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There is still a discussion ongoing on xen-devel if / how to register a
PCI Root Complex or individual BDFs. In the meantime a couple of
comments.

Typically emulated devices are configured in QEMU via QEMU command line
parameters, not xenstore. If you are running QEMU in a domU (instead of
Dom0) you can always read config parameters from xenstore from a wrapper
bash script (using xenstore-read) and then pass the right command line
options to QEMU.

If you need help in adding new QEMU command line options, Vikram (CCed)
can help.


> ---
> 
> Changes from v1:
> 
>  - Renamed virtio_pci_host to pcie_host entries in XenStore, because
>  there is nothing specific to virtio-pci: any PCI device can be
>  emulated via this newly created bridge.
> ---
>  hw/arm/xen_arm.c            | 186 ++++++++++++++++++++++++++++++++++++
>  hw/xen/xen-hvm-common.c     |   9 +-
>  include/hw/xen/xen_native.h |   8 +-
>  3 files changed, 200 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index b9c3ae14b6..d506d55d0f 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -22,6 +22,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/visitor.h"
> @@ -34,6 +35,9 @@
>  #include "hw/xen/xen-hvm-common.h"
>  #include "sysemu/tpm.h"
>  #include "hw/xen/arch_hvm.h"
> +#include "exec/address-spaces.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/virtio/virtio-pci.h"
>  
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>  OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> @@ -58,6 +62,11 @@ struct XenArmState {
>      struct {
>          uint64_t tpm_base_addr;
>      } cfg;
> +
> +    MemMapEntry pcie_mmio;
> +    MemMapEntry pcie_ecam;
> +    MemMapEntry pcie_mmio_high;
> +    int         pcie_irq;
>  };
>  
>  static MemoryRegion ram_lo, ram_hi;
> @@ -73,6 +82,7 @@ static MemoryRegion ram_lo, ram_hi;
>  #define NR_VIRTIO_MMIO_DEVICES   \
>     (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
>  
> +/* TODO It should be xendevicemodel_set_pci_intx_level() for PCI interrupts. */
>  static void xen_set_irq(void *opaque, int irq, int level)
>  {
>      if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> @@ -129,6 +139,176 @@ static void xen_init_ram(MachineState *machine)
>      }
>  }
>  
> +static void xen_create_pcie(XenArmState *xam)
> +{
> +    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
> +    MemoryRegion *ecam_alias, *ecam_reg;
> +    DeviceState *dev;
> +    int i;
> +
> +    dev = qdev_new(TYPE_GPEX_HOST);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    /* Map ECAM space */
> +    ecam_alias = g_new0(MemoryRegion, 1);
> +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
> +                             ecam_reg, 0, xam->pcie_ecam.size);
> +    memory_region_add_subregion(get_system_memory(), xam->pcie_ecam.base,
> +                                ecam_alias);
> +
> +    /* Map the MMIO space */
> +    mmio_alias = g_new0(MemoryRegion, 1);
> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
> +                             mmio_reg,
> +                             xam->pcie_mmio.base,
> +                             xam->pcie_mmio.size);
> +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio.base,
> +                                mmio_alias);
> +
> +    /* Map the MMIO_HIGH space */
> +    mmio_alias_high = g_new0(MemoryRegion, 1);
> +    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high",
> +                             mmio_reg,
> +                             xam->pcie_mmio_high.base,
> +                             xam->pcie_mmio_high.size);
> +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio_high.base,
> +                                mmio_alias_high);
> +
> +    /* Legacy PCI interrupts (#INTA - #INTD) */
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
> +                                         xam->pcie_irq + i);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, xam->pcie_irq + i);
> +    }
> +
> +    DPRINTF("Created PCIe host bridge\n");
> +}
> +
> +static bool xen_read_pcie_prop(XenArmState *xam, unsigned int xen_domid,
> +                               const char *prop_name, unsigned long *data)
> +{
> +    char path[128], *value = NULL;
> +    unsigned int len;
> +    bool ret = true;
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/%s",
> +             xen_domid, prop_name);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +
> +    if (qemu_strtou64(value, NULL, 16, data)) {
> +        error_report("xenpv: Failed to get 'pcie_host/%s' prop",
> +                     prop_name);
> +        ret = false;
> +    }
> +
> +    free(value);
> +
> +    return ret;
> +}
> +
> +static int xen_get_pcie_params(XenArmState *xam)
> +{
> +    char path[128], *value = NULL, **entries = NULL;
> +    unsigned int len, tmp;
> +    int rc = -1;
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host",
> +             xen_domid);
> +    entries = xs_directory(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (entries == NULL) {
> +        error_report("xenpv: 'pcie_host' dir is not present");
> +        return -1;
> +    }
> +    free(entries);
> +    if (len != 9) {
> +        error_report("xenpv: Unexpected number of entries in 'pcie_host' dir");
> +        goto out;
> +    }
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/id",
> +             xen_domid);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (qemu_strtoui(value, NULL, 10, &tmp)) {
> +        error_report("xenpv: Failed to get 'pcie_host/id' prop");
> +        goto out;
> +    }
> +    free(value);
> +    value = NULL;
> +    if (tmp > 0xffff) {
> +        error_report("xenpv: Wrong 'pcie_host/id' value %u", tmp);
> +        goto out;
> +    }
> +    xen_pci_segment = tmp;
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_base",
> +                            &xam->pcie_ecam.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_size",
> +                            &xam->pcie_ecam.size)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "mem_base",
> +                            &xam->pcie_mmio.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "mem_size",
> +                            &xam->pcie_mmio.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_base",
> +                            &xam->pcie_mmio_high.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_size",
> +                            &xam->pcie_mmio_high.size)) {
> +        goto out;
> +    }
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/irq_first",
> +             xen_domid);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (qemu_strtoi(value, NULL, 10, &xam->pcie_irq)) {
> +        error_report("xenpv: Failed to get 'pcie_host/irq_first' prop");
> +        goto out;
> +    }
> +    free(value);
> +    value = NULL;
> +    DPRINTF("PCIe host bridge: irq_first %u\n", xam->pcie_irq);
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/num_irqs",
> +             xen_domid);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (qemu_strtoui(value, NULL, 10, &tmp)) {
> +        error_report("xenpv: Failed to get 'pcie_host/num_irqs' prop");
> +        goto out;
> +    }
> +    free(value);
> +    value = NULL;
> +    if (tmp != GPEX_NUM_IRQS) {
> +        error_report("xenpv: Wrong 'pcie_host/num_irqs' value %u", tmp);
> +        goto out;
> +    }
> +    DPRINTF("PCIe host bridge: num_irqs %u\n", tmp);
> +
> +    rc = 0;
> +out:
> +    if (value) {
> +        free(value);
> +    }
> +
> +    return rc;
> +}
> +
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>  {
>      hw_error("Invalid ioreq type 0x%x\n", req->type);
> @@ -189,6 +369,12 @@ static void xen_arm_init(MachineState *machine)
>      xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
>  
>      xen_create_virtio_mmio_devices(xam);
> +    if (!xen_get_pcie_params(xam)) {
> +        xen_create_pcie(xam);
> +    } else {
> +        DPRINTF("PCIe host bridge is not available,"
> +                "only virtio-mmio can be used\n");
> +    }
>  
>  #ifdef CONFIG_TPM
>      if (xam->cfg.tpm_base_addr) {
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 565dc39c8f..0f78f15057 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -47,6 +47,8 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>      g_free(pfn_list);
>  }
>  
> +uint16_t xen_pci_segment;
> +
>  static void xen_set_memory(struct MemoryListener *listener,
>                             MemoryRegionSection *section,
>                             bool add)
> @@ -382,7 +384,12 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
>      }
>  
>      QLIST_FOREACH(xendev, &state->dev_list, entry) {
> -        if (xendev->sbdf != sbdf) {
> +        /*
> +         * As we append xen_pci_segment just before forming dm_op in
> +         * xen_map_pcidev() we need to check with appended xen_pci_segment
> +         * here as well.
> +         */
> +        if ((xendev->sbdf | (xen_pci_segment << 16)) != sbdf) {
>              continue;
>          }
>  
> diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> index 6f09c48823..2b1debaff4 100644
> --- a/include/hw/xen/xen_native.h
> +++ b/include/hw/xen/xen_native.h
> @@ -431,6 +431,8 @@ static inline void xen_unmap_io_section(domid_t dom,
>                                                      0, start_addr, end_addr);
>  }
>  
> +extern uint16_t xen_pci_segment;
> +
>  static inline void xen_map_pcidev(domid_t dom,
>                                    ioservid_t ioservid,
>                                    PCIDevice *pci_dev)
> @@ -441,7 +443,8 @@ static inline void xen_map_pcidev(domid_t dom,
>  
>      trace_xen_map_pcidev(ioservid, pci_dev_bus_num(pci_dev),
>                           PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> -    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid, 0,
> +    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid,
> +                                              xen_pci_segment,
>                                                pci_dev_bus_num(pci_dev),
>                                                PCI_SLOT(pci_dev->devfn),
>                                                PCI_FUNC(pci_dev->devfn));
> @@ -457,7 +460,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>  
>      trace_xen_unmap_pcidev(ioservid, pci_dev_bus_num(pci_dev),
>                             PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> -    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid, 0,
> +    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid,
> +                                                  xen_pci_segment,
>                                                    pci_dev_bus_num(pci_dev),
>                                                    PCI_SLOT(pci_dev->devfn),
>                                                    PCI_FUNC(pci_dev->devfn));
> -- 
> 2.42.0
> 
