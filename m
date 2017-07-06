Received: by 10.25.44.15 with SMTP id s15csp1828617lfs;
        Thu, 6 Jul 2017 03:00:34 -0700 (PDT)
X-Received: by 10.200.41.238 with SMTP id 43mr57983872qtt.168.1499335234671;
        Thu, 06 Jul 2017 03:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499335234; cv=none;
        d=google.com; s=arc-20160816;
        b=w9VxJWlZENNL9UYZYk496xyYTSjzeF+NrooxoXN54PZIbCtM6C2p2aYjA8m41qWNxb
         JxiVSXLNF/XzJzvonHKejLWjKa+jBZ14yIsdKRv/SVMtVjxZ+Xvk/Vvpoxmn2t9xldmG
         JIQl1FHBxfBWIng69PGUFZ0N+102Wdzxc7FM6WAa0edR7/8ShseyFRqm2D4j8aYANIGc
         8eNbxy/b7sTQSFJNPSjsM5WtXySqyX/nwproJyJHujyRI6N3qSoQGsu4ipQqYbcFdK0i
         sop61mkjyyIOzTA+f86mBZmopQnLGhA6x6aGqb6PcfIsPZw67AqO6xsLSeuoiQIxPvmz
         K32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from
         :arc-authentication-results;
        bh=iaGNvn7kcc4wIYR07I6RiaNw0vo+uS6Abnuvxqdzqw8=;
        b=OC1bWzNRb7o1839SWmmKf2cZ3FRHQGIN7fCz02crzSqAgZV0TB/N/n5kq7WILy8WB9
         NC0zLaUXd04aa//ReStxn4XcCcqCQ2L5kMTilfDDX8QrrAxUckWam8/pn/weoOpr44DL
         XeCpBhqgl/vPSwP3qDnRnlTLOHXNlioGrwZd3iOQb6+U450T+BHIfZXcibEUOQCwXM7K
         sHfrpNFgE1MNf9AKP70mQ6DDbOjPY37USOdJm3mBbC/H07IDVZazwByi5FetbByDTIFq
         WkW7z0QJYzA3qqX2zI1aHbpLq4JKIioAWU5sC2FMXGvvuJngYZS+zWWwtQWAw7oS58he
         Ot1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 131si1290587qkk.43.2017.07.06.03.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 03:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dT3aK-0007qv-1m
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 06:00:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dT3a7-0007pe-FB
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 06:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dT3a3-00077c-Kw
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 06:00:19 -0400
Received: from foss.arm.com ([217.140.101.70]:43806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dT3a3-00076p-Ca; Thu, 06 Jul 2017 06:00:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0ACB80D;
	Thu,  6 Jul 2017 03:00:13 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEBDF3F3E1;
	Thu,  6 Jul 2017 03:00:10 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
Message-ID: <e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
Date: Thu, 6 Jul 2017 11:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R86ADr1B/4oC

On 05/07/17 09:49, Bharat Bhushan wrote:>>> Also when setup msi-route
kvm_irqchip_add_msi_route() we needed to
>> provide the translated address.
>>> According to my understanding this is required because kernel does no go
>> through viommu translation when generating interrupt, no?
>>
>> yes this is needed when KVM MSI routes are set up, ie. along with GICV3 ITS.
>> With GICv2M, qemu direct gsi mapping is used and this is not needed.
>>
>> So I do not understand your previous sentence saying "MSI interrupts works
>> without any change".
> 
> I have almost completed vfio integration with virtio-iommu and now testing the changes by assigning e1000 device to VM. For this I have changed virtio-iommu driver to use IOMMU_RESV_MSI rather than sw-msi and this does not need changed in vfio_get_addr()  and kvm_irqchip_add_msi_route()

I understand you're reserving region 0x08000000-0x08100000 as
IOMMU_RESV_MSI instead of IOMMU_RESV_SW_MSI? I think this only works
because Qemu places the vgic in that area as well (in hw/arm/virt.c). It's
not a coincidence if the addresses are the same, because Eric chose them
for the Linux SMMU drivers and I copied them.

We can't rely on that behavior, though, it will break MSIs in emulated
devices. And if Qemu happens to move the MSI doorbell in future machine
revisions, then it would also break VFIO.

Just for my own understanding -- what happens, I think, is that in Linux
iova_reserve_iommu_regions initially reserves the guest-physical doorbell
0x08000000-0x08100000. Then much later, when the device driver requests an
MSI, the irqchip driver calls iommu_dma_map_msi_msg with the
guest-physical gicv2m address 0x08020000. The function finds the right
page in msi_page_list, which was added by cookie_init_hw_msi_region,
therefore bypassing the viommu and the GPA gets written in the MSI-X table.

If an emulated device such as virtio-net-pci were to generate an MSI, then
Qemu would attempt to access the doorbell written by Linux into the MSI-X
table, 0x08020000, and fault because that address wasn't mapped in the viommu.

So for VFIO, you either need to translate the MSI-X entry using the
viommu, or just assume that the vaddr corresponds to the only MSI doorbell
accessible by this device (because how can we be certain that the guest
already mapped the doorbell before writing the entry?)

For ARM machines it's probably best to stick with IOMMU_RESV_SW_MSI.
However, a nice way to use IOMMU_RESV_MSI would be for the virtio-iommu
device to advertise identity-mapped/reserved regions, and bypass
translation on these regions. Then the driver could reserve those with
IOMMU_RESV_MSI. For x86 we will need such a system, with an added IRQ
remapping feature.

Thanks,
Jean
