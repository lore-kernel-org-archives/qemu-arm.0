Received: by 10.223.188.70 with SMTP id a6csp5313057wrh;
        Tue, 22 Aug 2017 12:04:49 -0700 (PDT)
X-Received: by 10.55.6.145 with SMTP id 139mr243888qkg.222.1503428689144;
        Tue, 22 Aug 2017 12:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503428689; cv=none;
        d=google.com; s=arc-20160816;
        b=SVv4K9iqF1HZTsMcdD6X6k2xPNAH5aDvdYgA0zZqBJMVhR71q172vVO4RkGZDIxkWI
         NnXOvb/GVxxHinyikwD0XmSGldBRhtTSLdVyttlI/8BcjN1CwMU0LWeRPybGCUz03S46
         Im/Kmp2MYNuw9gs4ak9BcdtTKt9wpkr1qO/3dJ9IESKbSEvTxe9agP2f3KmQZyWQnsSm
         lXwLvy8mX8tyKPg5PZQtun+ADNRKg1jSIpK+ygXcol8LjHbw6osY4lXM22U0PYk93Kt3
         DJXyxa75pAXcIO4wZBkAKuJ9gs0w+izt5KRGti0WFBd4m3GR69IyyMLq5j+/s1AOIK2D
         EfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=mZ9MB0XXFL1oKVhuUrrSV+vTEB6/d8bGJRXJnwFng1w=;
        b=mYmpAMYGEWhg9HCNJKwka7qUqV7loMBDsI8+fOKqytcIHZ94FwxAkeQzchlF+ks9Y7
         dPIF+45P9Ap3qLslXlp04UZtDRNPqWCDyArDSLUgMmDxegrTJAeX89CNrlbxpSj7TK8J
         wOpT+M4ducA6RllXa1yTaKissL9KyjeQRg1DVOgjO86yHaCfFWZp3YzR0PB5fAaQLw+z
         Mv7OEDuMO/+1RY3CQlT+IWempFfE3ol/0cmPLQNqQ4TlsdB3pQ6pa4PSyRcz5nM2iEle
         tCnySKO1QrU6y5/c06eCLgeBvBgoaYw5v2q1OjV9XTbOoHXhbH732SWShUMKntPceJQx
         ZD0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2si13929875qtb.385.2017.08.22.12.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 12:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkETm-0004Bf-LP
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 15:04:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dkETb-00049f-Hy
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 15:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dkETY-0005tP-Bq
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 15:04:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dkETY-0005se-2S; Tue, 22 Aug 2017 15:04:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE1FF13AAB;
	Tue, 22 Aug 2017 19:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EE1FF13AAB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mst@redhat.com
Received: from redhat.com (ovpn-125-55.rdu2.redhat.com [10.10.125.55])
	by smtp.corp.redhat.com (Postfix) with SMTP id 1DE9B5D724;
	Tue, 22 Aug 2017 19:04:25 +0000 (UTC)
Date: Tue, 22 Aug 2017 22:04:25 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Diana Madalina Craciun <diana.craciun@nxp.com>
Message-ID: <20170822214318-mutt-send-email-mst@kernel.org>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
	<b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
	<20170731151602.GU4859@toto>
	<AM3PR04MB0616508E7E868475F181AC18FF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170811155027.GO4859@toto>
	<AM3PR04MB0616C6B8D91F8C86BA086FF0FF840@AM3PR04MB0616.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM3PR04MB0616C6B8D91F8C86BA086FF0FF840@AM3PR04MB0616.eurprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 22 Aug 2017 19:04:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 25GNMUdw/J0j

