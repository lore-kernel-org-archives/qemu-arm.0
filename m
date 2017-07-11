Received: by 10.25.44.15 with SMTP id s15csp4692758lfs;
        Tue, 11 Jul 2017 04:28:31 -0700 (PDT)
X-Received: by 10.200.56.40 with SMTP id q37mr9727577qtb.36.1499772511220;
        Tue, 11 Jul 2017 04:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499772511; cv=none;
        d=google.com; s=arc-20160816;
        b=TOzDU+yANdvr4bIl6UkxuHx1aLARiWd840Q+cgNtnCygyYqtHf1T+M0UuLZvVhF4TH
         GdITOOCz0tP76ZPAg9/8ctbMvd6uuVi8TacmBte1SgiWyfSU0io+VlFtBJ2b7MAcIYYS
         yBcItJsIRSCEp/xBJrOXVZVv3Y88YNwsrllsKdWr1NDlLzMmMbeNfqW3pyzEU9yfFeEL
         s1bVPRH0px2cFpkj/SgbvfPeRD16WQsryzTXtDp06xwZUaKxatnSkJsdf1lnc3X3Hqum
         c320vQQM/01ag6Zk2FcQJaSWnSMSlXCshvpTRe+1FuaCGLB7WoQvMWtVgf/3FmwE8kaN
         Lf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=abhdvBOtPzxU8bMV412jXPO3MlUoWOI6GfdkSMNPGhs=;
        b=A/2HfFEfmI9WEyulDlP5gAw3eO9Mx0A3iwHjcIdgJ/lQqCG7nKKlXukST628UHQVm+
         75UsBFZnoRPipm6xL36JDmaeb1nz3FHJX5zmAuLcYvPs0rGANn/DrNvI+QMCPTeRkQZM
         DqjLk27aw6Fna1cViwM+il8HWu2GiDdU+cd7nM6Wgi7/ZpqqETJlDdbxx7Gk3DICwdMH
         oPaC6vUIdJZZhALJsRoIlkMJEmYeYFORI9LUYVj4DSWMHXcYmeDuTKz5qfq1S1KFI8Iw
         6lgy55Ol9C26hNo8EvWWaOaKzOA2RJDDaO3wM/zPmoL/vPoc7QKgpvS/UwgpDbovdzNE
         h28A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u48si13532966qtu.388.2017.07.11.04.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 04:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUtLA-0007Lx-Du
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 07:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dUtL6-0007Lr-8h
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dUtL3-0005Cr-3E
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 07:28:24 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:51210
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dUtL2-0005Bt-QP; Tue, 11 Jul 2017 07:28:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4E0613D5;
	Tue, 11 Jul 2017 04:28:17 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 679FC3F5B0;
	Tue, 11 Jul 2017 04:28:14 -0700 (PDT)
To: "Kalra, Ashish" <Ashish.Kalra@cavium.com>,
	"Tian, Kevin" <kevin.tian@intel.com>, Auger Eric <eric.auger@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
	<BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D28807@SHSMSX101.ccr.corp.intel.com>
	<67cb3a84-9aa7-2b4f-43b6-be6dea15b66f@arm.com>
	<BN4PR07MB21615F830FCA5445EF4B7974E3AA0@BN4PR07MB2161.namprd07.prod.outlook.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <8933b36d-c552-c6d5-e4de-e4955f63fec3@arm.com>
Date: Tue, 11 Jul 2017 12:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <BN4PR07MB21615F830FCA5445EF4B7974E3AA0@BN4PR07MB2161.namprd07.prod.outlook.com>
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
X-TUID: IqWgS4wrqfXD

On 07/07/17 23:11, Kalra, Ashish wrote:
> Hello Jean,
> 
> Thanks for the information.
> 
> Is someone already working on implementing this, or is this something I can look into and implementing ?

I'm still working on the specification, along with a prototype for the
Linux driver and the kvmtool device. I don't want to rush it because it's
a complicated subject, and we're barely supporting SVM in the host.
Supporting IO page faults is only part of the problem, we also need to
hand page tables over to the guest, which requires a new interface for
virtio-iommu. For the moment, my priority is on consolidating the base
device specification.

> Also, as Michael mentioned and I looked in the vfio iommu (type1) driver implementation that it supports mainly
> static mappings of user-space processes with  user-space pages pinned/locked in memory, so a generic support
> for ATS/PRI extensions needs to be added in VFIO too.

That's also in progress. As far as I know the latest version for fault
reporting is http://www.spinics.net/lists/kvm/msg146615.html

Thanks,
Jean

> Thanks,
> Ashish
> 
> -----Original Message-----
> From: Jean-Philippe Brucker [mailto:jean-philippe.brucker@arm.com] 
> Sent: Friday, July 07, 2017 8:45 PM
> To: Tian, Kevin; Kalra, Ashish; Auger Eric; Bharat Bhushan; eric.auger.pro@gmail.com; peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org
> Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
> 
> Hi Ashish,
> 
> On 07/07/17 00:33, Tian, Kevin wrote:
>>> From: Kalra, Ashish [mailto:Ashish.Kalra@cavium.com]
>>> Sent: Friday, July 7, 2017 7:24 AM
>>>
>>> I have a generic question on vIOMMU support, is there any 
>>> proposal/plan to add ATS/PRI extension support to vIOMMUs and allow 
>>> handling for end to end (v)IOMMU Page faults (w/t the device side 
>>> implementation on Vhost) ?
>>>
>>> Again, the motivation will be to do DMA on paged guest memory and 
>>> potentially avoiding the requirement of pinned/locked guest physical 
>>> memory for DMA.
>>
>> yes, that's a necessary part to support SVM in both virtio-iommu 
>> approach and fully emulated approach (e.g. for Intel VTd). There are 
>> already patches and discussions in other thread about how to propagate 
>> IOMMU page fault to vIOMMU. Then after it is done vIOMMU page fault 
>> emulation will be further added.
>>
>> https://lkml.org/lkml/2017/6/27/964
> 
> For virtio-iommu, I'd like to add an event virtqueue for the device to send page faults to the driver, in a format similar to a PRI Page Request.
> The driver would then send a reply via the request virtqueue in a format similar to a PRG Response.
> 
> In Qemu the device implementation would hopefully be based on the same mechanism as VTd. The vhost implementation would receive IO Page Faults from VFIO and forward them on the event virtqueue similarly to the userspace implementation.
> 
> Thanks,
> Jean
> 

