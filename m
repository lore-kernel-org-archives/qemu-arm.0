Received: by 10.25.44.15 with SMTP id s15csp3728463lfs;
        Mon, 31 Jul 2017 08:18:22 -0700 (PDT)
X-Received: by 10.237.35.58 with SMTP id h55mr6753832qtc.44.1501514302556;
        Mon, 31 Jul 2017 08:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501514302; cv=none;
        d=google.com; s=arc-20160816;
        b=IE8Vm/aBpKHoLYcCeRFd7eIZ0WS9LDQp0fThGw10p2ocmpvfe3UmNGJEC3BiVhRF1R
         0bpv+h4AVF6AWnCbjFOe+ohPRN9vxQFbu9QB1kToqdAyhvJWtiLYsiLA05sqNjQDdE+g
         PmuOOZI2+GSb0Sjf++7OR2jxydDHKehkN7f8YoPBBzmo/xP8pt5wXPkxH9orMdSf3rCn
         gB1NO9NQE+0eidYc3YpatWjOHfvtT5KmsWIk78ROD4MSgdEb2TIewunYwUsL/ui0VFbg
         b+5S6qWtrYlLagz7Ikww0YMxrirlfPpme4z+M6ZXxNv0WvFpUsKKcoaZJ/M9625SaxDd
         jKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=2y8l9nHgs+NZMMSNFW4K3yh+BYnkGKenRSyM9ld/TBk=;
        b=Kzb0d1zHCe8tSs9Ws/WDDStd7htbkfMCu6D1Zgy2OfuOCygcRTS40lVkFSR+EcxCTa
         DdXL2355pmXNEj8f/BVJPjbRVXQwpauwUJqBczkw0V9Q5DYuk02Io4mAOuy2agtLocyq
         +mukt62h/rEAOv6hgua9bDqrNGi2HUu7sJhHWRF0KSJK7M7R52qpIxErQUXXzHLDGsLx
         NbhqyH/LTwt0e3hiAKKIwyByQdgkAA5hkDszRxs654yrDa7VTu1aJ7KKkIKFF9eLFzPk
         myLTOGwqh4tiS4ai1Qafrqj/pN7F7NIMGDnsnbJwWbZT98JCwi77FKV0zNYbwLNRzDHW
         U+Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fcBIIhwZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si23871605qkh.340.2017.07.31.08.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 08:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fcBIIhwZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcCSZ-0001ig-Kq
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 11:18:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcCQX-0000aE-S5
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 11:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcCQR-00032A-CF
	for qemu-devel@nongnu.org; Mon, 31 Jul 2017 11:16:13 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcCQQ-00030D-VJ; Mon, 31 Jul 2017 11:16:07 -0400
Received: by mail-lf0-x241.google.com with SMTP id w199so12519989lff.2;
	Mon, 31 Jul 2017 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2y8l9nHgs+NZMMSNFW4K3yh+BYnkGKenRSyM9ld/TBk=;
	b=fcBIIhwZSoRbDfNznde/0t5UrU8lE10wkbHGx4ZWVV5NB7co3rgHEwKagNnUjg4mzh
	IIc6R6F+u6FR0cd5z1h4NJGMd9XpkkIC6fRNcf6SRyoV+o9L5mYSeBeW9Zf9wVHpelsX
	COZlGpzttSiwOKobA67YhLIK4iNB0iIWKWoik0quz8+NHXLDyTb1DthLmLK99HnsgibE
	Bvs/5ashsWCgQOnX0vj3zPACB5GDN0Vn4cZutrLPvKhnN9CMXVp0ZLtyaRw8vNMuFDQ6
	pScL4peJfHhTJwJiUgfNDLUmeEJh7Dx5FfXPKKHgxWZnqVFE1103lu308CIGqZN5Uu1V
	lCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2y8l9nHgs+NZMMSNFW4K3yh+BYnkGKenRSyM9ld/TBk=;
	b=YlKHdsB3gqZVeujrpq1M9FBABPIswwYGyBDUbxeSgKBkVJKeNBjZWZSuDN31QJat4D
	ToohpHRC/GLvQwz8N9SNy8C6TsriRXajk/6BXDuPDDYOPv8oaIz3bg5XD2XuJSNmrbI8
	NiyQMFgJKn+XiGeNeVwkgZwZ5brIpPVxS/GpubTOu6fBFt3ajpKElMHungesVtUva0mR
	Je+NgNORvuNg5LnZxtWSa0U8ED3OENZN0dLa+BPbaWh1zOQtnEfowfVWGulf9bokm+l+
	77FAkdkRfNs5Z8y2zGHozZzLeYZBv+kzpuZSxVsRlbnggDZ2idIc2dWEa55M6LO6Bq8f
	Kvbw==