On Tue, Aug 22, 2017 at 03:13:57PM +0000, Diana Madalina Craciun wrote:
> On 08/11/2017 06:50 PM, Edgar E. Iglesias wrote:
> > On Fri, Aug 11, 2017 at 02:35:28PM +0000, Diana Madalina Craciun wrote:
> >> Hi Edgar,
> >>
> >> On 07/31/2017 06:16 PM, Edgar E. Iglesias wrote:
> >>> On Wed, Jul 26, 2017 at 02:22:28PM +0200, Auger Eric wrote:
> >>>> Hi Diana,
> >>>> On 23/05/2017 13:12, Diana Craciun wrote:
> >>>>> Device IDs are required by the ARM GICv3 ITS for IRQ remapping.
> >>>>> Currently, for PCI devices, the requester ID was used as device
> >>>>> ID in the virt machine. If the system has multiple masters that
> >>>> if the system has multiple root complex?
> >>>>> use MSIs a unique ID accross the platform is needed.
> >>>> across
> >>>>> A static scheme is used and each master is allocated a range of IDs
> >>>>> with the formula:
> >>>>> DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as
> >>>>> recommended by SBSA).
> >>>>>
> >>>>> This ID will be configured in the machine creation and if not configured
> >>>>> the PCI requester ID will be used insteead.
> >>>> instead
> >>>>> Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
> >>>>> ---
> >>>>>  hw/arm/virt.c              | 26 ++++++++++++++++++++++++++
> >>>>>  hw/pci-host/gpex.c         |  6 ++++++
> >>>>>  hw/pci/msi.c               |  2 +-
> >>>>>  hw/pci/pci.c               | 25 +++++++++++++++++++++++++
> >>>>>  include/hw/arm/virt.h      |  1 +
> >>>>>  include/hw/pci-host/gpex.h |  2 ++
> >>>>>  include/hw/pci/pci.h       |  8 ++++++++
> >>>>>  kvm-all.c                  |  4 ++--
> >>>>>  8 files changed, 71 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>>> index 5f62a03..a969694 100644
> >>>>> --- a/hw/arm/virt.c
> >>>>> +++ b/hw/arm/virt.c
> >>>>> @@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
> >>>>>  #define RAMLIMIT_GB 255
> >>>>>  #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> >>>>>  
> >>>>> +#define STREAM_ID_RANGE_SIZE 0x10000
> >>>>> +
> >>>>>  /* Addresses and sizes of our components.
> >>>>>   * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
> >>>>>   * 128MB..256MB is used for miscellaneous device I/O.
> >>>>> @@ -162,6 +164,22 @@ static const int a15irqmap[] = {
> >>>>>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> >>>>>  };
> >>>>>  
> >>>>> +/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Currently
> >>>>> + * for PCI devices the requester ID was used as device ID. But if the system has
> >>>>> + * multiple masters that use MSIs, the requester ID may cause deviceID clashes.
> >>>>> + * So a unique number is  needed accross the system.
> >>>>> + * We are using the following formula:
> >>>>> + * DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant
> >>>>> + * (as recommanded by SBSA). Currently we do not have an SMMU emulation, but the
> >>>>> + * same formula can be used for the generation of the streamID as well.
> >>>>> + * For each master the device ID will be derrived from the requester ID using
> >>>>> + * the abovemntione formula.
> >>>>> + */
> >>>> I think most of this comment should only be in the commit message. typos
> >>>> in derived and above mentioned.
> >>>>
> >>>> stream id is the terminology for the id space at the input of the smmu.
> >>>> device id is the terminology for the id space at the input of the msi
> >>>> controller I think.
> >>>>
> >>>> RID -> deviceID (no IOMMU)
> >>>> RID -> streamID -> deviceID (IOMMU)
> >>>>
> >>>> I would personally get rid of all streamid uses as the smmu is not yet
> >>>> supported and stick to the
> >>>> Documentation/devicetree/bindings/pci/pci-msi.txt terminology?
> >>>>
> >>>>> +
> >>>>> +static const uint32_t streamidmap[] = {
> >>>>> +    [VIRT_PCIE] = 0,         /* currently only one PCI controller */
> >>>>> +};
> >>>>> +
> >>>>>  static const char *valid_cpus[] = {
> >>>>>      "cortex-a15",
> >>>>>      "cortex-a53",
> >>>>> @@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> >>>>>      hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
> >>>>>      hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
> >>>>>      hwaddr base = base_mmio;
> >>>>> +    uint32_t stream_id = vms->streamidmap[VIRT_PCIE] * STREAM_ID_RANGE_SIZE;
> >>>> msi-base?
> >>>> STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?
> >>>>>      int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
> >>>>>      int irq = vms->irqmap[VIRT_PCIE];
> >>>>>      MemoryRegion *mmio_alias;
> >>>>> @@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> >>>>>      PCIHostState *pci;
> >>>>>  
> >>>>>      dev = qdev_create(NULL, TYPE_GPEX_HOST);
> >>>>> +    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);
> >>>>>      qdev_init_nofail(dev);
> >>>>>  
> >>>>>      /* Map only the first size_ecam bytes of ECAM space */
> >>>>> @@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
> >>>>>      if (vms->msi_phandle) {
> >>>>>          qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
> >>>>>                                 vms->msi_phandle);
> >>>>> +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",
> >>>>> +                                     1, 0,
> >>>>> +                                     1, vms->msi_phandle,
> >>>>> +                                     1, stream_id,
> >>>>> +                                     1, STREAM_ID_RANGE_SIZE);
> >>>>>      }
> >>>>>  
> >>>>>      qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> >>>>> @@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)
> >>>>>  
> >>>>>      vms->memmap = a15memmap;
> >>>>>      vms->irqmap = a15irqmap;
> >>>>> +    vms->streamidmap = streamidmap;
> >>>>>  }
> >>>>>  
> >>>>>  static void virt_machine_2_9_options(MachineClass *mc)
> >>>>> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> >>>>> index 66055ee..de72408 100644
> >>>>> --- a/hw/pci-host/gpex.c
> >>>>> +++ b/hw/pci-host/gpex.c
> >>>>> @@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
> >>>>>      qemu_set_irq(s->irq[irq_num], level);
> >>>>>  }
> >>>>>  
> >>>>> +static Property gpex_props[] = {
> >>>>> +    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0),
> >>>> msi_base_base
> >>>>> +    DEFINE_PROP_END_OF_LIST(),
> >>>>> +};
> >>>>> +
> >>>>>  static void gpex_host_realize(DeviceState *dev, Error **errp)
> >>>>>  {
> >>>>>      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> >>>>> @@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
> >>>>>  
> >>>>>      hc->root_bus_path = gpex_host_root_bus_path;
> >>>>>      dc->realize = gpex_host_realize;
> >>>>> +    dc->props = gpex_props;
> >>>>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >>>>>      dc->fw_name = "pci";
> >>>>>  }
> >>>>> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> >>>>> index 7925851..b60a410 100644
> >>>>> --- a/hw/pci/msi.c
> >>>>> +++ b/hw/pci/msi.c
> >>>>> @@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
> >>>>>  {
> >>>>>      MemTxAttrs attrs = {};
> >>>>>  
> >>>>> -    attrs.stream_id = pci_requester_id(dev);
> >>>>> +    attrs.stream_id = pci_stream_id(dev);
> >>>>>      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
> >>>>>                           attrs, NULL);
> >>>>>  }
> >>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>>>> index 259483b..92e9a2b 100644
> >>>>> --- a/hw/pci/pci.c
> >>>>> +++ b/hw/pci/pci.c
> >>>>> @@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)
> >>>>>      return pci_req_id_cache_extract(&dev->requester_id_cache);
> >>>>>  }
> >>>>>  
> >>>>> +static uint32_t pci_get_stream_id_base(PCIDevice *dev)
> >>>>> +{
> >>>>> +    PCIBus *rootbus = pci_device_root_bus(dev);
> >>>>> +    PCIHostState *host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
> >>>>> +    Error *err = NULL;
> >>>>> +    int64_t stream_id;
> >>>>> +
> >>>>> +    stream_id = object_property_get_int(OBJECT(host_bridge), "stream-id-base",
> >>>>> +                                        &err);
> >>>>> +    if (stream_id < 0) {
> >>>>> +        stream_id = 0;
> >>>>> +    }
> >>>>> +
> >>>>> +    return stream_id;
> >>>>> +}
> >>>>> +
> >>>>> +uint32_t pci_stream_id(PCIDevice *dev)
> >>>>> +{
> >>>>> +    /* Stream ID = RequesterID[15:0] + stream_id_base. stream_id_base may
> >>>>> +     * be 0 for devices that are not using any translation between requester_id
> >>>>> +     * and stream_id */
> >>>>> +    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base;
> >>>>> +}
> >>>> I think you should split the changes in virt from pci/gpex generic changes.
> >>>>
> >>>>> +
> >>>>>  /* -1 for devfn means auto assign */
> >>>>>  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
> >>>>>                                           const char *name, int devfn,
> >>>>> @@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
> >>>>>  
> >>>>>      pci_dev->devfn = devfn;
> >>>>>      pci_dev->requester_id_cache = pci_req_id_cache_get(pci_dev);
> >>>>> +    pci_dev->stream_id_base = pci_get_stream_id_base(pci_dev);
> >>>> looks strange to me to store the rid base in the end point as this is
> >>>> rather a property of the PCI complex. I acknowledge this is much more
> >>> I agree.
> >> The reason I have changed was to avoid traversing the entire hierarchy
> >> each time the ID is needed (for example each time when a MSI is sent).
> >>
> >>> I think that what we need is to add support for allowing PCI RCs
> >>> to transform requesterIDs in transactions attributes according to the
> >>> implementation specifics.
> >> Do you mean that you need more than a linear offset between requesterID
> >> and whatever other ID?
> >
> > Yes.
> >
> > This is my understanding for the ARM platforms I'm familiar with:
> >
> > Since AXI busses don't have a defined way to carry Master IDs, these
> > are typically carried on the AXI user signals. I'll just refer to
> > these signals as AXI Master IDs.
> >
> > 1. An endpoint issues an MSI (or any) transaction on the PCI bus.
> >    In QEMU, these trasactions carry the requester ID in their attributes.
> >
> > 2. The transaction hits the PCI "host" bridge to the SoC internal
> >    interconnect (typically AXI). This bridge needs to forward the
> >    PCI transaction onto the AXI bus. Including mapping the PCI
> >    RequesterID into an AXI MasterID.
> >
> > 3. The AXI transaction hits the IOMMU and the MasterID is mapped
> >    into a streamID to identify the origin of the transaction
> >    and apply address translation accordingly. If the SMMU
> >    allows the transaction to pass, the stream ID is mapped back
> >    into the transactions MasterID.
> >
> > 4. The AXI transaction continues down the interconnect and hits
> >    the MSI doorbell and the MasterID is mapped into a DeviceID to
> >    identify the origin of the MSI and apply possible interrupt translation.
> >
> > Adding streamID fields to a PCI endpoint doesn't make any sense to me.
> > The requester ID is already there and is IMO enough.
> > StreamIDs are a concept of ARM System MMUs, not of PCI endpoints.
> 
> What I have added into the endpoint is actually the Master ID (in QEMU
> it is actually equal with the streamID). I agree that this is a property
> of the root complex, the only reason I have put it into the endpoint was
> to avoid traversing the PCI hierarchy each time an MSI is sent.

