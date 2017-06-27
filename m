Received: by 10.25.227.6 with SMTP id a6csp1544906lfh;
        Tue, 27 Jun 2017 02:00:56 -0700 (PDT)
X-Received: by 10.200.2.74 with SMTP id o10mr5444627qtg.26.1498554056539;
        Tue, 27 Jun 2017 02:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498554056; cv=none;
        d=google.com; s=arc-20160816;
        b=ua3qMLUeYy+IUK7qZVAbs9ZZy39/ZlsYLpCdCtxjoOcejwNPPJazv4Bav1BaSuVhYA
         ck3IT7Ku3FS4u3TkxFAVBrOqNDIPcYf9BazoYuLBl1IhlLkq+RUpYfGjAWr/0VaqbgCf
         81uOhPqxFXH4m1vgwDtYRiLgwSczi6WZZpZ3O00tQsZzM8nyZJLc1mIJ5itnrdIj7hAi
         AqsdZb89vS84s/b712IPQyB6fy/D1oPkDCG+iURIxu7YlGEgQYdZayddCGzPnvgmPZ9Y
         EJMmw9pWdmOBUbOuxhr+hyHQSOncKLeetawI83YQLSlPCTILI1iSh1BVYyxQg5yriU/J
         ZBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=qV97IRQou9sewUc4WJgIjtWa5jwX7ZCX81jfkoOP8FY=;
        b=G2mTzVe67kJSWEa9rsGeVEnKyFyeD1cr5UONpYn7JDbk+sjWnN2+uV8whWXqSALiMi
         SQJuy+UHd58o4vE8aFaFCgTjk6SoIrQxhPvA0YhJ8BuNYwrRdvdrIlXRdcXm1uAiTflc
         qcA68rzVvwXa/Bq81UZ9zqUZcbTs9e3ev4qoCqiKhk1UiYLAw2NDnlzbIWF3T/WgFn5P
         F1i424EGrb2KFheZygxoxFngIno+TXDdAWlCAUKAF2lS+VbcBoaYkmWFLGqbY5x77ACC
         XC8sIoLMcZn9MjaUnrCGJ3iqMutkglVLsD0FLNqRzQBfbEFBZ/vh8ST3ApBTnREzUfql
         yfrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t78si2290281qki.136.2017.06.27.02.00.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Jun 2017 02:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPmMf-0003MK-PA
	for alex.bennee@linaro.org; Tue, 27 Jun 2017 05:00:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPmLU-0002WR-8A
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 04:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPmLR-0000JQ-83
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 04:59:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dPmLQ-0000Hd-W0; Tue, 27 Jun 2017 04:59:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0483723E6CA;
	Tue, 27 Jun 2017 08:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0483723E6CA
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0483723E6CA
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EDF761F20;
	Tue, 27 Jun 2017 08:59:23 +0000 (UTC)
To: Will Deacon <will.deacon@arm.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
	<d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
	<6070f02d-20d3-98fb-e31a-e7dbf5010419@redhat.com>
	<20170627084641.GC5759@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f7e3fe04-326e-9826-0321-8092adc94736@redhat.com>
Date: Tue, 27 Jun 2017 10:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170627084641.GC5759@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 27 Jun 2017 08:59:34 +0000 (UTC)
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>, "mst@redhat.com" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FW5tHe5SAXeI

Hi,

On 27/06/2017 10:46, Will Deacon wrote:
> Hi Eric,
> 
> On Tue, Jun 27, 2017 at 08:38:48AM +0200, Auger Eric wrote:
>> On 26/06/2017 18:13, Jean-Philippe Brucker wrote:
>>> On 26/06/17 09:22, Auger Eric wrote:
>>>> On 19/06/2017 12:15, Jean-Philippe Brucker wrote:
>>>>> On 19/06/17 08:54, Bharat Bhushan wrote:
>>>>>> I started added replay in virtio-iommu and came across how MSI interrupts with work with VFIO. 
>>>>>> I understand that on intel this works differently but vsmmu will have same requirement. 
>>>>>> kvm-msi-irq-route are added using the msi-address to be translated by viommu and not the final translated address.
>>>>>> While currently the irqfd framework does not know about emulated iommus (virtio-iommu, vsmmuv3/vintel-iommu).
>>>>>> So in my view we have following options:
>>>>>> - Programming with translated address when setting up kvm-msi-irq-route
>>>>>> - Route the interrupts via QEMU, which is bad from performance
>>>>>> - vhost-virtio-iommu may solve the problem in long term
>>>>>>
>>>>>> Is there any other better option I am missing?
>>>>>
>>>>> Since we're on the topic of MSIs... I'm currently trying to figure out how
>>>>> we'll handle MSIs in the nested translation mode, where the guest manages
>>>>> S1 page tables and the host doesn't know about GVA->GPA translation.
>>>>
>>>> I have a question about the "nested translation mode" terminology. Do
>>>> you mean in that case you use stage 1 + stage 2 of the physical IOMMU
>>>> (which the ARM spec normally advises or was meant for) or do you mean
>>>> stage 1 implemented in vIOMMU and stage 2 implemented in pIOMMU. At the
>>>> moment my understanding is for VFIO integration the pIOMMU uses a single
>>>> stage combining both the stage 1 and stage2 mappings but the host is not
>>>> aware of those 2 stages.
>>>
>>> Yes at the moment the VMM merges stage-1 (GVA->GPA) from the guest with
>>> its stage-2 mappings (GPA->HPA) and creates a stage-2 mapping (GVA->HPA)
>>> in the pIOMMU via VFIO_IOMMU_MAP_DMA. stage-1 is disabled in the pIOMMU.
>>>
>>> What I mean by "nested mode" is stage 1 + stage 2 in the physical IOMMU.
>>> I'm referring to the "Page Table Sharing" bit of the Future Work in the
>>> initial RFC for virtio-iommu [1], and also PASID table binding [2] in the
>>> case of vSMMU. In that mode, stage-1 page tables in the pIOMMU are managed
>>> by the guest, and the VMM only maps GPA->HPA.
>>
>> OK I need to read that part more thoroughly. I was told in the past
>> handling nested stages at pIOMMU was considered too complex and
>> difficult to maintain. But definitively The SMMU architecture is devised
>> for that. Michael asked why we did not use that already for vsmmu
>> (nested stages are used on AMD IOMMU I think).
> 
> Curious -- but what gave you that idea? I worry that something I might have
> said wasn't clear or has been misunderstood.

Lobby discussions I might not have correctly understood ;-) Anyway
that's a new direction that I am happy to investigate then.

Thanks

Eric
> 
> Will
> 
