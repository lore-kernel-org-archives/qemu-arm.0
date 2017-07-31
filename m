Received: by 10.25.44.15 with SMTP id s15csp3750444lfs;
        Mon, 31 Jul 2017 08:40:21 -0700 (PDT)
X-Received: by 10.55.100.206 with SMTP id y197mr23613567qkb.56.1501515621319;
        Mon, 31 Jul 2017 08:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501515621; cv=none;
        d=google.com; s=arc-20160816;
        b=xTYt9Da4IDnG2B4+5iqIGxGD+Yo9ftOmP0xZSxaIRDt543OmqT2Qk/AB6UNK79Misc
         7jaKxhVUGnuuRghJeBl5B+tdYwx6a1MyhSZpI+XShU5H7Wc7PRjx0dtgRTGlrt5YzW4R
         i1x4p/aRFpARDUVsLfJx2KHScST1b9ToXVtV7R/BhJhfQoCjUqXYWIAIWoan7cIDNuDu
         8h0TKo4GG6Xxsj3Y97vGPh01QjVjxZNsYta25g3JrrvqXTVMcpd5MCRHEnj+xk3yuOiU
         XKKJvPuRA9GrO8ZtcXD9HMLTz7uXd1C03mjgT62WAAZIUKFAuqy7CwOzLjjo8Ce0Bo9v
         XKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=bcA7DfVU0AwhpoRg1S/44zlQPAo6U+aFJuRDN1A1jmg=;
        b=LhmpPcKtnCeqGAkscE9crIGhDVkLl+8U9VTVsKS8Asf6s2il3365HpgH4uk4svlvfF
         UNy0l8L1E3c2RmKyXfBu4JJt5UQeErRBaEcyJ9qImijBWiVguxReOGxJ6VaJXLee3ASw
         RWNbP0siWmTmsWXAjMKfJy7iqUPWQ2OgLVqNOfTVSFw5glcl926TOSKRjSttH5x8RPK6
         mma0AaZGj97H4fWabjuVXTP6VPhRUSMuizWgZkXsw9twfBzlbXfhnBay9lCVcC0UtzTN
         ph2EqczCMu0ni7Cr/le9QBWyMB/2lJx1WdQtn1A7o0mYuZofyMQUGmvZ79I0saduAhFq
         VX3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aK+0KVhs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a38si24959599qka.545.2017.07.31.08.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 08:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aK+0KVhs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcCnq-0001Hq-Cl
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 11:40:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcCnh-00019M-3F
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 11:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcCna-00045F-Se
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 11:40:09 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcCnV-00042L-AZ; Mon, 31 Jul 2017 11:39:57 -0400
Received: by mail-lf0-x242.google.com with SMTP id t128so14618925lff.3;
	Mon, 31 Jul 2017 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bcA7DfVU0AwhpoRg1S/44zlQPAo6U+aFJuRDN1A1jmg=;
	b=aK+0KVhs07N+J/iiT0veGYVO3HZ8ekA0zHKPbn5HMsMV+rOc/1XHkkBMp9Zx+KLOyH
	AozS9wx+eW5lmOURttAKa1rpLBwFvjPdd0/OzhAfIt9GfJKS8pEXrQCXPK3OhLvrZwxi
	J+l0+QNrjxV+sD7hym3WIPG6ICpmadd9DFIIvXeEUo2QMT0MVo4/O1fDqVJQDOpuLz6u
	ZDOJ0XJqSQquaV4XC+Dsdvt2nh5StO3tiCMlyg7IDcm2X6XQLcoKh6Mrr6/7KKg+au+R
	BayRC7h0/659OJD/E9G2Cfy7SgbMwr8uaAXM2zPn84cE0Fg2pBPrDyHnn+ogO6TfV7fA
	VTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bcA7DfVU0AwhpoRg1S/44zlQPAo6U+aFJuRDN1A1jmg=;
	b=j5cLYQiyA+GgsJOWWZ1DI8aB+2CqKhGh93duezEav8Q3ShP6mCQ3gCITDDCYddK+fS
	5JqfV2et0JvrCKs7Ahgwx2KeIDNJMgtXbMx0v4BtFPKxqzkOptvvCztF3t0y+CJ3XtZG
	Tq3MOp7htzdNW+LQS4pIJArYQSyKDNtL5TbQgOwjCxq1DGooCpZytA/kFN2zVdBJjjE2
	kwfiOrq0/hInzVzNp02i/FQqeGeek2T+1lq+w/taRnyc79/lIzB9B1z9C1l2Gc4hQs1b
	QRxrUZJLb+uQxuu9MMU95qi1Iy6OA3Jii9pnGAX/c1rus1A8JGq93dRichRyGjtkyxxo
	BYVQ==