Can all this be folded into the IOMMU? Then you might be able to get by
with defining an iommu function.  pci_device_iommu_address_space already
walks the hierarchy.



> >
> > When modelling #2, hardcoding a specific linear mapping between
> > PCI requester IDs and AXI Master IDs may work for one platform
> > but it won't work for all platforms. There is no one mapping for all.
> > It can even be run-time programmable in the bridge.

OK but how does it work with the specific bridge that you emulate?
There is no need to model advanced bridges with super flexible
programmable mappings if guests do not need them to run.

> 
> One solution might be defining a function in the generic host bridge
> which by default returns the requesterIDs (assumes that requesterID is
> the same with the masterID). This function can be over overridden by
> each specific implementation.
> 
> >
> > IIRC, the SMMUv3 docs have a section that suggest how these ReqID to AXI Master ID mappings can be done.
> 
> I did not find the specific section, just that the streamID should be
> derived from requesterID.
> 
> 
> Thanks,
> 
> Diana

> >
> >
> >>> The way we did it when modelling the ZynqMP is by adding support for
> >>> transaction attribute translation in QEMU's IOMMU interface.
> >>> In our PCI RC, we have an IOMMU covering the entire AS that PCI devs DMA into.
> >>> This IOMMU doesn't do address-translation, only RequesterID -> StreamID
> >>> transforms according to how the ZynqMP PCI RC derives StreamIDs from RequesterIDs.
> >> Are there any patches for this support in order for me to better understand?
> > It's currently on the Xilinx QEMU fork on GitHub.
> > https://github.com/Xilinx/qemu/blob/master/hw/pci-host/xlnx-nwl-pcie-main.c
> >
> > In the current ZynqMP, all RequesterIDs map to a single MasterID (it's a HW limitation).
> > In future versions of the HW, another mapping will be used.
> > I can't share code for the latter yet though....
> >
> > Best regards,
> > Edgar
> >
> >  
> >
> >> Thanks,
> >>
> >> Diana
> >>
> >>
> >>> This is useful not only to model PCI RequesterID to AXI Master ID mappings but
> >>> also for modelling things like the ARM TZC (or the Xilinx ZynqMP XMPU/XPPUs).
> >>>
> >>> Cheers,
> >>> Edgar
> >>>
> >>>
> >>>> simple than reworking pci_requester_id() though.
> >>>>>  
> >>>>>      memory_region_init(&pci_dev->bus_master_container_region, OBJECT(pci_dev),
> >>>>>                         "bus master container", UINT64_MAX);
> >>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >>>>> index 33b0ff3..94c007a 100644
> >>>>> --- a/include/hw/arm/virt.h
> >>>>> +++ b/include/hw/arm/virt.h
> >>>>> @@ -99,6 +99,7 @@ typedef struct {
> >>>>>      struct arm_boot_info bootinfo;
> >>>>>      const MemMapEntry *memmap;
> >>>>>      const int *irqmap;
> >>>>> +    const uint32_t *streamidmap;
> >>>>>      int smp_cpus;
> >>>>>      void *fdt;
> >>>>>      int fdt_size;
> >>>>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> >>>>> index 68c9348..47df01a 100644
> >>>>> --- a/include/hw/pci-host/gpex.h
> >>>>> +++ b/include/hw/pci-host/gpex.h
> >>>>> @@ -48,6 +48,8 @@ typedef struct GPEXHost {
> >>>>>  
> >>>>>      GPEXRootState gpex_root;
> >>>>>  
> >>>>> +    uint32_t stream_id_base;
> >>>>> +
> >>>>>      MemoryRegion io_ioport;
> >>>>>      MemoryRegion io_mmio;
> >>>>>      qemu_irq irq[GPEX_NUM_IRQS];
> >>>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >>>>> index a37a2d5..e6e9334 100644
> >>>>> --- a/include/hw/pci/pci.h
> >>>>> +++ b/include/hw/pci/pci.h
> >>>>> @@ -283,6 +283,12 @@ struct PCIDevice {
> >>>>>       * MSI). For conventional PCI root complex, this field is
> >>>>>       * meaningless. */
> >>>>>      PCIReqIDCache requester_id_cache;
> >>>>> +    /* Some platforms need a unique ID for IOMMU source identification
> >>>>> +     * or MSI source identification. QEMU implements a simple scheme:
> >>>>> +     * stream_id =  stream_id_base + requester_id. The stream_id_base will
> >>>>> +     * ensure that all the devices in the system have different stream ID
> >>>>> +     * domains */
> >>>>> +    uint32_t stream_id_base;
> >>>> get rid of IOMMU terminology?
> >>>>
> >>>> Note that when adding other sub-systems you will need to address the
> >>>> ACPI side as the IORT table built by hw/arm/virt-acpi-build.c currently
> >>>> defines an RID mapping for the single root complex.
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric
> >>>>>      char name[64];
> >>>>>      PCIIORegion io_regions[PCI_NUM_REGIONS];
> >>>>>      AddressSpace bus_master_as;
> >>>>> @@ -737,6 +743,8 @@ static inline uint16_t pci_get_bdf(PCIDevice *dev)
> >>>>>  
> >>>>>  uint16_t pci_requester_id(PCIDevice *dev);
> >>>>>  
> >>>>> +uint32_t pci_stream_id(PCIDevice *dev);
> >>>>> +
> >>>>>  /* DMA access functions */
> >>>>>  static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
> >>>>>  {
> >>>>> diff --git a/kvm-all.c b/kvm-all.c
> >>>>> index 90b8573..5a508c3 100644
> >>>>> --- a/kvm-all.c
> >>>>> +++ b/kvm-all.c
> >>>>> @@ -1280,7 +1280,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> >>>>>      kroute.u.msi.data = le32_to_cpu(msg.data);
> >>>>>      if (kvm_msi_devid_required()) {
> >>>>>          kroute.flags = KVM_MSI_VALID_DEVID;
> >>>>> -        kroute.u.msi.devid = pci_requester_id(dev);
> >>>>> +        kroute.u.msi.devid = pci_stream_id(dev);
> >>>>>      }
> >>>>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
> >>>>>          kvm_irqchip_release_virq(s, virq);
> >>>>> @@ -1317,7 +1317,7 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
> >>>>>      kroute.u.msi.data = le32_to_cpu(msg.data);
> >>>>>      if (kvm_msi_devid_required()) {
> >>>>>          kroute.flags = KVM_MSI_VALID_DEVID;
> >>>>> -        kroute.u.msi.devid = pci_requester_id(dev);
> >>>>> +        kroute.u.msi.devid = pci_stream_id(dev);
> >>>>>      }
> >>>>>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
> >>>>>          return -EINVAL;
> >>>>>
> 