X-Gm-Message-State: AIVw111Hd3aJzErABz8gHUQfkHiQJp5QxcLGJx0UvQ4kE76Fd5IEyIjn
	66zhdT4CX/dFjg==
X-Received: by 10.25.225.70 with SMTP id y67mr5759078lfg.34.1501514163795;
	Mon, 31 Jul 2017 08:16:03 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 1sm5921860ljh.16.2017.07.31.08.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 08:16:02 -0700 (PDT)
Date: Mon, 31 Jul 2017 17:16:02 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170731151602.GU4859@toto>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
	<b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the virt machine
 to be used as device ID
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
Cc: mst@redhat.com, qemu-devel@nongnu.org,
	Diana Craciun <diana.craciun@nxp.com>, mike.caraman@nxp.com,
	qemu-arm@nongnu.org, marcel@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eE5b5mukMN1P

On Wed, Jul 26, 2017 at 02:22:28PM +0200, Auger Eric wrote:
> Hi Diana,
> On 23/05/2017 13:12, Diana Craciun wrote:
> > Device IDs are required by the ARM GICv3 ITS for IRQ remapping.
> > Currently, for PCI devices, the requester ID was used as device
> > ID in the virt machine. If the system has multiple masters that
> if the system has multiple root complex?
> > use MSIs a unique ID accross the platform is needed.
> across
> > A static scheme is used and each master is allocated a range of IDs
> > with the formula:
> > DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as
> > recommended by SBSA).
> > 
> > This ID will be configured in the machine creation and if not configured
> > the PCI requester ID will be used insteead.
> instead
> > 
> > Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
> > ---
> >  hw/arm/virt.c              | 26 ++++++++++++++++++++++++++
> >  hw/pci-host/gpex.c         |  6 ++++++
> >  hw/pci/msi.c               |  2 +-
> >  hw/pci/pci.c               | 25 +++++++++++++++++++++++++
> >  include/hw/arm/virt.h      |  1 +
> >  include/hw/pci-host/gpex.h |  2 ++
> >  include/hw/pci/pci.h       |  8 ++++++++
> >  kvm-all.c                  |  4 ++--
> >  8 files changed, 71 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 5f62a03..a969694 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
> >  #define RAMLIMIT_GB 255
> >  #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> >  
> > +#define STREAM_ID_RANGE_SIZE 0x10000
> > +
> >  /* Addresses and sizes of our components.
> >   * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
> >   * 128MB..256MB is used for miscellaneous device I/O.
> > @@ -162,6 +164,22 @@ static const int a15irqmap[] = {
> >      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> >  };
> >  
> > +/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Currently
> > + * for PCI devices the requester ID was used as device ID. But if the system has
> > + * multiple masters that use MSIs, the requester ID may cause deviceID clashes.
> > + * So a unique number is  needed accross the system.
> > + * We are using the following formula:
> > + * DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant
> > + * (as recommanded by SBSA). Currently we do not have an SMMU emulation, but the
> > + * same formula can be used for the generation of the streamID as well.
> > + * For each master the device ID will be derrived from the requester ID using
> > + * the abovemntione formula.
> > + */
> I think most of this comment should only be in the commit message. typos
> in derived and above mentioned.
> 
> stream id is the terminology for the id space at the input of the smmu.
> device id is the terminology for the id space at the input of the msi
> controller I think.
> 
> RID -> deviceID (no IOMMU)
> RID -> streamID -> deviceID (IOMMU)
> 
> I would personally get rid of all streamid uses as the smmu is not yet
> supported and stick to the
> Documentation/devicetree/bindings/pci/pci-msi.txt terminology?
> 
> > +
> > +static const uint32_t streamidmap[] = {
> > +    [VIRT_PCIE] = 0,         /* currently only one PCI controller */
> > +};
> > +
> >  static const char *valid_cpus[] = {
> >      "cortex-a15",
> >      "cortex-a53",
> > @@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> >      hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
> >      hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
> >      hwaddr base = base_mmio;
> > +    uint32_t stream_id = vms->streamidmap[VIRT_PCIE] * STREAM_ID_RANGE_SIZE;
> msi-base?
> STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?
> >      int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
> >      int irq = vms->irqmap[VIRT_PCIE];
> >      MemoryRegion *mmio_alias;
> > @@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> >      PCIHostState *pci;
> >  
> >      dev = qdev_create(NULL, TYPE_GPEX_HOST);
> > +    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);
> >      qdev_init_nofail(dev);
> >  
> >      /* Map only the first size_ecam bytes of ECAM space */
> > @@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> >      if (vms->msi_phandle) {
> >          qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
> >                                 vms->msi_phandle);
> > +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",
> > +                                     1, 0,
> > +                                     1, vms->msi_phandle,
> > +                                     1, stream_id,
> > +                                     1, STREAM_ID_RANGE_SIZE);
> >      }
> >  
> >      qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> > @@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)
> >  
> >      vms->memmap = a15memmap;
> >      vms->irqmap = a15irqmap;
> > +    vms->streamidmap = streamidmap;
> >  }
> >  
> >  static void virt_machine_2_9_options(MachineClass *mc)
> > diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> > index 66055ee..de72408 100644
> > --- a/hw/pci-host/gpex.c
> > +++ b/hw/pci-host/gpex.c
> > @@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
> >      qemu_set_irq(s->irq[irq_num], level);
> >  }
> >  
> > +static Property gpex_props[] = {
> > +    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0),
> msi_base_base
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> >  static void gpex_host_realize(DeviceState *dev, Error **errp)
> >  {
> >      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> > @@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
> >  
> >      hc->root_bus_path = gpex_host_root_bus_path;
> >      dc->realize = gpex_host_realize;
> > +    dc->props = gpex_props;
> >      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >      dc->fw_name = "pci";
> >  }
> > diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> > index 7925851..b60a410 100644
> > --- a/hw/pci/msi.c
> > +++ b/hw/pci/msi.c
> > @@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
> >  {
> >      MemTxAttrs attrs = {};
> >  
> > -    attrs.stream_id = pci_requester_id(dev);
> > +    attrs.stream_id = pci_stream_id(dev);
> >      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
> >                           attrs, NULL);
> >  }
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index 259483b..92e9a2b 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)
> >      return pci_req_id_cache_extract(&dev->requester_id_cache);
> >  }
> >  
> > +static uint32_t pci_get_stream_id_base(PCIDevice *dev)
> > +{
> > +    PCIBus *rootbus = pci_device_root_bus(dev);
> > +    PCIHostState *host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
> > +    Error *err = NULL;
> > +    int64_t stream_id;
> > +
> > +    stream_id = object_property_get_int(OBJECT(host_bridge), "stream-id-base",
> > +                                        &err);
> > +    if (stream_id < 0) {
> > +        stream_id = 0;
> > +    }
> > +
> > +    return stream_id;
> > +}
> > +
> > +uint32_t pci_stream_id(PCIDevice *dev)
> > +{
> > +    /* Stream ID = RequesterID[15:0] + stream_id_base. stream_id_base may
> > +     * be 0 for devices that are not using any translation between requester_id
> > +     * and stream_id */
> > +    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base;
> > +}
> I think you should split the changes in virt from pci/gpex generic changes.
> 
> > +
> >  /* -1 for devfn means auto assign */
> >  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
> >                                           const char *name, int devfn,
> > @@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
> >  
> >      pci_dev->devfn = devfn;
> >      pci_dev->requester_id_cache = pci_req_id_cache_get(pci_dev);
> > +    pci_dev->stream_id_base = pci_get_stream_id_base(pci_dev);
> looks strange to me to store the rid base in the end point as this is
> rather a property of the PCI complex. I acknowledge this is much more

