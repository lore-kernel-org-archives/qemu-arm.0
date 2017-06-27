Received: by 10.25.227.6 with SMTP id a6csp1439372lfh;
        Mon, 26 Jun 2017 23:39:19 -0700 (PDT)
X-Received: by 10.200.58.227 with SMTP id x90mr4740879qte.155.1498545559469;
        Mon, 26 Jun 2017 23:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498545559; cv=none;
        d=google.com; s=arc-20160816;
        b=JHuLgpqbn3h1mREQ9bCQgNUj5bedO32TWcGgyoBrWmuLok1HD0xvM9/G1fKWbydIDo
         cM7b+o6qIYOqPAe5FWvZDeCPzq91hBIJQps1btaQrIOd0vWK8VMVbqnC4BAaV12421Am
         95lS0lGcBuYd507aJKbwLTiuZW/eqFQgi/lLk/7NuQkXhLNXEAXqp1ihY+Ft4gVp0OGK
         ++7MBO2YNpH6hnfbl5594FD41Rdn51zYxhzcBNfcD0Qs8uShITeMg/Ad6G5q6HmUXu/h
         Wjjuz8k8rO2ZhZPn2hHWcO5v0PIyW1N8Dlte0dL2462Vn6vtKTYRB+OKb34fCuQFe/Ik
         fhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=duYtOP9e7UMkju306N7tH8wtf8TQ3EzBcChkRx58OA8=;
        b=ZVAGHKtBLzp1aRX48y3gE725ERRUgm6PJLLYz6ZCg9EPXvXGBCHuNLBaD/jWTze3Gr
         BsZNE7YPxCWW2J8fP8CafbnAeGpxjuZPjx6WjKtQMjZioq+dY4kjzMmHEUgTwNObtRNS
         CKiGmkfH4AEnIL4dKVlBKhd08YY29K1mG+Dqvacsjwm3ijNxw8CNQBAwLG0spIgNScHJ
         zFjlI3vRxnTMFnPXQHLm7WolUOX9f7ly5DpDeR5v0NypnGozhe+XokIRgv9ZtvSxLG9X
         uFuXJGaHXrv4FpmG3BVZSW7+dL8SU0ftTdPRuNra7PTTJhv3sc8+xvwT71huLy1k9cS8
         jl8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z195si2017531qkz.181.2017.06.26.23.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 23:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPk9c-0001Y4-PS
	for alex.bennee@linaro.org; Tue, 27 Jun 2017 02:39:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPk9S-0001Xy-J5
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 02:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPk9P-0005H8-DO
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 02:39:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dPk9P-0005Gm-3b; Tue, 27 Jun 2017 02:39:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4D7785550;
	Tue, 27 Jun 2017 06:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B4D7785550
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B4D7785550
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C09CB7F3AC;
	Tue, 27 Jun 2017 06:38:50 +0000 (UTC)
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
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
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
	<d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6070f02d-20d3-98fb-e31a-e7dbf5010419@redhat.com>
Date: Tue, 27 Jun 2017 08:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 27 Jun 2017 06:39:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: OaFgSyMv+TR+

Hi Jean-Philippe,

On 26/06/2017 18:13, Jean-Philippe Brucker wrote:
> On 26/06/17 09:22, Auger Eric wrote:
>> Hi Jean-Philippe,
>>
>> On 19/06/2017 12:15, Jean-Philippe Brucker wrote:
>>> On 19/06/17 08:54, Bharat Bhushan wrote:
>>>> Hi Eric,
>>>>
>>>> I started added replay in virtio-iommu and came across how MSI interrupts with work with VFIO. 
>>>> I understand that on intel this works differently but vsmmu will have same requirement. 
>>>> kvm-msi-irq-route are added using the msi-address to be translated by viommu and not the final translated address.
>>>> While currently the irqfd framework does not know about emulated iommus (virtio-iommu, vsmmuv3/vintel-iommu).
>>>> So in my view we have following options:
>>>> - Programming with translated address when setting up kvm-msi-irq-route
>>>> - Route the interrupts via QEMU, which is bad from performance
>>>> - vhost-virtio-iommu may solve the problem in long term
>>>>
>>>> Is there any other better option I am missing?
>>>
>>> Since we're on the topic of MSIs... I'm currently trying to figure out how
>>> we'll handle MSIs in the nested translation mode, where the guest manages
>>> S1 page tables and the host doesn't know about GVA->GPA translation.
>>
>> I have a question about the "nested translation mode" terminology. Do
>> you mean in that case you use stage 1 + stage 2 of the physical IOMMU
>> (which the ARM spec normally advises or was meant for) or do you mean
>> stage 1 implemented in vIOMMU and stage 2 implemented in pIOMMU. At the
>> moment my understanding is for VFIO integration the pIOMMU uses a single
>> stage combining both the stage 1 and stage2 mappings but the host is not
>> aware of those 2 stages.
> 
> Yes at the moment the VMM merges stage-1 (GVA->GPA) from the guest with
> its stage-2 mappings (GPA->HPA) and creates a stage-2 mapping (GVA->HPA)
> in the pIOMMU via VFIO_IOMMU_MAP_DMA. stage-1 is disabled in the pIOMMU.
> 
> What I mean by "nested mode" is stage 1 + stage 2 in the physical IOMMU.
> I'm referring to the "Page Table Sharing" bit of the Future Work in the
> initial RFC for virtio-iommu [1], and also PASID table binding [2] in the
> case of vSMMU. In that mode, stage-1 page tables in the pIOMMU are managed
> by the guest, and the VMM only maps GPA->HPA.

