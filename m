Received: by 10.223.183.22 with SMTP id l22csp2315040wre;
        Thu, 17 Aug 2017 08:35:52 -0700 (PDT)
X-Received: by 10.237.35.237 with SMTP id k42mr8385570qtc.226.1502984152181;
        Thu, 17 Aug 2017 08:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502984152; cv=none;
        d=google.com; s=arc-20160816;
        b=pn+6st3wyBN3keuk9XgJ8S9cT/S+Qj1onuuNjzxc48C9kiJYuQY9RgotQN5+dw6273
         tyPCDHChrymvDGpt1BGVa5xHRr7ryIXyBb9eI4qD+UIjCL/S3/ffGWJDHtBakdnq93p/
         XJyG23vmehfr8fmXS8QWzQ1hQ3zn6fJXlfnaxr8NWm5grbfToJitcw7leJKDgLg5XDtL
         DmdlYKqYHAtLxXrj7COvuU+4Hrkn4r5ysdPhrMV3IxZh0JR9AoEjNn+1uq0+qU5yTMCv
         3QNLp/U1NgH/s32Ir/aNWM6klzEgEKWomvpiED66xPBd8MnfPT1NH14kT+Rsk7n1OOjB
         8R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=5872XS/KYHHmMzk1e7gtUfSSkkphELyIi54PDlDzchM=;
        b=P9lLKhUq6NPFkVeOUEVB/nJHgFXPRSEIpHqi+MnoQQhv1jUFirz9SEveHaunMY/aZ5
         U7edsERr0MCZPdXGodOwskrETDeev7W6fTlxPc7vFcHjOghqJSUcAKoAPpEwHlpd3WOu
         mQ2glKA2zjb2Bv/hVyUPj1wLIi63CMELQaJerai/477ns5ZCJ0jWRiAD7EdyX4YVVU/J
         kLFDtxpAgIVaD7ti+LpdsZRIOnNydSYfG+QdyyMeJ4YeuoK9qy0gUGXLJfdmv9ofkOq9
         gYQoTTVvB7RxifNLNm6ro/VT6rXGiaw1iLr+EbW5gkwcp/7a5T4PO7SAjxU3yxoWCzl1
         nGyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h134si3162362qke.405.2017.08.17.08.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 08:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diMpp-0006RI-L5
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 11:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1diMnw-0005AB-Uv
	for qemu-devel@nongnu.org; Thu, 17 Aug 2017 11:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1diMnv-0001gH-Vd
	for qemu-devel@nongnu.org; Thu, 17 Aug 2017 11:33:52 -0400
Received: from foss.arm.com ([217.140.101.70]:59576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1diMnr-0001dG-95; Thu, 17 Aug 2017 11:33:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71FF480D;
	Thu, 17 Aug 2017 08:33:45 -0700 (PDT)
Received: from [10.1.211.72] (e106794-lin.cambridge.arm.com [10.1.211.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B88823F3E1;
	Thu, 17 Aug 2017 08:33:42 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>, Linu Cherian <linuc.decode@gmail.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
	<20170817112627.GA5417@virtx40>
	<da30de94-118d-b81e-f163-b60f71894415@arm.com>
	<20c68b9d-380d-1fbc-0fae-a5af44c2cdb2@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <b56c09fc-9704-6adc-151b-1b796813f679@arm.com>
Date: Thu, 17 Aug 2017 16:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20c68b9d-380d-1fbc-0fae-a5af44c2cdb2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [Qemu-arm] [RFC v3 0/8] VIRTIO-IOMMU device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	linu.cherian@cavium.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSkUSuI5+xH7

On 17/08/17 16:26, Auger Eric wrote:
> Hi Linu, Jean,
> 
> On 17/08/2017 15:39, Jean-Philippe Brucker wrote:
>> Hi Linu,
>>
>> On 17/08/17 12:26, Linu Cherian wrote:
>>> Hi Eric,
>>>
>>> On Tue Aug 01, 2017 at 11:33:06AM +0200, Eric Auger wrote:
>>>> This series implements the virtio-iommu device.
>>>>
>>>> This v3 mostly is a rebase on top of v2.10-rc0 that uses
>>>> IOMMUMmeoryRegion plus some small fixes.
>>>>
>>>> This is a proof of concept based on the virtio-iommu specification
>>>> written by Jean-Philippe Brucker [1].
>>>>
>>>> The device gets instantiated using the "-device virtio-iommu-device"
>>>> option. It currently works with ARM virt machine only, as the machine
>>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>>> the PCI host bridge node.
>>>>
>>>> ACPI booting is not yet supported.
>>>>
>>>> Best Regards
>>>>
>>>> Eric
>>>>
>>>> This series can be found at:
>>>> https://github.com/eauger/qemu/tree/v2.10.0-rc0-virtio-iommu-rfcv3
>>>>
>>>> References:
>>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
>>>> [2] [RFC PATCH linux] iommu: Add virtio-iommu driver
>>>> [3] [RFC PATCH kvmtool 00/15] Add virtio-iommu
>>>>
>>>> Testing:
>>>> - >= 4.12 guest kernel + virtio-iommu driver [2]
>>>> - guest using a virtio-net-pci device:
>>>>   ,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on
>>>
>>> Was trying to test this out and facing issues.
>>> Guest and Host Kernel - git://linux-arm.org/linux-jpb.git, Branch virtio-iommu/v0.4
>>> Qemu - As mentioned above.
>>
>> Could you try branch virtio-iommu/v0.1? It contains the UAPI headers
>> compatible with this RFC.
> Thank you Jean. Yes the QEMU virtio-iommu device is based on the first
> user API written in [2]. I plan to rebase on v0.4 in short delay. Jean
> can I rebase on virtio-iommu/v0.4 or shall I wait a bit more?

Please go ahead, I don't have any pending changes at the moment :)

Thanks,
Jean