I agree.

I think that what we need is to add support for allowing PCI RCs
to transform requesterIDs in transactions attributes according to the
implementation specifics.

The way we did it when modelling the ZynqMP is by adding support for
transaction attribute translation in QEMU's IOMMU interface.
In our PCI RC, we have an IOMMU covering the entire AS that PCI devs DMA into.
This IOMMU doesn't do address-translation, only RequesterID -> StreamID
transforms according to how the ZynqMP PCI RC derives StreamIDs from RequesterIDs.

This is useful not only to model PCI RequesterID to AXI Master ID mappings but
also for modelling things like the ARM TZC (or the Xilinx ZynqMP XMPU/XPPUs).

Cheers,
Edgar


> simple than reworking pci_requester_id() though.
> >  
> >      memory_region_init(&pci_dev->bus_master_container_region, OBJECT(pci_dev),
> >                         "bus master container", UINT64_MAX);
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 33b0ff3..94c007a 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -99,6 +99,7 @@ typedef struct {
> >      struct arm_boot_info bootinfo;
> >      const MemMapEntry *memmap;
> >      const int *irqmap;
> > +    const uint32_t *streamidmap;
> >      int smp_cpus;
> >      void *fdt;
> >      int fdt_size;
> > diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> > index 68c9348..47df01a 100644
> > --- a/include/hw/pci-host/gpex.h
> > +++ b/include/hw/pci-host/gpex.h
> > @@ -48,6 +48,8 @@ typedef struct GPEXHost {
> >  
> >      GPEXRootState gpex_root;
> >  
> > +    uint32_t stream_id_base;
> > +
> >      MemoryRegion io_ioport;
> >      MemoryRegion io_mmio;
> >      qemu_irq irq[GPEX_NUM_IRQS];
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index a37a2d5..e6e9334 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -283,6 +283,12 @@ struct PCIDevice {
> >       * MSI). For conventional PCI root complex, this field is
> >       * meaningless. */
> >      PCIReqIDCache requester_id_cache;
> > +    /* Some platforms need a unique ID for IOMMU source identification
> > +     * or MSI source identification. QEMU implements a simple scheme:
> > +     * stream_id =  stream_id_base + requester_id. The stream_id_base will
> > +     * ensure that all the devices in the system have different stream ID
> > +     * domains */
> > +    uint32_t stream_id_base;
> get rid of IOMMU terminology?
> 
> Note that when adding other sub-systems you will need to address the
> ACPI side as the IORT table built by hw/arm/virt-acpi-build.c currently
> defines an RID mapping for the single root complex.
> 
> Thanks
> 
> Eric
> >      char name[64];
> >      PCIIORegion io_regions[PCI_NUM_REGIONS];
> >      AddressSpace bus_master_as;
> > @@ -737,6 +743,8 @@ static inline uint16_t pci_get_bdf(PCIDevice *dev)
> >  
> >  uint16_t pci_requester_id(PCIDevice *dev);
> >  
> > +uint32_t pci_stream_id(PCIDevice *dev);
> > +
> >  /* DMA access functions */
> >  static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
> >  {
> > diff --git a/kvm-all.c b/kvm-all.c
> > index 90b8573..5a508c3 100644
> > --- a/kvm-all.c
> > +++ b/kvm-all.c
> > @@ -1280,7 +1280,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> >      kroute.u.msi.data = le32_to_cpu(msg.data);
> >      if (kvm_msi_devid_required()) {
> >          kroute.flags = KVM_MSI_VALID_DEVID;
> > -        kroute.u.msi.devid = pci_requester_id(dev);
> > +        kroute.u.msi.devid = pci_stream_id(dev);
> >      }
> >      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
> >          kvm_irqchip_release_virq(s, virq);
> > @@ -1317,7 +1317,7 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
> >      kroute.u.msi.data = le32_to_cpu(msg.data);
> >      if (kvm_msi_devid_required()) {
> >          kroute.flags = KVM_MSI_VALID_DEVID;
> > -        kroute.u.msi.devid = pci_requester_id(dev);
> > +        kroute.u.msi.devid = pci_stream_id(dev);
> >      }
> >      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
> >          return -EINVAL;
> > 
> 