X-Gm-Message-State: AIVw110uCNLfadTsrtxQik3NHzKXlxtwNf812NZOWBNBKljVQZu8Me6k
	1COUcbgMUfoJzw==
X-Received: by 10.46.32.141 with SMTP id g13mr5189493lji.75.1501515595700;
	Mon, 31 Jul 2017 08:39:55 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id e7sm5155134ljb.84.2017.07.31.08.39.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 08:39:54 -0700 (PDT)
Date: Mon, 31 Jul 2017 17:39:54 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170731153954.GV4859@toto>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
	<b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
	<20170731151602.GU4859@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170731151602.GU4859@toto>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] Add a unique ID in the
 virt machine to be used as device ID
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
Cc: mst@redhat.com, qemu-devel@nongnu.org,
	Diana Craciun <diana.craciun@nxp.com>, mike.caraman@nxp.com,
	qemu-arm@nongnu.org, marcel@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8KgI32aiawvA

On Mon, Jul 31, 2017 at 05:16:02PM +0200, Edgar E. Iglesias wrote:
> On Wed, Jul 26, 2017 at 02:22:28PM +0200, Auger Eric wrote:
> > Hi Diana,
> > On 23/05/2017 13:12, Diana Craciun wrote:
> > > Device IDs are required by the ARM GICv3 ITS for IRQ remapping.
> > > Currently, for PCI devices, the requester ID was used as device
> > > ID in the virt machine. If the system has multiple masters that
> > if the system has multiple root complex?
> > > use MSIs a unique ID accross the platform is needed.
> > across
> > > A static scheme is used and each master is allocated a range of IDs
> > > with the formula:
> > > DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as
> > > recommended by SBSA).
> > > 
> > > This ID will be configured in the machine creation and if not configured
> > > the PCI requester ID will be used insteead.
> > instead
> > > 
> > > Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
> > > ---
> > >  hw/arm/virt.c              | 26 ++++++++++++++++++++++++++
> > >  hw/pci-host/gpex.c         |  6 ++++++
> > >  hw/pci/msi.c               |  2 +-
> > >  hw/pci/pci.c               | 25 +++++++++++++++++++++++++
> > >  include/hw/arm/virt.h      |  1 +
> > >  include/hw/pci-host/gpex.h |  2 ++
> > >  include/hw/pci/pci.h       |  8 ++++++++
> > >  kvm-all.c                  |  4 ++--
> > >  8 files changed, 71 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 5f62a03..a969694 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
> > >  #define RAMLIMIT_GB 255
> > >  #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> > >  
> > > +#define STREAM_ID_RANGE_SIZE 0x10000
> > > +
> > >  /* Addresses and sizes of our components.
> > >   * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
> > >   * 128MB..256MB is used for miscellaneous device I/O.
> > > @@ -162,6 +164,22 @@ static const int a15irqmap[] = {
> > >      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> > >  };
> > >  
> > > +/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Currently
> > > + * for PCI devices the requester ID was used as device ID. But if the system has
> > > + * multiple masters that use MSIs, the requester ID may cause deviceID clashes.
> > > + * So a unique number is  needed accross the system.
> > > + * We are using the following formula:
> > > + * DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant
> > > + * (as recommanded by SBSA). Currently we do not have an SMMU emulation, but the
> > > + * same formula can be used for the generation of the streamID as well.
> > > + * For each master the device ID will be derrived from the requester ID using
> > > + * the abovemntione formula.
> > > + */
> > I think most of this comment should only be in the commit message. typos
> > in derived and above mentioned.
> > 
> > stream id is the terminology for the id space at the input of the smmu.
> > device id is the terminology for the id space at the input of the msi
> > controller I think.
> > 
> > RID -> deviceID (no IOMMU)
> > RID -> streamID -> deviceID (IOMMU)
> > 
> > I would personally get rid of all streamid uses as the smmu is not yet
> > supported and stick to the
> > Documentation/devicetree/bindings/pci/pci-msi.txt terminology?
> > 
> > > +
> > > +static const uint32_t streamidmap[] = {
> > > +    [VIRT_PCIE] = 0,         /* currently only one PCI controller */
> > > +};
> > > +
> > >  static const char *valid_cpus[] = {
> > >      "cortex-a15",
> > >      "cortex-a53",
> > > @@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> > >      hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
> > >      hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
> > >      hwaddr base = base_mmio;
> > > +    uint32_t stream_id = vms->streamidmap[VIRT_PCIE] * STREAM_ID_RANGE_SIZE;
> > msi-base?
> > STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?
> > >      int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
> > >      int irq = vms->irqmap[VIRT_PCIE];
> > >      MemoryRegion *mmio_alias;
> > > @@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> > >      PCIHostState *pci;
> > >  
> > >      dev = qdev_create(NULL, TYPE_GPEX_HOST);
> > > +    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);
> > >      qdev_init_nofail(dev);
> > >  
> > >      /* Map only the first size_ecam bytes of ECAM space */
> > > @@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> > >      if (vms->msi_phandle) {
> > >          qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
> > >                                 vms->msi_phandle);
> > > +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",
> > > +                                     1, 0,
> > > +                                     1, vms->msi_phandle,
> > > +                                     1, stream_id,
> > > +                                     1, STREAM_ID_RANGE_SIZE);
> > >      }
> > >  
> > >      qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> > > @@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)
> > >  
> > >      vms->memmap = a15memmap;
> > >      vms->irqmap = a15irqmap;
> > > +    vms->streamidmap = streamidmap;
> > >  }
> > >  
> > >  static void virt_machine_2_9_options(MachineClass *mc)
> > > diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> > > index 66055ee..de72408 100644
> > > --- a/hw/pci-host/gpex.c
> > > +++ b/hw/pci-host/gpex.c
> > > @@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
> > >      qemu_set_irq(s->irq[irq_num], level);
> > >  }
> > >  
> > > +static Property gpex_props[] = {
> > > +    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0),
> > msi_base_base
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > >  static void gpex_host_realize(DeviceState *dev, Error **errp)
> > >  {
> > >      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> > > @@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
> > >  
> > >      hc->root_bus_path = gpex_host_root_bus_path;
> > >      dc->realize = gpex_host_realize;
> > > +    dc->props = gpex_props;
> > >      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > >      dc->fw_name = "pci";
> > >  }
> > > diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> > > index 7925851..b60a410 100644
> > > --- a/hw/pci/msi.c
> > > +++ b/hw/pci/msi.c
> > > @@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
> > >  {
> > >      MemTxAttrs attrs = {};
> > >  
> > > -    attrs.stream_id = pci_requester_id(dev);
> > > +    attrs.stream_id = pci_stream_id(dev);
> > >      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
> > >                           attrs, NULL);
> > >  }
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index 259483b..92e9a2b 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)
> > >      return pci_req_id_cache_extract(&dev->requester_id_cache);
> > >  }
> > >  
> > > +static uint32_t pci_get_stream_id_base(PCIDevice *dev)
> > > +{
> > > +    PCIBus *rootbus = pci_device_root_bus(dev);
> > > +    PCIHostState *host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
> > > +    Error *err = NULL;
> > > +    int64_t stream_id;
> > > +
> > > +    stream_id = object_property_get_int(OBJECT(host_bridge), "stream-id-base",
> > > +                                        &err);
> > > +    if (stream_id < 0) {
> > > +        stream_id = 0;
> > > +    }
> > > +
> > > +    return stream_id;
> > > +}
> > > +
> > > +uint32_t pci_stream_id(PCIDevice *dev)
> > > +{
> > > +    /* Stream ID = RequesterID[15:0] + stream_id_base. stream_id_base may
> > > +     * be 0 for devices that are not using any translation between requester_id
> > > +     * and stream_id */
> > > +    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base;
> > > +}
> > I think you should split the changes in virt from pci/gpex generic changes.
> > 
> > > +
> > >  /* -1 for devfn means auto assign */
> > >  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
> > >                                           const char *name, int devfn,
> > > @@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
> > >  
> > >      pci_dev->devfn = devfn;
> > >      pci_dev->requester_id_cache = pci_req_id_cache_get(pci_dev);
> > > +    pci_dev->stream_id_base = pci_get_stream_id_base(pci_dev);
> > looks strange to me to store the rid base in the end point as this is
> > rather a property of the PCI complex. I acknowledge this is much more
> 
> I agree.
> 
> I think that what we need is to add support for allowing PCI RCs
> to transform requesterIDs in transactions attributes according to the
> implementation specifics.
> 
> The way we did it when modelling the ZynqMP is by adding support for
> transaction attribute translation in QEMU's IOMMU interface.
> In our PCI RC, we have an IOMMU covering the entire AS that PCI devs DMA into.
> This IOMMU doesn't do address-translation, only RequesterID -> StreamID
> transforms according to how the ZynqMP PCI RC derives StreamIDs from RequesterIDs.
> 
> This is useful not only to model PCI RequesterID to AXI Master ID mappings but
> also for modelling things like the ARM TZC (or the Xilinx ZynqMP XMPU/XPPUs).
> 


BTW, for AMBA devices, I think upstream is still missing a way for machines
to configure a memory attributes template for DMA devices (e.g with the
MasterID)...

That would also be needed for GICv3 ITS and MSI's originating from non-PCI
devs...

Cheers,
Edgar
