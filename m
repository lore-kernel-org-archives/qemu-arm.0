Received: by 10.25.44.15 with SMTP id s15csp229762lfs;
        Fri, 7 Jul 2017 08:20:47 -0700 (PDT)
X-Received: by 10.200.3.132 with SMTP id t4mr64744033qtg.232.1499440847375;
        Fri, 07 Jul 2017 08:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499440847; cv=none;
        d=google.com; s=arc-20160816;
        b=e+PTkBIsGuAC6AJJxaYU0qjlcJzbLDEYFrEyZu04tyVKgMLr2jtN40kJ6tav1zj1/H
         Z/ruzpvpojHqoSy2Bw8wzqoJ1zsGLCKxPy3CBq5bUeIqWMyULh4QvRXrdUyMzOVhq7vC
         XHZ+yq2Nm6l0KHPLQCuyIJi9EbjbP4V/tPnKmWYlqSQuhSvHIodts9sHefYCMkqNcvQ0
         A8zN/WSFt5BPf4cEAhfLIuEWaL4uR4kb3kmuFZlyL+P0ptdPaivbQAiP5AKyDJLEM8ZL
         JUdc9yrp0MDKt4AhEPJH4r0qMq15vrhaVkNWAkqJq+JVVJ7K7jWsNztwEuWZRpzQ0jYp
         dPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Sm8mObk9oPxbe0NvkQ76GnAFZ0s+aH6hD8wVIUskoMo=;
        b=Z0G9WwXMKoAAsISxpznYr54RXxSn8qS7GZlO1tMUxXnhUH6dHcPNp6r2LsQhS9b1yY
         w9CkcjzllihfM8H7WObySR85Txx+LLMoew27PcNpb9vJKlj7cv3i4YlZE74cTTasgu+E
         yBATGi5CjSfNCFC1JjepmYFX2n+65ysoWT0yBfnEPPW7zOZRSSF8Be2nUhbaumTNGaRP
         mc8C+jV/OnbwYvAXeVs0Nj/4CxIxc4Tc9gTGyippcuGcXTkbGKnnH3V7eVXvw6UO6qGN
         1wuw6VfJpUjrZEdkpJz2o6HUAwlrmQ9HfJj5Razl4Q7GCUn512bor+/fCwpGgbSw8XiD
         afQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k198si3480593qke.301.2017.07.07.08.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 08:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTV3k-00059L-Jr
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 11:20:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dTV0W-0002R2-D9
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 11:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dTV0S-00036D-BB
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 11:17:24 -0400
Received: from foss.arm.com ([217.140.101.70]:55924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dTV0S-00035z-2B; Fri, 07 Jul 2017 11:17:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 502E52B;
	Fri,  7 Jul 2017 08:17:19 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEC573F3E1;
	Fri,  7 Jul 2017 08:17:16 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
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
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<444508ab-3a69-6c12-cb72-42c0e20fb5d7@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <637e22ed-6873-1a90-0817-a831ab602c8e@arm.com>
Date: Fri, 7 Jul 2017 16:20:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <444508ab-3a69-6c12-cb72-42c0e20fb5d7@redhat.com>
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
X-TUID: AdefXzDtyaNX

On 06/07/17 22:11, Auger Eric wrote:
> Hello Bharat, Jean-Philippe,
> On 06/07/2017 12:02, Jean-Philippe Brucker wrote:
>> On 05/07/17 09:49, Bharat Bhushan wrote:>>> Also when setup msi-route
>> kvm_irqchip_add_msi_route() we needed to
>>>> provide the translated address.
>>>>> According to my understanding this is required because kernel does no go
>>>> through viommu translation when generating interrupt, no?
>>>>
>>>> yes this is needed when KVM MSI routes are set up, ie. along with GICV3 ITS.
>>>> With GICv2M, qemu direct gsi mapping is used and this is not needed.
>>>>
>>>> So I do not understand your previous sentence saying "MSI interrupts works
>>>> without any change".
>>>
>>> I have almost completed vfio integration with virtio-iommu and now testing the changes by assigning e1000 device to VM. For this I have changed virtio-iommu driver to use IOMMU_RESV_MSI rather than sw-msi and this does not need changed in vfio_get_addr()  and kvm_irqchip_add_msi_route()
>>
>> I understand you're reserving region 0x08000000-0x08100000 as
>> IOMMU_RESV_MSI instead of IOMMU_RESV_SW_MSI? I think this only works
>> because Qemu places the vgic in that area as well (in hw/arm/virt.c). It's
>> not a coincidence if the addresses are the same, because Eric chose them
>> for the Linux SMMU drivers and I copied them.
> 
> Yes I chose this region because it does not overlap with any guest RAM
> region
> 
>>
>> We can't rely on that behavior, though, it will break MSIs in emulated
>> devices. And if Qemu happens to move the MSI doorbell in future machine
>> revisions, then it would also break VFIO.
>>
>> Just for my own understanding -- what happens, I think, is that in Linux
>> iova_reserve_iommu_regions initially reserves the guest-physical doorbell
>> 0x08000000-0x08100000. Then much later, when the device driver requests an
>> MSI, the irqchip driver calls iommu_dma_map_msi_msg with the
>> guest-physical gicv2m address 0x08020000. The function finds the right
>> page in msi_page_list, which was added by cookie_init_hw_msi_region,
>> therefore bypassing the viommu and the GPA gets written in the MSI-X table.
> 
> I share Jean's understanding. To me using IOMMU_RESV_MSI in the
> virtio-iommu means this region is not translated by the IOMMU. as
> cookie_init_hw_msi_region() pre-allocates the msi_page array,
> iommu_dma_get_msi_page() does not do any IOMMU mapping.
> 
>>
>> If an emulated device such as virtio-net-pci were to generate an MSI, then
>> Qemu would attempt to access the doorbell written by Linux into the MSI-X
>> table, 0x08020000, and fault because that address wasn't mapped in the viommu.
> Yes so I am confused, how can it work with a virtio-net-pci or
> passthrough'ed e1000e device using MSIs?
>>
>> So for VFIO, you either need to translate the MSI-X entry using the
>> viommu,
> 
> For the vsmmuv3 I created a dedicated IOMMUNotifier to handle the fact
> the MSI doorbell is translated and MSI routes need to be updated. This
> seems to work.
> 
>  or just assume that the vaddr corresponds to the only MSI doorbell
>> accessible by this device (because how can we be certain that the guest
>> already mapped the doorbell before writing the entry?)
>>
>> For ARM machines it's probably best to stick with IOMMU_RESV_SW_MSI.
>> However, a nice way to use IOMMU_RESV_MSI would be for the virtio-iommu
>> device to advertise identity-mapped/reserved regions, and bypass
>> translation on these regions. Then the driver could reserve those with
>> IOMMU_RESV_MSI.
> 
> At least we may need to configure the virtio-iommu to either bypass MSIs
> (x86) or translate MSIs (ARM)?

Yes, see the VIRTIO_IOMMU_T_PROBE proposal in, er, my other reply.

>  For x86 we will need such a system, with an added IRQ
>> remapping feature.
> Meaning this must live along with vIR, is that what you mean? Also on
> ARM this must live with vITS anyway. This is an orthogonal feature, right?

Reserving doorbells regions on x86 is a must otherwise MSIs won't work.
IRQ remapping would be nice to add in some distant future.

Thanks,
Jean