OK I need to read that part more thoroughly. I was told in the past
handling nested stages at pIOMMU was considered too complex and
difficult to maintain. But definitively The SMMU architecture is devised
for that. Michael asked why we did not use that already for vsmmu
(nested stages are used on AMD IOMMU I think).
> 
> Since both s1 and s2 are then enabled in the pIOMMU, MSIs reaching the
> pIOMMU will be translated at s1 then s2. To create nested translation for
> MSIs, I see two solutions:
> 
> A. The GPA of the doorbell that is exposed to the guest is mapped by the
> VMM at S2. This mapping is GPA->(PA of the doorbell) with Dev-nGnRE memory
> attributes. The guest creates a GVA->GPA mapping, then writes GVA in the
> MSI-X tables.
> - If the MSI-X table is emulated (as we currently do), VMM has to force
>   the host to rewrite the physical MSIX entry with the GVA.
> - If the MSI-X table is mapped (see [3]), then the guest writes
>   the GVA into the physical MSI-X entry. (How does this work with lazy MSI
>   routing setup, that is based on trapping MSIX table?)
> 
> B. The VMM exposes a fake doorbell. Hardware MSI vectors are programmed
> upfront by the host. Since TTB0 is assigned to the guest, then host must
> use TTB1 to create the GVA->GPA mapping.
> 
> Solution B was my proposal (2) below, but I didn't take vSMMU into account
> at the time. I think that for virtual SVM with the vSMMU, the VMM has to
> hand the whole PASID table over to the guest. This is what Intel seems to
> do [2]. Even if we emulated the PASID table instead of handing it over, we
> wouldn't have a way to hide TTB1 from the guest. So with vSMMU we loose
> control over TTB1 and (2) doesn't work.
> 
> I don't really like A, but it might be the only way with vSMMU:
> - Guest maps doorbell at S1,
> - Guest writes the GVA in its virtual MSI-X tables,
> - Host handles the GVA write and reprograms the hardware MSI-X tables,
> - Device issues an MSI, which gets translated at S1+S2, then hits the
>   doorbell,
> - VFIO handles the IRQ, which is forwarded to KVM via IRQFD, finds the
>   corresponding irqchip by GPA, then injects the MSI.

I am about to experience A) with vsmmu/VFIO. Please let me few days
before I answer accurately to this part.
> 
>>> I'm also wondering about the benefits of having SW-mapped MSIs in the
>>> guest. It seems unavoidable for vSMMU since that's what a physical system
>>> would do. But in a paravirtualized solution there doesn't seem to be any
>>> compelling reason for having the guest map MSI doorbells.
>>
>> If I understand correctly the virtio-iommu would not expose MSI reserved
>> regions (saying it does not translates MSIs). In that case he VFIO
>> kernel code will not check the irq_domain_check_msi_remap() but will
>> check iommu_capable(bus, IOMMU_CAP_INTR_REMAP) instead. Would the
>> virtio-iommu expose this capability? How would it isolate MSI
>> transactions from different devices?
> 
> Yes, the virtio-iommu would expose IOMMU_CAP_INTR_REMAP to keep VFIO
> happy. But the virtio-iommu device wouldn't do any MSI isolation. We have
> software-mapped doorbell on ARM because MSI transactions are translated by
> the SMMU before reaching the GIC, which then performs device isolation.
> With virtio-iommu on ARM, the address translation stage seems unnecessary
> if you already have a vGIC handling device isolation. So maybe MSIs could
> bypass the vIOMMU in that case.
only vITS performs device isolation. In case we have a vGICv2M there is
no irq translation. So yes MSI isolation also needs to be handled in x86
and GICv2m cases.

Thanks

Eric
> 
> However on x86, I think we will need to handle MSI remapping in the
> virtio-iommu itself, since that's what x86 platforms expect. In this case
> the guest doesn't have to create an IOMMU mapping for doorbell addresses
> either, but might need to manage some form of IRQ remapping table (on
> which I still have a tonne of research to do.)
> 
> Thanks,
> Jean
> 
> [1] https://www.spinics.net/lists/kvm/msg147993.html
> [2] https://www.spinics.net/lists/kvm/msg148798.html
> [3] https://lkml.org/lkml/2017/6/15/34
> 
>> Thanks
>>
>> Eric
>>
>>
>>  These addresses
>>> are never accessed directly, they are only used for setting up IRQ routing
>>> (at least on kvmtool). So here's what I'd like to have. Note that I
>>> haven't investigated the feasibility in Qemu yet, I don't know how it
>>> deals with MSIs.
>>>
>>> (1) Guest uses the guest-physical MSI doorbell when setting up MSIs. For
>>> ARM with GICv3 this would be GITS_TRANSLATER, for x86 it would be the
>>> fixed MSI doorbell. This way the host wouldn't need to inspect IOMMU
>>> mappings when handling writes to PCI MSI-X tables.
>>>
>>> (2) In nested mode (with VFIO) on ARM, the pSMMU will still translate MSIs
>>> via S1+S2. Therefore the host needs to map MSIs at stage-1, and I'd like
>>> to use the (currently unused) TTB1 tables in that case. In addition, using
>>> TTB1 would be useful for SVM, when endpoints write MSIs with PASIDs and we
>>> don't want to map them in user address space.
>>>
>>> This means that the host needs to use different doorbell addresses in
>>> nested mode, since it would be unable to map at S1 the same IOVA as S2
>>> (TTB1 manages negative addresses - 0xffff............, which are not
>>> representable as GPAs.) It also requires to use 32-bit page tables for
>>> endpoints that are not capable of using 64-bit MSI addresses.
>>>
>>>
>>> Now (2) is entirely handled in the host kernel, so it's more a Linux
>>> question. But does (1) seem acceptable for virtio-iommu in Qemu?
>>>
>>> Thanks,
>>> Jean
>>>
> 
