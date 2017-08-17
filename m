Received: by 10.223.183.22 with SMTP id l22csp2168338wre;
        Thu, 17 Aug 2017 06:37:22 -0700 (PDT)
X-Received: by 10.237.39.3 with SMTP id n3mr7864651qtd.149.1502977042876;
        Thu, 17 Aug 2017 06:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502977042; cv=none;
        d=google.com; s=arc-20160816;
        b=TDmzw5xW/pbN1N4iIxkq6Y76sF1ek6lHQIE+f0tTFVDtz0oAh30HvTdfCPU3B9HKCT
         34ItLPcvdcyppf+bW8XxHPLcjgm/RnByT/rOzGXhmWcLYjrDL4cUqWR75cSkJltMTsrP
         ZbWxsT/EWpEMOhEfEYV5/vxYLiaRpOLwLTFoYKTnBlMIsGsQAO20WdGFl8MdCIasQpfZ
         2BKRnhbtXliw/Z4Un317XYftHx5++V9Y2dqaQZs+20kBRUiaEJj9defHLxvGceq3G0qT
         B/AqUTk+45sxAuVk/AwkfS4Y4D1rPCbxm2goP2Bq83Q71531DehchU0+1nxzqbdeMki3
         AR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Yga7Sydx5sK61MxQZtq64fK6WpXHLcQiAVouZK01vh0=;
        b=e6aD38DAM9sp0xtOV1kngWQzwyJ200cXgqKFoStuiy8GkzgO2tEK64C6Y+YpkbA+Oi
         WsbgLdNsOeb8iN67ijzRkLvjkeGYBsOX3I1M06CzCLy206bOpoOijFnsT5+L/g2SPlqP
         Cdk7cQeZPQZoOpgUHqnKwZuCuFZkGT4Sm7Xuhh+JIRoTES1v9JaKSetAwR3VKBqn+C5k
         Gi+5gvVMK/rsC6tENOW6YVjMNeSdr1wEqMHIr1NB1wsoESpv5yhGEkvmP6UpaIMnDaa/
         +gZZ1D6Ipr+rUn7wAqgBPDcwJqhEEAAP5S8zVhee7DMV1jIOhxIZhIi38lMNv1CUiQ5p
         jRNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si3002524qki.329.2017.08.17.06.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 06:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diKzA-0001ji-3Z
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 09:37:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1diKz3-0001j5-KW
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 09:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1diKyz-0000ui-Eq
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 09:37:13 -0400
Received: from foss.arm.com ([217.140.101.70]:57852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1diKyz-0000t6-8c; Thu, 17 Aug 2017 09:37:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84AA680D;
	Thu, 17 Aug 2017 06:37:06 -0700 (PDT)
Received: from [10.1.211.72] (e106794-lin.cambridge.arm.com [10.1.211.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3FEE3F483;
	Thu, 17 Aug 2017 06:37:03 -0700 (PDT)
To: Linu Cherian <linuc.decode@gmail.com>, Eric Auger <eric.auger@redhat.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
	<20170817112627.GA5417@virtx40>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <da30de94-118d-b81e-f163-b60f71894415@arm.com>
Date: Thu, 17 Aug 2017 14:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817112627.GA5417@virtx40>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v3 0/8] VIRTIO-IOMMU device
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, drjones@redhat.com,
	mst@redhat.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	linu.cherian@cavium.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCPfqPvY9vLL

Hi Linu,

On 17/08/17 12:26, Linu Cherian wrote:
> Hi Eric,
> 
> On Tue Aug 01, 2017 at 11:33:06AM +0200, Eric Auger wrote:
>> This series implements the virtio-iommu device.
>>
>> This v3 mostly is a rebase on top of v2.10-rc0 that uses
>> IOMMUMmeoryRegion plus some small fixes.
>>
>> This is a proof of concept based on the virtio-iommu specification
>> written by Jean-Philippe Brucker [1].
>>
>> The device gets instantiated using the "-device virtio-iommu-device"
>> option. It currently works with ARM virt machine only, as the machine
>> must handle the dt binding between the virtio-mmio "iommu" node and
>> the PCI host bridge node.
>>
>> ACPI booting is not yet supported.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v2.10.0-rc0-virtio-iommu-rfcv3
>>
>> References:
>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
>> [2] [RFC PATCH linux] iommu: Add virtio-iommu driver
>> [3] [RFC PATCH kvmtool 00/15] Add virtio-iommu
>>
>> Testing:
>> - >= 4.12 guest kernel + virtio-iommu driver [2]
>> - guest using a virtio-net-pci device:
>>   ,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on
> 
> Was trying to test this out and facing issues.
> Guest and Host Kernel - git://linux-arm.org/linux-jpb.git, Branch virtio-iommu/v0.4
> Qemu - As mentioned above.

Could you try branch virtio-iommu/v0.1? It contains the UAPI headers
compatible with this RFC.

Thanks,
Jean
