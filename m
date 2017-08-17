Received: by 10.223.183.22 with SMTP id l22csp2315805wre;
        Thu, 17 Aug 2017 08:36:27 -0700 (PDT)
X-Received: by 10.55.70.84 with SMTP id t81mr7091481qka.189.1502984187778;
        Thu, 17 Aug 2017 08:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502984187; cv=none;
        d=google.com; s=arc-20160816;
        b=rB8uDOz4woQTbnkDoi7XwVt7qu+VEfSs25D8DmqNoeSUhOWiveFp1Id3k5GooYS7DR
         bcQxcBYAxsRxYROUZmztmblM455QOVibNO9G8qMRr+7/50Rn1xRlqq8hyW6yCbUupZOC
         0L2xBHY0j7Zpp6e9p4EB2P1yZ5FTqa8i/l1hNBI0yNbpDSmsPf59SONl8XaDSLCsbBNY
         rLvfRfMHUJPm2t913j9cRes1jYtyEjaOwIQIWs46qYeq9lcRyJwTEKy8N7Tu8ZPr5Wak
         9DQnO/cFZTFB5SDRnZBxbq8+dgCn5kRQX/c7z6ProFB4U6RIRTc92NqkikrwIx+I5nOj
         m9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=qlb2RdeFuqg2GfKYdNMvcXkuLG+j9zfenoLr7dTVliU=;
        b=W4ds85pBZk+xD39Yupa/gg35MYHlFXy+6TXO9lo5A7YG6K8zj8iAzL0ob0p5uqNEaO
         VUAJBxtAYevu9rz/h7fuDxrk3dmiD6zbJsNLNWWUk9F3r2uoPovvFUiccqnrOFFA72H+
         iFZOwhgdreFfoyOyXzmqd/oLrBgPOxheGT3QqPa0bBeZht8iTE0BfF6nystxOEeYrayf
         6nYOhX+5/jQdOoJnR51J1FINOwNgL+9VMxBaR0iG+Mu9giexgjZ4v+V2pgJO7iZmJPj9
         lH4pG7VlB9PBMHTOlDLNpgg0WXX5liytPbz2j/qr+HeNQ25Hkk+5Hw4mzTESaMcdM1LH
         OV9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 140si3144970qki.153.2017.08.17.08.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 08:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diMqP-0007CX-5u
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 11:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1diMqF-0007AT-0M
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 11:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1diMqD-000342-4t
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 11:36:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1diMqC-00031V-Uv; Thu, 17 Aug 2017 11:36:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F72370000;
	Thu, 17 Aug 2017 15:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1F72370000
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BCC5D9CC;
	Thu, 17 Aug 2017 15:26:56 +0000 (UTC)
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
	<20170817112627.GA5417@virtx40>
	<da30de94-118d-b81e-f163-b60f71894415@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <20c68b9d-380d-1fbc-0fae-a5af44c2cdb2@redhat.com>
Date: Thu, 17 Aug 2017 17:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <da30de94-118d-b81e-f163-b60f71894415@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 17 Aug 2017 15:27:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel]  [RFC v3 0/8] VIRTIO-IOMMU device
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	linu.cherian@cavium.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ddR7fakCDRVK

Hi Linu, Jean,

On 17/08/2017 15:39, Jean-Philippe Brucker wrote:
> Hi Linu,
> 
> On 17/08/17 12:26, Linu Cherian wrote:
>> Hi Eric,
>>
>> On Tue Aug 01, 2017 at 11:33:06AM +0200, Eric Auger wrote:
>>> This series implements the virtio-iommu device.
>>>
>>> This v3 mostly is a rebase on top of v2.10-rc0 that uses
>>> IOMMUMmeoryRegion plus some small fixes.
>>>
>>> This is a proof of concept based on the virtio-iommu specification
>>> written by Jean-Philippe Brucker [1].
>>>
>>> The device gets instantiated using the "-device virtio-iommu-device"
>>> option. It currently works with ARM virt machine only, as the machine
>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>> the PCI host bridge node.
>>>
>>> ACPI booting is not yet supported.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/v2.10.0-rc0-virtio-iommu-rfcv3
>>>
>>> References:
>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
>>> [2] [RFC PATCH linux] iommu: Add virtio-iommu driver
>>> [3] [RFC PATCH kvmtool 00/15] Add virtio-iommu
>>>
>>> Testing:
>>> - >= 4.12 guest kernel + virtio-iommu driver [2]
>>> - guest using a virtio-net-pci device:
>>>   ,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on
>>
>> Was trying to test this out and facing issues.
>> Guest and Host Kernel - git://linux-arm.org/linux-jpb.git, Branch virtio-iommu/v0.4
>> Qemu - As mentioned above.
> 
> Could you try branch virtio-iommu/v0.1? It contains the UAPI headers
> compatible with this RFC.
Thank you Jean. Yes the QEMU virtio-iommu device is based on the first
user API written in [2]. I plan to rebase on v0.4 in short delay. Jean
can I rebase on virtio-iommu/v0.4 or shall I wait a bit more?

Thanks

Eric
> 
> Thanks,
> Jean
> 
