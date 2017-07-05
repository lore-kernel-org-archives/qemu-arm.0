Received: by 10.25.44.15 with SMTP id s15csp685416lfs;
        Wed, 5 Jul 2017 05:42:56 -0700 (PDT)
X-Received: by 10.55.148.70 with SMTP id w67mr42003736qkd.160.1499258576420;
        Wed, 05 Jul 2017 05:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499258576; cv=none;
        d=google.com; s=arc-20160816;
        b=u16SOeN20w6ft8IC9oKOhm/PSqbZ3EguLqMTpoQBhTWqmm5pU5LLqj74UTwFgGN6xc
         rQJz9DH0pTA0SlS5kLLG6pahy1Jgn+/BiM2mdNmpDn5OHU3PdJ7qycdTs3gMpOOUoSec
         6ErszHyAH9+bl3x9SZDwiEfndqanI7JcxIS4Rcmjt/NQZcIv6buyBbvLCFN3h0+oM3dk
         LCWKZwjqhV2kjpAc6Y8RcuoJ6MNLFQD4FkOTbHZoyFnLIFF2Vp4La7OBRxw2FIcynF6u
         IahBJG7BzpZ7xRRl/hy8+xLEvVIG0cfGqfMQN6lOyATS3eGYg+S3jA/Ud7airPpF/+Ce
         EIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=3DNge7U81JTnaE0v1kDOFZhDa4AwHBIbBQVmkpmZMIk=;
        b=ViwEGc4uihCVHYTNnMYfXsWagomlISiqtG3JRzUTukzHLuweRc1z4wRWuckNWQFeUG
         Tg9eeFixPC/hVQ/Jrge5WFblaNm/M6xPJunq1w4a8PPugDIfrZEKSLZbngVOuji17Kv9
         93HBt9IGJcyPQ0f60vPOGngGrHX4A4Hm/WQYb91fF7csd8baiGvlson/x4GyPv+8ORwV
         Eqs1d0QNxemCzKLciwtjg161b+bcw8KXBe/UOta+ZfLS5sTrUcexMq7RxqmNq7eA1vi1
         fzOgU+HVwY3jE7j1b9HG2DTmGrfMizcrBDuPdLVyZyrqUTG51mUkQXiGQOFcaHH5m3B5
         uUIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t44si21616962qth.124.2017.07.05.05.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 05:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSjdt-00072s-K7
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 08:42:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dSjdI-0006bY-7X
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 08:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dSjdD-00061e-Br
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 08:42:16 -0400
Received: from foss.arm.com ([217.140.101.70]:34988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dSjdD-00061X-2l; Wed, 05 Jul 2017 08:42:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 774F52B;
	Wed,  5 Jul 2017 05:42:10 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F4A3F557;
	Wed,  5 Jul 2017 05:42:07 -0700 (PDT)
To: "Tian, Kevin" <kevin.tian@intel.com>, Auger Eric <eric.auger@redhat.com>, 
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
	<AADFC41AFE54684AB9EE6CBC0274A5D190D25B77@SHSMSX101.ccr.corp.intel.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <311754cd-a4cf-7bf4-4099-a81e63402137@arm.com>
Date: Wed, 5 Jul 2017 13:44:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D190D25B77@SHSMSX101.ccr.corp.intel.com>
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
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0hAc08ZQUgLj

On 05/07/17 08:25, Tian, Kevin wrote:
>> From: Jean-Philippe Brucker [mailto:jean-philippe.brucker@arm.com]
>> Sent: Tuesday, June 27, 2017 12:13 AM
>>
>> On 26/06/17 09:22, Auger Eric wrote:
>>> Hi Jean-Philippe,
>>>
>>> On 19/06/2017 12:15, Jean-Philippe Brucker wrote:
>>>> On 19/06/17 08:54, Bharat Bhushan wrote:
>>>>> Hi Eric,
>>>>>
>>>>> I started added replay in virtio-iommu and came across how MSI
>> interrupts with work with VFIO.
>>>>> I understand that on intel this works differently but vsmmu will have
>> same requirement.
>>>>> kvm-msi-irq-route are added using the msi-address to be translated by
>> viommu and not the final translated address.
>>>>> While currently the irqfd framework does not know about emulated
>> iommus (virtio-iommu, vsmmuv3/vintel-iommu).
>>>>> So in my view we have following options:
>>>>> - Programming with translated address when setting up kvm-msi-irq-
>> route
>>>>> - Route the interrupts via QEMU, which is bad from performance
>>>>> - vhost-virtio-iommu may solve the problem in long term
>>>>>
>>>>> Is there any other better option I am missing?
>>>>
>>>> Since we're on the topic of MSIs... I'm currently trying to figure out how
>>>> we'll handle MSIs in the nested translation mode, where the guest
>> manages
>>>> S1 page tables and the host doesn't know about GVA->GPA translation.
>>>
>>> I have a question about the "nested translation mode" terminology. Do
>>> you mean in that case you use stage 1 + stage 2 of the physical IOMMU
>>> (which the ARM spec normally advises or was meant for) or do you mean
>>> stage 1 implemented in vIOMMU and stage 2 implemented in pIOMMU. At
>> the
>>> moment my understanding is for VFIO integration the pIOMMU uses a
>> single
>>> stage combining both the stage 1 and stage2 mappings but the host is not
>>> aware of those 2 stages.
>>
>> Yes at the moment the VMM merges stage-1 (GVA->GPA) from the guest with
>> its stage-2 mappings (GPA->HPA) and creates a stage-2 mapping (GVA->HPA)
>> in the pIOMMU via VFIO_IOMMU_MAP_DMA. stage-1 is disabled in the
>> pIOMMU.
>>
> 
> Curious whether you are describing current smmu status or general
> vIOMMU status also applying to other vendors...

This particular paragraph was about the non-SVM state of things. The rest
was about stage-1 + stage-2 (what I call nested), which would indeed be
required for SVM. I don't think SVM can work with software merging.

Thanks,
Jean

> the usage what you described is about svm, while svm requires PASID.
> At least PASID is tied to stage-1 on Intel VT-d. Only DMA w/o PASID
> or nested translation from stage-1 will go through stage-2. Unless
> ARM smmu has a completely different implementation, I'm not sure
> how svm can be virtualized w/ stage-1 translation disabled. There
> are multiple stage-1 page tables while only one stage-2 page table per
> device. Could merging actually work here?
> 
> The only case with merging happen today is for guest stage-2 usage
> or so-called GIOVA usage. Guest programs GIOVA->GPA to vIOMMU 
> stage-2. Then vIOMMU invokes vfio map/unmap APIs to translate/
> merge to GIOVA->HPA to pIOMMU stage-2. Maybe what you
> actually meant is this one?
> 
> Thanks
> Kevin
> 

