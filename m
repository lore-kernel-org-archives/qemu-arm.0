Received: by 10.223.197.9 with SMTP id q9csp1536522wrf;
        Thu, 12 Oct 2017 03:41:46 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDOcKlA/W+qJc1UY7uqXY3Du2dhEik7VOlRt9Gx4lWfPovwxjXFqqJmV3bh5dha53+lLMrK
X-Received: by 10.200.50.193 with SMTP id a1mr2877612qtb.85.1507804906103;
        Thu, 12 Oct 2017 03:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507804906; cv=none;
        d=google.com; s=arc-20160816;
        b=aiw5+1a7hoKll/HbRr7hHCQo4Hln78DTU0YpbdQALscQR9OFnrjwKLWKlV2dtwlt71
         krmUMQVYFMVfNMSAINVoSoigbjYsXt66AhvBiJo0pmPUVQfFdGBgUU02TonZzAtrbfYr
         KXHI1jalmLLd34FgA+KVXJzeLn2CUcPur2x/HISC++uY2qyifCzPQiK3Iez6SvICEeic
         RBZ380nJdGiddyNxhwWROWukF/hiRxuGqn7qJVT6bMh4UDPCElQ+VPQEpVlvxmJtL6Iu
         kqXGR0iknd4fZSrEETHYKxN9O4LYB6BiBq6COaCAb3a3f/eEzoLcVx/XY2lbGhDQcXE5
         ymeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=5NC97nRHsdhGcsH+f6UAuPxHqGJDG/zM+8LYkXItL2g=;
        b=meLkh7845Xt/P3QPrt7UqSu3g7wRGGWESUeK5A9YvXJyOTgEWgnqThdTPh1m2lW5zE
         LikfOwY+NP72MzFjv4ESGIL90HaQFkuIL6HL9L4o1n/q6067TfRmR4IETX5rfnFfJHBO
         c1VIaxNFdwC8wLVwbqL7rbuUKxvyIUECt1Ny+MPb0mtJ8K7Nwi5bYDt/8Dw/NCZ9KbrZ
         opExTuxcruD89p0FF3sDTqfeeU6iQG7NJeY/GkOcReXDJDTHJd/6MGgUHEgN6XsJjz+d
         7x/jSNh5Farhm7o+lzTkiKvvdlWHrvriOdptnyHRjJH6E52fr0dlMedwU40+ihdrbDOJ
         nI3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3si1421628qkf.364.2017.10.12.03.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 03:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2avv-00005J-MA
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 06:41:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1e2avn-0008Un-J1
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 06:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1e2avk-0003BV-D8
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 06:41:35 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:50926
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1e2avk-0003AM-3l; Thu, 12 Oct 2017 06:41:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF9EB1435;
	Thu, 12 Oct 2017 03:41:29 -0700 (PDT)
Received: from [10.1.211.72] (e106794-lin.cambridge.arm.com [10.1.211.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA5C33F599;
	Thu, 12 Oct 2017 03:41:26 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
	<f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
	<CAFEAcA_2RaRsvm_=V4iDNk_vMOtiWUZs3-SdMh+DSYqGyPE0PQ@mail.gmail.com>
	<08ce288c-610c-4dea-927d-262e7b75051f@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <1f4895e8-cc64-feb7-65e4-d17128c570d1@arm.com>
Date: Thu, 12 Oct 2017 11:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <08ce288c-610c-4dea-927d-262e7b75051f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marc Zyngier <Marc.Zyngier@arm.com>, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <Will.Deacon@arm.com>,
	Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYLVImw3au21

On 12/10/17 11:09, Auger Eric wrote:
> Hi Peter,
> 
> On 12/10/2017 11:54, Peter Maydell wrote:
>> On 11 October 2017 at 17:08, Auger Eric <eric.auger@redhat.com> wrote:
>>> Hi Peter,
>>>
>>> On 11/10/2017 16:56, Peter Maydell wrote:
>>>> On 19 September 2017 at 08:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>>> This series implements the virtio-iommu device.
>>>>>
>>>>> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
>>>>> - probe request support although no reserved region is returned at
>>>>>   the moment
>>>>> - unmap semantics less strict, as specified in v0.4
>>>>> - device registration, attach/detach revisited
>>>>> - split into smaller patches to ease review
>>>>> - propose a way to inform the IOMMU mr about the page_size_mask
>>>>>   of underlying HW IOMMU, if any
>>>>> - remove warning associated with the translation of the MSI doorbell
>>>>>
>>>>> The device gets instantiated using the "-device virtio-iommu-device"
>>>>> option. It currently works with ARM virt machine only, as the machine
>>>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>>>> the PCI host bridge node.
>>>>
>>>> Could this work on x86, or is it inherently arm-only?
>>>
>>> Yes this is the goal. At the moment the ACPI probing is not yet properly
>>> specified but a Q35 prototype was developed in the Red Hat Virt team.
>>> This will be presented at the KVM forum.
>>
>> Since I have very little familiarity with virtio or iommu code,
>> I'd be much happier if this was reviewed as a generic virtio-iommu
>> by the x86/virtio devs and then the arm specific parts done second...
> 
> Understood. I was rather expecting you to review the smmuv3 emulation
> code which you did, in a comprehensive manner ;-), and many thanks for that.
> 
> Note sure this is time yet to get this RFC reviewed as
> - the v0.4 virtio-iommu driver it relies on was not officially submitted,
> - the virtio-iommu specification review has not really been reviewed,
> - the ACPI probing method has not been discussed yet.
> 
> Jean-Philippe, please correct me if I am wrong.
> 
> So to me, this is pure RFC at the moment.

Yes, having it as an RFC for the moment allowed to break compatibility
between versions of the specification. The downside is that it probably
doesn't get as many eyeballs as it would without an RFC tag (although I
did receive tonnes of helpful comments). Maybe v0.5, that should be
published shortly, can be a candidate for mainline.

Thanks,
Jean

>> I'm also not clear on what we're expecting the recommended or normal
>> way to do device passthrough is going to be -- this virtio-mmio,
>> or presenting the guest with an SMMUv3 interface? Do we really
>> need to implement both ?
> 
> I think the KVM forum is the right place to sync as both approaches will
> be presented and some pros/cons + performance figures will be given.
> 
> As we talk about choosing, there is one alternative that was suggested
> on the ML by Alex & Michael but never really get considered yet and
> maybe should be: using intel iommu emulation code for ARM. I aknowledge
> this deserves a thorough impact study on kernel and FW side but I would
> be happy to get your opinion about the QEMU side. Would you have a by-
> principle rejection of this idea to instantiate such an Intel device in
> mach virt or would it be something you would be ready to consider?
> 
> Thanks
> 
> Eric
> 
> 
>>
>> thanks
>> -- PMM
>>

