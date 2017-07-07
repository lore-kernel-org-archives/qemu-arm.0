Received: by 10.25.44.15 with SMTP id s15csp220124lfs;
        Fri, 7 Jul 2017 08:12:09 -0700 (PDT)
X-Received: by 10.55.25.13 with SMTP id k13mr66494003qkh.208.1499440329059;
        Fri, 07 Jul 2017 08:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499440329; cv=none;
        d=google.com; s=arc-20160816;
        b=sm03klY5Hj8hpw9zkFkg1bZqjXcbmvAwTESsC/nDaQfhlCtXV6tJw5+Fn9keBH6abd
         WolOOz4HHYnV855L/emCwch65q2aAeyPlj1CELWWQSMsDpMmKtL3L34A0H7YqBRM0X6g
         8uya3xlxBAbRAk6Ny0Svs+NSmBsS6K0F+ptqB5JyKesdauT+3YZH/gjkDDZ2nU45Il5f
         68RbEegArycjAAd7n0/iHLtdFjkZQFdA4WQ9Y0sVWD15wZGo8YreGPjWogAhmYXsyCIv
         m3o5e2OiclHx8RUz1E5K+i8D6N8cAHW96Uad+MK8yK8EiEor5t6N83PtgRhXFSJZcDyp
         C5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=EvPmTTpgZbWT3XNB6ARiDNwZSMpTiEj5PSbgWle9r1w=;
        b=lN8NSZfeKRjCY9jgaMs+k3TCROyzZfNxHcibn+tIYuz6amTN5cboC0ztS5Gf1Wl7i4
         bJiAiDDjCZv+I5TfyNVzUnydMiQz+SHhkV/eipxteB31QG+HUH3MR3RjOjqt0UmDB1ba
         MpPmDJ/ymLKJTCFuxx8J2Hq9j/QihyvDTMqw4Au4JyQPCe5q38rXDcIegzdGkSuQo/6G
         ssidb+jxwUEqsCmrlV8awV4YsToz3B+2CVzVUbyK4Nyo7oi4D52gYSpRcSTRndkspwCO
         E6V+dlwFHIPRewqTKahlosz16jGnAiw4NCRV2BIP0jyBkq+TVdfwAwem9uxOI7lbC8Kc
         vzrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s188si3515111qkd.53.2017.07.07.08.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 08:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTUvO-0006W7-9G
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 11:12:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dTUvF-0006UI-L4
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 11:11:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dTUvB-0000T5-KP
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 11:11:57 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:55872
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dTUvB-0000S3-EM; Fri, 07 Jul 2017 11:11:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751C515AD;
	Fri,  7 Jul 2017 08:11:50 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BD5B3F3E1;
	Fri,  7 Jul 2017 08:11:47 -0700 (PDT)
To: "Tian, Kevin" <kevin.tian@intel.com>,
	"Kalra, Ashish" <Ashish.Kalra@cavium.com>, Auger Eric
	<eric.auger@redhat.com>, Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
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
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <67cb3a84-9aa7-2b4f-43b6-be6dea15b66f@arm.com>
Date: Fri, 7 Jul 2017 16:14:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D190D28807@SHSMSX101.ccr.corp.intel.com>
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
X-TUID: jkHZeEbzfq+h

Hi Ashish,

On 07/07/17 00:33, Tian, Kevin wrote:
>> From: Kalra, Ashish [mailto:Ashish.Kalra@cavium.com]
>> Sent: Friday, July 7, 2017 7:24 AM
>>
>> I have a generic question on vIOMMU support, is there any proposal/plan to
>> add ATS/PRI extension support to vIOMMUs and allow
>> handling for end to end (v)IOMMU Page faults (w/t the device side
>> implementation on Vhost) ?
>>
>> Again, the motivation will be to do DMA on paged guest memory and
>> potentially avoiding the requirement of pinned/locked
>> guest physical memory for DMA.
> 
> yes, that's a necessary part to support SVM in both virtio-iommu 
> approach and fully emulated approach (e.g. for Intel VTd). There
> are already patches and discussions in other thread about how to
> propagate IOMMU page fault to vIOMMU. Then after it is done
> vIOMMU page fault emulation will be further added.
> 
> https://lkml.org/lkml/2017/6/27/964

For virtio-iommu, I'd like to add an event virtqueue for the device to
send page faults to the driver, in a format similar to a PRI Page Request.
The driver would then send a reply via the request virtqueue in a format
similar to a PRG Response.

In Qemu the device implementation would hopefully be based on the same
mechanism as VTd. The vhost implementation would receive IO Page Faults
from VFIO and forward them on the event virtqueue similarly to the
userspace implementation.

Thanks,
Jean
