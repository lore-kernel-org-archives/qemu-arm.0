Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2438998wrt;
        Thu, 18 Oct 2018 08:17:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62DddTeL6XrYn3CHxHA8PYi9EhtRszBtvGDZTt6+oTlOe+1ydTtv7+H+bqJYgep1rOK93Ya
X-Received: by 2002:a0c:d4e5:: with SMTP id y34mr30916666qvh.106.1539875821803;
        Thu, 18 Oct 2018 08:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539875821; cv=none;
        d=google.com; s=arc-20160816;
        b=Aj6kVdohP+yKwpKKolW91W2P4XxDJrVhfKmajjQvo0gOYVdL1sEPbYr/37ik8Z3GIx
         5W8VYSjipbIOcDMeKqnANn9JhGrQubO/pI/0SBfILB5iYzEwPS6prOKCNAJgV+SHoRTF
         rjrGcRbgoM5jvvEcSleCRiydLPcXsSr9Y8YFaAGwD2zcUHqHo8maoDRHXm+ZdBrUdYHO
         jMUGOpr+Di52j2sSQR8OXKjMjphPrG5/cz3qDqMPiDzxBFRBDLgAdJBlytG3bzxYlnA2
         pizpaVto2NWp0eJT68AA9SVTfUM4JCEwxUJOyLDPN7u81aEmzuGi/JNhbclU3RaLKNyq
         /i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Zf2zqD7V2S37h1dNyYKDOkMXu/J5OLPbIHRXaqqlGwA=;
        b=Sk7SZSqcdVImOXsXsEqKCKPsVnFNbqgiGfFNjEdf7NAPvXiU6OAnpjZCEHxJlJTKrC
         0ff28YGCvJbzYCb2VLbvou6Bc49CIo2fFlUGICnl1rrk/Nrtpq3nDIRUKksC0wFJNeDE
         zG/cAthuvQDv+BLWhzejjdgxFg9I4JraR8S/yf9ISFW/nfHACHJkc3Dpg0/VQrRh+JxT
         CD2QSREasXl0zpbVXjfZjd+LB53EZr+tZhsaxMPuQ1Qcf7V5xJCShvlutSSahc2ig+XS
         YOgRJbG82HH09ogRgTV85xsNAeCQBQ3EKbq5lbA2j72ybG2W5flbyJypr+Sw3eMOC7am
         fMsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8-v6si3885611qkl.64.2018.10.18.08.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 08:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDA2m-00037u-Ma
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 11:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gDA2X-00036D-Vv
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 11:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gDA2T-0001lf-Pi
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 11:16:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gDA2T-0001jp-Bv; Thu, 18 Oct 2018 11:16:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 403C630C9EED;
	Thu, 18 Oct 2018 15:16:40 +0000 (UTC)
Received: from [10.36.116.215] (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F4D72306;
	Thu, 18 Oct 2018 15:16:27 +0000 (UTC)
To: "Liu, Yi L" <yi.l.liu@intel.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <20180921081819.9203-1-eric.auger@redhat.com>
	<A2975661238FB949B60364EF0F2C257439D32CBE@SHSMSX104.ccr.corp.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5624f123-27fd-8392-32cf-1792b52483b5@redhat.com>
Date: Thu, 18 Oct 2018 17:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <A2975661238FB949B60364EF0F2C257439D32CBE@SHSMSX104.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Oct 2018 15:16:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage
 VFIO integration
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "cdall@kernel.org" <cdall@kernel.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/f5xdWCKrPQ

Hi Yi,

On 10/18/18 12:30 PM, Liu, Yi L wrote:
> Hi Eric,
> 
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Friday, September 21, 2018 4:18 PM
>> Subject: [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage VFIO integration
>>
>> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
>> integration requires to program the physical IOMMU consistently
>> with the guest mappings. However, as opposed to VTD, SMMUv3 has
>> no "Caching Mode" which allows easy trapping of guest mappings.
>> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
>>
>> However SMMUv3 has 2 translation stages. This was devised with
>> virtualization use case in mind where stage 1 is "owned" by the
>> guest whereas the host uses stage 2 for VM isolation.
>>
>> This series sets up this nested translation stage. It only works
>> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
>> other words, it does not work if there is a physical SMMUv2).
>>
>> The series uses a new kernel user API [1], still under definition.
>>
>> - We force the host to use stage 2 instead of stage 1, when we
>>   detect a vSMMUV3 is behind a VFIO device. For a VFIO device
>>   without any virtual IOMMU, we still use stage 1 as many existing
>>   SMMUs expect this behavior.
>> - We introduce new IOTLB "config" notifiers, requested to notify
>>   changes in the config of a given iommu memory region. So now
>>   we have notifiers for IOTLB changes and config changes.
>> - vSMMUv3 calls config notifiers when STE (Stream Table Entries)
>>   are updated by the guest.
>> - We implement a specific UNMAP notifier that conveys guest
>>   IOTLB invalidations to the host
>> - We implement a new MAP notifiers only used for MSI IOVAs so
>>   that the host can build a nested stage translation for MSI IOVAs
>> - As the legacy MAP notifier is not called anymore, we must make
>>   sure stage 2 mappings are set. This is achieved through another
>>   memory listener.
>> - Physical SMMUs faults are reported to the guest via en eventfd
>>   mechanism and reinjected into this latter.
>>
>> Note: some iommu memory notifier rework related patches are close
>> to those previously published by Peter and Liu. I will be pleased to
>> add their Signed-off-by if they agree/wish.
> 
> Yeah, feel free to add mine if it's originated from our previous work.
OK
> 
> BTW. Curiously, are you planning to implement all vIOMMU related
> operations through MemoryRegion notifiers? Honestly, I did it in such
> way in early RFC for vSVA work. However, we encountered two issues
> at that time. First, how to check whether the notifier should be registered.
On my side I think I resolved this by querying the iommu mr about the
new IOMMU_ATTR_VFIO_NESTED IOMMU attribute  in vfio_connect_container

See patches 5 and 6, 8

This tells me whether the nested mode must be setup and choose the right
container->iommu_type which is then used in vfio_listener_region_add()
to decide whether the specific notifiers mustd to be registered.


> Second, there are cases in which the vfio_listener_region_add is not
> triggered but vIOMMU exists. Details can be got by the link below:
> (http://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00078.html)

Yes I remember this, due to the PT=1 case. On ARM we don't have this
specificity hence this integration.
> 
> As thus, we had some discussions in community. Last time, PCIPASIDOps
> was proposed. It is to add callbacks in PCIDevice. VFIO would register its
> implementations in vfio_realize(). Supposedly, pasid_table_bind,
> page_table_bind, sva_tlb_invalidation_passdown and other vIOMMU
> related operations can be done in such way. The sample patch below
> may show how it looks like. (the full patch is in my sandbox, planned to
> send out with Scalable Mode emulation patch).

To be honest, I lost track of the series and did not see this
PCIPASIDOps proposal. I will study whether this can fit my needs.

Thank you for the link!

Best Regards

Eric
> 
> Sample patch:
> include/hw/pci/pci.h:
>  +typedef struct PCIPASIDOps PCIPASIDOps;
>  +struct PCIPASIDOps {
>  +    void (*pasid_bind_table)(PCIBus *bus, int32_t devfn,
>  +                            struct pasid_table_config *ptbl_cfg);
>  +    void (*pasid_invalidate_extend_iotlb)(PCIBus *bus, int32_t devfn,
>  +                            struct tlb_invalidate_info *inv_info);
>  +};
> 
>  @@ -350,6 +359,7 @@ struct PCIDevice {
>       MSIVectorUseNotifier msix_vector_use_notifier;
>       MSIVectorReleaseNotifier msix_vector_release_notifier;
>       MSIVectorPollNotifier msix_vector_poll_notifier;
>  +    PCIPASIDOps *pasid_ops;
>   };
> 
> hw/pci/pci.c:
> +void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops)
>  +{
>  +    assert(ops && !dev->pasid_ops);
>  +    dev->pasid_ops = ops;
>  +}
>  +
>  +void pci_device_pasid_bind_table(PCIBus *bus, int32_t devfn,
>  +                                 struct pasid_table_config *ptbl_cfg)
>  +{
>  +    PCIDevice *dev;
>  +
>  +    if (!bus) {
>  +        return;
>  +    }
>  +
>  +    dev = bus->devices[devfn];
>  +    if (dev && dev->pasid_ops) {
>  +        dev->pasid_ops->pasid_bind_table(bus, devfn, ptbl_cfg);
>  +    }
>  +}
> 
> hw/vfio/pci.c:
> +static PCIPASIDOps vfio_pci_pasid_ops = {
>  +    .pasid_bind_table = vfio_pci_device_pasid_bind_table,
>  +    .pasid_invalidate_extend_iotlb = vfio_pci_device_pasid_invalidate_eiotlb,
>  +};
>  +
>   static void vfio_realize(PCIDevice *pdev, Error **errp)
>   {
>       VFIOPCIDevice *vdev = DO_UPCAST(VFIOPCIDevice, pdev, pdev);
>  @@ -3048,6 +3068,8 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>       vfio_register_req_notifier(vdev);
>       vfio_setup_resetfn_quirk(vdev);
> 
>  +    pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
>  +
>       return;
> 
> Regards,
> Yi Liu
> 
> 
